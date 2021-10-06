Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 893D1423720
	for <lists+linux-clk@lfdr.de>; Wed,  6 Oct 2021 06:36:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbhJFEi3 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 6 Oct 2021 00:38:29 -0400
Received: from ssh248.corpemail.net ([210.51.61.248]:28402 "EHLO
        ssh248.corpemail.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbhJFEi3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Oct 2021 00:38:29 -0400
Received: from ([60.208.111.195])
        by ssh248.corpemail.net ((LNX1044)) with ASMTP (SSL) id ZEQ00128;
        Wed, 06 Oct 2021 12:36:28 +0800
Received: from localhost.localdomain (10.200.104.119) by
 jtjnmail201608.home.langchao.com (10.100.2.8) with Microsoft SMTP Server id
 15.1.2308.14; Wed, 6 Oct 2021 12:36:29 +0800
From:   Kai Song <songkai01@inspur.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Kai Song <songkai01@inspur.com>
Subject: [PATCH] clk: qcom: Remove redundant .owner
Date:   Wed, 6 Oct 2021 12:36:27 +0800
Message-ID: <20211006043627.5125-1-songkai01@inspur.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.200.104.119]
tUid:   202110061236284a0c5251307d7077af0228547f692211
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Remove .owner field if calls are used which set it automatically
Generated by: scripts/coccinelle/api/platform_no_drv_owner.cocci

Signed-off-by: Kai Song <songkai01@inspur.com>
---
 drivers/clk/qcom/gcc-msm8953.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8953.c b/drivers/clk/qcom/gcc-msm8953.c
index 49513f1366ff..8aafa6591e84 100644
--- a/drivers/clk/qcom/gcc-msm8953.c
+++ b/drivers/clk/qcom/gcc-msm8953.c
@@ -4230,7 +4230,6 @@ static struct platform_driver gcc_msm8953_driver = {
 	.driver = {
 		.name = "gcc-msm8953",
 		.of_match_table = gcc_msm8953_match_table,
-		.owner = THIS_MODULE,
 	},
 };
 
-- 
2.27.0

