Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B768B480606
	for <lists+linux-clk@lfdr.de>; Tue, 28 Dec 2021 05:54:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231917AbhL1EyV (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 27 Dec 2021 23:54:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231518AbhL1EyU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Dec 2021 23:54:20 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 120B9C06173E
        for <linux-clk@vger.kernel.org>; Mon, 27 Dec 2021 20:54:20 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id h21so16887056ljh.3
        for <linux-clk@vger.kernel.org>; Mon, 27 Dec 2021 20:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NhhTB4bMtGMIPsjhSujSoDBT7+XKc5HHDwK6CwdMVeQ=;
        b=nnD7oIpNxKxNlJ0AIU0NB/6mILY179+iNjh1nG6TCVkd/N18PejpC6yAZKU55REOnT
         d5fRnYEBLgmN/165XN7trMNsTosgDJgqcaS/CUIyomm5LmAvr3dZO7v6fXot3Imk1Jb0
         azjvcHdx1+LFEUR7O3UFBI3WI+7lEvlSsXj6jHNSygeq65kEBuu6rCyuDFhsZN8hY+0k
         EYLYvM7dMZXytqZ5BdVy7Lyw+c+YfH91RlwmJAqw6BiaHBGh3iH7vUbx1gAyROKezJt7
         a6AHyQMTQN718AzxC31VM0zfGXdmp/M8IK11uBuD5CehITCL1FlycXtCfGkzcTGXwMz4
         DiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NhhTB4bMtGMIPsjhSujSoDBT7+XKc5HHDwK6CwdMVeQ=;
        b=2GODaehb4FeizvisPCIXKCo9FioBFhbbEuHGG+QvFjm7ibHqv6XjhUTOBmu4+FTzJN
         BNmqrs/OKu8fUbeyFV/qSNy/kRuo5ES1Sua4WP+AQTu2x4di1OwrwIIiZpSUK0xHUy1m
         tDHeElPL9D/gtZ9FuZ2uiTXhRmZaB+MW0VZLaUjfT/b9/15C4gabFPsFXCqgun3EPqJ2
         DdobjTfUBoZLADVQ/XyB7OEmMtBKSrjbJ7qHFvFfayvwyXJeJENXoVsWl8Tg9WmrZVYH
         t8yhhIsVq+/IbTY5JrrGQAuaCLu4xS+uyxWl7XWhuhmVmhindivk5t+1cb37X1/bonM+
         qHyg==
X-Gm-Message-State: AOAM530I/pQlig6AqL0gONtNivaasotunFMmmYNV7JV0tzDkAr+oVvyp
        xOqHbtEjDIOzqJUWK9DChY78pQ==
X-Google-Smtp-Source: ABdhPJweAvFgXWD1wzZXHwFd74+Q8gQ+ztADAsaAx2G40zsbDPM5BHy4II4ytlT1kUD7aFTuNs4gbg==
X-Received: by 2002:a05:651c:996:: with SMTP id b22mr16267874ljq.139.1640667258269;
        Mon, 27 Dec 2021 20:54:18 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id cf3sm1822685lfb.22.2021.12.27.20.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 20:54:17 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 01/16] clk: qcom: gpucc-sdm660: fix two clocks with parent_names
Date:   Tue, 28 Dec 2021 07:54:00 +0300
Message-Id: <20211228045415.20543-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211228045415.20543-1-dmitry.baryshkov@linaro.org>
References: <20211228045415.20543-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Two clocks are still using parent_names, use parent_hws instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/clk/qcom/gpucc-sdm660.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sdm660.c b/drivers/clk/qcom/gpucc-sdm660.c
index 41bba96a08b3..d170353eccf6 100644
--- a/drivers/clk/qcom/gpucc-sdm660.c
+++ b/drivers/clk/qcom/gpucc-sdm660.c
@@ -204,8 +204,8 @@ static struct clk_branch gpucc_rbbmtimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpucc_rbbmtimer_clk",
-			.parent_names = (const char *[]){
-				"rbbmtimer_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&rbbmtimer_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -222,8 +222,8 @@ static struct clk_branch gpucc_rbcpr_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpucc_rbcpr_clk",
-			.parent_names = (const char *[]){
-				"rbcpr_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&rbcpr_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.34.1

