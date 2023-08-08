Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1859C773B35
	for <lists+linux-clk@lfdr.de>; Tue,  8 Aug 2023 17:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbjHHPpv (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 8 Aug 2023 11:45:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjHHPoV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Aug 2023 11:44:21 -0400
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFAA835A7
        for <linux-clk@vger.kernel.org>; Tue,  8 Aug 2023 08:40:30 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-31781e15a0cso4568808f8f.3
        for <linux-clk@vger.kernel.org>; Tue, 08 Aug 2023 08:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691509154; x=1692113954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CB45NVRSn9gSPVDttebSyfdPepS0c3tfl3JEKTiBuv4=;
        b=XdRcs8y9UK/xJdyNtVUQCUrGx7AOuyvwozgA/ainX3CIVb6T86chu19zHLGAkn9uvs
         ZPOxyWWyU3BPUU6yH2qAFrqE9qbicFFTG9px7fxB8RMFwjp507OLPUExsoFb24WCnwMj
         8sDJm2Aj6ojdDWaFxgB3wFoGDUPKlhnOeSTtrIy+34fcIREP5GJU9VLRW7Mxg9pr+fw0
         8cVsFMrE2KF6b6akDRwt64qgG3X9Pl2e3pTP2YupLRRgMs+yy13Ole4DxpOofbW3shz2
         70c/qLRXzxJzm7/6/6hWw0pUnc9h+dLDvaUBSjsFe+scDY33Hi9UPvn24Abk8/yslGH6
         qBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691509154; x=1692113954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CB45NVRSn9gSPVDttebSyfdPepS0c3tfl3JEKTiBuv4=;
        b=Fl9ejH31aA2QBYqJjNlRfMUJcMXqWK9qYKx1KdYHDSnaH9EJoS1t4+y+5xgd8ZKhCQ
         Gv51wWNioTB3V4Dy0Qw3Tml7h5hh8ey67pYJGW8GdI/zyoZuTcGpBKaQ28zFdygMW17F
         d54RTHJXrIjUeOlySSC/oJjXdI8Itq3M0HQwoSf8+kKKdI0xePGEATCwNmKLNdg6Jpon
         WxtStVQ0H2JxtzIzJLUCjMafOvTDFvfbEkfXR2sWziNwB9ShVTY2KTcdbdlUuq2d7cu6
         pAzOh/abTg2yjfWf+zG7vq+UBvdql5X4xTGr9vMCV4Hm1XRbMrzQOWMUXJwlIcuK02lQ
         99sQ==
X-Gm-Message-State: AOJu0YydKw+uyUTGQCwtoNeRL06NrHArFyaXmxmYZqM04wM21BXuGChP
        9GOLsgZGt51Jhyvd7o8fD2Ep/ictav/To0Q4Fe8=
X-Google-Smtp-Source: AGHT+IFqqvDHBiYwZ/PkcHQBY6WNsuuLlIALW+sDq2/o8VdcYFZEba+eEEwZXp7lsTHe/v2o4TxYlg==
X-Received: by 2002:a05:6512:ad5:b0:4fb:8585:eefe with SMTP id n21-20020a0565120ad500b004fb8585eefemr9104319lfu.57.1691483270562;
        Tue, 08 Aug 2023 01:27:50 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id s18-20020adfeb12000000b0031779a6b451sm12861246wrn.83.2023.08.08.01.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 01:27:49 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 04/11] clk: samsung: exynos5260: do not define number of clocks in bindings
Date:   Tue,  8 Aug 2023 10:27:31 +0200
Message-Id: <20230808082738.122804-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808082738.122804-1-krzysztof.kozlowski@linaro.org>
References: <20230808082738.122804-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Number of clocks supported by Linux drivers might vary - sometimes we
add new clocks, not exposed previously.  Therefore this number of clocks
should not be in the bindings, because otherwise we should not change
it.

Define number of clocks per each clock controller inside the driver
directly.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/samsung/clk-exynos5260.c | 41 +++++++++++++++++++---------
 1 file changed, 28 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5260.c b/drivers/clk/samsung/clk-exynos5260.c
index e05d7323669a..16da6ef5ca0c 100644
--- a/drivers/clk/samsung/clk-exynos5260.c
+++ b/drivers/clk/samsung/clk-exynos5260.c
@@ -15,6 +15,21 @@
 
 #include <dt-bindings/clock/exynos5260-clk.h>
 
