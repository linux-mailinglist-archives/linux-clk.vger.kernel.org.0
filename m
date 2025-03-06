Return-Path: <linux-clk+bounces-19047-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 429B3A5495E
	for <lists+linux-clk@lfdr.de>; Thu,  6 Mar 2025 12:32:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 200541896772
	for <lists+linux-clk@lfdr.de>; Thu,  6 Mar 2025 11:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5786420DD74;
	Thu,  6 Mar 2025 11:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="dY3/e1fx"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4174A20ADC9
	for <linux-clk@vger.kernel.org>; Thu,  6 Mar 2025 11:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741260645; cv=none; b=lEEguNT2Ig5NA3FVckQ0aO0LlmB89HgtB8Z9uhiCwkzuR9eSAJ/wEinOJAQqADVtWLf6oFYDJcaa7g06NAfPQ8xHHMJnuauQAln3pk0QpZ0XVfKsZzevbLs9VOXJcw2I8rHzB6yZPCOUNId9rq5e9hqIkbUea7bZkB0sd3W1Hpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741260645; c=relaxed/simple;
	bh=RoRcZG5MwfdWXDjr23fgY0/h96ILwu7NjE0PJMAgxx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DuKo+OOEj1Gx59Wa0aF+TKhNxBtcJ6Yq9vRWma0fgccxKJyiCeEoZYSNJqmLo/2IsZDdQIy4KjlHFo1oTrLdC0HIkM/YMqtJvvSfV/ayzUT7GVXGgwEue8jyr6D8a7MEo9Ci1xybdao9GOf7ImtmOo2bvfBqUYD/y5UgV5ESr8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=dY3/e1fx; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-390e6ac844fso465701f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 06 Mar 2025 03:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1741260638; x=1741865438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXb0UQO64A3UF66ppJiI4VZlhjyxuWu1HQt3FGDUUXM=;
        b=dY3/e1fx7wKJkDtzsrrI3l18FbpFDQ08m1sZnGKwtESvgO8cWe4TRxjaobcL2KEnct
         FYvtkaFEpu3kTvJkF/eMo9k4v5nzkH6nABU90CIBsepL5c9EbIYdXI/r5IKtQWZhlzq3
         WFWBX82BMlNVbXRu6zmHSgnFm4+E/5EXy3o/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741260638; x=1741865438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AXb0UQO64A3UF66ppJiI4VZlhjyxuWu1HQt3FGDUUXM=;
        b=B2xm2sBpSKaVGKYs8qKlMGsKxMj3wlFl6Ooh4JKh6RkhKPW0pSYo3NaHA1IkeXC8SR
         qVSsMGNUzLYocF52sKGD/EDwl7m5fPs0xdwgQR9niBF4JzJfXvF+PlW4IRZz6zQLMc9l
         e9Y94MlkaAyeI/0jgwFxNad2zFXPMTf75UvaJYKgdGIsAVUjRKIOI80UIZl0kKRCObOK
         jO0GbKluf75GfOJNX5hbAgwPpUr2uDeun+PPxsM/MwpMJbsYXsZVIkhWWzvv4rebu3KX
         TNR7J6JJkE5rvNbh0UjPVuIFDPRCYnFy4DuJJAc5MazMd6Cclhe7SpqW1DhfZZWW8zpG
         Mn6w==
X-Forwarded-Encrypted: i=1; AJvYcCVYYCU27noCscshbbVtmMyyXT8MBmq+7lqfZbIh8o/mwxlDkWprsV7iLV8Jbzupk53cq5EJq6U55do=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAhaYdWm3k6doBJoZ3Y5ZT9NPBd+d5h7ep3TvMi9SEmfIGHApj
	IlUFt5zLgV3BfL80g9vAxcbBx1Yel8m3ryhUMvH6DHe1RrYIkvINyW/GM8F29XE=
