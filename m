Return-Path: <linux-clk+bounces-24631-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FCEB01C8E
	for <lists+linux-clk@lfdr.de>; Fri, 11 Jul 2025 14:59:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91A9A1CA6BF7
	for <lists+linux-clk@lfdr.de>; Fri, 11 Jul 2025 12:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC0F32D77EB;
	Fri, 11 Jul 2025 12:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iQYQg+wI"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922A02D321A
	for <linux-clk@vger.kernel.org>; Fri, 11 Jul 2025 12:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752238689; cv=none; b=gZGwtl4g7TUft66c/mBvTpx1hzUlYaKvbFniv2Xf7Iuca/qJNJZLertjLu2XIH7U9fyyGuZ+LEapIOQXWUvkm8AtZdn4irTTvpkg4Bgm3W8eylpDTKLgkmjecIVNO6+W3jGvUe+YIS4kgDXlcVwtVUX3Feb0viWS+koDpQOTbA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752238689; c=relaxed/simple;
	bh=To9B79pjzTs97+rwcXFy/RcluLp9uY/YJ8eCnN9bojk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pkePMdzL0bClz9kp9doHWioP4l+zfwzzRW3bEmEE1xLWyfIIOfWudNRP8ZbVecEUEqfcCXoLabK76qhDnh0VJX7VvHijfmT3pyNEhevTrupygDi3dnfLCsWu4bJzBQHAp5cwpbVTPQlhiTBDwNV/UjdAqGR1xuKE7z0nqTaeNEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iQYQg+wI; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-3a6e2d85705so1376519f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 11 Jul 2025 05:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752238685; x=1752843485; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NxOV0p0KBFjfV7FvPLfaV0BWlnIbJTZsmWur+IdWrfU=;
        b=iQYQg+wIJAjC0Nc9h2G2dbg5JXg5J2kJv5TmeEEu4xjVwbOmG26i07ah7jU4sr1dN0
         N+xndZ4hbXlXFWOt+/E0gYBCFNkhW9a/OiGNu1rwM+oXbCAcR/hu+gnEFqaiecDpHr0T
         Fk04CBXVpKLVbqpQBNxID4/COX7vuQ43PCFeb8qy4qQcobW6Wle5Mgsfo3Zn5cqn6J6d
         BoWb3aE/7tEKrEUQOUypgRzPMhf0vhaxI3iqysWcLrT28taM4Wvc+wXFIzV9etOUgaKc
         AQsh2x6hjpfcRuq89p9L/ryljKBGQkzPNntpQkOpG2CQV5vC2+hNCWKWr2pI8i+0VSCC
         0GQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752238685; x=1752843485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NxOV0p0KBFjfV7FvPLfaV0BWlnIbJTZsmWur+IdWrfU=;
        b=i4c+yTYnTDLeaVp7CSJ+C4Gk3zQl+MG3PfbB1RgVKk+BVTyNwEQWZLpvVdW1C7ysDy
         yXNyHkJKD1uCnw8GgWB05PSo0XtLNoQqNrZrEm173LXU8fiiA/+VPD6jG9yM0bc9Dp+O
         kFoniFut/PZz4YasDQizj8pKyCt98J44LTPG8gaXT5k7Pd47mgCw29UesxB+ZegahDJH
         q4/m7TQkMkM1Uf0t39rRs7P8H6sdVHM8Y1lkj6l75+xiMSVGgh+5ydatz/cl4qulCcXz
         RDzebv9BxdTURUbcUpCk5cV3u4pin0HSn1FkQpflqRXBbWg7kXdL8H5QDmgnd2P3myy4
         67gg==
X-Forwarded-Encrypted: i=1; AJvYcCULPaDHPUkvkBxL9Eccy3TZTbdcOAXHyeNswxy8PgfyurrYWWo6vPFv/F4iw0ndCVf0xxgs0odXdZI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1Y6qXa9M6vcVi/aD5SiMhf97OpoZCOmC2i2YxhBxbtUDEtSQI
	vs+X1jVSlPxQKrChS4/6xHqjNrwEtw58oPoP1YEfmPsU3VbdenVjhmwzA+YL5nhPPJk=
