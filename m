Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB8F172BF03
	for <lists+linux-clk@lfdr.de>; Mon, 12 Jun 2023 12:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234881AbjFLKa3 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 12 Jun 2023 06:30:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235903AbjFLKaD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 06:30:03 -0400
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EF51F7EA
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 03:10:59 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4f62d93f38aso4874332e87.0
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 03:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686564532; x=1689156532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GaJ7sG5h8k+Fu1E2PMwc4yy7RIipDtLmaVeVmhjmk3w=;
        b=DxhhBlHXRL3qSMQxBLp8H9hI251Sj+K44Z01UYAAE6VprpO2+t3nPfgUbF6MRIUB8L
         maI2ZpFMYlxRM9MT01mglxAfozAsWHdysNPK4Que0YeBiUvfAXyLsCVkAnR4qhzD6LO4
         X8C09WIxANYbHSxA7icFgVJOYYWCuJPNPtfb6DNqmD4I5JjxdK7TBMn8SQkjxQstAmE3
         sS4Evvy9X/Ek4xS8VXXH3Pko+qEAwjOhVabiz87PT2gxdfrjZaCvLTgIbk/vs5SvlNjx
         CnJawvMPtkYR6qFvjVMxoAjx4Fh0Wu87jSH8NNRr6C12ZaMRSfAeEdtdRJTyQX0P+n9u
         Vg1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686564532; x=1689156532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GaJ7sG5h8k+Fu1E2PMwc4yy7RIipDtLmaVeVmhjmk3w=;
        b=IDssx+fyoD1cfWJy4HnM1+cGY041C4UrF7b8fdiwPEcGUhtOA/lVaYFgCZh+vzHd15
         7ek5kYNZLi5ddIBPOj4i++RcjfMvQN07ZmaO2eAOt9xyqI+OpdnryTu7Z832NMeGdbQN
         Koe9iNSM+lXs7w2gei8NXEMJ7KVyvwwBR0tA0O748YjXZLcxtxgcMqT+A+4TTn9Clt5R
         vHje06MQQZn8TvoCmasnxLx3Mx79Layw4sKNZ/0Jan8DdM4TGxXmEmtk3maaqDMAzeal
         wagWyttni5KEBoPLw7UU8dRyztCjPSgfVDRI6yksMY3Vh65Wpinz+kpoomyKyDvXTimH
         6AVw==
X-Gm-Message-State: AC+VfDzCUCpMHUKkNkh3//i6ulRT4efWPaFIAgUHoSESzhkn+4R2v+qT
        ukqkD+SmkWaYlq/P3tPeu1Rycr5Fa2bhGiPYio0FYg==
X-Google-Smtp-Source: ACHHUZ7SxUSD5gaY20B51JFvPuvRzXnhilbvJME60FrGjETvlJgt+KitfcYJSoz4teI6rLxHO5tNVQ==
X-Received: by 2002:a05:600c:2246:b0:3f7:e70c:8ea4 with SMTP id a6-20020a05600c224600b003f7e70c8ea4mr5741719wmm.34.1686563865318;
        Mon, 12 Jun 2023 02:57:45 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id f25-20020a7bcd19000000b003f7ff520a14sm10829525wmj.22.2023.06.12.02.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 02:57:44 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 12 Jun 2023 11:57:28 +0200