X-Gm-Gg: ASbGnct1KSTJ0YHDs/6zNjZQi/UkwQHz9GqB0s334E59fFbsJx2/glBSNkPmaBCGabF
	kSC0Q4rXATN+tJDQ2yWiLARDcs/jaKn/0Jagcqyo7HmCj0M06LI60UBoxKDVkWOuoxmjtM6t61R
	z0AMSghykrVhTgWZGIXpTXrw1bBstD9AXeGEA60XNoaXs0TIOA2IVXKhZfLiwv7k7DQf1uFbEsN
	0NG53TyZOaR58qcZgs0ez+27A11dRQNSwr+AVDSRr0HKiwqzqPX6aYFUH5srd4sy/oh/tPwzKWP
	CJpo3OcTo+64r7i9Tk6I6Mnlwb0QUKp5bhCfJ17HEZwN3iUlmUxXBPCRAEObpLMosiCill7RqGN
	W7XmyrA==
X-Google-Smtp-Source: AGHT+IGpsqMkgKvIPNz5QrGs0XkSPXHqEXSKyCXRv6XZgZTNZmlEZzhlTkKcLd3v/a7junJHGDojJg==
X-Received: by 2002:a05:6000:1ac9:b0:390:de58:d7fe with SMTP id ffacd0b85a97d-3911f7d1074mr7101875f8f.51.1741260638275;
        Thu, 06 Mar 2025 03:30:38 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:4703:aa8c:6eab:8161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb79b9sm1749650f8f.3.2025.03.06.03.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:30:37 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v10 04/18] clk: imx8mp: rename video_pll1 to video_pll
Date: Thu,  6 Mar 2025 12:27:53 +0100
Message-ID: <20250306112959.242131-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
References: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
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

 drivers/clk/imx/clk-imx8mp.c | 118 +++++++++++++++++------------------
 1 file changed, 59 insertions(+), 59 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index fb18f507f121..063bf26453a0 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -23,7 +23,7 @@ static u32 share_count_audio;
 static const char * const pll_ref_sels[] = { "osc_24m", "dummy", "dummy", "dummy", };
 static const char * const audio_pll1_bypass_sels[] = {"audio_pll1", "audio_pll1_ref_sel", };
 static const char * const audio_pll2_bypass_sels[] = {"audio_pll2", "audio_pll2_ref_sel", };
-static const char * const video_pll1_bypass_sels[] = {"video_pll1", "video_pll1_ref_sel", };
+static const char * const video_pll_bypass_sels[] = {"video_pll", "video_pll_ref_sel", };
 static const char * const dram_pll_bypass_sels[] = {"dram_pll", "dram_pll_ref_sel", };
 static const char * const gpu_pll_bypass_sels[] = {"gpu_pll", "gpu_pll_ref_sel", };
 static const char * const vpu_pll_bypass_sels[] = {"vpu_pll", "vpu_pll_ref_sel", };
