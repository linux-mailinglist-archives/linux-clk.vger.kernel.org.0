Return-Path: <linux-clk+bounces-17212-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BB6A15CCE
	for <lists+linux-clk@lfdr.de>; Sat, 18 Jan 2025 13:41:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A367162A91
	for <lists+linux-clk@lfdr.de>; Sat, 18 Jan 2025 12:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF320198E65;
	Sat, 18 Jan 2025 12:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="r3VW1Oz/"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C4F18FDC2
	for <linux-clk@vger.kernel.org>; Sat, 18 Jan 2025 12:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737204062; cv=none; b=elwEzFK9mvyEF15kCtGn5Gy6jHZT3msj22/o/oR2+6dxMkjnX5cp7w9RH6Y2RoyRfQm/OUuMtTKOzT0SBXQ/87Gxdnh536omUrtRwzru1L9wUwH86I32T+aBUTZmYKtsdQeQcqCsYHq28CbShxSuUbN8hR4ePyUnSWRV9XZ/4+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737204062; c=relaxed/simple;
	bh=awl6YwE5UVjc3KUbwMt94afSEc7QEcOUZKoHgRnGp2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LiLOrtNUG9P067EaQXFeXAUKH+Fw1HTFeSiQLbNEi5hgvU4Lx2lAx/LNtJv//RtAIBH4quJA/HM0OLYvC45MDxAK3jZeeeIB/E47FN5m7lQqj0csLD8JaJehzKhAWEYg8nJFnmD8Iv9iYUDREy1EApRAkwVeuSAKlGk4FoJzY0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=r3VW1Oz/; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5db6921ad3dso5061011a12.2
        for <linux-clk@vger.kernel.org>; Sat, 18 Jan 2025 04:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737204057; x=1737808857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXAgzqp6YN1DpD4nDAOaVXpHZiShYKGqmKOr0HW9Cag=;
        b=r3VW1Oz/x8gdceXWMyBPM2xZ4qPC2yvyqn5TB59YzMtOFX2ooUIrPIX3zsWq5WriU0
         KbNKFdvXHOEes9FQMTL9ztpBsjXoowUS6vQrKXZ5N59puYQ4ftZVkVjF2Z/QxKa3f+DY
         vsKDOVbnHOscmm/TBAPh8H8Lk0I4VZkt0VGOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737204057; x=1737808857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kXAgzqp6YN1DpD4nDAOaVXpHZiShYKGqmKOr0HW9Cag=;
        b=lKW/2ubZMORFH3zw7WTzVXV8g6CXjdoCKyB1Zuezbkt5GD9281W217pWhffGae4WiR
         JCVURjkoInLPkfAOa5vbG3M5M5MV3k8PL39CaYGwqMTQNk/rNPSsGBg6FVUQpRTppxBD
         ucrQgLqCcMrElstEvrX4KRZ+8dvDbLSnmPelSttZmwW/xj0dbOQGLT4S9qxvL6pxWXFq
         0RSw89XF9uHZJvJYZenjnkI/f4w5QmqauGxReWLgTg0Trk6gAsRCmcd/dtOj39DILzvu
         EGX5Iv4w/dKfOs9wy5OXaJfEtmttngbEu5Vt0mkFRKo6JDdhVrFhNf9dGJhenI8/Hz4m
         rg9A==
X-Forwarded-Encrypted: i=1; AJvYcCX9TyJlvMpJzGnA/crg+9QUdzDuQmRncSEl2sC7HCeAqB0hEKi5C3/3dDdwX1duvIKkdcYViquo/T8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwP6E6+kxPoZjg9vdoubPXZuN0bMpJIuCW2ghpJbm1lBobgL3zW
	ou+AXVu9j+xZjHzpurm5gZKKCQet89U4LV5NsiWSjO/tiudxU0s+sAXI9Y9vnYI=
X-Gm-Gg: ASbGnct5HzIh4X2pm33s8nmHjlXgucyevgr7BR1H0o6smTIInnHXHJ2sUtAoSxDHRxc
	xgrq0q+xdiy/nPWN7W/Rhhgao5AKIzM7lc4Su1qaw95dbVb0tqmNVu/0brerMTuk1xj2j1ttZeb
	mhNUWSb7X0qTI0Tz9mcVC1ApSG+N+peEnqJk3dUSwi7j3DQdjY8SOGvtxPMlC8DV++iEgaiKklC
	3DJPNrH3fZ/Nm7o5EUyeZMO9DOBYygtcHcLGSrLNBXoE2IQm8cZke7INLayKnD88vg+SahJ/Z0E
	I/xxrHIAtIKYTMpeHlgnrX/tdTwwssK2nelFhJUAC2eVM6Xf9J2Xl3u6uLovrz0GQpPeHgN70GA
	MT/aryi/FOlW35lL5i2QEbiLIBkl8B7VdKI1g
