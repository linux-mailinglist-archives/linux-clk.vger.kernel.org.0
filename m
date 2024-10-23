Return-Path: <linux-clk+bounces-13640-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A16A49AD1A1
	for <lists+linux-clk@lfdr.de>; Wed, 23 Oct 2024 18:53:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A9D31F24321
	for <lists+linux-clk@lfdr.de>; Wed, 23 Oct 2024 16:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF0AB1E7678;
	Wed, 23 Oct 2024 16:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="pfh1i+ar"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027EA1D5AA8
	for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 16:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729702226; cv=none; b=RyFCbhDx0fLRmhBNpv7MJz0621G3WKOvoqL+BSHFlyK5fAsKMtyliH3cq4sHh4AiGtKO7ZDT8iWJIlI8mR11Zk9iXAQNQ+CdIGQsPPoUktaD7QAl/SK3qNpUG99x2mg8nj4g/s6SdH5QGcTuNu7B81f9tWubv3qqAfxB3yMZAQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729702226; c=relaxed/simple;
	bh=ecnDLRcDlyYm0wBfzThIcZutVDkeubf1k2JgV/PbHsY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZXrmO76P07zDFRvOppq/2RNuBfiwDhnKGnBxE8EdZOx5TduCORKnsddHjMYgtJLo4Bmqjxxnf7gKMKxHpbOsHQUl5EpcgCb/4m+VgcRcoz5EINN0Ho+1I4aaenbp/mB+Xt5RcAcvIPJa65ulPJ+6Oi85w0ROKoMjm2WmfeCln3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=pfh1i+ar; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4315f24a6bbso62465835e9.1
        for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 09:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702219; x=1730307019; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/CSPRblkhTO8rG0021Sig/xg0pFYEX2HR8PV/WJ+JoE=;
        b=pfh1i+arXhLX7cntdvPR17tU+WSIsuH+uvLsnK0fE6LW/et+TbJRBGpNOUdxCPj+Is
         OMYIvHWT4zDx8K/yM8fBbzPW7eG/IxuJt/lu7cvPFgVxHcjtyBTP3xib6ygCgxw2E5Uj
         E+Rz2D1gvu/xnq0afUzBTjb4D7nRNxPaR2k2atGxhjrtOJg0QVoPiNEv5v/Ggt7UMG5S
         d5BBXvwZIBDjOh55o/IbN8nRDQMvaJ5fFLbxhpVhUd712ciy5J6a8dk7W+44kZe98ABX
         nm6Aoj+UozHkWAhKj88t6JEFNWXNBIeXPjqlYswjma1TmsUHZeDMGjXgSfYSS/qHW5ig
         p09A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702219; x=1730307019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CSPRblkhTO8rG0021Sig/xg0pFYEX2HR8PV/WJ+JoE=;
        b=kM49wJTWMaNemqgD8mwUApmMcHx3lYcm+Cbgm4zz0oXQG711GjFKWqFuhSMdOBbtaO
         R8SfGOXHmktiWemLfL6bHZ8TEAMXSBodDLoiHM9GD3JoB2/XCYI6Aru9hdmcdzXz7SrL
         /c165wi0oPevPlMZhb2jWvPpSybd+J3Hb9tZRk101zb9pyhhl0Ax35v17PyGcMOR6CTT
         o2adW+gSpoqEhID6/gFhnw5Vdfk6uBDtvF1PMqIWW4jobfPwT5zDmh4+JBmReW/GZQzB
         01Ip9mmM33y833lk4WbyrI48ov1ppp7epfTp5Qap/UPdPL5+LCHNiJ4T8UazUV3fO5BA
         WeQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIFnmABTBrHGA/jNIDTKSWakwRbvx4+uw8HWLGM4D+P33JlD9/45FoZToxKJu9Xcdadv9FWkJgsEM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNWz5jmMsbey1RQqGjUbS8VelwtVaC3QV//Tibd6ibMFXvPDSH
	OftgiDcwS9rvoQSo9mWybqsKRAEetgCgfQhwhGDLmsdivgiSvA5QzB+6JQAxESI=
X-Google-Smtp-Source: AGHT+IFhcREH5WyguN2BpkQSvGzo6i/YMXNpbOrOwRk95FtJ99WuGZ5Y/qS5643uN3+kEDqyZrDnvg==
X-Received: by 2002:a05:600c:1907:b0:42f:7e87:3438 with SMTP id 5b1f17b1804b1-4318407f750mr30191515e9.0.1729702218810;
        Wed, 23 Oct 2024 09:50:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:18 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:08 +0100
Subject: [PATCH 11/37] drm/vc4: hvs: Add support for BCM2712 HVS
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-11-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
In-Reply-To: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

From: Maxime Ripard <mripard@kernel.org>

The HVS found in the BCM2712, while having a similar role, is very
different from the one found in the previous SoCs. Indeed, the register
layout is fairly different, and the DLIST format is new as well.

Let's introduce the needed functions to support the new HVS.

This commit adds the C-step register layout. The D-step will be
added later.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_crtc.c  |  47 ++-
 drivers/gpu/drm/vc4/vc4_drv.c   |   6 +
 drivers/gpu/drm/vc4/vc4_drv.h   |  30 ++
 drivers/gpu/drm/vc4/vc4_hvs.c   | 564 +++++++++++++++++++++++++++--
 drivers/gpu/drm/vc4/vc4_kms.c   |  95 ++++-
 drivers/gpu/drm/vc4/vc4_plane.c | 767 ++++++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/vc4/vc4_regs.h  | 181 ++++++++++
 7 files changed, 1613 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 575900ee67a5..53bca104d0d5 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -83,13 +83,22 @@ static unsigned int
 vc4_crtc_get_cob_allocation(struct vc4_dev *vc4, unsigned int channel)
 {
 	struct vc4_hvs *hvs = vc4->hvs;
-	u32 dispbase = HVS_READ(SCALER_DISPBASEX(channel));
+	u32 dispbase, top, base;
+
 	/* Top/base are supposed to be 4-pixel aligned, but the
 	 * Raspberry Pi firmware fills the low bits (which are
 	 * presumably ignored).
 	 */
-	u32 top = VC4_GET_FIELD(dispbase, SCALER_DISPBASEX_TOP) & ~3;
-	u32 base = VC4_GET_FIELD(dispbase, SCALER_DISPBASEX_BASE) & ~3;
+
+	if (vc4->gen >= VC4_GEN_6_C) {
+		dispbase = HVS_READ(SCALER6_DISPX_COB(channel));
+		top = VC4_GET_FIELD(dispbase, SCALER6_DISPX_COB_TOP) & ~3;
+		base = VC4_GET_FIELD(dispbase, SCALER6_DISPX_COB_BASE) & ~3;
+	} else {
+		dispbase = HVS_READ(SCALER_DISPBASEX(channel));
+		top = VC4_GET_FIELD(dispbase, SCALER_DISPBASEX_TOP) & ~3;
+		base = VC4_GET_FIELD(dispbase, SCALER_DISPBASEX_BASE) & ~3;
+	}
 
 	return top - base + 4;
 }
