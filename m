Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0315A20E5CE
	for <lists+linux-clk@lfdr.de>; Tue, 30 Jun 2020 00:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbgF2Vl6 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 29 Jun 2020 17:41:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727932AbgF2Sh6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 29 Jun 2020 14:37:58 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F792C031429
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2020 10:21:07 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id e13so15971910qkg.5
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2020 10:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=acMY/PDEeXIX2iUBf49C2Sg8svQXM/66G883KF7yr14=;
        b=0Vr/iUCTL0YCeERQJU5A4XFXP9WRqstSxzdmUQD6ykn1ca7JzGnnei2ewZDfArLcSu
         CYypdB2pqO57zT6zodFJ+ZD2IJlbzrIK+M+0o5ZTdkG8QVZhgL9zkp0H1qxCaw466lPK
         6Bvj8YaLOMYtN4/izEybXm6/6yU52gkFLcOx+I3rM5FhrNY74YEXLbbNt48iXwhoEPPu
         iXBbUAWO7sDhCLWBK888xnmlUL60CSL1wubqDtYE+gsqRKrAtDHB1OF8tXE7vDS8nrL4
         PTrSsSyc3GZc2W9tFD0ZGVWlquLpWeYBoT0Xyb1zNWMo124SuQuu2KPXpOSkUPdRlH8B
         rUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=acMY/PDEeXIX2iUBf49C2Sg8svQXM/66G883KF7yr14=;
        b=lmdwfjxrC0VtUC6AyPuTsu8d5o2GndZowHvnDVZQOn3mOrowv4DzYqOCDAVlW9p8TN
         UhBVr/rtapj0E6xttyutodLItzkyEmjuykem21P9s/k0DOTs/RdkcQt2Dg/AnDHJEWC2
         H0X9dyUIFwFcMxNIySdjsdfsETHeFbQF8cYAY7UZBfpaaSonUC6KJhWveX707xYjxL0E
         4w9pRYMNarYtzgr3Kdu05YFHPfNHz9qAFgV3s1nJ6xbea2ncp6AfM2v/x2X0eAR+KSvS
         MvViAeHyV8I0F6X1+iEvb+hcEnYR8sg9tO8Ua5LfzSICqilC0PLKqa1exfHFxM5KESL/
         FJKQ==
X-Gm-Message-State: AOAM530vQBVLYNMqGNqBaMYJRNtEdtjdaUfOPkwbK1ByL0blNHERMJ+Z
        SNj3Aov2VNea8BKACkfJ0Zlfb85cGbw=
X-Google-Smtp-Source: ABdhPJyEZvgI7BCAXGHakCfxARGoDPMIkgxM8m5Edq3X5e6ibIASdaGalKlTTXkySTsiXwmys77+LA==
X-Received: by 2002:a05:620a:483:: with SMTP id 3mr15187886qkr.299.1593451266376;
        Mon, 29 Jun 2020 10:21:06 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id q5sm408363qtf.12.2020.06.29.10.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 10:21:06 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 05/13] clk: qcom: gcc: remove unnecessary vco_table from SM8150
Date:   Mon, 29 Jun 2020 13:20:35 -0400
Message-Id: <20200629172049.30452-6-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200629172049.30452-1-jonathan@marek.ca>
References: <20200629172049.30452-1-jonathan@marek.ca>
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

