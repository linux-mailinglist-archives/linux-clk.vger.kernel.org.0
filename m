Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AC5E5BD2E4
	for <lists+linux-clk@lfdr.de>; Mon, 19 Sep 2022 19:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230165AbiISRA1 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 19 Sep 2022 13:00:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230358AbiISRAL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Sep 2022 13:00:11 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E2153343A
        for <linux-clk@vger.kernel.org>; Mon, 19 Sep 2022 09:59:58 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id q21so104616edc.9
        for <linux-clk@vger.kernel.org>; Mon, 19 Sep 2022 09:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date;
        bh=ION6izdHywigVEdYyM+mFhzmU0aXOyUlxucDQ5PX8Pc=;
        b=Z2/g4WcEN2ELwY7ETNq4WHUE2b2aNn4SXtWXCCIeDfoYqSSqFPxQjLSdvZXbbVZj8F
         NH4jE9sabKHaMu+Ioe3ehB8fu6Zggn810zEjUqZjJ/N0gfQUaIiFSNdbeW+2y6tZvWpy
         huF08wuOMD/I2Tacd2Dd3Z1cvjELdKZS4TA/M6zIJJcLNUiGpX9mqNoiMN2N6wtXSa9E
         TbZyoWF0CMnXJHVHwIF2H9bYSUse5jIXR7ocDooUB3HJXCaS9aumI67rrkLeKc3LsVeg
         UkJu2984qy6b/GYcbx+8cuSoQquA/fz3bPbJBqRtVw9BpLvDBv6u4Wiy1l2PM5kpicbj
         WQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ION6izdHywigVEdYyM+mFhzmU0aXOyUlxucDQ5PX8Pc=;
        b=NqZ2UEpQ8j/cW7mxZU1fE5VgM/34CMuZid9O1PkpuVSpyeN5Uo1nLWuLUWec6hQ5q4
         sIFYjguTZmjyqKGztl+YXjZiaRRk0Re3NEZv6Uw2++GP7kFg552kiRzkiwFY1SqFvsmK
         uwwBjuI2yCnfJ+xrnyAj68VJzUQmm74sJP4yXd2XjvCtCxxfu0Evyk97Nur463Q0FwsK
         GuGlsCqeNgBXi/v4GQYhcosL6wVDMbBvPnfKHrxldORAojMVL61CKb8Vnct3K/TVgZ+E
         sVGfdHTFirI1gGHwfogxH+P24h2v/YbFLKD2N5+c7SoS5FSUmGR3izEdQ576ksiB4Z0Y
         odkg==
X-Gm-Message-State: ACrzQf0ML47rn70wBA6hiK6Oz5js+4FuLNFErn/ZaIuAlao/bTkBlrMz
        ndWZiJpsyL0iL1omwXD1FvfZjg==
X-Google-Smtp-Source: AMsMyM4YCLwWXN205BrufbnSb5q3wN0qYtmddYN6Na498B3RYkEVDUJL/iHLAHigeI/zKhJOkw3jyw==
X-Received: by 2002:a05:6402:402a:b0:449:2ae0:aa9a with SMTP id d42-20020a056402402a00b004492ae0aa9amr16781610eda.420.1663606797605;
        Mon, 19 Sep 2022 09:59:57 -0700 (PDT)
Received: from [127.0.0.1] (2a02-8440-6340-f287-3074-96af-9642-0003.rev.sfr.net. [2a02:8440:6340:f287:3074:96af:9642:3])
        by smtp.gmail.com with ESMTPSA id cf16-20020a0564020b9000b0044fc3c0930csm20424246edb.16.2022.09.19.09.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 09:59:57 -0700 (PDT)
From:   Guillaume Ranquet <granquet@baylibre.com>
Date:   Mon, 19 Sep 2022 18:56:05 +0200
Subject: [PATCH v1 07/17] drm/mediatek: extract common functions from the mtk hdmi
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v1-7-4844816c9808@baylibre.com>
References: <20220919-v1-0-4844816c9808@baylibre.com>
In-Reply-To: <20220919-v1-0-4844816c9808@baylibre.com>
To:     Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-mediatek@lists.infradead.org,
        dri-devel@lists.freedesktop.org,
        Pablo Sun <pablo.sun@mediatek.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org,
        Guillaume Ranquet <granquet@baylibre.com>,
        devicetree@vger.kernel.org
X-Mailer: b4 0.10.0-dev
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Create a common "framework" that can be used to add support for
different hdmi IPs within the mediatek range of products.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index d4d193f60271..008ec69da67b 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -22,7 +22,8 @@ obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
 
 mediatek-drm-hdmi-objs := mtk_cec.o \
 			  mtk_hdmi.o \
-			  mtk_hdmi_ddc.o
+			  mtk_hdmi_ddc.o \
+			  mtk_hdmi_common.o \
 
 obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mediatek-drm-hdmi.o
 
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 5cd05d4fe1a9..837d36ec4d64 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -32,187 +32,18 @@
 #include <drm/drm_probe_helper.h>
 
 #include "mtk_cec.h"
-#include "mtk_hdmi.h"
 #include "mtk_hdmi_regs.h"
+#include "mtk_hdmi_common.h"
 
 #define NCTS_BYTES	7
 
