Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 662F852F70F
	for <lists+linux-clk@lfdr.de>; Sat, 21 May 2022 02:53:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbiEUAxw (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 20 May 2022 20:53:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354075AbiEUAxw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 May 2022 20:53:52 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FCDC1AD5B0
        for <linux-clk@vger.kernel.org>; Fri, 20 May 2022 17:53:50 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id t25so16940635lfg.7
        for <linux-clk@vger.kernel.org>; Fri, 20 May 2022 17:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iTwcnMPK/uOFAtpzBBBqGJyJk/tYLfG82bGKVHNiQsk=;
        b=lZ2VOkbYP9lviPyfAK05MtfD0SAgOf3bYi747lLPI8cjFhnNfZOSpaKAACwRlIZP0B
         JHZ8QsLcg5t2geNWbQcD6MIbbqUdsHkWPOJ0PowEwYgTCds1QeBMdn9S2WiIjdPQ9RC8
         0paHvtgo8TivLgzb0h5XY4DVPzk7qqgvG7EPkykIuwuZeHFyB/CVbVfjHKwsF8eePxDp
         1CxFjr6nu3VOgukRvDjOckPkNl3uPwrtybDIiRVJEDd4c5wDG8WpN0LhZ6aoxDjWxdUE
         Xhcx8CdkSPm4LIQnBBLZOM3Ngd6ZHW98FLMOxiZAoK8vVErvq6azn2CYGIPa7rjgHQZo
         YTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iTwcnMPK/uOFAtpzBBBqGJyJk/tYLfG82bGKVHNiQsk=;
        b=Fx5zX25OS+x9kxzgIf6H0ra46JP+7gifmRYUrXSWkekyL7/aaaqMgifXqEuWRARi12
         p5og+OzqoAAFx9VUd4tit7DPdsd7G2HQgrDIF5IJA9n3qwgQxwQMNyQmLjek0yqn/v1Z
         ngoDEC/TZuTvehlp9Di1Oxnf7ZKaFAA3GDsY6oMA6ewy76BwNeayuC5yTLcepGsieI2o
         34LeyYB0Nt9CJB2rRmnWZvbmZM4pzi2Ur/gEmBaESPkqVEbdP5XTXnzxdAQ6JXidbJj+
         jYMpMJT3dCa29sBt4ifDMmF04+MKDgqPP/8pOPBeCUjW8MU7VReaZfxiz9bn/oax0jTr
         4m0w==
X-Gm-Message-State: AOAM5337qh4C0Uzbekez/QlApFAneN3qAcXGJm4JbLe/6VwONAaOzBYa
        VBU+TdP1x/HA2Rn2Xt+EwaIjz3Za91D+pQ==
X-Google-Smtp-Source: ABdhPJz/BG7MamF6hpFcbIBht3YurAK/b6f7pBbmP1btEEFcqxfkJ/QGdZEBk2Ff6hp2Zh76byL4ug==
X-Received: by 2002:ac2:58ca:0:b0:477:d64e:3fbf with SMTP id u10-20020ac258ca000000b00477d64e3fbfmr5228364lfo.60.1653094428750;
        Fri, 20 May 2022 17:53:48 -0700 (PDT)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id u14-20020a056512094e00b0047255d21187sm844559lft.182.2022.05.20.17.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 17:53:47 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     Johan Hovold <johan+linaro@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pci@vger.kernel.org
Subject: [PATCH v7 1/8] Revert "clk: qcom: gcc-sm8450: use new clk_regmap_mux_safe_ops for PCIe pipe clocks"
Date:   Sat, 21 May 2022 03:53:36 +0300
Message-Id: <20220521005343.1429642-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220521005343.1429642-1-dmitry.baryshkov@linaro.org>
References: <20220521005343.1429642-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Johan Hovold has pointed out that there are several deficiencies and a
race condition in the regmap_mux_safe ops that were merged. Revert the
commit that switches gcc-sm8450 driver to use regmap_mux_safe.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-sm8450.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index fb6decd3df49..593a195467ff 100644
--- a/drivers/clk/qcom/gcc-sm8450.c
+++ b/drivers/clk/qcom/gcc-sm8450.c
@@ -243,14 +243,13 @@ static struct clk_regmap_mux gcc_pcie_0_pipe_clk_src = {
 	.reg = 0x7b060,
 	.shift = 0,
 	.width = 2,
-	.safe_src_parent = P_BI_TCXO,
 	.parent_map = gcc_parent_map_4,
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_pipe_clk_src",
 			.parent_data = gcc_parent_data_4,
 			.num_parents = ARRAY_SIZE(gcc_parent_data_4),
-			.ops = &clk_regmap_mux_safe_ops,
+			.ops = &clk_regmap_mux_closest_ops,
 		},
 	},
 };
@@ -274,14 +273,13 @@ static struct clk_regmap_mux gcc_pcie_1_pipe_clk_src = {
 	.reg = 0x9d064,
 	.shift = 0,
 	.width = 2,
-	.safe_src_parent = P_BI_TCXO,
 	.parent_map = gcc_parent_map_6,
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_pipe_clk_src",
 			.parent_data = gcc_parent_data_6,
 			.num_parents = ARRAY_SIZE(gcc_parent_data_6),
-			.ops = &clk_regmap_mux_safe_ops,
+			.ops = &clk_regmap_mux_closest_ops,
 		},
 	},
 };
-- 
2.35.1

