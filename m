Return-Path: <linux-clk+bounces-696-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1307FF41D
	for <lists+linux-clk@lfdr.de>; Thu, 30 Nov 2023 16:56:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93FAD281961
	for <lists+linux-clk@lfdr.de>; Thu, 30 Nov 2023 15:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 801A454BD5;
	Thu, 30 Nov 2023 15:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="naaz5MMn"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7F7510D5;
	Thu, 30 Nov 2023 07:56:40 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-6ce2eaf7c2bso684699a34.0;
        Thu, 30 Nov 2023 07:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701359800; x=1701964600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCZRu41lejPENY3+HX/kNvGM2TkW/9bH+QHYWn05Zp0=;
        b=naaz5MMnJOXbcAPepKBQP1FOptTTkWgcBTIqc2Rd+/XHPZykM5Becd5ZxPGGwdQZmj
         ce6V7GOMz3ibUJLrDCV0ZE+eLpjvodY/JtEpCeLN8R3wLT+xAx9tX/AzIkjgvmU2F6Ib
         /UwhbnkQ18EdAQxiOP1kHVntG1lgzwbUcmR7EKkNokgnBKlnscfoIKc09vCG7BUoL8mo
         YVy+9vZP8P5DI3Q24y86kpWLvOR5PrzJl0ujU4xV4WX3HAovonVDDL1BAeVPmJs3FoP2
         JwoNH5z9ch3HwmEKstEkTGtgJI1uDwZzr3WxOI5dX5djNMYP2evVglU5KMepGx0xTNnI
         FgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701359800; x=1701964600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KCZRu41lejPENY3+HX/kNvGM2TkW/9bH+QHYWn05Zp0=;
        b=HkdUPs6IExTKykCpPkPGcQhUsfRTtxI12TwZpM90pZdgdcyBDD+i3Bn+tF3mLT5lIM
         2tBfC/PEy4UfPHDrvt+2xsG2u7qHAxTkB4becT1SRdtb7tGmXtzfLI+kMffJ3C+Ajuvi
         DdtOS+8UNP9oDiAt8NyWIYwA9VGtFcdYvMtT098IdWWyHMgEcESZQjxAIHYpjXjhnYWG
         +ltq42qjWue++BuxT5azfnaVB5/TlDb1fpf7lCSgPE35l0XKQB1xva9WT4/1Qk2zT0tU
         ElQC5V7AAmwunF3+SotbVFybLGulY7WRpaxchda1OHI9X2wIoLjjIRMZ7rCBd472w4Vy
         mgBw==
X-Gm-Message-State: AOJu0YyYZyPcCyL7s5TZDV8FOEhQM1roLlqfCjbiWQv4/XuY9kiNjStH
	8z2r3EYUlLGOX3+iOme8KaAa/EE5Cbs=
X-Google-Smtp-Source: AGHT+IHgtnxL8imcn319w0fIMtJbqLJUQ3uTmlU/jjml2Wq7aTPreWAuMUT5q9n8LvnQmV8CNHdo+w==
X-Received: by 2002:a9d:73c1:0:b0:6d8:28b1:3031 with SMTP id m1-20020a9d73c1000000b006d828b13031mr15004631otk.11.1701359800110;
        Thu, 30 Nov 2023 07:56:40 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id n25-20020a9d6f19000000b006d7ff27a47esm187852otq.77.2023.11.30.07.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 07:56:39 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sboyd@kernel.org,
	mturquette@baylibre.com,
	tzimmermann@suse.de,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	daniel@ffwll.ch,
	airlied@gmail.com,
	sam@ravnborg.org,
	quic_jesszhan@quicinc.com,
	neil.armstrong@linaro.org,
	javierm@redhat.com,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 6/9] drm/panel: himax-hx8394: Add Support for Powkiddy X55 panel