@@ -40,27 +40,27 @@ static const char * const imx8mp_a53_core_sels[] = {"arm_a53_div", "arm_pll_out"
 
 static const char * const imx8mp_m7_sels[] = {"osc_24m", "sys_pll2_200m", "sys_pll2_250m",
 					      "vpu_pll_out", "sys_pll1_800m", "audio_pll1_out",
-					      "video_pll1_out", "sys_pll3_out", };
+					      "video_pll_out", "sys_pll3_out", };
 
 static const char * const imx8mp_ml_sels[] = {"osc_24m", "gpu_pll_out", "sys_pll1_800m",
 					      "sys_pll3_out", "sys_pll2_1000m", "audio_pll1_out",
-					      "video_pll1_out", "audio_pll2_out", };
+					      "video_pll_out", "audio_pll2_out", };
 
 static const char * const imx8mp_gpu3d_core_sels[] = {"osc_24m", "gpu_pll_out", "sys_pll1_800m",
 						      "sys_pll3_out", "sys_pll2_1000m", "audio_pll1_out",
-						      "video_pll1_out", "audio_pll2_out", };
+						      "video_pll_out", "audio_pll2_out", };
 
 static const char * const imx8mp_gpu3d_shader_sels[] = {"osc_24m", "gpu_pll_out", "sys_pll1_800m",
 							"sys_pll3_out", "sys_pll2_1000m", "audio_pll1_out",
-							"video_pll1_out", "audio_pll2_out", };
+							"video_pll_out", "audio_pll2_out", };
 
 static const char * const imx8mp_gpu2d_sels[] = {"osc_24m", "gpu_pll_out", "sys_pll1_800m",
 						 "sys_pll3_out", "sys_pll2_1000m", "audio_pll1_out",
-						 "video_pll1_out", "audio_pll2_out", };
+						 "video_pll_out", "audio_pll2_out", };
 
 static const char * const imx8mp_audio_axi_sels[] = {"osc_24m", "gpu_pll_out", "sys_pll1_800m",
 						     "sys_pll3_out", "sys_pll2_1000m", "audio_pll1_out",
-						     "video_pll1_out", "audio_pll2_out", };
+						     "video_pll_out", "audio_pll2_out", };
 
 static const char * const imx8mp_hsio_axi_sels[] = {"osc_24m", "sys_pll2_500m", "sys_pll1_800m",
 						    "sys_pll2_100m", "sys_pll2_200m", "clk_ext2",
@@ -72,11 +72,11 @@ static const char * const imx8mp_media_isp_sels[] = {"osc_24m", "sys_pll2_1000m"
 
 static const char * const imx8mp_main_axi_sels[] = {"osc_24m", "sys_pll2_333m", "sys_pll1_800m",
 						    "sys_pll2_250m", "sys_pll2_1000m", "audio_pll1_out",
-						    "video_pll1_out", "sys_pll1_100m",};
+						    "video_pll_out", "sys_pll1_100m",};
 
 static const char * const imx8mp_enet_axi_sels[] = {"osc_24m", "sys_pll1_266m", "sys_pll1_800m",
 						    "sys_pll2_250m", "sys_pll2_200m", "audio_pll1_out",
-						    "video_pll1_out", "sys_pll3_out", };
+						    "video_pll_out", "sys_pll3_out", };
 
 static const char * const imx8mp_nand_usdhc_sels[] = {"osc_24m", "sys_pll1_266m", "sys_pll1_800m",
 						      "sys_pll2_200m", "sys_pll1_133m", "sys_pll3_out",
@@ -96,35 +96,35 @@ static const char * const imx8mp_media_apb_sels[] = {"osc_24m", "sys_pll2_125m",
 
 static const char * const imx8mp_gpu_axi_sels[] = {"osc_24m", "sys_pll1_800m", "gpu_pll_out",
 						   "sys_pll3_out", "sys_pll2_1000m", "audio_pll1_out",
-						   "video_pll1_out", "audio_pll2_out", };
+						   "video_pll_out", "audio_pll2_out", };
 
 static const char * const imx8mp_gpu_ahb_sels[] = {"osc_24m", "sys_pll1_800m", "gpu_pll_out",
 						   "sys_pll3_out", "sys_pll2_1000m", "audio_pll1_out",
-						   "video_pll1_out", "audio_pll2_out", };
+						   "video_pll_out", "audio_pll2_out", };
 
 static const char * const imx8mp_noc_sels[] = {"osc_24m", "sys_pll1_800m", "sys_pll3_out",
 					       "sys_pll2_1000m", "sys_pll2_500m", "audio_pll1_out",
-					       "video_pll1_out", "audio_pll2_out", };
+					       "video_pll_out", "audio_pll2_out", };
 
 static const char * const imx8mp_noc_io_sels[] = {"osc_24m", "sys_pll1_800m", "sys_pll3_out",
 						  "sys_pll2_1000m", "sys_pll2_500m", "audio_pll1_out",
-						  "video_pll1_out", "audio_pll2_out", };
+						  "video_pll_out", "audio_pll2_out", };
 
 static const char * const imx8mp_ml_axi_sels[] = {"osc_24m", "sys_pll1_800m", "gpu_pll_out",
 						  "sys_pll3_out", "sys_pll2_1000m", "audio_pll1_out",
-						  "video_pll1_out", "audio_pll2_out", };
+						  "video_pll_out", "audio_pll2_out", };
 
 static const char * const imx8mp_ml_ahb_sels[] = {"osc_24m", "sys_pll1_800m", "gpu_pll_out",
 						  "sys_pll3_out", "sys_pll2_1000m", "audio_pll1_out",
-						  "video_pll1_out", "audio_pll2_out", };
+						  "video_pll_out", "audio_pll2_out", };
 
 static const char * const imx8mp_ahb_sels[] = {"osc_24m", "sys_pll1_133m", "sys_pll1_800m",
 					       "sys_pll1_400m", "sys_pll2_125m", "sys_pll3_out",
-					       "audio_pll1_out", "video_pll1_out", };
+					       "audio_pll1_out", "video_pll_out", };
 
 static const char * const imx8mp_audio_ahb_sels[] = {"osc_24m", "sys_pll2_500m", "sys_pll1_800m",
 						     "sys_pll2_1000m", "sys_pll2_166m", "sys_pll3_out",
-						     "audio_pll1_out", "video_pll1_out", };
+						     "audio_pll1_out", "video_pll_out", };
 
 static const char * const imx8mp_mipi_dsi_esc_rx_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_80m",
 							   "sys_pll1_800m", "sys_pll2_1000m",