Subject: [PATCH v2 11/19] dt-bindings: clk: meson8b-clkc: expose all clock
 ids
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230607-topic-amlogic-upstream-clkid-public-migration-v2-11-38172d17c27a@linaro.org>
References: <20230607-topic-amlogic-upstream-clkid-public-migration-v2-0-38172d17c27a@linaro.org>
In-Reply-To: <20230607-topic-amlogic-upstream-clkid-public-migration-v2-0-38172d17c27a@linaro.org>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9228;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=1bvqL8DvxuXELpR9t1MHvBBztcM5eXz/7sN2SinL8Vc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkhuwJhxtAxNtpF7ITSx5Ah+21VpxE7HKa8wpKxgZH
 HTSRkCqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIbsCQAKCRB33NvayMhJ0T8JEA
 ClADywHdYmGVsfUZLUjBv89v9F59CW9g2Z7cRh2/LZEtlQe8UaN1p/i8URJrxms/5jQnZ0oG1VfZNI
 Ekrmaf4/UoVODFNrrrqmCSdXGfQyeRXL2+OVkWjM8Qzs1eziE16a0vZLyoEtim+m2/2369Wa8If6Z1
 HRStPv4w9aCpcyTHHlHNTKXR48IRXFjqkcYp2aTOBg9n1HRMtMbIRcUILN9EvyFC6eKtegR4FvVrcT
 zawlBC89XUPr1yc61rabMM0WQ5TBBfDrVXDGdNLuBxRODRd+pZHrMx0HFB8yuNiQOby0227QT5gFH0
 g3sPQcVqyI16SsnByuseGcsgfZWYagSdEqvtKQTPctAyNu7DbzddJXgnrcJzmaR3TPNWsTy373zmhO
 uOm3rZ8b/FYc6uTLHgzTrTzdTWK73LlqonXQ6R4/x+BKpP/wnRN1ilK3vcutI0fgap/4/Yx0d1mstu
 kTLZNC8YzIS+usgWIklg/ZWZKlcX0FXQqXnaA6HX+pwVvoz2u/oaq2QQfoIFiyR9c6VsuuWEqdF4Uj
 Q8bNPEU4CoUNapJPAi8kulP52lX6Hi61lNeMsfun+EOGRUkGtE2tw7Dd/XQ0gZgW9lZJvQfYVqs1JW
 yWsLvtdwi6YYKrX1ETAfs7UBUcxedbQrstQa8zd59Po/ji6yjStbXuTU5hBg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Due to a policy change in clock ID bindings handling, expose
all the "private" clock IDs to the public clock dt-bindings
to move out of the previous maintenance scheme.

This refers to a discussion at [1] & [2] with Krzysztof about
the issue with the current maintenance.

It was decided to move every meson8b-clkc ID to the public clock
dt-bindings headers to be merged in a single tree so we
can safely add new clocks without having merge issues.

[1] https://lore.kernel.org/all/c088e01c-0714-82be-8347-6140daf56640@linaro.org/
[2] https://lore.kernel.org/all/2fabe721-7434-43e7-bae5-088a42ba128d@app.fastmail.com/

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/meson/meson8b.h              | 108 -------------------------------
 include/dt-bindings/clock/meson8b-clkc.h |  97 +++++++++++++++++++++++++++
 2 files changed, 97 insertions(+), 108 deletions(-)

diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
index f999655d4436..2a9c4fe29ca2 100644
--- a/drivers/clk/meson/meson8b.h
+++ b/drivers/clk/meson/meson8b.h
@@ -77,114 +77,6 @@
 #define HHI_MPLL_CNTL9			0x2A0 /* 0xa8 offset in data sheet */
 #define HHI_MPLL_CNTL10			0x2A4 /* 0xa9 offset in data sheet */
 
