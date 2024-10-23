Return-Path: <linux-clk+bounces-13654-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D839AD1CB
	for <lists+linux-clk@lfdr.de>; Wed, 23 Oct 2024 18:56:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EA6A286F7B
	for <lists+linux-clk@lfdr.de>; Wed, 23 Oct 2024 16:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A3D1202623;
	Wed, 23 Oct 2024 16:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="IU3VjKmn"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E79520102B
	for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 16:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729702246; cv=none; b=ZzQf4z9M7QvlkOiuF0K37triCGrO9COAPb7Sdr8NNxILWBIs3R59rnXTzXa/DnlSrhWx3/GpIqYQX7EwZd9sHwGEiWzep0oOtbSx09p38yvxKB4Ldwfe1aXPo7fUvDOa4GjhupWMKGArGJPSaM6MF8vL5AozPl620+uinDsIpKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729702246; c=relaxed/simple;
	bh=+BG0h8wlmH06SZK5YD7t3bFzfMh9GcpVnwWKqZt68qQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gqm3m5K8xbPEGXdfT0Ye/dFB8U4kIua0tiD7ZG04ez9/0iPtKXEIk8UONmx2iY1EuA/+Fp7sYOSZoc4yt5GmIDRfpz4dYs38/Fe0qC+z+QwmhD+TMRIvdgf0NMMbmO6xwGMi4LzoFmmAsrZrGjEN3gyTHaFEETWTxqScl/E7UOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=IU3VjKmn; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-431481433bdso74174825e9.3
        for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 09:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702242; x=1730307042; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rx+cgECVrwHBqHNuLqK3jB//M+8KGwV7ZzrA+d3SFbk=;
        b=IU3VjKmn5pm6iLzwXrc3QndM2MrU7GW+vMtOYCSqUu/PqVnJQeXXq5zcNLhUb6rNFG
         XwPVoYjZI81a3y5AoRn/GJ5sSxQ+Q4xYno7JDpl1bzgu0fjNEl+AmZDa+MER3pApLNEi
         RKafFQl/hMVoWktFNy+IQrDeabTpbKh7wmm6mjQCFcD1ZR5j6utI9HxCbpGye5MXmPy1
         TXcLiOsKe1n52F6gUVCQExXJ5tu6yfdvaD9v+uhhg+eIPUOyMjHJwW+8/XYyLlwBhgYc
         3uONyZkB4vjVEWbZEWdjRpj6M/r/PKtUzCQeLwIDvN84qCVYcqmdKdIHXKUIIxK97dY7
         HCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702242; x=1730307042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rx+cgECVrwHBqHNuLqK3jB//M+8KGwV7ZzrA+d3SFbk=;
        b=L0WPpLQZSdgFDxub/ADSozt445JhurQ7+J/1iKRG3Ga3fmVsPYhhbu+aljWsC6rCAa
         Qkm79a2UaJkVFYgdY6wQkEg5ZKcithnkU20aw2SBMQublkEbU5VMHtGjqXeE8uvYf9gC
         5suDhJb/lTt3Ck9HnQsN/fXitpiQ6wJ6YDOp4U4IhJyADeSabG9j/g/j7tnf4yXmkLsV
         9O00TLz+a65LWSUPhBAwb9V687bhFy6HZoM2CCkBXnALwnTLgnCWkTxsWnxIoA0odT+7
         9qMqd4T68Br971vUqDKAhscv3kbWgRpOY+99OOnVIak1DgtJDZqp36lOUruob/WRYHjl
         rLTw==
X-Forwarded-Encrypted: i=1; AJvYcCWjrUbiyvgXJ/tmGOmPOox5TQNFIh0TgxhJLarlcJOVuzHICWtV1FZ4k9L8J5u7j7R459uVyxYJ1No=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMsHiueKCFUiU21WGsqMIUtG8fKLwECF5jfWNJjEDaXfktwVRD
	9Ej+irtAT80a4y/Hk3jHnsaGSgE0M8GE6QCB26DQw4xp6JcwW6ims6BmCdM0YH0=
X-Google-Smtp-Source: AGHT+IEGbFSUWklZClQpP0TsDzcUmssP/K7HgzrueQBCh/JZ/3hd+ojpDHVXKKSpg+VGEoE86bXTLg==
X-Received: by 2002:a05:600c:3b9b:b0:431:58cd:b259 with SMTP id 5b1f17b1804b1-431841b1fdbmr26533865e9.31.1729702242397;
        Wed, 23 Oct 2024 09:50:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:41 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:24 +0100
Subject: [PATCH 27/37] drm/vc4: Add additional warn_on for incorrect
 revisions
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-27-1cc2d5594907@raspberrypi.com>
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