@@ -159,56 +159,56 @@ static const char * const imx8mp_pcie_aux_sels[] = {"osc_24m", "sys_pll2_200m",
 						    "sys_pll1_160m", "sys_pll1_200m", };
 
 static const char * const imx8mp_i2c5_sels[] = {"osc_24m", "sys_pll1_160m", "sys_pll2_50m",
-						"sys_pll3_out", "audio_pll1_out", "video_pll1_out",
+						"sys_pll3_out", "audio_pll1_out", "video_pll_out",
 						"audio_pll2_out", "sys_pll1_133m", };
 
 static const char * const imx8mp_i2c6_sels[] = {"osc_24m", "sys_pll1_160m", "sys_pll2_50m",
-						"sys_pll3_out", "audio_pll1_out", "video_pll1_out",
+						"sys_pll3_out", "audio_pll1_out", "video_pll_out",
 						"audio_pll2_out", "sys_pll1_133m", };
 
 static const char * const imx8mp_sai1_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out",
-						"video_pll1_out", "sys_pll1_133m", "osc_hdmi",
+						"video_pll_out", "sys_pll1_133m", "osc_hdmi",
 						"clk_ext1", "clk_ext2", };
 
 static const char * const imx8mp_sai2_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out",
-						"video_pll1_out", "sys_pll1_133m", "osc_hdmi",
+						"video_pll_out", "sys_pll1_133m", "osc_hdmi",
 						"clk_ext2", "clk_ext3", };
 
 static const char * const imx8mp_sai3_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out",
-						"video_pll1_out", "sys_pll1_133m", "osc_hdmi",
+						"video_pll_out", "sys_pll1_133m", "osc_hdmi",
 						"clk_ext3", "clk_ext4", };
 
 static const char * const imx8mp_sai5_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out",
-						"video_pll1_out", "sys_pll1_133m", "osc_hdmi",
+						"video_pll_out", "sys_pll1_133m", "osc_hdmi",
 						"clk_ext2", "clk_ext3", };
 
 static const char * const imx8mp_sai6_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out",