X-Google-Smtp-Source: AGHT+IEYTcBHn1pOrsctnZppGmBS2FGUX7+eHnJI1KxeJ2zy2G+iEm2miE77t/oAa9gJ02qJ30Nzlw==
X-Received: by 2002:a17:907:3f23:b0:ab3:f88:b54e with SMTP id a640c23a62f3a-ab38b2e71e0mr536034366b.31.1737204056983;
        Sat, 18 Jan 2025 04:40:56 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-30-28-209.retail.telecomitalia.it. [79.30.28.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd73dsm332562366b.178.2025.01.18.04.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:40:56 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Peng Fan <peng.fan@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v9 02/23] clk: imx8mm: rename video_pll1 to video_pll
Date: Sat, 18 Jan 2025 13:39:45 +0100
Message-ID: <20250118124044.157308-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
References: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unlike audio_pll1 and audio_pll2, there is no video_pll2. Further, the
name used in the RM is video_pll. So, let's rename "video_pll1" to
"video_pll" to be consistent with the RM and avoid misunderstandings.

No functional changes intended.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>

---
The patch, which simply replaces video_pll1 with video_pll, highlights
many warnings raised by checkpatch.pl. These are not generated by the
changes made but are inherited from how the module was originally
written. Fixing them would have meant "obscuring" the actual changes
introduced.

(no changes since v7)

Changes in v7:
- Add 'Reviewed-by' tag of Peng Fan

Changes in v5:
- Split the patch dropping the dt-bindings changes.

Changes in v4:
- New

 drivers/clk/imx/clk-imx8mm.c | 102 +++++++++++++++++------------------
 1 file changed, 51 insertions(+), 51 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
index 342049b847b9..8a1fc7e17ba2 100644
--- a/drivers/clk/imx/clk-imx8mm.c
+++ b/drivers/clk/imx/clk-imx8mm.c
@@ -28,7 +28,7 @@ static u32 share_count_nand;
 static const char *pll_ref_sels[] = { "osc_24m", "dummy", "dummy", "dummy", };
 static const char *audio_pll1_bypass_sels[] = {"audio_pll1", "audio_pll1_ref_sel", };
 static const char *audio_pll2_bypass_sels[] = {"audio_pll2", "audio_pll2_ref_sel", };
-static const char *video_pll1_bypass_sels[] = {"video_pll1", "video_pll1_ref_sel", };
+static const char *video_pll_bypass_sels[] = {"video_pll", "video_pll_ref_sel", };
 static const char *dram_pll_bypass_sels[] = {"dram_pll", "dram_pll_ref_sel", };
 static const char *gpu_pll_bypass_sels[] = {"gpu_pll", "gpu_pll_ref_sel", };
 static const char *vpu_pll_bypass_sels[] = {"vpu_pll", "vpu_pll_ref_sel", };