+/* NOTE: Must be equal to the last clock ID increased by one */
+#define CLKS_NR_TOP			(PHYCLK_USBDRD30_UDRD30_PHYCLOCK + 1)
+#define CLKS_NR_EGL			(EGL_DOUT_EGL1 + 1)
+#define CLKS_NR_KFC			(KFC_DOUT_KFC1 + 1)
+#define CLKS_NR_MIF			(MIF_SCLK_LPDDR3PHY_WRAP_U0 + 1)
+#define CLKS_NR_G3D			(G3D_CLK_G3D + 1)
+#define CLKS_NR_AUD			(AUD_SCLK_I2S + 1)
+#define CLKS_NR_MFC			(MFC_CLK_SMMU2_MFCM0 + 1)
+#define CLKS_NR_GSCL			(GSCL_SCLK_CSIS0_WRAP + 1)
+#define CLKS_NR_FSYS			(FSYS_PHYCLK_USBHOST20 + 1)
+#define CLKS_NR_PERI			(PERI_SCLK_PCM1 + 1)
+#define CLKS_NR_DISP			(DISP_MOUT_HDMI_PHY_PIXEL_USER + 1)
+#define CLKS_NR_G2D			(G2D_CLK_SMMU3_G2D + 1)
+#define CLKS_NR_ISP			(ISP_SCLK_UART_EXT + 1)
+
 /*
  * Applicable for all 2550 Type PLLS for Exynos5260, listed below
  * DISP_PLL, EGL_PLL, KFC_PLL, MEM_PLL, BUS_PLL, MEDIA_PLL, G3D_PLL.
@@ -135,7 +150,7 @@ static const struct samsung_cmu_info aud_cmu __initconst = {
 	.nr_div_clks	= ARRAY_SIZE(aud_div_clks),
 	.gate_clks	= aud_gate_clks,
 	.nr_gate_clks	= ARRAY_SIZE(aud_gate_clks),
-	.nr_clk_ids	= AUD_NR_CLK,
+	.nr_clk_ids	= CLKS_NR_AUD,
 	.clk_regs	= aud_clk_regs,
 	.nr_clk_regs	= ARRAY_SIZE(aud_clk_regs),
 };
@@ -325,7 +340,7 @@ static const struct samsung_cmu_info disp_cmu __initconst = {
 	.nr_div_clks	= ARRAY_SIZE(disp_div_clks),
 	.gate_clks	= disp_gate_clks,
 	.nr_gate_clks	= ARRAY_SIZE(disp_gate_clks),
-	.nr_clk_ids	= DISP_NR_CLK,
+	.nr_clk_ids	= CLKS_NR_DISP,
 	.clk_regs	= disp_clk_regs,
 	.nr_clk_regs	= ARRAY_SIZE(disp_clk_regs),
 };
@@ -389,7 +404,7 @@ static const struct samsung_cmu_info egl_cmu __initconst = {
 	.nr_mux_clks	= ARRAY_SIZE(egl_mux_clks),
 	.div_clks	= egl_div_clks,
 	.nr_div_clks	= ARRAY_SIZE(egl_div_clks),
-	.nr_clk_ids	= EGL_NR_CLK,
+	.nr_clk_ids	= CLKS_NR_EGL,
 	.clk_regs	= egl_clk_regs,
 	.nr_clk_regs	= ARRAY_SIZE(egl_clk_regs),
 };
@@ -489,7 +504,7 @@ static const struct samsung_cmu_info fsys_cmu __initconst = {
 	.nr_mux_clks	= ARRAY_SIZE(fsys_mux_clks),
 	.gate_clks	= fsys_gate_clks,
 	.nr_gate_clks	= ARRAY_SIZE(fsys_gate_clks),
-	.nr_clk_ids	= FSYS_NR_CLK,
+	.nr_clk_ids	= CLKS_NR_FSYS,
 	.clk_regs	= fsys_clk_regs,
 	.nr_clk_regs	= ARRAY_SIZE(fsys_clk_regs),
 };
@@ -580,7 +595,7 @@ static const struct samsung_cmu_info g2d_cmu __initconst = {
 	.nr_div_clks	= ARRAY_SIZE(g2d_div_clks),
 	.gate_clks	= g2d_gate_clks,
 	.nr_gate_clks	= ARRAY_SIZE(g2d_gate_clks),
-	.nr_clk_ids	= G2D_NR_CLK,
+	.nr_clk_ids	= CLKS_NR_G2D,
 	.clk_regs	= g2d_clk_regs,
 	.nr_clk_regs	= ARRAY_SIZE(g2d_clk_regs),
 };
@@ -643,7 +658,7 @@ static const struct samsung_cmu_info g3d_cmu __initconst = {
 	.nr_div_clks	= ARRAY_SIZE(g3d_div_clks),
 	.gate_clks	= g3d_gate_clks,
 	.nr_gate_clks	= ARRAY_SIZE(g3d_gate_clks),
-	.nr_clk_ids	= G3D_NR_CLK,
+	.nr_clk_ids	= CLKS_NR_G3D,
 	.clk_regs	= g3d_clk_regs,
 	.nr_clk_regs	= ARRAY_SIZE(g3d_clk_regs),
 };
@@ -776,7 +791,7 @@ static const struct samsung_cmu_info gscl_cmu __initconst = {
 	.nr_div_clks	= ARRAY_SIZE(gscl_div_clks),
 	.gate_clks	= gscl_gate_clks,
 	.nr_gate_clks	= ARRAY_SIZE(gscl_gate_clks),
-	.nr_clk_ids	= GSCL_NR_CLK,
+	.nr_clk_ids	= CLKS_NR_GSCL,
 	.clk_regs	= gscl_clk_regs,
 	.nr_clk_regs	= ARRAY_SIZE(gscl_clk_regs),
 };
@@ -895,7 +910,7 @@ static const struct samsung_cmu_info isp_cmu __initconst = {
 	.nr_div_clks	= ARRAY_SIZE(isp_div_clks),
 	.gate_clks	= isp_gate_clks,
 	.nr_gate_clks	= ARRAY_SIZE(isp_gate_clks),
-	.nr_clk_ids	= ISP_NR_CLK,
+	.nr_clk_ids	= CLKS_NR_ISP,
 	.clk_regs	= isp_clk_regs,
 	.nr_clk_regs	= ARRAY_SIZE(isp_clk_regs),
 };
@@ -959,7 +974,7 @@ static const struct samsung_cmu_info kfc_cmu __initconst = {
 	.nr_mux_clks	= ARRAY_SIZE(kfc_mux_clks),
 	.div_clks	= kfc_div_clks,
 	.nr_div_clks	= ARRAY_SIZE(kfc_div_clks),
-	.nr_clk_ids	= KFC_NR_CLK,
+	.nr_clk_ids	= CLKS_NR_KFC,
 	.clk_regs	= kfc_clk_regs,
 	.nr_clk_regs	= ARRAY_SIZE(kfc_clk_regs),
 };
@@ -1015,7 +1030,7 @@ static const struct samsung_cmu_info mfc_cmu __initconst = {
 	.nr_div_clks	= ARRAY_SIZE(mfc_div_clks),
 	.gate_clks	= mfc_gate_clks,
 	.nr_gate_clks	= ARRAY_SIZE(mfc_gate_clks),
-	.nr_clk_ids	= MFC_NR_CLK,
+	.nr_clk_ids	= CLKS_NR_MFC,
 	.clk_regs	= mfc_clk_regs,
 	.nr_clk_regs	= ARRAY_SIZE(mfc_clk_regs),
 };
@@ -1164,7 +1179,7 @@ static const struct samsung_cmu_info mif_cmu __initconst = {
 	.nr_div_clks	= ARRAY_SIZE(mif_div_clks),
 	.gate_clks	= mif_gate_clks,
 	.nr_gate_clks	= ARRAY_SIZE(mif_gate_clks),
-	.nr_clk_ids	= MIF_NR_CLK,
+	.nr_clk_ids	= CLKS_NR_MIF,
 	.clk_regs	= mif_clk_regs,
 	.nr_clk_regs	= ARRAY_SIZE(mif_clk_regs),
 };
@@ -1370,7 +1385,7 @@ static const struct samsung_cmu_info peri_cmu __initconst = {
 	.nr_div_clks	= ARRAY_SIZE(peri_div_clks),
 	.gate_clks	= peri_gate_clks,
 	.nr_gate_clks	= ARRAY_SIZE(peri_gate_clks),
-	.nr_clk_ids	= PERI_NR_CLK,
+	.nr_clk_ids	= CLKS_NR_PERI,
 	.clk_regs	= peri_clk_regs,
 	.nr_clk_regs	= ARRAY_SIZE(peri_clk_regs),
 };
@@ -1826,7 +1841,7 @@ static const struct samsung_cmu_info top_cmu __initconst = {
 	.nr_gate_clks	= ARRAY_SIZE(top_gate_clks),
 	.fixed_clks	= fixed_rate_clks,
 	.nr_fixed_clks	= ARRAY_SIZE(fixed_rate_clks),
-	.nr_clk_ids	= TOP_NR_CLK,
+	.nr_clk_ids	= CLKS_NR_TOP,
 	.clk_regs	= top_clk_regs,
 	.nr_clk_regs	= ARRAY_SIZE(top_clk_regs),
 };
-- 
2.34.1