-						"video_pll1_out", "sys_pll1_133m", "osc_hdmi",
+						"video_pll_out", "sys_pll1_133m", "osc_hdmi",
 						"clk_ext3", "clk_ext4", };
 
 static const char * const imx8mp_enet_qos_sels[] = {"osc_24m", "sys_pll2_125m", "sys_pll2_50m",
 						    "sys_pll2_100m", "sys_pll1_160m", "audio_pll1_out",
-						    "video_pll1_out", "clk_ext4", };
+						    "video_pll_out", "clk_ext4", };
 
 static const char * const imx8mp_enet_qos_timer_sels[] = {"osc_24m", "sys_pll2_100m", "audio_pll1_out",
 							  "clk_ext1", "clk_ext2", "clk_ext3",
-							  "clk_ext4", "video_pll1_out", };
+							  "clk_ext4", "video_pll_out", };
 
 static const char * const imx8mp_enet_ref_sels[] = {"osc_24m", "sys_pll2_125m", "sys_pll2_50m",
 						    "sys_pll2_100m", "sys_pll1_160m", "audio_pll1_out",
-						    "video_pll1_out", "clk_ext4", };
+						    "video_pll_out", "clk_ext4", };
 
 static const char * const imx8mp_enet_timer_sels[] = {"osc_24m", "sys_pll2_100m", "audio_pll1_out",
 						      "clk_ext1", "clk_ext2", "clk_ext3",
-						      "clk_ext4", "video_pll1_out", };
+						      "clk_ext4", "video_pll_out", };
 
 static const char * const imx8mp_enet_phy_ref_sels[] = {"osc_24m", "sys_pll2_50m", "sys_pll2_125m",
 							"sys_pll2_200m", "sys_pll2_500m", "audio_pll1_out",
-							"video_pll1_out", "audio_pll2_out", };
+							"video_pll_out", "audio_pll2_out", };
 
 static const char * const imx8mp_nand_sels[] = {"osc_24m", "sys_pll2_500m", "audio_pll1_out",
 						"sys_pll1_400m", "audio_pll2_out", "sys_pll3_out",
-						"sys_pll2_250m", "video_pll1_out", };
+						"sys_pll2_250m", "video_pll_out", };
 
 static const char * const imx8mp_qspi_sels[] = {"osc_24m", "sys_pll1_400m", "sys_pll2_333m",
 						"sys_pll2_500m", "audio_pll2_out", "sys_pll1_266m",
@@ -223,19 +223,19 @@ static const char * const imx8mp_usdhc2_sels[] = {"osc_24m", "sys_pll1_400m", "s
 						  "audio_pll2_out", "sys_pll1_100m", };
 
 static const char * const imx8mp_i2c1_sels[] = {"osc_24m", "sys_pll1_160m", "sys_pll2_50m",
-						"sys_pll3_out", "audio_pll1_out", "video_pll1_out",
+						"sys_pll3_out", "audio_pll1_out", "video_pll_out",
 						"audio_pll2_out", "sys_pll1_133m", };
 
 static const char * const imx8mp_i2c2_sels[] = {"osc_24m", "sys_pll1_160m", "sys_pll2_50m",
-						"sys_pll3_out", "audio_pll1_out", "video_pll1_out",
+						"sys_pll3_out", "audio_pll1_out", "video_pll_out",
 						"audio_pll2_out", "sys_pll1_133m", };
 
 static const char * const imx8mp_i2c3_sels[] = {"osc_24m", "sys_pll1_160m", "sys_pll2_50m",
-						"sys_pll3_out", "audio_pll1_out", "video_pll1_out",
+						"sys_pll3_out", "audio_pll1_out", "video_pll_out",
 						"audio_pll2_out", "sys_pll1_133m", };
 
 static const char * const imx8mp_i2c4_sels[] = {"osc_24m", "sys_pll1_160m", "sys_pll2_50m",
-						"sys_pll3_out", "audio_pll1_out", "video_pll1_out",
+						"sys_pll3_out", "audio_pll1_out", "video_pll_out",
 						"audio_pll2_out", "sys_pll1_133m", };
 
 static const char * const imx8mp_uart1_sels[] = {"osc_24m", "sys_pll1_80m", "sys_pll2_200m",
@@ -276,42 +276,42 @@ static const char * const imx8mp_ecspi2_sels[] = {"osc_24m", "sys_pll2_200m", "s
 
 static const char * const imx8mp_pwm1_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_160m",
 						"sys_pll1_40m", "sys_pll3_out", "clk_ext1",
-						"sys_pll1_80m", "video_pll1_out", };
+						"sys_pll1_80m", "video_pll_out", };
 
 static const char * const imx8mp_pwm2_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_160m",
 						"sys_pll1_40m", "sys_pll3_out", "clk_ext1",
-						"sys_pll1_80m", "video_pll1_out", };
+						"sys_pll1_80m", "video_pll_out", };
 
 static const char * const imx8mp_pwm3_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_160m",
 						"sys_pll1_40m", "sys_pll3_out", "clk_ext2",
-						"sys_pll1_80m", "video_pll1_out", };
+						"sys_pll1_80m", "video_pll_out", };
 
 static const char * const imx8mp_pwm4_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_160m",
 						"sys_pll1_40m", "sys_pll3_out", "clk_ext2",
-						"sys_pll1_80m", "video_pll1_out", };
+						"sys_pll1_80m", "video_pll_out", };
 
 static const char * const imx8mp_gpt1_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_400m",
-						"sys_pll1_40m", "video_pll1_out", "sys_pll1_80m",
+						"sys_pll1_40m", "video_pll_out", "sys_pll1_80m",
 						"audio_pll1_out", "clk_ext1" };
 
 static const char * const imx8mp_gpt2_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_400m",