@@ -42,22 +42,22 @@ static const char *imx8mm_a53_sels[] = {"osc_24m", "arm_pll_out", "sys_pll2_500m
 static const char * const imx8mm_a53_core_sels[] = {"arm_a53_div", "arm_pll_out", };
 
 static const char *imx8mm_m4_sels[] = {"osc_24m", "sys_pll2_200m", "sys_pll2_250m", "sys_pll1_266m",
-				       "sys_pll1_800m", "audio_pll1_out", "video_pll1_out", "sys_pll3_out", };
+				       "sys_pll1_800m", "audio_pll1_out", "video_pll_out", "sys_pll3_out", };
 
 static const char *imx8mm_vpu_sels[] = {"osc_24m", "arm_pll_out", "sys_pll2_500m", "sys_pll2_1000m",
 					"sys_pll1_800m", "sys_pll1_400m", "audio_pll1_out", "vpu_pll_out", };
 
 static const char *imx8mm_gpu3d_sels[] = {"osc_24m", "gpu_pll_out", "sys_pll1_800m", "sys_pll3_out",
-					  "sys_pll2_1000m", "audio_pll1_out", "video_pll1_out", "audio_pll2_out", };
+					  "sys_pll2_1000m", "audio_pll1_out", "video_pll_out", "audio_pll2_out", };
 
 static const char *imx8mm_gpu2d_sels[] = {"osc_24m", "gpu_pll_out", "sys_pll1_800m", "sys_pll3_out",
-					  "sys_pll2_1000m", "audio_pll1_out", "video_pll1_out", "audio_pll2_out", };
+					  "sys_pll2_1000m", "audio_pll1_out", "video_pll_out", "audio_pll2_out", };
 
 static const char *imx8mm_main_axi_sels[] = {"osc_24m", "sys_pll2_333m", "sys_pll1_800m", "sys_pll2_250m",
-					     "sys_pll2_1000m", "audio_pll1_out", "video_pll1_out", "sys_pll1_100m",};
+					     "sys_pll2_1000m", "audio_pll1_out", "video_pll_out", "sys_pll1_100m",};
 
 static const char *imx8mm_enet_axi_sels[] = {"osc_24m", "sys_pll1_266m", "sys_pll1_800m", "sys_pll2_250m",
-					     "sys_pll2_200m", "audio_pll1_out", "video_pll1_out", "sys_pll3_out", };
+					     "sys_pll2_200m", "audio_pll1_out", "video_pll_out", "sys_pll3_out", };
 
 static const char *imx8mm_nand_usdhc_sels[] = {"osc_24m", "sys_pll1_266m", "sys_pll1_800m", "sys_pll2_200m",
 					       "sys_pll1_133m", "sys_pll3_out", "sys_pll2_250m", "audio_pll1_out", };
@@ -72,28 +72,28 @@ static const char *imx8mm_disp_apb_sels[] = {"osc_24m", "sys_pll2_125m", "sys_pl
 					     "sys_pll1_40m", "audio_pll2_out", "clk_ext1", "clk_ext3", };
 
 static const char *imx8mm_disp_rtrm_sels[] = {"osc_24m", "sys_pll1_800m", "sys_pll2_200m", "sys_pll2_1000m",
-					      "audio_pll1_out", "video_pll1_out", "clk_ext2", "clk_ext3", };
+					      "audio_pll1_out", "video_pll_out", "clk_ext2", "clk_ext3", };
 
 static const char *imx8mm_usb_bus_sels[] = {"osc_24m", "sys_pll2_500m", "sys_pll1_800m", "sys_pll2_100m",
 					    "sys_pll2_200m", "clk_ext2", "clk_ext4", "audio_pll2_out", };
 
 static const char *imx8mm_gpu_axi_sels[] = {"osc_24m", "sys_pll1_800m", "gpu_pll_out", "sys_pll3_out", "sys_pll2_1000m",
-					    "audio_pll1_out", "video_pll1_out", "audio_pll2_out", };
+					    "audio_pll1_out", "video_pll_out", "audio_pll2_out", };
 
 static const char *imx8mm_gpu_ahb_sels[] = {"osc_24m", "sys_pll1_800m", "gpu_pll_out", "sys_pll3_out", "sys_pll2_1000m",
-					    "audio_pll1_out", "video_pll1_out", "audio_pll2_out", };
+					    "audio_pll1_out", "video_pll_out", "audio_pll2_out", };
 
 static const char *imx8mm_noc_sels[] = {"osc_24m", "sys_pll1_800m", "sys_pll3_out", "sys_pll2_1000m", "sys_pll2_500m",
-					"audio_pll1_out", "video_pll1_out", "audio_pll2_out", };
+					"audio_pll1_out", "video_pll_out", "audio_pll2_out", };
 
 static const char *imx8mm_noc_apb_sels[] = {"osc_24m", "sys_pll1_400m", "sys_pll3_out", "sys_pll2_333m", "sys_pll2_200m",
-					    "sys_pll1_800m", "audio_pll1_out", "video_pll1_out", };
+					    "sys_pll1_800m", "audio_pll1_out", "video_pll_out", };
 
 static const char *imx8mm_ahb_sels[] = {"osc_24m", "sys_pll1_133m", "sys_pll1_800m", "sys_pll1_400m",
-					"sys_pll2_125m", "sys_pll3_out", "audio_pll1_out", "video_pll1_out", };
+					"sys_pll2_125m", "sys_pll3_out", "audio_pll1_out", "video_pll_out", };
 
 static const char *imx8mm_audio_ahb_sels[] = {"osc_24m", "sys_pll2_500m", "sys_pll1_800m", "sys_pll2_1000m",
-					      "sys_pll2_166m", "sys_pll3_out", "audio_pll1_out", "video_pll1_out", };
+					      "sys_pll2_166m", "sys_pll3_out", "audio_pll1_out", "video_pll_out", };
 
 static const char *imx8mm_dram_alt_sels[] = {"osc_24m", "sys_pll1_800m", "sys_pll1_100m", "sys_pll2_500m",
 					     "sys_pll2_1000m", "sys_pll3_out", "audio_pll1_out", "sys_pll1_266m", };
