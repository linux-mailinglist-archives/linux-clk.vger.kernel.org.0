Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BFA01F32B8
	for <lists+linux-clk@lfdr.de>; Tue,  9 Jun 2020 05:47:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727776AbgFIDrE (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 8 Jun 2020 23:47:04 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:13531 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726918AbgFIDrD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 Jun 2020 23:47:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591674419; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=+hapYYYEBdqRwOeU7Y/EL9Sq2uLQqVW5U1JYPjx9mME=; b=j+UVGsZf/cXK+/zkv3jb5b4h5SHDkYlhWs39Mh+X2VnXbdSkfsHrM7az5lE5QUkSTJBr+Dl0
 J/v2VeDPSwgnOAPYp1XGyWpwcHIHzok8u0VFiPgttQ2hI9JeY/BGVsW3XmMb8XRYh8m0IhQ7
 dB5+B2VhBOGxAmRsftPZ6g1v4JM=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI4MzlhZiIsICJsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5edf063260667f2e2fd1c8d0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Jun 2020 03:46:58
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 88395C43387; Tue,  9 Jun 2020 03:46:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from tanmshah-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tanmay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 47697C433C6;
        Tue,  9 Jun 2020 03:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 47697C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tanmay@codeaurora.org
From:   Tanmay Shah <tanmay@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     swboyd@chromium.org, sam@ravnborg.org, seanpaul@chromium.org,
        freedreno@lists.freedesktop.org, chandanu@codeaurora.org,
        robdclark@gmail.com, abhinavk@codeaurora.org,
        nganji@codeaurora.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>
Subject: [PATCH v6 4/5] drm/msm/dp: add support for DP PLL driver
Date:   Mon,  8 Jun 2020 20:46:23 -0700
Message-Id: <20200609034623.10844-1-tanmay@codeaurora.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Chandan Uddaraju <chandanu@codeaurora.org>

Add the needed DP PLL specific files to support
display port interface on msm targets.

The DP driver calls the DP PLL driver registration.
The DP driver sets the link and pixel clock sources.

Changes in v2:
-- Update copyright markings on all relevant files.
-- Use DRM_DEBUG_DP for debug msgs.

Changes in v4:
-- Update the DP link clock provider names

Changes in V5:
-- Addressed comments from Stephen Boyd, Rob clark.

Changes in V6:
-- Remove PLL as separate driver and include PLL as DP module
-- Remove redundant clock parsing from PLL module and make DP as
   clock provider
-- Map USB3 DPCOM and PHY IO using hardcoded register address and
   move mapping form parser to PLL module
-- Access DP PHY modules from same base address using offsets instead of
   deriving base address of individual module from device tree.
-- Remove dp_pll_10nm_util.c and include its functionality in
   dp_pll_10nm.c
-- Introduce new data structures private to PLL module

Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
Signed-off-by: Vara Reddy <varar@codeaurora.org>
Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
---
 drivers/gpu/drm/msm/Kconfig             |  13 +
 drivers/gpu/drm/msm/Makefile            |   3 +
 drivers/gpu/drm/msm/dp/dp_catalog.c     |  64 ++-
 drivers/gpu/drm/msm/dp/dp_display.c     |  17 +-
 drivers/gpu/drm/msm/dp/dp_display.h     |   3 +
 drivers/gpu/drm/msm/dp/dp_parser.c      |  51 +-
 drivers/gpu/drm/msm/dp/dp_parser.h      |   9 +-
 drivers/gpu/drm/msm/dp/dp_pll.c         |  93 ++++
 drivers/gpu/drm/msm/dp/dp_pll.h         |  59 +++
 drivers/gpu/drm/msm/dp/dp_pll_10nm.c    | 903 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_pll_private.h | 103 ++++
 drivers/gpu/drm/msm/dp/dp_power.c       |  10 +
 drivers/gpu/drm/msm/dp/dp_power.h       |  71 ++-
 drivers/gpu/drm/msm/dp/dp_reg.h         |  16 +
 14 files changed, 1349 insertions(+), 66 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/dp/dp_pll.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_pll.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_pll_10nm.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_pll_private.h

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index ea3c4d0..43544c1 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -65,6 +65,19 @@ config DRM_MSM_DP
 	  display support is enabled through this config option. It can
 	  be primary or secondary display on device.
 
+config DRM_MSM_DP_PLL
+	bool "Enable DP PLL driver in MSM DRM"
+	depends on DRM_MSM_DP && COMMON_CLK
+	help
+	  Choose this option to enable DP PLL driver which provides DP
+	  source clocks under common clock framework.
+
+config DRM_MSM_DP_10NM_PLL
+	bool "Enable DP 10nm PLL driver in MSM DRM (used by SDM845)"
+	depends on DRM_MSM_DP_PLL
+	help
+	  Choose this option if DP PLL on SDM845 is used on the platform.
+
 config DRM_MSM_DSI
 	bool "Enable DSI support in MSM DRM driver"
 	depends on DRM_MSM
diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index af868e7..af259c6 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -140,4 +140,7 @@ msm-$(CONFIG_DRM_MSM_DSI_14NM_PHY) += dsi/pll/dsi_pll_14nm.o
 msm-$(CONFIG_DRM_MSM_DSI_10NM_PHY) += dsi/pll/dsi_pll_10nm.o
 endif
 
+msm-$(CONFIG_DRM_MSM_DP_PLL)+= dp/dp_pll.o
+msm-$(CONFIG_DRM_MSM_DP_10NM_PLL)+= dp/dp_pll_10nm.o
+
 obj-$(CONFIG_DRM_MSM)	+= msm.o
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index d02f4eb..2b982f0 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -5,6 +5,7 @@
 
 #define pr_fmt(fmt)	"[drm-dp] %s: " fmt, __func__
 
+#include <linux/rational.h>
 #include <linux/delay.h>
 #include <linux/iopoll.h>
 #include <drm/drm_dp_helper.h>
@@ -134,59 +135,61 @@ static inline void dp_write_ahb(struct dp_catalog_private *catalog,
 	writel(data, catalog->io->dp_controller.base + offset);
 }
 
-static inline u32 dp_read_cc(struct dp_catalog_private *catalog, u32 offset)
-{
-	return readl_relaxed(catalog->io->dp_cc_io.base + offset);
-}
-
 static inline void dp_write_phy(struct dp_catalog_private *catalog,
 			       u32 offset, u32 data)
 {
+	offset += DP_PHY_REG_OFFSET;
 	/*
 	 * To make sure phy reg writes happens before any other operation,
 	 * this function uses writel() instread of writel_relaxed()
 	 */
-	writel(data, catalog->io->phy_io.base + offset);
+	writel(data, catalog->io->phy_reg.base + offset);
 }
 
 static inline u32 dp_read_phy(struct dp_catalog_private *catalog,
 			       u32 offset)
 {
+	offset += DP_PHY_REG_OFFSET;
 	/*
 	 * To make sure phy reg writes happens before any other operation,
 	 * this function uses writel() instread of writel_relaxed()
 	 */
-	return readl_relaxed(catalog->io->phy_io.base + offset);
+	return readl_relaxed(catalog->io->phy_reg.base + offset);
 }
 
 static inline void dp_write_pll(struct dp_catalog_private *catalog,
 			       u32 offset, u32 data)
 {
-	writel_relaxed(data, catalog->io->dp_pll_io.base + offset);
+	offset += DP_PHY_PLL_OFFSET;
+	writel_relaxed(data, catalog->io->phy_reg.base + offset);
 }
 
 static inline void dp_write_ln_tx0(struct dp_catalog_private *catalog,
 			       u32 offset, u32 data)
 {
-	writel_relaxed(data, catalog->io->ln_tx0_io.base + offset);
+	offset += DP_PHY_LN_TX0_OFFSET;
+	writel_relaxed(data, catalog->io->phy_reg.base + offset);
 }
 
 static inline void dp_write_ln_tx1(struct dp_catalog_private *catalog,
 			       u32 offset, u32 data)
 {
-	writel_relaxed(data, catalog->io->ln_tx1_io.base + offset);
+	offset += DP_PHY_LN_TX1_OFFSET;
+	writel_relaxed(data, catalog->io->phy_reg.base + offset);
 }
 
 static inline u32 dp_read_ln_tx0(struct dp_catalog_private *catalog,
 			       u32 offset)
 {
-	return readl_relaxed(catalog->io->ln_tx0_io.base + offset);
+	offset += DP_PHY_LN_TX0_OFFSET;
+	return readl_relaxed(catalog->io->phy_reg.base + offset);
 }
 
 static inline u32 dp_read_ln_tx1(struct dp_catalog_private *catalog,
 			       u32 offset)
 {
-	return readl_relaxed(catalog->io->ln_tx1_io.base + offset);
+	offset += DP_PHY_LN_TX1_OFFSET;
+	return readl_relaxed(catalog->io->phy_reg.base + offset);
 }
 
 static inline void dp_write_usb_cm(struct dp_catalog_private *catalog,
@@ -396,13 +399,16 @@ void dp_catalog_dump_regs(struct dp_catalog *dp_catalog)
 	dump_regs(catalog->io->usb3_dp_com.base, catalog->io->usb3_dp_com.len);
 
 	pr_info("LN TX0 regs\n");
-	dump_regs(catalog->io->ln_tx0_io.base, catalog->io->ln_tx0_io.len);
+	dump_regs(catalog->io->phy_reg.base + DP_PHY_LN_TX0_OFFSET,
+						DP_PHY_LN_TX0_SIZE);
 
 	pr_info("LN TX1 regs\n");
-	dump_regs(catalog->io->ln_tx1_io.base, catalog->io->ln_tx1_io.len);
+	dump_regs(catalog->io->phy_reg.base + DP_PHY_LN_TX1_OFFSET,
+						DP_PHY_LN_TX1_SIZE);
 
 	pr_info("DP PHY regs\n");
-	dump_regs(catalog->io->phy_io.base, catalog->io->phy_io.len);
+	dump_regs(catalog->io->phy_reg.base + DP_PHY_REG_OFFSET,
+						DP_PHY_REG_SIZE);
 }
 
 void dp_catalog_aux_setup(struct dp_catalog *dp_catalog,
@@ -568,17 +574,37 @@ void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
 					bool fixed_nvid)
 {
 	u32 pixel_m, pixel_n;
-	u32 mvid, nvid;
+	u32 mvid, nvid, div, pixel_div = 0, dispcc_input_rate;
 	u32 const nvid_fixed = DP_LINK_CONSTANT_N_VALUE;
 	u32 const link_rate_hbr2 = 540000;
 	u32 const link_rate_hbr3 = 810000;
+	unsigned long den, num;
 
 	struct dp_catalog_private *catalog = container_of(dp_catalog,
 				struct dp_catalog_private, dp_catalog);
 
-	pixel_m = dp_read_cc(catalog, MMSS_DP_PIXEL_M);
-	pixel_n = dp_read_cc(catalog, MMSS_DP_PIXEL_N);
-	DRM_DEBUG_DP("pixel_m=0x%x, pixel_n=0x%x\n", pixel_m, pixel_n);
+	div = dp_read_phy(catalog, REG_DP_PHY_VCO_DIV);
+	div &= 0x03;
+
+	if (div == 0)
+		pixel_div = 6;
+	else if (div == 1)
+		pixel_div = 2;
+	else if (div == 2)
+		pixel_div = 4;
+	else
+		DRM_ERROR("Invalid pixel mux divider\n");
+
+	dispcc_input_rate = (rate * 10) / pixel_div;
+
+	rational_best_approximation(dispcc_input_rate, stream_rate_khz,
+			(unsigned long)(1 << 16) - 1,
+			(unsigned long)(1 << 16) - 1, &den, &num);
+
+	den = ~(den - num);
+	den = den & 0xFFFF;
+	pixel_m = num;
+	pixel_n = den;
 
 	mvid = (pixel_m & 0xFFFF) * 5;
 	nvid = (0xFFFF & (~pixel_n)) + (pixel_m & 0xFFFF);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 58a3d86..033d0e8 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -22,6 +22,7 @@
 #include "dp_ctrl.h"
 #include "dp_display.h"
 #include "dp_drm.h"
+#include "dp_pll.h"
 
 static struct msm_dp *g_dp_display;
 #define HPD_STRING_SIZE 30
@@ -42,6 +43,7 @@ struct dp_display_private {
 
 	struct dp_usbpd   *usbpd;
 	struct dp_parser  *parser;
+	struct msm_dp_pll *pll;
 	struct dp_power   *power;
 	struct dp_catalog *catalog;
 	struct dp_aux     *aux;
@@ -223,7 +225,6 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
 	edid = dp->panel->edid;
 
 	dp->audio_supported = drm_detect_monitor_audio(edid);
-
 	dp_panel_handle_sink_request(dp->panel);
 
 	dp->dp_display.max_pclk_khz = DP_MAX_PIXEL_CLK_KHZ;
@@ -411,6 +412,9 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 	struct dp_panel_in panel_in = {
 		.dev = dev,
 	};
+	struct dp_pll_in pll_in = {
+		.pdev = dp->pdev,
+	};
 
 	/* Callback APIs used for cable status change event */
 	cb->configure  = dp_display_usbpd_configure_cb;
@@ -441,6 +445,17 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 		goto error;
 	}
 
+	pll_in.parser = dp->parser;
+	dp->pll = dp_pll_get(&pll_in);
+	if (IS_ERR_OR_NULL(dp->pll)) {
+		rc = -EINVAL;
+		DRM_ERROR("failed to initialize pll, rc = %d\n", rc);
+		dp->pll = NULL;
+		goto error;
+	}
+
+	dp->parser->pll = dp->pll;
+
 	dp->power = dp_power_get(dp->parser);
 	if (IS_ERR(dp->power)) {
 		rc = PTR_ERR(dp->power);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index dad8610..4c53ed5 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -25,4 +25,7 @@ int dp_display_get_modes(struct msm_dp *dp_display,
 bool dp_display_check_video_test(struct msm_dp *dp_display);
 int dp_display_get_test_bpp(struct msm_dp *dp_display);
 
+void __init msm_dp_pll_driver_register(void);
+void __exit msm_dp_pll_driver_unregister(void);
+
 #endif /* _DP_DISPLAY_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index e1f93f5..24e80bd 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -6,6 +6,7 @@
 #include <linux/of_gpio.h>
 
 #include "dp_parser.h"
+#include "dp_reg.h"
 
 const u8 aux_cfg0_settings[] = {0x20,  0x00};
 const u8 aux_cfg1_settings[] = {0x24, 0x13, 0x23, 0x1d};
@@ -89,11 +90,7 @@ static void dp_parser_unmap_io_resources(struct dp_parser *parser)
 	struct dp_io *io = &parser->io;
 
 	msm_dss_iounmap(&io->dp_controller);
-	msm_dss_iounmap(&io->phy_io);
-	msm_dss_iounmap(&io->ln_tx0_io);
-	msm_dss_iounmap(&io->ln_tx0_io);
-	msm_dss_iounmap(&io->dp_pll_io);
-	msm_dss_iounmap(&io->dp_cc_io);
+	msm_dss_iounmap(&io->phy_reg);
 	msm_dss_iounmap(&io->usb3_dp_com);
 }
 
@@ -117,30 +114,6 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
 		goto err;
 	}
 
-	rc = msm_dss_ioremap_byname(pdev, &io->phy_io, "dp_phy");
-	if (rc) {
-		DRM_ERROR("unable to remap dp PHY resources, rc=%d\n", rc);
-		goto err;
-	}
-
-	rc = msm_dss_ioremap_byname(pdev, &io->ln_tx0_io, "dp_ln_tx0");
-	if (rc) {
-		DRM_ERROR("unable to remap dp TX0 resources, rc=%d\n", rc);
-		goto err;
-	}
-
-	rc = msm_dss_ioremap_byname(pdev, &io->ln_tx1_io, "dp_ln_tx1");
-	if (rc) {
-		DRM_ERROR("unable to remap dp TX1 resources, rc=%d\n", rc);
-		goto err;
-	}
-
-	rc = msm_dss_ioremap_byname(pdev, &io->dp_pll_io, "dp_pll");
-	if (rc) {
-		DRM_ERROR("unable to remap DP PLL resources, rc=%d\n", rc);
-		goto err;
-	}
-
 	return 0;
 err:
 	dp_parser_unmap_io_resources(parser);
@@ -151,25 +124,25 @@ static const char *dp_get_phy_aux_config_property(u32 cfg_type)
 {
 	switch (cfg_type) {
 	case PHY_AUX_CFG0:
-		return "qcom,aux-cfg0-settings";
+		return "aux-cfg0-settings";
 	case PHY_AUX_CFG1:
-		return "qcom,aux-cfg1-settings";
+		return "aux-cfg1-settings";
 	case PHY_AUX_CFG2:
-		return "qcom,aux-cfg2-settings";
+		return "aux-cfg2-settings";
 	case PHY_AUX_CFG3:
-		return "qcom,aux-cfg3-settings";
+		return "aux-cfg3-settings";
 	case PHY_AUX_CFG4:
-		return "qcom,aux-cfg4-settings";
+		return "aux-cfg4-settings";
 	case PHY_AUX_CFG5:
-		return "qcom,aux-cfg5-settings";
+		return "aux-cfg5-settings";
 	case PHY_AUX_CFG6:
-		return "qcom,aux-cfg6-settings";
+		return "aux-cfg6-settings";
 	case PHY_AUX_CFG7:
-		return "qcom,aux-cfg7-settings";
+		return "aux-cfg7-settings";
 	case PHY_AUX_CFG8:
-		return "qcom,aux-cfg8-settings";
+		return "aux-cfg8-settings";
 	case PHY_AUX_CFG9:
-		return "qcom,aux-cfg9-settings";
+		return "aux-cfg9-settings";
 	default:
 		return "unknown";
 	}
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index b99677f..dc24acf 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -12,6 +12,7 @@
 
 #include "dpu_io_util.h"
 #include "msm_drv.h"
+#include "dp_pll.h"
 
 #define DP_LABEL "MDSS DP DISPLAY"
 #define AUX_CFG_LEN	10
@@ -64,17 +65,12 @@ struct dp_display_data {
  * @phy_io: phy's mapped memory address
  * @ln_tx0_io: USB-DP lane TX0's mapped memory address
  * @ln_tx1_io: USB-DP lane TX1's mapped memory address
- * @dp_cc_io: DP cc's mapped memory address
  * @dp_pll_io: DP PLL mapped memory address
  * @usb3_dp_com: USB3 DP PHY combo mapped memory address
  */
 struct dp_io {
 	struct dss_io_data dp_controller;
-	struct dss_io_data phy_io;
-	struct dss_io_data ln_tx0_io;
-	struct dss_io_data ln_tx1_io;
-	struct dss_io_data dp_cc_io;
-	struct dss_io_data dp_pll_io;
+	struct dss_io_data phy_reg;
 	struct dss_io_data usb3_dp_com;
 };
 
@@ -183,6 +179,7 @@ struct dp_parser {
 	struct dp_pinctrl pinctrl;
 	struct dp_io io;
 	struct dp_display_data disp_data;
+	struct msm_dp_pll *pll;
 	const struct dp_regulator_cfg *regulator_cfg;
 	u8 l_map[4];
 	struct dp_aux_cfg aux_cfg[AUX_CFG_LEN];
diff --git a/drivers/gpu/drm/msm/dp/dp_pll.c b/drivers/gpu/drm/msm/dp/dp_pll.c
new file mode 100644
index 0000000..7cd43ed
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_pll.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2016-2020, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/device.h>
+
+#include "dp_parser.h"
+#include "dp_pll.h"
+#include "dp_pll_private.h"
+
+static int dp_pll_get_phy_io(struct dp_parser *parser)
+{
+	struct dp_io *io = &parser->io;
+
+	io->usb3_dp_com.base = ioremap(REG_USB3_DP_COM_REGION_BASE,
+					REG_USB3_DP_COM_REGION_SIZE);
+	if (!io->usb3_dp_com.base) {
+		DRM_ERROR("unable to map USB3 DP COM IO\n");
+		return -EIO;
+	}
+
+	/* ToDo(user): DP PLL and DP PHY will not be part of
+	 * DP driver eventually so for now Hardcode Base and offsets
+	 * of PHY registers so we can remove them from dts and bindings
+	 */
+	io->phy_reg.base = ioremap(REG_DP_PHY_REGION_BASE,
+					REG_DP_PHY_REGION_SIZE);
+	if (!io->phy_reg.base) {
+		DRM_ERROR("DP PHY io region mapping failed\n");
+		return -EIO;
+	}
+	io->phy_reg.len = REG_DP_PHY_REGION_SIZE;
+
+	return 0;
+}
+
+static int msm_dp_pll_init(struct msm_dp_pll *pll,
+			enum msm_dp_pll_type type, int id)
+{
+	struct device *dev = &pll->pdev->dev;
+	int ret = 0;
+
+	switch (type) {
+	case MSM_DP_PLL_10NM:
+		ret = msm_dp_pll_10nm_init(pll, id);
+		break;
+	default:
+		DRM_DEV_ERROR(dev, "%s: Wrong PLL type %d\n", __func__, type);
+		return -ENXIO;
+	}
+
+	if (ret) {
+		DRM_DEV_ERROR(dev, "%s: failed to init DP PLL\n", __func__);
+		return ret;
+	}
+
+	pll->type = type;
+
+	DRM_DEBUG_DP("DP:%d PLL registered", id);
+
+	return ret;
+}
+
+struct msm_dp_pll *dp_pll_get(struct dp_pll_in *pll_in)
+{
+	struct msm_dp_pll *dp_pll;
+	struct dp_parser *parser = pll_in->parser;
+	struct dp_io_pll *pll_io;
+	int ret;
+
+	dp_pll = devm_kzalloc(&pll_in->pdev->dev, sizeof(*dp_pll), GFP_KERNEL);
+	if (!dp_pll)
+		return ERR_PTR(-ENOMEM);
+
+	pll_io = &dp_pll->pll_io;
+	dp_pll->pdev = pll_in->pdev;
+
+	dp_pll_get_phy_io(parser);
+
+	pll_io->pll_base = parser->io.phy_reg.base + DP_PHY_PLL_OFFSET;
+	pll_io->phy_base = parser->io.phy_reg.base + DP_PHY_REG_OFFSET;
+	pll_io->ln_tx0_base = parser->io.phy_reg.base + DP_PHY_LN_TX0_OFFSET;
+	pll_io->ln_tx1_base = parser->io.phy_reg.base + DP_PHY_LN_TX1_OFFSET;
+
+	ret = msm_dp_pll_init(dp_pll, MSM_DP_PLL_10NM, 0);
+	if (ret) {
+		kfree(dp_pll);
+		return ERR_PTR(ret);
+	}
+
+	return dp_pll;
+}
diff --git a/drivers/gpu/drm/msm/dp/dp_pll.h b/drivers/gpu/drm/msm/dp/dp_pll.h
new file mode 100644
index 0000000..ff38fb0
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_pll.h
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2016-2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef __DP_PLL_H
+#define __DP_PLL_H
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "dpu_io_util.h"
+#include "msm_drv.h"
+#include "dp_parser.h"
+
+#define PLL_REG_W(base, offset, data)	\
+				writel((data), (base) + (offset))
+#define PLL_REG_R(base, offset)	readl((base) + (offset))
+
+enum msm_dp_pll_type {
+	MSM_DP_PLL_10NM,
+	MSM_DP_PLL_MAX
+};
+
+struct dp_pll_in {
+	struct platform_device *pdev;
+	struct dp_parser *parser;
+};
+
+struct dp_io_pll {
+	void __iomem *pll_base;
+	void __iomem *phy_base;
+	void __iomem *ln_tx0_base;
+	void __iomem *ln_tx1_base;
+};
+
+struct msm_dp_pll {
+	enum msm_dp_pll_type type;
+	bool		pll_on;
+
+	struct dp_io_pll pll_io;
+
+	/* clock-provider: */
+	struct clk_hw_onecell_data *hw_data;
+
+	struct platform_device *pdev;
+	void *priv;
+
+	/* Pll specific resources like GPIO, power supply, clocks, etc*/
+	struct dss_module_power mp;
+	int (*get_provider)(struct msm_dp_pll *pll,
+			struct clk **link_clk_provider,
+			struct clk **pixel_clk_provider);
+};
+
+struct msm_dp_pll *dp_pll_get(struct dp_pll_in *pll_in);
+
+#endif /* __DP_PLL_H */
diff --git a/drivers/gpu/drm/msm/dp/dp_pll_10nm.c b/drivers/gpu/drm/msm/dp/dp_pll_10nm.c
new file mode 100644
index 0000000..998d659
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_pll_10nm.c
@@ -0,0 +1,903 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2016-2020, The Linux Foundation. All rights reserved.
+ */
+
+/*
+ * Display Port PLL driver block diagram for branch clocks
+ *
+ *              +------------------------------+
+ *              |         DP_VCO_CLK           |
+ *              |                              |
+ *              |    +-------------------+     |
+ *              |    |   (DP PLL/VCO)    |     |
+ *              |    +---------+---------+     |
+ *              |              v               |
+ *              |   +----------+-----------+   |
+ *              |   | hsclk_divsel_clk_src |   |
+ *              |   +----------+-----------+   |
+ *              +------------------------------+
+ *                              |
+ *          +---------<---------v------------>----------+
+ *          |                                           |
+ * +--------v---------+                                 |
+ * |    dp_phy_pll    |                                 |
+ * |     link_clk     |                                 |
+ * +--------+---------+                                 |
+ *          |                                           |
+ *          |                                           |
+ *          v                                           v
+ * Input to DISPCC block                                |
+ * for link clk, crypto clk                             |
+ * and interface clock                                  |
+ *                                                      |
+ *                                                      |
+ *      +--------<------------+-----------------+---<---+
+ *      |                     |                 |
+ * +----v---------+  +--------v-----+  +--------v------+
+ * | vco_divided  |  | vco_divided  |  | vco_divided   |
+ * |    _clk_src  |  |    _clk_src  |  |    _clk_src   |
+ * |              |  |              |  |               |
+ * |divsel_six    |  |  divsel_two  |  |  divsel_four  |
+ * +-------+------+  +-----+--------+  +--------+------+
+ *         |                 |                  |
+ *         v---->----------v-------------<------v
+ *                         |
+ *              +----------+---------+
+ *              |   dp_phy_pll_vco   |
+ *              |       div_clk      |
+ *              +---------+----------+
+ *                        |
+ *                        v
+ *              Input to DISPCC block
+ *              for DP pixel clock
+ *
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/regmap.h>
+#include <linux/iopoll.h>
+
+#include "dp_hpd.h"
+#include "dp_pll.h"
+#include "dp_pll_private.h"
+
+#define NUM_PROVIDED_CLKS		2
+
+#define DP_LINK_CLK_SRC			0
+#define DP_PIXEL_CLK_SRC		1
+
+static struct dp_pll_db *dp_pdb;
+
+static const struct clk_ops dp_10nm_vco_clk_ops = {
+	.recalc_rate = dp_vco_recalc_rate_10nm,
+	.set_rate = dp_vco_set_rate_10nm,
+	.round_rate = dp_vco_round_rate_10nm,
+	.prepare = dp_vco_prepare_10nm,
+	.unprepare = dp_vco_unprepare_10nm,
+};
+
+struct dp_pll_10nm_pclksel {
+	struct clk_hw hw;
+
+	/* divider params */
+	u8 shift;
+	u8 width;
+	u8 flags; /* same flags as used by clk_divider struct */
+
+	struct dp_pll_db *pll;
+};
+
+#define to_pll_10nm_pclksel(_hw) \
+	container_of(_hw, struct dp_pll_10nm_pclksel, hw)
+
+static const struct clk_parent_data disp_cc_parent_data_0[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .fw_name = "dp_phy_pll_link_clk", .name = "dp_phy_pll_link_clk" },
+	{ .fw_name = "dp_phy_pll_vco_div_clk",
+				.name = "dp_phy_pll_vco_div_clk"},
+	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+};
+
+static struct dp_pll_vco_clk dp_vco_clk = {
+	.min_rate = DP_VCO_HSCLK_RATE_1620MHZDIV1000,
+	.max_rate = DP_VCO_HSCLK_RATE_8100MHZDIV1000,
+};
+
+static int dp_pll_mux_set_parent_10nm(struct clk_hw *hw, u8 val)
+{
+	struct dp_pll_10nm_pclksel *pclksel = to_pll_10nm_pclksel(hw);
+	struct dp_pll_db *dp_res = pclksel->pll;
+	struct dp_io_pll *pll_io = &dp_res->base->pll_io;
+	u32 auxclk_div;
+
+	auxclk_div = PLL_REG_R(pll_io->phy_base, REG_DP_PHY_VCO_DIV);
+	auxclk_div &= ~0x03;
+
+	if (val == 0)
+		auxclk_div |= 1;
+	else if (val == 1)
+		auxclk_div |= 2;
+	else if (val == 2)
+		auxclk_div |= 0;
+
+	PLL_REG_W(pll_io->phy_base,
+			REG_DP_PHY_VCO_DIV, auxclk_div);
+	DRM_DEBUG_DP("%s: mux=%d auxclk_div=%x\n", __func__, val, auxclk_div);
+
+	return 0;
+}
+
+static u8 dp_pll_mux_get_parent_10nm(struct clk_hw *hw)
+{
+	u32 auxclk_div = 0;
+	struct dp_pll_10nm_pclksel *pclksel = to_pll_10nm_pclksel(hw);
+	struct dp_pll_db *dp_res = pclksel->pll;
+	struct dp_io_pll *pll_io = &dp_res->base->pll_io;
+	u8 val = 0;
+
+	auxclk_div = PLL_REG_R(pll_io->phy_base, REG_DP_PHY_VCO_DIV);
+	auxclk_div &= 0x03;
+
+	if (auxclk_div == 1) /* Default divider */
+		val = 0;
+	else if (auxclk_div == 2)
+		val = 1;
+	else if (auxclk_div == 0)
+		val = 2;
+
+	DRM_DEBUG_DP("%s: auxclk_div=%d, val=%d\n", __func__, auxclk_div, val);
+
+	return val;
+}
+
+static int dp_pll_clk_mux_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
+{
+	unsigned long rate = 0;
+	int ret = 0;
+
+	rate = clk_get_rate(hw->clk);
+
+	if (rate <= 0) {
+		DRM_ERROR("Rate is not set properly\n");
+		return -EINVAL;
+	}
+
+	req->rate = rate;
+
+	DRM_DEBUG_DP("%s: rate=%ld\n", __func__, req->rate);
+	/* Set the new parent of mux if there is a new valid parent */
+	if (hw->clk && req->best_parent_hw->clk) {
+		ret = clk_set_parent(hw->clk, req->best_parent_hw->clk);
+		if (ret) {
+			DRM_ERROR("%s: clk_set_parent failed: ret=%d\n",
+					__func__, ret);
+			return ret;
+		}
+	}
+	return 0;
+}
+
+static unsigned long dp_pll_mux_recalc_rate(struct clk_hw *hw,
+					unsigned long parent_rate)
+{
+	struct clk_hw *div_clk_hw = NULL, *vco_clk_hw = NULL;
+	struct dp_pll_vco_clk *vco;
+
+	div_clk_hw = clk_hw_get_parent(hw);
+	if (!div_clk_hw)
+		return 0;
+
+	vco_clk_hw = clk_hw_get_parent(div_clk_hw);
+	if (!vco_clk_hw)
+		return 0;
+
+	vco = to_dp_vco_hw(vco_clk_hw);
+	if (!vco)
+		return 0;
+
+	if (vco->rate == DP_VCO_HSCLK_RATE_8100MHZDIV1000)
+		return (vco->rate / 6);
+	else if (vco->rate == DP_VCO_HSCLK_RATE_5400MHZDIV1000)
+		return (vco->rate / 4);
+	else
+		return (vco->rate / 2);
+}
+
+static int dp_pll_10nm_get_provider(struct msm_dp_pll *pll,
+				     struct clk **link_clk_provider,
+				     struct clk **pixel_clk_provider)
+{
+	struct clk_hw_onecell_data *hw_data = pll->hw_data;
+
+	if (link_clk_provider)
+		*link_clk_provider = hw_data->hws[DP_LINK_CLK_SRC]->clk;
+	if (pixel_clk_provider)
+		*pixel_clk_provider = hw_data->hws[DP_PIXEL_CLK_SRC]->clk;
+
+	return 0;
+}
+
+static const struct clk_ops dp_10nm_pclksel_clk_ops = {
+	.get_parent = dp_pll_mux_get_parent_10nm,
+	.set_parent = dp_pll_mux_set_parent_10nm,
+	.recalc_rate = dp_pll_mux_recalc_rate,
+	.determine_rate = dp_pll_clk_mux_determine_rate,
+};
+
+static struct clk_hw *dp_pll_10nm_pixel_clk_sel(struct dp_pll_db *pll_10nm)
+{
+	struct device *dev = &pll_10nm->pdev->dev;
+	struct dp_pll_10nm_pclksel *pll_pclksel;
+	struct clk_init_data pclksel_init = {
+		.parent_data = disp_cc_parent_data_0,
+		.num_parents = 3,
+		.name = "dp_phy_pll_vco_div_clk",
+		.ops = &dp_10nm_pclksel_clk_ops,
+	};
+	int ret;
+
+	pll_pclksel = devm_kzalloc(dev, sizeof(*pll_pclksel), GFP_KERNEL);
+	if (!pll_pclksel)
+		return ERR_PTR(-ENOMEM);
+
+	pll_pclksel->pll = pll_10nm;
+	pll_pclksel->shift = 0;
+	pll_pclksel->width = 4;
+	pll_pclksel->flags = CLK_DIVIDER_ONE_BASED;
+	pll_pclksel->hw.init = &pclksel_init;
+
+	ret = clk_hw_register(dev, &pll_pclksel->hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &pll_pclksel->hw;
+}
+
+static int dp_pll_10nm_register(struct dp_pll_db *pll_10nm)
+{
+	struct clk_hw_onecell_data *hw_data;
+	int ret;
+	struct clk_hw *hw;
+
+	struct msm_dp_pll *pll = pll_10nm->base;
+	struct device *dev = &pll_10nm->pdev->dev;
+	struct clk_hw **hws = pll_10nm->hws;
+	int num = 0;
+	struct clk_init_data vco_init = {
+		.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+		},
+		.num_parents = 1,
+		.name = "dp_vco_clk",
+		.ops = &dp_10nm_vco_clk_ops,
+	};
+
+	DRM_DEBUG_DP("DP->id = %d", pll_10nm->id);
+
+	hw_data = devm_kzalloc(dev, sizeof(*hw_data) +
+			       NUM_PROVIDED_CLKS * sizeof(struct clk_hw *),
+			       GFP_KERNEL);
+	if (!hw_data)
+		return -ENOMEM;
+
+	dp_vco_clk.hw.init = &vco_init;
+	ret = clk_hw_register(dev, &dp_vco_clk.hw);
+	if (ret)
+		return ret;
+	hws[num++] = &dp_vco_clk.hw;
+
+	hw = clk_hw_register_fixed_factor(dev, "dp_phy_pll_link_clk",
+				"dp_vco_clk", CLK_SET_RATE_PARENT, 1, 10);
+
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+	hws[num++] = hw;
+	hw_data->hws[DP_LINK_CLK_SRC] = hw;
+
+	hw = clk_hw_register_fixed_factor(dev, "dp_vco_divsel_two_clk_src",
+					"dp_vco_clk",  0, 1, 2);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+	hws[num++] = hw;
+
+	hw = clk_hw_register_fixed_factor(dev, "dp_vco_divsel_four_clk_src",
+					 "dp_vco_clk", 0, 1, 4);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+	hws[num++] = hw;
+
+	hw = clk_hw_register_fixed_factor(dev, "dp_vco_divsel_six_clk_src",
+					 "dp_vco_clk", 0, 1, 6);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+	hws[num++] = hw;
+
+	hw = dp_pll_10nm_pixel_clk_sel(pll_10nm);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
+	hws[num++] = hw;
+	hw_data->hws[DP_PIXEL_CLK_SRC] = hw;
+
+	pll_10nm->num_hws = num;
+
+	hw_data->num = NUM_PROVIDED_CLKS;
+	pll->hw_data = hw_data;
+
+	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
+				     pll->hw_data);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to register clk provider: %d\n",
+				ret);
+		return ret;
+	}
+
+	return ret;
+}
+
+int msm_dp_pll_10nm_init(struct msm_dp_pll *pll, int id)
+{
+	struct dp_pll_db *dp_10nm_pll;
+	struct platform_device *pdev = pll->pdev;
+	int ret;
+
+	dp_10nm_pll = devm_kzalloc(&pdev->dev,
+					sizeof(*dp_10nm_pll), GFP_KERNEL);
+	if (!dp_10nm_pll)
+		return -ENOMEM;
+
+	DRM_DEBUG_DP("DP PLL%d", id);
+
+	dp_10nm_pll->base = pll;
+	dp_10nm_pll->pdev = pll->pdev;
+	dp_10nm_pll->id = id;
+	dp_pdb = dp_10nm_pll;
+	pll->priv = (void *)dp_10nm_pll;
+	dp_vco_clk.priv = pll;
+
+	ret = of_property_read_u32(pdev->dev.of_node, "cell-index",
+				&dp_10nm_pll->index);
+	if (ret) {
+		DRM_ERROR("Unable to get the cell-index ret=%d\n", ret);
+		dp_10nm_pll->index = 0;
+	}
+
+	ret = dp_pll_10nm_register(dp_10nm_pll);
+	if (ret) {
+		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
+		return ret;
+	}
+
+	pll->get_provider = dp_pll_10nm_get_provider;
+
+	return ret;
+}
+
+static int dp_vco_pll_init_db_10nm(struct msm_dp_pll *pll,
+		unsigned long rate)
+{
+	u32 spare_value = 0;
+	struct dp_io_pll *pll_io;
+	struct dp_pll_db *dp_res = to_dp_pll_db(pll);
+
+	pll_io = &pll->pll_io;
+	spare_value = PLL_REG_R(pll_io->phy_base, REG_DP_PHY_SPARE0);
+	dp_res->lane_cnt = spare_value & 0x0F;
+	dp_res->orientation = (spare_value & 0xF0) >> 4;
+
+	DRM_DEBUG_DP("%s: spare_value=0x%x, ln_cnt=0x%x, orientation=0x%x\n",
+			__func__, spare_value, dp_res->lane_cnt,
+			dp_res->orientation);
+
+	switch (rate) {
+	case DP_VCO_HSCLK_RATE_1620MHZDIV1000:
+		DRM_DEBUG_DP("%s: VCO rate: %ld\n", __func__,
+				DP_VCO_RATE_9720MHZDIV1000);
+		dp_res->hsclk_sel = 0x0c;
+		dp_res->dec_start_mode0 = 0x69;
+		dp_res->div_frac_start1_mode0 = 0x00;
+		dp_res->div_frac_start2_mode0 = 0x80;
+		dp_res->div_frac_start3_mode0 = 0x07;
+		dp_res->integloop_gain0_mode0 = 0x3f;
+		dp_res->integloop_gain1_mode0 = 0x00;
+		dp_res->vco_tune_map = 0x00;
+		dp_res->lock_cmp1_mode0 = 0x6f;
+		dp_res->lock_cmp2_mode0 = 0x08;
+		dp_res->lock_cmp3_mode0 = 0x00;
+		dp_res->phy_vco_div = 0x1;
+		dp_res->lock_cmp_en = 0x00;
+		break;
+	case DP_VCO_HSCLK_RATE_2700MHZDIV1000:
+		DRM_DEBUG_DP("%s: VCO rate: %ld\n", __func__,
+				DP_VCO_RATE_10800MHZDIV1000);
+		dp_res->hsclk_sel = 0x04;
+		dp_res->dec_start_mode0 = 0x69;
+		dp_res->div_frac_start1_mode0 = 0x00;
+		dp_res->div_frac_start2_mode0 = 0x80;
+		dp_res->div_frac_start3_mode0 = 0x07;
+		dp_res->integloop_gain0_mode0 = 0x3f;
+		dp_res->integloop_gain1_mode0 = 0x00;
+		dp_res->vco_tune_map = 0x00;
+		dp_res->lock_cmp1_mode0 = 0x0f;
+		dp_res->lock_cmp2_mode0 = 0x0e;
+		dp_res->lock_cmp3_mode0 = 0x00;
+		dp_res->phy_vco_div = 0x1;
+		dp_res->lock_cmp_en = 0x00;
+		break;
+	case DP_VCO_HSCLK_RATE_5400MHZDIV1000:
+		DRM_DEBUG_DP("%s: VCO rate: %ld\n", __func__,
+				DP_VCO_RATE_10800MHZDIV1000);
+		dp_res->hsclk_sel = 0x00;
+		dp_res->dec_start_mode0 = 0x8c;
+		dp_res->div_frac_start1_mode0 = 0x00;
+		dp_res->div_frac_start2_mode0 = 0x00;
+		dp_res->div_frac_start3_mode0 = 0x0a;
+		dp_res->integloop_gain0_mode0 = 0x3f;
+		dp_res->integloop_gain1_mode0 = 0x00;
+		dp_res->vco_tune_map = 0x00;
+		dp_res->lock_cmp1_mode0 = 0x1f;
+		dp_res->lock_cmp2_mode0 = 0x1c;
+		dp_res->lock_cmp3_mode0 = 0x00;
+		dp_res->phy_vco_div = 0x2;
+		dp_res->lock_cmp_en = 0x00;
+		break;
+	case DP_VCO_HSCLK_RATE_8100MHZDIV1000:
+		DRM_DEBUG_DP("%s: VCO rate: %ld\n", __func__,
+				DP_VCO_RATE_8100MHZDIV1000);
+		dp_res->hsclk_sel = 0x03;
+		dp_res->dec_start_mode0 = 0x69;
+		dp_res->div_frac_start1_mode0 = 0x00;
+		dp_res->div_frac_start2_mode0 = 0x80;
+		dp_res->div_frac_start3_mode0 = 0x07;
+		dp_res->integloop_gain0_mode0 = 0x3f;
+		dp_res->integloop_gain1_mode0 = 0x00;
+		dp_res->vco_tune_map = 0x00;
+		dp_res->lock_cmp1_mode0 = 0x2f;
+		dp_res->lock_cmp2_mode0 = 0x2a;
+		dp_res->lock_cmp3_mode0 = 0x00;
+		dp_res->phy_vco_div = 0x0;
+		dp_res->lock_cmp_en = 0x08;
+		break;
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int dp_config_vco_rate_10nm(struct dp_pll_vco_clk *vco,
+		unsigned long rate)
+{
+	u32 res = 0;
+	struct msm_dp_pll *pll = vco->priv;
+	struct dp_io_pll *pll_io = &pll->pll_io;
+	struct dp_pll_db *dp_res = to_dp_pll_db(pll);
+
+	res = dp_vco_pll_init_db_10nm(pll, rate);
+	if (res) {
+		DRM_ERROR("VCO Init DB failed\n");
+		return res;
+	}
+
+	if (dp_res->lane_cnt != 4) {
+		if (dp_res->orientation == ORIENTATION_CC2)
+			PLL_REG_W(pll_io->phy_base, REG_DP_PHY_PD_CTL, 0x6d);
+		else
+			PLL_REG_W(pll_io->phy_base, REG_DP_PHY_PD_CTL, 0x75);
+	} else {
+		PLL_REG_W(pll_io->phy_base, REG_DP_PHY_PD_CTL, 0x7d);
+	}
+
+	PLL_REG_W(pll_io->pll_base, QSERDES_COM_SVS_MODE_CLK_SEL, 0x01);
+	PLL_REG_W(pll_io->pll_base, QSERDES_COM_SYSCLK_EN_SEL, 0x37);
+	PLL_REG_W(pll_io->pll_base, QSERDES_COM_SYS_CLK_CTRL, 0x02);
+	PLL_REG_W(pll_io->pll_base, QSERDES_COM_CLK_ENABLE1, 0x0e);
+	PLL_REG_W(pll_io->pll_base, QSERDES_COM_SYSCLK_BUF_ENABLE, 0x06);
+	PLL_REG_W(pll_io->pll_base, QSERDES_COM_CLK_SEL, 0x30);
+	PLL_REG_W(pll_io->pll_base, QSERDES_COM_CMN_CONFIG, 0x02);
+
+	/* Different for each clock rates */
+	PLL_REG_W(pll_io->pll_base,
+		QSERDES_COM_HSCLK_SEL, dp_res->hsclk_sel);
+	PLL_REG_W(pll_io->pll_base,
+		QSERDES_COM_DEC_START_MODE0, dp_res->dec_start_mode0);
+	PLL_REG_W(pll_io->pll_base,
+		QSERDES_COM_DIV_FRAC_START1_MODE0,
+		dp_res->div_frac_start1_mode0);
+	PLL_REG_W(pll_io->pll_base,
+		QSERDES_COM_DIV_FRAC_START2_MODE0,
+		dp_res->div_frac_start2_mode0);
+	PLL_REG_W(pll_io->pll_base,
+		QSERDES_COM_DIV_FRAC_START3_MODE0,
+		dp_res->div_frac_start3_mode0);
+	PLL_REG_W(pll_io->pll_base,
+		QSERDES_COM_INTEGLOOP_GAIN0_MODE0,
+		dp_res->integloop_gain0_mode0);
+	PLL_REG_W(pll_io->pll_base,
+		QSERDES_COM_INTEGLOOP_GAIN1_MODE0,
+		dp_res->integloop_gain1_mode0);
+	PLL_REG_W(pll_io->pll_base,
+		QSERDES_COM_VCO_TUNE_MAP, dp_res->vco_tune_map);
+	PLL_REG_W(pll_io->pll_base,
+		QSERDES_COM_LOCK_CMP1_MODE0, dp_res->lock_cmp1_mode0);
+	PLL_REG_W(pll_io->pll_base,
+		QSERDES_COM_LOCK_CMP2_MODE0, dp_res->lock_cmp2_mode0);
+	PLL_REG_W(pll_io->pll_base,
+		QSERDES_COM_LOCK_CMP3_MODE0, dp_res->lock_cmp3_mode0);
+
+	PLL_REG_W(pll_io->pll_base, QSERDES_COM_BG_TIMER, 0x0a);
+	PLL_REG_W(pll_io->pll_base, QSERDES_COM_CORECLK_DIV_MODE0, 0x0a);
+	PLL_REG_W(pll_io->pll_base, QSERDES_COM_VCO_TUNE_CTRL, 0x00);
+	PLL_REG_W(pll_io->pll_base, QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x3f);
+	PLL_REG_W(pll_io->pll_base, QSERDES_COM_CORE_CLK_EN, 0x1f);
+	PLL_REG_W(pll_io->pll_base, QSERDES_COM_PLL_IVCO, 0x07);
+	PLL_REG_W(pll_io->pll_base,
+		QSERDES_COM_LOCK_CMP_EN, dp_res->lock_cmp_en);
+	PLL_REG_W(pll_io->pll_base, QSERDES_COM_PLL_CCTRL_MODE0, 0x36);
+	PLL_REG_W(pll_io->pll_base, QSERDES_COM_PLL_RCTRL_MODE0, 0x16);
+	PLL_REG_W(pll_io->pll_base, QSERDES_COM_CP_CTRL_MODE0, 0x06);
+
+	if (dp_res->orientation == ORIENTATION_CC2)
+		PLL_REG_W(pll_io->phy_base, REG_DP_PHY_MODE, 0x4c);
+	else
+		PLL_REG_W(pll_io->phy_base, REG_DP_PHY_MODE, 0x5c);
+
+	/* TX Lane configuration */
+	PLL_REG_W(pll_io->phy_base,
+			REG_DP_PHY_TX0_TX1_LANE_CTL, 0x05);
+	PLL_REG_W(pll_io->phy_base,
+			REG_DP_PHY_TX2_TX3_LANE_CTL, 0x05);
+
+	/* TX-0 register configuration */
+	PLL_REG_W(pll_io->ln_tx0_base,
+			REG_DP_PHY_TXn_TRANSCEIVER_BIAS_EN, 0x1a);
+	PLL_REG_W(pll_io->ln_tx0_base,
+			REG_DP_PHY_TXn_VMODE_CTRL1, 0x40);
+	PLL_REG_W(pll_io->ln_tx0_base,
+			REG_DP_PHY_TXn_PRE_STALL_LDO_BOOST_EN, 0x30);
+	PLL_REG_W(pll_io->ln_tx0_base,
+			REG_DP_PHY_TXn_INTERFACE_SELECT, 0x3d);
+	PLL_REG_W(pll_io->ln_tx0_base,
+			REG_DP_PHY_TXn_CLKBUF_ENABLE, 0x0f);
+	PLL_REG_W(pll_io->ln_tx0_base,
+			REG_DP_PHY_TXn_RESET_TSYNC_EN, 0x03);
+	PLL_REG_W(pll_io->ln_tx0_base,
+			REG_DP_PHY_TXn_TRAN_DRVR_EMP_EN, 0x03);
+	PLL_REG_W(pll_io->ln_tx0_base,
+			REG_DP_PHY_TXn_PARRATE_REC_DETECT_IDLE_EN, 0x00);
+	PLL_REG_W(pll_io->ln_tx0_base,
+			REG_DP_PHY_TXn_TX_INTERFACE_MODE, 0x00);
+	PLL_REG_W(pll_io->ln_tx0_base, REG_DP_PHY_TXn_TX_BAND, 0x4);
+
+	/* TX-1 register configuration */
+	PLL_REG_W(pll_io->ln_tx1_base,
+			REG_DP_PHY_TXn_TRANSCEIVER_BIAS_EN, 0x1a);
+	PLL_REG_W(pll_io->ln_tx1_base,
+			REG_DP_PHY_TXn_VMODE_CTRL1, 0x40);
+	PLL_REG_W(pll_io->ln_tx1_base,
+			REG_DP_PHY_TXn_PRE_STALL_LDO_BOOST_EN, 0x30);
+	PLL_REG_W(pll_io->ln_tx1_base,
+			REG_DP_PHY_TXn_INTERFACE_SELECT, 0x3d);
+	PLL_REG_W(pll_io->ln_tx1_base,
+			REG_DP_PHY_TXn_CLKBUF_ENABLE, 0x0f);
+	PLL_REG_W(pll_io->ln_tx1_base,
+			REG_DP_PHY_TXn_RESET_TSYNC_EN, 0x03);
+	PLL_REG_W(pll_io->ln_tx1_base,
+			REG_DP_PHY_TXn_TRAN_DRVR_EMP_EN, 0x03);
+	PLL_REG_W(pll_io->ln_tx1_base,
+			REG_DP_PHY_TXn_PARRATE_REC_DETECT_IDLE_EN, 0x00);
+	PLL_REG_W(pll_io->ln_tx1_base,
+			REG_DP_PHY_TXn_TX_INTERFACE_MODE, 0x00);
+	PLL_REG_W(pll_io->ln_tx1_base,
+			REG_DP_PHY_TXn_TX_BAND, 0x4);
+
+	/* dependent on the vco frequency */
+	PLL_REG_W(pll_io->phy_base,
+			REG_DP_PHY_VCO_DIV, dp_res->phy_vco_div);
+
+	return res;
+}
+
+static bool dp_10nm_pll_lock_status(struct dp_pll_db *dp_res)
+{
+	u32 status;
+	bool pll_locked;
+	struct dp_io_pll *pll_io = &dp_res->base->pll_io;
+
+	/* poll for PLL lock status */
+	if (readl_poll_timeout_atomic((pll_io->pll_base +
+			QSERDES_COM_C_READY_STATUS),
+			status,
+			((status & BIT(0)) > 0),
+			DP_PHY_PLL_POLL_SLEEP_US,
+			DP_PHY_PLL_POLL_TIMEOUT_US)) {
+		DRM_ERROR("%s: C_READY status is not high. Status=%x\n",
+				__func__, status);
+		pll_locked = false;
+	} else {
+		pll_locked = true;
+	}
+
+	return pll_locked;
+}
+
+static bool dp_10nm_phy_rdy_status(struct dp_pll_db *dp_res)
+{
+	u32 status;
+	bool phy_ready = true;
+	struct dp_io_pll *pll_io = &dp_res->base->pll_io;
+
+	/* poll for PHY ready status */
+	if (readl_poll_timeout_atomic((pll_io->phy_base +
+			REG_DP_PHY_STATUS),
+			status,
+			((status & (BIT(1))) > 0),
+			DP_PHY_PLL_POLL_SLEEP_US,
+			DP_PHY_PLL_POLL_TIMEOUT_US)) {
+		DRM_ERROR("%s: Phy_ready is not high. Status=%x\n",
+				__func__, status);
+		phy_ready = false;
+	}
+
+	return phy_ready;
+}
+
+static int dp_pll_enable_10nm(struct clk_hw *hw)
+{
+	int rc = 0;
+	u32 bias_en, drvr_en;
+	struct dp_io_pll *pll_io;
+	struct dp_pll_vco_clk *vco = to_dp_vco_hw(hw);
+	struct msm_dp_pll *pll = to_msm_dp_pll(vco);
+	struct dp_pll_db *dp_res = to_dp_pll_db(pll);
+
+	pll_io = &pll->pll_io;
+
+	PLL_REG_W(pll_io->phy_base, REG_DP_PHY_AUX_CFG2, 0x04);
+	PLL_REG_W(pll_io->phy_base, REG_DP_PHY_CFG, 0x01);
+	PLL_REG_W(pll_io->phy_base, REG_DP_PHY_CFG, 0x05);
+	PLL_REG_W(pll_io->phy_base, REG_DP_PHY_CFG, 0x01);
+	PLL_REG_W(pll_io->phy_base, REG_DP_PHY_CFG, 0x09);
+
+	PLL_REG_W(pll_io->pll_base, QSERDES_COM_RESETSM_CNTRL, 0x20);
+
+	if (!dp_10nm_pll_lock_status(dp_res)) {
+		rc = -EINVAL;
+		goto lock_err;
+	}
+
+	PLL_REG_W(pll_io->phy_base, REG_DP_PHY_CFG, 0x19);
+	/* poll for PHY ready status */
+	if (!dp_10nm_phy_rdy_status(dp_res)) {
+		rc = -EINVAL;
+		goto lock_err;
+	}
+
+	DRM_DEBUG_DP("%s: PLL is locked\n", __func__);
+
+	if (dp_res->lane_cnt == 1) {
+		bias_en = 0x3e;
+		drvr_en = 0x13;
+	} else {
+		bias_en = 0x3f;
+		drvr_en = 0x10;
+	}
+
+	if (dp_res->lane_cnt != 4) {
+		if (dp_res->orientation == ORIENTATION_CC1) {
+			PLL_REG_W(pll_io->ln_tx1_base,
+				REG_DP_PHY_TXn_HIGHZ_DRVR_EN, drvr_en);
+			PLL_REG_W(pll_io->ln_tx1_base,
+				REG_DP_PHY_TXn_TRANSCEIVER_BIAS_EN, bias_en);
+		} else {
+			PLL_REG_W(pll_io->ln_tx0_base,
+				REG_DP_PHY_TXn_HIGHZ_DRVR_EN, drvr_en);
+			PLL_REG_W(pll_io->ln_tx0_base,
+				REG_DP_PHY_TXn_TRANSCEIVER_BIAS_EN, bias_en);
+		}
+	} else {
+		PLL_REG_W(pll_io->ln_tx0_base,
+				REG_DP_PHY_TXn_HIGHZ_DRVR_EN, drvr_en);
+		PLL_REG_W(pll_io->ln_tx0_base,
+				REG_DP_PHY_TXn_TRANSCEIVER_BIAS_EN, bias_en);
+		PLL_REG_W(pll_io->ln_tx1_base,
+				REG_DP_PHY_TXn_HIGHZ_DRVR_EN, drvr_en);
+		PLL_REG_W(pll_io->ln_tx1_base,
+				REG_DP_PHY_TXn_TRANSCEIVER_BIAS_EN, bias_en);
+	}
+
+	PLL_REG_W(pll_io->ln_tx0_base, REG_DP_PHY_TXn_TX_POL_INV, 0x0a);
+	PLL_REG_W(pll_io->ln_tx1_base, REG_DP_PHY_TXn_TX_POL_INV, 0x0a);
+	PLL_REG_W(pll_io->phy_base, REG_DP_PHY_CFG, 0x18);
+	udelay(2000);
+
+	PLL_REG_W(pll_io->phy_base, REG_DP_PHY_CFG, 0x19);
+
+	/* poll for PHY ready status */
+	if (!dp_10nm_phy_rdy_status(dp_res)) {
+		rc = -EINVAL;
+		goto lock_err;
+	}
+
+	PLL_REG_W(pll_io->ln_tx0_base, REG_DP_PHY_TXn_TX_DRV_LVL, 0x38);
+	PLL_REG_W(pll_io->ln_tx1_base, REG_DP_PHY_TXn_TX_DRV_LVL, 0x38);
+	PLL_REG_W(pll_io->ln_tx0_base, REG_DP_PHY_TXn_TX_EMP_POST1_LVL, 0x20);
+	PLL_REG_W(pll_io->ln_tx1_base, REG_DP_PHY_TXn_TX_EMP_POST1_LVL, 0x20);
+	PLL_REG_W(pll_io->ln_tx0_base,
+			REG_DP_PHY_TXn_RES_CODE_LANE_OFFSET_TX, 0x06);
+	PLL_REG_W(pll_io->ln_tx1_base,
+			REG_DP_PHY_TXn_RES_CODE_LANE_OFFSET_TX, 0x06);
+	PLL_REG_W(pll_io->ln_tx0_base,
+			REG_DP_PHY_TXn_RES_CODE_LANE_OFFSET_RX, 0x07);
+	PLL_REG_W(pll_io->ln_tx1_base,
+			REG_DP_PHY_TXn_RES_CODE_LANE_OFFSET_RX, 0x07);
+
+lock_err:
+	return rc;
+}
+
+static int dp_pll_disable_10nm(struct clk_hw *hw)
+{
+	int rc = 0;
+	struct dp_pll_vco_clk *vco = to_dp_vco_hw(hw);
+	struct msm_dp_pll *pll = to_msm_dp_pll(vco);
+
+	/* Assert DP PHY power down */
+	PLL_REG_W(pll->pll_io.phy_base, REG_DP_PHY_PD_CTL, 0x2);
+
+	return rc;
+}
+
+
+int dp_vco_prepare_10nm(struct clk_hw *hw)
+{
+	int rc = 0;
+	struct dp_pll_vco_clk *vco = to_dp_vco_hw(hw);
+	struct msm_dp_pll *pll = (struct msm_dp_pll *)vco->priv;
+	struct dp_pll_db *dp_res = to_dp_pll_db(pll);
+
+	DRM_DEBUG_DP("%s: rate = %ld\n", __func__, vco->rate);
+	if ((dp_res->vco_cached_rate != 0)
+		&& (dp_res->vco_cached_rate == vco->rate)) {
+		rc = dp_vco_set_rate_10nm(hw,
+			dp_res->vco_cached_rate, dp_res->vco_cached_rate);
+		if (rc) {
+			DRM_ERROR("index=%d vco_set_rate failed. rc=%d\n",
+				rc, dp_res->index);
+			goto error;
+		}
+	}
+
+	rc = dp_pll_enable_10nm(hw);
+	if (rc) {
+		DRM_ERROR("ndx=%d failed to enable dp pll\n",
+					dp_res->index);
+		goto error;
+	}
+
+	pll->pll_on = true;
+error:
+	return rc;
+}
+
+void dp_vco_unprepare_10nm(struct clk_hw *hw)
+{
+	struct dp_pll_vco_clk *vco = to_dp_vco_hw(hw);
+	struct msm_dp_pll *pll = to_msm_dp_pll(vco);
+	struct dp_pll_db *dp_res = to_dp_pll_db(pll);
+
+	if (!dp_res) {
+		DRM_ERROR("Invalid input parameter\n");
+		return;
+	}
+
+	if (!pll->pll_on) {
+		DRM_ERROR("pll resource can't be enabled\n");
+		return;
+	}
+	dp_res->vco_cached_rate = vco->rate;
+	dp_pll_disable_10nm(hw);
+
+	pll->pll_on = false;
+}
+
+int dp_vco_set_rate_10nm(struct clk_hw *hw, unsigned long rate,
+					unsigned long parent_rate)
+{
+	struct dp_pll_vco_clk *vco = to_dp_vco_hw(hw);
+	int rc;
+
+	DRM_DEBUG_DP("DP lane CLK rate=%ld\n", rate);
+
+	rc = dp_config_vco_rate_10nm(vco, rate);
+	if (rc)
+		DRM_ERROR("%s: Failed to set clk rate\n", __func__);
+
+	vco->rate = rate;
+
+	return 0;
+}
+
+unsigned long dp_vco_recalc_rate_10nm(struct clk_hw *hw,
+					unsigned long parent_rate)
+{
+	u32 div, hsclk_div, link_clk_div = 0;
+	u64 vco_rate;
+	struct dp_io_pll *pll_io;
+	struct dp_pll_vco_clk *vco = to_dp_vco_hw(hw);
+	struct msm_dp_pll *pll = to_msm_dp_pll(vco);
+	struct dp_pll_db *dp_res = to_dp_pll_db(pll);
+
+	pll_io = &pll->pll_io;
+
+	div = PLL_REG_R(pll_io->pll_base, QSERDES_COM_HSCLK_SEL);
+	div &= 0x0f;
+
+	if (div == 12)
+		hsclk_div = 6; /* Default */
+	else if (div == 4)
+		hsclk_div = 4;
+	else if (div == 0)
+		hsclk_div = 2;
+	else if (div == 3)
+		hsclk_div = 1;
+	else {
+		DRM_DEBUG_DP("unknown divider. forcing to default\n");
+		hsclk_div = 5;
+	}
+
+	div = PLL_REG_R(pll_io->phy_base, REG_DP_PHY_AUX_CFG2);
+	div >>= 2;
+
+	if ((div & 0x3) == 0)
+		link_clk_div = 5;
+	else if ((div & 0x3) == 1)
+		link_clk_div = 10;
+	else if ((div & 0x3) == 2)
+		link_clk_div = 20;
+	else
+		DRM_ERROR("%s: unsupported div. Phy_mode: %d\n", __func__, div);
+
+	if (link_clk_div == 20) {
+		vco_rate = DP_VCO_HSCLK_RATE_2700MHZDIV1000;
+	} else {
+		if (hsclk_div == 6)
+			vco_rate = DP_VCO_HSCLK_RATE_1620MHZDIV1000;
+		else if (hsclk_div == 4)
+			vco_rate = DP_VCO_HSCLK_RATE_2700MHZDIV1000;
+		else if (hsclk_div == 2)
+			vco_rate = DP_VCO_HSCLK_RATE_5400MHZDIV1000;
+		else
+			vco_rate = DP_VCO_HSCLK_RATE_8100MHZDIV1000;
+	}
+
+	DRM_DEBUG_DP("returning vco rate = %lu\n", (unsigned long)vco_rate);
+
+	dp_res->vco_cached_rate = vco->rate = vco_rate;
+	return (unsigned long)vco_rate;
+}
+
+long dp_vco_round_rate_10nm(struct clk_hw *hw, unsigned long rate,
+			unsigned long *parent_rate)
+{
+	unsigned long rrate = rate;
+	struct dp_pll_vco_clk *vco = to_dp_vco_hw(hw);
+
+	if (rate <= vco->min_rate)
+		rrate = vco->min_rate;
+	else if (rate <= DP_VCO_HSCLK_RATE_2700MHZDIV1000)
+		rrate = DP_VCO_HSCLK_RATE_2700MHZDIV1000;
+	else if (rate <= DP_VCO_HSCLK_RATE_5400MHZDIV1000)
+		rrate = DP_VCO_HSCLK_RATE_5400MHZDIV1000;
+	else
+		rrate = vco->max_rate;
+
+	DRM_DEBUG_DP("%s: rrate=%ld\n", __func__, rrate);
+
+	*parent_rate = rrate;
+	return rrate;
+}
diff --git a/drivers/gpu/drm/msm/dp/dp_pll_private.h b/drivers/gpu/drm/msm/dp/dp_pll_private.h
new file mode 100644
index 0000000..54b5cd9
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_pll_private.h
@@ -0,0 +1,103 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2016-2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef __DP_PLL_10NM_H
+#define __DP_PLL_10NM_H
+
+#include "dp_pll.h"
+#include "dp_reg.h"
+
+#define DP_VCO_HSCLK_RATE_1620MHZDIV1000	1620000UL
+#define DP_VCO_HSCLK_RATE_2700MHZDIV1000	2700000UL
+#define DP_VCO_HSCLK_RATE_5400MHZDIV1000	5400000UL
+#define DP_VCO_HSCLK_RATE_8100MHZDIV1000	8100000UL
+
+#define NUM_DP_CLOCKS_MAX			6
+
+#define DP_PHY_PLL_POLL_SLEEP_US		500
+#define DP_PHY_PLL_POLL_TIMEOUT_US		10000
+
+#define DP_VCO_RATE_8100MHZDIV1000		8100000UL
+#define DP_VCO_RATE_9720MHZDIV1000		9720000UL
+#define DP_VCO_RATE_10800MHZDIV1000		10800000UL
+
+struct dp_pll_vco_clk {
+	struct clk_hw hw;
+	unsigned long	rate;		/* current vco rate */
+	u64		min_rate;	/* min vco rate */
+	u64		max_rate;	/* max vco rate */
+	void		*priv;
+};
+
+struct dp_pll_db {
+	struct msm_dp_pll *base;
+
+	int id;
+	struct platform_device *pdev;
+
+	/* private clocks: */
+	struct clk_hw *hws[NUM_DP_CLOCKS_MAX];
+	u32 num_hws;
+
+	/* lane and orientation settings */
+	u8 lane_cnt;
+	u8 orientation;
+
+	/* COM PHY settings */
+	u32 hsclk_sel;
+	u32 dec_start_mode0;
+	u32 div_frac_start1_mode0;
+	u32 div_frac_start2_mode0;
+	u32 div_frac_start3_mode0;
+	u32 integloop_gain0_mode0;
+	u32 integloop_gain1_mode0;
+	u32 vco_tune_map;
+	u32 lock_cmp1_mode0;
+	u32 lock_cmp2_mode0;
+	u32 lock_cmp3_mode0;
+	u32 lock_cmp_en;
+
+	/* PHY vco divider */
+	u32 phy_vco_div;
+	/*
+	 * Certain pll's needs to update the same vco rate after resume in
+	 * suspend/resume scenario. Cached the vco rate for such plls.
+	 */
+	unsigned long	vco_cached_rate;
+	u32		cached_cfg0;
+	u32		cached_cfg1;
+	u32		cached_outdiv;
+
+	uint32_t index;
+};
+
+static inline struct dp_pll_vco_clk *to_dp_vco_hw(struct clk_hw *hw)
+{
+	return container_of(hw, struct dp_pll_vco_clk, hw);
+}
+
+#define to_msm_dp_pll(vco) ((struct msm_dp_pll *)vco->priv)
+
+#define to_dp_pll_db(x)	((struct dp_pll_db *)x->priv)
+
+int dp_vco_set_rate_10nm(struct clk_hw *hw, unsigned long rate,
+				unsigned long parent_rate);
+unsigned long dp_vco_recalc_rate_10nm(struct clk_hw *hw,
+				unsigned long parent_rate);
+long dp_vco_round_rate_10nm(struct clk_hw *hw, unsigned long rate,
+				unsigned long *parent_rate);
+int dp_vco_prepare_10nm(struct clk_hw *hw);
+void dp_vco_unprepare_10nm(struct clk_hw *hw);
+
+#ifdef CONFIG_DRM_MSM_DP_10NM_PLL
+int msm_dp_pll_10nm_init(struct msm_dp_pll *dp_pll, int id);
+#else
+int msm_dp_pll_10nm_init(struct msm_dp_pll *dp_pll, int id)
+{
+	return ERR_PTR(-ENODEV);
+}
+#endif
+
+#endif /* __DP_PLL_10NM_H */
diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
index 19a1777..427a4ed 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.c
+++ b/drivers/gpu/drm/msm/dp/dp_power.c
@@ -101,6 +101,16 @@ static int dp_power_clk_init(struct dp_power_private *power)
 	core = &power->parser->mp[DP_CORE_PM];
 	ctrl = &power->parser->mp[DP_CTRL_PM];
 
+	if (power->parser->pll && power->parser->pll->get_provider) {
+		rc = power->parser->pll->get_provider(power->parser->pll,
+			&power->link_provider, &power->pixel_provider);
+		if (rc) {
+			DRM_ERROR("%s:provider failed,don't set parent\n",
+								__func__);
+			return 0;
+		}
+	}
+
 	rc = msm_dss_get_clk(dev, core->clk_config, core->num_clk);
 	if (rc) {
 		DRM_ERROR("failed to get %s clk. err=%d\n",
diff --git a/drivers/gpu/drm/msm/dp/dp_power.h b/drivers/gpu/drm/msm/dp/dp_power.h
index 9d24f36..3dc4a52 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.h
+++ b/drivers/gpu/drm/msm/dp/dp_power.h
@@ -14,7 +14,6 @@
  * @init: initializes the regulators/core clocks/GPIOs/pinctrl
  * @deinit: turns off the regulators/core clocks/GPIOs/pinctrl
  * @clk_enable: enable/disable the DP clocks
- * @set_link_clk_parent: set the parent of DP link clock
  * @set_pixel_clk_parent: set the parent of DP pixel clock
  */
 struct dp_power {
@@ -22,13 +21,83 @@ struct dp_power {
 	bool link_clks_on;
 };
 
+/**
+ * dp_power_init() - enable power supplies for display controller
+ *
+ * @power: instance of power module
+ * @flip: bool for flipping gpio direction
+ * return: 0 if success or error if failure.
+ *
+ * This API will turn on the regulators and configures gpio's
+ * aux/hpd.
+ */
 int dp_power_init(struct dp_power *power, bool flip);
+
+/**
+ * dp_power_deinit() - turn off regulators and gpios.
+ *
+ * @power: instance of power module
+ * return: 0 for success
+ *
+ * This API will deinitialize the DisplayPort's power module
+ * ,turns off power and regulators.
+ */
 int dp_power_deinit(struct dp_power *power);
+
+/**
+ * dp_power_clk_enable() - enable display controller clocks
+ *
+ * @power: instance of power module
+ * @pm_type: type of pm, core/ctrl/phy
+ * @enable: enables or disables
+ * return: pointer to allocated power module data
+ *
+ * This API will call setrate and enable for DP clocks
+ */
+
 int dp_power_clk_enable(struct dp_power *power, enum dp_pm_type pm_type,
 				bool enable);
+/**
+ * dp_power_set_link_clk_parent() - configures parent of link clocks
+ *
+ * @power: instance of power module
+ * return: 0 for success, error for failures
+ *
+ * This API will set the link clock parent source
+ */
 int dp_power_set_link_clk_parent(struct dp_power *power);
+
+
+/**
+ * dp_power_set_pixel_clk_parent() - configures parent of pixel clocks
+ *
+ * @power: instance of power module
+ * return: 0 for success, error for failures
+ *
+ * This API will set the pixel clock parent source
+ */
 int dp_power_set_pixel_clk_parent(struct dp_power *power);
+
+/**
+ * dp_power_clinet_init() - initialize clock and regulator modules
+ *
+ * @power: instance of power module
+ * return: 0 for success, error for failure.
+ *
+ * This API will configure the DisplayPort's clocks and regulator
+ * modueles.
+ */
 int dp_power_client_init(struct dp_power *power);
+
+/**
+ * dp_power_clinet_deinit() - de-initialize clock and regulator modules
+ *
+ * @power: instance of power module
+ * return: 0 for success, error for failure.
+ *
+ * This API will de-initialize the DisplayPort's clocks and regulator
+ * modueles.
+ */
 void dp_power_client_deinit(struct dp_power *power);
 
 /**
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 28c1682..ad6f176 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -6,6 +6,22 @@
 #ifndef _DP_REG_H_
 #define _DP_REG_H_
 
+/* DP PHY Register Regions */
+#define REG_DP_PHY_REGION_BASE			(0x088ea000)
+#define REG_DP_PHY_REGION_SIZE			(0x00000C00)
+
+#define REG_USB3_DP_COM_REGION_BASE		(0x088e8000)
+#define REG_USB3_DP_COM_REGION_SIZE		(0x00000020)
+
+#define DP_PHY_PLL_OFFSET			(0x00000000)
+#define DP_PHY_PLL_SIZE				(0x00000200)
+#define DP_PHY_REG_OFFSET			(0x00000A00)
+#define DP_PHY_REG_SIZE				(0x00000200)
+#define DP_PHY_LN_TX0_OFFSET			(0x00000200)
+#define DP_PHY_LN_TX0_SIZE			(0x00000200)
+#define DP_PHY_LN_TX1_OFFSET			(0x00000600)
+#define DP_PHY_LN_TX1_SIZE			(0x00000200)
+
 /* DP_TX Registers */
 #define REG_DP_HW_VERSION			(0x00000000)
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

