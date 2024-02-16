Return-Path: <linux-clk+bounces-3659-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8014285797B
	for <lists+linux-clk@lfdr.de>; Fri, 16 Feb 2024 10:56:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 819BFB23047
	for <lists+linux-clk@lfdr.de>; Fri, 16 Feb 2024 09:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B80A3208B4;
	Fri, 16 Feb 2024 09:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="p6zSjbCu"
X-Original-To: linux-clk@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16AB208A4;
	Fri, 16 Feb 2024 09:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708077149; cv=none; b=drDS6l40DnYzeeygex8vmhKlxbsCoqXliqLeyW9b1Mp4YJHCeQiMo7gNNhXQmzoRIcUywCEqjnDzpNfoSPYLMA62emfheISOgesxHLcedJB2/Oih3N4h/TW7+XWGZNPyurGzzcRmEXn2xJdQsRzJoHhVbk85cBPs7VRM+Fjz8G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708077149; c=relaxed/simple;
	bh=O3IKa52/9mtg01zkZp1O5HLfdsuUs7E3+0mmoi/y3J0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bo9WWJZGgpjGBSS+6Fo7y+q0+Z2tko9fKHARHkES6dczzGPM7X7yW4XuVuaL3DXQcIfm1omRVRKV3E81NCBrk5jRHXsbgpQGyd7eKueUxLYt1f19vYaVl5eBy7ql4u7DsvNd4hx0NrgngouTAfMP5KhWVDWgFF+7D2Psq3X1F5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=p6zSjbCu; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708077142;
	bh=O3IKa52/9mtg01zkZp1O5HLfdsuUs7E3+0mmoi/y3J0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p6zSjbCulKD3KVR1aWb+IaKx5iCdoiQYPbrZ2hPwK1kj5chOVZktO2LaWEbOcMuJi
	 UNhEAyGDN7VD6Dj+6WZD6XMy432fGNqWFYU+K/WKLee0Qg2ySSPAVuTkTlmECfKUA6
	 dTGJVdQMFw5EbJKO6g2aWdPwgOJ5Xj+2hwyy8hffsSR5A7yRw6/PXdQ3m1m0il+aqf
	 eXZuAWCZegUhySpogF/ilP3ry0zHFO3ngE823/qqM6q7zq6hlPvQ5DHVv3rTE+jUq3
	 rqvREVH/KTdU+l0ha76Sh+kRCJgoqt/L4EA+p/tgHocKgl7zwvo+wOKrXkiMTRQIen
	 uiMixRptCJVow==
Received: from shreeya.shreeya (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: shreeya)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 35A2A378203B;
	Fri, 16 Feb 2024 09:52:17 +0000 (UTC)
From: Shreeya Patel <shreeya.patel@collabora.com>
To: heiko@sntech.de,
	mchehab@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	jose.abreu@synopsys.com,
	nelson.costa@synopsys.com,
	dmitry.osipenko@collabora.com,
	sebastian.reichel@collabora.com,
	shawn.wen@rock-chips.com
Cc: kernel@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-dt@vger.kernel.org,
	linux-arm@lists.infradead.org,
	Shreeya Patel <shreeya.patel@collabora.com>
Subject: [PATCH 4/4] media: platform: synopsys: Add support for HDMI RX driver
Date: Fri, 16 Feb 2024 15:19:22 +0530
Message-Id: <20240216094922.257674-5-shreeya.patel@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240216094922.257674-1-shreeya.patel@collabora.com>
References: <20240216094922.257674-1-shreeya.patel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial support for the Synopsys DesignWare HDMI RX
Controller Driver used by Rockchip RK3588. The driver
supports:
 - HDMI 1.4b and 2.0 modes (HDMI 4k@60Hz)
 - RGB888, YUV422, YUV444 and YCC420 pixel formats
 - CEC
 - EDID configuration

The hardware also has Audio and HDCP capabilities, but these are
not yet supported by the driver.

Signed-off-by: Dingxian Wen <shawn.wen@rock-chips.com>
Co-developed-by: Shreeya Patel <shreeya.patel@collabora.com>
Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
---
 drivers/media/platform/Kconfig                |    1 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/synopsys/Kconfig       |    3 +
 drivers/media/platform/synopsys/Makefile      |    2 +
 .../media/platform/synopsys/hdmirx/Kconfig    |   18 +
 .../media/platform/synopsys/hdmirx/Makefile   |    4 +
 .../platform/synopsys/hdmirx/snps_hdmirx.c    | 2856 +++++++++++++++++
 .../platform/synopsys/hdmirx/snps_hdmirx.h    |  394 +++
 .../synopsys/hdmirx/snps_hdmirx_cec.c         |  289 ++
 .../synopsys/hdmirx/snps_hdmirx_cec.h         |   46 +
 10 files changed, 3614 insertions(+)
 create mode 100644 drivers/media/platform/synopsys/Kconfig
 create mode 100644 drivers/media/platform/synopsys/Makefile
 create mode 100644 drivers/media/platform/synopsys/hdmirx/Kconfig
 create mode 100644 drivers/media/platform/synopsys/hdmirx/Makefile
 create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
 create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
 create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx_cec.c
 create mode 100644 drivers/media/platform/synopsys/hdmirx/snps_hdmirx_cec.h

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 91e54215de3a..2f5a9a4fa970 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -82,6 +82,7 @@ source "drivers/media/platform/rockchip/Kconfig"
 source "drivers/media/platform/samsung/Kconfig"
 source "drivers/media/platform/st/Kconfig"
 source "drivers/media/platform/sunxi/Kconfig"
+source "drivers/media/platform/synopsys/Kconfig"
 source "drivers/media/platform/ti/Kconfig"
 source "drivers/media/platform/verisilicon/Kconfig"
 source "drivers/media/platform/via/Kconfig"
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index 3296ec1ebe16..de77c876f58a 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -25,6 +25,7 @@ obj-y += rockchip/
 obj-y += samsung/
 obj-y += st/
 obj-y += sunxi/
+obj-y += synopsys/
 obj-y += ti/
 obj-y += verisilicon/
 obj-y += via/