@@ -108,10 +108,10 @@ static const char *imx8mm_vpu_g2_sels[] = {"osc_24m", "vpu_pll_out", "sys_pll1_8
 					   "sys_pll1_100m", "sys_pll2_125m", "sys_pll3_out", "audio_pll1_out", };
 
 static const char *imx8mm_disp_dtrc_sels[] = {"osc_24m", "dummy", "sys_pll1_800m", "sys_pll2_1000m",
-					      "sys_pll1_160m", "video_pll1_out", "sys_pll3_out", "audio_pll2_out", };
+					      "sys_pll1_160m", "video_pll_out", "sys_pll3_out", "audio_pll2_out", };
 
 static const char *imx8mm_disp_dc8000_sels[] = {"osc_24m", "dummy", "sys_pll1_800m", "sys_pll2_1000m",
-						"sys_pll1_160m", "video_pll1_out", "sys_pll3_out", "audio_pll2_out", };
+						"sys_pll1_160m", "video_pll_out", "sys_pll3_out", "audio_pll2_out", };
 
 static const char *imx8mm_pcie1_ctrl_sels[] = {"osc_24m", "sys_pll2_250m", "sys_pll2_200m", "sys_pll1_266m",
 					       "sys_pll1_800m", "sys_pll2_500m", "sys_pll2_333m", "sys_pll3_out", };
@@ -122,47 +122,47 @@ static const char *imx8mm_pcie1_phy_sels[] = {"osc_24m", "sys_pll2_100m", "sys_p
 static const char *imx8mm_pcie1_aux_sels[] = {"osc_24m", "sys_pll2_200m", "sys_pll2_50m", "sys_pll3_out",
 					      "sys_pll2_100m", "sys_pll1_80m", "sys_pll1_160m", "sys_pll1_200m", };
 
-static const char *imx8mm_dc_pixel_sels[] = {"osc_24m", "video_pll1_out", "audio_pll2_out", "audio_pll1_out",
+static const char *imx8mm_dc_pixel_sels[] = {"osc_24m", "video_pll_out", "audio_pll2_out", "audio_pll1_out",
 					     "sys_pll1_800m", "sys_pll2_1000m", "sys_pll3_out", "clk_ext4", };
 
-static const char *imx8mm_lcdif_pixel_sels[] = {"osc_24m", "video_pll1_out", "audio_pll2_out", "audio_pll1_out",
+static const char *imx8mm_lcdif_pixel_sels[] = {"osc_24m", "video_pll_out", "audio_pll2_out", "audio_pll1_out",
 						"sys_pll1_800m", "sys_pll2_1000m", "sys_pll3_out", "clk_ext4", };
 
-static const char *imx8mm_sai1_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll1_out",
+static const char *imx8mm_sai1_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll_out",
 					 "sys_pll1_133m", "osc_hdmi", "clk_ext1", "clk_ext2", };
 
-static const char *imx8mm_sai2_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll1_out",
+static const char *imx8mm_sai2_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll_out",
 					 "sys_pll1_133m", "osc_hdmi", "clk_ext2", "clk_ext3", };
 
-static const char *imx8mm_sai3_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll1_out",
+static const char *imx8mm_sai3_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll_out",
 					 "sys_pll1_133m", "osc_hdmi", "clk_ext3", "clk_ext4", };
 
-static const char *imx8mm_sai4_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll1_out",
+static const char *imx8mm_sai4_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll_out",
 					 "sys_pll1_133m", "osc_hdmi", "clk_ext1", "clk_ext2", };
 
-static const char *imx8mm_sai5_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll1_out",
+static const char *imx8mm_sai5_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll_out",
 					 "sys_pll1_133m", "osc_hdmi", "clk_ext2", "clk_ext3", };
 