Some code path in vc4 are conditional to a generation and cannot be
executed on others. Let's put a WARN_ON if that ever happens.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hvs.c   | 30 ++++++++++++++++++++++++++++--
 drivers/gpu/drm/vc4/vc4_kms.c   |  6 ++++++
 drivers/gpu/drm/vc4/vc4_plane.c | 17 +++++++++++++++++
 3 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index e4717ccd0730..f15aba4b81d7 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -419,12 +419,15 @@ static int vc4_hvs_upload_linear_kernel(struct vc4_hvs *hvs,
 static void vc4_hvs_lut_load(struct vc4_hvs *hvs,
 			     struct vc4_crtc *vc4_crtc)
 {
-	struct drm_device *drm = &hvs->vc4->base;
+	struct vc4_dev *vc4 = hvs->vc4;
+	struct drm_device *drm = &vc4->base;
 	struct drm_crtc *crtc = &vc4_crtc->base;
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
 	int idx;
 	u32 i;
 
+	WARN_ON_ONCE(vc4->gen > VC4_GEN_5);
+
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
@@ -474,6 +477,8 @@ u8 vc4_hvs_get_fifo_frame_count(struct vc4_hvs *hvs, unsigned int fifo)
 	u8 field = 0;
 	int idx;
 
+	WARN_ON_ONCE(vc4->gen > VC4_GEN_6_D);
+
 	if (!drm_dev_enter(drm, &idx))
 		return 0;
 
@@ -530,6 +535,8 @@ int vc4_hvs_get_fifo_from_output(struct vc4_hvs *hvs, unsigned int output)
 	u32 reg;
 	int ret;
 
+	WARN_ON_ONCE(vc4->gen > VC4_GEN_6_D);
+
 	switch (vc4->gen) {
 	case VC4_GEN_4:
 		return output;
@@ -621,6 +628,8 @@ static int vc4_hvs_init_channel(struct vc4_hvs *hvs, struct drm_crtc *crtc,
 	u32 dispctrl;
 	int idx;
 
+	WARN_ON_ONCE(vc4->gen > VC4_GEN_5);
+
 	if (!drm_dev_enter(drm, &idx))
 		return -ENODEV;
 
@@ -682,6 +691,8 @@ static int vc6_hvs_init_channel(struct vc4_hvs *hvs, struct drm_crtc *crtc,
 	u32 disp_ctrl1;
 	int idx;
 
+	WARN_ON_ONCE(vc4->gen < VC4_GEN_6_C);
+
 	if (!drm_dev_enter(drm, &idx))
 		return -ENODEV;
 
@@ -707,9 +718,12 @@ static int vc6_hvs_init_channel(struct vc4_hvs *hvs, struct drm_crtc *crtc,
 
 static void __vc4_hvs_stop_channel(struct vc4_hvs *hvs, unsigned int chan)
 {
-	struct drm_device *drm = &hvs->vc4->base;
+	struct vc4_dev *vc4 = hvs->vc4;
+	struct drm_device *drm = &vc4->base;
 	int idx;
 
+	WARN_ON_ONCE(vc4->gen > VC4_GEN_5);
+
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
@@ -740,6 +754,8 @@ static void __vc6_hvs_stop_channel(struct vc4_hvs *hvs, unsigned int chan)
 	struct drm_device *drm = &vc4->base;
 	int idx;
 
+	WARN_ON_ONCE(vc4->gen < VC4_GEN_6_C);
+
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
@@ -927,6 +943,8 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 	bool found = false;
 	int idx;
 
+	WARN_ON_ONCE(vc4->gen > VC4_GEN_6_D);
+
 	if (!drm_dev_enter(dev, &idx)) {
 		vc4_crtc_send_vblank(crtc);
 		return;
@@ -1011,6 +1029,8 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 	if (crtc->state->color_mgmt_changed) {
 		u32 dispbkgndx = HVS_READ(SCALER_DISPBKGNDX(channel));
 
+		WARN_ON_ONCE(vc4->gen > VC4_GEN_5);
+
 		if (crtc->state->gamma_lut) {
 			vc4_hvs_update_gamma_lut(hvs, vc4_crtc);
 			dispbkgndx |= SCALER_DISPBKGND_GAMMA;
@@ -1040,6 +1060,8 @@ void vc4_hvs_mask_underrun(struct vc4_hvs *hvs, int channel)
 	u32 dispctrl;
 	int idx;
 
+	WARN_ON(vc4->gen > VC4_GEN_5);
+
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
@@ -1060,6 +1082,8 @@ void vc4_hvs_unmask_underrun(struct vc4_hvs *hvs, int channel)
 	u32 dispctrl;
 	int idx;
 
+	WARN_ON(vc4->gen > VC4_GEN_5);
+
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
@@ -1094,6 +1118,8 @@ static irqreturn_t vc4_hvs_irq_handler(int irq, void *data)
 	u32 status;
 	u32 dspeislur;
 
+	WARN_ON(vc4->gen > VC4_GEN_5);
+
 	/*
 	 * NOTE: We don't need to protect the register access using
 	 * drm_dev_enter() there because the interrupt handler lifetime
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index ce1154c463ef..3f241b15e8be 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -138,6 +138,8 @@ vc4_ctm_commit(struct vc4_dev *vc4, struct drm_atomic_state *state)
 	struct vc4_ctm_state *ctm_state = to_vc4_ctm_state(vc4->ctm_manager.state);
 	struct drm_color_ctm *ctm = ctm_state->ctm;
 
+	WARN_ON_ONCE(vc4->gen > VC4_GEN_5);
+
 	if (ctm_state->fifo) {
 		HVS_WRITE(SCALER_OLEDCOEF2,
 			  VC4_SET_FIELD(vc4_ctm_s31_32_to_s0_9(ctm->matrix[0]),
@@ -213,6 +215,8 @@ static void vc4_hvs_pv_muxing_commit(struct vc4_dev *vc4,
 	struct drm_crtc *crtc;
 	unsigned int i;
 
+	WARN_ON_ONCE(vc4->gen != VC4_GEN_4);
+
 	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
 		struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 		struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc_state);
@@ -256,6 +260,8 @@ static void vc5_hvs_pv_muxing_commit(struct vc4_dev *vc4,
 	unsigned int i;
 	u32 reg;
 
+	WARN_ON_ONCE(vc4->gen != VC4_GEN_5);
+
 	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
 		struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc_state);
 		struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 205aea3ed419..c084967d3527 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -566,8 +566,11 @@ static int vc4_plane_setup_clipping_and_scaling(struct drm_plane_state *state)
 
 static void vc4_write_tpz(struct vc4_plane_state *vc4_state, u32 src, u32 dst)
 {
+	struct vc4_dev *vc4 = to_vc4_dev(vc4_state->base.plane->dev);
 	u32 scale, recip;
 
+	WARN_ON_ONCE(vc4->gen > VC4_GEN_6_D);
+
 	scale = src / dst;
 
 	/* The specs note that while the reciprocal would be defined
@@ -593,10 +596,13 @@ static void vc4_write_tpz(struct vc4_plane_state *vc4_state, u32 src, u32 dst)
 static void vc4_write_ppf(struct vc4_plane_state *vc4_state, u32 src, u32 dst,
 			  u32 xy, int channel)
 {
+	struct vc4_dev *vc4 = to_vc4_dev(vc4_state->base.plane->dev);
 	u32 scale = src / dst;
 	s32 offset, offset2;
 	s32 phase;
 
+	WARN_ON_ONCE(vc4->gen > VC4_GEN_6_D);
+
 	/*
 	 * Start the phase at 1/2 pixel from the 1st pixel at src_x.
 	 * 1/4 pixel for YUV.
@@ -825,8 +831,11 @@ static size_t vc6_upm_size(const struct drm_plane_state *state,
 static void vc4_write_scaling_parameters(struct drm_plane_state *state,
 					 int channel)
 {
+	struct vc4_dev *vc4 = to_vc4_dev(state->plane->dev);
 	struct vc4_plane_state *vc4_state = to_vc4_plane_state(state);
 
+	WARN_ON_ONCE(vc4->gen > VC4_GEN_6_D);
+
 	/* Ch0 H-PPF Word 0: Scaling Parameters */
 	if (vc4_state->x_scaling[channel] == VC4_SCALING_PPF) {
 		vc4_write_ppf(vc4_state, vc4_state->src_w[channel],
@@ -1113,6 +1122,11 @@ static const u32 colorspace_coeffs[2][DRM_COLOR_ENCODING_MAX][3] = {
 
 static u32 vc4_hvs4_get_alpha_blend_mode(struct drm_plane_state *state)
 {
+	struct drm_device *dev = state->state->dev;
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
+
+	WARN_ON_ONCE(vc4->gen != VC4_GEN_4);
+
 	if (!state->fb->format->has_alpha)
 		return VC4_SET_FIELD(SCALER_POS2_ALPHA_MODE_FIXED,
 				     SCALER_POS2_ALPHA_MODE);
@@ -1137,6 +1151,9 @@ static u32 vc4_hvs5_get_alpha_blend_mode(struct drm_plane_state *state)
 	struct drm_device *dev = state->state->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 
+	WARN_ON_ONCE(vc4->gen != VC4_GEN_5 && vc4->gen != VC4_GEN_6_C &&
+		     vc4->gen != VC4_GEN_6_D);
+
 	switch (vc4->gen) {
 	default:
 	case VC4_GEN_5:

-- 
2.34.1