-						"sys_pll1_40m", "video_pll1_out", "sys_pll1_80m",
+						"sys_pll1_40m", "video_pll_out", "sys_pll1_80m",
 						"audio_pll1_out", "clk_ext2" };
 
 static const char * const imx8mp_gpt3_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_400m",
-						"sys_pll1_40m", "video_pll1_out", "sys_pll1_80m",
+						"sys_pll1_40m", "video_pll_out", "sys_pll1_80m",
 						"audio_pll1_out", "clk_ext3" };
 
 static const char * const imx8mp_gpt4_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_400m",
-						"sys_pll1_40m", "video_pll1_out", "sys_pll1_80m",
+						"sys_pll1_40m", "video_pll_out", "sys_pll1_80m",
 						"audio_pll1_out", "clk_ext1" };
 
 static const char * const imx8mp_gpt5_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_400m",
-						"sys_pll1_40m", "video_pll1_out", "sys_pll1_80m",
+						"sys_pll1_40m", "video_pll_out", "sys_pll1_80m",
 						"audio_pll1_out", "clk_ext2" };
 
 static const char * const imx8mp_gpt6_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_400m",
-						"sys_pll1_40m", "video_pll1_out", "sys_pll1_80m",
+						"sys_pll1_40m", "video_pll_out", "sys_pll1_80m",
 						"audio_pll1_out", "clk_ext3" };
 
 static const char * const imx8mp_wdog_sels[] = {"osc_24m", "sys_pll1_133m", "sys_pll1_160m",
@@ -328,19 +328,19 @@ static const char * const imx8mp_ipp_do_clko1_sels[] = {"osc_24m", "sys_pll1_800
 
 static const char * const imx8mp_ipp_do_clko2_sels[] = {"osc_24m", "sys_pll2_200m", "sys_pll1_400m",
 							"sys_pll1_166m", "sys_pll3_out", "audio_pll1_out",
-							"video_pll1_out", "osc_32k" };
+							"video_pll_out", "osc_32k" };
 
 static const char * const imx8mp_hdmi_fdcc_tst_sels[] = {"osc_24m", "sys_pll1_266m", "sys_pll2_250m",
 							 "sys_pll1_800m", "sys_pll2_1000m", "sys_pll3_out",
-							 "audio_pll2_out", "video_pll1_out", };
+							 "audio_pll2_out", "video_pll_out", };
 
 static const char * const imx8mp_hdmi_24m_sels[] = {"osc_24m", "sys_pll1_160m", "sys_pll2_50m",
-						    "sys_pll3_out", "audio_pll1_out", "video_pll1_out",
+						    "sys_pll3_out", "audio_pll1_out", "video_pll_out",
 						    "audio_pll2_out", "sys_pll1_133m", };
 
 static const char * const imx8mp_hdmi_ref_266m_sels[] = {"osc_24m", "sys_pll1_400m", "sys_pll3_out",
 							 "sys_pll2_333m", "sys_pll1_266m", "sys_pll2_200m",
-							 "audio_pll1_out", "video_pll1_out", };
+							 "audio_pll1_out", "video_pll_out", };
 
 static const char * const imx8mp_usdhc3_sels[] = {"osc_24m", "sys_pll1_400m", "sys_pll1_800m",
 						  "sys_pll2_500m", "sys_pll3_out", "sys_pll1_266m",
@@ -349,26 +349,26 @@ static const char * const imx8mp_usdhc3_sels[] = {"osc_24m", "sys_pll1_400m", "s
 static const char * const imx8mp_media_cam1_pix_sels[] = {"osc_24m", "sys_pll1_266m", "sys_pll2_250m",
 							  "sys_pll1_800m", "sys_pll2_1000m",
 							  "sys_pll3_out", "audio_pll2_out",
-							  "video_pll1_out", };
+							  "video_pll_out", };
 
 static const char * const imx8mp_media_mipi_phy1_ref_sels[] = {"osc_24m", "sys_pll2_333m", "sys_pll2_100m",
 							       "sys_pll1_800m", "sys_pll2_1000m",
 							       "clk_ext2", "audio_pll2_out",
-							       "video_pll1_out", };
+							       "video_pll_out", };
 