diff --git a/drivers/media/platform/synopsys/Kconfig b/drivers/media/platform/synopsys/Kconfig
new file mode 100644
index 000000000000..4fd521f78425
--- /dev/null
+++ b/drivers/media/platform/synopsys/Kconfig
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+source "drivers/media/platform/synopsys/hdmirx/Kconfig"
diff --git a/drivers/media/platform/synopsys/Makefile b/drivers/media/platform/synopsys/Makefile
new file mode 100644
index 000000000000..3b12c574dd67
--- /dev/null
+++ b/drivers/media/platform/synopsys/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-y += hdmirx/
diff --git a/drivers/media/platform/synopsys/hdmirx/Kconfig b/drivers/media/platform/synopsys/hdmirx/Kconfig
new file mode 100644
index 000000000000..adcdb7c2ed79
--- /dev/null
+++ b/drivers/media/platform/synopsys/hdmirx/Kconfig
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config VIDEO_SYNOPSYS_HDMIRX
+	tristate "Synopsys DesignWare HDMI Receiver driver"
+	depends on VIDEO_DEV
+	depends on ARCH_ROCKCHIP
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
+	select VIDEOBUF2_DMA_CONTIG
+	select CEC_CORE
+	select CEC_NOTIFIER
+	select HDMI
+	help
+	  Support for Synopsys HDMI HDMI RX Controller.
+	  This driver supports HDMI 2.0 version.
+
+	  To compile this driver as a module, choose M here. The module
+	  will be called synopsys_hdmirx.
diff --git a/drivers/media/platform/synopsys/hdmirx/Makefile b/drivers/media/platform/synopsys/hdmirx/Makefile
new file mode 100644
index 000000000000..2fa2d9e25300
--- /dev/null
+++ b/drivers/media/platform/synopsys/hdmirx/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+synopsys-hdmirx-objs := snps_hdmirx.o snps_hdmirx_cec.o
+
+obj-$(CONFIG_VIDEO_SYNOPSYS_HDMIRX) += synopsys-hdmirx.o
diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
new file mode 100644
index 000000000000..63a38ee089ec
--- /dev/null
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -0,0 +1,2856 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 Collabora, Ltd.
+ * Author: Shreeya Patel <shreeya.patel@collabora.com>
+ *
+ * Copyright (c) 2021 Rockchip Electronics Co. Ltd.
+ * Author: Dingxian Wen <shawn.wen@rock-chips.com>
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/clk.h>
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/dma-mapping.h>
+#include <linux/gpio/consumer.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+#include <linux/v4l2-dv-timings.h>
+#include <linux/workqueue.h>
+
+#include <media/cec.h>
+#include <media/cec-notifier.h>
+#include <media/v4l2-common.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-dv-timings.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fh.h>
+#include <media/v4l2-ioctl.h>
+#include <media/videobuf2-dma-contig.h>
+#include <media/videobuf2-v4l2.h>
+
+#include <sound/hdmi-codec.h>
+
+#include "snps_hdmirx.h"
+#include "snps_hdmirx_cec.h"
+
+static int debug;
+module_param(debug, int, 0644);
+MODULE_PARM_DESC(debug, "debug level (0-3)");
+
+#define EDID_NUM_BLOCKS_MAX			2
+#define EDID_BLOCK_SIZE				128
+#define HDMIRX_STORED_BIT_WIDTH			8
+#define IREF_CLK_FREQ_HZ			428571429
+#define MEMORY_ALIGN_ROUND_UP_BYTES		64
+#define HDMIRX_PLANE_Y				0
+#define HDMIRX_PLANE_CBCR			1
+#define RK_IRQ_HDMIRX_HDMI			210
+#define FILTER_FRAME_CNT			6
+#define RK_SIP_FIQ_CTRL				0x82000024
+#define SIP_WDT_CFG				0x82000026
+#define DETECTION_THRESHOLD			7
+
+/* fiq control sub func */
+enum {
+	RK_SIP_FIQ_CTRL_FIQ_EN = 1,
+	RK_SIP_FIQ_CTRL_FIQ_DIS,
+	RK_SIP_FIQ_CTRL_SET_AFF
+};
+
+/* SIP_WDT_CONFIG call types  */
+enum {
+	WDT_START = 0,
+	WDT_STOP = 1,
+	WDT_PING = 2,
+};
+
+enum hdmirx_pix_fmt {
+	HDMIRX_RGB888 = 0,
+	HDMIRX_YUV422 = 1,
+	HDMIRX_YUV444 = 2,
+	HDMIRX_YUV420 = 3,
+};
+
+enum ddr_store_fmt {
+	STORE_RGB888 = 0,
+	STORE_RGBA_ARGB,
+	STORE_YUV420_8BIT,
+	STORE_YUV420_10BIT,
+	STORE_YUV422_8BIT,
+	STORE_YUV422_10BIT,
+	STORE_YUV444_8BIT,
+	STORE_YUV420_16BIT = 8,
+	STORE_YUV422_16BIT = 9,
+};
+
+enum hdmirx_reg_attr {
+	HDMIRX_ATTR_RW = 0,
+	HDMIRX_ATTR_RO = 1,
+	HDMIRX_ATTR_WO = 2,
+	HDMIRX_ATTR_RE = 3,
+};
+
+enum hdmirx_edid_version {
+	HDMIRX_EDID_USER = 0,
+	HDMIRX_EDID_340M = 1,
+	HDMIRX_EDID_600M = 2,
+};
+
+enum {
+	HDMIRX_RST_A,
+	HDMIRX_RST_P,
+	HDMIRX_RST_REF,
+	HDMIRX_RST_BIU,
+	HDMIRX_NUM_RST,
+};
+
+static const char * const pix_fmt_str[] = {
+	"RGB888",
+	"YUV422",
+	"YUV444",
+	"YUV420",
+};
+
+struct hdmirx_buffer {
+	struct vb2_v4l2_buffer vb;
+	struct list_head queue;
+	u32 buff_addr[VIDEO_MAX_PLANES];
+};
+
+struct hdmirx_output_fmt {
+	u32 fourcc;
+	u8 cplanes;
+	u8 mplanes;
+	u8 bpp[VIDEO_MAX_PLANES];
+};
+
+struct hdmirx_stream {
+	struct snps_hdmirx_dev *hdmirx_dev;
+	struct video_device vdev;
+	struct vb2_queue buf_queue;
+	struct list_head buf_head;
+	struct hdmirx_buffer *curr_buf;
+	struct hdmirx_buffer *next_buf;
+	struct v4l2_pix_format_mplane pixm;
+	const struct hdmirx_output_fmt *out_fmt;
+	struct mutex vlock;
+	spinlock_t vbq_lock;
+	bool stopping;
+	wait_queue_head_t wq_stopped;
+	u32 frame_idx;
+	u32 line_flag_int_cnt;
+	u32 irq_stat;
+};
+
+struct snps_hdmirx_dev {
+	struct device *dev;
+	struct device *codec_dev;
+	struct hdmirx_stream stream;
+	struct v4l2_device v4l2_dev;
+	struct v4l2_ctrl_handler hdl;
+	struct v4l2_ctrl *detect_tx_5v_ctrl;
+	struct v4l2_dv_timings timings;
+	struct gpio_desc *detect_5v_gpio;
+	struct work_struct work_wdt_config;
+	struct delayed_work delayed_work_hotplug;
+	struct delayed_work delayed_work_res_change;
+	struct delayed_work delayed_work_heartbeat;
+	struct cec_notifier *cec_notifier;
+	struct hdmirx_cec *cec;
+	struct mutex stream_lock;
+	struct mutex work_lock;
+	struct reset_control_bulk_data resets[HDMIRX_NUM_RST];
+	struct clk_bulk_data *clks;
+	struct regmap *grf;
+	struct regmap *vo1_grf;
+	struct completion cr_write_done;
+	struct completion timer_base_lock;
+	struct completion avi_pkt_rcv;
+	enum hdmirx_edid_version edid_version;
+	enum hdmirx_pix_fmt pix_fmt;
+	void __iomem *regs;
+	int hdmi_irq;
+	int dma_irq;
+	int det_irq;
+	bool hpd_trigger_level;
+	bool tmds_clk_ratio;
+	bool is_dvi_mode;
+	bool got_timing;
+	u32 num_clks;
+	u32 edid_blocks_written;
+	u32 cur_vic;
+	u32 cur_fmt_fourcc;
+	u32 color_depth;
+	u8 edid[EDID_BLOCK_SIZE * 2];
+	hdmi_codec_plugged_cb plugged_cb;
+	spinlock_t rst_lock;
+};
+
+static u8 edid_init_data_340M[] = {
+	0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00,
+	0x49, 0x70, 0x88, 0x35, 0x01, 0x00, 0x00, 0x00,
+	0x2D, 0x1F, 0x01, 0x03, 0x80, 0x78, 0x44, 0x78,
+	0x0A, 0xCF, 0x74, 0xA3, 0x57, 0x4C, 0xB0, 0x23,
+	0x09, 0x48, 0x4C, 0x21, 0x08, 0x00, 0x61, 0x40,
+	0x01, 0x01, 0x81, 0x00, 0x95, 0x00, 0xA9, 0xC0,
+	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, 0x3A,
+	0x80, 0x18, 0x71, 0x38, 0x2D, 0x40, 0x58, 0x2C,
+	0x45, 0x00, 0x20, 0xC2, 0x31, 0x00, 0x00, 0x1E,
+	0x01, 0x1D, 0x00, 0x72, 0x51, 0xD0, 0x1E, 0x20,
+	0x6E, 0x28, 0x55, 0x00, 0x20, 0xC2, 0x31, 0x00,
+	0x00, 0x1E, 0x00, 0x00, 0x00, 0xFC, 0x00, 0x52,
+	0x4B, 0x2D, 0x55, 0x48, 0x44, 0x0A, 0x20, 0x20,
+	0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xFD,
+	0x00, 0x3B, 0x46, 0x1F, 0x8C, 0x3C, 0x00, 0x0A,
+	0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x01, 0xA7,
+
+	0x02, 0x03, 0x2F, 0xD1, 0x51, 0x07, 0x16, 0x14,
+	0x05, 0x01, 0x03, 0x12, 0x13, 0x84, 0x22, 0x1F,
+	0x90, 0x5D, 0x5E, 0x5F, 0x60, 0x61, 0x23, 0x09,
+	0x07, 0x07, 0x83, 0x01, 0x00, 0x00, 0x67, 0x03,
+	0x0C, 0x00, 0x30, 0x00, 0x10, 0x44, 0xE3, 0x05,
+	0x03, 0x01, 0xE4, 0x0F, 0x00, 0x80, 0x01, 0x02,
+	0x3A, 0x80, 0x18, 0x71, 0x38, 0x2D, 0x40, 0x58,
+	0x2C, 0x45, 0x00, 0x20, 0xC2, 0x31, 0x00, 0x00,
+	0x1E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1F,
+};
+
+static u8 edid_init_data_600M[] = {
+	0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00,
+	0x49, 0x70, 0x88, 0x35, 0x01, 0x00, 0x00, 0x00,
+	0x2D, 0x1F, 0x01, 0x03, 0x80, 0x78, 0x44, 0x78,
+	0x0A, 0xCF, 0x74, 0xA3, 0x57, 0x4C, 0xB0, 0x23,
+	0x09, 0x48, 0x4C, 0x00, 0x00, 0x00, 0x01, 0x01,
+	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
+	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x08, 0xE8,
+	0x00, 0x30, 0xF2, 0x70, 0x5A, 0x80, 0xB0, 0x58,
+	0x8A, 0x00, 0xC4, 0x8E, 0x21, 0x00, 0x00, 0x1E,
+	0x08, 0xE8, 0x00, 0x30, 0xF2, 0x70, 0x5A, 0x80,
+	0xB0, 0x58, 0x8A, 0x00, 0x20, 0xC2, 0x31, 0x00,
+	0x00, 0x1E, 0x00, 0x00, 0x00, 0xFC, 0x00, 0x52,
+	0x4B, 0x2D, 0x55, 0x48, 0x44, 0x0A, 0x20, 0x20,
+	0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xFD,
+	0x00, 0x3B, 0x46, 0x1F, 0x8C, 0x3C, 0x00, 0x0A,
+	0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x01, 0x39,
+
+	0x02, 0x03, 0x21, 0xD2, 0x41, 0x61, 0x23, 0x09,
+	0x07, 0x07, 0x83, 0x01, 0x00, 0x00, 0x66, 0x03,
+	0x0C, 0x00, 0x30, 0x00, 0x10, 0x67, 0xD8, 0x5D,
+	0xC4, 0x01, 0x78, 0xC0, 0x07, 0xE3, 0x05, 0x03,
+	0x01, 0x08, 0xE8, 0x00, 0x30, 0xF2, 0x70, 0x5A,
+	0x80, 0xB0, 0x58, 0x8A, 0x00, 0xC4, 0x8E, 0x21,
+	0x00, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE8,
+};
+
+static const struct v4l2_dv_timings cea640x480 = V4L2_DV_BT_CEA_640X480P59_94;
+
+static const struct v4l2_dv_timings_cap hdmirx_timings_cap = {
+	.type = V4L2_DV_BT_656_1120,
+	.reserved = { 0 },
+	V4L2_INIT_BT_TIMINGS(640, 4096,			/* min/max width */
+			     480, 2160,			/* min/max height */
+			     20000000, 600000000,	/* min/max pixelclock */
+			     /* standards */
+			     V4L2_DV_BT_STD_CEA861,
+			     /* capabilities */
+			     V4L2_DV_BT_CAP_PROGRESSIVE |
+			     V4L2_DV_BT_CAP_INTERLACED)
+};
+
+static const struct hdmirx_output_fmt g_out_fmts[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_BGR24,
+		.cplanes = 1,
+		.mplanes = 1,
+		.bpp = { 24 },
+	}, {
+		.fourcc = V4L2_PIX_FMT_NV24,
+		.cplanes = 2,
+		.mplanes = 1,
+		.bpp = { 8, 16 },
+	}, {
+		.fourcc = V4L2_PIX_FMT_NV16,
+		.cplanes = 2,
+		.mplanes = 1,
+		.bpp = { 8, 16 },
+	}, {
+		.fourcc = V4L2_PIX_FMT_NV12,
+		.cplanes = 2,
+		.mplanes = 1,
+		.bpp = { 8, 16 },
+	}
+};
+
+static void hdmirx_writel(struct snps_hdmirx_dev *hdmirx_dev, int reg, u32 val)
+{
+	unsigned long lock_flags = 0;
+
+	spin_lock_irqsave(&hdmirx_dev->rst_lock, lock_flags);
+	writel(val, hdmirx_dev->regs + reg);
+	spin_unlock_irqrestore(&hdmirx_dev->rst_lock, lock_flags);
+}
+
+static u32 hdmirx_readl(struct snps_hdmirx_dev *hdmirx_dev, int reg)
+{
+	unsigned long lock_flags = 0;
+	u32 val;
+
+	spin_lock_irqsave(&hdmirx_dev->rst_lock, lock_flags);
+	val = readl(hdmirx_dev->regs + reg);
+	spin_unlock_irqrestore(&hdmirx_dev->rst_lock, lock_flags);
+	return val;
+}
+
+static void hdmirx_reset_dma(struct snps_hdmirx_dev *hdmirx_dev)
+{
+	unsigned long lock_flags = 0;
+
+	spin_lock_irqsave(&hdmirx_dev->rst_lock, lock_flags);
+	reset_control_reset(hdmirx_dev->resets[0].rstc);
+	spin_unlock_irqrestore(&hdmirx_dev->rst_lock, lock_flags);
+}
+
+static void hdmirx_update_bits(struct snps_hdmirx_dev *hdmirx_dev, int reg,
+			       u32 mask, u32 data)
+{
+	unsigned long lock_flags = 0;
+	u32 val;
+
+	spin_lock_irqsave(&hdmirx_dev->rst_lock, lock_flags);
+	val = readl(hdmirx_dev->regs + reg) & ~mask;
+	val |= (data & mask);
+	writel(val, hdmirx_dev->regs + reg);
+	spin_unlock_irqrestore(&hdmirx_dev->rst_lock, lock_flags);
+}
+
+static int hdmirx_subscribe_event(struct v4l2_fh *fh,
+				  const struct v4l2_event_subscription *sub)
+{
+	switch (sub->type) {
+	case V4L2_EVENT_SOURCE_CHANGE:
+		if (fh->vdev->vfl_dir == VFL_DIR_RX)
+			return v4l2_src_change_event_subscribe(fh, sub);
+		break;
+	case V4L2_EVENT_CTRL:
+		return v4l2_ctrl_subscribe_event(fh, sub);
+	default:
+		return v4l2_ctrl_subscribe_event(fh, sub);
+	}
+
+	return -EINVAL;
+}
+
+static bool tx_5v_power_present(struct snps_hdmirx_dev *hdmirx_dev)
+{
+	bool ret;
+	int val, i, cnt;
+
+	cnt = 0;
+	for (i = 0; i < 10; i++) {
+		usleep_range(1000, 1100);
+		val = gpiod_get_value(hdmirx_dev->detect_5v_gpio);
+		if (val > 0)
+			cnt++;
+		if (cnt >= DETECTION_THRESHOLD)
+			break;
+	}
+
+	ret = (cnt >= DETECTION_THRESHOLD) ? true : false;
+	v4l2_dbg(3, debug, &hdmirx_dev->v4l2_dev, "%s: %d\n", __func__, ret);
+
+	return ret;
+}
+
+static bool signal_not_lock(struct snps_hdmirx_dev *hdmirx_dev)
+{
+	u32 mu_status, dma_st10, cmu_st;
+
+	mu_status = hdmirx_readl(hdmirx_dev, MAINUNIT_STATUS);
+	dma_st10 = hdmirx_readl(hdmirx_dev, DMA_STATUS10);
+	cmu_st = hdmirx_readl(hdmirx_dev, CMU_STATUS);
+
+	if ((mu_status & TMDSVALID_STABLE_ST) &&
+	    (dma_st10 & HDMIRX_LOCK) &&
+	    (cmu_st & TMDSQPCLK_LOCKED_ST))
+		return false;
+
+	return true;
+}
+
+static void hdmirx_get_colordepth(struct snps_hdmirx_dev *hdmirx_dev)
+{
+	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
+	u32 val, color_depth_reg;
+
+	val = hdmirx_readl(hdmirx_dev, DMA_STATUS11);
+	color_depth_reg = (val & HDMIRX_COLOR_DEPTH_MASK) >> 3;
+
+	switch (color_depth_reg) {
+	case 0x4:
+		hdmirx_dev->color_depth = 24;
+		break;
+	case 0x5:
+		hdmirx_dev->color_depth = 30;
+		break;
+	case 0x6:
+		hdmirx_dev->color_depth = 36;
+		break;
+	case 0x7:
+		hdmirx_dev->color_depth = 48;
+		break;
+	default:
+		hdmirx_dev->color_depth = 24;
+		break;
+	}
+
+	v4l2_dbg(1, debug, v4l2_dev, "%s: color_depth: %d, reg_val:%d\n",
+		 __func__, hdmirx_dev->color_depth, color_depth_reg);
+}
+
+static void hdmirx_get_pix_fmt(struct snps_hdmirx_dev *hdmirx_dev)
+{
+	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
+	u32 val;
+
+	val = hdmirx_readl(hdmirx_dev, DMA_STATUS11);
+	hdmirx_dev->pix_fmt = val & HDMIRX_FORMAT_MASK;
+
+	switch (hdmirx_dev->pix_fmt) {
+	case HDMIRX_RGB888:
+		hdmirx_dev->cur_fmt_fourcc = V4L2_PIX_FMT_BGR24;
+		break;
+	case HDMIRX_YUV422:
+		hdmirx_dev->cur_fmt_fourcc = V4L2_PIX_FMT_NV16;
+		break;
+	case HDMIRX_YUV444:
+		hdmirx_dev->cur_fmt_fourcc = V4L2_PIX_FMT_NV24;
+		break;
+	case HDMIRX_YUV420:
+		hdmirx_dev->cur_fmt_fourcc = V4L2_PIX_FMT_NV12;
+		break;
+	default:
+		v4l2_err(v4l2_dev,
+			 "%s: err pix_fmt: %d, set RGB888 as default\n",
+			 __func__, hdmirx_dev->pix_fmt);
+		hdmirx_dev->pix_fmt = HDMIRX_RGB888;
+		hdmirx_dev->cur_fmt_fourcc = V4L2_PIX_FMT_BGR24;
+		break;
+	}
+
+	v4l2_dbg(1, debug, v4l2_dev, "%s: pix_fmt: %s\n", __func__,
+		 pix_fmt_str[hdmirx_dev->pix_fmt]);
+}
+
+static void hdmirx_get_timings(struct snps_hdmirx_dev *hdmirx_dev,
+			       struct v4l2_bt_timings *bt, bool from_dma)
+{
+	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
+	u32 hact, vact, htotal, vtotal, fps;
+	u32 hfp, hs, hbp, vfp, vs, vbp;
+	u32 val;
+
+	if (from_dma) {
+		val = hdmirx_readl(hdmirx_dev, DMA_STATUS2);
+		hact = (val >> 16) & 0xffff;
+		vact = val & 0xffff;
+		val = hdmirx_readl(hdmirx_dev, DMA_STATUS3);
+		htotal = (val >> 16) & 0xffff;
+		vtotal = val & 0xffff;
+		val = hdmirx_readl(hdmirx_dev, DMA_STATUS4);
+		hs = (val >> 16) & 0xffff;
+		vs = val & 0xffff;
+		val = hdmirx_readl(hdmirx_dev, DMA_STATUS5);
+		hbp = (val >> 16) & 0xffff;
+		vbp = val & 0xffff;
+		hfp = htotal - hact - hs - hbp;
+		vfp = vtotal - vact - vs - vbp;
+	} else {
+		val = hdmirx_readl(hdmirx_dev, VMON_STATUS1);
+		hs = (val >> 16) & 0xffff;
+		hfp = val & 0xffff;
+		val = hdmirx_readl(hdmirx_dev, VMON_STATUS2);
+		hbp = val & 0xffff;
+		val = hdmirx_readl(hdmirx_dev, VMON_STATUS3);
+		htotal = (val >> 16) & 0xffff;
+		hact = val & 0xffff;
+		val = hdmirx_readl(hdmirx_dev, VMON_STATUS4);
+		vs = (val >> 16) & 0xffff;
+		vfp = val & 0xffff;
+		val = hdmirx_readl(hdmirx_dev, VMON_STATUS5);
+		vbp = val & 0xffff;
+		val = hdmirx_readl(hdmirx_dev, VMON_STATUS6);
+		vtotal = (val >> 16) & 0xffff;
+		vact = val & 0xffff;
+		if (hdmirx_dev->pix_fmt == HDMIRX_YUV420)
+			hact *= 2;
+	}
+	if (hdmirx_dev->pix_fmt == HDMIRX_YUV420)
+		htotal *= 2;
+	fps = (bt->pixelclock + (htotal * vtotal) / 2) / (htotal * vtotal);
+	if (hdmirx_dev->pix_fmt == HDMIRX_YUV420)
+		fps *= 2;
+	bt->width = hact;
+	bt->height = vact;
+	bt->hfrontporch = hfp;
+	bt->hsync = hs;
+	bt->hbackporch = hbp;
+	bt->vfrontporch = vfp;
+	bt->vsync = vs;
+	bt->vbackporch = vbp;
+
+	v4l2_dbg(1, debug, v4l2_dev, "get timings from %s\n", from_dma ? "dma" : "ctrl");
+	v4l2_dbg(1, debug, v4l2_dev, "act:%ux%u, total:%ux%u, fps:%u, pixclk:%llu\n",
+		 bt->width, bt->height, htotal, vtotal, fps, bt->pixelclock);
+
+	v4l2_dbg(2, debug, v4l2_dev, "hfp:%u, hs:%u, hbp:%u, vfp:%u, vs:%u, vbp:%u\n",
+		 bt->hfrontporch, bt->hsync, bt->hbackporch,
+		 bt->vfrontporch, bt->vsync, bt->vbackporch);
+}
+
+static bool hdmirx_check_timing_valid(struct v4l2_bt_timings *bt)
+{
+	if (bt->width < 100 || bt->width > 5000 ||
+	    bt->height < 100 || bt->height > 5000)
+		return false;
+
+	if (!bt->hsync || bt->hsync > 200 ||
+	    !bt->vsync || bt->vsync > 100)
+		return false;
+
+	if (!bt->hbackporch || bt->hbackporch > 2000 ||
+	    !bt->vbackporch || bt->vbackporch > 2000)
+		return false;
+
+	if (!bt->hfrontporch || bt->hfrontporch > 2000 ||
+	    !bt->vfrontporch || bt->vfrontporch > 2000)
+		return false;
+
+	return true;
+}
+
+static int hdmirx_get_detected_timings(struct snps_hdmirx_dev *hdmirx_dev,
+				       struct v4l2_dv_timings *timings,
+				       bool from_dma)
+{
+	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
+	struct v4l2_bt_timings *bt = &timings->bt;
+	u32 field_type, color_depth, deframer_st;
+	u32 val, tmdsqpclk_freq, pix_clk;
+	u64 tmp_data, tmds_clk;
+
+	memset(timings, 0, sizeof(struct v4l2_dv_timings));
+	timings->type = V4L2_DV_BT_656_1120;
+
+	val = hdmirx_readl(hdmirx_dev, DMA_STATUS11);
+	field_type = (val & HDMIRX_TYPE_MASK) >> 7;
+	hdmirx_get_pix_fmt(hdmirx_dev);
+	bt->interlaced = field_type & BIT(0) ? V4L2_DV_INTERLACED : V4L2_DV_PROGRESSIVE;
+	val = hdmirx_readl(hdmirx_dev, PKTDEC_AVIIF_PB7_4);
+	hdmirx_dev->cur_vic =  val | VIC_VAL_MASK;
+	hdmirx_get_colordepth(hdmirx_dev);
+	color_depth = hdmirx_dev->color_depth;
+	deframer_st = hdmirx_readl(hdmirx_dev, DEFRAMER_STATUS);
+	hdmirx_dev->is_dvi_mode = deframer_st & OPMODE_STS_MASK ? false : true;
+	tmdsqpclk_freq = hdmirx_readl(hdmirx_dev, CMU_TMDSQPCLK_FREQ);
+	tmds_clk = tmdsqpclk_freq * 4 * 1000;
+	tmp_data = tmds_clk * 24;
+	do_div(tmp_data, color_depth);
+	pix_clk = tmp_data;
+	bt->pixelclock = pix_clk;
+
+	hdmirx_get_timings(hdmirx_dev, bt, from_dma);
+	if (bt->interlaced == V4L2_DV_INTERLACED) {
+		bt->height *= 2;
+		bt->il_vsync = bt->vsync + 1;
+	}
+
+	v4l2_dbg(2, debug, v4l2_dev, "tmds_clk:%llu\n", tmds_clk);
+	v4l2_dbg(1, debug, v4l2_dev, "interlace:%d, fmt:%d, vic:%d, color:%d, mode:%s\n",
+		 bt->interlaced, hdmirx_dev->pix_fmt,
+		 hdmirx_dev->cur_vic, hdmirx_dev->color_depth,
+		 hdmirx_dev->is_dvi_mode ? "dvi" : "hdmi");
+	v4l2_dbg(2, debug, v4l2_dev, "deframer_st:%#x\n", deframer_st);
+
+	if (!hdmirx_check_timing_valid(bt))
+		return -EINVAL;
+
+	return 0;
+}
+
+static bool port_no_link(struct snps_hdmirx_dev *hdmirx_dev)
+{
+	return !tx_5v_power_present(hdmirx_dev);
+}
+
+static int hdmirx_query_dv_timings(struct file *file, void *_fh,
+				   struct v4l2_dv_timings *timings)
+{
+	struct hdmirx_stream *stream = video_drvdata(file);
+	struct snps_hdmirx_dev *hdmirx_dev = stream->hdmirx_dev;
+	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
+	int ret;
+
+	if (port_no_link(hdmirx_dev)) {
+		v4l2_err(v4l2_dev, "%s: port has no link\n", __func__);
+		return -ENOLINK;
+	}
+
+	if (signal_not_lock(hdmirx_dev)) {
+		v4l2_err(v4l2_dev, "%s: signal is not locked\n", __func__);
+		return -ENOLCK;
+	}
+
+	/*
+	 * query dv timings is during preview, dma's timing is stable,
+	 * so we can get from DMA. If the current resolution is negative,
+	 * get timing from CTRL need to change polarity of sync,
+	 * maybe cause DMA errors.
+	 */
+	ret = hdmirx_get_detected_timings(hdmirx_dev, timings, true);
+	if (ret)
+		return ret;
+
+	if (debug)
+		v4l2_print_dv_timings(hdmirx_dev->v4l2_dev.name,
+				      "query_dv_timings: ", timings, false);
+
+	if (!v4l2_valid_dv_timings(timings, &hdmirx_timings_cap, NULL, NULL)) {
+		v4l2_dbg(1, debug, v4l2_dev, "%s: timings out of range\n", __func__);
+		return -ERANGE;
+	}
+
+	return 0;
+}
+
+static void hdmirx_hpd_ctrl(struct snps_hdmirx_dev *hdmirx_dev, bool en)
+{
+	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
+
+	v4l2_dbg(1, debug, v4l2_dev, "%s: %sable, hpd_trigger_level:%d\n",
+		 __func__, en ? "en" : "dis",
+		 hdmirx_dev->hpd_trigger_level);
+	hdmirx_update_bits(hdmirx_dev, SCDC_CONFIG, HPDLOW, en ? 0 : HPDLOW);
+	en = hdmirx_dev->hpd_trigger_level ? en : !en;
+	hdmirx_writel(hdmirx_dev, CORE_CONFIG, en);
+}
+
+static int hdmirx_write_edid(struct snps_hdmirx_dev *hdmirx_dev,
+			     struct v4l2_edid *edid, bool hpd_up)
+{
+	u32 edid_len = edid->blocks * EDID_BLOCK_SIZE;
+	char data[300];
+	u32 i;
+
+	memset(edid->reserved, 0, sizeof(edid->reserved));
+	if (edid->pad)
+		return -EINVAL;
+
+	if (edid->start_block)
+		return -EINVAL;
+
+	if (edid->blocks > EDID_NUM_BLOCKS_MAX) {
+		edid->blocks = EDID_NUM_BLOCKS_MAX;
+		return -E2BIG;
+	}
+
+	if (!edid->blocks) {
+		hdmirx_dev->edid_blocks_written = 0;
+		return 0;
+	}
+
+	memset(&hdmirx_dev->edid, 0, sizeof(hdmirx_dev->edid));
+	hdmirx_hpd_ctrl(hdmirx_dev, false);
+	hdmirx_update_bits(hdmirx_dev, DMA_CONFIG11,
+			   EDID_READ_EN_MASK |
+			   EDID_WRITE_EN_MASK |
+			   EDID_SLAVE_ADDR_MASK,
+			   EDID_READ_EN(0) |
+			   EDID_WRITE_EN(1) |
+			   EDID_SLAVE_ADDR(0x50));
+	for (i = 0; i < edid_len; i++)
+		hdmirx_writel(hdmirx_dev, DMA_CONFIG10, edid->edid[i]);
+
+	/* read out for debug */
+	if (debug >= 2) {
+		hdmirx_update_bits(hdmirx_dev, DMA_CONFIG11,
+				   EDID_READ_EN_MASK |
+				   EDID_WRITE_EN_MASK,
+				   EDID_READ_EN(1) |
+				   EDID_WRITE_EN(0));
+		edid_len = edid_len > sizeof(data) ? sizeof(data) : edid_len;
+		memset(data, 0, sizeof(data));
+		for (i = 0; i < edid_len; i++)
+			data[i] = hdmirx_readl(hdmirx_dev, DMA_STATUS14);
+
+		print_hex_dump(KERN_INFO, "", DUMP_PREFIX_NONE, 16, 1, data,
+			       edid_len, false);
+	}
+
+	/*
+	 * You must set EDID_READ_EN & EDID_WRITE_EN bit to 0,
+	 * when the read/write edid operation is completed.Otherwise, it
+	 * will affect the reading and writing of other registers
+	 */
+	hdmirx_update_bits(hdmirx_dev, DMA_CONFIG11,
+			   EDID_READ_EN_MASK | EDID_WRITE_EN_MASK,
+			   EDID_READ_EN(0) | EDID_WRITE_EN(0));
+
+	hdmirx_dev->edid_blocks_written = edid->blocks;
+	memcpy(&hdmirx_dev->edid, edid->edid, edid->blocks * EDID_BLOCK_SIZE);
+	if (hpd_up) {
+		if (tx_5v_power_present(hdmirx_dev))
+			hdmirx_hpd_ctrl(hdmirx_dev, true);
+	}
+
+	return 0;
+}
+
+/*
+ * Before clearing interrupt, we need to read the interrupt status.
+ */
+static inline void hdmirx_clear_interrupt(struct snps_hdmirx_dev *hdmirx_dev,
+					  u32 reg, u32 val)
+{
+	/* (interrupt status register) = (interrupt clear register) - 0x8 */
+	hdmirx_readl(hdmirx_dev, reg - 0x8);
+	hdmirx_writel(hdmirx_dev, reg, val);
+}
+
+static void hdmirx_interrupts_setup(struct snps_hdmirx_dev *hdmirx_dev, bool en)
+{
+	v4l2_dbg(1, debug, &hdmirx_dev->v4l2_dev, "%s: %sable\n",
+		 __func__, en ? "en" : "dis");
+
+	/* Note: In DVI mode, it needs to be written twice to take effect. */
+	hdmirx_clear_interrupt(hdmirx_dev, MAINUNIT_0_INT_CLEAR, 0xffffffff);
+	hdmirx_clear_interrupt(hdmirx_dev, MAINUNIT_2_INT_CLEAR, 0xffffffff);
+	hdmirx_clear_interrupt(hdmirx_dev, MAINUNIT_0_INT_CLEAR, 0xffffffff);
+	hdmirx_clear_interrupt(hdmirx_dev, MAINUNIT_2_INT_CLEAR, 0xffffffff);
+	hdmirx_clear_interrupt(hdmirx_dev, AVPUNIT_0_INT_CLEAR, 0xffffffff);
+
+	if (en) {
+		hdmirx_update_bits(hdmirx_dev, MAINUNIT_0_INT_MASK_N,
+				   TMDSQPCLK_OFF_CHG | TMDSQPCLK_LOCKED_CHG,
+				   TMDSQPCLK_OFF_CHG | TMDSQPCLK_LOCKED_CHG);
+		hdmirx_update_bits(hdmirx_dev, MAINUNIT_2_INT_MASK_N,
+				   TMDSVALID_STABLE_CHG, TMDSVALID_STABLE_CHG);
+		hdmirx_update_bits(hdmirx_dev, AVPUNIT_0_INT_MASK_N,
+				   CED_DYN_CNT_CH2_IRQ |
+				   CED_DYN_CNT_CH1_IRQ |
+				   CED_DYN_CNT_CH0_IRQ,
+				   CED_DYN_CNT_CH2_IRQ |
+				   CED_DYN_CNT_CH1_IRQ |
+				   CED_DYN_CNT_CH0_IRQ);
+	} else {
+		hdmirx_writel(hdmirx_dev, MAINUNIT_0_INT_MASK_N, 0);
+		hdmirx_writel(hdmirx_dev, MAINUNIT_2_INT_MASK_N, 0);
+		hdmirx_writel(hdmirx_dev, AVPUNIT_0_INT_MASK_N, 0);
+	}
+}
+
+static void hdmirx_plugout(struct snps_hdmirx_dev *hdmirx_dev)
+{
+	struct arm_smccc_res res;
+
+	hdmirx_update_bits(hdmirx_dev, SCDC_CONFIG, POWERPROVIDED, 0);
+	hdmirx_interrupts_setup(hdmirx_dev, false);
+	hdmirx_hpd_ctrl(hdmirx_dev, false);
+	hdmirx_update_bits(hdmirx_dev, DMA_CONFIG6, HDMIRX_DMA_EN, 0);
+	hdmirx_update_bits(hdmirx_dev, DMA_CONFIG4,
+			   LINE_FLAG_INT_EN |
+			   HDMIRX_DMA_IDLE_INT |
+			   HDMIRX_LOCK_DISABLE_INT |
+			   LAST_FRAME_AXI_UNFINISH_INT_EN |
+			   FIFO_OVERFLOW_INT_EN |
+			   FIFO_UNDERFLOW_INT_EN |
+			   HDMIRX_AXI_ERROR_INT_EN, 0);
+	hdmirx_reset_dma(hdmirx_dev);
+	hdmirx_update_bits(hdmirx_dev, PHY_CONFIG, HDMI_DISABLE | PHY_RESET |
+			   PHY_PDDQ, HDMI_DISABLE);
+	hdmirx_writel(hdmirx_dev, PHYCREG_CONFIG0, 0x0);
+	cancel_delayed_work(&hdmirx_dev->delayed_work_res_change);
+	cancel_delayed_work_sync(&hdmirx_dev->delayed_work_heartbeat);
+	flush_work(&hdmirx_dev->work_wdt_config);
+	arm_smccc_smc(SIP_WDT_CFG, WDT_STOP, 0, 0, 0, 0, 0, 0, &res);
+}
+
+static int hdmirx_set_edid(struct file *file, void *fh, struct v4l2_edid *edid)
+{
+	struct hdmirx_stream *stream = video_drvdata(file);
+	struct snps_hdmirx_dev *hdmirx_dev = stream->hdmirx_dev;
+	struct arm_smccc_res res;
+	int ret;
+
+	disable_irq(hdmirx_dev->hdmi_irq);
+	disable_irq(hdmirx_dev->dma_irq);
+	arm_smccc_smc(RK_SIP_FIQ_CTRL, RK_SIP_FIQ_CTRL_FIQ_DIS,
+		      RK_IRQ_HDMIRX_HDMI, 0, 0, 0, 0, 0, &res);
+
+	if (tx_5v_power_present(hdmirx_dev))
+		hdmirx_plugout(hdmirx_dev);
+	ret = hdmirx_write_edid(hdmirx_dev, edid, false);
+	if (ret)
+		return ret;
+	hdmirx_dev->edid_version = HDMIRX_EDID_USER;
+
+	enable_irq(hdmirx_dev->hdmi_irq);
+	enable_irq(hdmirx_dev->dma_irq);
+	arm_smccc_smc(RK_SIP_FIQ_CTRL, RK_SIP_FIQ_CTRL_FIQ_EN,
+		      RK_IRQ_HDMIRX_HDMI, 0, 0, 0, 0, 0, &res);
+	queue_delayed_work(system_unbound_wq,
+			   &hdmirx_dev->delayed_work_hotplug,
+			   msecs_to_jiffies(500));
+	return 0;
+}
+
+static int hdmirx_get_edid(struct file *file, void *fh, struct v4l2_edid *edid)
+{
+	struct hdmirx_stream *stream = video_drvdata(file);
+	struct snps_hdmirx_dev *hdmirx_dev = stream->hdmirx_dev;
+	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
+
+	memset(edid->reserved, 0, sizeof(edid->reserved));
+
+	if (edid->pad)
+		return -EINVAL;
+
+	if (!edid->start_block && !edid->blocks) {
+		edid->blocks = hdmirx_dev->edid_blocks_written;
+		return 0;
+	}
+
+	if (!hdmirx_dev->edid_blocks_written)
+		return -ENODATA;
+
+	if (edid->start_block >= hdmirx_dev->edid_blocks_written || !edid->blocks)
+		return -EINVAL;
+
+	if (edid->start_block + edid->blocks > hdmirx_dev->edid_blocks_written)
+		edid->blocks = hdmirx_dev->edid_blocks_written - edid->start_block;
+
+	memcpy(edid->edid, &hdmirx_dev->edid, edid->blocks * EDID_BLOCK_SIZE);
+
+	v4l2_dbg(1, debug, v4l2_dev, "%s: read EDID:\n", __func__);
+	if (debug > 0)
+		print_hex_dump(KERN_INFO, "", DUMP_PREFIX_NONE, 16, 1,
+			       edid->edid, edid->blocks * EDID_BLOCK_SIZE, false);
+
+	return 0;
+}
+
+static int hdmirx_g_parm(struct file *file, void *priv,
+			 struct v4l2_streamparm *parm)
+{
+	struct hdmirx_stream *stream = video_drvdata(file);
+	struct snps_hdmirx_dev *hdmirx_dev = stream->hdmirx_dev;
+	struct v4l2_fract fps;
+
+	if (parm->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		return -EINVAL;
+
+	fps = v4l2_calc_timeperframe(&hdmirx_dev->timings);
+	parm->parm.capture.timeperframe.numerator = fps.numerator;
+	parm->parm.capture.timeperframe.denominator = fps.denominator;
+
+	return 0;
+}
+
+static int hdmirx_dv_timings_cap(struct file *file, void *fh,
+				 struct v4l2_dv_timings_cap *cap)
+{
+	*cap = hdmirx_timings_cap;
+	return 0;
+}
+
+static int hdmirx_enum_dv_timings(struct file *file, void *_fh,
+				  struct v4l2_enum_dv_timings *timings)
+{
+	return v4l2_enum_dv_timings_cap(timings, &hdmirx_timings_cap, NULL, NULL);
+}
+
+static void hdmirx_scdc_init(struct snps_hdmirx_dev *hdmirx_dev)
+{
+	hdmirx_update_bits(hdmirx_dev, I2C_SLAVE_CONFIG1,
+			   I2C_SDA_OUT_HOLD_VALUE_QST_MASK |
+			   I2C_SDA_IN_HOLD_VALUE_QST_MASK,
+			   I2C_SDA_OUT_HOLD_VALUE_QST(0x80) |
+			   I2C_SDA_IN_HOLD_VALUE_QST(0x15));
+	hdmirx_update_bits(hdmirx_dev, SCDC_REGBANK_CONFIG0,
+			   SCDC_SINKVERSION_QST_MASK,
+			   SCDC_SINKVERSION_QST(1));
+}
+
+static int wait_reg_bit_status(struct snps_hdmirx_dev *hdmirx_dev, u32 reg,
+			       u32 bit_mask, u32 expect_val, bool is_grf,
+			       u32 ms)
+{
+	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
+	u32 i, val;
+
+	for (i = 0; i < ms; i++) {
+		if (is_grf)
+			regmap_read(hdmirx_dev->grf, reg, &val);
+		else
+			val = hdmirx_readl(hdmirx_dev, reg);
+
+		if ((val & bit_mask) == expect_val) {
+			v4l2_dbg(2, debug, v4l2_dev,
+				 "%s:  i:%d, time: %dms\n", __func__, i, ms);
+			break;
+		}
+		usleep_range(1000, 1010);
+	}
+
+	if (i == ms)
+		return -1;
+
+	return 0;
+}
+
+static int hdmirx_phy_register_write(struct snps_hdmirx_dev *hdmirx_dev,
+				     u32 phy_reg, u32 val)
+{
+	struct device *dev = hdmirx_dev->dev;
+
+	reinit_completion(&hdmirx_dev->cr_write_done);
+	/* clear irq status */
+	hdmirx_clear_interrupt(hdmirx_dev, MAINUNIT_2_INT_CLEAR, 0xffffffff);
+	/* en irq */
+	hdmirx_update_bits(hdmirx_dev, MAINUNIT_2_INT_MASK_N,
+			   PHYCREG_CR_WRITE_DONE, PHYCREG_CR_WRITE_DONE);
+	/* write phy reg addr */
+	hdmirx_writel(hdmirx_dev, PHYCREG_CONFIG1, phy_reg);
+	/* write phy reg val */
+	hdmirx_writel(hdmirx_dev, PHYCREG_CONFIG2, val);
+	/* config write enable */
+	hdmirx_writel(hdmirx_dev, PHYCREG_CONTROL, PHYCREG_CR_PARA_WRITE_P);
+
+	if (!wait_for_completion_timeout(&hdmirx_dev->cr_write_done,
+					 msecs_to_jiffies(20))) {
+		dev_err(dev, "%s wait cr write done failed\n", __func__);
+		return -1;
+	}
+
+	return 0;
+}
+
+static void hdmirx_tmds_clk_ratio_config(struct snps_hdmirx_dev *hdmirx_dev)
+{
+	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
+	u32 val;
+
+	val = hdmirx_readl(hdmirx_dev, SCDC_REGBANK_STATUS1);
+	v4l2_dbg(3, debug, v4l2_dev, "%s: scdc_regbank_st:%#x\n", __func__, val);
+	hdmirx_dev->tmds_clk_ratio = (val & SCDC_TMDSBITCLKRATIO) > 0;
+
+	if (hdmirx_dev->tmds_clk_ratio) {
+		v4l2_dbg(3, debug, v4l2_dev, "%s: HDMITX greater than 3.4Gbps\n", __func__);
+		hdmirx_update_bits(hdmirx_dev, PHY_CONFIG,
+				   TMDS_CLOCK_RATIO, TMDS_CLOCK_RATIO);
+	} else {
+		v4l2_dbg(3, debug, v4l2_dev, "%s: HDMITX less than 3.4Gbps\n", __func__);
+		hdmirx_update_bits(hdmirx_dev, PHY_CONFIG,
+				   TMDS_CLOCK_RATIO, 0);
+	}
+}
+
+static void hdmirx_phy_config(struct snps_hdmirx_dev *hdmirx_dev)
+{
+	struct device *dev = hdmirx_dev->dev;
+
+	hdmirx_clear_interrupt(hdmirx_dev, SCDC_INT_CLEAR, 0xffffffff);
+	hdmirx_update_bits(hdmirx_dev, SCDC_INT_MASK_N, SCDCTMDSCCFG_CHG,
+			   SCDCTMDSCCFG_CHG);
+	/* cr_para_clk 24M */
+	hdmirx_update_bits(hdmirx_dev, PHY_CONFIG, REFFREQ_SEL_MASK, REFFREQ_SEL(0));
+	/* rx data width 40bit valid */
+	hdmirx_update_bits(hdmirx_dev, PHY_CONFIG, RXDATA_WIDTH, RXDATA_WIDTH);
+	hdmirx_update_bits(hdmirx_dev, PHY_CONFIG, PHY_RESET, PHY_RESET);
+	usleep_range(100, 110);
+	hdmirx_update_bits(hdmirx_dev, PHY_CONFIG, PHY_RESET, 0);
+	usleep_range(100, 110);
+	/* select cr para interface */
+	hdmirx_writel(hdmirx_dev, PHYCREG_CONFIG0, 0x3);
+
+	if (wait_reg_bit_status(hdmirx_dev, SYS_GRF_SOC_STATUS1,
+				HDMIRXPHY_SRAM_INIT_DONE,
+				HDMIRXPHY_SRAM_INIT_DONE, true, 10))
+		dev_err(dev, "%s: phy SRAM init failed\n", __func__);
+
+	regmap_write(hdmirx_dev->grf, SYS_GRF_SOC_CON1,
+		     (HDMIRXPHY_SRAM_EXT_LD_DONE << 16) |
+		     HDMIRXPHY_SRAM_EXT_LD_DONE);
+	hdmirx_phy_register_write(hdmirx_dev, SUP_DIG_ANA_CREGS_SUP_ANA_NC, 2);
+	hdmirx_phy_register_write(hdmirx_dev, SUP_DIG_ANA_CREGS_SUP_ANA_NC, 3);
+	hdmirx_phy_register_write(hdmirx_dev, SUP_DIG_ANA_CREGS_SUP_ANA_NC, 2);
+	hdmirx_phy_register_write(hdmirx_dev, SUP_DIG_ANA_CREGS_SUP_ANA_NC, 2);
+	hdmirx_phy_register_write(hdmirx_dev, SUP_DIG_ANA_CREGS_SUP_ANA_NC, 3);
+	hdmirx_phy_register_write(hdmirx_dev, SUP_DIG_ANA_CREGS_SUP_ANA_NC, 2);
+	hdmirx_phy_register_write(hdmirx_dev, SUP_DIG_ANA_CREGS_SUP_ANA_NC, 0);
+	hdmirx_phy_register_write(hdmirx_dev, SUP_DIG_ANA_CREGS_SUP_ANA_NC, 1);
+	hdmirx_phy_register_write(hdmirx_dev, SUP_DIG_ANA_CREGS_SUP_ANA_NC, 0);
+	hdmirx_phy_register_write(hdmirx_dev, SUP_DIG_ANA_CREGS_SUP_ANA_NC, 0);
+
+	hdmirx_phy_register_write(hdmirx_dev,
+				  HDMIPCS_DIG_CTRL_PATH_MAIN_FSM_RATE_CALC_HDMI14_CDR_SETTING_3_REG,
+				  CDR_SETTING_BOUNDARY_3_DEFAULT);
+	hdmirx_phy_register_write(hdmirx_dev,
+				  HDMIPCS_DIG_CTRL_PATH_MAIN_FSM_RATE_CALC_HDMI14_CDR_SETTING_4_REG,
+				  CDR_SETTING_BOUNDARY_4_DEFAULT);
+	hdmirx_phy_register_write(hdmirx_dev,
+				  HDMIPCS_DIG_CTRL_PATH_MAIN_FSM_RATE_CALC_HDMI14_CDR_SETTING_5_REG,
+				  CDR_SETTING_BOUNDARY_5_DEFAULT);
+	hdmirx_phy_register_write(hdmirx_dev,
+				  HDMIPCS_DIG_CTRL_PATH_MAIN_FSM_RATE_CALC_HDMI14_CDR_SETTING_6_REG,
+				  CDR_SETTING_BOUNDARY_6_DEFAULT);
+	hdmirx_phy_register_write(hdmirx_dev,
+				  HDMIPCS_DIG_CTRL_PATH_MAIN_FSM_RATE_CALC_HDMI14_CDR_SETTING_7_REG,
+				  CDR_SETTING_BOUNDARY_7_DEFAULT);
+
+	hdmirx_update_bits(hdmirx_dev, PHY_CONFIG, PHY_PDDQ, 0);
+	if (wait_reg_bit_status(hdmirx_dev, PHY_STATUS, PDDQ_ACK, 0, false, 10))
+		dev_err(dev, "%s: wait pddq ack failed\n", __func__);
+
+	hdmirx_update_bits(hdmirx_dev, PHY_CONFIG, HDMI_DISABLE, 0);
+	if (wait_reg_bit_status(hdmirx_dev, PHY_STATUS, HDMI_DISABLE_ACK, 0,
+				false, 50))
+		dev_err(dev, "%s: wait hdmi disable ack failed\n", __func__);
+
+	hdmirx_tmds_clk_ratio_config(hdmirx_dev);
+}
+
+static void hdmirx_controller_init(struct snps_hdmirx_dev *hdmirx_dev)
+{
+	struct device *dev = hdmirx_dev->dev;
+
+	reinit_completion(&hdmirx_dev->timer_base_lock);
+	hdmirx_clear_interrupt(hdmirx_dev, MAINUNIT_0_INT_CLEAR, 0xffffffff);
+	/* en irq */
+	hdmirx_update_bits(hdmirx_dev, MAINUNIT_0_INT_MASK_N,
+			   TIMER_BASE_LOCKED_IRQ, TIMER_BASE_LOCKED_IRQ);
+	/* write irefclk freq */
+	hdmirx_writel(hdmirx_dev, GLOBAL_TIMER_REF_BASE, IREF_CLK_FREQ_HZ);
+
+	if (!wait_for_completion_timeout(&hdmirx_dev->timer_base_lock,
+					 msecs_to_jiffies(20)))
+		dev_err(dev, "%s wait timer base lock failed\n", __func__);
+
+	hdmirx_update_bits(hdmirx_dev, CMU_CONFIG0,
+			   TMDSQPCLK_STABLE_FREQ_MARGIN_MASK |
+			   AUDCLK_STABLE_FREQ_MARGIN_MASK,
+			   TMDSQPCLK_STABLE_FREQ_MARGIN(2) |
+			   AUDCLK_STABLE_FREQ_MARGIN(1));
+	hdmirx_update_bits(hdmirx_dev, DESCRAND_EN_CONTROL,
+			   SCRAMB_EN_SEL_QST_MASK, SCRAMB_EN_SEL_QST(1));
+	hdmirx_update_bits(hdmirx_dev, CED_CONFIG,
+			   CED_VIDDATACHECKEN_QST |
+			   CED_DATAISCHECKEN_QST |
+			   CED_GBCHECKEN_QST |
+			   CED_CTRLCHECKEN_QST |
+			   CED_CHLOCKMAXER_QST_MASK,
+			   CED_VIDDATACHECKEN_QST |
+			   CED_GBCHECKEN_QST |
+			   CED_CTRLCHECKEN_QST |
+			   CED_CHLOCKMAXER_QST(0x10));
+	hdmirx_update_bits(hdmirx_dev, DEFRAMER_CONFIG0,
+			   VS_REMAPFILTER_EN_QST | VS_FILTER_ORDER_QST_MASK,
+			   VS_REMAPFILTER_EN_QST | VS_FILTER_ORDER_QST(0x3));
+}
+
+static void hdmirx_set_negative_pol(struct snps_hdmirx_dev *hdmirx_dev, bool en)
+{
+	if (en) {
+		hdmirx_update_bits(hdmirx_dev, DMA_CONFIG6,
+				   VSYNC_TOGGLE_EN | HSYNC_TOGGLE_EN,
+				   VSYNC_TOGGLE_EN | HSYNC_TOGGLE_EN);
+		hdmirx_update_bits(hdmirx_dev, VIDEO_CONFIG2,
+				   VPROC_VSYNC_POL_OVR_VALUE |
+				   VPROC_VSYNC_POL_OVR_EN |
+				   VPROC_HSYNC_POL_OVR_VALUE |
+				   VPROC_HSYNC_POL_OVR_EN,
+				   VPROC_VSYNC_POL_OVR_EN |
+				   VPROC_HSYNC_POL_OVR_EN);
+		return;
+	}
+
+	hdmirx_update_bits(hdmirx_dev, DMA_CONFIG6,
+			   VSYNC_TOGGLE_EN | HSYNC_TOGGLE_EN, 0);
+
+	hdmirx_update_bits(hdmirx_dev, VIDEO_CONFIG2,
+			   VPROC_VSYNC_POL_OVR_VALUE |
+			   VPROC_VSYNC_POL_OVR_EN |
+			   VPROC_HSYNC_POL_OVR_VALUE |
+			   VPROC_HSYNC_POL_OVR_EN, 0);
+}
+
+static int hdmirx_try_to_get_timings(struct snps_hdmirx_dev *hdmirx_dev,
+				     struct v4l2_dv_timings *timings,
+				     int try_cnt)
+{
+	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
+	int i, cnt = 0, fail_cnt = 0, ret = 0;
+	bool from_dma = false;
+
+	hdmirx_set_negative_pol(hdmirx_dev, false);
+	for (i = 0; i < try_cnt; i++) {
+		ret = hdmirx_get_detected_timings(hdmirx_dev, timings, from_dma);
+		if (ret) {
+			cnt = 0;
+			fail_cnt++;
+			if (fail_cnt > 3) {
+				hdmirx_set_negative_pol(hdmirx_dev, true);
+				from_dma = true;
+			}
+		} else {
+			cnt++;
+		}
+		if (cnt >= 5)
+			break;
+
+		usleep_range(10 * 1000, 10 * 1100);
+	}
+
+	if (try_cnt > 8 && cnt < 5)
+		v4l2_dbg(1, debug, v4l2_dev, "%s: res not stable\n", __func__);
+
+	return ret;
+}
+
+static void hdmirx_format_change(struct snps_hdmirx_dev *hdmirx_dev)
+{
+	struct v4l2_dv_timings timings;
+	struct hdmirx_stream *stream = &hdmirx_dev->stream;
+	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
+	const struct v4l2_event ev_src_chg = {
+		.type = V4L2_EVENT_SOURCE_CHANGE,
+		.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION,
+	};
+
+	if (hdmirx_try_to_get_timings(hdmirx_dev, &timings, 20)) {
+		queue_delayed_work(system_unbound_wq,
+				   &hdmirx_dev->delayed_work_hotplug,
+				   msecs_to_jiffies(20));
+		return;
+	}
+
+	if (!v4l2_match_dv_timings(&hdmirx_dev->timings, &timings, 0, false)) {
+		/* automatically set timing rather than set by userspace */
+		hdmirx_dev->timings = timings;
+		v4l2_print_dv_timings(hdmirx_dev->v4l2_dev.name,
+				      "New format: ", &timings, false);
+	}
+
+	hdmirx_dev->got_timing = true;
+	v4l2_dbg(1, debug, v4l2_dev, "%s: queue res_chg_event\n", __func__);
+	v4l2_event_queue(&stream->vdev, &ev_src_chg);
+}
+
+static void hdmirx_set_ddr_store_fmt(struct snps_hdmirx_dev *hdmirx_dev)
+{
+	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
+	enum ddr_store_fmt store_fmt;
+	u32 dma_cfg1;
+
+	switch (hdmirx_dev->pix_fmt) {
+	case HDMIRX_RGB888:
+		store_fmt = STORE_RGB888;
+		break;
+	case HDMIRX_YUV444:
+		store_fmt = STORE_YUV444_8BIT;
+		break;
+	case HDMIRX_YUV422:
+		store_fmt = STORE_YUV422_8BIT;
+		break;
+	case HDMIRX_YUV420:
+		store_fmt = STORE_YUV420_8BIT;
+		break;
+	default:
+		store_fmt = STORE_RGB888;
+		break;
+	}
+
+	hdmirx_update_bits(hdmirx_dev, DMA_CONFIG1,
+			   DDR_STORE_FORMAT_MASK, DDR_STORE_FORMAT(store_fmt));
+	dma_cfg1 = hdmirx_readl(hdmirx_dev, DMA_CONFIG1);
+	v4l2_dbg(1, debug, v4l2_dev, "%s: pix_fmt: %s, DMA_CONFIG1:%#x\n",
+		 __func__, pix_fmt_str[hdmirx_dev->pix_fmt], dma_cfg1);
+}
+
+static int hdmirx_wait_lock_and_get_timing(struct snps_hdmirx_dev *hdmirx_dev)
+{
+	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
+	u32 mu_status, scdc_status, dma_st10, cmu_st;
+	u32 i;
+
+	for (i = 0; i < 300; i++) {
+		mu_status = hdmirx_readl(hdmirx_dev, MAINUNIT_STATUS);
+		scdc_status = hdmirx_readl(hdmirx_dev, SCDC_REGBANK_STATUS3);
+		dma_st10 = hdmirx_readl(hdmirx_dev, DMA_STATUS10);
+		cmu_st = hdmirx_readl(hdmirx_dev, CMU_STATUS);
+
+		if ((mu_status & TMDSVALID_STABLE_ST) &&
+		    (dma_st10 & HDMIRX_LOCK) &&
+		    (cmu_st & TMDSQPCLK_LOCKED_ST))
+			break;
+
+		if (!tx_5v_power_present(hdmirx_dev)) {
+			v4l2_err(v4l2_dev, "%s: HDMI pull out, return\n", __func__);
+			return -1;
+		}
+
+		hdmirx_tmds_clk_ratio_config(hdmirx_dev);
+	}
+
+	if (i == 300) {
+		v4l2_err(v4l2_dev, "%s: signal not lock, tmds_clk_ratio:%d\n",
+			 __func__, hdmirx_dev->tmds_clk_ratio);
+		v4l2_err(v4l2_dev, "%s: mu_st:%#x, scdc_st:%#x, dma_st10:%#x\n",
+			 __func__, mu_status, scdc_status, dma_st10);
+		return -1;
+	}
+
+	v4l2_info(v4l2_dev, "%s: signal lock ok, i:%d\n", __func__, i);
+	hdmirx_writel(hdmirx_dev, GLOBAL_SWRESET_REQUEST, DATAPATH_SWRESETREQ);
+
+	reinit_completion(&hdmirx_dev->avi_pkt_rcv);
+	hdmirx_clear_interrupt(hdmirx_dev, PKT_2_INT_CLEAR, 0xffffffff);
+	hdmirx_update_bits(hdmirx_dev, PKT_2_INT_MASK_N,
+			   PKTDEC_AVIIF_RCV_IRQ, PKTDEC_AVIIF_RCV_IRQ);
+
+	if (!wait_for_completion_timeout(&hdmirx_dev->avi_pkt_rcv,
+					 msecs_to_jiffies(300))) {
+		v4l2_err(v4l2_dev, "%s wait avi_pkt_rcv failed\n", __func__);
+		hdmirx_update_bits(hdmirx_dev, PKT_2_INT_MASK_N,
+				   PKTDEC_AVIIF_RCV_IRQ, 0);
+	}
+
+	usleep_range(50 * 1000, 50 * 1010);
+	hdmirx_format_change(hdmirx_dev);
+
+	return 0;
+}
+
+static void hdmirx_dma_config(struct snps_hdmirx_dev *hdmirx_dev)
+{
+	hdmirx_set_ddr_store_fmt(hdmirx_dev);
+
+	/* Note: uv_swap, rb can not swap, doc err*/
+	if (hdmirx_dev->cur_fmt_fourcc != V4L2_PIX_FMT_NV16)
+		hdmirx_update_bits(hdmirx_dev, DMA_CONFIG6, RB_SWAP_EN, RB_SWAP_EN);
+	else
+		hdmirx_update_bits(hdmirx_dev, DMA_CONFIG6, RB_SWAP_EN, 0);
+
+	hdmirx_update_bits(hdmirx_dev, DMA_CONFIG7,
+			   LOCK_FRAME_NUM_MASK,
+			   LOCK_FRAME_NUM(2));
+	hdmirx_update_bits(hdmirx_dev, DMA_CONFIG1,
+			   UV_WID_MASK | Y_WID_MASK | ABANDON_EN,
+			   UV_WID(1) | Y_WID(2) | ABANDON_EN);
+}
+
+static void hdmirx_submodule_init(struct snps_hdmirx_dev *hdmirx_dev)
+{
+	/* Note: if not config HDCP2_CONFIG, there will be some errors; */
+	hdmirx_update_bits(hdmirx_dev, HDCP2_CONFIG,
+			   HDCP2_SWITCH_OVR_VALUE |
+			   HDCP2_SWITCH_OVR_EN,
+			   HDCP2_SWITCH_OVR_EN);
+	hdmirx_scdc_init(hdmirx_dev);
+	hdmirx_controller_init(hdmirx_dev);
+}
+
+static int hdmirx_enum_input(struct file *file, void *priv,
+			     struct v4l2_input *input)
+{
+	if (input->index > 0)
+		return -EINVAL;
+
+	input->type = V4L2_INPUT_TYPE_CAMERA;
+	input->std = 0;
+	strscpy(input->name, "hdmirx", sizeof(input->name));
+	input->capabilities = V4L2_IN_CAP_DV_TIMINGS;
+
+	return 0;
+}
+
+static int hdmirx_get_input(struct file *file, void *priv, unsigned int *i)
+{
+	*i = 0;
+	return 0;
+}
+
+static int hdmirx_set_input(struct file *file, void *priv, unsigned int i)
+{
+	if (i)
+		return -EINVAL;
+	return 0;
+}
+
+static int fcc_xysubs(u32 fcc, u32 *xsubs, u32 *ysubs)
+{
+	/* Note: cbcr plane bpp is 16 bit */
+	switch (fcc) {
+	case V4L2_PIX_FMT_NV24:
+		*xsubs = 1;
+		*ysubs = 1;
+		break;
+	case V4L2_PIX_FMT_NV16:
+		*xsubs = 2;
+		*ysubs = 1;
+		break;
+	case V4L2_PIX_FMT_NV12:
+		*xsubs = 2;
+		*ysubs = 2;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static u32 hdmirx_align_bits_per_pixel(const struct hdmirx_output_fmt *fmt,
+				       int plane_index)
+{
+	u32 bpp = 0;
+
+	if (fmt) {
+		switch (fmt->fourcc) {
+		case V4L2_PIX_FMT_NV24:
+		case V4L2_PIX_FMT_NV16:
+		case V4L2_PIX_FMT_NV12:
+		case V4L2_PIX_FMT_BGR24:
+			bpp = fmt->bpp[plane_index];
+			break;
+		default:
+			pr_err("fourcc: %#x is not supported\n", fmt->fourcc);
+			break;
+		}
+	}
+
+	return bpp;
+}
+
+static const struct hdmirx_output_fmt *find_output_fmt(u32 pixelfmt)
+{
+	const struct hdmirx_output_fmt *fmt;
+	u32 i;
+
+	for (i = 0; i < ARRAY_SIZE(g_out_fmts); i++) {
+		fmt = &g_out_fmts[i];
+		if (fmt->fourcc == pixelfmt)
+			return fmt;
+	}
+
+	return NULL;
+}
+
+static void hdmirx_set_fmt(struct hdmirx_stream *stream,
+			   struct v4l2_pix_format_mplane *pixm, bool try)
+{
+	struct snps_hdmirx_dev *hdmirx_dev = stream->hdmirx_dev;
+	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
+	struct v4l2_bt_timings *bt = &hdmirx_dev->timings.bt;
+	const struct hdmirx_output_fmt *fmt;
+	unsigned int imagesize = 0, planes;
+	u32 xsubs = 1, ysubs = 1, i;
+
+	memset(&pixm->plane_fmt[0], 0, sizeof(struct v4l2_plane_pix_format));
+	fmt = find_output_fmt(pixm->pixelformat);
+	if (!fmt) {
+		fmt = &g_out_fmts[0];
+		v4l2_err(v4l2_dev,
+			 "%s: set_fmt:%#x not supported, use def_fmt:%x\n",
+			 __func__, pixm->pixelformat, fmt->fourcc);
+	}
+
+	if (!bt->width || !bt->height)
+		v4l2_err(v4l2_dev, "%s: invalid resolution:%#xx%#x\n",
+			 __func__, bt->width, bt->height);
+
+	pixm->pixelformat = fmt->fourcc;
+	pixm->width = bt->width;
+	pixm->height = bt->height;
+	pixm->num_planes = fmt->mplanes;
+	pixm->quantization = V4L2_QUANTIZATION_DEFAULT;
+	pixm->colorspace = V4L2_COLORSPACE_SRGB;
+	pixm->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+
+	if (bt->interlaced == V4L2_DV_INTERLACED)
+		pixm->field = V4L2_FIELD_INTERLACED_TB;
+	else
+		pixm->field = V4L2_FIELD_NONE;
+
+	memset(pixm->reserved, 0, sizeof(pixm->reserved));
+
+	/* calculate plane size and image size */
+	fcc_xysubs(fmt->fourcc, &xsubs, &ysubs);
+	planes = fmt->cplanes ? fmt->cplanes : fmt->mplanes;
+
+	for (i = 0; i < planes; i++) {
+		struct v4l2_plane_pix_format *plane_fmt;
+		int width, height, bpl, size, bpp;
+
+		if (!i) {
+			width = pixm->width;
+			height = pixm->height;
+		} else {
+			width = pixm->width / xsubs;
+			height = pixm->height / ysubs;
+		}
+
+		bpp = hdmirx_align_bits_per_pixel(fmt, i);
+		bpl = ALIGN(width * bpp / HDMIRX_STORED_BIT_WIDTH,
+			    MEMORY_ALIGN_ROUND_UP_BYTES);
+		size = bpl * height;
+		imagesize += size;
+
+		if (fmt->mplanes > i) {
+			/* Set bpl and size for each mplane */
+			plane_fmt = pixm->plane_fmt + i;
+			plane_fmt->bytesperline = bpl;
+			plane_fmt->sizeimage = size;
+		}
+
+		v4l2_dbg(1, debug, v4l2_dev,
+			 "C-Plane %i size: %d, Total imagesize: %d\n",
+			 i, size, imagesize);
+	}
+
+	/* convert to non-MPLANE format.
+	 * It's important since we want to unify non-MPLANE and MPLANE.
+	 */
+	if (fmt->mplanes == 1)
+		pixm->plane_fmt[0].sizeimage = imagesize;
+
+	if (!try) {
+		stream->out_fmt = fmt;
+		stream->pixm = *pixm;
+
+		v4l2_dbg(1, debug, v4l2_dev,
+			 "%s: req(%d, %d), out(%d, %d), fmt:%#x\n", __func__,
+			 pixm->width, pixm->height, stream->pixm.width,
+			 stream->pixm.height, fmt->fourcc);
+	}
+}
+
+static int hdmirx_enum_fmt_vid_cap_mplane(struct file *file, void *priv,
+					  struct v4l2_fmtdesc *f)
+{
+	struct hdmirx_stream *stream = video_drvdata(file);
+	struct snps_hdmirx_dev *hdmirx_dev = stream->hdmirx_dev;
+
+	if (f->index >= 1)
+		return -EINVAL;
+
+	f->pixelformat = hdmirx_dev->cur_fmt_fourcc;
+
+	return 0;
+}
+
+static int hdmirx_s_fmt_vid_cap_mplane(struct file *file,
+				       void *priv, struct v4l2_format *f)
+{
+	struct hdmirx_stream *stream = video_drvdata(file);
+	struct snps_hdmirx_dev *hdmirx_dev = stream->hdmirx_dev;
+	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
+
+	if (vb2_is_busy(&stream->buf_queue)) {
+		v4l2_err(v4l2_dev, "%s: queue busy\n", __func__);
+		return -EBUSY;
+	}
+
+	hdmirx_set_fmt(stream, &f->fmt.pix_mp, false);
+
+	return 0;
+}
+
+static int hdmirx_g_fmt_vid_cap_mplane(struct file *file, void *fh,
+				       struct v4l2_format *f)
+{
+	struct hdmirx_stream *stream = video_drvdata(file);
+	struct snps_hdmirx_dev *hdmirx_dev = stream->hdmirx_dev;
+	struct v4l2_pix_format_mplane pixm = {};
+
+	pixm.pixelformat = hdmirx_dev->cur_fmt_fourcc;
+	hdmirx_set_fmt(stream, &pixm, true);
+	f->fmt.pix_mp = pixm;
+
+	return 0;
+}
+
+static int hdmirx_g_dv_timings(struct file *file, void *_fh,
+			       struct v4l2_dv_timings *timings)
+{
+	struct hdmirx_stream *stream = video_drvdata(file);
+	struct snps_hdmirx_dev *hdmirx_dev = stream->hdmirx_dev;
+	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
+	u32 dma_cfg1;
+
+	*timings = hdmirx_dev->timings;
+	dma_cfg1 = hdmirx_readl(hdmirx_dev, DMA_CONFIG1);
+	v4l2_dbg(1, debug, v4l2_dev, "%s: pix_fmt: %s, DMA_CONFIG1:%#x\n",
+		 __func__, pix_fmt_str[hdmirx_dev->pix_fmt], dma_cfg1);
+
+	return 0;
+}
+
+static int hdmirx_s_dv_timings(struct file *file, void *_fh,
+			       struct v4l2_dv_timings *timings)
+{
+	struct hdmirx_stream *stream = video_drvdata(file);
+	struct snps_hdmirx_dev *hdmirx_dev = stream->hdmirx_dev;
+	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
+
+	if (!timings)
+		return -EINVAL;
+
+	if (debug)
+		v4l2_print_dv_timings(hdmirx_dev->v4l2_dev.name,
+				      "s_dv_timings: ", timings, false);
+
+	if (!v4l2_valid_dv_timings(timings, &hdmirx_timings_cap, NULL, NULL)) {
+		v4l2_dbg(1, debug, v4l2_dev,
+			 "%s: timings out of range\n", __func__);
+		return -ERANGE;
+	}
+
+	/* Check if the timings are part of the CEA-861 timings. */
+	v4l2_find_dv_timings_cap(timings, &hdmirx_timings_cap, 0, NULL, NULL);
+
+	if (v4l2_match_dv_timings(&hdmirx_dev->timings, timings, 0, false)) {
+		v4l2_dbg(1, debug, v4l2_dev, "%s: no change\n", __func__);
+		return 0;
+	}
+
+	/*
+	 * Changing the timings implies a format change, which is not allowed
+	 * while buffers for use with streaming have already been allocated.
+	 */
+	if (vb2_is_busy(&stream->buf_queue))
+		return -EBUSY;
+
+	hdmirx_dev->timings = *timings;
+	/* Update the internal format */
+	hdmirx_set_fmt(stream, &stream->pixm, false);
+
+	return 0;
+}
+
+static int hdmirx_querycap(struct file *file, void *priv,
+			   struct v4l2_capability *cap)
+{
+	struct hdmirx_stream *stream = video_drvdata(file);
+	struct device *dev = stream->hdmirx_dev->dev;
+
+	strscpy(cap->driver, dev->driver->name, sizeof(cap->driver));
+	strscpy(cap->card, dev->driver->name, sizeof(cap->card));
+	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform: snps_hdmirx");
+
+	return 0;
+}
+
+static int hdmirx_queue_setup(struct vb2_queue *queue,
+			      unsigned int *num_buffers,
+			      unsigned int *num_planes,
+			      unsigned int sizes[],
+			      struct device *alloc_ctxs[])
+{
+	struct hdmirx_stream *stream = vb2_get_drv_priv(queue);
+	struct snps_hdmirx_dev *hdmirx_dev = stream->hdmirx_dev;
+	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
+	const struct v4l2_pix_format_mplane *pixm = NULL;
+	const struct hdmirx_output_fmt *out_fmt;
+	u32 i, height;
+
+	pixm = &stream->pixm;
+	out_fmt = stream->out_fmt;
+
+	if (!num_planes || !out_fmt) {
+		v4l2_err(v4l2_dev, "%s: out_fmt not set\n", __func__);
+		return -EINVAL;
+	}
+
+	if (*num_planes) {
+		if (*num_planes != pixm->num_planes)
+			return -EINVAL;
+
+		for (i = 0; i < *num_planes; i++)
+			if (sizes[i] < pixm->plane_fmt[i].sizeimage)
+				return -EINVAL;
+	}
+
+	*num_planes = out_fmt->mplanes;
+	height = pixm->height;
+
+	for (i = 0; i < out_fmt->mplanes; i++) {
+		const struct v4l2_plane_pix_format *plane_fmt;
+		int h = height;
+
+		plane_fmt = &pixm->plane_fmt[i];
+		sizes[i] = plane_fmt->sizeimage / height * h;
+	}
+
+	v4l2_dbg(1, debug, v4l2_dev, "%s: count %d, size %d\n",
+		 v4l2_type_names[queue->type], *num_buffers, sizes[0]);
+
+	return 0;
+}
+
+/*
+ * The vb2_buffer are stored in hdmirx_buffer, in order to unify
+ * mplane buffer and none-mplane buffer.
+ */
+static void hdmirx_buf_queue(struct vb2_buffer *vb)
+{
+	const struct hdmirx_output_fmt *out_fmt;
+	struct vb2_v4l2_buffer *vbuf;
+	struct hdmirx_buffer *hdmirx_buf;
+	struct vb2_queue *queue;
+	struct hdmirx_stream *stream;
+	const struct v4l2_pix_format_mplane *pixm;
+	unsigned long lock_flags = 0;
+	int i;
+
+	vbuf = to_vb2_v4l2_buffer(vb);
+	hdmirx_buf = container_of(vbuf, struct hdmirx_buffer, vb);
+	queue = vb->vb2_queue;
+	stream = vb2_get_drv_priv(queue);
+	pixm = &stream->pixm;
+	out_fmt = stream->out_fmt;
+
+	memset(hdmirx_buf->buff_addr, 0, sizeof(hdmirx_buf->buff_addr));
+	/*
+	 * If mplanes > 1, every c-plane has its own m-plane,
+	 * otherwise, multiple c-planes are in the same m-plane
+	 */
+	for (i = 0; i < out_fmt->mplanes; i++)
+		hdmirx_buf->buff_addr[i] = vb2_dma_contig_plane_dma_addr(vb, i);
+
+	if (out_fmt->mplanes == 1) {
+		if (out_fmt->cplanes == 1) {
+			hdmirx_buf->buff_addr[HDMIRX_PLANE_CBCR] =
+				hdmirx_buf->buff_addr[HDMIRX_PLANE_Y];
+		} else {
+			for (i = 0; i < out_fmt->cplanes - 1; i++)
+				hdmirx_buf->buff_addr[i + 1] =
+					hdmirx_buf->buff_addr[i] +
+					pixm->plane_fmt[i].bytesperline *
+					pixm->height;
+		}
+	}
+
+	spin_lock_irqsave(&stream->vbq_lock, lock_flags);
+	list_add_tail(&hdmirx_buf->queue, &stream->buf_head);
+	spin_unlock_irqrestore(&stream->vbq_lock, lock_flags);
+}
+
+static void return_all_buffers(struct hdmirx_stream *stream,
+			       enum vb2_buffer_state state)
+{
+	struct hdmirx_buffer *buf;
+	unsigned long flags;
+
+	spin_lock_irqsave(&stream->vbq_lock, flags);
+	if (stream->curr_buf)
+		list_add_tail(&stream->curr_buf->queue, &stream->buf_head);
+	if (stream->next_buf && stream->next_buf != stream->curr_buf)
+		list_add_tail(&stream->next_buf->queue, &stream->buf_head);
+	stream->curr_buf = NULL;
+	stream->next_buf = NULL;
+
+	while (!list_empty(&stream->buf_head)) {
+		buf = list_first_entry(&stream->buf_head,
+				       struct hdmirx_buffer, queue);
+		list_del(&buf->queue);
+		spin_unlock_irqrestore(&stream->vbq_lock, flags);
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
+		spin_lock_irqsave(&stream->vbq_lock, flags);
+	}
+	spin_unlock_irqrestore(&stream->vbq_lock, flags);
+}
+
+static void hdmirx_stop_streaming(struct vb2_queue *queue)
+{
+	struct hdmirx_stream *stream = vb2_get_drv_priv(queue);
+	struct snps_hdmirx_dev *hdmirx_dev = stream->hdmirx_dev;
+	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
+	int ret;
+
+	v4l2_info(v4l2_dev, "stream start stopping\n");
+	mutex_lock(&hdmirx_dev->stream_lock);
+	WRITE_ONCE(stream->stopping, true);
+
+	/* wait last irq to return the buffer */
+	ret = wait_event_timeout(stream->wq_stopped, !stream->stopping,
+				 msecs_to_jiffies(500));
+	if (!ret) {
+		v4l2_err(v4l2_dev, "%s: timeout waiting last irq\n",
+			 __func__);
+		WRITE_ONCE(stream->stopping, false);
+	}
+
+	hdmirx_update_bits(hdmirx_dev, DMA_CONFIG6, HDMIRX_DMA_EN, 0);
+	return_all_buffers(stream, VB2_BUF_STATE_ERROR);
+	mutex_unlock(&hdmirx_dev->stream_lock);
+	v4l2_info(v4l2_dev, "stream stopping finished\n");
+}
+
+static int hdmirx_start_streaming(struct vb2_queue *queue, unsigned int count)
+{
+	struct hdmirx_stream *stream = vb2_get_drv_priv(queue);
+	struct snps_hdmirx_dev *hdmirx_dev = stream->hdmirx_dev;
+	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
+	struct v4l2_dv_timings timings = hdmirx_dev->timings;
+	struct v4l2_bt_timings *bt = &timings.bt;
+	unsigned long lock_flags = 0;
+	int line_flag;
+
+	if (!hdmirx_dev->got_timing) {
+		v4l2_err(v4l2_dev, "timing is invalid\n");
+		return 0;
+	}
+
+	mutex_lock(&hdmirx_dev->stream_lock);
+	stream->frame_idx = 0;
+	stream->line_flag_int_cnt = 0;
+	stream->curr_buf = NULL;
+	stream->next_buf = NULL;
+	stream->irq_stat = 0;
+	WRITE_ONCE(stream->stopping, false);
+
+	spin_lock_irqsave(&stream->vbq_lock, lock_flags);
+	if (!stream->curr_buf) {
+		if (!list_empty(&stream->buf_head)) {
+			stream->curr_buf = list_first_entry(&stream->buf_head,
+							    struct hdmirx_buffer,
+							    queue);
+			list_del(&stream->curr_buf->queue);
+		} else {
+			stream->curr_buf = NULL;
+		}
+	}
+	spin_unlock_irqrestore(&stream->vbq_lock, lock_flags);
+
+	if (!stream->curr_buf) {
+		mutex_unlock(&hdmirx_dev->stream_lock);
+		return -ENOMEM;
+	}
+
+	v4l2_dbg(2, debug, v4l2_dev,
+		 "%s: start_stream cur_buf y_addr:%#x, uv_addr:%#x\n",
+		 __func__, stream->curr_buf->buff_addr[HDMIRX_PLANE_Y],
+		 stream->curr_buf->buff_addr[HDMIRX_PLANE_CBCR]);
+	hdmirx_writel(hdmirx_dev, DMA_CONFIG2,
+		      stream->curr_buf->buff_addr[HDMIRX_PLANE_Y]);
+	hdmirx_writel(hdmirx_dev, DMA_CONFIG3,
+		      stream->curr_buf->buff_addr[HDMIRX_PLANE_CBCR]);
+
+	if (bt->height) {
+		if (bt->interlaced == V4L2_DV_INTERLACED)
+			line_flag = bt->height / 4;
+		else
+			line_flag = bt->height / 2;
+		hdmirx_update_bits(hdmirx_dev, DMA_CONFIG7,
+				   LINE_FLAG_NUM_MASK,
+				   LINE_FLAG_NUM(line_flag));
+	} else {
+		v4l2_err(v4l2_dev, "height err: %d\n", bt->height);
+	}
+
+	hdmirx_writel(hdmirx_dev, DMA_CONFIG5, 0xffffffff);
+	hdmirx_writel(hdmirx_dev, CED_DYN_CONTROL, 0x1);
+	hdmirx_update_bits(hdmirx_dev, DMA_CONFIG4,
+			   LINE_FLAG_INT_EN |
+			   HDMIRX_DMA_IDLE_INT |
+			   HDMIRX_LOCK_DISABLE_INT |
+			   LAST_FRAME_AXI_UNFINISH_INT_EN |
+			   FIFO_OVERFLOW_INT_EN |
+			   FIFO_UNDERFLOW_INT_EN |
+			   HDMIRX_AXI_ERROR_INT_EN,
+			   LINE_FLAG_INT_EN |
+			   HDMIRX_DMA_IDLE_INT |
+			   HDMIRX_LOCK_DISABLE_INT |
+			   LAST_FRAME_AXI_UNFINISH_INT_EN |
+			   FIFO_OVERFLOW_INT_EN |
+			   FIFO_UNDERFLOW_INT_EN |
+			   HDMIRX_AXI_ERROR_INT_EN);
+	hdmirx_update_bits(hdmirx_dev, DMA_CONFIG6, HDMIRX_DMA_EN, HDMIRX_DMA_EN);
+	v4l2_dbg(1, debug, v4l2_dev, "%s: enable dma", __func__);
+	mutex_unlock(&hdmirx_dev->stream_lock);
+
+	return 0;
+}
+
+/* vb2 queue */
+static const struct vb2_ops hdmirx_vb2_ops = {
+	.queue_setup = hdmirx_queue_setup,
+	.buf_queue = hdmirx_buf_queue,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+	.stop_streaming = hdmirx_stop_streaming,
+	.start_streaming = hdmirx_start_streaming,
+};
+
+static int hdmirx_init_vb2_queue(struct vb2_queue *q,
+				 struct hdmirx_stream *stream,
+				 enum v4l2_buf_type buf_type)
+{
+	struct snps_hdmirx_dev *hdmirx_dev = stream->hdmirx_dev;
+
+	q->type = buf_type;
+	q->io_modes = VB2_MMAP | VB2_DMABUF;
+	q->drv_priv = stream;
+	q->ops = &hdmirx_vb2_ops;
+	q->mem_ops = &vb2_dma_contig_memops;
+	q->buf_struct_size = sizeof(struct hdmirx_buffer);
+	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	q->lock = &stream->vlock;
+	q->dev = hdmirx_dev->dev;
+	q->allow_cache_hints = 0;
+	q->bidirectional = 1;
+	q->dma_attrs = DMA_ATTR_FORCE_CONTIGUOUS;
+	return vb2_queue_init(q);
+}
+
+/* video device */
+static const struct v4l2_ioctl_ops hdmirx_v4l2_ioctl_ops = {
+	.vidioc_querycap = hdmirx_querycap,
+	.vidioc_try_fmt_vid_cap_mplane = hdmirx_g_fmt_vid_cap_mplane,
+	.vidioc_s_fmt_vid_cap_mplane = hdmirx_s_fmt_vid_cap_mplane,
+	.vidioc_g_fmt_vid_cap_mplane = hdmirx_g_fmt_vid_cap_mplane,
+	.vidioc_enum_fmt_vid_cap = hdmirx_enum_fmt_vid_cap_mplane,
+
+	.vidioc_s_dv_timings = hdmirx_s_dv_timings,
+	.vidioc_g_dv_timings = hdmirx_g_dv_timings,
+	.vidioc_enum_dv_timings = hdmirx_enum_dv_timings,
+	.vidioc_query_dv_timings = hdmirx_query_dv_timings,
+	.vidioc_dv_timings_cap = hdmirx_dv_timings_cap,
+	.vidioc_enum_input = hdmirx_enum_input,
+	.vidioc_g_input = hdmirx_get_input,
+	.vidioc_s_input = hdmirx_set_input,
+	.vidioc_g_edid = hdmirx_get_edid,
+	.vidioc_s_edid = hdmirx_set_edid,
+	.vidioc_g_parm = hdmirx_g_parm,
+
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_qbuf = vb2_ioctl_qbuf,
+	.vidioc_expbuf = vb2_ioctl_expbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
+
+	.vidioc_log_status = v4l2_ctrl_log_status,
+	.vidioc_subscribe_event = hdmirx_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+};
+
+static const struct v4l2_file_operations hdmirx_fops = {
+	.owner = THIS_MODULE,
+	.open = v4l2_fh_open,
+	.release = vb2_fop_release,
+	.unlocked_ioctl = video_ioctl2,
+	.read = vb2_fop_read,
+	.poll = vb2_fop_poll,
+	.mmap = vb2_fop_mmap,
+};
+
+static int hdmirx_register_stream_vdev(struct hdmirx_stream *stream)
+{
+	struct snps_hdmirx_dev *hdmirx_dev = stream->hdmirx_dev;
+	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
+	struct video_device *vdev = &stream->vdev;
+	char *vdev_name;
+	int ret = 0;
+
+	vdev_name = "stream_hdmirx";
+	strscpy(vdev->name, vdev_name, sizeof(vdev->name));
+	INIT_LIST_HEAD(&stream->buf_head);
+	spin_lock_init(&stream->vbq_lock);
+	mutex_init(&stream->vlock);
+	init_waitqueue_head(&stream->wq_stopped);
+	stream->curr_buf = NULL;
+	stream->next_buf = NULL;
+
+	vdev->ioctl_ops = &hdmirx_v4l2_ioctl_ops;
+	vdev->release = video_device_release_empty;
+	vdev->fops = &hdmirx_fops;
+	vdev->minor = -1;
+	vdev->v4l2_dev = v4l2_dev;
+	vdev->lock = &stream->vlock;
+	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE |
+			    V4L2_CAP_STREAMING;
+	video_set_drvdata(vdev, stream);
+	vdev->vfl_dir = VFL_DIR_RX;
+
+	hdmirx_init_vb2_queue(&stream->buf_queue, stream,
+			      V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	vdev->queue = &stream->buf_queue;
+
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (ret < 0) {
+		v4l2_err(v4l2_dev, "video_register_device failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void process_signal_change(struct snps_hdmirx_dev *hdmirx_dev)
+{
+	hdmirx_update_bits(hdmirx_dev, DMA_CONFIG6, HDMIRX_DMA_EN, 0);
+	hdmirx_update_bits(hdmirx_dev, DMA_CONFIG4,
+			   LINE_FLAG_INT_EN |
+			   HDMIRX_DMA_IDLE_INT |
+			   HDMIRX_LOCK_DISABLE_INT |
+			   LAST_FRAME_AXI_UNFINISH_INT_EN |
+			   FIFO_OVERFLOW_INT_EN |
+			   FIFO_UNDERFLOW_INT_EN |
+			   HDMIRX_AXI_ERROR_INT_EN, 0);
+	hdmirx_reset_dma(hdmirx_dev);
+	hdmirx_dev->got_timing = false;
+	queue_delayed_work(system_unbound_wq,
+			   &hdmirx_dev->delayed_work_res_change,
+			   msecs_to_jiffies(50));
+}
+
+static void avpunit_0_int_handler(struct snps_hdmirx_dev *hdmirx_dev,
+				  int status, bool *handled)
+{
+	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
+
+	if (status & (CED_DYN_CNT_CH2_IRQ |
+		      CED_DYN_CNT_CH1_IRQ |
+		      CED_DYN_CNT_CH0_IRQ)) {
+		process_signal_change(hdmirx_dev);
+		v4l2_dbg(2, debug, v4l2_dev, "%s: avp0_st:%#x\n",
+			 __func__, status);
+		*handled = true;
+	}
+
+	hdmirx_clear_interrupt(hdmirx_dev, AVPUNIT_0_INT_CLEAR, 0xffffffff);
+	hdmirx_writel(hdmirx_dev, AVPUNIT_0_INT_FORCE, 0x0);
+}
+
+static void avpunit_1_int_handler(struct snps_hdmirx_dev *hdmirx_dev,
+				  int status, bool *handled)
+{
+	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
+
+	if (status & DEFRAMER_VSYNC_THR_REACHED_IRQ) {
+		v4l2_info(v4l2_dev, "Vertical Sync threshold reached interrupt %#x", status);
+		hdmirx_update_bits(hdmirx_dev, AVPUNIT_1_INT_MASK_N,
+				   DEFRAMER_VSYNC_THR_REACHED_MASK_N, 0);
+		*handled = true;
+	}
+}
+
+static void mainunit_0_int_handler(struct snps_hdmirx_dev *hdmirx_dev,
+				   int status, bool *handled)
+{
+	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
+
+	v4l2_dbg(2, debug, v4l2_dev, "mu0_st:%#x\n", status);
+	if (status & TIMER_BASE_LOCKED_IRQ) {
+		hdmirx_update_bits(hdmirx_dev, MAINUNIT_0_INT_MASK_N,
+				   TIMER_BASE_LOCKED_IRQ, 0);
+		complete(&hdmirx_dev->timer_base_lock);
+		*handled = true;
+	}
+
+	if (status & TMDSQPCLK_OFF_CHG) {
+		process_signal_change(hdmirx_dev);
+		v4l2_dbg(2, debug, v4l2_dev, "%s: TMDSQPCLK_OFF_CHG\n", __func__);
+		*handled = true;
+	}
+
+	if (status & TMDSQPCLK_LOCKED_CHG) {
+		process_signal_change(hdmirx_dev);
+		v4l2_dbg(2, debug, v4l2_dev, "%s: TMDSQPCLK_LOCKED_CHG\n", __func__);
+		*handled = true;
+	}
+
+	hdmirx_clear_interrupt(hdmirx_dev, MAINUNIT_0_INT_CLEAR, 0xffffffff);
+	hdmirx_writel(hdmirx_dev, MAINUNIT_0_INT_FORCE, 0x0);
+}
+
+static void mainunit_2_int_handler(struct snps_hdmirx_dev *hdmirx_dev,
+				   int status, bool *handled)
+{
+	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
+
+	v4l2_dbg(2, debug, v4l2_dev, "mu2_st:%#x\n", status);
+	if (status & PHYCREG_CR_WRITE_DONE) {
+		hdmirx_update_bits(hdmirx_dev, MAINUNIT_2_INT_MASK_N,
+				   PHYCREG_CR_WRITE_DONE, 0);
+		complete(&hdmirx_dev->cr_write_done);
+		*handled = true;
+	}
+
+	if (status & TMDSVALID_STABLE_CHG) {
+		process_signal_change(hdmirx_dev);
+		v4l2_dbg(2, debug, v4l2_dev, "%s: TMDSVALID_STABLE_CHG\n", __func__);
+		*handled = true;
+	}
+
+	hdmirx_clear_interrupt(hdmirx_dev, MAINUNIT_2_INT_CLEAR, 0xffffffff);
+	hdmirx_writel(hdmirx_dev, MAINUNIT_2_INT_FORCE, 0x0);
+}
+
+static void pkt_2_int_handler(struct snps_hdmirx_dev *hdmirx_dev,
+			      int status, bool *handled)
+{
+	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
+
+	v4l2_dbg(2, debug, v4l2_dev, "%s: pk2_st:%#x\n", __func__, status);
+	if (status & PKTDEC_AVIIF_RCV_IRQ) {
+		hdmirx_update_bits(hdmirx_dev, PKT_2_INT_MASK_N,
+				   PKTDEC_AVIIF_RCV_IRQ, 0);
+		complete(&hdmirx_dev->avi_pkt_rcv);
+		v4l2_dbg(2, debug, v4l2_dev, "%s: AVIIF_RCV_IRQ\n", __func__);
+		*handled = true;
+	}
+
+	hdmirx_clear_interrupt(hdmirx_dev, PKT_2_INT_CLEAR, 0xffffffff);
+}
+
+static void scdc_int_handler(struct snps_hdmirx_dev *hdmirx_dev,
+			     int status, bool *handled)
+{
+	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
+
+	v4l2_dbg(2, debug, v4l2_dev, "%s: scdc_st:%#x\n", __func__, status);
+	if (status & SCDCTMDSCCFG_CHG) {
+		hdmirx_tmds_clk_ratio_config(hdmirx_dev);
+		*handled = true;
+	}
+
+	hdmirx_clear_interrupt(hdmirx_dev, SCDC_INT_CLEAR, 0xffffffff);
+}
+
+static irqreturn_t hdmirx_hdmi_irq_handler(int irq, void *dev_id)
+{
+	struct snps_hdmirx_dev *hdmirx_dev = dev_id;
+	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
+	struct arm_smccc_res res;
+	u32 mu0_st, mu2_st, pk2_st, scdc_st, avp1_st, avp0_st;
+	u32 mu0_mask, mu2_mask, pk2_mask, scdc_mask, avp1_msk, avp0_msk;
+	bool handled = false;
+
+	mu0_mask = hdmirx_readl(hdmirx_dev, MAINUNIT_0_INT_MASK_N);
+	mu2_mask = hdmirx_readl(hdmirx_dev, MAINUNIT_2_INT_MASK_N);
+	pk2_mask = hdmirx_readl(hdmirx_dev, PKT_2_INT_MASK_N);
+	scdc_mask = hdmirx_readl(hdmirx_dev, SCDC_INT_MASK_N);
+	mu0_st = hdmirx_readl(hdmirx_dev, MAINUNIT_0_INT_STATUS);
+	mu2_st = hdmirx_readl(hdmirx_dev, MAINUNIT_2_INT_STATUS);
+	pk2_st = hdmirx_readl(hdmirx_dev, PKT_2_INT_STATUS);
+	scdc_st = hdmirx_readl(hdmirx_dev, SCDC_INT_STATUS);
+	avp0_st = hdmirx_readl(hdmirx_dev, AVPUNIT_0_INT_STATUS);
+	avp1_st = hdmirx_readl(hdmirx_dev, AVPUNIT_1_INT_STATUS);
+	avp0_msk = hdmirx_readl(hdmirx_dev, AVPUNIT_0_INT_MASK_N);
+	avp1_msk = hdmirx_readl(hdmirx_dev, AVPUNIT_1_INT_MASK_N);
+	mu0_st &= mu0_mask;
+	mu2_st &= mu2_mask;
+	pk2_st &= pk2_mask;
+	avp1_st &= avp1_msk;
+	avp0_st &= avp0_msk;
+	scdc_st &= scdc_mask;
+
+	if (avp0_st)
+		avpunit_0_int_handler(hdmirx_dev, avp0_st, &handled);
+	if (avp1_st)
+		avpunit_1_int_handler(hdmirx_dev, avp1_st, &handled);
+	if (mu0_st)
+		mainunit_0_int_handler(hdmirx_dev, mu0_st, &handled);
+	if (mu2_st)
+		mainunit_2_int_handler(hdmirx_dev, mu2_st, &handled);
+	if (pk2_st)
+		pkt_2_int_handler(hdmirx_dev, pk2_st, &handled);
+	if (scdc_st)
+		scdc_int_handler(hdmirx_dev, scdc_st, &handled);
+
+	if (!handled) {
+		v4l2_dbg(2, debug, v4l2_dev, "%s: hdmi irq not handled", __func__);
+		v4l2_dbg(2, debug, v4l2_dev,
+			 "avp0:%#x, avp1:%#x, mu0:%#x, mu2:%#x, pk2:%#x, scdc:%#x\n",
+			 avp0_st, avp1_st, mu0_st, mu2_st, pk2_st, scdc_st);
+	}
+
+	v4l2_dbg(2, debug, v4l2_dev, "%s: en_fiq", __func__);
+	arm_smccc_smc(RK_SIP_FIQ_CTRL, RK_SIP_FIQ_CTRL_FIQ_EN,
+		      RK_IRQ_HDMIRX_HDMI, 0, 0, 0, 0, 0, &res);
+
+	return handled ? IRQ_HANDLED : IRQ_NONE;
+}
+
+static void hdmirx_vb_done(struct hdmirx_stream *stream,
+			   struct vb2_v4l2_buffer *vb_done)
+{
+	const struct hdmirx_output_fmt *fmt = stream->out_fmt;
+	u32 i;
+
+	/* Dequeue a filled buffer */
+	for (i = 0; i < fmt->mplanes; i++) {
+		vb2_set_plane_payload(&vb_done->vb2_buf, i,
+				      stream->pixm.plane_fmt[i].sizeimage);
+	}
+
+	vb_done->vb2_buf.timestamp = ktime_get_ns();
+	vb2_buffer_done(&vb_done->vb2_buf, VB2_BUF_STATE_DONE);
+}
+
+static void dma_idle_int_handler(struct snps_hdmirx_dev *hdmirx_dev,
+				 bool *handled)
+{
+	struct hdmirx_stream *stream = &hdmirx_dev->stream;
+	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
+	struct v4l2_dv_timings timings = hdmirx_dev->timings;
+	struct v4l2_bt_timings *bt = &timings.bt;
+	struct vb2_v4l2_buffer *vb_done = NULL;
+
+	if (!(stream->irq_stat) && !(stream->irq_stat & LINE_FLAG_INT_EN))
+		v4l2_dbg(1, debug, v4l2_dev,
+			 "%s: last time have no line_flag_irq\n", __func__);
+
+	if (stream->line_flag_int_cnt <= FILTER_FRAME_CNT)
+		goto DMA_IDLE_OUT;
+
+	if (bt->interlaced != V4L2_DV_INTERLACED ||
+	    !(stream->line_flag_int_cnt % 2)) {
+		if (stream->next_buf) {
+			if (stream->curr_buf)
+				vb_done = &stream->curr_buf->vb;
+
+			if (vb_done) {
+				vb_done->vb2_buf.timestamp = ktime_get_ns();
+				vb_done->sequence = stream->frame_idx;
+				hdmirx_vb_done(stream, vb_done);
+				stream->frame_idx++;
+				if (stream->frame_idx == 30)
+					v4l2_info(v4l2_dev, "rcv frames\n");
+			}
+
+			stream->curr_buf = NULL;
+			if (stream->next_buf) {
+				stream->curr_buf = stream->next_buf;
+				stream->next_buf = NULL;
+			}
+		} else {
+			v4l2_dbg(3, debug, v4l2_dev,
+				 "%s: next_buf NULL, skip vb_done\n", __func__);
+		}
+	}
+
+DMA_IDLE_OUT:
+	*handled = true;
+}
+
+static void line_flag_int_handler(struct snps_hdmirx_dev *hdmirx_dev,
+				  bool *handled)
+{
+	struct hdmirx_stream *stream = &hdmirx_dev->stream;
+	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
+	struct v4l2_dv_timings timings = hdmirx_dev->timings;
+	struct v4l2_bt_timings *bt = &timings.bt;
+	u32 dma_cfg6;
+
+	stream->line_flag_int_cnt++;
+	if (!(stream->irq_stat) && !(stream->irq_stat & HDMIRX_DMA_IDLE_INT))
+		v4l2_dbg(1, debug, v4l2_dev,
+			 "%s: last have no dma_idle_irq\n", __func__);
+	dma_cfg6 = hdmirx_readl(hdmirx_dev, DMA_CONFIG6);
+	if (!(dma_cfg6 & HDMIRX_DMA_EN)) {
+		v4l2_dbg(2, debug, v4l2_dev, "%s: dma not on\n", __func__);
+		goto LINE_FLAG_OUT;
+	}
+
+	if (stream->line_flag_int_cnt <= FILTER_FRAME_CNT)
+		goto LINE_FLAG_OUT;
+
+	if (bt->interlaced != V4L2_DV_INTERLACED ||
+	    !(stream->line_flag_int_cnt % 2)) {
+		if (!stream->next_buf) {
+			spin_lock(&stream->vbq_lock);
+			if (!list_empty(&stream->buf_head)) {
+				stream->next_buf = list_first_entry(&stream->buf_head,
+								    struct hdmirx_buffer,
+								    queue);
+				list_del(&stream->next_buf->queue);
+			} else {
+				stream->next_buf = NULL;
+			}
+			spin_unlock(&stream->vbq_lock);
+
+			if (stream->next_buf) {
+				hdmirx_writel(hdmirx_dev, DMA_CONFIG2,
+					      stream->next_buf->buff_addr[HDMIRX_PLANE_Y]);
+				hdmirx_writel(hdmirx_dev, DMA_CONFIG3,
+					      stream->next_buf->buff_addr[HDMIRX_PLANE_CBCR]);
+			} else {
+				v4l2_dbg(3, debug, v4l2_dev,
+					 "%s: no buffer is available\n", __func__);
+			}
+		}
+	} else {
+		v4l2_dbg(3, debug, v4l2_dev, "%s: interlace:%d, line_flag_int_cnt:%d\n",
+			 __func__, bt->interlaced, stream->line_flag_int_cnt);
+	}
+
+LINE_FLAG_OUT:
+	*handled = true;
+}
+
+static irqreturn_t hdmirx_dma_irq_handler(int irq, void *dev_id)
+{
+	struct snps_hdmirx_dev *hdmirx_dev = dev_id;
+	struct hdmirx_stream *stream = &hdmirx_dev->stream;
+	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
+	u32 dma_stat1, dma_stat13;
+	bool handled = false;
+
+	dma_stat1 = hdmirx_readl(hdmirx_dev, DMA_STATUS1);
+	dma_stat13 = hdmirx_readl(hdmirx_dev, DMA_STATUS13);
+	v4l2_dbg(3, debug, v4l2_dev, "dma_irq st1:%#x, st13:%d\n",
+		 dma_stat1, dma_stat13);
+
+	if (READ_ONCE(stream->stopping)) {
+		v4l2_dbg(1, debug, v4l2_dev, "%s: stop stream\n", __func__);
+		hdmirx_writel(hdmirx_dev, DMA_CONFIG5, 0xffffffff);
+		hdmirx_update_bits(hdmirx_dev, DMA_CONFIG4,
+				   LINE_FLAG_INT_EN |
+				   HDMIRX_DMA_IDLE_INT |
+				   HDMIRX_LOCK_DISABLE_INT |
+				   LAST_FRAME_AXI_UNFINISH_INT_EN |
+				   FIFO_OVERFLOW_INT_EN |
+				   FIFO_UNDERFLOW_INT_EN |
+				   HDMIRX_AXI_ERROR_INT_EN, 0);
+		WRITE_ONCE(stream->stopping, false);
+		wake_up(&stream->wq_stopped);
+		return IRQ_HANDLED;
+	}
+
+	if (dma_stat1 & HDMIRX_DMA_IDLE_INT)
+		dma_idle_int_handler(hdmirx_dev, &handled);
+
+	if (dma_stat1 & LINE_FLAG_INT_EN)
+		line_flag_int_handler(hdmirx_dev, &handled);
+
+	if (!handled)
+		v4l2_dbg(3, debug, v4l2_dev,
+			 "%s: dma irq not handled, dma_stat1:%#x\n",
+			 __func__, dma_stat1);
+
+	stream->irq_stat = dma_stat1;
+	hdmirx_writel(hdmirx_dev, DMA_CONFIG5, 0xffffffff);
+
+	return IRQ_HANDLED;
+}
+
+static void hdmirx_plugin(struct snps_hdmirx_dev *hdmirx_dev)
+{
+	struct arm_smccc_res res;
+	int ret;
+
+	queue_delayed_work(system_unbound_wq,
+			   &hdmirx_dev->delayed_work_heartbeat,
+			   msecs_to_jiffies(10));
+	arm_smccc_smc(SIP_WDT_CFG, WDT_START, 0, 0, 0, 0, 0, 0, &res);
+	hdmirx_submodule_init(hdmirx_dev);
+	hdmirx_update_bits(hdmirx_dev, SCDC_CONFIG, POWERPROVIDED,
+			   POWERPROVIDED);
+	hdmirx_hpd_ctrl(hdmirx_dev, true);
+	hdmirx_phy_config(hdmirx_dev);
+	ret = hdmirx_wait_lock_and_get_timing(hdmirx_dev);
+	if (ret) {
+		hdmirx_plugout(hdmirx_dev);
+		queue_delayed_work(system_unbound_wq,
+				   &hdmirx_dev->delayed_work_hotplug,
+				   msecs_to_jiffies(200));
+		return;
+	}
+	hdmirx_dma_config(hdmirx_dev);
+	hdmirx_interrupts_setup(hdmirx_dev, true);
+}
+
+static void hdmirx_delayed_work_hotplug(struct work_struct *work)
+{
+	struct snps_hdmirx_dev *hdmirx_dev;
+	bool plugin;
+
+	hdmirx_dev = container_of(work, struct snps_hdmirx_dev,
+				  delayed_work_hotplug.work);
+
+	mutex_lock(&hdmirx_dev->work_lock);
+	hdmirx_dev->got_timing = false;
+	plugin = tx_5v_power_present(hdmirx_dev);
+	v4l2_ctrl_s_ctrl(hdmirx_dev->detect_tx_5v_ctrl, plugin);
+	v4l2_dbg(1, debug, &hdmirx_dev->v4l2_dev, "%s: plugin:%d\n",
+		 __func__, plugin);
+
+	if (plugin)
+		hdmirx_plugin(hdmirx_dev);
+	else
+		hdmirx_plugout(hdmirx_dev);
+
+	mutex_unlock(&hdmirx_dev->work_lock);
+}
+
+static void hdmirx_delayed_work_res_change(struct work_struct *work)
+{
+	struct snps_hdmirx_dev *hdmirx_dev;
+	bool plugin;
+
+	hdmirx_dev = container_of(work, struct snps_hdmirx_dev,
+				  delayed_work_res_change.work);
+
+	mutex_lock(&hdmirx_dev->work_lock);
+	plugin = tx_5v_power_present(hdmirx_dev);
+	v4l2_dbg(1, debug, &hdmirx_dev->v4l2_dev, "%s: plugin:%d\n",
+		 __func__, plugin);
+	if (plugin) {
+		hdmirx_interrupts_setup(hdmirx_dev, false);
+		hdmirx_submodule_init(hdmirx_dev);
+		hdmirx_update_bits(hdmirx_dev, SCDC_CONFIG, POWERPROVIDED,
+				   POWERPROVIDED);
+		hdmirx_hpd_ctrl(hdmirx_dev, true);
+		hdmirx_phy_config(hdmirx_dev);
+
+		if (hdmirx_wait_lock_and_get_timing(hdmirx_dev)) {
+			hdmirx_plugout(hdmirx_dev);
+			queue_delayed_work(system_unbound_wq,
+					   &hdmirx_dev->delayed_work_hotplug,
+					   msecs_to_jiffies(200));
+		} else {
+			hdmirx_dma_config(hdmirx_dev);
+			hdmirx_interrupts_setup(hdmirx_dev, true);
+		}
+	}
+	mutex_unlock(&hdmirx_dev->work_lock);
+}
+
+static void hdmirx_delayed_work_heartbeat(struct work_struct *work)
+{
+	struct delayed_work *dwork = to_delayed_work(work);
+	struct snps_hdmirx_dev *hdmirx_dev = container_of(dwork,
+							struct snps_hdmirx_dev,
+							delayed_work_heartbeat);
+
+	queue_work(system_highpri_wq, &hdmirx_dev->work_wdt_config);
+	queue_delayed_work(system_unbound_wq,
+			   &hdmirx_dev->delayed_work_heartbeat, HZ);
+}
+
+static void hdmirx_work_wdt_config(struct work_struct *work)
+{
+	struct arm_smccc_res res;
+	struct snps_hdmirx_dev *hdmirx_dev = container_of(work,
+							struct snps_hdmirx_dev,
+							work_wdt_config);
+	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
+
+	arm_smccc_smc(SIP_WDT_CFG, WDT_PING, 0, 0, 0, 0, 0, 0, &res);
+	v4l2_dbg(3, debug, v4l2_dev, "hb\n");
+}
+
+static irqreturn_t hdmirx_5v_det_irq_handler(int irq, void *dev_id)
+{
+	struct snps_hdmirx_dev *hdmirx_dev = dev_id;
+	u32 val;
+
+	val = gpiod_get_value(hdmirx_dev->detect_5v_gpio);
+	v4l2_dbg(3, debug, &hdmirx_dev->v4l2_dev, "%s: 5v:%d\n", __func__, val);
+
+	queue_delayed_work(system_unbound_wq,
+			   &hdmirx_dev->delayed_work_hotplug,
+			   msecs_to_jiffies(10));
+
+	return IRQ_HANDLED;
+}
+
+static const struct hdmirx_cec_ops hdmirx_cec_ops = {
+	.write = hdmirx_writel,
+	.read = hdmirx_readl,
+};
+
+static int hdmirx_parse_dt(struct snps_hdmirx_dev *hdmirx_dev)
+{
+	struct device *dev = hdmirx_dev->dev;
+	int ret;
+
+	hdmirx_dev->num_clks = devm_clk_bulk_get_all(dev, &hdmirx_dev->clks);
+	if (hdmirx_dev->num_clks < 1)
+		return -ENODEV;
+
+	hdmirx_dev->resets[HDMIRX_RST_A].id = "rst_a";
+	hdmirx_dev->resets[HDMIRX_RST_P].id = "rst_p";
+	hdmirx_dev->resets[HDMIRX_RST_REF].id = "rst_ref";
+	hdmirx_dev->resets[HDMIRX_RST_BIU].id = "rst_biu";
+
+	ret = devm_reset_control_bulk_get_exclusive(dev, HDMIRX_NUM_RST,
+						    hdmirx_dev->resets);
+	if (ret < 0) {
+		dev_err(dev, "failed to get reset controls\n");
+		return ret;
+	}
+
+	hdmirx_dev->detect_5v_gpio =
+		devm_gpiod_get_optional(dev, "hdmirx-5v-detection", GPIOD_IN);
+
+	if (IS_ERR(hdmirx_dev->detect_5v_gpio)) {
+		dev_err(dev, "failed to get hdmirx 5v detection gpio\n");
+		return PTR_ERR(hdmirx_dev->detect_5v_gpio);
+	}
+
+	hdmirx_dev->grf = syscon_regmap_lookup_by_phandle(dev->of_node,
+							  "rockchip,grf");
+	if (IS_ERR(hdmirx_dev->grf)) {
+		dev_err(dev, "failed to get rockchip,grf\n");
+		return PTR_ERR(hdmirx_dev->grf);
+	}
+
+	hdmirx_dev->vo1_grf = syscon_regmap_lookup_by_phandle(dev->of_node,
+							      "rockchip,vo1_grf");
+	if (IS_ERR(hdmirx_dev->vo1_grf)) {
+		dev_err(dev, "failed to get rockchip,vo1_grf\n");
+		return PTR_ERR(hdmirx_dev->vo1_grf);
+	}
+
+	hdmirx_dev->hpd_trigger_level = !device_property_read_bool(dev, "hpd-is-active-low");
+
+	ret = of_reserved_mem_device_init(dev);
+	if (ret)
+		dev_warn(dev, "No reserved memory for HDMIRX, use default CMA\n");
+
+	return 0;
+}
+
+static void hdmirx_disable_all_interrupts(struct snps_hdmirx_dev *hdmirx_dev)
+{
+	hdmirx_writel(hdmirx_dev, MAINUNIT_0_INT_MASK_N, 0);
+	hdmirx_writel(hdmirx_dev, MAINUNIT_1_INT_MASK_N, 0);
+	hdmirx_writel(hdmirx_dev, MAINUNIT_2_INT_MASK_N, 0);
+	hdmirx_writel(hdmirx_dev, AVPUNIT_0_INT_MASK_N, 0);
+	hdmirx_writel(hdmirx_dev, AVPUNIT_1_INT_MASK_N, 0);
+	hdmirx_writel(hdmirx_dev, PKT_0_INT_MASK_N, 0);
+	hdmirx_writel(hdmirx_dev, PKT_1_INT_MASK_N, 0);
+	hdmirx_writel(hdmirx_dev, PKT_2_INT_MASK_N, 0);
+	hdmirx_writel(hdmirx_dev, SCDC_INT_MASK_N, 0);
+	hdmirx_writel(hdmirx_dev, CEC_INT_MASK_N, 0);
+
+	hdmirx_clear_interrupt(hdmirx_dev, MAINUNIT_0_INT_CLEAR, 0xffffffff);
+	hdmirx_clear_interrupt(hdmirx_dev, MAINUNIT_1_INT_CLEAR, 0xffffffff);
+	hdmirx_clear_interrupt(hdmirx_dev, MAINUNIT_2_INT_CLEAR, 0xffffffff);
+	hdmirx_clear_interrupt(hdmirx_dev, AVPUNIT_0_INT_CLEAR, 0xffffffff);
+	hdmirx_clear_interrupt(hdmirx_dev, AVPUNIT_1_INT_CLEAR, 0xffffffff);
+	hdmirx_clear_interrupt(hdmirx_dev, PKT_0_INT_CLEAR, 0xffffffff);
+	hdmirx_clear_interrupt(hdmirx_dev, PKT_1_INT_CLEAR, 0xffffffff);
+	hdmirx_clear_interrupt(hdmirx_dev, PKT_2_INT_CLEAR, 0xffffffff);
+	hdmirx_clear_interrupt(hdmirx_dev, SCDC_INT_CLEAR, 0xffffffff);
+	hdmirx_clear_interrupt(hdmirx_dev, HDCP_INT_CLEAR, 0xffffffff);
+	hdmirx_clear_interrupt(hdmirx_dev, HDCP_1_INT_CLEAR, 0xffffffff);
+	hdmirx_clear_interrupt(hdmirx_dev, CEC_INT_CLEAR, 0xffffffff);
+}
+
+static int hdmirx_init(struct snps_hdmirx_dev *hdmirx_dev)
+{
+	hdmirx_update_bits(hdmirx_dev, PHY_CONFIG, PHY_RESET | PHY_PDDQ, 0);
+
+	regmap_write(hdmirx_dev->vo1_grf, VO1_GRF_VO1_CON2,
+		     (HDMIRX_SDAIN_MSK | HDMIRX_SCLIN_MSK) |
+		     ((HDMIRX_SDAIN_MSK | HDMIRX_SCLIN_MSK) << 16));
+	/*
+	 * Some interrupts are enabled by default, so we disable
+	 * all interrupts and clear interrupts status first.
+	 */
+	hdmirx_disable_all_interrupts(hdmirx_dev);
+
+	return 0;
+}
+
+static void hdmirx_edid_init_config(struct snps_hdmirx_dev *hdmirx_dev)
+{
+	int ret;
+	struct v4l2_edid def_edid;
+
+	/* disable hpd and write edid */
+	def_edid.pad = 0;
+	def_edid.start_block = 0;
+	def_edid.blocks = EDID_NUM_BLOCKS_MAX;
+	if (hdmirx_dev->edid_version == HDMIRX_EDID_600M)
+		def_edid.edid = edid_init_data_600M;
+	else
+		def_edid.edid = edid_init_data_340M;
+	ret = hdmirx_write_edid(hdmirx_dev, &def_edid, false);
+	if (ret)
+		dev_err(hdmirx_dev->dev, "%s: write edid failed\n", __func__);
+}
+
+static void hdmirx_disable_irq(struct device *dev)
+{
+	struct snps_hdmirx_dev *hdmirx_dev = dev_get_drvdata(dev);
+	struct arm_smccc_res res;
+
+	disable_irq(hdmirx_dev->hdmi_irq);
+	disable_irq(hdmirx_dev->dma_irq);
+	disable_irq(hdmirx_dev->det_irq);
+
+	arm_smccc_smc(RK_SIP_FIQ_CTRL, RK_SIP_FIQ_CTRL_FIQ_DIS,
+		      RK_IRQ_HDMIRX_HDMI, 0, 0, 0, 0, 0, &res);
+
+	cancel_delayed_work_sync(&hdmirx_dev->delayed_work_hotplug);
+	cancel_delayed_work_sync(&hdmirx_dev->delayed_work_res_change);
+	cancel_delayed_work_sync(&hdmirx_dev->delayed_work_heartbeat);
+	flush_work(&hdmirx_dev->work_wdt_config);
+
+	arm_smccc_smc(SIP_WDT_CFG, WDT_STOP, 0, 0, 0, 0, 0, 0, &res);
+}
+
+static int hdmirx_disable(struct device *dev)
+{
+	struct snps_hdmirx_dev *hdmirx_dev = dev_get_drvdata(dev);
+	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
+
+	clk_bulk_disable_unprepare(hdmirx_dev->num_clks, hdmirx_dev->clks);
+
+	v4l2_dbg(2, debug, v4l2_dev, "%s: suspend\n", __func__);
+
+	return pinctrl_pm_select_sleep_state(dev);
+}
+
+static void hdmirx_enable_irq(struct device *dev)
+{
+	struct snps_hdmirx_dev *hdmirx_dev = dev_get_drvdata(dev);
+	struct arm_smccc_res res;
+
+	enable_irq(hdmirx_dev->hdmi_irq);
+	enable_irq(hdmirx_dev->dma_irq);
+	enable_irq(hdmirx_dev->det_irq);
+
+	arm_smccc_smc(RK_SIP_FIQ_CTRL, RK_SIP_FIQ_CTRL_FIQ_EN,
+		      RK_IRQ_HDMIRX_HDMI, 0, 0, 0, 0, 0, &res);
+
+	queue_delayed_work(system_unbound_wq, &hdmirx_dev->delayed_work_hotplug,
+			   msecs_to_jiffies(20));
+}
+
+static int hdmirx_enable(struct device *dev)
+{
+	struct snps_hdmirx_dev *hdmirx_dev = dev_get_drvdata(dev);
+	struct v4l2_device *v4l2_dev = &hdmirx_dev->v4l2_dev;
+	int ret;
+
+	v4l2_dbg(2, debug, v4l2_dev, "%s: resume\n", __func__);
+	ret = pinctrl_pm_select_default_state(dev);
+	if (ret < 0)
+		return ret;
+
+	ret = clk_bulk_prepare_enable(hdmirx_dev->num_clks, hdmirx_dev->clks);
+	if (ret) {
+		dev_err(dev, "failed to enable hdmirx bulk clks: %d\n", ret);
+		return ret;
+	}
+
+	reset_control_bulk_assert(HDMIRX_NUM_RST, hdmirx_dev->resets);
+	usleep_range(150, 160);
+	reset_control_bulk_deassert(HDMIRX_NUM_RST, hdmirx_dev->resets);
+	usleep_range(150, 160);
+
+	hdmirx_edid_init_config(hdmirx_dev);
+
+	return 0;
+}
+
+static int hdmirx_suspend(struct device *dev)
+{
+	hdmirx_disable_irq(dev);
+
+	return hdmirx_disable(dev);
+}
+
+static int hdmirx_resume(struct device *dev)
+{
+	int ret = hdmirx_enable(dev);
+
+	if (ret)
+		return ret;
+
+	hdmirx_enable_irq(dev);
+
+	return 0;
+}
+
+static const struct dev_pm_ops snps_hdmirx_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(hdmirx_suspend, hdmirx_resume)
+};
+
+static int hdmirx_setup_irq(struct snps_hdmirx_dev *hdmirx_dev,
+			    struct platform_device *pdev)
+{
+	struct device *dev = hdmirx_dev->dev;
+	int ret, irq;
+
+	irq = platform_get_irq_byname(pdev, "hdmi");
+	if (irq < 0) {
+		dev_err_probe(dev, irq, "failed to get hdmi irq\n");
+		return irq;
+	}
+
+	irq_set_status_flags(irq, IRQ_NOAUTOEN);
+
+	hdmirx_dev->hdmi_irq = irq;
+	ret = devm_request_irq(dev, irq, hdmirx_hdmi_irq_handler, 0,
+			       "rk_hdmirx-hdmi", hdmirx_dev);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to request hdmi irq\n");
+		return ret;
+	}
+
+	irq = platform_get_irq_byname(pdev, "dma");
+	if (irq < 0) {
+		dev_err_probe(dev, irq, "failed to get dma irq\n");
+		return irq;
+	}
+
+	irq_set_status_flags(irq, IRQ_NOAUTOEN);
+
+	hdmirx_dev->dma_irq = irq;
+	ret = devm_request_threaded_irq(dev, irq, NULL, hdmirx_dma_irq_handler,
+					IRQF_ONESHOT, "rk_hdmirx-dma",
+					hdmirx_dev);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to request dma irq\n");
+		return ret;
+	}
+
+	irq = gpiod_to_irq(hdmirx_dev->detect_5v_gpio);
+	if (irq < 0) {
+		dev_err_probe(dev, irq, "failed to get hdmirx-5v irq\n");
+		return irq;
+	}
+
+	irq_set_status_flags(irq, IRQ_NOAUTOEN);
+
+	hdmirx_dev->det_irq = irq;
+	ret = devm_request_irq(dev, irq, hdmirx_5v_det_irq_handler,
+			       IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING,
+			       "rk_hdmirx-5v", hdmirx_dev);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to request hdmirx-5v irq\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int hdmirx_register_cec(struct snps_hdmirx_dev *hdmirx_dev,
+			       struct platform_device *pdev)
+{
+	struct device *dev = hdmirx_dev->dev;
+	struct hdmirx_cec_data cec_data;
+	int irq;
+
+	irq = platform_get_irq_byname(pdev, "cec");
+	if (irq < 0) {
+		dev_err_probe(dev, irq, "failed to get cec irq\n");
+		return irq;
+	}
+
+	hdmirx_dev->cec_notifier = cec_notifier_conn_register(dev, NULL, NULL);
+	if (!hdmirx_dev->cec_notifier)
+		return -EINVAL;
+
+	cec_data.hdmirx = hdmirx_dev;
+	cec_data.dev = hdmirx_dev->dev;
+	cec_data.ops = &hdmirx_cec_ops;
+	cec_data.irq = irq;
+	cec_data.edid = edid_init_data_340M;
+
+	hdmirx_dev->cec = snps_hdmirx_cec_register(&cec_data);
+	if (!hdmirx_dev->cec) {
+		cec_notifier_conn_unregister(hdmirx_dev->cec_notifier);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int hdmirx_probe(struct platform_device *pdev)
+{
+	struct snps_hdmirx_dev *hdmirx_dev;
+	struct device *dev = &pdev->dev;
+	struct v4l2_ctrl_handler *hdl;
+	struct hdmirx_stream *stream;
+	struct v4l2_device *v4l2_dev;
+	int ret;
+
+	hdmirx_dev = devm_kzalloc(dev, sizeof(*hdmirx_dev), GFP_KERNEL);
+	if (!hdmirx_dev)
+		return -ENOMEM;
+
+	ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
+	if (ret)
+		return ret;
+
+	hdmirx_dev->dev = dev;
+	dev_set_drvdata(dev, hdmirx_dev);
+	hdmirx_dev->edid_version = HDMIRX_EDID_340M;
+
+	ret = hdmirx_parse_dt(hdmirx_dev);
+	if (ret)
+		return ret;
+
+	ret = hdmirx_setup_irq(hdmirx_dev, pdev);
+	if (ret)
+		return ret;
+
+	hdmirx_dev->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(hdmirx_dev->regs))
+		return dev_err_probe(dev, PTR_ERR(hdmirx_dev->regs),
+				     "failed to remap regs resource\n");
+
+	mutex_init(&hdmirx_dev->stream_lock);
+	mutex_init(&hdmirx_dev->work_lock);
+	spin_lock_init(&hdmirx_dev->rst_lock);
+
+	init_completion(&hdmirx_dev->cr_write_done);
+	init_completion(&hdmirx_dev->timer_base_lock);
+	init_completion(&hdmirx_dev->avi_pkt_rcv);
+
+	INIT_WORK(&hdmirx_dev->work_wdt_config, hdmirx_work_wdt_config);
+	INIT_DELAYED_WORK(&hdmirx_dev->delayed_work_hotplug,
+			  hdmirx_delayed_work_hotplug);
+	INIT_DELAYED_WORK(&hdmirx_dev->delayed_work_res_change,
+			  hdmirx_delayed_work_res_change);
+	INIT_DELAYED_WORK(&hdmirx_dev->delayed_work_heartbeat,
+			  hdmirx_delayed_work_heartbeat);
+
+	hdmirx_dev->cur_fmt_fourcc = V4L2_PIX_FMT_BGR24;
+	hdmirx_dev->timings = cea640x480;
+
+	hdmirx_enable(dev);
+	hdmirx_init(hdmirx_dev);
+
+	v4l2_dev = &hdmirx_dev->v4l2_dev;
+	strscpy(v4l2_dev->name, dev_name(dev), sizeof(v4l2_dev->name));
+
+	hdl = &hdmirx_dev->hdl;
+	v4l2_ctrl_handler_init(hdl, 1);
+	hdmirx_dev->detect_tx_5v_ctrl = v4l2_ctrl_new_std(hdl, NULL,
+							  V4L2_CID_DV_RX_POWER_PRESENT,
+							  0, 1, 0, 0);
+	if (hdl->error) {
+		dev_err(dev, "v4l2 ctrl handler init failed\n");
+		ret = hdl->error;
+		goto err_pm;
+	}
+	hdmirx_dev->v4l2_dev.ctrl_handler = hdl;
+
+	ret = v4l2_device_register(dev, &hdmirx_dev->v4l2_dev);
+	if (ret < 0) {
+		dev_err(dev, "register v4l2 device failed\n");
+		goto err_hdl;
+	}
+
+	stream = &hdmirx_dev->stream;
+	stream->hdmirx_dev = hdmirx_dev;
+	ret = hdmirx_register_stream_vdev(stream);
+	if (ret < 0) {
+		dev_err(dev, "register video device failed\n");
+		goto err_unreg_v4l2_dev;
+	}
+
+	ret = hdmirx_register_cec(hdmirx_dev, pdev);
+	if (ret)
+		goto err_unreg_video_dev;
+
+	hdmirx_enable_irq(dev);
+
+	return 0;
+
+err_unreg_video_dev:
+	video_unregister_device(&hdmirx_dev->stream.vdev);
+err_unreg_v4l2_dev:
+	v4l2_device_unregister(&hdmirx_dev->v4l2_dev);
+err_hdl:
+	v4l2_ctrl_handler_free(&hdmirx_dev->hdl);
+err_pm:
+	hdmirx_disable(dev);
+
+	return ret;
+}
+
+static int hdmirx_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct snps_hdmirx_dev *hdmirx_dev = dev_get_drvdata(dev);
+
+	snps_hdmirx_cec_unregister(hdmirx_dev->cec);
+	cec_notifier_conn_unregister(hdmirx_dev->cec_notifier);
+
+	hdmirx_disable_irq(dev);
+
+	video_unregister_device(&hdmirx_dev->stream.vdev);
+	v4l2_ctrl_handler_free(&hdmirx_dev->hdl);
+	v4l2_device_unregister(&hdmirx_dev->v4l2_dev);
+
+	hdmirx_disable(dev);
+
+	reset_control_bulk_assert(HDMIRX_NUM_RST, hdmirx_dev->resets);
+
+	of_reserved_mem_device_release(dev);
+
+	return 0;
+}
+
+static const struct of_device_id hdmirx_id[] = {
+	{ .compatible = "rockchip,rk3588-hdmirx-ctrler" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, hdmirx_id);
+
+static struct platform_driver hdmirx_driver = {
+	.probe = hdmirx_probe,
+	.remove = hdmirx_remove,
+	.driver = {
+		.name = "snps_hdmirx",
+		.of_match_table = hdmirx_id,
+		.pm = &snps_hdmirx_pm_ops,
+	}
+};
+module_platform_driver(hdmirx_driver);
+
+MODULE_DESCRIPTION("Rockchip HDMI Receiver Driver");
+MODULE_AUTHOR("Dingxian Wen <shawn.wen@rock-chips.com>");
+MODULE_AUTHOR("Shreeya Patel <shreeya.patel@collabora.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
new file mode 100644
index 000000000000..220ab99ca611
--- /dev/null
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
@@ -0,0 +1,394 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 Rockchip Electronics Co. Ltd.
+ *
+ * Author: Dingxian Wen <shawn.wen@rock-chips.com>
+ */
+
+#ifndef DW_HDMIRX_H
+#define DW_HDMIRX_H
+
+#include <linux/bitops.h>
+
+#define UPDATE(x, h, l)		(((x) << (l)) & GENMASK((h), (l)))
+#define HIWORD_UPDATE(v, h, l)	(((v) << (l)) | (GENMASK((h), (l)) << 16))
+
+/* SYS_GRF */
+#define SYS_GRF_SOC_CON1			0x0304
+#define HDMIRXPHY_SRAM_EXT_LD_DONE		BIT(1)
+#define HDMIRXPHY_SRAM_BYPASS			BIT(0)
+#define SYS_GRF_SOC_STATUS1			0x0384
+#define HDMIRXPHY_SRAM_INIT_DONE		BIT(10)
+#define SYS_GRF_CHIP_ID				0x0600
+
+/* VO1_GRF */
+#define VO1_GRF_VO1_CON2			0x0008
+#define HDMIRX_SDAIN_MSK			BIT(2)
+#define HDMIRX_SCLIN_MSK			BIT(1)
+
+/* HDMIRX PHY */
+#define SUP_DIG_ANA_CREGS_SUP_ANA_NC			0x004f
+
+#define	LANE0_DIG_ASIC_RX_OVRD_OUT_0			0x100f
+#define	LANE1_DIG_ASIC_RX_OVRD_OUT_0			0x110f
+#define	LANE2_DIG_ASIC_RX_OVRD_OUT_0			0x120f
+#define	LANE3_DIG_ASIC_RX_OVRD_OUT_0			0x130f
+#define ASIC_ACK_OVRD_EN				BIT(1)
+#define ASIC_ACK					BIT(0)
+
+#define	LANE0_DIG_RX_VCOCAL_RX_VCO_CAL_CTRL_2		0x104a
+#define	LANE1_DIG_RX_VCOCAL_RX_VCO_CAL_CTRL_2		0x114a
+#define	LANE2_DIG_RX_VCOCAL_RX_VCO_CAL_CTRL_2		0x124a
+#define	LANE3_DIG_RX_VCOCAL_RX_VCO_CAL_CTRL_2		0x134a
+#define FREQ_TUNE_START_VAL_MASK			GENMASK(9, 0)
+#define FREQ_TUNE_START_VAL(x)				UPDATE(x, 9, 0)
+
+#define	HDMIPCS_DIG_CTRL_PATH_MAIN_FSM_FSM_CONFIG	0x20c4
+#define	HDMIPCS_DIG_CTRL_PATH_MAIN_FSM_ADAPT_REF_FOM	0x20c7
+#define HDMIPCS_DIG_CTRL_PATH_MAIN_FSM_RATE_CALC_HDMI14_CDR_SETTING_3_REG	0x20e9
+#define CDR_SETTING_BOUNDARY_3_DEFAULT			0x52da
+#define HDMIPCS_DIG_CTRL_PATH_MAIN_FSM_RATE_CALC_HDMI14_CDR_SETTING_4_REG	0x20ea
+#define CDR_SETTING_BOUNDARY_4_DEFAULT			0x43cd
+#define HDMIPCS_DIG_CTRL_PATH_MAIN_FSM_RATE_CALC_HDMI14_CDR_SETTING_5_REG	0x20eb
+#define CDR_SETTING_BOUNDARY_5_DEFAULT			0x35b3
+#define HDMIPCS_DIG_CTRL_PATH_MAIN_FSM_RATE_CALC_HDMI14_CDR_SETTING_6_REG	0x20fb
+#define	CDR_SETTING_BOUNDARY_6_DEFAULT			0x2799
+#define HDMIPCS_DIG_CTRL_PATH_MAIN_FSM_RATE_CALC_HDMI14_CDR_SETTING_7_REG	0x20fc
+#define CDR_SETTING_BOUNDARY_7_DEFAULT			0x1b65
+
+#define	RAWLANE0_DIG_PCS_XF_RX_OVRD_OUT			0x300e
+#define	RAWLANE1_DIG_PCS_XF_RX_OVRD_OUT			0x310e
+#define	RAWLANE2_DIG_PCS_XF_RX_OVRD_OUT			0x320e
+#define	RAWLANE3_DIG_PCS_XF_RX_OVRD_OUT			0x330e
+#define PCS_ACK_WRITE_SELECT				BIT(14)
+#define PCS_EN_CTL					BIT(1)
+#define PCS_ACK						BIT(0)
+
+#define	RAWLANE0_DIG_AON_FAST_FLAGS			0x305c
+#define	RAWLANE1_DIG_AON_FAST_FLAGS			0x315c
+#define	RAWLANE2_DIG_AON_FAST_FLAGS			0x325c
+#define	RAWLANE3_DIG_AON_FAST_FLAGS			0x335c
+
+/* HDMIRX Ctrler */
+#define GLOBAL_SWRESET_REQUEST			0x0020
+#define DATAPATH_SWRESETREQ			BIT(12)
+#define GLOBAL_SWENABLE				0x0024
+#define PHYCTRL_ENABLE				BIT(21)
+#define CEC_ENABLE				BIT(16)
+#define TMDS_ENABLE				BIT(13)
+#define DATAPATH_ENABLE				BIT(12)
+#define PKTFIFO_ENABLE				BIT(11)
+#define AVPUNIT_ENABLE				BIT(8)
+#define MAIN_ENABLE				BIT(0)
+#define GLOBAL_TIMER_REF_BASE			0x0028
+#define CORE_CONFIG				0x0050
+#define CMU_CONFIG0				0x0060
+#define TMDSQPCLK_STABLE_FREQ_MARGIN_MASK	GENMASK(30, 16)
+#define TMDSQPCLK_STABLE_FREQ_MARGIN(x)		UPDATE(x, 30, 16)
+#define AUDCLK_STABLE_FREQ_MARGIN_MASK		GENMASK(11, 9)
+#define AUDCLK_STABLE_FREQ_MARGIN(x)		UPDATE(x, 11, 9)
+#define CMU_STATUS				0x007c
+#define TMDSQPCLK_LOCKED_ST			BIT(4)
+#define CMU_TMDSQPCLK_FREQ			0x0084
+#define PHY_CONFIG				0x00c0
+#define LDO_AFE_PROG_MASK			GENMASK(24, 23)
+#define LDO_AFE_PROG(x)				UPDATE(x, 24, 23)
+#define LDO_PWRDN				BIT(21)
+#define TMDS_CLOCK_RATIO			BIT(16)
+#define RXDATA_WIDTH				BIT(15)
+#define REFFREQ_SEL_MASK			GENMASK(11, 9)
+#define REFFREQ_SEL(x)				UPDATE(x, 11, 9)
+#define HDMI_DISABLE				BIT(8)
+#define PHY_PDDQ				BIT(1)
+#define PHY_RESET				BIT(0)
+#define PHY_STATUS				0x00c8
+#define HDMI_DISABLE_ACK			BIT(1)
+#define PDDQ_ACK				BIT(0)
+#define PHYCREG_CONFIG0				0x00e0
+#define PHYCREG_CR_PARA_SELECTION_MODE_MASK	GENMASK(1, 0)
+#define PHYCREG_CR_PARA_SELECTION_MODE(x)	UPDATE(x, 1, 0)
+#define PHYCREG_CONFIG1				0x00e4
+#define PHYCREG_CONFIG2				0x00e8
+#define PHYCREG_CONFIG3				0x00ec
+#define PHYCREG_CONTROL				0x00f0
+#define PHYCREG_CR_PARA_WRITE_P			BIT(1)
+#define PHYCREG_CR_PARA_READ_P			BIT(0)
+#define PHYCREG_STATUS				0x00f4
+
+#define MAINUNIT_STATUS				0x0150
+#define TMDSVALID_STABLE_ST			BIT(1)
+#define DESCRAND_EN_CONTROL			0x0210
+#define SCRAMB_EN_SEL_QST_MASK			GENMASK(1, 0)
+#define SCRAMB_EN_SEL_QST(x)			UPDATE(x, 1, 0)
+#define DESCRAND_SYNC_CONTROL			0x0214
+#define RECOVER_UNSYNC_STREAM_QST		BIT(0)
+#define DESCRAND_SYNC_SEQ_CONFIG		0x022c
+#define DESCRAND_SYNC_SEQ_ERR_CNT_EN		BIT(0)
+#define DESCRAND_SYNC_SEQ_STATUS		0x0234
+#define DEFRAMER_CONFIG0			0x0270
+#define VS_CNT_THR_QST_MASK			GENMASK(27, 20)
+#define VS_CNT_THR_QST(x)			UPDATE(x, 27, 20)
+#define HS_POL_QST_MASK				GENMASK(19, 18)
+#define HS_POL_QST(x)				UPDATE(x, 19, 18)
+#define VS_POL_QST_MASK				GENMASK(17, 16)
+#define VS_POL_QST(x)				UPDATE(x, 17, 16)
+#define VS_REMAPFILTER_EN_QST			BIT(8)
+#define VS_FILTER_ORDER_QST_MASK		GENMASK(1, 0)
+#define VS_FILTER_ORDER_QST(x)			UPDATE(x, 1, 0)
+#define DEFRAMER_VSYNC_CNT_CLEAR		0x0278
+#define VSYNC_CNT_CLR_P				BIT(0)
+#define DEFRAMER_STATUS				0x027c
+#define OPMODE_STS_MASK				GENMASK(6, 4)
+#define I2C_SLAVE_CONFIG1			0x0164
+#define I2C_SDA_OUT_HOLD_VALUE_QST_MASK		GENMASK(15, 8)
+#define I2C_SDA_OUT_HOLD_VALUE_QST(x)		UPDATE(x, 15, 8)
+#define I2C_SDA_IN_HOLD_VALUE_QST_MASK		GENMASK(7, 0)
+#define I2C_SDA_IN_HOLD_VALUE_QST(x)		UPDATE(x, 7, 0)
+#define OPMODE_STS_MASK				GENMASK(6, 4)
+#define REPEATER_QST				BIT(28)
+#define FASTREAUTH_QST				BIT(27)
+#define FEATURES_1DOT1_QST			BIT(26)
+#define FASTI2C_QST				BIT(25)
+#define EESS_CTL_THR_QST_MASK			GENMASK(19, 16)
+#define EESS_CTL_THR_QST(x)			UPDATE(x, 19, 16)
+#define OESS_CTL3_THR_QST_MASK			GENMASK(11, 8)
+#define OESS_CTL3_THR_QST(x)			UPDATE(x, 11, 8)
+#define EESS_OESS_SEL_QST_MASK			GENMASK(5, 4)
+#define EESS_OESS_SEL_QST(x)			UPDATE(x, 5, 4)
+#define KEY_DECRYPT_EN_QST			BIT(0)
+#define KEY_DECRYPT_SEED_QST_MASK		GENMASK(15, 0)
+#define KEY_DECRYPT_SEED_QST(x)			UPDATE(x, 15, 0)
+#define HDCP_INT_CLEAR				0x50d8
+#define HDCP_1_INT_CLEAR			0x50e8
+#define HDCP2_CONFIG				0x02f0
+#define HDCP2_SWITCH_OVR_VALUE			BIT(2)
+#define HDCP2_SWITCH_OVR_EN			BIT(1)
+
+#define VIDEO_CONFIG2				0x042c
+#define VPROC_VSYNC_POL_OVR_VALUE		BIT(19)
+#define VPROC_VSYNC_POL_OVR_EN			BIT(18)
+#define VPROC_HSYNC_POL_OVR_VALUE		BIT(17)
+#define VPROC_HSYNC_POL_OVR_EN			BIT(16)
+#define VPROC_FMT_OVR_VALUE_MASK		GENMASK(6, 4)
+#define VPROC_FMT_OVR_VALUE(x)			UPDATE(x, 6, 4)
+#define VPROC_FMT_OVR_EN			BIT(0)
+
+#define AFIFO_FILL_RESTART			BIT(0)
+#define AFIFO_INIT_P				BIT(0)
+#define AFIFO_THR_LOW_QST_MASK			GENMASK(25, 16)
+#define AFIFO_THR_LOW_QST(x)			UPDATE(x, 25, 16)
+#define AFIFO_THR_HIGH_QST_MASK			GENMASK(9, 0)
+#define AFIFO_THR_HIGH_QST(x)			UPDATE(x, 9, 0)
+#define AFIFO_THR_MUTE_LOW_QST_MASK		GENMASK(25, 16)
+#define AFIFO_THR_MUTE_LOW_QST(x)		UPDATE(x, 25, 16)
+#define AFIFO_THR_MUTE_HIGH_QST_MASK		GENMASK(9, 0)
+#define AFIFO_THR_MUTE_HIGH_QST(x)		UPDATE(x, 9, 0)
+
+#define AFIFO_UNDERFLOW_ST			BIT(25)
+#define AFIFO_OVERFLOW_ST			BIT(24)
+
+#define SPEAKER_ALLOC_OVR_EN			BIT(16)
+#define I2S_BPCUV_EN				BIT(4)
+#define SPDIF_EN				BIT(2)
+#define I2S_EN					BIT(1)
+#define AFIFO_THR_PASS_DEMUTEMASK_N		BIT(24)
+#define AVMUTE_DEMUTEMASK_N			BIT(16)
+#define AFIFO_THR_MUTE_LOW_MUTEMASK_N		BIT(9)
+#define AFIFO_THR_MUTE_HIGH_MUTEMASK_N		BIT(8)
+#define AVMUTE_MUTEMASK_N			BIT(0)
+#define SCDC_CONFIG				0x0580
+#define HPDLOW					BIT(1)
+#define POWERPROVIDED				BIT(0)
+#define SCDC_REGBANK_STATUS1			0x058c
+#define SCDC_TMDSBITCLKRATIO			BIT(1)
+#define SCDC_REGBANK_STATUS3			0x0594
+#define SCDC_REGBANK_CONFIG0			0x05c0
+#define SCDC_SINKVERSION_QST_MASK		GENMASK(7, 0)
+#define SCDC_SINKVERSION_QST(x)			UPDATE(x, 7, 0)
+#define AGEN_LAYOUT				BIT(4)
+#define AGEN_SPEAKER_ALLOC			GENMASK(15, 8)
+
+#define CED_CONFIG				0x0760
+#define CED_VIDDATACHECKEN_QST			BIT(27)
+#define CED_DATAISCHECKEN_QST			BIT(26)
+#define CED_GBCHECKEN_QST			BIT(25)
+#define CED_CTRLCHECKEN_QST			BIT(24)
+#define CED_CHLOCKMAXER_QST_MASK		GENMASK(14, 0)
+#define CED_CHLOCKMAXER_QST(x)			UPDATE(x, 14, 0)
+#define CED_DYN_CONFIG				0x0768
+#define CED_DYN_CONTROL				0x076c
+#define PKTEX_BCH_ERRFILT_CONFIG		0x07c4
+#define PKTEX_CHKSUM_ERRFILT_CONFIG		0x07c8
+
+#define PKTDEC_ACR_PH2_1			0x1100
+#define PKTDEC_ACR_PB3_0			0x1104
+#define PKTDEC_ACR_PB7_4			0x1108
+#define PKTDEC_AVIIF_PH2_1			0x1200
+#define PKTDEC_AVIIF_PB3_0			0x1204
+#define PKTDEC_AVIIF_PB7_4			0x1208
+#define VIC_VAL_MASK				GENMASK(6, 0)
+#define PKTDEC_AVIIF_PB11_8			0x120c
+#define PKTDEC_AVIIF_PB15_12			0x1210
+#define PKTDEC_AVIIF_PB19_16			0x1214
+#define PKTDEC_AVIIF_PB23_20			0x1218
+#define PKTDEC_AVIIF_PB27_24			0x121c
+
+#define PKTFIFO_CONFIG				0x1500
+#define PKTFIFO_STORE_FILT_CONFIG		0x1504
+#define PKTFIFO_THR_CONFIG0			0x1508
+#define PKTFIFO_THR_CONFIG1			0x150c
+#define PKTFIFO_CONTROL				0x1510
+
+#define VMON_STATUS1				0x1580
+#define VMON_STATUS2				0x1584
+#define VMON_STATUS3				0x1588
+#define VMON_STATUS4				0x158c
+#define VMON_STATUS5				0x1590
+#define VMON_STATUS6				0x1594
+#define VMON_STATUS7				0x1598
+#define VMON_ILACE_DETECT			BIT(4)
+
+#define CEC_TX_CONTROL				0x2000
+#define CEC_STATUS				0x2004
+#define CEC_CONFIG				0x2008
+#define RX_AUTO_DRIVE_ACKNOWLEDGE		BIT(9)
+#define CEC_ADDR				0x200c
+#define CEC_TX_COUNT				0x2020
+#define CEC_TX_DATA3_0				0x2024
+#define CEC_RX_COUNT_STATUS			0x2040
+#define CEC_RX_DATA3_0				0x2044
+#define CEC_LOCK_CONTROL			0x2054
+#define CEC_RXQUAL_BITTIME_CONFIG		0x2060
+#define CEC_RX_BITTIME_CONFIG			0x2064
+#define CEC_TX_BITTIME_CONFIG			0x2068
+
+#define DMA_CONFIG1				0x4400
+#define UV_WID_MASK				GENMASK(31, 28)
+#define UV_WID(x)				UPDATE(x, 31, 28)
+#define Y_WID_MASK				GENMASK(27, 24)
+#define Y_WID(x)				UPDATE(x, 27, 24)
+#define DDR_STORE_FORMAT_MASK			GENMASK(15, 12)
+#define DDR_STORE_FORMAT(x)			UPDATE(x, 15, 12)
+#define ABANDON_EN				BIT(0)
+#define DMA_CONFIG2				0x4404
+#define DMA_CONFIG3				0x4408
+#define DMA_CONFIG4				0x440c // dma irq en
+#define DMA_CONFIG5				0x4410 // dma irq clear status
+#define LINE_FLAG_INT_EN			BIT(8)
+#define HDMIRX_DMA_IDLE_INT			BIT(7)
+#define HDMIRX_LOCK_DISABLE_INT			BIT(6)
+#define LAST_FRAME_AXI_UNFINISH_INT_EN		BIT(5)
+#define FIFO_OVERFLOW_INT_EN			BIT(2)
+#define FIFO_UNDERFLOW_INT_EN			BIT(1)
+#define HDMIRX_AXI_ERROR_INT_EN			BIT(0)
+#define DMA_CONFIG6				0x4414
+#define RB_SWAP_EN				BIT(9)
+#define HSYNC_TOGGLE_EN				BIT(5)
+#define VSYNC_TOGGLE_EN				BIT(4)
+#define HDMIRX_DMA_EN				BIT(1)
+#define DMA_CONFIG7				0x4418
+#define LINE_FLAG_NUM_MASK			GENMASK(31, 16)
+#define LINE_FLAG_NUM(x)			UPDATE(x, 31, 16)
+#define LOCK_FRAME_NUM_MASK			GENMASK(11, 0)
+#define LOCK_FRAME_NUM(x)			UPDATE(x, 11, 0)
+#define DMA_CONFIG8				0x441c
+#define REG_MIRROR_EN				BIT(0)
+#define DMA_CONFIG9				0x4420
+#define DMA_CONFIG10				0x4424
+#define DMA_CONFIG11				0x4428
+#define EDID_READ_EN_MASK			BIT(8)
+#define EDID_READ_EN(x)				UPDATE(x, 8, 8)
+#define EDID_WRITE_EN_MASK			BIT(7)
+#define EDID_WRITE_EN(x)			UPDATE(x, 7, 7)
+#define EDID_SLAVE_ADDR_MASK			GENMASK(6, 0)
+#define EDID_SLAVE_ADDR(x)			UPDATE(x, 6, 0)
+#define DMA_STATUS1				0x4430 // dma irq status
+#define DMA_STATUS2				0x4434
+#define DMA_STATUS3				0x4438
+#define DMA_STATUS4				0x443c
+#define DMA_STATUS5				0x4440
+#define DMA_STATUS6				0x4444
+#define DMA_STATUS7				0x4448
+#define DMA_STATUS8				0x444c
+#define DMA_STATUS9				0x4450
+#define DMA_STATUS10				0x4454
+#define HDMIRX_LOCK				BIT(3)
+#define DMA_STATUS11				0x4458
+#define HDMIRX_TYPE_MASK			GENMASK(8, 7)
+#define HDMIRX_COLOR_DEPTH_MASK			GENMASK(6, 3)
+#define HDMIRX_FORMAT_MASK			GENMASK(2, 0)
+#define DMA_STATUS12				0x445c
+#define DMA_STATUS13				0x4460
+#define DMA_STATUS14				0x4464
+
+#define MAINUNIT_INTVEC_INDEX			0x5000
+#define MAINUNIT_0_INT_STATUS			0x5010
+#define CECRX_NOTIFY_ERR			BIT(12)
+#define CECRX_EOM				BIT(11)
+#define CECTX_DRIVE_ERR				BIT(10)
+#define CECRX_BUSY				BIT(9)
+#define CECTX_BUSY				BIT(8)
+#define CECTX_FRAME_DISCARDED			BIT(5)
+#define CECTX_NRETRANSMIT_FAIL			BIT(4)
+#define CECTX_LINE_ERR				BIT(3)
+#define CECTX_ARBLOST				BIT(2)
+#define CECTX_NACK				BIT(1)
+#define CECTX_DONE				BIT(0)
+#define MAINUNIT_0_INT_MASK_N			0x5014
+#define MAINUNIT_0_INT_CLEAR			0x5018
+#define MAINUNIT_0_INT_FORCE			0x501c
+#define TIMER_BASE_LOCKED_IRQ			BIT(26)
+#define TMDSQPCLK_OFF_CHG			BIT(5)
+#define TMDSQPCLK_LOCKED_CHG			BIT(4)
+#define MAINUNIT_1_INT_STATUS			0x5020
+#define MAINUNIT_1_INT_MASK_N			0x5024
+#define MAINUNIT_1_INT_CLEAR			0x5028
+#define MAINUNIT_1_INT_FORCE			0x502c
+#define MAINUNIT_2_INT_STATUS			0x5030
+#define MAINUNIT_2_INT_MASK_N			0x5034
+#define MAINUNIT_2_INT_CLEAR			0x5038
+#define MAINUNIT_2_INT_FORCE			0x503c
+#define PHYCREG_CR_READ_DONE			BIT(11)
+#define PHYCREG_CR_WRITE_DONE			BIT(10)
+#define TMDSVALID_STABLE_CHG			BIT(1)
+
+#define AVPUNIT_0_INT_STATUS			0x5040
+#define AVPUNIT_0_INT_MASK_N			0x5044
+#define AVPUNIT_0_INT_CLEAR			0x5048
+#define AVPUNIT_0_INT_FORCE			0x504c
+#define CED_DYN_CNT_CH2_IRQ			BIT(22)
+#define CED_DYN_CNT_CH1_IRQ			BIT(21)
+#define CED_DYN_CNT_CH0_IRQ			BIT(20)
+#define AVPUNIT_1_INT_STATUS			0x5050
+#define DEFRAMER_VSYNC_THR_REACHED_IRQ		BIT(1)
+#define AVPUNIT_1_INT_MASK_N			0x5054
+#define DEFRAMER_VSYNC_THR_REACHED_MASK_N	BIT(1)
+#define DEFRAMER_VSYNC_MASK_N			BIT(0)
+#define AVPUNIT_1_INT_CLEAR			0x5058
+#define DEFRAMER_VSYNC_THR_REACHED_CLEAR	BIT(1)
+#define PKT_0_INT_STATUS			0x5080
+#define PKTDEC_ACR_CHG_IRQ			BIT(3)
+#define PKT_0_INT_MASK_N			0x5084
+#define PKTDEC_ACR_CHG_MASK_N			BIT(3)
+#define PKT_0_INT_CLEAR				0x5088
+#define PKT_1_INT_STATUS			0x5090
+#define PKT_1_INT_MASK_N			0x5094
+#define PKT_1_INT_CLEAR				0x5098
+#define PKT_2_INT_STATUS			0x50a0
+#define PKTDEC_ACR_RCV_IRQ			BIT(3)
+#define PKT_2_INT_MASK_N			0x50a4
+#define PKTDEC_AVIIF_RCV_IRQ			BIT(11)
+#define PKTDEC_ACR_RCV_MASK_N			BIT(3)
+#define PKT_2_INT_CLEAR				0x50a8
+#define PKTDEC_AVIIF_RCV_CLEAR			BIT(11)
+#define PKTDEC_ACR_RCV_CLEAR			BIT(3)
+#define SCDC_INT_STATUS				0x50c0
+#define SCDC_INT_MASK_N				0x50c4
+#define SCDC_INT_CLEAR				0x50c8
+#define SCDCTMDSCCFG_CHG			BIT(2)
+
+#define CEC_INT_STATUS				0x5100
+#define CEC_INT_MASK_N				0x5104
+#define CEC_INT_CLEAR				0x5108
+
+#endif
diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx_cec.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx_cec.c
new file mode 100644
index 000000000000..8554cbc4ccde
--- /dev/null
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx_cec.c
@@ -0,0 +1,289 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 Rockchip Electronics Co. Ltd.
+ *
+ * Author: Shunqing Chen <csq@rock-chips.com>
+ */
+
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include <media/cec.h>
+#include <media/cec-notifier.h>
+
+#include "snps_hdmirx.h"
+#include "snps_hdmirx_cec.h"
+
+static void hdmirx_cec_write(struct hdmirx_cec *cec, int reg, u32 val)
+{
+	cec->ops->write(cec->hdmirx, reg, val);
+}
+
+static u32 hdmirx_cec_read(struct hdmirx_cec *cec, int reg)
+{
+	return cec->ops->read(cec->hdmirx, reg);
+}
+
+static void hdmirx_cec_update_bits(struct hdmirx_cec *cec, int reg, u32 mask,
+				   u32 data)
+{
+	u32 val = hdmirx_cec_read(cec, reg) & ~mask;
+
+	val |= (data & mask);
+	hdmirx_cec_write(cec, reg, val);
+}
+
+static int hdmirx_cec_log_addr(struct cec_adapter *adap, u8 logical_addr)
+{
+	struct hdmirx_cec *cec = cec_get_drvdata(adap);
+
+	if (logical_addr == CEC_LOG_ADDR_INVALID)
+		cec->addresses = 0;
+	else
+		cec->addresses |= BIT(logical_addr) | BIT(15);
+
+	hdmirx_cec_write(cec, CEC_ADDR, cec->addresses);
+
+	return 0;
+}
+
+static int hdmirx_cec_transmit(struct cec_adapter *adap, u8 attempts,
+			       u32 signal_free_time, struct cec_msg *msg)
+{
+	struct hdmirx_cec *cec = cec_get_drvdata(adap);
+	u32 data[4] = {0};
+	int i, data_len, msg_len;
+
+	msg_len = msg->len;
+	if (msg->len > 16)
+		msg_len = 16;
+	if (msg_len <= 0)
+		return 0;
+
+	hdmirx_cec_write(cec, CEC_TX_COUNT, msg_len - 1);
+	for (i = 0; i < msg_len; i++)
+		data[i / 4] |= msg->msg[i] << (i % 4) * 8;
+
+	data_len = msg_len / 4 + 1;
+	for (i = 0; i < data_len; i++)
+		hdmirx_cec_write(cec, CEC_TX_DATA3_0 + i * 4, data[i]);
+
+	hdmirx_cec_write(cec, CEC_TX_CONTROL, 0x1);
+
+	return 0;
+}
+
+static irqreturn_t hdmirx_cec_hardirq(int irq, void *data)
+{
+	struct cec_adapter *adap = data;
+	struct hdmirx_cec *cec = cec_get_drvdata(adap);
+	u32 stat = hdmirx_cec_read(cec, CEC_INT_STATUS);
+	irqreturn_t ret = IRQ_HANDLED;
+	u32 val;
+
+	if (!stat)
+		return IRQ_NONE;
+
+	hdmirx_cec_write(cec, CEC_INT_CLEAR, stat);
+
+	if (stat & CECTX_LINE_ERR) {
+		cec->tx_status = CEC_TX_STATUS_ERROR;
+		cec->tx_done = true;
+		ret = IRQ_WAKE_THREAD;
+	} else if (stat & CECTX_DONE) {
+		cec->tx_status = CEC_TX_STATUS_OK;
+		cec->tx_done = true;
+		ret = IRQ_WAKE_THREAD;
+	} else if (stat & CECTX_NACK) {
+		cec->tx_status = CEC_TX_STATUS_NACK;
+		cec->tx_done = true;
+		ret = IRQ_WAKE_THREAD;
+	}
+
+	if (stat & CECRX_EOM) {
+		unsigned int len, i;
+
+		val = hdmirx_cec_read(cec, CEC_RX_COUNT_STATUS);
+		/* rxbuffer locked status */
+		if ((val & 0x80))
+			return ret;
+
+		len = (val & 0xf) + 1;
+		if (len > sizeof(cec->rx_msg.msg))
+			len = sizeof(cec->rx_msg.msg);
+
+		for (i = 0; i < len; i++) {
+			if (!(i % 4))
+				val = hdmirx_cec_read(cec, CEC_RX_DATA3_0 + i / 4 * 4);
+			cec->rx_msg.msg[i] = (val >> ((i % 4) * 8)) & 0xff;
+		}
+
+		cec->rx_msg.len = len;
+		smp_wmb(); /* receive RX msg */
+		cec->rx_done = true;
+		hdmirx_cec_write(cec, CEC_LOCK_CONTROL, 0x1);
+
+		ret = IRQ_WAKE_THREAD;
+	}
+
+	return ret;
+}
+
+static irqreturn_t hdmirx_cec_thread(int irq, void *data)
+{
+	struct cec_adapter *adap = data;
+	struct hdmirx_cec *cec = cec_get_drvdata(adap);
+
+	if (cec->tx_done) {
+		cec->tx_done = false;
+		cec_transmit_attempt_done(adap, cec->tx_status);
+	}
+	if (cec->rx_done) {
+		cec->rx_done = false;
+		smp_rmb(); /* RX msg has been received */
+		cec_received_msg(adap, &cec->rx_msg);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int hdmirx_cec_enable(struct cec_adapter *adap, bool enable)
+{
+	struct hdmirx_cec *cec = cec_get_drvdata(adap);
+
+	if (!enable) {
+		hdmirx_cec_write(cec, CEC_INT_MASK_N, 0);
+		hdmirx_cec_write(cec, CEC_INT_CLEAR, 0);
+		if (cec->ops->disable)
+			cec->ops->disable(cec->hdmirx);
+	} else {
+		unsigned int irqs;
+
+		hdmirx_cec_log_addr(cec->adap, CEC_LOG_ADDR_INVALID);
+		if (cec->ops->enable)
+			cec->ops->enable(cec->hdmirx);
+		hdmirx_cec_update_bits(cec, GLOBAL_SWENABLE, CEC_ENABLE, CEC_ENABLE);
+
+		irqs = CECTX_LINE_ERR | CECTX_NACK | CECRX_EOM | CECTX_DONE;
+		hdmirx_cec_write(cec, CEC_INT_MASK_N, irqs);
+	}
+
+	return 0;
+}
+
+static const struct cec_adap_ops hdmirx_cec_ops = {
+	.adap_enable = hdmirx_cec_enable,
+	.adap_log_addr = hdmirx_cec_log_addr,
+	.adap_transmit = hdmirx_cec_transmit,
+};
+
+static void hdmirx_cec_del(void *data)
+{
+	struct hdmirx_cec *cec = data;
+
+	cec_delete_adapter(cec->adap);
+}
+
+struct hdmirx_cec *snps_hdmirx_cec_register(struct hdmirx_cec_data *data)
+{
+	struct hdmirx_cec *cec;
+	unsigned int irqs;
+	int ret;
+
+	if (!data)
+		return NULL;
+
+	/*
+	 * Our device is just a convenience - we want to link to the real
+	 * hardware device here, so that userspace can see the association
+	 * between the HDMI hardware and its associated CEC chardev.
+	 */
+	cec = devm_kzalloc(data->dev, sizeof(*cec), GFP_KERNEL);
+	if (!cec)
+		return NULL;
+
+	cec->dev = data->dev;
+	cec->irq = data->irq;
+	cec->ops = data->ops;
+	cec->hdmirx = data->hdmirx;
+	cec->edid = (struct edid *)data->edid;
+
+	hdmirx_cec_update_bits(cec, GLOBAL_SWENABLE, CEC_ENABLE, CEC_ENABLE);
+	hdmirx_cec_update_bits(cec, CEC_CONFIG, RX_AUTO_DRIVE_ACKNOWLEDGE,
+			       RX_AUTO_DRIVE_ACKNOWLEDGE);
+
+	hdmirx_cec_write(cec, CEC_TX_COUNT, 0);
+	hdmirx_cec_write(cec, CEC_INT_MASK_N, 0);
+	hdmirx_cec_write(cec, CEC_INT_CLEAR, ~0);
+
+	cec->adap = cec_allocate_adapter(&hdmirx_cec_ops, cec, "rk-hdmirx",
+					 CEC_CAP_LOG_ADDRS | CEC_CAP_TRANSMIT |
+					 CEC_CAP_RC | CEC_CAP_PASSTHROUGH,
+					 CEC_MAX_LOG_ADDRS);
+	if (IS_ERR(cec->adap)) {
+		dev_err(cec->dev, "cec adap allocate failed\n");
+		return NULL;
+	}
+
+	/* override the module pointer */
+	cec->adap->owner = THIS_MODULE;
+
+	ret = devm_add_action(cec->dev, hdmirx_cec_del, cec);
+	if (ret) {
+		cec_delete_adapter(cec->adap);
+		return NULL;
+	}
+
+	irq_set_status_flags(cec->irq, IRQ_NOAUTOEN);
+
+	ret = devm_request_threaded_irq(cec->dev, cec->irq,
+					hdmirx_cec_hardirq,
+					hdmirx_cec_thread, IRQF_ONESHOT,
+					"rk_hdmirx_cec", cec->adap);
+	if (ret) {
+		dev_err(cec->dev, "cec irq request failed\n");
+		return NULL;
+	}
+
+	cec->notify = cec_notifier_cec_adap_register(cec->dev,
+						     NULL, cec->adap);
+	if (!cec->notify) {
+		dev_err(cec->dev, "cec notify register failed\n");
+		return NULL;
+	}
+
+	ret = cec_register_adapter(cec->adap, cec->dev);
+	if (ret < 0) {
+		dev_err(cec->dev, "cec register adapter failed\n");
+		cec_unregister_adapter(cec->adap);
+		return NULL;
+	}
+
+	cec_s_phys_addr_from_edid(cec->adap, cec->edid);
+
+	irqs = CECTX_LINE_ERR | CECTX_NACK | CECRX_EOM | CECTX_DONE;
+	hdmirx_cec_write(cec, CEC_INT_MASK_N, irqs);
+
+	/*
+	 * CEC documentation says we must not call cec_delete_adapter
+	 * after a successful call to cec_register_adapter().
+	 */
+	devm_remove_action(cec->dev, hdmirx_cec_del, cec);
+
+	enable_irq(cec->irq);
+
+	return cec;
+}
+
+void snps_hdmirx_cec_unregister(struct hdmirx_cec *cec)
+{
+	if (!cec)
+		return;
+
+	disable_irq(cec->irq);
+
+	cec_unregister_adapter(cec->adap);
+}
diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx_cec.h b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx_cec.h
new file mode 100644
index 000000000000..ae43f74d471d
--- /dev/null
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx_cec.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 Rockchip Electronics Co. Ltd.
+ *
+ * Author: Shunqing Chen <csq@rock-chips.com>
+ */
+
+#ifndef DW_HDMI_RX_CEC_H
+#define DW_HDMI_RX_CEC_H
+
+struct snps_hdmirx_dev;
+
+struct hdmirx_cec_ops {
+	void (*write)(struct snps_hdmirx_dev *hdmirx_dev, int reg, u32 val);
+	u32 (*read)(struct snps_hdmirx_dev *hdmirx_dev, int reg);
+	void (*enable)(struct snps_hdmirx_dev *hdmirx);
+	void (*disable)(struct snps_hdmirx_dev *hdmirx);
+};
+
+struct hdmirx_cec_data {
+	struct snps_hdmirx_dev *hdmirx;
+	const struct hdmirx_cec_ops *ops;
+	struct device *dev;
+	int irq;
+	u8 *edid;
+};
+
+struct hdmirx_cec {
+	struct snps_hdmirx_dev *hdmirx;
+	struct device *dev;
+	const struct hdmirx_cec_ops *ops;
+	u32 addresses;
+	struct cec_adapter *adap;
+	struct cec_msg rx_msg;
+	unsigned int tx_status;
+	bool tx_done;
+	bool rx_done;
+	struct cec_notifier *notify;
+	int irq;
+	struct edid *edid;
+};
+
+struct hdmirx_cec *snps_hdmirx_cec_register(struct hdmirx_cec_data *data);
+void snps_hdmirx_cec_unregister(struct hdmirx_cec *cec);
+
+#endif /* DW_HDMI_RX_CEC_H */
-- 
2.39.2


