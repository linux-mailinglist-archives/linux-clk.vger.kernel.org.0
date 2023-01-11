Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52308666392
	for <lists+linux-clk@lfdr.de>; Wed, 11 Jan 2023 20:20:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232556AbjAKTU1 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 11 Jan 2023 14:20:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231204AbjAKTUQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 14:20:16 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F0A5167D3
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 11:20:15 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id s22so17054094ljp.5
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 11:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZ2p731vN2U20cHBeIyCq9fuCWOHPzhzPfBzUh6W44Y=;
        b=J3/n36ILmm73OcQ+JI/bY/bThgBbIkNe5YjcIh3Z0Ih7IlKAuHqqXkluI8s98Apm/V
         aT6mjOGpEFas/y0v+HDrsFJpYyjf4+hpeEnemhlaYittyCM2SFLY75TQfF708nGxKzr4
         sJ25LF5QSm5fqMM2CwpdXMh2Vu4EbSw5+WM+6Rz6mdCBctN626mr5yvA45vqlV2tqjnb
         f/nHoby3QHqHtfMwUalBvxXAwxTnbqcuGqjPyxVOYHYy79f9+MF4DZShpUdCd02O4tAs
         m6obc0+yKmTgwbaxhnBDvsWwEVBc2UjCaJViksE70STb8cQI4dTFDs3H6DPx9spl+iZu
         ei7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PZ2p731vN2U20cHBeIyCq9fuCWOHPzhzPfBzUh6W44Y=;
        b=DSCtiKgLUELKX/c2YrooiptXjpdTCewSxdzYOqMkDQShntgd+TTPIIg6PU9WjUHkoT
         vx1A3KFdzjCMCPec5ykplth9r0ZMg/GMcof6J6nrBO7RDH1ow9Vg49W1WDlIBfyAn7qy
         UjyY5Ea6NuFZWSYOn16vIIvjULLXEUxFy7a4HZ79ZeiZVZ+cc1f2t2mmUrIi2OoTXD+w
         IHs3p6dDY+H5vLAETKX0Q+6DQVLE4yHut12JUReQNgWNVQqS9zKGZn4rJudT5hX34qk0
         jUc+AQJHk5k4/Cfieo5/hHzYB88B3PJYT7J9/lejPtyKrO/5qkPBqWDZLVIk5NFhQOsF
         pzQw==
X-Gm-Message-State: AFqh2koT+IAZkNUQehGORJd9WeEM2HF9UziRE+2+AVj5OP3+Clx1Rn7y
        v4S38Rrnc2pFm7tfeDTjPcPBnw==
X-Google-Smtp-Source: AMrXdXtHZBkBVjxg1gMy5TYG3fnzlHcDNK2XdBVxdFCvZEVpYO0NlMSeeR36fHc1G6lMVr5Y+tBmJA==
X-Received: by 2002:a2e:a808:0:b0:27f:f0c9:9369 with SMTP id l8-20020a2ea808000000b0027ff0c99369mr13007832ljq.35.1673464813540;
        Wed, 11 Jan 2023 11:20:13 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id bj36-20020a2eaaa4000000b0027ff2fabcb5sm1807787ljb.104.2023.01.11.11.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 11:20:13 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 09/13] clk: qcom: cpu-8996: fix PLL configuration sequence
Date:   Wed, 11 Jan 2023 22:20:00 +0300
Message-Id: <20230111192004.2509750-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
References: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Switch both power and performance clocks to the GPLL0/2 (sys_apcs_aux)
before PLL configuration. Switch them to the ACD afterwards.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index 571ed52b3026..47c58bb5f21a 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -432,13 +432,27 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
 {
 	int i, ret;
 
+	/* Select GPLL0 for 300MHz for the both clusters */
+	regmap_write(regmap, PERFCL_REG_OFFSET + MUX_OFFSET, 0xc);
+	regmap_write(regmap, PWRCL_REG_OFFSET + MUX_OFFSET, 0xc);
+
+	/* Ensure write goes through before PLLs are reconfigured */
+	udelay(5);
+
 	clk_alpha_pll_configure(&pwrcl_pll, regmap, &hfpll_config);
 	clk_alpha_pll_configure(&perfcl_pll, regmap, &hfpll_config);
 	clk_alpha_pll_configure(&pwrcl_alt_pll, regmap, &altpll_config);
 	clk_alpha_pll_configure(&perfcl_alt_pll, regmap, &altpll_config);
 
+	/* Wait for PLL(s) to lock */
+        udelay(50);
+
 	qcom_cpu_clk_msm8996_acd_init(regmap);
 
+	/* Switch clusters to use the ACD leg */
+	regmap_write(regmap, PWRCL_REG_OFFSET + MUX_OFFSET, 0x2);
+	regmap_write(regmap, PERFCL_REG_OFFSET + MUX_OFFSET, 0x2);
+
 	for (i = 0; i < ARRAY_SIZE(cpu_msm8996_hw_clks); i++) {
 		ret = devm_clk_hw_register(dev, cpu_msm8996_hw_clks[i]);
 		if (ret)
-- 
2.30.2