Date: Thu, 30 Nov 2023 09:56:21 -0600
Message-Id: <20231130155624.405575-7-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130155624.405575-1-macroalpha82@gmail.com>
References: <20231130155624.405575-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Powkiddy X55 panel as used on the Powkiddy X55
handheld gaming console. This panel uses a Himax HX8394 display
controller and requires a vendor provided init sequence. The display
resolution is 720x1280 and is 67mm by 121mm as measured with calipers.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/panel/panel-himax-hx8394.c | 137 +++++++++++++++++++++
 1 file changed, 137 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
index b68ea09f4725..4807ab1c10fe 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
@@ -38,6 +38,7 @@
 #define HX8394_CMD_SETMIPI	  0xba
 #define HX8394_CMD_SETOTP	  0xbb
 #define HX8394_CMD_SETREGBANK	  0xbd
+#define HX8394_CMD_UNKNOWN5	  0xbf
 #define HX8394_CMD_UNKNOWN1	  0xc0
 #define HX8394_CMD_SETDGCLUT	  0xc1
 #define HX8394_CMD_SETID	  0xc3
@@ -52,6 +53,7 @@
 #define HX8394_CMD_SETGIP1	  0xd5
 #define HX8394_CMD_SETGIP2	  0xd6
 #define HX8394_CMD_SETGPO	  0xd6
+#define HX8394_CMD_UNKNOWN4	  0xd8
 #define HX8394_CMD_SETSCALING	  0xdd
 #define HX8394_CMD_SETIDLE	  0xdf
 #define HX8394_CMD_SETGAMMA	  0xe0
@@ -203,6 +205,140 @@ static const struct hx8394_panel_desc hsd060bhw4_desc = {
 	.init_sequence = hsd060bhw4_init_sequence,
 };
 