X-Gm-Gg: ASbGncvu+QDQLa2JpTBeSZIEBBK0+d0rlDPVQv6bi/rUNR3QunVxbK0mp2VByQ53w5S
	nNpCGrf8Ow6K45EIlq49jvkf9e2pJu5p0QkITOuul448N2RY5auGCCqEDqo3NBi46t/yhCDrjtJ
	mmZe7b1GYKrGDJWJc6LyiUnaceO54uXDu9UrOGz7B2itPQxye9qMrAYeAqrpIrIAFNg1UMuXxuT
	SNtBfnJNtvQ/9eRmKB7g/EX27Sm5obFHl66MOlRqDfWb4P26B1/CNRJ3FAQnHazdb0Sn9ZLpDjl
	Bs95Achj3UwLuqFmPaw9iAFj22MNe6B5u+wgYBpf4B1uSeaYAWAzhCmqa70bmvts+4gDqCcOPnk
	PKebo954+xObKFOdw8kt98mEhXhm1JHUYisuQLbL5xtP+p5StyatR+6EJy3k5f0nlctHeKwEUIs
	o=
X-Google-Smtp-Source: AGHT+IHPs5XgXVmwdYoggiTA87bB+BBoPr06nFNeitT493zwuTyRqw4TpBu6ZSlMPQzZN3G0gatZWg==
X-Received: by 2002:a05:6000:26ce:b0:3a5:1410:71c0 with SMTP id ffacd0b85a97d-3b5f35783a0mr2076333f8f.38.1752238684539;
        Fri, 11 Jul 2025 05:58:04 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc1f70sm4373648f8f.27.2025.07.11.05.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 05:58:04 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 11 Jul 2025 13:57:56 +0100
Subject: [PATCH v7 04/15] media: qcom: camss: Add support for PHY API
 devices
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-4-0bc5da82f526@linaro.org>
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
In-Reply-To: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14021;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=To9B79pjzTs97+rwcXFy/RcluLp9uY/YJ8eCnN9bojk=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBocQpTuQdzeSX492loN7vBsSIGRl2bfnqreLHNi
 D/ytAF5KqyJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaHEKUwAKCRAicTuzoY3I
 OnpSD/9NrnHXBgB9/zf6EuCVaYdmT2pChkIy1kya3VNMrgH/7roF9v+7/oWbWzYc+sx42DMy3tO
 bSGdmIYvv23HT5JQwD8oS8fqM5DAGv8gQsASpbTqwLIMKQ0eTuNHEy2Ube95U3LUkU4JKnDImC5
 6B8P8NJ3I6tzdYWlLH/+ocr0HJEJG0kyVtMJip2NQnWRsttC13uGpVqIJSmoc4fk/Pmqs8hHppK
 Vxup5uczZBcagMrsWjUpsclt80mGCFsMiC+FcARVag1zIJo8u3gssuRZMIDIPkrCsaPPg+5n9Do
 ViymBauE+uPJX/GO/ntWl0Ec64ztpsTWxUUQAtr+3uHFKDLAa3pY7VAwMS1kWkIAFB1DIlkQ5S2
 cYM/L3EsH75uTTrwinKqp8p4+ndp4Eh+pcMjKaZzcfDOA0Zvw5u669GBLlYv0vIrpyJCsLPa43g
 tLGbpDguTAy70xRwV4haErGysoVcU6KR6rxFSAe4agKCZPQRdj98PO+6pahh6AumYzGzML8vsDu
 WFvjdkpMBVbB+B8mhHYnpJNIQKmUjN9lQgaJM3j8py1dnFBkipa//y8MmBd385x9MO/oxyfBIvv
 LPvFFUpp5GfukWo3cJ9gpn+I6VqB8dfP4bmFZ0V5KlrYapAP5r3aWxHtPFfW0P4M42Bz5KYp0Qc
 AE1DT09VcAumTrQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add the ability to use a PHY pointer which interacts with the standard PHY