-static const char * const imx8mp_media_disp_pix_sels[] = {"osc_24m", "video_pll1_out", "audio_pll2_out",
+static const char * const imx8mp_media_disp_pix_sels[] = {"osc_24m", "video_pll_out", "audio_pll2_out",
 							   "audio_pll1_out", "sys_pll1_800m",
 							   "sys_pll2_1000m", "sys_pll3_out", "clk_ext4", };
 
 static const char * const imx8mp_media_cam2_pix_sels[] = {"osc_24m", "sys_pll1_266m", "sys_pll2_250m",
 							  "sys_pll1_800m", "sys_pll2_1000m",
 							  "sys_pll3_out", "audio_pll2_out",
-							  "video_pll1_out", };
+							  "video_pll_out", };
 
 static const char * const imx8mp_media_ldb_sels[] = {"osc_24m", "sys_pll2_333m", "sys_pll2_100m",
 						     "sys_pll1_800m", "sys_pll2_1000m",
 						     "clk_ext2", "audio_pll2_out",
-						     "video_pll1_out", };
+						     "video_pll_out", };
 
 static const char * const imx8mp_memrepair_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_80m",
 							"sys_pll1_800m", "sys_pll2_1000m", "sys_pll3_out",
@@ -392,12 +392,12 @@ static const char * const imx8mp_vpu_vc8000e_sels[] = {"osc_24m", "vpu_pll_out",
 						       "sys_pll3_out", "audio_pll1_out", };
 
 static const char * const imx8mp_sai7_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out",
-						"video_pll1_out", "sys_pll1_133m", "osc_hdmi",
+						"video_pll_out", "sys_pll1_133m", "osc_hdmi",
 						"clk_ext3", "clk_ext4", };
 
 static const char * const imx8mp_dram_core_sels[] = {"dram_pll_out", "dram_alt_root", };
 