-/*
- * CLKID index values
- *
- * These indices are entirely contrived and do not map onto the hardware.
- * It has now been decided to expose everything by default in the DT header:
- * include/dt-bindings/clock/gxbb-clkc.h. Only the clocks ids we don't want
- * to expose, such as the internal muxes and dividers of composite clocks,
- * will remain defined here.
- */
-
-#define CLKID_MPLL0_DIV		96
-#define CLKID_MPLL1_DIV		97
-#define CLKID_MPLL2_DIV		98
-#define CLKID_CPU_IN_SEL	99
-#define CLKID_CPU_IN_DIV2	100
-#define CLKID_CPU_IN_DIV3	101
-#define CLKID_CPU_SCALE_DIV	102
-#define CLKID_CPU_SCALE_OUT_SEL	103
-#define CLKID_MPLL_PREDIV	104
-#define CLKID_FCLK_DIV2_DIV	105
-#define CLKID_FCLK_DIV3_DIV	106
-#define CLKID_FCLK_DIV4_DIV	107
-#define CLKID_FCLK_DIV5_DIV	108
-#define CLKID_FCLK_DIV7_DIV	109
-#define CLKID_NAND_SEL		110
-#define CLKID_NAND_DIV		111
-#define CLKID_PLL_FIXED_DCO	113
-#define CLKID_HDMI_PLL_DCO	114
-#define CLKID_PLL_SYS_DCO	115
-#define CLKID_CPU_CLK_DIV2	116
-#define CLKID_CPU_CLK_DIV3	117
-#define CLKID_CPU_CLK_DIV4	118
-#define CLKID_CPU_CLK_DIV5	119
-#define CLKID_CPU_CLK_DIV6	120
-#define CLKID_CPU_CLK_DIV7	121
-#define CLKID_CPU_CLK_DIV8	122
-#define CLKID_APB_SEL		123
-#define CLKID_PERIPH_SEL	125
-#define CLKID_AXI_SEL		127
-#define CLKID_L2_DRAM_SEL	129
-#define CLKID_HDMI_PLL_LVDS_OUT 131
-#define CLKID_VID_PLL_IN_SEL	133
-#define CLKID_VID_PLL_IN_EN	134
-#define CLKID_VID_PLL_PRE_DIV	135
-#define CLKID_VID_PLL_POST_DIV	136
-#define CLKID_VCLK_IN_EN	139
-#define CLKID_VCLK_DIV1		140
-#define CLKID_VCLK_DIV2_DIV	141
-#define CLKID_VCLK_DIV2		142
-#define CLKID_VCLK_DIV4_DIV	143
-#define CLKID_VCLK_DIV4		144
-#define CLKID_VCLK_DIV6_DIV	145
-#define CLKID_VCLK_DIV6		146
-#define CLKID_VCLK_DIV12_DIV	147
-#define CLKID_VCLK_DIV12	148
-#define CLKID_VCLK2_IN_EN	150
-#define CLKID_VCLK2_DIV1	151
-#define CLKID_VCLK2_DIV2_DIV	152
-#define CLKID_VCLK2_DIV2	153
-#define CLKID_VCLK2_DIV4_DIV	154
-#define CLKID_VCLK2_DIV4	155
-#define CLKID_VCLK2_DIV6_DIV	156
-#define CLKID_VCLK2_DIV6	157
-#define CLKID_VCLK2_DIV12_DIV	158
-#define CLKID_VCLK2_DIV12	159
-#define CLKID_CTS_ENCT_SEL	160
-#define CLKID_CTS_ENCP_SEL	162
-#define CLKID_CTS_ENCI_SEL	164
-#define CLKID_HDMI_TX_PIXEL_SEL	166
-#define CLKID_CTS_ENCL_SEL	168
-#define CLKID_CTS_VDAC0_SEL	170
-#define CLKID_HDMI_SYS_SEL	172
-#define CLKID_HDMI_SYS_DIV	173
-#define CLKID_MALI_0_SEL	175
-#define CLKID_MALI_0_DIV	176
-#define CLKID_MALI_0		177
-#define CLKID_MALI_1_SEL	178
-#define CLKID_MALI_1_DIV	179
-#define CLKID_MALI_1		180
-#define CLKID_GP_PLL_DCO	181
-#define CLKID_GP_PLL		182
-#define CLKID_VPU_0_SEL		183
-#define CLKID_VPU_0_DIV		184
-#define CLKID_VPU_0		185
-#define CLKID_VPU_1_SEL		186
-#define CLKID_VPU_1_DIV		187
-#define CLKID_VPU_1		189
-#define CLKID_VDEC_1_SEL	191
-#define CLKID_VDEC_1_1_DIV	192
-#define CLKID_VDEC_1_1		193
-#define CLKID_VDEC_1_2_DIV	194
-#define CLKID_VDEC_1_2		195
-#define CLKID_VDEC_HCODEC_SEL	197
-#define CLKID_VDEC_HCODEC_DIV	198
-#define CLKID_VDEC_2_SEL	200
-#define CLKID_VDEC_2_DIV	201
-#define CLKID_VDEC_HEVC_SEL	203
-#define CLKID_VDEC_HEVC_DIV	204
-#define CLKID_VDEC_HEVC_EN	205
-#define CLKID_CTS_AMCLK_SEL	207
-#define CLKID_CTS_AMCLK_DIV	208
-#define CLKID_CTS_MCLK_I958_SEL	210
-#define CLKID_CTS_MCLK_I958_DIV	211
-#define CLKID_VCLK_EN		214
-#define CLKID_VCLK2_EN		215
-#define CLKID_VID_PLL_LVDS_EN	216
-#define CLKID_HDMI_PLL_DCO_IN   217
-
 /*
  * include the CLKID and RESETID that have
  * been made part of the stable DT binding
diff --git a/include/dt-bindings/clock/meson8b-clkc.h b/include/dt-bindings/clock/meson8b-clkc.h
index 78aa07fd7cc0..385bf243c56c 100644
--- a/include/dt-bindings/clock/meson8b-clkc.h
+++ b/include/dt-bindings/clock/meson8b-clkc.h
@@ -100,29 +100,126 @@
 #define CLKID_MPLL0		93
 #define CLKID_MPLL1		94
 #define CLKID_MPLL2		95
+#define CLKID_MPLL0_DIV		96
+#define CLKID_MPLL1_DIV		97
+#define CLKID_MPLL2_DIV		98
+#define CLKID_CPU_IN_SEL	99
+#define CLKID_CPU_IN_DIV2	100
+#define CLKID_CPU_IN_DIV3	101
+#define CLKID_CPU_SCALE_DIV	102
+#define CLKID_CPU_SCALE_OUT_SEL	103
+#define CLKID_MPLL_PREDIV	104
+#define CLKID_FCLK_DIV2_DIV	105
+#define CLKID_FCLK_DIV3_DIV	106
+#define CLKID_FCLK_DIV4_DIV	107
+#define CLKID_FCLK_DIV5_DIV	108
+#define CLKID_FCLK_DIV7_DIV	109
+#define CLKID_NAND_SEL		110
+#define CLKID_NAND_DIV		111
 #define CLKID_NAND_CLK		112
+#define CLKID_PLL_FIXED_DCO	113
+#define CLKID_HDMI_PLL_DCO	114
+#define CLKID_PLL_SYS_DCO	115
+#define CLKID_CPU_CLK_DIV2	116
+#define CLKID_CPU_CLK_DIV3	117
+#define CLKID_CPU_CLK_DIV4	118
+#define CLKID_CPU_CLK_DIV5	119
+#define CLKID_CPU_CLK_DIV6	120
+#define CLKID_CPU_CLK_DIV7	121
+#define CLKID_CPU_CLK_DIV8	122
+#define CLKID_APB_SEL		123
 #define CLKID_APB		124
+#define CLKID_PERIPH_SEL	125
 #define CLKID_PERIPH		126
+#define CLKID_AXI_SEL		127
 #define CLKID_AXI		128
 #define CLKID_L2_DRAM		130
+#define CLKID_L2_DRAM_SEL	129
+#define CLKID_HDMI_PLL_LVDS_OUT 131
 #define CLKID_HDMI_PLL_HDMI_OUT	132
+#define CLKID_VID_PLL_IN_SEL	133
+#define CLKID_VID_PLL_IN_EN	134
+#define CLKID_VID_PLL_PRE_DIV	135
+#define CLKID_VID_PLL_POST_DIV	136
 #define CLKID_VID_PLL_FINAL_DIV	137
 #define CLKID_VCLK_IN_SEL	138
+#define CLKID_VCLK_IN_EN	139
+#define CLKID_VCLK_DIV1		140
+#define CLKID_VCLK_DIV2_DIV	141
+#define CLKID_VCLK_DIV2		142
+#define CLKID_VCLK_DIV4_DIV	143
+#define CLKID_VCLK_DIV4		144
+#define CLKID_VCLK_DIV6_DIV	145
+#define CLKID_VCLK_DIV6		146
+#define CLKID_VCLK_DIV12_DIV	147
+#define CLKID_VCLK_DIV12	148
 #define CLKID_VCLK2_IN_SEL	149
+#define CLKID_VCLK2_IN_EN	150
+#define CLKID_VCLK2_DIV1	151
+#define CLKID_VCLK2_DIV2_DIV	152
+#define CLKID_VCLK2_DIV2	153
+#define CLKID_VCLK2_DIV4_DIV	154
+#define CLKID_VCLK2_DIV4	155
+#define CLKID_VCLK2_DIV6_DIV	156
+#define CLKID_VCLK2_DIV6	157
+#define CLKID_VCLK2_DIV12_DIV	158
+#define CLKID_VCLK2_DIV12	159
+#define CLKID_CTS_ENCT_SEL	160
 #define CLKID_CTS_ENCT		161
+#define CLKID_CTS_ENCP_SEL	162
 #define CLKID_CTS_ENCP		163
+#define CLKID_CTS_ENCI_SEL	164
 #define CLKID_CTS_ENCI		165
+#define CLKID_HDMI_TX_PIXEL_SEL	166
 #define CLKID_HDMI_TX_PIXEL	167
+#define CLKID_CTS_ENCL_SEL	168
 #define CLKID_CTS_ENCL		169
+#define CLKID_CTS_VDAC0_SEL	170
 #define CLKID_CTS_VDAC0		171
+#define CLKID_HDMI_SYS_SEL	172
+#define CLKID_HDMI_SYS_DIV	173
 #define CLKID_HDMI_SYS		174
+#define CLKID_MALI_0_SEL	175
+#define CLKID_MALI_0_DIV	176
+#define CLKID_MALI_0		177
+#define CLKID_MALI_1_SEL	178
+#define CLKID_MALI_1_DIV	179
+#define CLKID_MALI_1		180
+#define CLKID_GP_PLL_DCO	181
+#define CLKID_GP_PLL		182
+#define CLKID_VPU_0_SEL		183
+#define CLKID_VPU_0_DIV		184
+#define CLKID_VPU_0		185
+#define CLKID_VPU_1_SEL		186
+#define CLKID_VPU_1_DIV		187
+#define CLKID_VPU_1		189
 #define CLKID_VPU		190
+#define CLKID_VDEC_1_SEL	191
+#define CLKID_VDEC_1_1_DIV	192
+#define CLKID_VDEC_1_1		193
+#define CLKID_VDEC_1_2_DIV	194
+#define CLKID_VDEC_1_2		195
 #define CLKID_VDEC_1		196
+#define CLKID_VDEC_HCODEC_SEL	197
+#define CLKID_VDEC_HCODEC_DIV	198
 #define CLKID_VDEC_HCODEC	199
+#define CLKID_VDEC_2_SEL	200
+#define CLKID_VDEC_2_DIV	201
 #define CLKID_VDEC_2		202
+#define CLKID_VDEC_HEVC_SEL	203
+#define CLKID_VDEC_HEVC_DIV	204
+#define CLKID_VDEC_HEVC_EN	205
 #define CLKID_VDEC_HEVC		206
+#define CLKID_CTS_AMCLK_SEL	207
+#define CLKID_CTS_AMCLK_DIV	208
 #define CLKID_CTS_AMCLK		209
+#define CLKID_CTS_MCLK_I958_SEL	210
+#define CLKID_CTS_MCLK_I958_DIV	211
 #define CLKID_CTS_MCLK_I958	212
 #define CLKID_CTS_I958		213
+#define CLKID_VCLK_EN		214
+#define CLKID_VCLK2_EN		215
+#define CLKID_VID_PLL_LVDS_EN	216
+#define CLKID_HDMI_PLL_DCO_IN   217
 
 #endif /* __MESON8B_CLKC_H */

-- 
2.34.1