-static const char *imx8mm_sai6_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll1_out",
+static const char *imx8mm_sai6_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll_out",
 					 "sys_pll1_133m", "osc_hdmi", "clk_ext3", "clk_ext4", };
 
-static const char *imx8mm_spdif1_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll1_out",
+static const char *imx8mm_spdif1_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll_out",
 					   "sys_pll1_133m", "osc_hdmi", "clk_ext2", "clk_ext3", };
 
-static const char *imx8mm_spdif2_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll1_out",
+static const char *imx8mm_spdif2_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out", "video_pll_out",
 					   "sys_pll1_133m", "osc_hdmi", "clk_ext3", "clk_ext4", };
 
 static const char *imx8mm_enet_ref_sels[] = {"osc_24m", "sys_pll2_125m", "sys_pll2_50m", "sys_pll2_100m",
-					     "sys_pll1_160m", "audio_pll1_out", "video_pll1_out", "clk_ext4", };
+					     "sys_pll1_160m", "audio_pll1_out", "video_pll_out", "clk_ext4", };
 
 static const char *imx8mm_enet_timer_sels[] = {"osc_24m", "sys_pll2_100m", "audio_pll1_out", "clk_ext1", "clk_ext2",
-					       "clk_ext3", "clk_ext4", "video_pll1_out", };
+					       "clk_ext3", "clk_ext4", "video_pll_out", };
 
 static const char *imx8mm_enet_phy_sels[] = {"osc_24m", "sys_pll2_50m", "sys_pll2_125m", "sys_pll2_200m",
-					     "sys_pll2_500m", "video_pll1_out", "audio_pll2_out", };
+					     "sys_pll2_500m", "video_pll_out", "audio_pll2_out", };
 
 static const char *imx8mm_nand_sels[] = {"osc_24m", "sys_pll2_500m", "audio_pll1_out", "sys_pll1_400m",
-					 "audio_pll2_out", "sys_pll3_out", "sys_pll2_250m", "video_pll1_out", };
+					 "audio_pll2_out", "sys_pll3_out", "sys_pll2_250m", "video_pll_out", };
 
 static const char *imx8mm_qspi_sels[] = {"osc_24m", "sys_pll1_400m", "sys_pll2_333m", "sys_pll2_500m",
 					 "audio_pll2_out", "sys_pll1_266m", "sys_pll3_out", "sys_pll1_100m", };
@@ -174,16 +174,16 @@ static const char *imx8mm_usdhc2_sels[] = {"osc_24m", "sys_pll1_400m", "sys_pll1
 					   "sys_pll3_out", "sys_pll1_266m", "audio_pll2_out", "sys_pll1_100m", };
 
 static const char *imx8mm_i2c1_sels[] = {"osc_24m", "sys_pll1_160m", "sys_pll2_50m", "sys_pll3_out", "audio_pll1_out",
-					 "video_pll1_out", "audio_pll2_out", "sys_pll1_133m", };
+					 "video_pll_out", "audio_pll2_out", "sys_pll1_133m", };
 
 static const char *imx8mm_i2c2_sels[] = {"osc_24m", "sys_pll1_160m", "sys_pll2_50m", "sys_pll3_out", "audio_pll1_out",
-					 "video_pll1_out", "audio_pll2_out", "sys_pll1_133m", };
+					 "video_pll_out", "audio_pll2_out", "sys_pll1_133m", };
 
 static const char *imx8mm_i2c3_sels[] = {"osc_24m", "sys_pll1_160m", "sys_pll2_50m", "sys_pll3_out", "audio_pll1_out",
-					 "video_pll1_out", "audio_pll2_out", "sys_pll1_133m", };
+					 "video_pll_out", "audio_pll2_out", "sys_pll1_133m", };
 
 static const char *imx8mm_i2c4_sels[] = {"osc_24m", "sys_pll1_160m", "sys_pll2_50m", "sys_pll3_out", "audio_pll1_out",
-					 "video_pll1_out", "audio_pll2_out", "sys_pll1_133m", };
+					 "video_pll_out", "audio_pll2_out", "sys_pll1_133m", };
 
 static const char *imx8mm_uart1_sels[] = {"osc_24m", "sys_pll1_80m", "sys_pll2_200m", "sys_pll2_100m",
 					  "sys_pll3_out", "clk_ext2", "clk_ext4", "audio_pll2_out", };