API.

In the first instance the code will try to use the new PHY interface. If no
PHYs are present in the DT then the legacy method will be attempted.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/Kconfig        |   1 +
 drivers/media/platform/qcom/camss/camss-csiphy.c | 157 ++++++++++++++++++++---
 drivers/media/platform/qcom/camss/camss-csiphy.h |   7 +
 drivers/media/platform/qcom/camss/camss.c        |  56 ++++++--
 4 files changed, 194 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/platform/qcom/camss/Kconfig
index 4eda48cb1adf049a7fb6cb59b9da3c0870fe57f4..1edc5e5a1829e033812bbadfa0de00625fd0c93a 100644
--- a/drivers/media/platform/qcom/camss/Kconfig
+++ b/drivers/media/platform/qcom/camss/Kconfig
@@ -7,3 +7,4 @@ config VIDEO_QCOM_CAMSS
 	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_SG
 	select V4L2_FWNODE
+	select PHY_QCOM_MIPI_CSI2
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 2de97f58f9ae4f91e8bba39dcadf92bea8cf6f73..185a51aa73d102b9555e550d8041c25c8adf9af8 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -13,6 +13,7 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
+#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <media/media-entity.h>
@@ -131,10 +132,10 @@ static u8 csiphy_get_bpp(const struct csiphy_format_info *formats,
 }
 
 /*
- * csiphy_set_clock_rates - Calculate and set clock rates on CSIPHY module
+ * csiphy_set_clock_rates_legacy - Calculate and set clock rates on CSIPHY module
  * @csiphy: CSIPHY device
  */
