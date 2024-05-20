Return-Path: <linux-clk+bounces-7183-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC428C994D
	for <lists+linux-clk@lfdr.de>; Mon, 20 May 2024 09:30:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D03801F21A72
	for <lists+linux-clk@lfdr.de>; Mon, 20 May 2024 07:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC3B200C7;
	Mon, 20 May 2024 07:29:36 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CFC1BDCF;
	Mon, 20 May 2024 07:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716190176; cv=none; b=GzAUIuMtT0Xpp2vRxt7qga3LXsARrTrzosMPRtXhdeBwOqE0g+DmdySmNSamzvKwjZrs58itMvWr04hiHrqEVmpyhTdRJQERCcIsXbsrT/kzPYzjPAGyKWBMNbh1RJvENFLXSFRXvdH+uGESdy9RzAh7SN4YsFEHlTU9DWeAu20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716190176; c=relaxed/simple;
	bh=jvPEQoMEoQueVYrDTidmQI5uVfBZN2H/j3C1fF+vxKk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References; b=CemwMMlvOYRnyOfW9Mb0X78b08Y/XkSVpv2cHJjNXEOprhF9hTBjzt08uNqeLc9PzbgUGxF4bpj1j6QPJqKAjFFKKDDSmggijYHm+enhkPlvDqJndT6ofG9yLux96Kkn9iA37YdPh9864ehGw91yXuBb6xMzlkr2G6UF5pD+2qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4ACC620194A;
	Mon, 20 May 2024 09:29:27 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B37E2201952;
	Mon, 20 May 2024 09:29:26 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 5E5D7181D0F8;
	Mon, 20 May 2024 15:29:24 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: abelvesa@kernel.org,
	peng.fan@nxp.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	marex@denx.de,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de,
	shengjiu.wang@gmail.com
Subject: [PATCH v4 2/5] clk: imx: clk-audiomix: Add reset controller
Date: Mon, 20 May 2024 15:09:20 +0800
Message-Id: <1716188963-16175-3-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1716188963-16175-1-git-send-email-shengjiu.wang@nxp.com>
References: <1716188963-16175-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Audiomix block control can be a reset controller for
Enhanced Audio Return Channel (EARC), which is one of
modules in this audiomix subsystem.

The reset controller is supported by the auxiliary device
framework.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 drivers/clk/imx/Kconfig               |  1 +
 drivers/clk/imx/clk-imx8mp-audiomix.c | 61 +++++++++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig
index 6da0fba68225..9edfb030bea9 100644
--- a/drivers/clk/imx/Kconfig
+++ b/drivers/clk/imx/Kconfig
@@ -81,6 +81,7 @@ config CLK_IMX8MP
 	tristate "IMX8MP CCM Clock Driver"
 	depends on ARCH_MXC || COMPILE_TEST
 	select MXC_CLK
+	select AUXILIARY_BUS
 	help
 	    Build the driver for i.MX8MP CCM Clock Driver
 
diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
index b381d6f784c8..d2eaabe431cd 100644
--- a/drivers/clk/imx/clk-imx8mp-audiomix.c
+++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2022 Marek Vasut <marex@denx.de>
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/clk-provider.h>
 #include <linux/device.h>
 #include <linux/io.h>
@@ -217,6 +218,62 @@ struct clk_imx8mp_audiomix_priv {
 	struct clk_hw_onecell_data clk_data;
 };
 
+#if IS_ENABLED(CONFIG_RESET_CONTROLLER)
+
+static void clk_imx8mp_audiomix_reset_unregister_adev(void *_adev)
+{
+	struct auxiliary_device *adev = _adev;
+
+	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
+}
+
+static void clk_imx8mp_audiomix_reset_adev_release(struct device *dev)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+
+	kfree(adev);
+}
+
+static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev,
+							 struct clk_imx8mp_audiomix_priv *priv)
+{
+	struct auxiliary_device *adev;
+	int ret;
+
+	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
+	if (!adev)
+		return -ENOMEM;
+
+	adev->name = "reset";
+	adev->dev.parent = dev;
+	adev->dev.release = clk_imx8mp_audiomix_reset_adev_release;
+
+	ret = auxiliary_device_init(adev);
+	if (ret) {
+		kfree(adev);
+		return ret;
+	}
+
+	ret = auxiliary_device_add(adev);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		kfree(adev);
+		return ret;
+	}
+
+	return devm_add_action_or_reset(dev, clk_imx8mp_audiomix_reset_unregister_adev, adev);
+}
+
+#else /* !CONFIG_RESET_CONTROLLER */
+
+static int clk_imx8mp_audiomix_reset_controller_register(struct clk_imx8mp_audiomix_priv *priv)
+{
+	return 0;
+}
+
+#endif /* !CONFIG_RESET_CONTROLLER */
+
 static void clk_imx8mp_audiomix_save_restore(struct device *dev, bool save)
 {
 	struct clk_imx8mp_audiomix_priv *priv = dev_get_drvdata(dev);
@@ -337,6 +394,10 @@ static int clk_imx8mp_audiomix_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_clk_register;
 
+	ret = clk_imx8mp_audiomix_reset_controller_register(dev, priv);
+	if (ret)
+		goto err_clk_register;
+
 	pm_runtime_put_sync(dev);
 	return 0;
 
-- 
2.34.1