@@ -213,19 +213,19 @@ static const char *imx8mm_ecspi2_sels[] = {"osc_24m", "sys_pll2_200m", "sys_pll1
 					   "sys_pll1_800m", "sys_pll3_out", "sys_pll2_250m", "audio_pll2_out", };
 
 static const char *imx8mm_pwm1_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_160m", "sys_pll1_40m",
-					 "sys_pll3_out", "clk_ext1", "sys_pll1_80m", "video_pll1_out", };
+					 "sys_pll3_out", "clk_ext1", "sys_pll1_80m", "video_pll_out", };
 
 static const char *imx8mm_pwm2_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_160m", "sys_pll1_40m",
-					 "sys_pll3_out", "clk_ext1", "sys_pll1_80m", "video_pll1_out", };
+					 "sys_pll3_out", "clk_ext1", "sys_pll1_80m", "video_pll_out", };
 
 static const char *imx8mm_pwm3_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_160m", "sys_pll1_40m",
-					 "sys_pll3_out", "clk_ext2", "sys_pll1_80m", "video_pll1_out", };
+					 "sys_pll3_out", "clk_ext2", "sys_pll1_80m", "video_pll_out", };
 
 static const char *imx8mm_pwm4_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_160m", "sys_pll1_40m",
-					 "sys_pll3_out", "clk_ext2", "sys_pll1_80m", "video_pll1_out", };
+					 "sys_pll3_out", "clk_ext2", "sys_pll1_80m", "video_pll_out", };
 
 static const char *imx8mm_gpt1_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_400m", "sys_pll1_40m",
-					 "video_pll1_out", "sys_pll1_80m", "audio_pll1_out", "clk_ext1" };
+					 "video_pll_out", "sys_pll1_80m", "audio_pll1_out", "clk_ext1" };
 
 static const char *imx8mm_wdog_sels[] = {"osc_24m", "sys_pll1_133m", "sys_pll1_160m", "vpu_pll_out",
 					 "sys_pll2_125m", "sys_pll3_out", "sys_pll1_80m", "sys_pll2_166m", };
@@ -234,31 +234,31 @@ static const char *imx8mm_wrclk_sels[] = {"osc_24m", "sys_pll1_40m", "vpu_pll_ou
 					  "sys_pll1_266m", "sys_pll2_500m", "sys_pll1_100m", };
 
 static const char *imx8mm_dsi_core_sels[] = {"osc_24m", "sys_pll1_266m", "sys_pll2_250m", "sys_pll1_800m",
-					     "sys_pll2_1000m", "sys_pll3_out", "audio_pll2_out", "video_pll1_out", };
+					     "sys_pll2_1000m", "sys_pll3_out", "audio_pll2_out", "video_pll_out", };
 
 static const char *imx8mm_dsi_phy_sels[] = {"osc_24m", "sys_pll2_125m", "sys_pll2_100m", "sys_pll1_800m",
-					    "sys_pll2_1000m", "clk_ext2", "audio_pll2_out", "video_pll1_out", };
+					    "sys_pll2_1000m", "clk_ext2", "audio_pll2_out", "video_pll_out", };
 
 static const char *imx8mm_dsi_dbi_sels[] = {"osc_24m", "sys_pll1_266m", "sys_pll2_100m", "sys_pll1_800m",
-					    "sys_pll2_1000m", "sys_pll3_out", "audio_pll2_out", "video_pll1_out", };
+					    "sys_pll2_1000m", "sys_pll3_out", "audio_pll2_out", "video_pll_out", };
 
 static const char *imx8mm_usdhc3_sels[] = {"osc_24m", "sys_pll1_400m", "sys_pll1_800m", "sys_pll2_500m",
 					   "sys_pll3_out", "sys_pll1_266m", "audio_pll2_out", "sys_pll1_100m", };
 
 static const char *imx8mm_csi1_core_sels[] = {"osc_24m", "sys_pll1_266m", "sys_pll2_250m", "sys_pll1_800m",
-					      "sys_pll2_1000m", "sys_pll3_out", "audio_pll2_out", "video_pll1_out", };
+					      "sys_pll2_1000m", "sys_pll3_out", "audio_pll2_out", "video_pll_out", };
 
 static const char *imx8mm_csi1_phy_sels[] = {"osc_24m", "sys_pll2_333m", "sys_pll2_100m", "sys_pll1_800m",
-					     "sys_pll2_1000m", "clk_ext2", "audio_pll2_out", "video_pll1_out", };
+					     "sys_pll2_1000m", "clk_ext2", "audio_pll2_out", "video_pll_out", };
 
 static const char *imx8mm_csi1_esc_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_80m", "sys_pll1_800m",
 					     "sys_pll2_1000m", "sys_pll3_out", "clk_ext3", "audio_pll2_out", };
 
 static const char *imx8mm_csi2_core_sels[] = {"osc_24m", "sys_pll1_266m", "sys_pll2_250m", "sys_pll1_800m",
-					      "sys_pll2_1000m", "sys_pll3_out", "audio_pll2_out", "video_pll1_out", };
+					      "sys_pll2_1000m", "sys_pll3_out", "audio_pll2_out", "video_pll_out", };
 
 static const char *imx8mm_csi2_phy_sels[] = {"osc_24m", "sys_pll2_333m", "sys_pll2_100m", "sys_pll1_800m",
-					     "sys_pll2_1000m", "clk_ext2", "audio_pll2_out", "video_pll1_out", };
+					     "sys_pll2_1000m", "clk_ext2", "audio_pll2_out", "video_pll_out", };
 
 static const char *imx8mm_csi2_esc_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_80m", "sys_pll1_800m",
 					     "sys_pll2_1000m", "sys_pll3_out", "clk_ext3", "audio_pll2_out", };
