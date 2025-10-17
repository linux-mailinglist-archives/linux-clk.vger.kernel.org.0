Return-Path: <linux-clk+bounces-29269-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 60526BE9502
	for <lists+linux-clk@lfdr.de>; Fri, 17 Oct 2025 16:49:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D6FF735BC3A
	for <lists+linux-clk@lfdr.de>; Fri, 17 Oct 2025 14:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04D38330317;
	Fri, 17 Oct 2025 14:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ZiLm0CVA";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="MD4O4tSs"
X-Original-To: linux-clk@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F60330334;
	Fri, 17 Oct 2025 14:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760712418; cv=none; b=PyZPQOqxObVCW1NXeiexEE5sulxtzjBue+IBIIRHfVZUGT/f+hDuXCUzSy2+x6ImGc8eqQjpN5XPFXT8xodLRlu8rDTOWDQnqQFvP0uMlGAq/UADQEfVZAuXwV6EJjlmSVStyaGAa3Lj7YNLGHifdMAqvGE++3BqxslT90nbtFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760712418; c=relaxed/simple;
	bh=TKIxjcvbSsCOpgBxRy8NjNVAzNTY01P7OVvHYsHyFRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ulV4xdMklEq/GJ7Uq+uS1joF5lzotNN+qP7vqF12sZs2mzOdZSt6mYz2u6f6LFTptAG8iE9M9Pt8Am1tKWG6mSPQ+a8uCl6Jq4oqfJyP1gcaMrGg6j/Cjls7o0mUaMdiNRhkqYIESCnVXcfYDLp6PTR3gpdfTZYx2ec4IJhdUZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ZiLm0CVA; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=MD4O4tSs; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cp7204LNgz9tLN;
	Fri, 17 Oct 2025 16:46:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760712408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4oFpQxCRPHPhxmrzbDq11iN7OoUPx8eSZeteuoKy5SM=;
	b=ZiLm0CVARzNN0e7ngM74Xu6tJJPP0/NV9ed/rn0Ezsghcycamn4u81C2lO0uWC8nq+y0mt
	loyi2/4EBcnRVPiTNZQHRPUjHJqKnD/RSeCA6zLOkYQlgMrRXDhT5avU/y2+/AGyH4ZCua
	tDZ7mQ39sIUxYeWBXSJg1d0MMZo/UzJYHie8eWamuWUHpRScJiezcSVo21qj6UUvpnQ0VM
	v2v2S9S2DK1RRF4UVTAegGMJb0jEDgtZHD5whhDSvbkYBlxUtq7Y4lG8XSniGfaUALCJXc
	hsibFEn1oThEd3BrL92Vj5Xv45R/uqloQ/ANncWL/QyaaotbKCtwugqBqI/SKg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=MD4O4tSs;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760712406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4oFpQxCRPHPhxmrzbDq11iN7OoUPx8eSZeteuoKy5SM=;
	b=MD4O4tSslu4VlSY6X557bhCZg9XGb5jfB5TQiawNR3henZzMv4zqVsRN74XV+1BfKqnoDg
	lmQ6i94t5v6BdAlZPDAYjWrJ6uGJ7AcQZ4hB+wuaJUyHTN8nLrw1RcYnZjH2URhVK4gsx1
	vAImInPR3ik/5zMeYx035KwTY6yD6+50K8zevtW2DSndFRp/qpgrVmouEdKr8L6iaMXzpv
	jpcyXZa73XrP7R7DqGQc8kxvm11Zl5rBcCIAOtsT7wIwB/nr9JgrwW/BlJXvFHibi1cOb7
	tyAEpNJvWlML/zs3ifoKSiN6Nn5Yw5tR/A5V3Bo6Tc879O3nwuQhtW1u6MPotQ==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Liu Ying <victor.liu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH] drm/imx: Add more RGB swizzling options
Date: Fri, 17 Oct 2025 16:45:38 +0200
Message-ID: <20251017144626.66918-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 4pr7n6758hstwaphqgu7emsng5k8rkyg
X-MBO-RS-ID: fcef7ad647f09f2b715
X-Rspamd-Queue-Id: 4cp7204LNgz9tLN

Add additional buffer format swizzling options beyond XR24, the
hardware is capable of sampling other formats, fill them in.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
Liu, please test on MX8qxp , I do not have that hardware.
---
 drivers/gpu/drm/imx/dc/dc-fu.c    | 40 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-plane.c |  8 +++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/imx/dc/dc-fu.c b/drivers/gpu/drm/imx/dc/dc-fu.c
index 1d8f74babef8a..397af0e9b0236 100644
--- a/drivers/gpu/drm/imx/dc/dc-fu.c
+++ b/drivers/gpu/drm/imx/dc/dc-fu.c
@@ -65,6 +65,46 @@ static const struct dc_fu_pixel_format pixel_formats[] = {
 		DRM_FORMAT_XRGB8888,
 		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
 		R_SHIFT(16) | G_SHIFT(8)  | B_SHIFT(0)  | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_ARGB8888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(8),
+		R_SHIFT(16) | G_SHIFT(8)  | B_SHIFT(0)  | A_SHIFT(24),
+	}, {
+		DRM_FORMAT_ABGR8888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(8),
+		R_SHIFT(0)  | G_SHIFT(8)  | B_SHIFT(16) | A_SHIFT(24),
+	}, {
+		DRM_FORMAT_XBGR8888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
+		R_SHIFT(0)  | G_SHIFT(8)  | B_SHIFT(16) | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_RGBA8888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(8),
+		R_SHIFT(24) | G_SHIFT(16) | B_SHIFT(8)  | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_RGBX8888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
+		R_SHIFT(24) | G_SHIFT(16) | B_SHIFT(8)  | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_BGRA8888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(8),
+		R_SHIFT(8)  | G_SHIFT(16) | B_SHIFT(24) | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_BGRX8888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
+		R_SHIFT(8)  | G_SHIFT(16) | B_SHIFT(24) | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_RGB888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
+		R_SHIFT(16) | G_SHIFT(8)  | B_SHIFT(0)  | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_BGR888,
+		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
+		R_SHIFT(0)  | G_SHIFT(8)  | B_SHIFT(16) | A_SHIFT(0),
+	}, {
+		DRM_FORMAT_RGB565,
+		R_BITS(5)   | G_BITS(6)   | B_BITS(5)   | A_BITS(0),
+		R_SHIFT(11) | G_SHIFT(5)  | B_SHIFT(0)  | A_SHIFT(0),
 	},
 };
 
diff --git a/drivers/gpu/drm/imx/dc/dc-plane.c b/drivers/gpu/drm/imx/dc/dc-plane.c
index e40d5d66c5c1f..68d32b76fab95 100644
--- a/drivers/gpu/drm/imx/dc/dc-plane.c
+++ b/drivers/gpu/drm/imx/dc/dc-plane.c
@@ -33,6 +33,14 @@ do {									\
 
 static const uint32_t dc_plane_formats[] = {
 	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_RGB565,
 };
 
 static const struct drm_plane_funcs dc_plane_funcs = {
-- 
2.51.0