-static const char * const imx8mp_clkout_sels[] = {"audio_pll1_out", "audio_pll2_out", "video_pll1_out",
+static const char * const imx8mp_clkout_sels[] = {"audio_pll1_out", "audio_pll2_out", "video_pll_out",
 						  "dummy", "dummy", "gpu_pll_out", "vpu_pll_out",
 						  "arm_pll_out", "sys_pll1_out", "sys_pll2_out",
 						  "sys_pll3_out", "dummy", "dummy", "osc_24m",
@@ -441,7 +441,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 
 	hws[IMX8MP_AUDIO_PLL1_REF_SEL] = imx_clk_hw_mux("audio_pll1_ref_sel", anatop_base + 0x0, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
 	hws[IMX8MP_AUDIO_PLL2_REF_SEL] = imx_clk_hw_mux("audio_pll2_ref_sel", anatop_base + 0x14, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-	hws[IMX8MP_VIDEO_PLL1_REF_SEL] = imx_clk_hw_mux("video_pll1_ref_sel", anatop_base + 0x28, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	hws[IMX8MP_VIDEO_PLL_REF_SEL] = imx_clk_hw_mux("video_pll_ref_sel", anatop_base + 0x28, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
 	hws[IMX8MP_DRAM_PLL_REF_SEL] = imx_clk_hw_mux("dram_pll_ref_sel", anatop_base + 0x50, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
 	hws[IMX8MP_GPU_PLL_REF_SEL] = imx_clk_hw_mux("gpu_pll_ref_sel", anatop_base + 0x64, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
 	hws[IMX8MP_VPU_PLL_REF_SEL] = imx_clk_hw_mux("vpu_pll_ref_sel", anatop_base + 0x74, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
@@ -452,7 +452,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 
 	hws[IMX8MP_AUDIO_PLL1] = imx_clk_hw_pll14xx("audio_pll1", "audio_pll1_ref_sel", anatop_base, &imx_1443x_pll);
 	hws[IMX8MP_AUDIO_PLL2] = imx_clk_hw_pll14xx("audio_pll2", "audio_pll2_ref_sel", anatop_base + 0x14, &imx_1443x_pll);
-	hws[IMX8MP_VIDEO_PLL1] = imx_clk_hw_pll14xx("video_pll1", "video_pll1_ref_sel", anatop_base + 0x28, &imx_1443x_pll);
+	hws[IMX8MP_VIDEO_PLL] = imx_clk_hw_pll14xx("video_pll", "video_pll_ref_sel", anatop_base + 0x28, &imx_1443x_pll);
 	hws[IMX8MP_DRAM_PLL] = imx_clk_hw_pll14xx("dram_pll", "dram_pll_ref_sel", anatop_base + 0x50, &imx_1443x_dram_pll);
 	hws[IMX8MP_GPU_PLL] = imx_clk_hw_pll14xx("gpu_pll", "gpu_pll_ref_sel", anatop_base + 0x64, &imx_1416x_pll);
 	hws[IMX8MP_VPU_PLL] = imx_clk_hw_pll14xx("vpu_pll", "vpu_pll_ref_sel", anatop_base + 0x74, &imx_1416x_pll);
@@ -463,7 +463,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 
 	hws[IMX8MP_AUDIO_PLL1_BYPASS] = imx_clk_hw_mux_flags("audio_pll1_bypass", anatop_base, 16, 1, audio_pll1_bypass_sels, ARRAY_SIZE(audio_pll1_bypass_sels), CLK_SET_RATE_PARENT);
 	hws[IMX8MP_AUDIO_PLL2_BYPASS] = imx_clk_hw_mux_flags("audio_pll2_bypass", anatop_base + 0x14, 16, 1, audio_pll2_bypass_sels, ARRAY_SIZE(audio_pll2_bypass_sels), CLK_SET_RATE_PARENT);
-	hws[IMX8MP_VIDEO_PLL1_BYPASS] = imx_clk_hw_mux_flags("video_pll1_bypass", anatop_base + 0x28, 16, 1, video_pll1_bypass_sels, ARRAY_SIZE(video_pll1_bypass_sels), CLK_SET_RATE_PARENT);
+	hws[IMX8MP_VIDEO_PLL_BYPASS] = imx_clk_hw_mux_flags("video_pll_bypass", anatop_base + 0x28, 16, 1, video_pll_bypass_sels, ARRAY_SIZE(video_pll_bypass_sels), CLK_SET_RATE_PARENT);
 	hws[IMX8MP_DRAM_PLL_BYPASS] = imx_clk_hw_mux_flags("dram_pll_bypass", anatop_base + 0x50, 16, 1, dram_pll_bypass_sels, ARRAY_SIZE(dram_pll_bypass_sels), CLK_SET_RATE_PARENT);
 	hws[IMX8MP_GPU_PLL_BYPASS] = imx_clk_hw_mux_flags("gpu_pll_bypass", anatop_base + 0x64, 28, 1, gpu_pll_bypass_sels, ARRAY_SIZE(gpu_pll_bypass_sels), CLK_SET_RATE_PARENT);
 	hws[IMX8MP_VPU_PLL_BYPASS] = imx_clk_hw_mux_flags("vpu_pll_bypass", anatop_base + 0x74, 28, 1, vpu_pll_bypass_sels, ARRAY_SIZE(vpu_pll_bypass_sels), CLK_SET_RATE_PARENT);
@@ -474,7 +474,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 
 	hws[IMX8MP_AUDIO_PLL1_OUT] = imx_clk_hw_gate("audio_pll1_out", "audio_pll1_bypass", anatop_base, 13);
 	hws[IMX8MP_AUDIO_PLL2_OUT] = imx_clk_hw_gate("audio_pll2_out", "audio_pll2_bypass", anatop_base + 0x14, 13);
-	hws[IMX8MP_VIDEO_PLL1_OUT] = imx_clk_hw_gate("video_pll1_out", "video_pll1_bypass", anatop_base + 0x28, 13);
+	hws[IMX8MP_VIDEO_PLL_OUT] = imx_clk_hw_gate("video_pll_out", "video_pll_bypass", anatop_base + 0x28, 13);
 	hws[IMX8MP_DRAM_PLL_OUT] = imx_clk_hw_gate("dram_pll_out", "dram_pll_bypass", anatop_base + 0x50, 13);
 	hws[IMX8MP_GPU_PLL_OUT] = imx_clk_hw_gate("gpu_pll_out", "gpu_pll_bypass", anatop_base + 0x64, 11);
 	hws[IMX8MP_VPU_PLL_OUT] = imx_clk_hw_gate("vpu_pll_out", "vpu_pll_bypass", anatop_base + 0x74, 11);
-- 
2.43.0