-static int csiphy_set_clock_rates(struct csiphy_device *csiphy)
+static int csiphy_set_clock_rates_legacy(struct csiphy_device *csiphy)
 {
 	struct device *dev = csiphy->camss->dev;
 	s64 link_freq;
@@ -200,7 +201,7 @@ static int csiphy_set_clock_rates(struct csiphy_device *csiphy)
  *
  * Return 0 on success or a negative error code otherwise
  */
-static int csiphy_set_power(struct v4l2_subdev *sd, int on)
+static int csiphy_set_power_legacy(struct v4l2_subdev *sd, int on)
 {
 	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
 	struct device *dev = csiphy->camss->dev;
@@ -219,7 +220,7 @@ static int csiphy_set_power(struct v4l2_subdev *sd, int on)
 			return ret;
 		}
 
-		ret = csiphy_set_clock_rates(csiphy);
+		ret = csiphy_set_clock_rates_legacy(csiphy);
 		if (ret < 0) {
 			regulator_bulk_disable(csiphy->num_supplies,
 					       csiphy->supplies);
@@ -254,7 +255,7 @@ static int csiphy_set_power(struct v4l2_subdev *sd, int on)
 }
 
 /*
- * csiphy_stream_on - Enable streaming on CSIPHY module
+ * csiphy_stream_on_legacy - Enable streaming on CSIPHY module
  * @csiphy: CSIPHY device
  *
  * Helper function to enable streaming on CSIPHY module.
@@ -262,7 +263,7 @@ static int csiphy_set_power(struct v4l2_subdev *sd, int on)
  *
  * Return 0 on success or a negative error code otherwise
  */
-static int csiphy_stream_on(struct csiphy_device *csiphy)
+static int csiphy_stream_on_legacy(struct csiphy_device *csiphy)
 {
 	struct csiphy_config *cfg = &csiphy->cfg;
 	s64 link_freq;
@@ -300,6 +301,63 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
 	return 0;
 }
 
+/*
+ * eam_off - Disable streaming on CSIPHY module
+ * @csiphy: CSIPHY device
+ *
+ * Helper function to disable streaming on CSIPHY module
+ */
+static void csiphy_stream_off_legacy(struct csiphy_device *csiphy)
+{
+	csiphy->res->hw_ops->lanes_disable(csiphy, &csiphy->cfg);
+}
+
+/*
+ * csiphy_stream_on - Enable streaming on CSIPHY module
+ * @csiphy: CSIPHY device
+ *
+ * Helper function to enable streaming on CSIPHY module.
+ * Main configuration of CSIPHY module is also done here.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int csiphy_stream_on(struct csiphy_device *csiphy)
+{
+	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
+				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
+	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
+	struct phy_configure_opts_mipi_dphy *dphy_cfg;
+	union phy_configure_opts dphy_opts = { 0 };
+	struct device *dev = csiphy->camss->dev;
+	s64 link_freq;
+	int ret;
+
+	dphy_cfg = &dphy_opts.mipi_dphy;
+
+	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
+
+	if (link_freq < 0) {
+		dev_err(dev,
+			"Cannot get CSI2 transmitter's link frequency\n");
+		return -EINVAL;
+	}
+
+	phy_mipi_dphy_get_default_config_for_hsclk(link_freq, num_lanes, dphy_cfg);
+
+	phy_set_mode(csiphy->phy, PHY_MODE_MIPI_DPHY);
+
+	ret = phy_configure(csiphy->phy, &dphy_opts);
+	if (ret) {
+		dev_err(dev, "failed to configure MIPI D-PHY\n");
+		goto error;
+	}
+
+	return phy_power_on(csiphy->phy);
+
+error:
+	return ret;
+}
+
 /*
  * csiphy_stream_off - Disable streaming on CSIPHY module
  * @csiphy: CSIPHY device
@@ -308,9 +366,28 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
  */
 static void csiphy_stream_off(struct csiphy_device *csiphy)
 {
-	csiphy->res->hw_ops->lanes_disable(csiphy, &csiphy->cfg);
+	phy_power_off(csiphy->phy);
 }
 
+/*
+ * csiphy_set_stream - Enable/disable streaming on CSIPHY module
+ * @sd: CSIPHY V4L2 subdevice
+ * @enable: Requested streaming state
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int csiphy_set_stream_legacy(struct v4l2_subdev *sd, int enable)
+{
+	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
+	int ret = 0;
+
+	if (enable)
+		ret = csiphy_stream_on_legacy(csiphy);
+	else
+		csiphy_stream_off_legacy(csiphy);
+
+	return ret;
+}
 
 /*
  * csiphy_set_stream - Enable/disable streaming on CSIPHY module
@@ -568,16 +645,16 @@ static bool csiphy_match_clock_name(const char *clock_name, const char *format,
 }
 
 /*
- * msm_csiphy_subdev_init - Initialize CSIPHY device structure and resources
+ * msm_csiphy_subdev_init_legacy - Initialize CSIPHY device structure and resources
  * @csiphy: CSIPHY device
  * @res: CSIPHY module resources table
  * @id: CSIPHY module id
  *
  * Return 0 on success or a negative error code otherwise
  */
-int msm_csiphy_subdev_init(struct camss *camss,
-			   struct csiphy_device *csiphy,
-			   const struct camss_subdev_resources *res, u8 id)
+int msm_csiphy_subdev_init_legacy(struct camss *camss,
+				  struct csiphy_device *csiphy,
+				  const struct camss_subdev_resources *res, u8 id)
 {
 	struct device *dev = camss->dev;
 	struct platform_device *pdev = to_platform_device(dev);
@@ -715,6 +792,43 @@ int msm_csiphy_subdev_init(struct camss *camss,
 	return ret;
 }
 
+/*
+ * msm_csiphy_subdev_init - Initialize CSIPHY device structure and resources
+ * @csiphy: CSIPHY device
+ * @res: CSIPHY module resources table
+ * @id: CSIPHY module id
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+int msm_csiphy_subdev_init(struct camss *camss,
+			   struct csiphy_device *csiphy,
+			   const struct camss_subdev_resources *res, u8 id)
+{
+	struct device *dev = camss->dev;
+	int ret;
+
+	csiphy->camss = camss;
+	csiphy->id = id;
+	csiphy->cfg.combo_mode = 0;
+	csiphy->res = &res->csiphy;
+
+	snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csiphy%d",
+		 csiphy->id);
+
+	csiphy->phy = devm_phy_get(dev, csiphy->name);
+
+	if (IS_ERR(csiphy->phy)) {
+		dev_err(dev, "failed to get phy %s %d\n", csiphy->name, ret);
+		return PTR_ERR(csiphy->phy);
+	}
+
+	ret = phy_init(csiphy->phy);
+	if (ret)
+		dev_err(dev, "phy %s init fail %d\n", csiphy->name, ret);
+
+	return ret;
+}
+
 /*
  * csiphy_link_setup - Setup CSIPHY connections
  * @entity: Pointer to media entity structure
@@ -749,8 +863,12 @@ static int csiphy_link_setup(struct media_entity *entity,
 	return 0;
 }
 
-static const struct v4l2_subdev_core_ops csiphy_core_ops = {
-	.s_power = csiphy_set_power,
+static const struct v4l2_subdev_core_ops csiphy_core_ops_legacy = {
+	.s_power = csiphy_set_power_legacy,
+};
+
+static const struct v4l2_subdev_video_ops csiphy_video_ops_legacy = {
+	.s_stream = csiphy_set_stream_legacy,
 };
 
 static const struct v4l2_subdev_video_ops csiphy_video_ops = {
@@ -764,8 +882,13 @@ static const struct v4l2_subdev_pad_ops csiphy_pad_ops = {
 	.set_fmt = csiphy_set_format,
 };
 
+static const struct v4l2_subdev_ops csiphy_v4l2_ops_legacy = {
+	.core = &csiphy_core_ops_legacy,
+	.video = &csiphy_video_ops_legacy,
+	.pad = &csiphy_pad_ops,
+};
+
 static const struct v4l2_subdev_ops csiphy_v4l2_ops = {
-	.core = &csiphy_core_ops,
 	.video = &csiphy_video_ops,
 	.pad = &csiphy_pad_ops,
 };
@@ -794,7 +917,11 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
 	struct device *dev = csiphy->camss->dev;
 	int ret;
 
-	v4l2_subdev_init(sd, &csiphy_v4l2_ops);
+	if (IS_ERR(csiphy->phy))
+		v4l2_subdev_init(sd, &csiphy_v4l2_ops_legacy);
+	else
+		v4l2_subdev_init(sd, &csiphy_v4l2_ops);
+
 	sd->internal_ops = &csiphy_v4l2_internal_ops;
 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d",
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 895f80003c441dcacf98435f91567f90afa29279..48398c331fe1481d32bd29d03410e85b03f0f7aa 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -12,6 +12,7 @@
 
 #include <linux/clk.h>
 #include <linux/interrupt.h>
+#include <linux/phy.h>
 #include <media/media-entity.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-mediabus.h>
@@ -94,6 +95,7 @@ struct csiphy_device_regs {
 
 struct csiphy_device {
 	struct camss *camss;
+	struct phy *phy;
 	u8 id;
 	struct v4l2_subdev subdev;
 	struct media_pad pads[MSM_CSIPHY_PADS_NUM];
@@ -101,6 +103,7 @@ struct csiphy_device {
 	void __iomem *base_clk_mux;
 	u32 irq;
 	char irq_name[30];
+	char name[16];
 	struct camss_clock *clock;
 	bool *rate_set;
 	int nclocks;
@@ -115,6 +118,10 @@ struct csiphy_device {
 
 struct camss_subdev_resources;
 
+int msm_csiphy_subdev_init_legacy(struct camss *camss,
+				  struct csiphy_device *csiphy,
+				  const struct camss_subdev_resources *res, u8 id);
+
 int msm_csiphy_subdev_init(struct camss *camss,
 			   struct csiphy_device *csiphy,
 			   const struct camss_subdev_resources *res, u8 id);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c8103f8b754a29a63e32bb7bc213bfe14b4e0748..1817fa7f922b3b30168655bffbcd629feeec167a 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3092,18 +3092,40 @@ static int camss_init_subdevices(struct camss *camss)
 {
 	struct platform_device *pdev = to_platform_device(camss->dev);
 	const struct camss_resources *res = camss->res;
+	struct device_node *phy_np;
 	unsigned int i;
 	int ret;
 
 	for (i = 0; i < camss->res->csiphy_num; i++) {
-		ret = msm_csiphy_subdev_init(camss, &camss->csiphy[i],
-					     &res->csiphy_res[i],
-					     res->csiphy_res[i].csiphy.id);
-		if (ret < 0) {
-			dev_err(camss->dev,
-				"Failed to init csiphy%d sub-device: %d\n",
-				i, ret);
-			return ret;
+		phy_np = of_parse_phandle(pdev->dev.of_node, "phys", i);
+		if (phy_np && of_device_is_available(phy_np)) {
+			ret = msm_csiphy_subdev_init(camss, &camss->csiphy[i],
+						     &res->csiphy_res[i],
+						     res->csiphy_res[i].csiphy.id);
+			if (ret < 0) {
+				dev_err(camss->dev,
+					"Failed to init csiphy%d sub-device: %d\n",
+					i, ret);
+				return ret;
+			}
+		}
+	}
+
+	if (!phy_np) {
+		if (!res->legacy_phy)
+			return -ENODEV;
+
+		for (i = 0; i < camss->res->csiphy_num; i++) {
+			ret = msm_csiphy_subdev_init_legacy(camss, &camss->csiphy[i],
+							    &res->csiphy_res[i],
+							    res->csiphy_res[i].csiphy.id);
+			if (ret < 0) {
+				dev_err(camss->dev,
+					"Failed to init csiphy%d sub-device: %d\n",
+					i, ret);
+				return ret;
+			}
+			camss->csiphy[i].phy = ERR_PTR(-ENODEV);
 		}
 	}
 
@@ -3181,6 +3203,9 @@ static int camss_link_entities(struct camss *camss)
 
 	for (i = 0; i < camss->res->csiphy_num; i++) {
 		for (j = 0; j < camss->res->csid_num; j++) {
+			if (!camss->csiphy[i].phy)
+				continue;
+
 			ret = media_create_pad_link(&camss->csiphy[i].subdev.entity,
 						    MSM_CSIPHY_PAD_SRC,
 						    &camss->csid[j].subdev.entity,
@@ -3290,6 +3315,9 @@ static int camss_register_entities(struct camss *camss)
 	int ret;
 
 	for (i = 0; i < camss->res->csiphy_num; i++) {
+		if (!camss->csiphy[i].phy)
+			continue;
+
 		ret = msm_csiphy_register_entity(&camss->csiphy[i],
 						 &camss->v4l2_dev);
 		if (ret < 0) {
@@ -3345,8 +3373,10 @@ static int camss_register_entities(struct camss *camss)
 
 	i = camss->res->csiphy_num;
 err_reg_csiphy:
-	for (i--; i >= 0; i--)
-		msm_csiphy_unregister_entity(&camss->csiphy[i]);
+	for (i--; i >= 0; i--) {
+		if (camss->csiphy[i].phy)
+			msm_csiphy_unregister_entity(&camss->csiphy[i]);
+	}
 
 	return ret;
 }
@@ -3361,8 +3391,10 @@ static void camss_unregister_entities(struct camss *camss)
 {
 	unsigned int i;
 
-	for (i = 0; i < camss->res->csiphy_num; i++)
-		msm_csiphy_unregister_entity(&camss->csiphy[i]);
+	for (i = 0; i < camss->res->csiphy_num; i++) {
+		if (camss->csiphy[i].phy)
+			msm_csiphy_unregister_entity(&camss->csiphy[i]);
+	}
 
 	for (i = 0; i < camss->res->csid_num; i++)
 		msm_csid_unregister_entity(&camss->csid[i]);

-- 
2.49.0