-enum mtk_hdmi_clk_id {
-	MTK_HDMI_CLK_HDMI_PIXEL,
-	MTK_HDMI_CLK_HDMI_PLL,
-	MTK_HDMI_CLK_AUD_BCLK,
-	MTK_HDMI_CLK_AUD_SPDIF,
-	MTK_HDMI_CLK_COUNT
+const char * const mtk_hdmi_clk_names_mt8183[MTK_MT8183_HDMI_CLK_COUNT] = {
+	[MTK_MT8183_HDMI_CLK_HDMI_PIXEL] = "pixel",
+	[MTK_MT8183_HDMI_CLK_HDMI_PLL] = "pll",
+	[MTK_MT8183_HDMI_CLK_AUD_BCLK] = "bclk",
+	[MTK_MT8183_HDMI_CLK_AUD_SPDIF] = "spdif",
 };
 
-enum hdmi_aud_input_type {
-	HDMI_AUD_INPUT_I2S = 0,
-	HDMI_AUD_INPUT_SPDIF,
-};
-
-enum hdmi_aud_i2s_fmt {
-	HDMI_I2S_MODE_RJT_24BIT = 0,
-	HDMI_I2S_MODE_RJT_16BIT,
-	HDMI_I2S_MODE_LJT_24BIT,
-	HDMI_I2S_MODE_LJT_16BIT,
-	HDMI_I2S_MODE_I2S_24BIT,
-	HDMI_I2S_MODE_I2S_16BIT
-};
-
-enum hdmi_aud_mclk {
-	HDMI_AUD_MCLK_128FS,
-	HDMI_AUD_MCLK_192FS,
-	HDMI_AUD_MCLK_256FS,
-	HDMI_AUD_MCLK_384FS,
-	HDMI_AUD_MCLK_512FS,
-	HDMI_AUD_MCLK_768FS,
-	HDMI_AUD_MCLK_1152FS,
-};
-
-enum hdmi_aud_channel_type {
-	HDMI_AUD_CHAN_TYPE_1_0 = 0,
-	HDMI_AUD_CHAN_TYPE_1_1,
-	HDMI_AUD_CHAN_TYPE_2_0,
-	HDMI_AUD_CHAN_TYPE_2_1,
-	HDMI_AUD_CHAN_TYPE_3_0,
-	HDMI_AUD_CHAN_TYPE_3_1,
-	HDMI_AUD_CHAN_TYPE_4_0,
-	HDMI_AUD_CHAN_TYPE_4_1,
-	HDMI_AUD_CHAN_TYPE_5_0,
-	HDMI_AUD_CHAN_TYPE_5_1,
-	HDMI_AUD_CHAN_TYPE_6_0,
-	HDMI_AUD_CHAN_TYPE_6_1,
-	HDMI_AUD_CHAN_TYPE_7_0,
-	HDMI_AUD_CHAN_TYPE_7_1,
-	HDMI_AUD_CHAN_TYPE_3_0_LRS,
-	HDMI_AUD_CHAN_TYPE_3_1_LRS,
-	HDMI_AUD_CHAN_TYPE_4_0_CLRS,
-	HDMI_AUD_CHAN_TYPE_4_1_CLRS,
-	HDMI_AUD_CHAN_TYPE_6_1_CS,
-	HDMI_AUD_CHAN_TYPE_6_1_CH,
-	HDMI_AUD_CHAN_TYPE_6_1_OH,
-	HDMI_AUD_CHAN_TYPE_6_1_CHR,
-	HDMI_AUD_CHAN_TYPE_7_1_LH_RH,
-	HDMI_AUD_CHAN_TYPE_7_1_LSR_RSR,
-	HDMI_AUD_CHAN_TYPE_7_1_LC_RC,
-	HDMI_AUD_CHAN_TYPE_7_1_LW_RW,
-	HDMI_AUD_CHAN_TYPE_7_1_LSD_RSD,
-	HDMI_AUD_CHAN_TYPE_7_1_LSS_RSS,
-	HDMI_AUD_CHAN_TYPE_7_1_LHS_RHS,
-	HDMI_AUD_CHAN_TYPE_7_1_CS_CH,
-	HDMI_AUD_CHAN_TYPE_7_1_CS_OH,
-	HDMI_AUD_CHAN_TYPE_7_1_CS_CHR,
-	HDMI_AUD_CHAN_TYPE_7_1_CH_OH,
-	HDMI_AUD_CHAN_TYPE_7_1_CH_CHR,
-	HDMI_AUD_CHAN_TYPE_7_1_OH_CHR,
-	HDMI_AUD_CHAN_TYPE_7_1_LSS_RSS_LSR_RSR,
-	HDMI_AUD_CHAN_TYPE_6_0_CS,
-	HDMI_AUD_CHAN_TYPE_6_0_CH,
-	HDMI_AUD_CHAN_TYPE_6_0_OH,
-	HDMI_AUD_CHAN_TYPE_6_0_CHR,
-	HDMI_AUD_CHAN_TYPE_7_0_LH_RH,
-	HDMI_AUD_CHAN_TYPE_7_0_LSR_RSR,
-	HDMI_AUD_CHAN_TYPE_7_0_LC_RC,
-	HDMI_AUD_CHAN_TYPE_7_0_LW_RW,
-	HDMI_AUD_CHAN_TYPE_7_0_LSD_RSD,
-	HDMI_AUD_CHAN_TYPE_7_0_LSS_RSS,
-	HDMI_AUD_CHAN_TYPE_7_0_LHS_RHS,
-	HDMI_AUD_CHAN_TYPE_7_0_CS_CH,
-	HDMI_AUD_CHAN_TYPE_7_0_CS_OH,
-	HDMI_AUD_CHAN_TYPE_7_0_CS_CHR,
-	HDMI_AUD_CHAN_TYPE_7_0_CH_OH,
-	HDMI_AUD_CHAN_TYPE_7_0_CH_CHR,
-	HDMI_AUD_CHAN_TYPE_7_0_OH_CHR,
-	HDMI_AUD_CHAN_TYPE_7_0_LSS_RSS_LSR_RSR,
-	HDMI_AUD_CHAN_TYPE_8_0_LH_RH_CS,
-	HDMI_AUD_CHAN_TYPE_UNKNOWN = 0xFF
-};
-
-enum hdmi_aud_channel_swap_type {
-	HDMI_AUD_SWAP_LR,
-	HDMI_AUD_SWAP_LFE_CC,
-	HDMI_AUD_SWAP_LSRS,
-	HDMI_AUD_SWAP_RLS_RRS,
-	HDMI_AUD_SWAP_LR_STATUS,
-};
-
-struct hdmi_audio_param {
-	enum hdmi_audio_coding_type aud_codec;
-	enum hdmi_audio_sample_size aud_sampe_size;
-	enum hdmi_aud_input_type aud_input_type;
-	enum hdmi_aud_i2s_fmt aud_i2s_fmt;
-	enum hdmi_aud_mclk aud_mclk;
-	enum hdmi_aud_channel_type aud_input_chan_type;
-	struct hdmi_codec_params codec_params;
-};
-
-struct mtk_hdmi_conf {
-	bool tz_disabled;
-	bool cea_modes_only;
-	unsigned long max_mode_clock;
-};
-
-struct mtk_hdmi {
-	struct drm_bridge bridge;
-	struct drm_bridge *next_bridge;
-	struct drm_connector *curr_conn;/* current connector (only valid when 'enabled') */
-	struct device *dev;
-	const struct mtk_hdmi_conf *conf;
-	struct phy *phy;
-	struct device *cec_dev;
-	struct i2c_adapter *ddc_adpt;
-	struct clk *clk[MTK_HDMI_CLK_COUNT];
-	struct drm_display_mode mode;
-	bool dvi_mode;
-	u32 min_clock;
-	u32 max_clock;
-	u32 max_hdisplay;
-	u32 max_vdisplay;
-	u32 ibias;
-	u32 ibias_up;
-	struct regmap *sys_regmap;
-	unsigned int sys_offset;
-	struct regmap *regs;
-	enum hdmi_colorspace csp;
-	struct hdmi_audio_param aud_param;
-	bool audio_enable;
-	bool powered;
-	bool enabled;
-	hdmi_codec_plugged_cb plugged_cb;
-	struct device *codec_dev;
-	struct mutex update_plugged_status_lock;
-};
-
-static inline struct mtk_hdmi *hdmi_ctx_from_bridge(struct drm_bridge *b)
-{
-	return container_of(b, struct mtk_hdmi, bridge);
-}
-
-static int mtk_hdmi_read(struct mtk_hdmi *hdmi, u32 offset, u32 *val)
-{
-	return regmap_read(hdmi->regs, offset, val);
-}
-
-static void mtk_hdmi_write(struct mtk_hdmi *hdmi, u32 offset, u32 val)
-{
-	regmap_write(hdmi->regs, offset, val);
-}
-
-static void mtk_hdmi_clear_bits(struct mtk_hdmi *hdmi, u32 offset, u32 bits)
-{
-	regmap_clear_bits(hdmi->regs, offset, bits);
-}
-
-static void mtk_hdmi_set_bits(struct mtk_hdmi *hdmi, u32 offset, u32 bits)
-{
-	regmap_set_bits(hdmi->regs, offset, bits);
-}
-
-static void mtk_hdmi_mask(struct mtk_hdmi *hdmi, u32 offset, u32 val, u32 mask)
-{
-	regmap_update_bits(hdmi->regs, offset, mask, val);
-}
-
 static void mtk_hdmi_hw_vid_black(struct mtk_hdmi *hdmi, bool black)
 {
 	mtk_hdmi_mask(hdmi, VIDEO_CFG_4, black ? GEN_RGB : NORMAL_PATH,
@@ -825,14 +656,14 @@ static int mtk_hdmi_video_change_vpll(struct mtk_hdmi *hdmi, u32 clock)
 	int ret;
 
 	/* The DPI driver already should have set TVDPLL to the correct rate */
-	ret = clk_set_rate(hdmi->clk[MTK_HDMI_CLK_HDMI_PLL], clock);
+	ret = clk_set_rate(hdmi->clk[MTK_MT8183_HDMI_CLK_HDMI_PLL], clock);
 	if (ret) {
 		dev_err(hdmi->dev, "Failed to set PLL to %u Hz: %d\n", clock,
 			ret);
 		return ret;
 	}
 
-	rate = clk_get_rate(hdmi->clk[MTK_HDMI_CLK_HDMI_PLL]);
+	rate = clk_get_rate(hdmi->clk[MTK_MT8183_HDMI_CLK_HDMI_PLL]);
 
 	if (DIV_ROUND_CLOSEST(rate, 1000) != DIV_ROUND_CLOSEST(clock, 1000))
 		dev_warn(hdmi->dev, "Want PLL %u Hz, got %lu Hz\n", clock,
@@ -857,7 +688,6 @@ static void mtk_hdmi_video_set_display_mode(struct mtk_hdmi *hdmi,
 	mtk_hdmi_hw_msic_setting(hdmi, mode);
 }
 
-
 static void mtk_hdmi_aud_set_input(struct mtk_hdmi *hdmi)
 {
 	enum hdmi_aud_channel_type chan_type;
@@ -948,56 +778,6 @@ static int mtk_hdmi_aud_output_config(struct mtk_hdmi *hdmi,
 	return 0;
 }
 
-static int mtk_hdmi_setup_avi_infoframe(struct mtk_hdmi *hdmi,
-					struct drm_display_mode *mode)
-{
-	struct hdmi_avi_infoframe frame;
-	u8 buffer[HDMI_INFOFRAME_HEADER_SIZE + HDMI_AVI_INFOFRAME_SIZE];
-	ssize_t err;
-
-	err = drm_hdmi_avi_infoframe_from_display_mode(&frame,
-						       hdmi->curr_conn, mode);
-	if (err < 0) {
-		dev_err(hdmi->dev,
-			"Failed to get AVI infoframe from mode: %zd\n", err);
-		return err;
-	}
-
-	err = hdmi_avi_infoframe_pack(&frame, buffer, sizeof(buffer));
-	if (err < 0) {
-		dev_err(hdmi->dev, "Failed to pack AVI infoframe: %zd\n", err);
-		return err;
-	}
-
-	mtk_hdmi_hw_send_info_frame(hdmi, buffer, sizeof(buffer));
-	return 0;
-}
-
-static int mtk_hdmi_setup_spd_infoframe(struct mtk_hdmi *hdmi,
-					const char *vendor,
-					const char *product)
-{
-	struct hdmi_spd_infoframe frame;
-	u8 buffer[HDMI_INFOFRAME_HEADER_SIZE + HDMI_SPD_INFOFRAME_SIZE];
-	ssize_t err;
-
-	err = hdmi_spd_infoframe_init(&frame, vendor, product);
-	if (err < 0) {
-		dev_err(hdmi->dev, "Failed to initialize SPD infoframe: %zd\n",
-			err);
-		return err;
-	}
-
-	err = hdmi_spd_infoframe_pack(&frame, buffer, sizeof(buffer));
-	if (err < 0) {
-		dev_err(hdmi->dev, "Failed to pack SDP infoframe: %zd\n", err);
-		return err;
-	}
-
-	mtk_hdmi_hw_send_info_frame(hdmi, buffer, sizeof(buffer));
-	return 0;
-}
-
 static int mtk_hdmi_setup_audio_infoframe(struct mtk_hdmi *hdmi)
 {
 	struct hdmi_audio_infoframe frame;
@@ -1054,7 +834,7 @@ static int mtk_hdmi_setup_vendor_specific_infoframe(struct mtk_hdmi *hdmi,
 	return 0;
 }
 
-static int mtk_hdmi_output_init(struct mtk_hdmi *hdmi)
+void mtk_hdmi_output_init_mt8183(struct mtk_hdmi *hdmi)
 {
 	struct hdmi_audio_param *aud_param = &hdmi->aud_param;
 
@@ -1065,8 +845,6 @@ static int mtk_hdmi_output_init(struct mtk_hdmi *hdmi)
 	aud_param->aud_i2s_fmt = HDMI_I2S_MODE_I2S_24BIT;
 	aud_param->aud_mclk = HDMI_AUD_MCLK_128FS;
 	aud_param->aud_input_chan_type = HDMI_AUD_CHAN_TYPE_2_0;
-
-	return 0;
 }
 
 static void mtk_hdmi_audio_enable(struct mtk_hdmi *hdmi)
@@ -1123,49 +901,28 @@ static int mtk_hdmi_output_set_display_mode(struct mtk_hdmi *hdmi,
 	return 0;
 }
 
-static const char * const mtk_hdmi_clk_names[MTK_HDMI_CLK_COUNT] = {
-	[MTK_HDMI_CLK_HDMI_PIXEL] = "pixel",
-	[MTK_HDMI_CLK_HDMI_PLL] = "pll",
-	[MTK_HDMI_CLK_AUD_BCLK] = "bclk",
-	[MTK_HDMI_CLK_AUD_SPDIF] = "spdif",
-};
-
-static int mtk_hdmi_get_all_clk(struct mtk_hdmi *hdmi,
-				struct device_node *np)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(mtk_hdmi_clk_names); i++) {
-		hdmi->clk[i] = of_clk_get_by_name(np,
-						  mtk_hdmi_clk_names[i]);
-		if (IS_ERR(hdmi->clk[i]))
-			return PTR_ERR(hdmi->clk[i]);
-	}
-	return 0;
-}
-
-static int mtk_hdmi_clk_enable_audio(struct mtk_hdmi *hdmi)
+int mtk_hdmi_clk_enable_audio_mt8183(struct mtk_hdmi *hdmi)
 {
 	int ret;
 
-	ret = clk_prepare_enable(hdmi->clk[MTK_HDMI_CLK_AUD_BCLK]);
+	ret = clk_prepare_enable(hdmi->clk[MTK_MT8183_HDMI_CLK_AUD_BCLK]);
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(hdmi->clk[MTK_HDMI_CLK_AUD_SPDIF]);
+	ret = clk_prepare_enable(hdmi->clk[MTK_MT8183_HDMI_CLK_AUD_SPDIF]);
 	if (ret)
 		goto err;
 
 	return 0;
 err:
-	clk_disable_unprepare(hdmi->clk[MTK_HDMI_CLK_AUD_BCLK]);
+	clk_disable_unprepare(hdmi->clk[MTK_MT8183_HDMI_CLK_AUD_BCLK]);
 	return ret;
 }
 
-static void mtk_hdmi_clk_disable_audio(struct mtk_hdmi *hdmi)
+void mtk_hdmi_clk_disable_audio_mt8183(struct mtk_hdmi *hdmi)
 {
-	clk_disable_unprepare(hdmi->clk[MTK_HDMI_CLK_AUD_BCLK]);
-	clk_disable_unprepare(hdmi->clk[MTK_HDMI_CLK_AUD_SPDIF]);
+	clk_disable_unprepare(hdmi->clk[MTK_MT8183_HDMI_CLK_AUD_BCLK]);
+	clk_disable_unprepare(hdmi->clk[MTK_MT8183_HDMI_CLK_AUD_SPDIF]);
 }
 
 static enum drm_connector_status
@@ -1250,21 +1007,6 @@ static enum drm_connector_status mtk_hdmi_bridge_detect(struct drm_bridge *bridg
 	return mtk_hdmi_detect(hdmi);
 }
 
-static struct edid *mtk_hdmi_bridge_get_edid(struct drm_bridge *bridge,
-					     struct drm_connector *connector)
-{
-	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
-	struct edid *edid;
-
-	if (!hdmi->ddc_adpt)
-		return NULL;
-	edid = drm_get_edid(connector, hdmi->ddc_adpt);
-	if (!edid)
-		return NULL;
-	hdmi->dvi_mode = !drm_detect_monitor_audio(edid);
-	return edid;
-}
-
 static int mtk_hdmi_bridge_attach(struct drm_bridge *bridge,
 				  enum drm_bridge_attach_flags flags)
 {
@@ -1289,13 +1031,6 @@ static int mtk_hdmi_bridge_attach(struct drm_bridge *bridge,
 	return 0;
 }
 
-static bool mtk_hdmi_bridge_mode_fixup(struct drm_bridge *bridge,
-				       const struct drm_display_mode *mode,
-				       struct drm_display_mode *adjusted_mode)
-{
-	return true;
-}
-
 static void mtk_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
 					   struct drm_bridge_state *old_bridge_state)
 {
@@ -1305,8 +1040,8 @@ static void mtk_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
 		return;
 
 	phy_power_off(hdmi->phy);
-	clk_disable_unprepare(hdmi->clk[MTK_HDMI_CLK_HDMI_PIXEL]);
-	clk_disable_unprepare(hdmi->clk[MTK_HDMI_CLK_HDMI_PLL]);
+	clk_disable_unprepare(hdmi->clk[MTK_MT8183_HDMI_CLK_HDMI_PIXEL]);
+	clk_disable_unprepare(hdmi->clk[MTK_MT8183_HDMI_CLK_HDMI_PLL]);
 
 	hdmi->curr_conn = NULL;
 
@@ -1327,28 +1062,6 @@ static void mtk_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	hdmi->powered = false;
 }
 
-static void mtk_hdmi_bridge_mode_set(struct drm_bridge *bridge,
-				const struct drm_display_mode *mode,
-				const struct drm_display_mode *adjusted_mode)
-{
-	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
-
-	dev_dbg(hdmi->dev, "cur info: name:%s, hdisplay:%d\n",
-		adjusted_mode->name, adjusted_mode->hdisplay);
-	dev_dbg(hdmi->dev, "hsync_start:%d,hsync_end:%d, htotal:%d",
-		adjusted_mode->hsync_start, adjusted_mode->hsync_end,
-		adjusted_mode->htotal);
-	dev_dbg(hdmi->dev, "hskew:%d, vdisplay:%d\n",
-		adjusted_mode->hskew, adjusted_mode->vdisplay);
-	dev_dbg(hdmi->dev, "vsync_start:%d, vsync_end:%d, vtotal:%d",
-		adjusted_mode->vsync_start, adjusted_mode->vsync_end,
-		adjusted_mode->vtotal);
-	dev_dbg(hdmi->dev, "vscan:%d, flag:%d\n",
-		adjusted_mode->vscan, adjusted_mode->flags);
-
-	drm_mode_copy(&hdmi->mode, adjusted_mode);
-}
-
 static void mtk_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 					      struct drm_bridge_state *old_state)
 {
@@ -1360,36 +1073,32 @@ static void mtk_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	hdmi->powered = true;
 }
 
-static void mtk_hdmi_send_infoframe(struct mtk_hdmi *hdmi,
-				    struct drm_display_mode *mode)
-{
-	mtk_hdmi_setup_audio_infoframe(hdmi);
-	mtk_hdmi_setup_avi_infoframe(hdmi, mode);
-	mtk_hdmi_setup_spd_infoframe(hdmi, "mediatek", "On-chip HDMI");
-	if (mode->flags & DRM_MODE_FLAG_3D_MASK)
-		mtk_hdmi_setup_vendor_specific_infoframe(hdmi, mode);
-}
-
 static void mtk_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
 					  struct drm_bridge_state *old_state)
 {
 	struct drm_atomic_state *state = old_state->base.state;
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
+	u8 buffer_spd[HDMI_INFOFRAME_SIZE(SPD)];
+	u8 buffer_avi[HDMI_INFOFRAME_SIZE(AVI)];
 
 	/* Retrieve the connector through the atomic state. */
 	hdmi->curr_conn = drm_atomic_get_new_connector_for_encoder(state,
 								   bridge->encoder);
 
 	mtk_hdmi_output_set_display_mode(hdmi, &hdmi->mode);
-	clk_prepare_enable(hdmi->clk[MTK_HDMI_CLK_HDMI_PLL]);
-	clk_prepare_enable(hdmi->clk[MTK_HDMI_CLK_HDMI_PIXEL]);
+	clk_prepare_enable(hdmi->clk[MTK_MT8183_HDMI_CLK_HDMI_PLL]);
+	clk_prepare_enable(hdmi->clk[MTK_MT8183_HDMI_CLK_HDMI_PIXEL]);
 	phy_power_on(hdmi->phy);
-	mtk_hdmi_send_infoframe(hdmi, &hdmi->mode);
+	mtk_hdmi_setup_audio_infoframe(hdmi);
+	mtk_hdmi_send_infoframe(hdmi, buffer_spd, sizeof(buffer_spd),
+				buffer_avi, sizeof(buffer_avi), &hdmi->mode);
+	if (hdmi->mode.flags & DRM_MODE_FLAG_3D_MASK)
+		mtk_hdmi_setup_vendor_specific_infoframe(hdmi, &hdmi->mode);
 
 	hdmi->enabled = true;
 }
 
-static const struct drm_bridge_funcs mtk_hdmi_bridge_funcs = {
+const struct drm_bridge_funcs mtk_mt8183_hdmi_bridge_funcs = {
 	.mode_valid = mtk_hdmi_bridge_mode_valid,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
@@ -1405,105 +1114,6 @@ static const struct drm_bridge_funcs mtk_hdmi_bridge_funcs = {
 	.get_edid = mtk_hdmi_bridge_get_edid,
 };
 
-static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
-				   struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
-	struct device_node *cec_np, *remote, *i2c_np;
-	struct platform_device *cec_pdev;
-	struct regmap *regmap;
-	int ret;
-
-	ret = mtk_hdmi_get_all_clk(hdmi, np);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get clocks: %d\n", ret);
-
-		return ret;
-	}
-
-	/* The CEC module handles HDMI hotplug detection */
-	cec_np = of_get_compatible_child(np->parent, "mediatek,mt8173-cec");
-	if (!cec_np) {
-		dev_err(dev, "Failed to find CEC node\n");
-		return -EINVAL;
-	}
-
-	cec_pdev = of_find_device_by_node(cec_np);
-	if (!cec_pdev) {
-		dev_err(hdmi->dev, "Waiting for CEC device %pOF\n",
-			cec_np);
-		of_node_put(cec_np);
-		return -EPROBE_DEFER;
-	}
-	of_node_put(cec_np);
-	hdmi->cec_dev = &cec_pdev->dev;
-
-	/*
-	 * The mediatek,syscon-hdmi property contains a phandle link to the
-	 * MMSYS_CONFIG device and the register offset of the HDMI_SYS_CFG
-	 * registers it contains.
-	 */
-	regmap = syscon_regmap_lookup_by_phandle(np, "mediatek,syscon-hdmi");
-	ret = of_property_read_u32_index(np, "mediatek,syscon-hdmi", 1,
-					 &hdmi->sys_offset);
-	if (IS_ERR(regmap))
-		ret = PTR_ERR(regmap);
-	if (ret) {
-		dev_err(dev,
-			"Failed to get system configuration registers: %d\n",
-			ret);
-		goto put_device;
-	}
-	hdmi->sys_regmap = regmap;
-
-	hdmi->regs = syscon_node_to_regmap(dev->of_node);
-	if (IS_ERR(hdmi->regs)) {
-		ret = PTR_ERR(hdmi->regs);
-		goto put_device;
-	}
-
-	remote = of_graph_get_remote_node(np, 1, 0);
-	if (!remote) {
-		ret = -EINVAL;
-		goto put_device;
-	}
-
-	if (!of_device_is_compatible(remote, "hdmi-connector")) {
-		hdmi->next_bridge = of_drm_find_bridge(remote);
-		if (!hdmi->next_bridge) {
-			dev_err(dev, "Waiting for external bridge\n");
-			of_node_put(remote);
-			ret = -EPROBE_DEFER;
-			goto put_device;
-		}
-	}
-
-	i2c_np = of_parse_phandle(remote, "ddc-i2c-bus", 0);
-	if (!i2c_np) {
-		dev_err(dev, "Failed to find ddc-i2c-bus node in %pOF\n",
-			remote);
-		of_node_put(remote);
-		ret = -EINVAL;
-		goto put_device;
-	}
-	of_node_put(remote);
-
-	hdmi->ddc_adpt = of_find_i2c_adapter_by_node(i2c_np);
-	of_node_put(i2c_np);
-	if (!hdmi->ddc_adpt) {
-		dev_err(dev, "Failed to get ddc i2c adapter by node\n");
-		ret = -EINVAL;
-		goto put_device;
-	}
-
-	return 0;
-put_device:
-	put_device(hdmi->cec_dev);
-	return ret;
-}
-
 /*
  * HDMI audio codec callbacks
  */
@@ -1649,175 +1259,9 @@ static const struct hdmi_codec_ops mtk_hdmi_audio_codec_ops = {
 	.no_capture_mute = 1,
 };
 
-static int mtk_hdmi_register_audio_driver(struct device *dev)
-{
-	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
-	struct hdmi_codec_pdata codec_data = {
-		.ops = &mtk_hdmi_audio_codec_ops,
-		.max_i2s_channels = 2,
-		.i2s = 1,
-		.data = hdmi,
-	};
-	struct platform_device *pdev;
-
-	pdev = platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
-					     PLATFORM_DEVID_AUTO, &codec_data,
-					     sizeof(codec_data));
-	if (IS_ERR(pdev))
-		return PTR_ERR(pdev);
-
-	DRM_INFO("%s driver bound to HDMI\n", HDMI_CODEC_DRV_NAME);
-	return 0;
-}
-
-static int mtk_drm_hdmi_probe(struct platform_device *pdev)
-{
-	struct mtk_hdmi *hdmi;
-	struct device *dev = &pdev->dev;
-	int ret;
-
-	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
-	if (!hdmi)
-		return -ENOMEM;
-
-	hdmi->dev = dev;
-	hdmi->conf = of_device_get_match_data(dev);
-
-	ret = mtk_hdmi_dt_parse_pdata(hdmi, pdev);
-	if (ret)
-		return ret;
-
-	hdmi->phy = devm_phy_get(dev, "hdmi");
-	if (IS_ERR(hdmi->phy)) {
-		ret = PTR_ERR(hdmi->phy);
-		dev_err(dev, "Failed to get HDMI PHY: %d\n", ret);
-		return ret;
-	}
-
-	mutex_init(&hdmi->update_plugged_status_lock);
-	platform_set_drvdata(pdev, hdmi);
-
-	ret = mtk_hdmi_output_init(hdmi);
-	if (ret) {
-		dev_err(dev, "Failed to initialize hdmi output\n");
-		return ret;
-	}
-
-	ret = mtk_hdmi_register_audio_driver(dev);
-	if (ret) {
-		dev_err(dev, "Failed to register audio driver: %d\n", ret);
-		return ret;
-	}
-
-	hdmi->bridge.funcs = &mtk_hdmi_bridge_funcs;
-	hdmi->bridge.of_node = pdev->dev.of_node;
-	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
-			 | DRM_BRIDGE_OP_HPD;
-	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
-	drm_bridge_add(&hdmi->bridge);
-
-	ret = mtk_hdmi_clk_enable_audio(hdmi);
-	if (ret) {
-		dev_err(dev, "Failed to enable audio clocks: %d\n", ret);
-		goto err_bridge_remove;
-	}
-
-	return 0;
-
-err_bridge_remove:
-	drm_bridge_remove(&hdmi->bridge);
-	return ret;
-}
-
-static int mtk_drm_hdmi_remove(struct platform_device *pdev)
-{
-	struct mtk_hdmi *hdmi = platform_get_drvdata(pdev);
-
-	drm_bridge_remove(&hdmi->bridge);
-	mtk_hdmi_clk_disable_audio(hdmi);
-	return 0;
-}
-
-#ifdef CONFIG_PM_SLEEP
-static int mtk_hdmi_suspend(struct device *dev)
-{
-	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
-
-	mtk_hdmi_clk_disable_audio(hdmi);
-
-	return 0;
-}
-
-static int mtk_hdmi_resume(struct device *dev)
-{
-	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
-	int ret = 0;
-
-	ret = mtk_hdmi_clk_enable_audio(hdmi);
-	if (ret) {
-		dev_err(dev, "hdmi resume failed!\n");
-		return ret;
-	}
-
-	return 0;
-}
-#endif
-static SIMPLE_DEV_PM_OPS(mtk_hdmi_pm_ops,
-			 mtk_hdmi_suspend, mtk_hdmi_resume);
-
-static const struct mtk_hdmi_conf mtk_hdmi_conf_mt2701 = {
-	.tz_disabled = true,
-};
-
-static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8167 = {
-	.max_mode_clock = 148500,
-	.cea_modes_only = true,
-};
-
-static const struct of_device_id mtk_drm_hdmi_of_ids[] = {
-	{ .compatible = "mediatek,mt2701-hdmi",
-	  .data = &mtk_hdmi_conf_mt2701,
-	},
-	{ .compatible = "mediatek,mt8167-hdmi",
-	  .data = &mtk_hdmi_conf_mt8167,
-	},
-	{ .compatible = "mediatek,mt8173-hdmi",
-	},
-	{}
-};
-MODULE_DEVICE_TABLE(of, mtk_drm_hdmi_of_ids);
-
-static struct platform_driver mtk_hdmi_driver = {
-	.probe = mtk_drm_hdmi_probe,
-	.remove = mtk_drm_hdmi_remove,
-	.driver = {
-		.name = "mediatek-drm-hdmi",
-		.of_match_table = mtk_drm_hdmi_of_ids,
-		.pm = &mtk_hdmi_pm_ops,
-	},
-};
-
-static struct platform_driver * const mtk_hdmi_drivers[] = {
-	&mtk_hdmi_ddc_driver,
-	&mtk_cec_driver,
-	&mtk_hdmi_driver,
-};
-
-static int __init mtk_hdmitx_init(void)
-{
-	return platform_register_drivers(mtk_hdmi_drivers,
-					 ARRAY_SIZE(mtk_hdmi_drivers));
-}
-
-static void __exit mtk_hdmitx_exit(void)
+void set_hdmi_codec_pdata_mt8183(struct hdmi_codec_pdata *codec_data)
 {
-	platform_unregister_drivers(mtk_hdmi_drivers,
-				    ARRAY_SIZE(mtk_hdmi_drivers));
+	codec_data->ops = &mtk_hdmi_audio_codec_ops;
+	codec_data->max_i2s_channels = 2;
+	codec_data->i2s = 1;
 }
-
-module_init(mtk_hdmitx_init);
-module_exit(mtk_hdmitx_exit);
-
-MODULE_AUTHOR("Jie Qiu <jie.qiu@mediatek.com>");
-MODULE_DESCRIPTION("MediaTek HDMI Driver");
-MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.h b/drivers/gpu/drm/mediatek/mtk_hdmi.h
index 472bf141c92b..45a6ff1fb7d7 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.h
@@ -6,9 +6,25 @@
 #ifndef _MTK_HDMI_CTRL_H
 #define _MTK_HDMI_CTRL_H
 
+struct mtk_hdmi;
 struct platform_driver;
 
 extern struct platform_driver mtk_cec_driver;
 extern struct platform_driver mtk_hdmi_ddc_driver;
+extern const struct drm_bridge_funcs mtk_mt8183_hdmi_bridge_funcs;
 
+void mtk_hdmi_output_init_mt8183(struct mtk_hdmi *hdmi);
+void mtk_hdmi_clk_disable_audio_mt8183(struct mtk_hdmi *hdmi);
+int mtk_hdmi_clk_enable_audio_mt8183(struct mtk_hdmi *hdmi);
+void set_hdmi_codec_pdata_mt8183(struct hdmi_codec_pdata *codec_data);
+
+enum mtk_hdmi_clk_id_mt8183 {
+	MTK_MT8183_HDMI_CLK_HDMI_PIXEL,
+	MTK_MT8183_HDMI_CLK_HDMI_PLL,
+	MTK_MT8183_HDMI_CLK_AUD_BCLK,
+	MTK_MT8183_HDMI_CLK_AUD_SPDIF,
+	MTK_MT8183_HDMI_CLK_COUNT,
+};
+
+extern const char * const mtk_hdmi_clk_names_mt8183[MTK_MT8183_HDMI_CLK_COUNT];
 #endif /* _MTK_HDMI_CTRL_H */
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
new file mode 100644
index 000000000000..bfcca6f8b839
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -0,0 +1,433 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2014 MediaTek Inc.
+ * Copyright (c) 2022 BayLibre, SAS
+ * Author: Jie Qiu <jie.qiu@mediatek.com>
+ */
+#include "mtk_hdmi_common.h"
+
+struct mtk_hdmi *hdmi_ctx_from_bridge(struct drm_bridge *b)
+{
+	return container_of(b, struct mtk_hdmi, bridge);
+}
+
+int mtk_hdmi_read(struct mtk_hdmi *hdmi, u32 offset, u32 *val)
+{
+	return regmap_read(hdmi->regs, offset, val);
+}
+
+void mtk_hdmi_write(struct mtk_hdmi *hdmi, u32 offset, u32 val)
+{
+	regmap_write(hdmi->regs, offset, val);
+}
+
+void mtk_hdmi_clear_bits(struct mtk_hdmi *hdmi, u32 offset, u32 bits)
+{
+	regmap_clear_bits(hdmi->regs, offset, bits);
+}
+
+void mtk_hdmi_set_bits(struct mtk_hdmi *hdmi, u32 offset, u32 bits)
+{
+	regmap_set_bits(hdmi->regs, offset, bits);
+}
+
+void mtk_hdmi_mask(struct mtk_hdmi *hdmi, u32 offset, u32 val, u32 mask)
+{
+	regmap_update_bits(hdmi->regs, offset, mask, val);
+}
+
+int mtk_hdmi_setup_spd_infoframe(struct mtk_hdmi *hdmi, u8 *buffer, size_t bufsz,
+				 const char *vendor, const char *product)
+{
+	struct hdmi_spd_infoframe frame;
+	ssize_t err;
+
+	err = hdmi_spd_infoframe_init(&frame, vendor, product);
+	if (err < 0) {
+		dev_err(hdmi->dev, "Failed to initialize SPD infoframe: %zd\n",
+			err);
+		return err;
+	}
+
+	err = hdmi_spd_infoframe_pack(&frame, buffer, bufsz);
+	if (err < 0) {
+		dev_err(hdmi->dev, "Failed to pack SDP infoframe: %zd\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+int mtk_hdmi_get_all_clk(struct mtk_hdmi *hdmi, struct device_node *np,
+			 const char *const *mtk_hdmi_clk_names, size_t num_clocks)
+{
+	int i;
+
+	for (i = 0; i < num_clocks; i++) {
+		hdmi->clk[i] = of_clk_get_by_name(np, mtk_hdmi_clk_names[i]);
+		dev_err(hdmi->dev, "Getting clk name: %s\n", mtk_hdmi_clk_names[i]);
+
+		if (IS_ERR(hdmi->clk[i]))
+			return PTR_ERR(hdmi->clk[i]);
+	}
+
+	return 0;
+}
+
+struct edid *mtk_hdmi_bridge_get_edid(struct drm_bridge *bridge,
+				      struct drm_connector *connector)
+{
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
+	struct edid *edid;
+
+	if (!hdmi->ddc_adpt)
+		return NULL;
+	edid = drm_get_edid(connector, hdmi->ddc_adpt);
+	if (!edid)
+		return NULL;
+	return edid;
+}
+
+bool mtk_hdmi_bridge_mode_fixup(struct drm_bridge *bridge,
+				const struct drm_display_mode *mode,
+				       struct drm_display_mode *adjusted_mode)
+{
+	return true;
+}
+
+void
+mtk_hdmi_bridge_mode_set(struct drm_bridge *bridge,
+			 const struct drm_display_mode *mode,
+			 const struct drm_display_mode *adjusted_mode)
+{
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
+
+	drm_mode_copy(&hdmi->mode, adjusted_mode);
+}
+
+int mtk_hdmi_setup_avi_infoframe(struct mtk_hdmi *hdmi, u8 *buffer, size_t bufsz,
+				 struct drm_display_mode *mode)
+{
+	struct hdmi_avi_infoframe frame;
+	ssize_t err;
+
+	err = drm_hdmi_avi_infoframe_from_display_mode(&frame, &hdmi->conn,
+						       mode);
+
+	if (err < 0) {
+		dev_err(hdmi->dev,
+			"Failed to get AVI infoframe from mode: %zd\n", err);
+		return err;
+	}
+
+	err = hdmi_avi_infoframe_pack(&frame, buffer, bufsz);
+
+	if (err < 0) {
+		dev_err(hdmi->dev, "Failed to pack AVI infoframe: %zd\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+void mtk_hdmi_send_infoframe(struct mtk_hdmi *hdmi, u8 *buffer_spd, size_t bufsz_spd,
+			     u8 *buffer_avi, size_t bufsz_avi, struct drm_display_mode *mode)
+{
+	mtk_hdmi_setup_avi_infoframe(hdmi, buffer_avi, bufsz_avi, mode);
+	mtk_hdmi_setup_spd_infoframe(hdmi, buffer_spd, bufsz_spd, "mediatek", "On-chip HDMI");
+}
+
+int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platform_device *pdev,
+			    const char *const *clk_names, size_t num_clocks)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct device_node *cec_np, *remote, *i2c_np;
+	struct platform_device *cec_pdev;
+	struct regmap *regmap;
+	struct resource *mem;
+	int ret;
+
+	ret = mtk_hdmi_get_all_clk(hdmi, np, clk_names, num_clocks);
+	if (ret) {
+		dev_err(dev, "Failed to get all clks\n");
+		return ret;
+	}
+
+	/* The CEC module handles HDMI hotplug detection */
+	cec_np = of_get_compatible_child(np->parent, "mediatek,mt8173-cec");
+	if (!cec_np) {
+		dev_err(dev, "Failed to find CEC node\n");
+		return -EINVAL;
+	}
+
+	cec_pdev = of_find_device_by_node(cec_np);
+	if (!cec_pdev) {
+		dev_err(hdmi->dev, "Waiting for CEC device %pOF\n", cec_np);
+		of_node_put(cec_np);
+		return -EPROBE_DEFER;
+	}
+	of_node_put(cec_np);
+	hdmi->cec_dev = &cec_pdev->dev;
+	/*
+	 * The mediatek,syscon-hdmi property contains a phandle link to the
+	 * MMSYS_CONFIG device and the register offset of the HDMI_SYS_CFG
+	 * registers it contains.
+	 */
+	regmap = syscon_regmap_lookup_by_phandle(np, "mediatek,syscon-hdmi");
+	ret = of_property_read_u32_index(np, "mediatek,syscon-hdmi", 1, &hdmi->sys_offset);
+	if (IS_ERR(regmap))
+		ret = PTR_ERR(regmap);
+	if (ret) {
+		dev_err(dev, "Failed to get system configuration registers: %d\n", ret);
+		goto put_device;
+	}
+	hdmi->sys_regmap = regmap;
+
+	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!mem) {
+		ret = -ENOMEM;
+		goto put_device;
+	}
+
+	hdmi->regs = syscon_node_to_regmap(dev->of_node);
+	if (IS_ERR(hdmi->regs)) {
+		ret = PTR_ERR(hdmi->regs);
+		goto put_device;
+	}
+
+	remote = of_graph_get_remote_node(np, 1, 0);
+	if (!remote) {
+		ret = -EINVAL;
+		goto put_device;
+	}
+
+	if (!of_device_is_compatible(remote, "hdmi-connector")) {
+		hdmi->next_bridge = of_drm_find_bridge(remote);
+		if (!hdmi->next_bridge) {
+			dev_err(dev, "Waiting for external bridge\n");
+			of_node_put(remote);
+			ret = -EPROBE_DEFER;
+			goto put_device;
+		}
+	}
+
+	i2c_np = of_parse_phandle(remote, "ddc-i2c-bus", 0);
+	if (!i2c_np) {
+		of_node_put(pdev->dev.of_node);
+		dev_err(dev, "Failed to find ddc-i2c-bus");
+		ret = -EINVAL;
+		goto put_device;
+	}
+
+	hdmi->ddc_adpt = of_find_i2c_adapter_by_node(i2c_np);
+	of_node_put(i2c_np);
+	if (!hdmi->ddc_adpt) {
+		dev_err(dev, "Failed to get ddc i2c adapter by node");
+		ret = -EPROBE_DEFER;
+		goto put_device;
+	}
+
+	return 0;
+put_device:
+	put_device(hdmi->cec_dev);
+	return ret;
+}
+
+static int mtk_hdmi_register_audio_driver(struct device *dev)
+{
+	struct platform_device *pdev;
+	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
+	struct hdmi_codec_pdata codec_data = {
+		.data = hdmi,
+	};
+
+	if (hdmi->conf->set_hdmi_codec_pdata)
+		hdmi->conf->set_hdmi_codec_pdata(&codec_data);
+
+	pdev = platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
+					     PLATFORM_DEVID_AUTO, &codec_data,
+					     sizeof(codec_data));
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+
+	DRM_INFO("%s driver bound to HDMI\n", HDMI_CODEC_DRV_NAME);
+	return 0;
+}
+
+int mtk_drm_hdmi_probe(struct platform_device *pdev)
+{
+	struct mtk_hdmi *hdmi;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
+	if (!hdmi)
+		return -ENOMEM;
+
+	hdmi->dev = dev;
+	hdmi->conf = of_device_get_match_data(dev);
+
+	hdmi->clk = devm_kcalloc(dev, hdmi->conf->num_clocks, sizeof(struct clk *),
+				 GFP_KERNEL);
+
+	hdmi->phy = devm_phy_get(dev, "hdmi");
+	if (IS_ERR(hdmi->phy)) {
+		ret = PTR_ERR(hdmi->phy);
+		dev_err(dev, "Failed to get HDMI PHY: %d\n", ret);
+		return ret;
+	}
+
+	ret = mtk_hdmi_dt_parse_pdata(hdmi, pdev, hdmi->conf->mtk_hdmi_clock_names,
+				      hdmi->conf->num_clocks);
+
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, hdmi);
+
+	if (hdmi->conf->mtk_hdmi_output_init)
+		hdmi->conf->mtk_hdmi_output_init(hdmi);
+
+	hdmi->bridge.funcs = hdmi->conf->bridge_funcs;
+
+	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
+	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
+	hdmi->bridge.of_node = pdev->dev.of_node;
+	drm_bridge_add(&hdmi->bridge);
+
+	ret = mtk_hdmi_register_audio_driver(dev);
+
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+int mtk_drm_hdmi_remove(struct platform_device *pdev)
+{
+	struct mtk_hdmi *hdmi = platform_get_drvdata(pdev);
+
+	drm_bridge_remove(&hdmi->bridge);
+
+	if (hdmi->conf->mtk_hdmi_clk_disable)
+		hdmi->conf->mtk_hdmi_clk_disable(hdmi);
+
+	i2c_put_adapter(hdmi->ddc_adpt);
+
+	return 0;
+}
+
+static const struct mtk_hdmi_conf mtk_hdmi_conf_mt2701 = {
+	.tz_disabled = true,
+	.bridge_funcs = &mtk_mt8183_hdmi_bridge_funcs,
+	.mtk_hdmi_output_init = mtk_hdmi_output_init_mt8183,
+	.mtk_hdmi_clk_disable = mtk_hdmi_clk_disable_audio_mt8183,
+	.mtk_hdmi_clk_enable = mtk_hdmi_clk_enable_audio_mt8183,
+	.set_hdmi_codec_pdata = set_hdmi_codec_pdata_mt8183,
+	.mtk_hdmi_clock_names = mtk_hdmi_clk_names_mt8183,
+	.num_clocks = MTK_MT8183_HDMI_CLK_COUNT,
+};
+
+static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8167 = {
+	.max_mode_clock = 148500,
+	.cea_modes_only = true,
+	.bridge_funcs = &mtk_mt8183_hdmi_bridge_funcs,
+	.mtk_hdmi_output_init = mtk_hdmi_output_init_mt8183,
+	.mtk_hdmi_clk_disable = mtk_hdmi_clk_disable_audio_mt8183,
+	.mtk_hdmi_clk_enable = mtk_hdmi_clk_enable_audio_mt8183,
+	.set_hdmi_codec_pdata = set_hdmi_codec_pdata_mt8183,
+	.mtk_hdmi_clock_names = mtk_hdmi_clk_names_mt8183,
+	.num_clocks = MTK_MT8183_HDMI_CLK_COUNT,
+};
+
+static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8173 = {
+	.bridge_funcs = &mtk_mt8183_hdmi_bridge_funcs,
+	.mtk_hdmi_output_init = mtk_hdmi_output_init_mt8183,
+	.mtk_hdmi_clk_disable = mtk_hdmi_clk_disable_audio_mt8183,
+	.mtk_hdmi_clk_enable = mtk_hdmi_clk_enable_audio_mt8183,
+	.set_hdmi_codec_pdata = set_hdmi_codec_pdata_mt8183,
+	.mtk_hdmi_clock_names = mtk_hdmi_clk_names_mt8183,
+	.num_clocks = MTK_MT8183_HDMI_CLK_COUNT,
+};
+
+static const struct of_device_id mtk_drm_hdmi_of_ids[] = {
+	{ .compatible = "mediatek,mt2701-hdmi",
+	  .data = &mtk_hdmi_conf_mt2701,
+	},
+	{ .compatible = "mediatek,mt8167-hdmi",
+	  .data = &mtk_hdmi_conf_mt8167,
+	},
+	{ .compatible = "mediatek,mt8173-hdmi",
+	  .data = &mtk_hdmi_conf_mt8173,
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(of, mtk_drm_hdmi_of_ids);
+
+#ifdef CONFIG_PM_SLEEP
+static __maybe_unused int mtk_hdmi_suspend(struct device *dev)
+{
+	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
+
+	if (hdmi->conf->mtk_hdmi_clk_disable)
+		hdmi->conf->mtk_hdmi_clk_disable(hdmi);
+
+	return 0;
+}
+
+static __maybe_unused int mtk_hdmi_resume(struct device *dev)
+{
+	int ret;
+	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
+
+	dev_dbg(dev, "hdmi resume success!\n");
+
+	if (hdmi->conf->mtk_hdmi_clk_enable) {
+		ret = hdmi->conf->mtk_hdmi_clk_enable(hdmi);
+		if (ret)
+			dev_err(dev, "hdmi resume failed!\n");
+	}
+
+	return ret;
+}
+#endif
+
+static SIMPLE_DEV_PM_OPS(mtk_hdmi_pm_ops,
+			 mtk_hdmi_suspend, mtk_hdmi_resume);
+
+static struct platform_driver mtk_hdmi_driver = {
+	.probe = mtk_drm_hdmi_probe,
+	.remove = mtk_drm_hdmi_remove,
+	.driver = {
+		.name = "mediatek-drm-hdmi",
+		.of_match_table = mtk_drm_hdmi_of_ids,
+		.pm = &mtk_hdmi_pm_ops,
+	},
+};
+
+static struct platform_driver * const mtk_hdmi_drivers[] = {
+	&mtk_hdmi_ddc_driver,
+	&mtk_cec_driver,
+	&mtk_hdmi_driver,
+};
+
+static int __init mtk_hdmitx_init(void)
+{
+	return platform_register_drivers(mtk_hdmi_drivers,
+					 ARRAY_SIZE(mtk_hdmi_drivers));
+}
+
+static void __exit mtk_hdmitx_exit(void)
+{
+	platform_unregister_drivers(mtk_hdmi_drivers,
+				    ARRAY_SIZE(mtk_hdmi_drivers));
+}
+
+module_init(mtk_hdmitx_init);
+module_exit(mtk_hdmitx_exit);
+
+MODULE_AUTHOR("Jie Qiu <jie.qiu@mediatek.com>");
+MODULE_AUTHOR("Can Zeng <can.zeng@mediatek.com>");
+MODULE_DESCRIPTION("MediaTek HDMI Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
new file mode 100644
index 000000000000..7452bea91f9e
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
@@ -0,0 +1,221 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Copyright (c) 2022 BayLibre, SAS
+ */
+
+#ifndef _MTK_HDMI_COMMON_H
+#define _MTK_HDMI_COMMON_H
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_print.h>
+
+#include <linux/clk.h>
+#include <linux/hdmi.h>
+#include <linux/i2c.h>
+#include <linux/mfd/syscon.h>
+#include <linux/mutex.h>
+#include <linux/of_platform.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+
+#include <sound/hdmi-codec.h>
+
+#include "mtk_cec.h"
+#include "mtk_hdmi.h"
+
+struct mtk_hdmi_conf {
+	bool tz_disabled;
+	bool cea_modes_only;
+	unsigned long max_mode_clock;
+	const struct drm_bridge_funcs *bridge_funcs;
+	void (*mtk_hdmi_output_init)(struct mtk_hdmi *hdmi);
+	void (*mtk_hdmi_clk_disable)(struct mtk_hdmi *hdmi);
+	int (*mtk_hdmi_clk_enable)(struct mtk_hdmi *hdmi);
+	void (*set_hdmi_codec_pdata)(struct hdmi_codec_pdata *codec_data);
+	const char *const *mtk_hdmi_clock_names;
+	int num_clocks;
+};
+
+enum hdmi_color_depth { HDMI_8_BIT, HDMI_10_BIT, HDMI_12_BIT, HDMI_16_BIT };
+
+enum hdmi_aud_input_type {
+	HDMI_AUD_INPUT_I2S = 0,
+	HDMI_AUD_INPUT_SPDIF,
+};
+
+enum hdmi_aud_i2s_fmt {
+	HDMI_I2S_MODE_RJT_24BIT = 0,
+	HDMI_I2S_MODE_RJT_16BIT,
+	HDMI_I2S_MODE_LJT_24BIT,
+	HDMI_I2S_MODE_LJT_16BIT,
+	HDMI_I2S_MODE_I2S_24BIT,
+	HDMI_I2S_MODE_I2S_16BIT
+};
+
+enum hdmi_aud_mclk {
+	HDMI_AUD_MCLK_128FS,
+	HDMI_AUD_MCLK_192FS,
+	HDMI_AUD_MCLK_256FS,
+	HDMI_AUD_MCLK_384FS,
+	HDMI_AUD_MCLK_512FS,
+	HDMI_AUD_MCLK_768FS,
+	HDMI_AUD_MCLK_1152FS,
+};
+
+enum hdmi_aud_channel_type {
+	HDMI_AUD_CHAN_TYPE_1_0 = 0,
+	HDMI_AUD_CHAN_TYPE_1_1,
+	HDMI_AUD_CHAN_TYPE_2_0,
+	HDMI_AUD_CHAN_TYPE_2_1,
+	HDMI_AUD_CHAN_TYPE_3_0,
+	HDMI_AUD_CHAN_TYPE_3_1,
+	HDMI_AUD_CHAN_TYPE_4_0,
+	HDMI_AUD_CHAN_TYPE_4_1,
+	HDMI_AUD_CHAN_TYPE_5_0,
+	HDMI_AUD_CHAN_TYPE_5_1,
+	HDMI_AUD_CHAN_TYPE_6_0,
+	HDMI_AUD_CHAN_TYPE_6_1,
+	HDMI_AUD_CHAN_TYPE_7_0,
+	HDMI_AUD_CHAN_TYPE_7_1,
+	HDMI_AUD_CHAN_TYPE_3_0_LRS,
+	HDMI_AUD_CHAN_TYPE_3_1_LRS,
+	HDMI_AUD_CHAN_TYPE_4_0_CLRS,
+	HDMI_AUD_CHAN_TYPE_4_1_CLRS,
+	HDMI_AUD_CHAN_TYPE_6_1_CS,
+	HDMI_AUD_CHAN_TYPE_6_1_CH,
+	HDMI_AUD_CHAN_TYPE_6_1_OH,
+	HDMI_AUD_CHAN_TYPE_6_1_CHR,
+	HDMI_AUD_CHAN_TYPE_7_1_LH_RH,
+	HDMI_AUD_CHAN_TYPE_7_1_LSR_RSR,
+	HDMI_AUD_CHAN_TYPE_7_1_LC_RC,
+	HDMI_AUD_CHAN_TYPE_7_1_LW_RW,
+	HDMI_AUD_CHAN_TYPE_7_1_LSD_RSD,
+	HDMI_AUD_CHAN_TYPE_7_1_LSS_RSS,
+	HDMI_AUD_CHAN_TYPE_7_1_LHS_RHS,
+	HDMI_AUD_CHAN_TYPE_7_1_CS_CH,
+	HDMI_AUD_CHAN_TYPE_7_1_CS_OH,
+	HDMI_AUD_CHAN_TYPE_7_1_CS_CHR,
+	HDMI_AUD_CHAN_TYPE_7_1_CH_OH,
+	HDMI_AUD_CHAN_TYPE_7_1_CH_CHR,
+	HDMI_AUD_CHAN_TYPE_7_1_OH_CHR,
+	HDMI_AUD_CHAN_TYPE_7_1_LSS_RSS_LSR_RSR,
+	HDMI_AUD_CHAN_TYPE_6_0_CS,
+	HDMI_AUD_CHAN_TYPE_6_0_CH,
+	HDMI_AUD_CHAN_TYPE_6_0_OH,
+	HDMI_AUD_CHAN_TYPE_6_0_CHR,
+	HDMI_AUD_CHAN_TYPE_7_0_LH_RH,
+	HDMI_AUD_CHAN_TYPE_7_0_LSR_RSR,
+	HDMI_AUD_CHAN_TYPE_7_0_LC_RC,
+	HDMI_AUD_CHAN_TYPE_7_0_LW_RW,
+	HDMI_AUD_CHAN_TYPE_7_0_LSD_RSD,
+	HDMI_AUD_CHAN_TYPE_7_0_LSS_RSS,
+	HDMI_AUD_CHAN_TYPE_7_0_LHS_RHS,
+	HDMI_AUD_CHAN_TYPE_7_0_CS_CH,
+	HDMI_AUD_CHAN_TYPE_7_0_CS_OH,
+	HDMI_AUD_CHAN_TYPE_7_0_CS_CHR,
+	HDMI_AUD_CHAN_TYPE_7_0_CH_OH,
+	HDMI_AUD_CHAN_TYPE_7_0_CH_CHR,
+	HDMI_AUD_CHAN_TYPE_7_0_OH_CHR,
+	HDMI_AUD_CHAN_TYPE_7_0_LSS_RSS_LSR_RSR,
+	HDMI_AUD_CHAN_TYPE_8_0_LH_RH_CS,
+	HDMI_AUD_CHAN_TYPE_UNKNOWN = 0xFF
+};
+
+enum hdmi_aud_channel_swap_type {
+	HDMI_AUD_SWAP_LR,
+	HDMI_AUD_SWAP_LFE_CC,
+	HDMI_AUD_SWAP_LSRS,
+	HDMI_AUD_SWAP_RLS_RRS,
+	HDMI_AUD_SWAP_LR_STATUS,
+};
+
+enum hdmi_hpd_state {
+	HDMI_PLUG_OUT = 0,
+	HDMI_PLUG_IN_AND_SINK_POWER_ON,
+	HDMI_PLUG_IN_ONLY,
+};
+
+struct hdmi_audio_param {
+	enum hdmi_audio_coding_type aud_codec;
+	enum hdmi_audio_sample_size aud_sampe_size;
+	enum hdmi_aud_input_type aud_input_type;
+	enum hdmi_aud_i2s_fmt aud_i2s_fmt;
+	enum hdmi_aud_mclk aud_mclk;
+	enum hdmi_aud_channel_type aud_input_chan_type;
+	struct hdmi_codec_params codec_params;
+};
+
+struct mtk_hdmi {
+	struct drm_bridge bridge;
+	struct drm_connector conn;
+	struct device *dev;
+	const struct mtk_hdmi_conf *conf;
+	struct phy *phy;
+	struct i2c_adapter *ddc_adpt;
+	struct clk **clk;
+	struct drm_display_mode mode;
+	bool dvi_mode;
+	struct regmap *sys_regmap;
+	unsigned int sys_offset;
+	struct regmap *regs;
+	u64 support_csp_depth;
+	u64 set_csp_depth;
+	enum hdmi_colorspace csp;
+	enum hdmi_color_depth color_depth;
+	enum hdmi_colorimetry colorimtery;
+	enum hdmi_extended_colorimetry extended_colorimetry;
+	enum hdmi_quantization_range quantization_range;
+	enum hdmi_ycc_quantization_range ycc_quantization_range;
+
+	bool powered;
+	bool enabled;
+	unsigned int hdmi_irq;
+	enum hdmi_hpd_state hpd;
+
+	bool hdmi_enabled;
+	bool power_clk_enabled;
+	bool irq_registered;
+
+	/* Audio */
+	struct hdmi_audio_param aud_param;
+	bool audio_enable;
+
+	struct drm_connector *curr_conn;/* current connector (only valid when 'enabled') */
+	struct mutex update_plugged_status_lock;
+	struct device *cec_dev;
+	struct device *codec_dev;
+	hdmi_codec_plugged_cb plugged_cb;
+	struct drm_bridge *next_bridge;
+};
+
+struct mtk_hdmi *hdmi_ctx_from_bridge(struct drm_bridge *b);
+int mtk_hdmi_read(struct mtk_hdmi *hdmi, u32 offset, u32 *val);
+void mtk_hdmi_write(struct mtk_hdmi *hdmi, u32 offset, u32 val);
+void mtk_hdmi_clear_bits(struct mtk_hdmi *hdmi, u32 offset, u32 bits);
+void mtk_hdmi_set_bits(struct mtk_hdmi *hdmi, u32 offset, u32 bits);
+void mtk_hdmi_mask(struct mtk_hdmi *hdmi, u32 offset, u32 val, u32 mask);
+int mtk_hdmi_setup_spd_infoframe(struct mtk_hdmi *hdmi, u8 *buffer, size_t bufsz,
+				 const char *vendor, const char *product);
+void mtk_hdmi_send_infoframe(struct mtk_hdmi *hdmi, u8 *buffer_spd, size_t bufsz_spd,
+			     u8 *buffer_avi, size_t bufsz_avi, struct drm_display_mode *mode);
+int mtk_hdmi_get_all_clk(struct mtk_hdmi *hdmi, struct device_node *np,
+			 const char *const *clk_names, size_t num_clocks);
+struct edid *mtk_hdmi_bridge_get_edid(struct drm_bridge *bridge,
+				      struct drm_connector *connector);
+bool mtk_hdmi_bridge_mode_fixup(struct drm_bridge *bridge,
+				const struct drm_display_mode *mode,
+				struct drm_display_mode *adjusted_mode);
+void mtk_hdmi_bridge_mode_set(struct drm_bridge *bridge,
+			      const struct drm_display_mode *mode,
+			      const struct drm_display_mode *adjusted_mode);
+int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
+			    struct platform_device *pdev, const char *const *clk_names, size_t num_clocks);
+int mtk_drm_hdmi_probe(struct platform_device *pdev);
+int mtk_drm_hdmi_remove(struct platform_device *pdev);
+
+#endif //_MTK_HDMI_COMMON_H

-- 
b4 0.10.0-dev
