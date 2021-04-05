Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39C943548D5
	for <lists+linux-clk@lfdr.de>; Tue,  6 Apr 2021 00:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242875AbhDEWsL (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 5 Apr 2021 18:48:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242878AbhDEWsI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Apr 2021 18:48:08 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A3FBC061797
        for <linux-clk@vger.kernel.org>; Mon,  5 Apr 2021 15:48:01 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id b4so19660187lfi.6
        for <linux-clk@vger.kernel.org>; Mon, 05 Apr 2021 15:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sqK2nvfCrxnoSEWlc93GM77ZwGXk+jciboxSXDoLoR4=;
        b=U57Ll3h1L6mezAbkwWmFgct4w1SN9EIe4HVioQ3GH8wdoDH5BdOVjullOhABjEDyiD
         nEWup72z5+oQ+AXNFA1PNb6NlwJmclF2DzlzZerWjgYYjxfDU2TERN8+ZXbz74IUSnwd
         L2ZUIHXd7lBY4srAFFBo4JF6wrze8vZuMvb7hbfHlNzt7lIeDIyn0ys+rpwGx1gXQezq
         0skdV2DwAJEWc332wf86B6QyNFenFN/oUiQoeG+t19Yu2WzU1nWxVBVKT1XrAEqPQbce
         LTc0c0DZaKLpb5KSI8fx8bpayqY11g/Xl7dOO+vGBDWb0ZWBlQ7Z+mv3pABoAj+2roJa
         SZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sqK2nvfCrxnoSEWlc93GM77ZwGXk+jciboxSXDoLoR4=;
        b=NZSXq1RSFLjAMyWZXKAnw0uTe2T2ERZuqLQoExurCeTb2RGEZUFkc8NWsgNQqZ42ln
         wEvnEVCO41CjXwU4iq4nt1hVbhCXnMIVbRj/ea0imSTsVgCEARE4NUOOoFepJZjWpkmD
         FDTLTHxdchnNj01XC4MsjUeG1Od8XkdDWzIRsdhwyK1b443uWXz6N7ibEPRUIt6N/vx1
         goRDusSlqaBF4NRgY8BIHgN7LuO9dgbpYmg+IMYceJXajuuusgkYbH4V0rbFxTsc17xY
         Id3TnPLr2aiVaslf8948CiFY2kmuYojztIZZztxP1DgagJSNjsOztBJOaPcVJt/9xSms
         gggQ==
X-Gm-Message-State: AOAM530NJeiOD9T9tHvlJcSOaFj6gz6nbj7Qh2Ng275rWddEpQLnSFZB
        HptoG5kC8WhV9lABvqJB+CGcfw==
X-Google-Smtp-Source: ABdhPJwVOVVaz4DLu/RtaJaeiqa1EGjJAfU2OPlixN1kJaP8iQCxogwEeW9ZF0Senc4TQ0OHOyoVzw==
X-Received: by 2002:a19:c20b:: with SMTP id l11mr3265153lfc.316.1617662879925;
        Mon, 05 Apr 2021 15:47:59 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:47:59 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 21/33] clk: qcom: gcc-sdx55: use parent_hws where possible
Date:   Tue,  6 Apr 2021 01:47:31 +0300
Message-Id: <20210405224743.590029-22-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Switch to using parent_hws instead of parent_data when parents are
defined in this driver and so accessible using clk_hw.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-sdx55.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sdx55.c b/drivers/clk/qcom/gcc-sdx55.c
index e3b9030b2bae..4fca19006a77 100644
--- a/drivers/clk/qcom/gcc-sdx55.c
+++ b/drivers/clk/qcom/gcc-sdx55.c
@@ -70,8 +70,8 @@ static struct clk_alpha_pll_postdiv gpll0_out_even = {
 	.width = 4,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll0_out_even",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &gpll0.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]){
+			&gpll0.clkr.hw,
 		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_lucid_ops,
@@ -106,8 +106,8 @@ static struct clk_alpha_pll_postdiv gpll4_out_even = {
 	.width = 4,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll4_out_even",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &gpll4.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]){
+			&gpll4.clkr.hw,
 		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_lucid_ops,
-- 
2.30.2

