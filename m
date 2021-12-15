Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0D53474F94
	for <lists+linux-clk@lfdr.de>; Wed, 15 Dec 2021 01:54:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238670AbhLOAys (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 14 Dec 2021 19:54:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235267AbhLOAyr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Dec 2021 19:54:47 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73326C06173E
        for <linux-clk@vger.kernel.org>; Tue, 14 Dec 2021 16:54:47 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id bn20so30901611ljb.8
        for <linux-clk@vger.kernel.org>; Tue, 14 Dec 2021 16:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YjtmLC1Vf5ZIFfw4f99ohhNZHTDpH6wpJkebrivmqJA=;
        b=OyH9U1gGbntZOkZXCtT7+E/3yTS+Qhuyxt+ccmKoawGIGLsl6DRVVaQIXux+0ALTs0
         wqIOOnGn4vNbVjbZJosGajKGcYgwBHS3B1GS5+KXuuzW68AQS1iLVsiGJyWW47iybmR4
         Y9/E9ZbRYTDoMThfAugVy04eTu10tasLV4IEJxcNpr0s1iFDkvcSe5Wf1q0q5RgTcyFV
         CdI6dtMuvhDjhvsVVvwXRslXt8SiFp5Ga20NKz3Sy22tyF6F/gJJDUeOUa7jW1egUZHm
         YVp4A7Trm21CNggBIAGOGZ2PcIZmz8Dt2Nk8Ozbl1yOuQlK0CW+JAjkeTfQQcq5CEHB0
         RUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YjtmLC1Vf5ZIFfw4f99ohhNZHTDpH6wpJkebrivmqJA=;
        b=ipoYUsYSgluhkRczkrha3eyo2/vvJQVxwLS8DQUNoA4P/u5VYzXy6vi/zc3nNFajDz
         Ho5tngKf1mzBJ8u6dc30w2QW6axxW/ASE5G6arBBc3e3gr2bWBXY7JgudkwXBW9i1uF1
         7AAQkA9m8jQIZgvot6sUUxOceQU5qpqgOM8S7L7uRjJK45DFhSO92uHEtUvh7W0oxE/k
         WjoFutNs4tOaUUCxVC+RfaRMddBIXDL5ND/bMvwzp/ZxcFRr4nPsJU2BxaVyAwWynb0m
         hKESh/XMK97cIVLY/3ZW9fW35ruNrv1Hz+47iknpdw1cRdMCbjpD7VA7HrnaGcjFL4Ms
         y0Cg==
X-Gm-Message-State: AOAM532u8dTsq7lrNW54Brl8HOnt4kwaqAbxGePZ68x4g+A0suk6TiDE
        qZwV2fybafTGFfaxJkOrqe9CGw==
X-Google-Smtp-Source: ABdhPJww3rA5+O62rNKiakFtKOUXQ0lIqvsxa0/up8nvRlkxdqL1UY+xjUAtOe9IyOcRvCrd0Pt0UA==
X-Received: by 2002:a2e:b6c5:: with SMTP id m5mr8080780ljo.220.1639529685691;
        Tue, 14 Dec 2021 16:54:45 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id b12sm53022lfb.146.2021.12.14.16.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 16:54:45 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 01/15] clk: qcom: gpucc-sdm660: fix two clocks with parent_names
Date:   Wed, 15 Dec 2021 03:54:09 +0300
Message-Id: <20211215005423.2114261-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211215005423.2114261-1-dmitry.baryshkov@linaro.org>
References: <20211215005423.2114261-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Two clocks are still using parent_names, use parent_hws instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gpucc-sdm660.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sdm660.c b/drivers/clk/qcom/gpucc-sdm660.c
index 41bba96a08b3..7c07b0979aea 100644
--- a/drivers/clk/qcom/gpucc-sdm660.c
+++ b/drivers/clk/qcom/gpucc-sdm660.c
@@ -204,8 +204,8 @@ static struct clk_branch gpucc_rbbmtimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpucc_rbbmtimer_clk",
-			.parent_names = (const char *[]){
-				"rbbmtimer_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&rbbmtimer_clk_src.clr.hw,
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
2.33.0