@@ -286,9 +286,9 @@ static const char *imx8mm_dram_core_sels[] = {"dram_pll_out", "dram_alt_root", }
 static const char *imx8mm_clko1_sels[] = {"osc_24m", "sys_pll1_800m", "dummy", "sys_pll1_200m",
 					  "audio_pll2_out", "sys_pll2_500m", "vpu_pll", "sys_pll1_80m", };
 static const char *imx8mm_clko2_sels[] = {"osc_24m", "sys_pll2_200m", "sys_pll1_400m", "sys_pll2_166m",
-					  "sys_pll3_out", "audio_pll1_out", "video_pll1_out", "osc_32k", };
+					  "sys_pll3_out", "audio_pll1_out", "video_pll_out", "osc_32k", };
 
-static const char * const clkout_sels[] = {"audio_pll1_out", "audio_pll2_out", "video_pll1_out",
+static const char * const clkout_sels[] = {"audio_pll1_out", "audio_pll2_out", "video_pll_out",
 					   "dummy", "dummy", "gpu_pll_out", "vpu_pll_out",
 					   "arm_pll_out", "sys_pll1", "sys_pll2", "sys_pll3",
 					   "dummy", "dummy", "osc_24m", "dummy", "osc_32k"};
@@ -327,7 +327,7 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
 
 	hws[IMX8MM_AUDIO_PLL1_REF_SEL] = imx_clk_hw_mux("audio_pll1_ref_sel", base + 0x0, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
 	hws[IMX8MM_AUDIO_PLL2_REF_SEL] = imx_clk_hw_mux("audio_pll2_ref_sel", base + 0x14, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-	hws[IMX8MM_VIDEO_PLL1_REF_SEL] = imx_clk_hw_mux("video_pll1_ref_sel", base + 0x28, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	hws[IMX8MM_VIDEO_PLL_REF_SEL] = imx_clk_hw_mux("video_pll_ref_sel", base + 0x28, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
 	hws[IMX8MM_DRAM_PLL_REF_SEL] = imx_clk_hw_mux("dram_pll_ref_sel", base + 0x50, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
 	hws[IMX8MM_GPU_PLL_REF_SEL] = imx_clk_hw_mux("gpu_pll_ref_sel", base + 0x64, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
 	hws[IMX8MM_VPU_PLL_REF_SEL] = imx_clk_hw_mux("vpu_pll_ref_sel", base + 0x74, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
@@ -336,7 +336,7 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
 
 	hws[IMX8MM_AUDIO_PLL1] = imx_clk_hw_pll14xx("audio_pll1", "audio_pll1_ref_sel", base, &imx_1443x_pll);
 	hws[IMX8MM_AUDIO_PLL2] = imx_clk_hw_pll14xx("audio_pll2", "audio_pll2_ref_sel", base + 0x14, &imx_1443x_pll);
-	hws[IMX8MM_VIDEO_PLL1] = imx_clk_hw_pll14xx("video_pll1", "video_pll1_ref_sel", base + 0x28, &imx_1443x_pll);
+	hws[IMX8MM_VIDEO_PLL] = imx_clk_hw_pll14xx("video_pll", "video_pll_ref_sel", base + 0x28, &imx_1443x_pll);
 	hws[IMX8MM_DRAM_PLL] = imx_clk_hw_pll14xx("dram_pll", "dram_pll_ref_sel", base + 0x50, &imx_1443x_dram_pll);
 	hws[IMX8MM_GPU_PLL] = imx_clk_hw_pll14xx("gpu_pll", "gpu_pll_ref_sel", base + 0x64, &imx_1416x_pll);
 	hws[IMX8MM_VPU_PLL] = imx_clk_hw_pll14xx("vpu_pll", "vpu_pll_ref_sel", base + 0x74, &imx_1416x_pll);
@@ -348,7 +348,7 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
 	/* PLL bypass out */
 	hws[IMX8MM_AUDIO_PLL1_BYPASS] = imx_clk_hw_mux_flags("audio_pll1_bypass", base, 16, 1, audio_pll1_bypass_sels, ARRAY_SIZE(audio_pll1_bypass_sels), CLK_SET_RATE_PARENT);
 	hws[IMX8MM_AUDIO_PLL2_BYPASS] = imx_clk_hw_mux_flags("audio_pll2_bypass", base + 0x14, 16, 1, audio_pll2_bypass_sels, ARRAY_SIZE(audio_pll2_bypass_sels), CLK_SET_RATE_PARENT);
-	hws[IMX8MM_VIDEO_PLL1_BYPASS] = imx_clk_hw_mux_flags("video_pll1_bypass", base + 0x28, 16, 1, video_pll1_bypass_sels, ARRAY_SIZE(video_pll1_bypass_sels), CLK_SET_RATE_PARENT);
+	hws[IMX8MM_VIDEO_PLL_BYPASS] = imx_clk_hw_mux_flags("video_pll_bypass", base + 0x28, 16, 1, video_pll_bypass_sels, ARRAY_SIZE(video_pll_bypass_sels), CLK_SET_RATE_PARENT);
 	hws[IMX8MM_DRAM_PLL_BYPASS] = imx_clk_hw_mux_flags("dram_pll_bypass", base + 0x50, 16, 1, dram_pll_bypass_sels, ARRAY_SIZE(dram_pll_bypass_sels), CLK_SET_RATE_PARENT);
 	hws[IMX8MM_GPU_PLL_BYPASS] = imx_clk_hw_mux_flags("gpu_pll_bypass", base + 0x64, 28, 1, gpu_pll_bypass_sels, ARRAY_SIZE(gpu_pll_bypass_sels), CLK_SET_RATE_PARENT);
 	hws[IMX8MM_VPU_PLL_BYPASS] = imx_clk_hw_mux_flags("vpu_pll_bypass", base + 0x74, 28, 1, vpu_pll_bypass_sels, ARRAY_SIZE(vpu_pll_bypass_sels), CLK_SET_RATE_PARENT);
@@ -358,7 +358,7 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
 	/* PLL out gate */
 	hws[IMX8MM_AUDIO_PLL1_OUT] = imx_clk_hw_gate("audio_pll1_out", "audio_pll1_bypass", base, 13);
 	hws[IMX8MM_AUDIO_PLL2_OUT] = imx_clk_hw_gate("audio_pll2_out", "audio_pll2_bypass", base + 0x14, 13);
-	hws[IMX8MM_VIDEO_PLL1_OUT] = imx_clk_hw_gate("video_pll1_out", "video_pll1_bypass", base + 0x28, 13);
+	hws[IMX8MM_VIDEO_PLL_OUT] = imx_clk_hw_gate("video_pll_out", "video_pll_bypass", base + 0x28, 13);
 	hws[IMX8MM_DRAM_PLL_OUT] = imx_clk_hw_gate("dram_pll_out", "dram_pll_bypass", base + 0x50, 13);
 	hws[IMX8MM_GPU_PLL_OUT] = imx_clk_hw_gate("gpu_pll_out", "gpu_pll_bypass", base + 0x64, 11);
 	hws[IMX8MM_VPU_PLL_OUT] = imx_clk_hw_gate("vpu_pll_out", "vpu_pll_bypass", base + 0x74, 11);
-- 
2.43.0