@@ -122,7 +131,10 @@ static bool vc4_crtc_get_scanout_position(struct drm_crtc *crtc,
 	 * Read vertical scanline which is currently composed for our
 	 * pixelvalve by the HVS, and also the scaler status.
 	 */
-	val = HVS_READ(SCALER_DISPSTATX(channel));
+	if (vc4->gen >= VC4_GEN_6_C)
+		val = HVS_READ(SCALER6_DISPX_STATUS(channel));
+	else
+		val = HVS_READ(SCALER_DISPSTATX(channel));
 
 	/* Get optional system timestamp after query. */
 	if (etime)
@@ -131,7 +143,12 @@ static bool vc4_crtc_get_scanout_position(struct drm_crtc *crtc,
 	/* preempt_enable_rt() should go right here in PREEMPT_RT patchset. */
 
 	/* Vertical position of hvs composed scanline. */
-	*vpos = VC4_GET_FIELD(val, SCALER_DISPSTATX_LINE);
+
+	if (vc4->gen >= VC4_GEN_6_C)
+		*vpos = VC4_GET_FIELD(val, SCALER6_DISPX_STATUS_YLINE);
+	else
+		*vpos = VC4_GET_FIELD(val, SCALER_DISPSTATX_LINE);
+
 	*hpos = 0;
 
 	if (mode->flags & DRM_MODE_FLAG_INTERLACE) {
@@ -459,8 +476,10 @@ static void require_hvs_enabled(struct drm_device *dev)
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_hvs *hvs = vc4->hvs;
 
-	WARN_ON_ONCE((HVS_READ(SCALER_DISPCTRL) & SCALER_DISPCTRL_ENABLE) !=
-		     SCALER_DISPCTRL_ENABLE);
+	if (vc4->gen >= VC4_GEN_6_C)
+		WARN_ON_ONCE(!(HVS_READ(SCALER6_CONTROL) & SCALER6_CONTROL_HVS_EN));
+	else
+		WARN_ON_ONCE(!(HVS_READ(SCALER_DISPCTRL) & SCALER_DISPCTRL_ENABLE));
 }
 
 static int vc4_crtc_disable(struct drm_crtc *crtc,
@@ -789,14 +808,21 @@ static void vc4_crtc_handle_page_flip(struct vc4_crtc *vc4_crtc)
 	struct drm_device *dev = crtc->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_hvs *hvs = vc4->hvs;
+	unsigned int current_dlist;
 	u32 chan = vc4_crtc->current_hvs_channel;
 	unsigned long flags;
 
 	spin_lock_irqsave(&dev->event_lock, flags);
 	spin_lock(&vc4_crtc->irq_lock);
+
+	if (vc4->gen >= VC4_GEN_6_C)
+		current_dlist = VC4_GET_FIELD(HVS_READ(SCALER6_DISPX_DL(chan)),
+					      SCALER6_DISPX_DL_LACT);
+	else
+		current_dlist = HVS_READ(SCALER_DISPLACTX(chan));
+
 	if (vc4_crtc->event &&
-	    (vc4_crtc->current_dlist == HVS_READ(SCALER_DISPLACTX(chan)) ||
-	     vc4_crtc->feeds_txp)) {
+	    (vc4_crtc->current_dlist == current_dlist || vc4_crtc->feeds_txp)) {
 		drm_crtc_send_vblank_event(crtc, vc4_crtc->event);
 		vc4_crtc->event = NULL;
 		drm_crtc_vblank_put(crtc);
@@ -807,7 +833,8 @@ static void vc4_crtc_handle_page_flip(struct vc4_crtc *vc4_crtc)
 		 * the CRTC and encoder already reconfigured, leading to
 		 * underruns. This can be seen when reconfiguring the CRTC.
 		 */
-		vc4_hvs_unmask_underrun(hvs, chan);
+		if (vc4->gen < VC4_GEN_6_C)
+			vc4_hvs_unmask_underrun(hvs, chan);
 	}
 	spin_unlock(&vc4_crtc->irq_lock);
 	spin_unlock_irqrestore(&dev->event_lock, flags);
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 417a5b456d80..94e01ce2b1ef 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -279,6 +279,7 @@ static void vc4_component_unbind_all(void *ptr)
 
 static const struct of_device_id vc4_dma_range_matches[] = {
 	{ .compatible = "brcm,bcm2711-hvs" },
+	{ .compatible = "brcm,bcm2712-hvs" },
 	{ .compatible = "brcm,bcm2835-hvs" },
 	{ .compatible = "brcm,bcm2835-v3d" },
 	{ .compatible = "brcm,cygnus-v3d" },
@@ -307,6 +308,11 @@ static int vc4_drm_bind(struct device *dev)
 	else
 		driver = &vc4_drm_driver;
 
+	if (gen >= VC4_GEN_6_C)
+		dma_set_mask_and_coherent(dev, DMA_BIT_MASK(36));
+	else
+		dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
+
 	node = of_find_matching_node_and_match(NULL, vc4_dma_range_matches,
 					       NULL);
 	if (node) {
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 14b0a7ef2683..aea585bf83eb 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -317,6 +317,21 @@ struct vc4_v3d {
 	struct debugfs_regset32 regset;
 };
 
+#define VC4_NUM_UPM_HANDLES 32
+struct vc4_upm_refcounts {
+	refcount_t refcount;
+
+	/* Allocation size */
+	size_t size;
+	/* Our allocation in UPM for prefetching. */
+	struct drm_mm_node upm;
+
+	/* Pointer back to the HVS structure */
+	struct vc4_hvs *hvs;
+};
+
+#define HVS_NUM_CHANNELS 3
+
 struct vc4_hvs {
 	struct vc4_dev *vc4;
 	struct platform_device *pdev;
@@ -325,6 +340,7 @@ struct vc4_hvs {
 	unsigned int dlist_mem_size;
 
 	struct clk *core_clk;
+	struct clk *disp_clk;
 
 	unsigned long max_core_rate;
 
@@ -332,8 +348,15 @@ struct vc4_hvs {
 	 * list.  Units are dwords.
 	 */
 	struct drm_mm dlist_mm;
+
 	/* Memory manager for the LBM memory used by HVS scaling. */
 	struct drm_mm lbm_mm;
+
+	/* Memory manager for the UPM memory used for prefetching. */
+	struct drm_mm upm_mm;
+	struct ida upm_handles;
+	struct vc4_upm_refcounts upm_refcounts[VC4_NUM_UPM_HANDLES + 1];
+
 	spinlock_t mm_lock;
 
 	struct drm_mm_node mitchell_netravali_filter;
@@ -356,6 +379,7 @@ struct vc4_hvs {
 };
 
 #define HVS_NUM_CHANNELS 3
+#define HVS_UBM_WORD_SIZE 256
 
 struct vc4_hvs_state {
 	struct drm_private_state base;
@@ -425,6 +449,12 @@ struct vc4_plane_state {
 	/* Our allocation in LBM for temporary storage during scaling. */
 	struct drm_mm_node lbm;
 
+	/* The Unified Pre-Fetcher Handle */
+	unsigned int upm_handle[DRM_FORMAT_MAX_PLANES];
+
+	/* Number of lines to pre-fetch */
+	unsigned int upm_buffer_lines;
+
 	/* Set when the plane has per-pixel alpha content or does not cover
 	 * the entire screen. This is a hint to the CRTC that it might need
 	 * to enable background color fill.
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index f8edb0791091..5606ded928e4 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -67,6 +67,80 @@ static const struct debugfs_reg32 vc4_hvs_regs[] = {
 	VC4_REG32(SCALER_OLEDCOEF2),
 };
 
+static const struct debugfs_reg32 vc6_hvs_regs[] = {
+	VC4_REG32(SCALER6_VERSION),
+	VC4_REG32(SCALER6_CXM_SIZE),
+	VC4_REG32(SCALER6_LBM_SIZE),
+	VC4_REG32(SCALER6_UBM_SIZE),
+	VC4_REG32(SCALER6_COBA_SIZE),
+	VC4_REG32(SCALER6_COB_SIZE),
+	VC4_REG32(SCALER6_CONTROL),
+	VC4_REG32(SCALER6_FETCHER_STATUS),
+	VC4_REG32(SCALER6_FETCH_STATUS),
+	VC4_REG32(SCALER6_HANDLE_ERROR),
+	VC4_REG32(SCALER6_DISP0_CTRL0),
+	VC4_REG32(SCALER6_DISP0_CTRL1),
+	VC4_REG32(SCALER6_DISP0_BGND),
+	VC4_REG32(SCALER6_DISP0_LPTRS),
+	VC4_REG32(SCALER6_DISP0_COB),
+	VC4_REG32(SCALER6_DISP0_STATUS),
+	VC4_REG32(SCALER6_DISP0_DL),
+	VC4_REG32(SCALER6_DISP0_RUN),
+	VC4_REG32(SCALER6_DISP1_CTRL0),
+	VC4_REG32(SCALER6_DISP1_CTRL1),
+	VC4_REG32(SCALER6_DISP1_BGND),
+	VC4_REG32(SCALER6_DISP1_LPTRS),
+	VC4_REG32(SCALER6_DISP1_COB),
+	VC4_REG32(SCALER6_DISP1_STATUS),
+	VC4_REG32(SCALER6_DISP1_DL),
+	VC4_REG32(SCALER6_DISP1_RUN),
+	VC4_REG32(SCALER6_DISP2_CTRL0),
+	VC4_REG32(SCALER6_DISP2_CTRL1),
+	VC4_REG32(SCALER6_DISP2_BGND),
+	VC4_REG32(SCALER6_DISP2_LPTRS),
+	VC4_REG32(SCALER6_DISP2_COB),
+	VC4_REG32(SCALER6_DISP2_STATUS),
+	VC4_REG32(SCALER6_DISP2_DL),
+	VC4_REG32(SCALER6_DISP2_RUN),
+	VC4_REG32(SCALER6_EOLN),
+	VC4_REG32(SCALER6_DL_STATUS),
+	VC4_REG32(SCALER6_BFG_MISC),
+	VC4_REG32(SCALER6_QOS0),
+	VC4_REG32(SCALER6_PROF0),
+	VC4_REG32(SCALER6_QOS1),
+	VC4_REG32(SCALER6_PROF1),
+	VC4_REG32(SCALER6_QOS2),
+	VC4_REG32(SCALER6_PROF2),
+	VC4_REG32(SCALER6_PRI_MAP0),
+	VC4_REG32(SCALER6_PRI_MAP1),
+	VC4_REG32(SCALER6_HISTCTRL),
+	VC4_REG32(SCALER6_HISTBIN0),
+	VC4_REG32(SCALER6_HISTBIN1),
+	VC4_REG32(SCALER6_HISTBIN2),
+	VC4_REG32(SCALER6_HISTBIN3),
+	VC4_REG32(SCALER6_HISTBIN4),
+	VC4_REG32(SCALER6_HISTBIN5),
+	VC4_REG32(SCALER6_HISTBIN6),
+	VC4_REG32(SCALER6_HISTBIN7),
+	VC4_REG32(SCALER6_HDR_CFG_REMAP),
+	VC4_REG32(SCALER6_COL_SPACE),
+	VC4_REG32(SCALER6_HVS_ID),
+	VC4_REG32(SCALER6_CFC1),
+	VC4_REG32(SCALER6_DISP_UPM_ISO0),
+	VC4_REG32(SCALER6_DISP_UPM_ISO1),
+	VC4_REG32(SCALER6_DISP_UPM_ISO2),
+	VC4_REG32(SCALER6_DISP_LBM_ISO0),
+	VC4_REG32(SCALER6_DISP_LBM_ISO1),
+	VC4_REG32(SCALER6_DISP_LBM_ISO2),
+	VC4_REG32(SCALER6_DISP_COB_ISO0),
+	VC4_REG32(SCALER6_DISP_COB_ISO1),
+	VC4_REG32(SCALER6_DISP_COB_ISO2),
+	VC4_REG32(SCALER6_BAD_COB),
+	VC4_REG32(SCALER6_BAD_LBM),
+	VC4_REG32(SCALER6_BAD_UPM),
+	VC4_REG32(SCALER6_BAD_AXI),
+};
+
 void vc4_hvs_dump_state(struct vc4_hvs *hvs)
 {
 	struct drm_device *drm = &hvs->vc4->base;
@@ -145,6 +219,76 @@ static int vc4_hvs_debugfs_dlist(struct seq_file *m, void *data)
 	return 0;
 }
 
+static int vc6_hvs_debugfs_dlist(struct seq_file *m, void *data)
+{
+	struct drm_info_node *node = m->private;
+	struct drm_device *dev = node->minor->dev;
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
+	struct vc4_hvs *hvs = vc4->hvs;
+	struct drm_printer p = drm_seq_file_printer(m);
+	unsigned int dlist_mem_size = hvs->dlist_mem_size;
+	unsigned int next_entry_start;
+	unsigned int i;
+
+	for (i = 0; i < SCALER_CHANNELS_COUNT; i++) {
+		unsigned int active_dlist, dispstat;
+		unsigned int j;
+
+		dispstat = VC4_GET_FIELD(HVS_READ(SCALER6_DISPX_STATUS(i)),
+					 SCALER6_DISPX_STATUS_MODE);
+		if (dispstat == SCALER6_DISPX_STATUS_MODE_DISABLED ||
+		    dispstat == SCALER6_DISPX_STATUS_MODE_EOF) {
+			drm_printf(&p, "HVS chan %u disabled\n", i);
+			continue;
+		}
+
+		drm_printf(&p, "HVS chan %u:\n", i);
+
+		active_dlist = VC4_GET_FIELD(HVS_READ(SCALER6_DISPX_DL(i)),
+					     SCALER6_DISPX_DL_LACT);
+		next_entry_start = 0;
+
+		for (j = active_dlist; j < dlist_mem_size; j++) {
+			u32 dlist_word;
+
+			dlist_word = readl((u32 __iomem *)vc4->hvs->dlist + j);
+			drm_printf(&p, "dlist: %02d: 0x%08x\n", j,
+				   dlist_word);
+			if (!next_entry_start ||
+			    next_entry_start == j) {
+				if (dlist_word & SCALER_CTL0_END)
+					break;
+				next_entry_start = j +
+					VC4_GET_FIELD(dlist_word,
+						      SCALER_CTL0_SIZE);
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int vc6_hvs_debugfs_upm_allocs(struct seq_file *m, void *data)
+{
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
+	struct vc4_hvs *hvs = vc4->hvs;
+	struct drm_printer p = drm_seq_file_printer(m);
+	struct vc4_upm_refcounts *refcount;
+	unsigned int i;
+
+	drm_printf(&p, "UPM Handles:\n");
+	for (i = 1; i <= VC4_NUM_UPM_HANDLES; i++) {
+		refcount = &hvs->upm_refcounts[i];
+		drm_printf(&p, "handle %u: refcount %u, size %zu [%08llx + %08llx]\n",
+			   i, refcount_read(&refcount->refcount), refcount->size,
+			   refcount->upm.start, refcount->upm.size);
+	}
+
+	return 0;
+}
+
 /* The filter kernel is composed of dwords each containing 3 9-bit
  * signed integers packed next to each other.
  */
@@ -265,7 +409,8 @@ static void vc4_hvs_update_gamma_lut(struct vc4_hvs *hvs,
 
 u8 vc4_hvs_get_fifo_frame_count(struct vc4_hvs *hvs, unsigned int fifo)
 {
-	struct drm_device *drm = &hvs->vc4->base;
+	struct vc4_dev *vc4 = hvs->vc4;
+	struct drm_device *drm = &vc4->base;
 	u8 field = 0;
 	int idx;
 
@@ -273,6 +418,10 @@ u8 vc4_hvs_get_fifo_frame_count(struct vc4_hvs *hvs, unsigned int fifo)
 		return 0;
 
 	switch (vc4->gen) {
+	case VC4_GEN_6_C:
+		field = VC4_GET_FIELD(HVS_READ(SCALER6_DISPX_STATUS(fifo)),
+				      SCALER6_DISPX_STATUS_FRCNT);
+		break;
 	case VC4_GEN_5:
 		switch (fifo) {
 		case 0:
@@ -375,6 +524,23 @@ int vc4_hvs_get_fifo_from_output(struct vc4_hvs *hvs, unsigned int output)
 			return -EPIPE;
 		}
 
+	case VC4_GEN_6_C:
+		switch (output) {
+		case 0:
+			return 0;
+
+		case 2:
+			return 2;
+
+		case 1:
+		case 3:
+		case 4:
+			return 1;
+
+		default:
+			return -EPIPE;
+		}
+
 	default:
 		return -EPIPE;
 	}
@@ -443,7 +609,41 @@ static int vc4_hvs_init_channel(struct vc4_hvs *hvs, struct drm_crtc *crtc,
 	return 0;
 }
 
-void vc4_hvs_stop_channel(struct vc4_hvs *hvs, unsigned int chan)
+static int vc6_hvs_init_channel(struct vc4_hvs *hvs, struct drm_crtc *crtc,
+				struct drm_display_mode *mode, bool oneshot)
+{
+	struct vc4_dev *vc4 = hvs->vc4;
+	struct drm_device *drm = &vc4->base;
+	struct vc4_crtc_state *vc4_crtc_state = to_vc4_crtc_state(crtc->state);
+	unsigned int chan = vc4_crtc_state->assigned_channel;
+	bool interlace = mode->flags & DRM_MODE_FLAG_INTERLACE;
+	u32 disp_ctrl1;
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return -ENODEV;
+
+	HVS_WRITE(SCALER6_DISPX_CTRL0(chan), SCALER6_DISPX_CTRL0_RESET);
+
+	disp_ctrl1 = HVS_READ(SCALER6_DISPX_CTRL1(chan));
+	disp_ctrl1 &= ~SCALER6_DISPX_CTRL1_INTLACE;
+	HVS_WRITE(SCALER6_DISPX_CTRL1(chan),
+		  disp_ctrl1 | (interlace ? SCALER6_DISPX_CTRL1_INTLACE : 0));
+
+	HVS_WRITE(SCALER6_DISPX_CTRL0(chan),
+		  SCALER6_DISPX_CTRL0_ENB |
+		  VC4_SET_FIELD(mode->hdisplay - 1,
+				SCALER6_DISPX_CTRL0_FWIDTH) |
+		  (oneshot ? SCALER6_DISPX_CTRL0_ONESHOT : 0) |
+		  VC4_SET_FIELD(mode->vdisplay - 1,
+				SCALER6_DISPX_CTRL0_LINES));
+
+	drm_dev_exit(idx);
+
+	return 0;
+}
+
+static void __vc4_hvs_stop_channel(struct vc4_hvs *hvs, unsigned int chan)
 {
 	struct drm_device *drm = &hvs->vc4->base;
 	int idx;
@@ -472,6 +672,42 @@ void vc4_hvs_stop_channel(struct vc4_hvs *hvs, unsigned int chan)
 	drm_dev_exit(idx);
 }
 
+static void __vc6_hvs_stop_channel(struct vc4_hvs *hvs, unsigned int chan)
+{
+	struct vc4_dev *vc4 = hvs->vc4;
+	struct drm_device *drm = &vc4->base;
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return;
+
+	if (!(HVS_READ(SCALER6_DISPX_CTRL0(chan)) & SCALER6_DISPX_CTRL0_ENB))
+		goto out;
+
+	HVS_WRITE(SCALER6_DISPX_CTRL0(chan),
+		  HVS_READ(SCALER6_DISPX_CTRL0(chan)) | SCALER6_DISPX_CTRL0_RESET);
+
+	HVS_WRITE(SCALER6_DISPX_CTRL0(chan),
+		  HVS_READ(SCALER6_DISPX_CTRL0(chan)) & ~SCALER6_DISPX_CTRL0_ENB);
+
+	WARN_ON_ONCE(VC4_GET_FIELD(HVS_READ(SCALER6_DISPX_STATUS(chan)),
+				   SCALER6_DISPX_STATUS_MODE) !=
+		     SCALER6_DISPX_STATUS_MODE_DISABLED);
+
+out:
+	drm_dev_exit(idx);
+}
+
+void vc4_hvs_stop_channel(struct vc4_hvs *hvs, unsigned int chan)
+{
+	struct vc4_dev *vc4 = hvs->vc4;
+
+	if (vc4->gen >= VC4_GEN_6_C)
+		__vc6_hvs_stop_channel(hvs, chan);
+	else
+		__vc4_hvs_stop_channel(hvs, chan);
+}
+
 int vc4_hvs_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
@@ -528,8 +764,13 @@ static void vc4_hvs_install_dlist(struct drm_crtc *crtc)
 	if (!drm_dev_enter(dev, &idx))
 		return;
 
-	HVS_WRITE(SCALER_DISPLISTX(vc4_state->assigned_channel),
-		  vc4_state->mm.start);
+	if (vc4->gen >= VC4_GEN_6_C)
+		HVS_WRITE(SCALER6_DISPX_LPTRS(vc4_state->assigned_channel),
+			  VC4_SET_FIELD(vc4_state->mm.start,
+					SCALER6_DISPX_LPTRS_HEADE));
+	else
+		HVS_WRITE(SCALER_DISPLISTX(vc4_state->assigned_channel),
+			  vc4_state->mm.start);
 
 	drm_dev_exit(idx);
 }
@@ -584,7 +825,11 @@ void vc4_hvs_atomic_enable(struct drm_crtc *crtc,
 
 	vc4_hvs_install_dlist(crtc);
 	vc4_hvs_update_dlist(crtc);
-	vc4_hvs_init_channel(vc4->hvs, crtc, mode, oneshot);
+
+	if (vc4->gen >= VC4_GEN_6_C)
+		vc6_hvs_init_channel(vc4->hvs, crtc, mode, oneshot);
+	else
+		vc4_hvs_init_channel(vc4->hvs, crtc, mode, oneshot);
 }
 
 void vc4_hvs_atomic_disable(struct drm_crtc *crtc,
@@ -668,13 +913,26 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 
 	WARN_ON_ONCE(dlist_next - dlist_start != vc4_state->mm.size);
 
-	if (enable_bg_fill)
+	if (vc4->gen >= VC4_GEN_6_C) {
 		/* This sets a black background color fill, as is the case
 		 * with other DRM drivers.
 		 */
+		if (enable_bg_fill)
+			HVS_WRITE(SCALER6_DISPX_CTRL1(channel),
+				  HVS_READ(SCALER6_DISPX_CTRL1(channel)) |
+				  SCALER6_DISPX_CTRL1_BGENB);
+		else
+			HVS_WRITE(SCALER6_DISPX_CTRL1(channel),
+				  HVS_READ(SCALER6_DISPX_CTRL1(channel)) &
+				  ~SCALER6_DISPX_CTRL1_BGENB);
+	} else {
+		/* we can actually run with a lower core clock when background
+		 * fill is enabled on VC4_GEN_5 so leave it enabled always.
+		 */
 		HVS_WRITE(SCALER_DISPBKGNDX(channel),
 			  HVS_READ(SCALER_DISPBKGNDX(channel)) |
 			  SCALER_DISPBKGND_FILL);
+	}
 
 	/* Only update DISPLIST if the CRTC was already running and is not
 	 * being disabled.
@@ -825,7 +1083,12 @@ int vc4_hvs_debugfs_init(struct drm_minor *minor)
 				    minor->debugfs_root,
 				    &vc4->load_tracker_enabled);
 
-	drm_debugfs_add_file(drm, "hvs_dlists", vc4_hvs_debugfs_dlist, NULL);
+	if (vc4->gen >= VC4_GEN_6_C) {
+		drm_debugfs_add_file(drm, "hvs_dlists", vc6_hvs_debugfs_dlist, NULL);
+		drm_debugfs_add_file(drm, "hvs_upm", vc6_hvs_debugfs_upm_allocs, NULL);
+	} else {
+		drm_debugfs_add_file(drm, "hvs_dlists", vc4_hvs_debugfs_dlist, NULL);
+	}
 
 	drm_debugfs_add_file(drm, "hvs_underrun", vc4_hvs_debugfs_underrun, NULL);
 
@@ -840,6 +1103,10 @@ struct vc4_hvs *__vc4_hvs_alloc(struct vc4_dev *vc4,
 {
 	struct drm_device *drm = &vc4->base;
 	struct vc4_hvs *hvs;
+	unsigned int dlist_start;
+	size_t dlist_size;
+	size_t lbm_size;
+	unsigned int i;
 
 	hvs = drmm_kzalloc(drm, sizeof(*hvs), GFP_KERNEL);
 	if (!hvs)
@@ -851,27 +1118,92 @@ struct vc4_hvs *__vc4_hvs_alloc(struct vc4_dev *vc4,
 
 	spin_lock_init(&hvs->mm_lock);
 
-	/* Set up the HVS display list memory manager.  We never
-	 * overwrite the setup from the bootloader (just 128b out of
-	 * our 16K), since we don't want to scramble the screen when
-	 * transitioning from the firmware's boot setup to runtime.
-	 */
-	hvs->dlist_mem_size = (SCALER_DLIST_SIZE >> 2) - HVS_BOOTLOADER_DLIST_END;
-	drm_mm_init(&hvs->dlist_mm,
-		    HVS_BOOTLOADER_DLIST_END,
-		    hvs->dlist_mem_size);
+	switch (vc4->gen) {
+	case VC4_GEN_4:
+	case VC4_GEN_5:
+		/* Set up the HVS display list memory manager. We never
+		 * overwrite the setup from the bootloader (just 128b
+		 * out of our 16K), since we don't want to scramble the
+		 * screen when transitioning from the firmware's boot
+		 * setup to runtime.
+		 */
+		dlist_start = HVS_BOOTLOADER_DLIST_END;
+		dlist_size = (SCALER_DLIST_SIZE >> 2) - HVS_BOOTLOADER_DLIST_END;
+		break;
+
+	case VC4_GEN_6_C:
+		dlist_start = HVS_BOOTLOADER_DLIST_END;
+
+		/*
+		 * If we are running a test, it means that we can't
+		 * access a register. Use a plausible size then.
+		 */
+		if (!kunit_get_current_test())
+			dlist_size = HVS_READ(SCALER6_CXM_SIZE);
+		else
+			dlist_size = 4096;
+
+		for (i = 0; i < VC4_NUM_UPM_HANDLES; i++) {
+			refcount_set(&hvs->upm_refcounts[i].refcount, 0);
+			hvs->upm_refcounts[i].hvs = hvs;
+		}
+
+		break;
+
+	default:
+		drm_err(drm, "Unknown VC4 generation: %d", vc4->gen);
+		return ERR_PTR(-ENODEV);
+	}
+
+	drm_mm_init(&hvs->dlist_mm, dlist_start, dlist_size);
+
+	hvs->dlist_mem_size = dlist_size;
 
 	/* Set up the HVS LBM memory manager.  We could have some more
 	 * complicated data structure that allowed reuse of LBM areas
 	 * between planes when they don't overlap on the screen, but
 	 * for now we just allocate globally.
 	 */
-	if (vc4->gen == VC4_GEN_4)
+
+	switch (vc4->gen) {
+	case VC4_GEN_4:
 		/* 48k words of 2x12-bit pixels */
-		drm_mm_init(&hvs->lbm_mm, 0, 48 * 1024);
-	else
+		lbm_size = 48 * SZ_1K;
+		break;
+
+	case VC4_GEN_5:
 		/* 60k words of 4x12-bit pixels */
-		drm_mm_init(&hvs->lbm_mm, 0, 60 * 1024);
+		lbm_size = 60 * SZ_1K;
+		break;
+
+	case VC4_GEN_6_C:
+		/*
+		 * If we are running a test, it means that we can't
+		 * access a register. Use a plausible size then.
+		 */
+		lbm_size = 1024;
+		break;
+
+	default:
+		drm_err(drm, "Unknown VC4 generation: %d", vc4->gen);
+		return ERR_PTR(-ENODEV);
+	}
+
+	drm_mm_init(&hvs->lbm_mm, 0, lbm_size);
+
+	if (vc4->gen >= VC4_GEN_6_C) {
+		ida_init(&hvs->upm_handles);
+
+		/*
+		 * NOTE: On BCM2712, the size can also be read through
+		 * the SCALER_UBM_SIZE register. We would need to do a
+		 * register access though, which we can't do with kunit
+		 * that also uses this function to create its mock
+		 * device.
+		 */
+		drm_mm_init(&hvs->upm_mm, 0, 1024 * HVS_UBM_WORD_SIZE);
+	}
+
 
 	vc4->hvs = hvs;
 
@@ -968,10 +1300,124 @@ static int vc4_hvs_hw_init(struct vc4_hvs *hvs)
 	return 0;
 }
 
+#define CFC1_N_NL_CSC_CTRL(x)		(0xa000 + ((x) * 0x3000))
+#define CFC1_N_MA_CSC_COEFF_C00(x)	(0xa008 + ((x) * 0x3000))
+#define CFC1_N_MA_CSC_COEFF_C01(x)	(0xa00c + ((x) * 0x3000))
+#define CFC1_N_MA_CSC_COEFF_C02(x)	(0xa010 + ((x) * 0x3000))
+#define CFC1_N_MA_CSC_COEFF_C03(x)	(0xa014 + ((x) * 0x3000))
+#define CFC1_N_MA_CSC_COEFF_C04(x)	(0xa018 + ((x) * 0x3000))
+#define CFC1_N_MA_CSC_COEFF_C10(x)	(0xa01c + ((x) * 0x3000))
+#define CFC1_N_MA_CSC_COEFF_C11(x)	(0xa020 + ((x) * 0x3000))
+#define CFC1_N_MA_CSC_COEFF_C12(x)	(0xa024 + ((x) * 0x3000))
+#define CFC1_N_MA_CSC_COEFF_C13(x)	(0xa028 + ((x) * 0x3000))
+#define CFC1_N_MA_CSC_COEFF_C14(x)	(0xa02c + ((x) * 0x3000))
+#define CFC1_N_MA_CSC_COEFF_C20(x)	(0xa030 + ((x) * 0x3000))
+#define CFC1_N_MA_CSC_COEFF_C21(x)	(0xa034 + ((x) * 0x3000))
+#define CFC1_N_MA_CSC_COEFF_C22(x)	(0xa038 + ((x) * 0x3000))
+#define CFC1_N_MA_CSC_COEFF_C23(x)	(0xa03c + ((x) * 0x3000))
+#define CFC1_N_MA_CSC_COEFF_C24(x)	(0xa040 + ((x) * 0x3000))
+
+/* 4 S2.22 multiplication factors, and 1 S9.15 addititive element for each of 3
+ * output components
+ */
+struct vc6_csc_coeff_entry {
+	u32 csc[3][5];
+};
+
+static const struct vc6_csc_coeff_entry csc_coeffs[2][3] = {
+	[DRM_COLOR_YCBCR_LIMITED_RANGE] = {
+		[DRM_COLOR_YCBCR_BT601] = {
+			.csc = {
+				{ 0x004A8542, 0x0, 0x0066254A, 0x0, 0xFF908A0D },
+				{ 0x004A8542, 0xFFE6ED5D, 0xFFCBF856, 0x0, 0x0043C9A3 },
+				{ 0x004A8542, 0x00811A54, 0x0, 0x0, 0xFF759502 }
+			}
+		},
+		[DRM_COLOR_YCBCR_BT709] = {
+			.csc = {
+				{ 0x004A8542, 0x0, 0x0072BC44, 0x0, 0xFF83F312 },
+				{ 0x004A8542, 0xFFF25A22, 0xFFDDE4D0, 0x0, 0x00267064 },
+				{ 0x004A8542, 0x00873197, 0x0, 0x0, 0xFF6F7DC0 }
+			}
+		},
+		[DRM_COLOR_YCBCR_BT2020] = {
+			.csc = {
+				{ 0x004A8542, 0x0, 0x006B4A17, 0x0, 0xFF8B653F },
+				{ 0x004A8542, 0xFFF402D9, 0xFFDDE4D0, 0x0, 0x0024C7AE },
+				{ 0x004A8542, 0x008912CC, 0x0, 0x0, 0xFF6D9C8B }
+			}
+		}
+	},
+	[DRM_COLOR_YCBCR_FULL_RANGE] = {
+		[DRM_COLOR_YCBCR_BT601] = {
+			.csc = {
+				{ 0x00400000, 0x0, 0x0059BA5E, 0x0, 0xFFA645A1 },
+				{ 0x00400000, 0xFFE9F9AC, 0xFFD24B97, 0x0, 0x0043BABB },
+				{ 0x00400000, 0x00716872, 0x0, 0x0, 0xFF8E978D }
+			}
+		},
+		[DRM_COLOR_YCBCR_BT709] = {
+			.csc = {
+				{ 0x00400000, 0x0, 0x0064C985, 0x0, 0xFF9B367A },
+				{ 0x00400000, 0xFFF402E1, 0xFFE20A40, 0x0, 0x0029F2DE },
+				{ 0x00400000, 0x0076C226, 0x0, 0x0, 0xFF893DD9 }
+			}
+		},
+		[DRM_COLOR_YCBCR_BT2020] = {
+			.csc = {
+				{ 0x00400000, 0x0, 0x005E3F14, 0x0, 0xFFA1C0EB },
+				{ 0x00400000, 0xFFF577F6, 0xFFDB580F, 0x0, 0x002F2FFA },
+				{ 0x00400000, 0x007868DB, 0x0, 0x0, 0xFF879724 }
+			}
+		}
+	}
+};
+
+static int vc6_hvs_hw_init(struct vc4_hvs *hvs)
+{
+	const struct vc6_csc_coeff_entry *coeffs;
+	unsigned int i;
+
+	HVS_WRITE(SCALER6_CONTROL,
+		  SCALER6_CONTROL_HVS_EN |
+		  VC4_SET_FIELD(8, SCALER6_CONTROL_PF_LINES) |
+		  VC4_SET_FIELD(15, SCALER6_CONTROL_MAX_REQS));
+
+	/* Set HVS arbiter priority to max */
+	HVS_WRITE(SCALER6_PRI_MAP0, 0xffffffff);
+	HVS_WRITE(SCALER6_PRI_MAP1, 0xffffffff);
+
+	for (i = 0; i < 6; i++) {
+		coeffs = &csc_coeffs[i / 3][i % 3];
+
+		HVS_WRITE(CFC1_N_MA_CSC_COEFF_C00(i), coeffs->csc[0][0]);
+		HVS_WRITE(CFC1_N_MA_CSC_COEFF_C01(i), coeffs->csc[0][1]);
+		HVS_WRITE(CFC1_N_MA_CSC_COEFF_C02(i), coeffs->csc[0][2]);
+		HVS_WRITE(CFC1_N_MA_CSC_COEFF_C03(i), coeffs->csc[0][3]);
+		HVS_WRITE(CFC1_N_MA_CSC_COEFF_C04(i), coeffs->csc[0][4]);
+
+		HVS_WRITE(CFC1_N_MA_CSC_COEFF_C10(i), coeffs->csc[1][0]);
+		HVS_WRITE(CFC1_N_MA_CSC_COEFF_C11(i), coeffs->csc[1][1]);
+		HVS_WRITE(CFC1_N_MA_CSC_COEFF_C12(i), coeffs->csc[1][2]);
+		HVS_WRITE(CFC1_N_MA_CSC_COEFF_C13(i), coeffs->csc[1][3]);
+		HVS_WRITE(CFC1_N_MA_CSC_COEFF_C14(i), coeffs->csc[1][4]);
+
+		HVS_WRITE(CFC1_N_MA_CSC_COEFF_C20(i), coeffs->csc[2][0]);
+		HVS_WRITE(CFC1_N_MA_CSC_COEFF_C21(i), coeffs->csc[2][1]);
+		HVS_WRITE(CFC1_N_MA_CSC_COEFF_C22(i), coeffs->csc[2][2]);
+		HVS_WRITE(CFC1_N_MA_CSC_COEFF_C23(i), coeffs->csc[2][3]);
+		HVS_WRITE(CFC1_N_MA_CSC_COEFF_C24(i), coeffs->csc[2][4]);
+
+		HVS_WRITE(CFC1_N_NL_CSC_CTRL(i), BIT(15));
+	}
+
+	return 0;
+}
+
 static int vc4_hvs_cob_init(struct vc4_hvs *hvs)
 {
 	struct vc4_dev *vc4 = hvs->vc4;
-	u32 reg, top;
+	u32 reg, top, base;
 
 	/*
 	 * Recompute Composite Output Buffer (COB) allocations for the
@@ -1032,6 +1478,31 @@ static int vc4_hvs_cob_init(struct vc4_hvs *hvs)
 		HVS_WRITE(SCALER_DISPBASE0, reg);
 		break;
 
+	case VC4_GEN_6_C:
+		#define VC6_COB_LINE_WIDTH	3840
+		#define VC6_COB_NUM_LINES	4
+		reg = 0;
+		top = 3840;
+
+		HVS_WRITE(SCALER6_DISP2_COB,
+			  VC4_SET_FIELD(top, SCALER6_DISPX_COB_TOP) |
+			  VC4_SET_FIELD(base, SCALER6_DISPX_COB_BASE));
+
+		base = top + 16;
+		top += VC6_COB_LINE_WIDTH * VC6_COB_NUM_LINES;
+
+		HVS_WRITE(SCALER6_DISP1_COB,
+			  VC4_SET_FIELD(top, SCALER6_DISPX_COB_TOP) |
+			  VC4_SET_FIELD(base, SCALER6_DISPX_COB_BASE));
+
+		base = top + 16;
+		top += VC6_COB_LINE_WIDTH * VC6_COB_NUM_LINES;
+
+		HVS_WRITE(SCALER6_DISP0_COB,
+			  VC4_SET_FIELD(top, SCALER6_DISPX_COB_TOP) |
+			  VC4_SET_FIELD(base, SCALER6_DISPX_COB_BASE));
+		break;
+
 	default:
 		return -EINVAL;
 	}
@@ -1057,10 +1528,16 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 		return PTR_ERR(hvs);
 
 	hvs->regset.base = hvs->regs;
-	hvs->regset.regs = vc4_hvs_regs;
-	hvs->regset.nregs = ARRAY_SIZE(vc4_hvs_regs);
 
-	if (vc4->gen == VC4_GEN_5) {
+	if (vc4->gen >= VC4_GEN_6_C) {
+		hvs->regset.regs = vc6_hvs_regs;
+		hvs->regset.nregs = ARRAY_SIZE(vc6_hvs_regs);
+	} else {
+		hvs->regset.regs = vc4_hvs_regs;
+		hvs->regset.nregs = ARRAY_SIZE(vc4_hvs_regs);
+	}
+
+	if (vc4->gen >= VC4_GEN_5) {
 		struct rpi_firmware *firmware;
 		struct device_node *node;
 		unsigned int max_rate;
@@ -1074,12 +1551,20 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 		if (!firmware)
 			return -EPROBE_DEFER;
 
-		hvs->core_clk = devm_clk_get(&pdev->dev, NULL);
+		hvs->core_clk = devm_clk_get(&pdev->dev,
+					     (vc4->gen >= VC4_GEN_6_C) ? "core" : NULL);
 		if (IS_ERR(hvs->core_clk)) {
 			dev_err(&pdev->dev, "Couldn't get core clock\n");
 			return PTR_ERR(hvs->core_clk);
 		}
 
+		hvs->disp_clk = devm_clk_get(&pdev->dev,
+					     (vc4->gen >= VC4_GEN_6_C) ? "disp" : NULL);
+		if (IS_ERR(hvs->disp_clk)) {
+			dev_err(&pdev->dev, "Couldn't get disp clock\n");
+			return PTR_ERR(hvs->disp_clk);
+		}
+
 		max_rate = rpi_firmware_clk_get_max_rate(firmware,
 							 RPI_FIRMWARE_CORE_CLK_ID);
 		rpi_firmware_put(firmware);
@@ -1096,14 +1581,23 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 			dev_err(&pdev->dev, "Couldn't enable the core clock\n");
 			return ret;
 		}
+
+		ret = clk_prepare_enable(hvs->disp_clk);
+		if (ret) {
+			dev_err(&pdev->dev, "Couldn't enable the disp clock\n");
+			return ret;
+		}
 	}
 
-	if (vc4->gen == VC4_GEN_4)
-		hvs->dlist = hvs->regs + SCALER_DLIST_START;
-	else
+	if (vc4->gen >= VC4_GEN_5)
 		hvs->dlist = hvs->regs + SCALER5_DLIST_START;
+	else
+		hvs->dlist = hvs->regs + SCALER_DLIST_START;
 
-	ret = vc4_hvs_hw_init(hvs);
+	if (vc4->gen >= VC4_GEN_6_C)
+		ret = vc6_hvs_hw_init(hvs);
+	else
+		ret = vc4_hvs_hw_init(hvs);
 	if (ret)
 		return ret;
 
@@ -1120,10 +1614,12 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	ret = devm_request_irq(dev, platform_get_irq(pdev, 0),
-			       vc4_hvs_irq_handler, 0, "vc4 hvs", drm);
-	if (ret)
-		return ret;
+	if (vc4->gen < VC4_GEN_6_C) {
+		ret = devm_request_irq(dev, platform_get_irq(pdev, 0),
+				       vc4_hvs_irq_handler, 0, "vc4 hvs", drm);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
@@ -1148,6 +1644,7 @@ static void vc4_hvs_unbind(struct device *dev, struct device *master,
 		drm_mm_remove_node(node);
 	drm_mm_takedown(&vc4->hvs->lbm_mm);
 
+	clk_disable_unprepare(hvs->disp_clk);
 	clk_disable_unprepare(hvs->core_clk);
 
 	vc4->hvs = NULL;
@@ -1170,6 +1667,7 @@ static void vc4_hvs_dev_remove(struct platform_device *pdev)
 
 static const struct of_device_id vc4_hvs_dt_match[] = {
 	{ .compatible = "brcm,bcm2711-hvs" },
+	{ .compatible = "brcm,bcm2712-hvs" },
 	{ .compatible = "brcm,bcm2835-hvs" },
 	{}
 };
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 58bbb9efc2df..a5cd9da5d6a6 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -320,17 +320,59 @@ static void vc5_hvs_pv_muxing_commit(struct vc4_dev *vc4,
 	}
 }
 
+static void vc6_hvs_pv_muxing_commit(struct vc4_dev *vc4,
+				     struct drm_atomic_state *state)
+{
+	struct vc4_hvs *hvs = vc4->hvs;
+	struct drm_crtc_state *crtc_state;
+	struct drm_crtc *crtc;
+	unsigned int i;
+
+	WARN_ON_ONCE(vc4->gen != VC4_GEN_6_C);
+
+	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
+		struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc_state);
+		struct vc4_encoder *vc4_encoder;
+		struct drm_encoder *encoder;
+		unsigned char mux;
+		u32 reg;
+
+		if (!vc4_state->update_muxing)
+			continue;
+
+		if (vc4_state->assigned_channel != 1)
+			continue;
+
+		encoder = vc4_get_crtc_encoder(crtc, crtc_state);
+		vc4_encoder = to_vc4_encoder(encoder);
+		switch (vc4_encoder->type) {
+		case VC4_ENCODER_TYPE_HDMI1:
+			mux = 0;
+			break;
+
+		case VC4_ENCODER_TYPE_TXP:
+			mux = 2;
+			break;
+
+		default:
+			break;
+		}
+
+		reg = HVS_READ(SCALER6_CONTROL);
+		HVS_WRITE(SCALER6_CONTROL,
+			  (reg & ~SCALER6_CONTROL_DSP1_TARGET_MASK) |
+			  VC4_SET_FIELD(mux, SCALER6_CONTROL_DSP1_TARGET));
+	}
+}
+
 static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 {
 	struct drm_device *dev = state->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_hvs *hvs = vc4->hvs;
-	struct drm_crtc_state *new_crtc_state;
 	struct vc4_hvs_state *new_hvs_state;
-	struct drm_crtc *crtc;
 	struct vc4_hvs_state *old_hvs_state;
 	unsigned int channel;
-	int i;
 
 	old_hvs_state = vc4_hvs_get_old_global_state(state);
 	if (WARN_ON(IS_ERR(old_hvs_state)))
@@ -340,14 +382,20 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 	if (WARN_ON(IS_ERR(new_hvs_state)))
 		return;
 
-	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
-		struct vc4_crtc_state *vc4_crtc_state;
+	if (vc4->gen < VC4_GEN_6_C) {
+		struct drm_crtc_state *new_crtc_state;
+		struct drm_crtc *crtc;
+		int i;
 
-		if (!new_crtc_state->commit)
-			continue;
+		for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
+			struct vc4_crtc_state *vc4_crtc_state;
 
-		vc4_crtc_state = to_vc4_crtc_state(new_crtc_state);
-		vc4_hvs_mask_underrun(hvs, vc4_crtc_state->assigned_channel);
+			if (!new_crtc_state->commit)
+				continue;
+
+			vc4_crtc_state = to_vc4_crtc_state(new_crtc_state);
+			vc4_hvs_mask_underrun(hvs, vc4_crtc_state->assigned_channel);
+		}
 	}
 
 	for (channel = 0; channel < HVS_NUM_CHANNELS; channel++) {
@@ -382,16 +430,31 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 		 * modeset.
 		 */
 		WARN_ON(clk_set_min_rate(hvs->core_clk, core_rate));
+		WARN_ON(clk_set_min_rate(hvs->disp_clk, core_rate));
 	}
 
 	drm_atomic_helper_commit_modeset_disables(dev, state);
 
-	vc4_ctm_commit(vc4, state);
+	if (vc4->gen <= VC4_GEN_5)
+		vc4_ctm_commit(vc4, state);
 
-	if (vc4->gen == VC4_GEN_5)
-		vc5_hvs_pv_muxing_commit(vc4, state);
-	else
+	switch (vc4->gen) {
+	case VC4_GEN_4:
 		vc4_hvs_pv_muxing_commit(vc4, state);
+		break;
+
+	case VC4_GEN_5:
+		vc5_hvs_pv_muxing_commit(vc4, state);
+		break;
+
+	case VC4_GEN_6_C:
+		vc6_hvs_pv_muxing_commit(vc4, state);
+		break;
+
+	default:
+		drm_err(dev, "Unknown VC4 generation: %d", vc4->gen);
+		break;
+	}
 
 	drm_atomic_helper_commit_planes(dev, state,
 					DRM_PLANE_COMMIT_ACTIVE_ONLY);
@@ -418,6 +481,7 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 		 * requirements.
 		 */
 		WARN_ON(clk_set_min_rate(hvs->core_clk, core_rate));
+		WARN_ON(clk_set_min_rate(hvs->disp_clk, core_rate));
 
 		drm_dbg(dev, "Core clock actual rate: %lu Hz\n",
 			clk_get_rate(hvs->core_clk));
@@ -1056,7 +1120,10 @@ int vc4_kms_load(struct drm_device *dev)
 		return ret;
 	}
 
-	if (vc4->gen == VC4_GEN_5) {
+	if (vc4->gen >= VC4_GEN_6_C) {
+		dev->mode_config.max_width = 8192;
+		dev->mode_config.max_height = 8192;
+	} else if (vc4->gen >= VC4_GEN_5) {
 		dev->mode_config.max_width = 7680;
 		dev->mode_config.max_height = 7680;
 	} else {
diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index ba6e86d62a77..5749287f6e3c 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -278,7 +278,10 @@ static bool plane_enabled(struct drm_plane_state *state)
 
 static struct drm_plane_state *vc4_plane_duplicate_state(struct drm_plane *plane)
 {
+	struct vc4_dev *vc4 = to_vc4_dev(plane->dev);
+	struct vc4_hvs *hvs = vc4->hvs;
 	struct vc4_plane_state *vc4_state;
+	unsigned int i;
 
 	if (WARN_ON(!plane->state))
 		return NULL;
@@ -288,6 +291,12 @@ static struct drm_plane_state *vc4_plane_duplicate_state(struct drm_plane *plane
 		return NULL;
 
 	memset(&vc4_state->lbm, 0, sizeof(vc4_state->lbm));
+
+	for (i = 0; i < DRM_FORMAT_MAX_PLANES; i++) {
+		if (vc4_state->upm_handle[i])
+			refcount_inc(&hvs->upm_refcounts[vc4_state->upm_handle[i]].refcount);
+	}
+
 	vc4_state->dlist_initialized = 0;
 
 	__drm_atomic_helper_plane_duplicate_state(plane, &vc4_state->base);
@@ -306,18 +315,47 @@ static struct drm_plane_state *vc4_plane_duplicate_state(struct drm_plane *plane
 	return &vc4_state->base;
 }
 
+static void vc4_plane_release_upm_ida(struct vc4_hvs *hvs, unsigned int upm_handle)
+{
+	struct vc4_upm_refcounts *refcount = &hvs->upm_refcounts[upm_handle];
+	unsigned long irqflags;
+
+	spin_lock_irqsave(&hvs->mm_lock, irqflags);
+	drm_mm_remove_node(&refcount->upm);
+	spin_unlock_irqrestore(&hvs->mm_lock, irqflags);
+	refcount->upm.start = 0;
+	refcount->upm.size = 0;
+	refcount->size = 0;
+
+	ida_free(&hvs->upm_handles, upm_handle);
+}
+
 static void vc4_plane_destroy_state(struct drm_plane *plane,
 				    struct drm_plane_state *state)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(plane->dev);
+	struct vc4_hvs *hvs = vc4->hvs;
 	struct vc4_plane_state *vc4_state = to_vc4_plane_state(state);
+	unsigned int i;
 
 	if (drm_mm_node_allocated(&vc4_state->lbm)) {
 		unsigned long irqflags;
 
-		spin_lock_irqsave(&vc4->hvs->mm_lock, irqflags);
+		spin_lock_irqsave(&hvs->mm_lock, irqflags);
 		drm_mm_remove_node(&vc4_state->lbm);
-		spin_unlock_irqrestore(&vc4->hvs->mm_lock, irqflags);
+		spin_unlock_irqrestore(&hvs->mm_lock, irqflags);
+	}
+
+	for (i = 0; i < DRM_FORMAT_MAX_PLANES; i++) {
+		struct vc4_upm_refcounts *refcount;
+
+		if (!vc4_state->upm_handle[i])
+			continue;
+
+		refcount = &hvs->upm_refcounts[vc4_state->upm_handle[i]];
+
+		if (refcount_dec_and_test(&refcount->refcount))
+			vc4_plane_release_upm_ida(hvs, vc4_state->upm_handle[i]);
 	}
 
 	kfree(vc4_state->dlist);
@@ -538,6 +576,11 @@ static void vc4_write_tpz(struct vc4_plane_state *vc4_state, u32 src, u32 dst)
 	recip = ~0 / scale;
 
 	vc4_dlist_write(vc4_state,
+			/*
+			 * The BCM2712 is lacking BIT(31) compared to
+			 * the previous generations, but we don't use
+			 * it.
+			 */
 			VC4_SET_FIELD(scale, SCALER_TPZ0_SCALE) |
 			VC4_SET_FIELD(0, SCALER_TPZ0_IPHASE));
 	vc4_dlist_write(vc4_state,
@@ -598,10 +641,15 @@ static void vc4_write_ppf(struct vc4_plane_state *vc4_state, u32 src, u32 dst,
 	vc4_dlist_write(vc4_state,
 			SCALER_PPF_AGC |
 			VC4_SET_FIELD(scale, SCALER_PPF_SCALE) |
+			/*
+			 * The register layout documentation is slightly
+			 * different to setup the phase in the BCM2712,
+			 * but they seem equivalent.
+			 */
 			VC4_SET_FIELD(phase, SCALER_PPF_IPHASE));
 }
 
-static u32 vc4_lbm_size(struct drm_plane_state *state)
+static u32 __vc4_lbm_size(struct drm_plane_state *state)
 {
 	struct vc4_plane_state *vc4_state = to_vc4_plane_state(state);
 	struct vc4_dev *vc4 = to_vc4_dev(state->plane->dev);
@@ -649,6 +697,131 @@ static u32 vc4_lbm_size(struct drm_plane_state *state)
 	return lbm;
 }
 
+static unsigned int vc4_lbm_words_per_component(const struct drm_plane_state *state,
+						unsigned int channel)
+{
+	const struct vc4_plane_state *vc4_state = to_vc4_plane_state(state);
+
+	switch (vc4_state->y_scaling[channel]) {
+	case VC4_SCALING_PPF:
+		return 4;
+
+	case VC4_SCALING_TPZ:
+		return 2;
+
+	default:
+		return 0;
+	}
+}
+
+static unsigned int vc4_lbm_components(const struct drm_plane_state *state,
+				       unsigned int channel)
+{
+	const struct drm_format_info *info = state->fb->format;
+	const struct vc4_plane_state *vc4_state = to_vc4_plane_state(state);
+
+	if (vc4_state->y_scaling[channel] == VC4_SCALING_NONE)
+		return 0;
+
+	if (info->is_yuv)
+		return channel ? 2 : 1;
+
+	if (info->has_alpha)
+		return 4;
+
+	return 3;
+}
+
+static unsigned int vc4_lbm_channel_size(const struct drm_plane_state *state,
+					 unsigned int channel)
+{
+	const struct drm_format_info *info = state->fb->format;
+	const struct vc4_plane_state *vc4_state = to_vc4_plane_state(state);
+	unsigned int channels_scaled = 0;
+	unsigned int components, words, wpc;
+	unsigned int width, lines;
+	unsigned int i;
+
+	/* LBM is meant to use the smaller of source or dest width, but there
+	 * is a issue with UV scaling that the size required for the second
+	 * channel is based on the source width only.
+	 */
+	if (info->hsub > 1 && channel == 1)
+		width = state->src_w >> 16;
+	else
+		width = min(state->src_w >> 16, state->crtc_w);
+	width = round_up(width / info->hsub, 4);
+
+	wpc = vc4_lbm_words_per_component(state, channel);
+	if (!wpc)
+		return 0;
+
+	components = vc4_lbm_components(state, channel);
+	if (!components)
+		return 0;
+
+	if (state->alpha != DRM_BLEND_ALPHA_OPAQUE && info->has_alpha)
+		components -= 1;
+
+	words = width * wpc * components;
+
+	lines = DIV_ROUND_UP(words, 128 / info->hsub);
+
+	for (i = 0; i < 2; i++)
+		if (vc4_state->y_scaling[channel] != VC4_SCALING_NONE)
+			channels_scaled++;
+
+	if (channels_scaled == 1)
+		lines = lines / 2;
+
+	return lines;
+}
+
+static unsigned int __vc6_lbm_size(const struct drm_plane_state *state)
+{
+	const struct drm_format_info *info = state->fb->format;
+
+	if (info->hsub > 1)
+		return max(vc4_lbm_channel_size(state, 0),
+			   vc4_lbm_channel_size(state, 1));
+	else
+		return vc4_lbm_channel_size(state, 0);
+}
+
+static u32 vc4_lbm_size(struct drm_plane_state *state)
+{
+	struct vc4_plane_state *vc4_state = to_vc4_plane_state(state);
+	struct vc4_dev *vc4 = to_vc4_dev(state->plane->dev);
+
+	/* LBM is not needed when there's no vertical scaling. */
+	if (vc4_state->y_scaling[0] == VC4_SCALING_NONE &&
+	    vc4_state->y_scaling[1] == VC4_SCALING_NONE)
+		return 0;
+
+	if (vc4->gen >= VC4_GEN_6_C)
+		return __vc6_lbm_size(state);
+	else
+		return __vc4_lbm_size(state);
+}
+
+static size_t vc6_upm_size(const struct drm_plane_state *state,
+			   unsigned int plane)
+{
+	const struct vc4_plane_state *vc4_state = to_vc4_plane_state(state);
+	unsigned int stride = state->fb->pitches[plane];
+
+	/*
+	 * TODO: This only works for raster formats, and is sub-optimal
+	 * for buffers with a stride aligned on 32 bytes.
+	 */
+	unsigned int words_per_line = (stride + 62) / 32;
+	unsigned int fetch_region_size = words_per_line * 32;
+	unsigned int buffer_lines = 2 << vc4_state->upm_buffer_lines;
+	unsigned int buffer_size = fetch_region_size * buffer_lines;
+
+	return ALIGN(buffer_size, HVS_UBM_WORD_SIZE);
+}
+
 static void vc4_write_scaling_parameters(struct drm_plane_state *state,
 					 int channel)
 {
@@ -750,6 +923,10 @@ static int vc4_plane_allocate_lbm(struct drm_plane_state *state)
 	if (!lbm_size)
 		return 0;
 
+	/*
+	 * NOTE: BCM2712 doesn't need to be aligned, since the size
+	 * returned by vc4_lbm_size() is in words already.
+	 */
 	if (vc4->gen == VC4_GEN_5)
 		lbm_size = ALIGN(lbm_size, 64);
 	else if (vc4->gen == VC4_GEN_4)
@@ -787,6 +964,108 @@ static int vc4_plane_allocate_lbm(struct drm_plane_state *state)
 	return 0;
 }
 
+static int vc6_plane_allocate_upm(struct drm_plane_state *state)
+{
+	const struct drm_format_info *info = state->fb->format;
+	struct drm_device *drm = state->plane->dev;
+	struct vc4_dev *vc4 = to_vc4_dev(drm);
+	struct vc4_hvs *hvs = vc4->hvs;
+	struct vc4_plane_state *vc4_state = to_vc4_plane_state(state);
+	unsigned int i;
+	int ret;
+
+	WARN_ON_ONCE(vc4->gen < VC4_GEN_6_C);
+
+	vc4_state->upm_buffer_lines = SCALER6_PTR0_UPM_BUFF_SIZE_2_LINES;
+
+	for (i = 0; i < info->num_planes; i++) {
+		struct vc4_upm_refcounts *refcount;
+		int upm_handle;
+		unsigned long irqflags;
+		size_t upm_size;
+
+		upm_size = vc6_upm_size(state, i);
+		if (!upm_size)
+			return -EINVAL;
+		upm_handle = vc4_state->upm_handle[i];
+
+		if (upm_handle &&
+		    hvs->upm_refcounts[upm_handle].size == upm_size) {
+			/* Allocation is the same size as the previous user of
+			 * the plane. Keep the allocation.
+			 */
+			vc4_state->upm_handle[i] = upm_handle;
+		} else {
+			if (upm_handle &&
+			    refcount_dec_and_test(&hvs->upm_refcounts[upm_handle].refcount)) {
+				vc4_plane_release_upm_ida(hvs, upm_handle);
+				vc4_state->upm_handle[i] = 0;
+			}
+
+			upm_handle = ida_alloc_range(&hvs->upm_handles, 1,
+						     VC4_NUM_UPM_HANDLES,
+						     GFP_KERNEL);
+			if (upm_handle < 0) {
+				drm_dbg(drm, "Out of upm_handles\n");
+				return upm_handle;
+			}
+			vc4_state->upm_handle[i] = upm_handle;
+
+			refcount = &hvs->upm_refcounts[upm_handle];
+			refcount_set(&refcount->refcount, 1);
+			refcount->size = upm_size;
+
+			spin_lock_irqsave(&hvs->mm_lock, irqflags);
+			ret = drm_mm_insert_node_generic(&hvs->upm_mm,
+							 &refcount->upm,
+							 upm_size, HVS_UBM_WORD_SIZE,
+							 0, 0);
+			spin_unlock_irqrestore(&hvs->mm_lock, irqflags);
+			if (ret) {
+				drm_err(drm, "Failed to allocate UPM entry: %d\n", ret);
+				refcount_set(&refcount->refcount, 0);
+				ida_free(&hvs->upm_handles, upm_handle);
+				vc4_state->upm_handle[i] = 0;
+				return ret;
+			}
+		}
+
+		refcount = &hvs->upm_refcounts[upm_handle];
+		vc4_state->dlist[vc4_state->ptr0_offset[i]] |=
+			VC4_SET_FIELD(refcount->upm.start / HVS_UBM_WORD_SIZE,
+				      SCALER6_PTR0_UPM_BASE) |
+			VC4_SET_FIELD(vc4_state->upm_handle[i] - 1,
+				      SCALER6_PTR0_UPM_HANDLE) |
+			VC4_SET_FIELD(vc4_state->upm_buffer_lines,
+				      SCALER6_PTR0_UPM_BUFF_SIZE);
+	}
+
+	return 0;
+}
+
+static void vc6_plane_free_upm(struct drm_plane_state *state)
+{
+	struct vc4_plane_state *vc4_state = to_vc4_plane_state(state);
+	struct drm_device *drm = state->plane->dev;
+	struct vc4_dev *vc4 = to_vc4_dev(drm);
+	struct vc4_hvs *hvs = vc4->hvs;
+	unsigned int i;
+
+	WARN_ON_ONCE(vc4->gen < VC4_GEN_6_C);
+
+	for (i = 0; i < DRM_FORMAT_MAX_PLANES; i++) {
+		unsigned int upm_handle;
+
+		upm_handle = vc4_state->upm_handle[i];
+		if (!upm_handle)
+			continue;
+
+		if (refcount_dec_and_test(&hvs->upm_refcounts[upm_handle].refcount))
+			vc4_plane_release_upm_ida(hvs, upm_handle);
+		vc4_state->upm_handle[i] = 0;
+	}
+}
+
 /*
  * The colorspace conversion matrices are held in 3 entries in the dlist.
  * Create an array of them, with entries for each full and limited mode, and
@@ -1363,6 +1642,412 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 	return 0;
 }
 
+static u32 vc6_plane_get_csc_mode(struct vc4_plane_state *vc4_state)
+{
+	struct drm_plane_state *state = &vc4_state->base;
+	u32 ret = 0;
+
+	if (vc4_state->is_yuv) {
+		enum drm_color_encoding color_encoding = state->color_encoding;
+		enum drm_color_range color_range = state->color_range;
+
+		ret |= SCALER6_CTL2_CSC_ENABLE;
+
+		/* CSC pre-loaded with:
+		 * 0 = BT601 limited range
+		 * 1 = BT709 limited range
+		 * 2 = BT2020 limited range
+		 * 3 = BT601 full range
+		 * 4 = BT709 full range
+		 * 5 = BT2020 full range
+		 */
+		if (color_encoding > DRM_COLOR_YCBCR_BT2020)
+			color_encoding = DRM_COLOR_YCBCR_BT601;
+		if (color_range > DRM_COLOR_YCBCR_FULL_RANGE)
+			color_range = DRM_COLOR_YCBCR_LIMITED_RANGE;
+
+		ret |= VC4_SET_FIELD(color_encoding + (color_range * 3),
+				     SCALER6_CTL2_BRCM_CFC_CONTROL);
+	}
+
+	return ret;
+}
+
+static int vc6_plane_mode_set(struct drm_plane *plane,
+			      struct drm_plane_state *state)
+{
+	struct drm_device *drm = plane->dev;
+	struct vc4_dev *vc4 = to_vc4_dev(drm);
+	struct vc4_plane_state *vc4_state = to_vc4_plane_state(state);
+	struct drm_framebuffer *fb = state->fb;
+	const struct hvs_format *format = vc4_get_hvs_format(fb->format->format);
+	u64 base_format_mod = fourcc_mod_broadcom_mod(fb->modifier);
+	int num_planes = fb->format->num_planes;
+	u32 h_subsample = fb->format->hsub;
+	u32 v_subsample = fb->format->vsub;
+	bool mix_plane_alpha;
+	bool covers_screen;
+	u32 scl0, scl1, pitch0;
+	u32 tiling, src_x, src_y;
+	u32 width, height;
+	u32 hvs_format = format->hvs;
+	u32 offsets[3] = { 0 };
+	unsigned int rotation;
+	int ret, i;
+
+	if (vc4_state->dlist_initialized)
+		return 0;
+
+	ret = vc4_plane_setup_clipping_and_scaling(state);
+	if (ret)
+		return ret;
+
+	width = vc4_state->src_w[0] >> 16;
+	height = vc4_state->src_h[0] >> 16;
+
+	/* SCL1 is used for Cb/Cr scaling of planar formats.  For RGB
+	 * and 4:4:4, scl1 should be set to scl0 so both channels of
+	 * the scaler do the same thing.  For YUV, the Y plane needs
+	 * to be put in channel 1 and Cb/Cr in channel 0, so we swap
+	 * the scl fields here.
+	 */
+	if (num_planes == 1) {
+		scl0 = vc4_get_scl_field(state, 0);
+		scl1 = scl0;
+	} else {
+		scl0 = vc4_get_scl_field(state, 1);
+		scl1 = vc4_get_scl_field(state, 0);
+	}
+
+	rotation = drm_rotation_simplify(state->rotation,
+					 DRM_MODE_ROTATE_0 |
+					 DRM_MODE_REFLECT_X |
+					 DRM_MODE_REFLECT_Y);
+
+	/* We must point to the last line when Y reflection is enabled. */
+	src_y = vc4_state->src_y >> 16;
+	if (rotation & DRM_MODE_REFLECT_Y)
+		src_y += height - 1;
+
+	src_x = vc4_state->src_x >> 16;
+
+	switch (base_format_mod) {
+	case DRM_FORMAT_MOD_LINEAR:
+		tiling = SCALER6_CTL0_ADDR_MODE_LINEAR;
+
+		/* Adjust the base pointer to the first pixel to be scanned
+		 * out.
+		 */
+		for (i = 0; i < num_planes; i++) {
+			offsets[i] += src_y / (i ? v_subsample : 1) * fb->pitches[i];
+			offsets[i] += src_x / (i ? h_subsample : 1) * fb->format->cpp[i];
+		}
+
+		break;
+
+	case DRM_FORMAT_MOD_BROADCOM_SAND128:
+	case DRM_FORMAT_MOD_BROADCOM_SAND256: {
+		uint32_t param = fourcc_mod_broadcom_param(fb->modifier);
+		u32 components_per_word;
+		u32 starting_offset;
+		u32 fetch_count;
+
+		if (param > SCALER_TILE_HEIGHT_MASK) {
+			DRM_DEBUG_KMS("SAND height too large (%d)\n",
+				      param);
+			return -EINVAL;
+		}
+
+		if (fb->format->format == DRM_FORMAT_P030) {
+			hvs_format = HVS_PIXEL_FORMAT_YCBCR_10BIT;
+			tiling = SCALER6_CTL0_ADDR_MODE_128B;
+		} else {
+			hvs_format = HVS_PIXEL_FORMAT_YCBCR_YUV420_2PLANE;
+
+			switch (base_format_mod) {
+			case DRM_FORMAT_MOD_BROADCOM_SAND128:
+				tiling = SCALER6_CTL0_ADDR_MODE_128B;
+				break;
+			case DRM_FORMAT_MOD_BROADCOM_SAND256:
+				tiling = SCALER6_CTL0_ADDR_MODE_256B;
+				break;
+			default:
+				return -EINVAL;
+			}
+		}
+
+		/* Adjust the base pointer to the first pixel to be scanned
+		 * out.
+		 *
+		 * For P030, y_ptr [31:4] is the 128bit word for the start pixel
+		 * y_ptr [3:0] is the pixel (0-11) contained within that 128bit
+		 * word that should be taken as the first pixel.
+		 * Ditto uv_ptr [31:4] vs [3:0], however [3:0] contains the
+		 * element within the 128bit word, eg for pixel 3 the value
+		 * should be 6.
+		 */
+		for (i = 0; i < num_planes; i++) {
+			u32 tile_w, tile, x_off, pix_per_tile;
+
+			if (fb->format->format == DRM_FORMAT_P030) {
+				/*
+				 * Spec says: bits [31:4] of the given address
+				 * should point to the 128-bit word containing
+				 * the desired starting pixel, and bits[3:0]
+				 * should be between 0 and 11, indicating which
+				 * of the 12-pixels in that 128-bit word is the
+				 * first pixel to be used
+				 */
+				u32 remaining_pixels = src_x % 96;
+				u32 aligned = remaining_pixels / 12;
+				u32 last_bits = remaining_pixels % 12;
+
+				x_off = aligned * 16 + last_bits;
+				tile_w = 128;
+				pix_per_tile = 96;
+			} else {
+				switch (base_format_mod) {
+				case DRM_FORMAT_MOD_BROADCOM_SAND128:
+					tile_w = 128;
+					break;
+				case DRM_FORMAT_MOD_BROADCOM_SAND256:
+					tile_w = 256;
+					break;
+				default:
+					return -EINVAL;
+				}
+				pix_per_tile = tile_w / fb->format->cpp[0];
+				x_off = (src_x % pix_per_tile) /
+					(i ? h_subsample : 1) *
+					fb->format->cpp[i];
+			}
+
+			tile = src_x / pix_per_tile;
+
+			offsets[i] += param * tile_w * tile;
+			offsets[i] += src_y / (i ? v_subsample : 1) * tile_w;
+			offsets[i] += x_off & ~(i ? 1 : 0);
+		}
+
+		components_per_word = fb->format->format == DRM_FORMAT_P030 ? 24 : 32;
+		starting_offset = src_x % components_per_word;
+		fetch_count = (width + starting_offset + components_per_word - 1) /
+			components_per_word;
+
+		pitch0 = VC4_SET_FIELD(param, SCALER6_PTR2_PITCH) |
+			 VC4_SET_FIELD(fetch_count - 1, SCALER6_PTR2_FETCH_COUNT);
+		break;
+	}
+
+	default:
+		DRM_DEBUG_KMS("Unsupported FB tiling flag 0x%16llx",
+			      (long long)fb->modifier);
+		return -EINVAL;
+	}
+
+	/* fetch an extra pixel if we don't actually line up with the left edge. */
+	if ((vc4_state->src_x & 0xffff) && vc4_state->src_x < (state->fb->width << 16))
+		width++;
+
+	/* same for the right side */
+	if (((vc4_state->src_x + vc4_state->src_w[0]) & 0xffff) &&
+	    vc4_state->src_x + vc4_state->src_w[0] < (state->fb->width << 16))
+		width++;
+
+	/* now for the top */
+	if ((vc4_state->src_y & 0xffff) && vc4_state->src_y < (state->fb->height << 16))
+		height++;
+
+	/* and the bottom */
+	if (((vc4_state->src_y + vc4_state->src_h[0]) & 0xffff) &&
+	    vc4_state->src_y + vc4_state->src_h[0] < (state->fb->height << 16))
+		height++;
+
+	/* for YUV444 hardware wants double the width, otherwise it doesn't
+	 * fetch full width of chroma
+	 */
+	if (format->drm == DRM_FORMAT_YUV444 || format->drm == DRM_FORMAT_YVU444)
+		width <<= 1;
+
+	/* Don't waste cycles mixing with plane alpha if the set alpha
+	 * is opaque or there is no per-pixel alpha information.
+	 * In any case we use the alpha property value as the fixed alpha.
+	 */
+	mix_plane_alpha = state->alpha != DRM_BLEND_ALPHA_OPAQUE &&
+			  fb->format->has_alpha;
+
+	/* Control Word 0: Scaling Configuration & Element Validity*/
+	vc4_dlist_write(vc4_state,
+			SCALER6_CTL0_VALID |
+			VC4_SET_FIELD(tiling, SCALER6_CTL0_ADDR_MODE) |
+			VC4_SET_FIELD(0, SCALER6_CTL0_ALPHA_MASK) |
+			(vc4_state->is_unity ? SCALER6_CTL0_UNITY : 0) |
+			VC4_SET_FIELD(format->pixel_order_hvs5, SCALER6_CTL0_ORDERRGBA) |
+			VC4_SET_FIELD(scl1, SCALER6_CTL0_SCL1_MODE) |
+			VC4_SET_FIELD(scl0, SCALER6_CTL0_SCL0_MODE) |
+			VC4_SET_FIELD(hvs_format, SCALER6_CTL0_PIXEL_FORMAT));
+
+	/* Position Word 0: Image Position */
+	vc4_state->pos0_offset = vc4_state->dlist_count;
+	vc4_dlist_write(vc4_state,
+			VC4_SET_FIELD(vc4_state->crtc_y, SCALER6_POS0_START_Y) |
+			(rotation & DRM_MODE_REFLECT_X ? SCALER6_POS0_HFLIP : 0) |
+			VC4_SET_FIELD(vc4_state->crtc_x, SCALER6_POS0_START_X));
+
+	/* Control Word 2: Alpha Value & CSC */
+	vc4_dlist_write(vc4_state,
+			vc6_plane_get_csc_mode(vc4_state) |
+			vc4_hvs5_get_alpha_blend_mode(state) |
+			(mix_plane_alpha ? SCALER6_CTL2_ALPHA_MIX : 0) |
+			VC4_SET_FIELD(state->alpha >> 4, SCALER5_CTL2_ALPHA));
+
+	/* Position Word 1: Scaled Image Dimensions */
+	if (!vc4_state->is_unity)
+		vc4_dlist_write(vc4_state,
+				VC4_SET_FIELD(vc4_state->crtc_h - 1,
+					      SCALER6_POS1_SCL_LINES) |
+				VC4_SET_FIELD(vc4_state->crtc_w - 1,
+					      SCALER6_POS1_SCL_WIDTH));
+
+	/* Position Word 2: Source Image Size */
+	vc4_state->pos2_offset = vc4_state->dlist_count;
+	vc4_dlist_write(vc4_state,
+			VC4_SET_FIELD(height - 1,
+				      SCALER6_POS2_SRC_LINES) |
+			VC4_SET_FIELD(width - 1,
+				      SCALER6_POS2_SRC_WIDTH));
+
+	/* Position Word 3: Context */
+	vc4_dlist_write(vc4_state, 0xc0c0c0c0);
+
+	/*
+	 * TODO: This only covers Raster Scan Order planes
+	 */
+	for (i = 0; i < num_planes; i++) {
+		struct drm_gem_dma_object *bo = drm_fb_dma_get_gem_obj(fb, i);
+		dma_addr_t paddr = bo->dma_addr + fb->offsets[i] + offsets[i];
+
+		/* Pointer Word 0 */
+		vc4_state->ptr0_offset[i] = vc4_state->dlist_count;
+		vc4_dlist_write(vc4_state,
+				(rotation & DRM_MODE_REFLECT_Y ? SCALER6_PTR0_VFLIP : 0) |
+				/*
+				 * The UPM buffer will be allocated in
+				 * vc6_plane_allocate_upm().
+				 */
+				VC4_SET_FIELD(upper_32_bits(paddr) & 0xff,
+					      SCALER6_PTR0_UPPER_ADDR));
+
+		/* Pointer Word 1 */
+		vc4_dlist_write(vc4_state, lower_32_bits(paddr));
+
+		/* Pointer Word 2 */
+		if (base_format_mod != DRM_FORMAT_MOD_BROADCOM_SAND128 &&
+		    base_format_mod != DRM_FORMAT_MOD_BROADCOM_SAND256) {
+			vc4_dlist_write(vc4_state,
+					VC4_SET_FIELD(fb->pitches[i],
+						      SCALER6_PTR2_PITCH));
+		} else {
+			vc4_dlist_write(vc4_state, pitch0);
+		}
+	}
+
+	/*
+	 * Palette Word 0
+	 * TODO: We're not using the palette mode
+	 */
+
+	/*
+	 * Trans Word 0
+	 * TODO: It's only relevant if we set the trans_rgb bit in the
+	 * control word 0, and we don't at the moment.
+	 */
+
+	vc4_state->lbm_offset = 0;
+
+	if (!vc4_state->is_unity || fb->format->is_yuv) {
+		/*
+		 * Reserve a slot for the LBM Base Address. The real value will
+		 * be set when calling vc4_plane_allocate_lbm().
+		 */
+		if (vc4_state->y_scaling[0] != VC4_SCALING_NONE ||
+		    vc4_state->y_scaling[1] != VC4_SCALING_NONE) {
+			vc4_state->lbm_offset = vc4_state->dlist_count;
+			vc4_dlist_counter_increment(vc4_state);
+		}
+
+		if (vc4_state->x_scaling[0] != VC4_SCALING_NONE ||
+		    vc4_state->x_scaling[1] != VC4_SCALING_NONE ||
+		    vc4_state->y_scaling[0] != VC4_SCALING_NONE ||
+		    vc4_state->y_scaling[1] != VC4_SCALING_NONE) {
+			if (num_planes > 1)
+				/*
+				 * Emit Cb/Cr as channel 0 and Y as channel
+				 * 1. This matches how we set up scl0/scl1
+				 * above.
+				 */
+				vc4_write_scaling_parameters(state, 1);
+
+			vc4_write_scaling_parameters(state, 0);
+		}
+
+		/*
+		 * If any PPF setup was done, then all the kernel
+		 * pointers get uploaded.
+		 */
+		if (vc4_state->x_scaling[0] == VC4_SCALING_PPF ||
+		    vc4_state->y_scaling[0] == VC4_SCALING_PPF ||
+		    vc4_state->x_scaling[1] == VC4_SCALING_PPF ||
+		    vc4_state->y_scaling[1] == VC4_SCALING_PPF) {
+			u32 kernel =
+				VC4_SET_FIELD(vc4->hvs->mitchell_netravali_filter.start,
+					      SCALER_PPF_KERNEL_OFFSET);
+
+			/* HPPF plane 0 */
+			vc4_dlist_write(vc4_state, kernel);
+			/* VPPF plane 0 */
+			vc4_dlist_write(vc4_state, kernel);
+			/* HPPF plane 1 */
+			vc4_dlist_write(vc4_state, kernel);
+			/* VPPF plane 1 */
+				vc4_dlist_write(vc4_state, kernel);
+		}
+	}
+
+	vc4_dlist_write(vc4_state, SCALER6_CTL0_END);
+
+	vc4_state->dlist[0] |=
+		VC4_SET_FIELD(vc4_state->dlist_count, SCALER6_CTL0_NEXT);
+
+	/* crtc_* are already clipped coordinates. */
+	covers_screen = vc4_state->crtc_x == 0 && vc4_state->crtc_y == 0 &&
+			vc4_state->crtc_w == state->crtc->mode.hdisplay &&
+			vc4_state->crtc_h == state->crtc->mode.vdisplay;
+
+	/*
+	 * Background fill might be necessary when the plane has per-pixel
+	 * alpha content or a non-opaque plane alpha and could blend from the
+	 * background or does not cover the entire screen.
+	 */
+	vc4_state->needs_bg_fill = fb->format->has_alpha || !covers_screen ||
+				   state->alpha != DRM_BLEND_ALPHA_OPAQUE;
+
+	/*
+	 * Flag the dlist as initialized to avoid checking it twice in case
+	 * the async update check already called vc4_plane_mode_set() and
+	 * decided to fallback to sync update because async update was not
+	 * possible.
+	 */
+	vc4_state->dlist_initialized = 1;
+
+	vc4_plane_calc_load(state);
+
+	drm_dbg_driver(drm, "[PLANE:%d:%s] Computed DLIST size: %u\n",
+		       plane->base.id, plane->name, vc4_state->dlist_count);
+
+	return 0;
+}
+
 /* If a modeset involves changing the setup of a plane, the atomic
  * infrastructure will call this to validate a proposed plane setup.
  * However, if a plane isn't getting updated, this (and the
@@ -1373,6 +2058,7 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 static int vc4_plane_atomic_check(struct drm_plane *plane,
 				  struct drm_atomic_state *state)
 {
+	struct vc4_dev *vc4 = to_vc4_dev(plane->dev);
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
 	struct vc4_plane_state *vc4_state = to_vc4_plane_state(new_plane_state);
@@ -1380,10 +2066,21 @@ static int vc4_plane_atomic_check(struct drm_plane *plane,
 
 	vc4_state->dlist_count = 0;
 
-	if (!plane_enabled(new_plane_state))
+	if (!plane_enabled(new_plane_state)) {
+		struct drm_plane_state *old_plane_state =
+				drm_atomic_get_old_plane_state(state, plane);
+
+		if (vc4->gen >= VC4_GEN_6_C && old_plane_state &&
+		    plane_enabled(old_plane_state)) {
+			vc6_plane_free_upm(new_plane_state);
+		}
 		return 0;
+	}
 
-	ret = vc4_plane_mode_set(plane, new_plane_state);
+	if (vc4->gen >= VC4_GEN_6_C)
+		ret = vc6_plane_mode_set(plane, new_plane_state);
+	else
+		ret = vc4_plane_mode_set(plane, new_plane_state);
 	if (ret)
 		return ret;
 
@@ -1391,6 +2088,12 @@ static int vc4_plane_atomic_check(struct drm_plane *plane,
 	if (ret)
 		return ret;
 
+	if (vc4->gen >= VC4_GEN_6_C) {
+		ret = vc6_plane_allocate_upm(new_plane_state);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
@@ -1439,7 +2142,8 @@ void vc4_plane_async_set_fb(struct drm_plane *plane, struct drm_framebuffer *fb)
 {
 	struct vc4_plane_state *vc4_state = to_vc4_plane_state(plane->state);
 	struct drm_gem_dma_object *bo = drm_fb_dma_get_gem_obj(fb, 0);
-	uint32_t addr;
+	struct vc4_dev *vc4 = to_vc4_dev(plane->dev);
+	dma_addr_t dma_addr = bo->dma_addr + fb->offsets[0];
 	int idx;
 
 	if (!drm_dev_enter(plane->dev, &idx))
@@ -1449,19 +2153,38 @@ void vc4_plane_async_set_fb(struct drm_plane *plane, struct drm_framebuffer *fb)
 	 * because this is only called on the primary plane.
 	 */
 	WARN_ON_ONCE(plane->state->crtc_x < 0 || plane->state->crtc_y < 0);
-	addr = bo->dma_addr + fb->offsets[0];
 
-	/* Write the new address into the hardware immediately.  The
-	 * scanout will start from this address as soon as the FIFO
-	 * needs to refill with pixels.
-	 */
-	writel(addr, &vc4_state->hw_dlist[vc4_state->ptr0_offset[0]]);
+	if (vc4->gen == VC4_GEN_6_C) {
+		u32 value;
 
-	/* Also update the CPU-side dlist copy, so that any later
-	 * atomic updates that don't do a new modeset on our plane
-	 * also use our updated address.
-	 */
-	vc4_state->dlist[vc4_state->ptr0_offset[0]] = addr;
+		value = vc4_state->dlist[vc4_state->ptr0_offset[0]] &
+					~SCALER6_PTR0_UPPER_ADDR_MASK;
+		value |= VC4_SET_FIELD(upper_32_bits(dma_addr) & 0xff,
+				       SCALER6_PTR0_UPPER_ADDR);
+
+		writel(value, &vc4_state->hw_dlist[vc4_state->ptr0_offset[0]]);
+		vc4_state->dlist[vc4_state->ptr0_offset[0]] = value;
+
+		value = lower_32_bits(dma_addr);
+		writel(value, &vc4_state->hw_dlist[vc4_state->ptr0_offset[0] + 1]);
+		vc4_state->dlist[vc4_state->ptr0_offset[0] + 1] = value;
+	} else {
+		u32 addr;
+
+		addr = (u32)dma_addr;
+
+		/* Write the new address into the hardware immediately.  The
+		 * scanout will start from this address as soon as the FIFO
+		 * needs to refill with pixels.
+		 */
+		writel(addr, &vc4_state->hw_dlist[vc4_state->ptr0_offset[0]]);
+
+		/* Also update the CPU-side dlist copy, so that any later
+		 * atomic updates that don't do a new modeset on our plane
+		 * also use our updated address.
+		 */
+		vc4_state->dlist[vc4_state->ptr0_offset[0]] = addr;
+	}
 
 	drm_dev_exit(idx);
 }
@@ -1543,13 +2266,17 @@ static void vc4_plane_atomic_async_update(struct drm_plane *plane,
 static int vc4_plane_atomic_async_check(struct drm_plane *plane,
 					struct drm_atomic_state *state)
 {
+	struct vc4_dev *vc4 = to_vc4_dev(plane->dev);
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
 	struct vc4_plane_state *old_vc4_state, *new_vc4_state;
 	int ret;
 	u32 i;
 
-	ret = vc4_plane_mode_set(plane, new_plane_state);
+	if (vc4->gen <= VC4_GEN_5)
+		ret = vc4_plane_mode_set(plane, new_plane_state);
+	else
+		ret = vc6_plane_mode_set(plane, new_plane_state);
 	if (ret)
 		return ret;
 
@@ -1723,7 +2450,7 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
 	};
 
 	for (i = 0; i < ARRAY_SIZE(hvs_formats); i++) {
-		if (!hvs_formats[i].hvs5_only || vc4->gen == VC4_GEN_5) {
+		if (!hvs_formats[i].hvs5_only || vc4->gen >= VC4_GEN_5) {
 			formats[num_formats] = hvs_formats[i].drm;
 			num_formats++;
 		}
@@ -1738,7 +2465,7 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
 		return ERR_CAST(vc4_plane);
 	plane = &vc4_plane->base;
 
-	if (vc4->gen == VC4_GEN_5)
+	if (vc4->gen >= VC4_GEN_5)
 		drm_plane_helper_add(plane, &vc5_plane_helper_funcs);
 	else
 		drm_plane_helper_add(plane, &vc4_plane_helper_funcs);
diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index 341a75cf92e5..9226429539cf 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -520,6 +520,130 @@
 
 #define SCALER5_DLIST_START			0x00004000
 
+#define SCALER6_VERSION				0x00000000
+#define SCALER6_CXM_SIZE			0x00000004
+#define SCALER6_LBM_SIZE			0x00000008
+#define SCALER6_UBM_SIZE			0x0000000c
+#define SCALER6_COBA_SIZE			0x00000010
+#define SCALER6_COB_SIZE			0x00000014
+
+#define SCALER6_CONTROL				0x00000020
+# define SCALER6_CONTROL_HVS_EN			BIT(31)
+# define SCALER6_CONTROL_PF_LINES_MASK		VC4_MASK(22, 18)
+# define SCALER6_CONTROL_ABORT_ON_EMPTY		BIT(16)
+# define SCALER6_CONTROL_DSP1_TARGET_MASK	VC4_MASK(13, 12)
+# define SCALER6_CONTROL_MAX_REQS_MASK		VC4_MASK(7, 4)
+
+#define SCALER6_FETCHER_STATUS			0x00000024
+#define SCALER6_FETCH_STATUS			0x00000028
+#define SCALER6_HANDLE_ERROR			0x0000002c
+
+#define SCALER6_DISP0_CTRL0			0x00000030
+#define SCALER6_DISPX_CTRL0(x)						\
+	(SCALER6_DISP0_CTRL0 + ((x) * (SCALER6_DISP1_CTRL0 - SCALER6_DISP0_CTRL0)))
+# define SCALER6_DISPX_CTRL0_ENB		BIT(31)
+# define SCALER6_DISPX_CTRL0_RESET		BIT(30)
+# define SCALER6_DISPX_CTRL0_FWIDTH_MASK	VC4_MASK(28, 16)
+# define SCALER6_DISPX_CTRL0_ONESHOT		BIT(15)
+# define SCALER6_DISPX_CTRL0_ONECTX_MASK	VC4_MASK(14, 13)
+# define SCALER6_DISPX_CTRL0_LINES_MASK		VC4_MASK(12, 0)
+
+#define SCALER6_DISP0_CTRL1			0x00000034
+#define SCALER6_DISPX_CTRL1(x)						\
+	(SCALER6_DISP0_CTRL1 + ((x) * (SCALER6_DISP1_CTRL1 - SCALER6_DISP0_CTRL1)))
+# define SCALER6_DISPX_CTRL1_BGENB		BIT(8)
+# define SCALER6_DISPX_CTRL1_INTLACE		BIT(0)
+
+#define SCALER6_DISP0_BGND			0x00000038
+#define SCALER6_DISPX_BGND(x)						\
+	(SCALER6_DISP0_BGND + ((x) * (SCALER6_DISP1_BGND - SCALER6_DISP0_BGND)))
+
+#define SCALER6_DISP0_LPTRS			0x0000003c
+#define SCALER6_DISPX_LPTRS(x)						\
+	(SCALER6_DISP0_LPTRS + ((x) * (SCALER6_DISP1_LPTRS - SCALER6_DISP0_LPTRS)))
+# define SCALER6_DISPX_LPTRS_HEADE_MASK		VC4_MASK(11, 0)
+
+#define SCALER6_DISP0_COB			0x00000040
+#define SCALER6_DISPX_COB(x)						\
+	(SCALER6_DISP0_COB + ((x) * (SCALER6_DISP1_COB - SCALER6_DISP0_COB)))
+# define SCALER6_DISPX_COB_TOP_MASK		VC4_MASK(31, 16)
+# define SCALER6_DISPX_COB_BASE_MASK		VC4_MASK(15, 0)
+
+#define SCALER6_DISP0_STATUS			0x00000044
+
+#define SCALER6_DISPX_STATUS(x)						\
+	(SCALER6_DISP0_STATUS + ((x) * (SCALER6_DISP1_STATUS - SCALER6_DISP0_STATUS)))
+# define SCALER6_DISPX_STATUS_EMPTY		BIT(22)
+# define SCALER6_DISPX_STATUS_FRCNT_MASK	VC4_MASK(21, 16)
+# define SCALER6_DISPX_STATUS_OFIELD		BIT(15)
+# define SCALER6_DISPX_STATUS_MODE_MASK		VC4_MASK(14, 13)
+# define SCALER6_DISPX_STATUS_MODE_DISABLED	0
+# define SCALER6_DISPX_STATUS_MODE_INIT		1
+# define SCALER6_DISPX_STATUS_MODE_RUN		2
+# define SCALER6_DISPX_STATUS_MODE_EOF		3
+# define SCALER6_DISPX_STATUS_YLINE_MASK	VC4_MASK(12, 0)
+
+#define SCALER6_DISP0_DL			0x00000048
+
+#define SCALER6_DISPX_DL(x)						\
+	(SCALER6_DISP0_DL + ((x) * (SCALER6_DISP1_DL - SCALER6_DISP0_DL)))
+# define SCALER6_DISPX_DL_LACT_MASK		VC4_MASK(11, 0)
+
+#define SCALER6_DISP0_RUN			0x0000004c
+#define SCALER6_DISP1_CTRL0			0x00000050
+#define SCALER6_DISP1_CTRL1			0x00000054
+#define SCALER6_DISP1_BGND			0x00000058
+#define SCALER6_DISP1_LPTRS			0x0000005c
+#define SCALER6_DISP1_COB			0x00000060
+#define SCALER6_DISP1_STATUS			0x00000064
+#define SCALER6_DISP1_DL			0x00000068
+#define SCALER6_DISP1_RUN			0x0000006c
+#define SCALER6_DISP2_CTRL0			0x00000070
+#define SCALER6_DISP2_CTRL1			0x00000074
+#define SCALER6_DISP2_BGND			0x00000078
+#define SCALER6_DISP2_LPTRS			0x0000007c
+#define SCALER6_DISP2_COB			0x00000080
+#define SCALER6_DISP2_STATUS			0x00000084
+#define SCALER6_DISP2_DL			0x00000088
+#define SCALER6_DISP2_RUN			0x0000008c
+#define SCALER6_EOLN				0x00000090
+#define SCALER6_DL_STATUS			0x00000094
+#define SCALER6_BFG_MISC			0x0000009c
+#define SCALER6_QOS0				0x000000a0
+#define SCALER6_PROF0				0x000000a4
+#define SCALER6_QOS1				0x000000a8
+#define SCALER6_PROF1				0x000000ac
+#define SCALER6_QOS2				0x000000b0
+#define SCALER6_PROF2				0x000000b4
+#define SCALER6_PRI_MAP0			0x000000b8
+#define SCALER6_PRI_MAP1			0x000000bc
+#define SCALER6_HISTCTRL			0x000000c0
+#define SCALER6_HISTBIN0			0x000000c4
+#define SCALER6_HISTBIN1			0x000000c8
+#define SCALER6_HISTBIN2			0x000000cc
+#define SCALER6_HISTBIN3			0x000000d0
+#define SCALER6_HISTBIN4			0x000000d4
+#define SCALER6_HISTBIN5			0x000000d8
+#define SCALER6_HISTBIN6			0x000000dc
+#define SCALER6_HISTBIN7			0x000000e0
+#define SCALER6_HDR_CFG_REMAP			0x000000f4
+#define SCALER6_COL_SPACE			0x000000f8
+#define SCALER6_HVS_ID				0x000000fc
+#define SCALER6_CFC1				0x00000100
+#define SCALER6_DISP_UPM_ISO0			0x00000200
+#define SCALER6_DISP_UPM_ISO1			0x00000204
+#define SCALER6_DISP_UPM_ISO2			0x00000208
+#define SCALER6_DISP_LBM_ISO0			0x0000020c
+#define SCALER6_DISP_LBM_ISO1			0x00000210
+#define SCALER6_DISP_LBM_ISO2			0x00000214
+#define SCALER6_DISP_COB_ISO0			0x00000218
+#define SCALER6_DISP_COB_ISO1			0x0000021c
+#define SCALER6_DISP_COB_ISO2			0x00000220
+#define SCALER6_BAD_COB				0x00000224
+#define SCALER6_BAD_LBM				0x00000228
+#define SCALER6_BAD_UPM				0x0000022c
+#define SCALER6_BAD_AXI				0x00000230
+
 # define VC4_HDMI_SW_RESET_FORMAT_DETECT	BIT(1)
 # define VC4_HDMI_SW_RESET_HDMI			BIT(0)
 
@@ -1115,4 +1239,61 @@ enum hvs_pixel_format {
 #define SCALER_PITCH0_TILE_WIDTH_R_MASK		VC4_MASK(6, 0)
 #define SCALER_PITCH0_TILE_WIDTH_R_SHIFT	0
 
+#define SCALER6_CTL0_END			BIT(31)
+#define SCALER6_CTL0_VALID			BIT(30)
+#define SCALER6_CTL0_NEXT_MASK			VC4_MASK(29, 24)
+#define SCALER6_CTL0_RGB_TRANS			BIT(23)
+#define SCALER6_CTL0_ADDR_MODE_MASK		VC4_MASK(22, 20)
+#define SCALER6_CTL0_ADDR_MODE_LINEAR		0
+#define SCALER6_CTL0_ADDR_MODE_128B		1
+#define SCALER6_CTL0_ADDR_MODE_256B		2
+#define SCALER6_CTL0_ADDR_MODE_MAP8		3
+#define SCALER6_CTL0_ADDR_MODE_UIF		4
+
+#define SCALER6_CTL0_ALPHA_MASK_MASK		VC4_MASK(19, 18)
+#define SCALER6_CTL0_UNITY			BIT(15)
+#define SCALER6_CTL0_ORDERRGBA_MASK		VC4_MASK(14, 13)
+#define SCALER6_CTL0_SCL1_MODE_MASK		VC4_MASK(10, 8)
+#define SCALER6_CTL0_SCL0_MODE_MASK		VC4_MASK(7, 5)
+#define SCALER6_CTL0_PIXEL_FORMAT_MASK		VC4_MASK(4, 0)
+
+#define SCALER6_POS0_START_Y_MASK		VC4_MASK(28, 16)
+#define SCALER6_POS0_HFLIP			BIT(15)
+#define SCALER6_POS0_START_X_MASK		VC4_MASK(12, 0)
+
+#define SCALER6_CTL2_ALPHA_MODE_MASK		VC4_MASK(31, 30)
+#define SCALER6_CTL2_ALPHA_PREMULT		BIT(29)
+#define SCALER6_CTL2_ALPHA_MIX			BIT(28)
+#define SCALER6_CTL2_BFG			BIT(26)
+#define SCALER6_CTL2_CSC_ENABLE			BIT(25)
+#define SCALER6_CTL2_BRCM_CFC_CONTROL_MASK	VC4_MASK(18, 16)
+#define SCALER6_CTL2_ALPHA_MASK			VC4_MASK(15, 4)
+
+#define SCALER6_POS1_SCL_LINES_MASK		VC4_MASK(28, 16)
+#define SCALER6_POS1_SCL_WIDTH_MASK		VC4_MASK(12, 0)
+
+#define SCALER6_POS2_SRC_LINES_MASK		VC4_MASK(28, 16)
+#define SCALER6_POS2_SRC_WIDTH_MASK		VC4_MASK(12, 0)
+
+#define SCALER6_PTR0_VFLIP			BIT(31)
+#define SCALER6_PTR0_UPM_BASE_MASK		VC4_MASK(28, 16)
+#define SCALER6_PTR0_UPM_HANDLE_MASK		VC4_MASK(14, 10)
+#define SCALER6_PTR0_UPM_BUFF_SIZE_MASK		VC4_MASK(9, 8)
+#define SCALER6_PTR0_UPM_BUFF_SIZE_16_LINES	3
+#define SCALER6_PTR0_UPM_BUFF_SIZE_8_LINES	2
+#define SCALER6_PTR0_UPM_BUFF_SIZE_4_LINES	1
+#define SCALER6_PTR0_UPM_BUFF_SIZE_2_LINES	0
+#define SCALER6_PTR0_UPPER_ADDR_MASK		VC4_MASK(7, 0)
+
+#define SCALER6_PTR2_ALPHA_BPP_MASK		VC4_MASK(31, 31)
+#define SCALER6_PTR2_ALPHA_BPP_1BPP		1
+#define SCALER6_PTR2_ALPHA_BPP_8BPP		0
+#define SCALER6_PTR2_ALPHA_ORDER_MASK		VC4_MASK(30, 30)
+#define SCALER6_PTR2_ALPHA_ORDER_MSB_TO_LSB	1
+#define SCALER6_PTR2_ALPHA_ORDER_LSB_TO_MSB	0
+#define SCALER6_PTR2_ALPHA_OFFS_MASK		VC4_MASK(29, 27)
+#define SCALER6_PTR2_LSKIP_MASK			VC4_MASK(26, 24)
+#define SCALER6_PTR2_PITCH_MASK			VC4_MASK(16, 0)
+#define SCALER6_PTR2_FETCH_COUNT_MASK		VC4_MASK(26, 16)
+
 #endif /* VC4_REGS_H */

-- 
2.34.1