+static int powkiddy_x55_init_sequence(struct hx8394 *ctx)
+{
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+
+	/* 5.19.8 SETEXTC: Set extension command (B9h) */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETEXTC,
+			       0xff, 0x83, 0x94);
+
+	/* 5.19.9 SETMIPI: Set MIPI control (BAh) */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETMIPI,
+			       0x63, 0x03, 0x68, 0x6b, 0xb2, 0xc0);
+
+	/* 5.19.2 SETPOWER: Set power (B1h) */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETPOWER,
+			       0x48, 0x12, 0x72, 0x09, 0x32, 0x54, 0x71, 0x71, 0x57, 0x47);
+
+	/* 5.19.3 SETDISP: Set display related register (B2h) */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETDISP,
+			       0x00, 0x80, 0x64, 0x0c, 0x0d, 0x2f);
+
+	/* 5.19.4 SETCYC: Set display waveform cycles (B4h) */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETCYC,
+			       0x73, 0x74, 0x73, 0x74, 0x73, 0x74, 0x01, 0x0c, 0x86, 0x75,
+			       0x00, 0x3f, 0x73, 0x74, 0x73, 0x74, 0x73, 0x74, 0x01, 0x0c,
+			       0x86);
+
+	/* 5.19.5 SETVCOM: Set VCOM voltage (B6h) */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETVCOM,
+			       0x6e, 0x6e);
+
+	/* 5.19.19 SETGIP0: Set GIP Option0 (D3h) */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGIP0,
+			       0x00, 0x00, 0x07, 0x07, 0x40, 0x07, 0x0c, 0x00, 0x08, 0x10,
+			       0x08, 0x00, 0x08, 0x54, 0x15, 0x0a, 0x05, 0x0a, 0x02, 0x15,
+			       0x06, 0x05, 0x06, 0x47, 0x44, 0x0a, 0x0a, 0x4b, 0x10, 0x07,
+			       0x07, 0x0c, 0x40);
+
+	/* 5.19.20 Set GIP Option1 (D5h) */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGIP1,
+			       0x1c, 0x1c, 0x1d, 0x1d, 0x00, 0x01, 0x02, 0x03, 0x04, 0x05,
+			       0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x24, 0x25, 0x18, 0x18,
+			       0x26, 0x27, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x20, 0x21,
+			       0x18, 0x18, 0x18, 0x18);
+
+	/* 5.19.21 Set GIP Option2 (D6h) */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGIP2,
+			       0x1c, 0x1c, 0x1d, 0x1d, 0x07, 0x06, 0x05, 0x04, 0x03, 0x02,
+			       0x01, 0x00, 0x0b, 0x0a, 0x09, 0x08, 0x21, 0x20, 0x18, 0x18,
+			       0x27, 0x26, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
+			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x25, 0x24,
+			       0x18, 0x18, 0x18, 0x18);
+
+	/* 5.19.25 SETGAMMA: Set gamma curve related setting (E0h) */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGAMMA,
+			       0x00, 0x0a, 0x15, 0x1b, 0x1e, 0x21, 0x24, 0x22, 0x47, 0x56,
+			       0x65, 0x66, 0x6e, 0x82, 0x88, 0x8b, 0x9a, 0x9d, 0x98, 0xa8,
+			       0xb9, 0x5d, 0x5c, 0x61, 0x66, 0x6a, 0x6f, 0x7f, 0x7f, 0x00,
+			       0x0a, 0x15, 0x1b, 0x1e, 0x21, 0x24, 0x22, 0x47, 0x56, 0x65,
+			       0x65, 0x6e, 0x81, 0x87, 0x8b, 0x98, 0x9d, 0x99, 0xa8, 0xba,
+			       0x5d, 0x5d, 0x62, 0x67, 0x6b, 0x72, 0x7f, 0x7f);
+
+	/* Unknown command, not listed in the HX8394-F datasheet */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN1,
+			       0x1f, 0x31);
+
+	/* 5.19.17 SETPANEL (CCh) */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETPANEL,
+			       0x0b);
+
+	/* Unknown command, not listed in the HX8394-F datasheet */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN3,
+			       0x02);
+
+	/* 5.19.11 Set register bank (BDh) */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
+			       0x02);
+
+	/* Unknown command, not listed in the HX8394-F datasheet */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN4,
+			       0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+			       0xff, 0xff);
+
+	/* 5.19.11 Set register bank (BDh) */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
+			       0x00);
+
+	/* 5.19.11 Set register bank (BDh) */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
+			       0x01);
+
+	/* 5.19.2 SETPOWER: Set power (B1h) */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETPOWER,
+			       0x00);
+
+	/* 5.19.11 Set register bank (BDh) */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
+			       0x00);
+
+	/* Unknown command, not listed in the HX8394-F datasheet */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN5,
+			       0x40, 0x81, 0x50, 0x00, 0x1a, 0xfc, 0x01);
+
+	/* Unknown command, not listed in the HX8394-F datasheet */
+	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN2,
+			       0xed);
+
+	return 0;
+}
+
+static const struct drm_display_mode powkiddy_x55_mode = {
+	.hdisplay	= 720,
+	.hsync_start	= 720 + 24,
+	.hsync_end	= 720 + 24 + 4,
+	.htotal		= 720 + 24 + 4 + 20,
+	.vdisplay	= 1280,
+	.vsync_start	= 1280 + 8,
+	.vsync_end	= 1280 + 8 + 4,
+	.vtotal		= 1280 + 8 + 4 + 8,
+	.clock		= 59904,
+	.flags		= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+	.width_mm	= 67,
+	.height_mm	= 121,
+};
+
+static const struct hx8394_panel_desc powkiddy_x55_desc = {
+	.mode = &powkiddy_x55_mode,
+	.lanes = 4,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+		      MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_NO_EOT_PACKET,
+	.format = MIPI_DSI_FMT_RGB888,
+	.init_sequence = powkiddy_x55_init_sequence,
+};
+
 static int hx8394_enable(struct drm_panel *panel)
 {
 	struct hx8394 *ctx = panel_to_hx8394(panel);
@@ -419,6 +555,7 @@ static void hx8394_remove(struct mipi_dsi_device *dsi)
 
 static const struct of_device_id hx8394_of_match[] = {
 	{ .compatible = "hannstar,hsd060bhw4", .data = &hsd060bhw4_desc },
+	{ .compatible = "powkiddy,x55-panel", .data = &powkiddy_x55_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, hx8394_of_match);
-- 
2.34.1


