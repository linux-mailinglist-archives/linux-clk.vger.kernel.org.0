Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C60EC20E3F5
	for <lists+linux-clk@lfdr.de>; Tue, 30 Jun 2020 00:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730562AbgF2VTo (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 29 Jun 2020 17:19:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390823AbgF2VSm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 29 Jun 2020 17:18:42 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BC50C08C5DB
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2020 14:18:42 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id 80so16689773qko.7
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2020 14:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=acMY/PDEeXIX2iUBf49C2Sg8svQXM/66G883KF7yr14=;
        b=Fspc3HTnPU2vcRkiRJAJxQPq78eYYZV+us/6igL1nLqS3ngZ1TlmhE7a0HHo1k3EHY
         A3wQheAcxGYvvGEwHQqv2SnicWeEuPnsdrFnW9hZ0RpjBvtqwrVdFkSvnbxbu2hpKEit
         MayGVZfijC8nQPQnPJwK8LBWSsqKxaQILvNOoMmbwqV/5mVhqa281u38Td63X9Coe4vu
         FeEGjXts1z7cFevdrf6qm1PKRCMY4JCA1Ddw33je3QHK5yC6zhVDmsy759wK/bfzCZI6
         Ei2gl6s+K7fzzb/4wzXoKeIWEgW4kaPji8i/e0fSI73emPRyooiCmdIsik18dRm1bF2U
         pYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=acMY/PDEeXIX2iUBf49C2Sg8svQXM/66G883KF7yr14=;
        b=Ccm7NztLkje8Xt/my9LCBoRG8kzuVoAqo/2ejd/Tw0z+6a97mKfySIxG9EzPx353ES
         cqYur4UqSq7zA42UO27wcDSo9juRHI7nYNynWUf6LwU6d7Y+BqcSwV42R3FGxCk1Ad0x
         VdriY7kZPSexiCJhATctIL2sYp2g30WelyKN2tmg442Y1GjYnDLrPLHPm6xIuQPsSXU9
         PKu+Pb9nFb0ccYNkyGdiAGqAlQ/FSxfeYF9n2s/uDVdHHlJ3k2VRWqg02BwY/l+1iJ0f
         gTYKoZbRwAt7CtgPxZbOvIYRYbTQQsCrseLievhGOeShtrcAE3AXe5OS6W9+3YgCYErG
         lPqQ==
X-Gm-Message-State: AOAM532bWLkrIebXDKawLBFXRePHV0bV6eEJLis4tMJefMYb/QWFAA0v
        LGBoEoBp1L+28SFByr60TaHaFw==
X-Google-Smtp-Source: ABdhPJz+BGeCLxFQMQCd/PD/1w073yqw0PjakwVkOCQ6o9hCFIkPo5bsYLiQ2WYLWW2eCsYpQc9Jig==
X-Received: by 2002:a37:e307:: with SMTP id y7mr16063257qki.489.1593465521371;
        Mon, 29 Jun 2020 14:18:41 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id b196sm1169078qkg.11.2020.06.29.14.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 14:18:41 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        linux-kernel@vger.kernel.org (open list)
Subject: [RESEND PATCH v2 05/13] clk: qcom: gcc: remove unnecessary vco_table from SM8150
Date:   Mon, 29 Jun 2020 17:17:11 -0400
Message-Id: <20200629211725.2592-6-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200629211725.2592-1-jonathan@marek.ca>
References: <20200629211725.2592-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The fixed alpha pll ops only use it for clamping in round_rate, which is
unnecessary. This is consistent with SM8250 GCC not using vco_table.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/clk/qcom/gcc-sm8150.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
index d7778def37da..8e9b5b3cceaf 100644
--- a/drivers/clk/qcom/gcc-sm8150.c
+++ b/drivers/clk/qcom/gcc-sm8150.c
@@ -34,14 +34,8 @@ enum {
 	P_SLEEP_CLK,
 };
 
-static const struct pll_vco trion_vco[] = {
-	{ 249600000, 2000000000, 0 },
-};
-
 static struct clk_alpha_pll gpll0 = {
 	.offset = 0x0,
-	.vco_table = trion_vco,
-	.num_vco = ARRAY_SIZE(trion_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TRION],
 	.clkr = {
 		.enable_reg = 0x52000,
@@ -85,8 +79,6 @@ static struct clk_alpha_pll_postdiv gpll0_out_even = {
 
 static struct clk_alpha_pll gpll7 = {
 	.offset = 0x1a000,
-	.vco_table = trion_vco,
-	.num_vco = ARRAY_SIZE(trion_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TRION],
 	.clkr = {
 		.enable_reg = 0x52000,
@@ -105,8 +97,6 @@ static struct clk_alpha_pll gpll7 = {
 
 static struct clk_alpha_pll gpll9 = {
 	.offset = 0x1c000,
-	.vco_table = trion_vco,
-	.num_vco = ARRAY_SIZE(trion_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TRION],
 	.clkr = {
 		.enable_reg = 0x52000,
-- 
2.26.1

