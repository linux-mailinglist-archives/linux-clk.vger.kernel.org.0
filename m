Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10B1E1FDF2E
	for <lists+linux-clk@lfdr.de>; Thu, 18 Jun 2020 03:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732485AbgFRBaR (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 17 Jun 2020 21:30:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:40078 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732474AbgFRBaL (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 17 Jun 2020 21:30:11 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B0E7E22251;
        Thu, 18 Jun 2020 01:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592443810;
        bh=BNNH8wXOLzEpdqTfYme0mxdsQXeu5vh/B7BXxU0daxA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=V8P5VEUZczWEN4tKUrVm99RMBZGwzr2qQSCIcHZICz0FztF0y8RoN4AcI24HPBakN
         HuIJPHFML6r3zJCzmLHr51WwleJxNVwG8PsXzzgWNc45IBcNr+0YJTvH3avELqOvqC
         DKtpUPZX6pB3ijjG+wPf9ATIBegCQZoAn5leO+yA=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 04/60] clk: qcom: msm8916: Fix the address location of pll->config_reg
Date:   Wed, 17 Jun 2020 21:29:08 -0400
Message-Id: <20200618013004.610532-4-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618013004.610532-1-sashal@kernel.org>
References: <20200618013004.610532-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

[ Upstream commit f47ab3c2f5338828a67e89d5f688d2cef9605245 ]

During the process of debugging a processor derived from the msm8916 which
we found the new processor was not starting one of its PLLs.

After tracing the addresses and writes that downstream was doing and
comparing to upstream it became obvious that we were writing to a different
register location than downstream when trying to configure the PLL.

This error is also present in upstream msm8916.

As an example clk-pll.c::clk_pll_recalc_rate wants to write to
pll->config_reg updating the bit-field POST_DIV_RATIO. That bit-field is
defined in PLL_USER_CTL not in PLL_CONFIG_CTL. Taking the BIMC PLL as an
example

lm80-p0436-13_c_qc_snapdragon_410_processor_hrd.pdf

0x01823010 GCC_BIMC_PLL_USER_CTL
0x01823014 GCC_BIMC_PLL_CONFIG_CTL

This pattern is repeated for gpll0, gpll1, gpll2 and bimc_pll.

This error is likely not apparent since the bootloader will already have
initialized these PLLs.

This patch corrects the location of config_reg from PLL_CONFIG_CTL to
PLL_USER_CTL for all relevant PLLs on msm8916.

Fixes commit 3966fab8b6ab ("clk: qcom: Add MSM8916 Global Clock Controller support")

Cc: Georgi Djakov <georgi.djakov@linaro.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Link: https://lkml.kernel.org/r/20200329124116.4185447-1-bryan.odonoghue@linaro.org
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/qcom/gcc-msm8916.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index 95a4dd290f35..d7dd0417ef5e 100644
--- a/drivers/clk/qcom/gcc-msm8916.c
+++ b/drivers/clk/qcom/gcc-msm8916.c
@@ -270,7 +270,7 @@ static struct clk_pll gpll0 = {
 	.l_reg = 0x21004,
 	.m_reg = 0x21008,
 	.n_reg = 0x2100c,
-	.config_reg = 0x21014,
+	.config_reg = 0x21010,
 	.mode_reg = 0x21000,
 	.status_reg = 0x2101c,
 	.status_bit = 17,
@@ -297,7 +297,7 @@ static struct clk_pll gpll1 = {
 	.l_reg = 0x20004,
 	.m_reg = 0x20008,
 	.n_reg = 0x2000c,
-	.config_reg = 0x20014,
+	.config_reg = 0x20010,
 	.mode_reg = 0x20000,
 	.status_reg = 0x2001c,
 	.status_bit = 17,
@@ -324,7 +324,7 @@ static struct clk_pll gpll2 = {
 	.l_reg = 0x4a004,
 	.m_reg = 0x4a008,
 	.n_reg = 0x4a00c,
-	.config_reg = 0x4a014,
+	.config_reg = 0x4a010,
 	.mode_reg = 0x4a000,
 	.status_reg = 0x4a01c,
 	.status_bit = 17,
@@ -351,7 +351,7 @@ static struct clk_pll bimc_pll = {
 	.l_reg = 0x23004,
 	.m_reg = 0x23008,
 	.n_reg = 0x2300c,
-	.config_reg = 0x23014,
+	.config_reg = 0x23010,
 	.mode_reg = 0x23000,
 	.status_reg = 0x2301c,
 	.status_bit = 17,
-- 
2.25.1

