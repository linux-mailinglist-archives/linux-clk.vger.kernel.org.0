Return-Path: <linux-clk+bounces-15415-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC789E5391
	for <lists+linux-clk@lfdr.de>; Thu,  5 Dec 2024 12:20:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6734A1881AB7
	for <lists+linux-clk@lfdr.de>; Thu,  5 Dec 2024 11:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FA581F5427;
	Thu,  5 Dec 2024 11:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="nwaMZGob"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300541F131A
	for <linux-clk@vger.kernel.org>; Thu,  5 Dec 2024 11:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733397588; cv=none; b=nAV4kYN27Tqg5/hVJ7DgAfHi9C68JvKEvm43gK8UKDd00580/JOndj8vuIz/1U+oUSNio6FRSdv5aD4Wuq5uqGp+IBzhA0/VEIrggAHS4w7aA14Mx/ed+k3nHQeutBZjXuWjzb8ylUUZSdB1ls2ue31nuSTqd/9Jsi3VdNS/P6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733397588; c=relaxed/simple;
	bh=inKBaalPlXM5OmIu+SZhwPgtj6S4vH3/mZDzHKXn5A8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g3XInn5nLmUJAC1RNxlhjVCEZU7qQRVtaG8HBqbuA54C4TgCD565Opp5IN9wlbpQ0c4z4x9NvE3/ZcypAwHy0Ct3DFomLntWaC1Rj2Xill7NtdQTedEvPv0Oh2XS/FhMDiaULoxdnMtLZDvur8cNqAScWtg9oDjgGHDUh93YmDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=nwaMZGob; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d0d4a2da4dso1185914a12.1
        for <linux-clk@vger.kernel.org>; Thu, 05 Dec 2024 03:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733397584; x=1734002384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7OgnJTRYaGToVHZFCJ+TqtWqC7383KgEzRV1X5oSD68=;
        b=nwaMZGobJg/BUPr4ULt5/u9oi0+hrZL8vQZwgFv5IBduCcu9aAkil5BO/HTrQecQVS
         +HmGGLYmRKrPIyoctqfjqQg69xRJ/KoUlzRXe9OeIo11vMWdwbpbHTSJmjSXTzwZSESF
         xYM3T0oArRX9KnwAm+Qwz2ugWCCz0N10ojpU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397584; x=1734002384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7OgnJTRYaGToVHZFCJ+TqtWqC7383KgEzRV1X5oSD68=;
        b=ZDs9iUmfaTd9JhMSVtUQb6R+GTKxyGe4t0m0eOHwRkjhRE/MBHPgx1faeX1rAVEAfi
         95S6rGnPDmL9XJ5TojquJQfTpX0aoilzpkBNyWYmWD/5rxBkl2x5YS70E7ckWShn1PFf
         X+kw/EzqaDIFM3CnO/0zB2X9ntgFGkLxqJop9xs7ULe1leKzSfLnxznOWGJu8FcRaYTv
         rOcuUNHgnD/NIZ36mOBVpjfQ8lEn3NcDwIMcTpDDdgSCi+25F+xQHBXIOmnwq9CQtMwp
         V856M1nbloGG3G3oxGA5ELfbg7TzcCQNnZZfe8P83lV07OqtbfCDzlZSu7GnUti9GBFQ
         Dptw==
X-Forwarded-Encrypted: i=1; AJvYcCVNiTtSZoB6a7CybhvmvP7W8/jC5aZUatFNJilUL1PNVqUQw4MoVvnylw2nMgGFnHY9ykMLBhS0gaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEBcX0TJf7s0W2m9fJmFZtfhBswbSjXVqhKe9EtGblb47sm4ti
	s3MJDX5UkE2FSQ7Ya1enlPQjDIPYOLmuoBAfnoqlsaxr7yiX4fsQEpYEvn5gDyw=
X-Gm-Gg: ASbGnctDuKNPGGRIwVeL9TpHP3Etfpm54fkcjHEm2PnQhlonlPZ5Gkav9Oweof10HIO
	YTA+iCJ6vI+ojsucGxVTLu8dPE7hXVPzR00C3hEqzV21quu4D7YYlFl4KpbgkEjCbVMQTwg4jNM
	C0jgQSQv75+JPeWehzoY07UrFLzhlZrQ58REXr5JCISmH6kAZBOoDAWSCCNhGZxzoHNFrz/AHY3
	RB1yzDOhT2vVt0nCNj/nV8wJNqELrshn6blWIV71jRi9jT33crCcoU0TtebbRrHVZsyJl9oonR/
	fxHrcYJNQxoAbSGTp+bCgtr3QrSWKiyrxKN4CO6/1RTM9w==
X-Google-Smtp-Source: AGHT+IG4SKCPLnpcJBbWDmV3TfYeNP6K/Uvezlg68+KTlNCXPIUvxOpsGINolLfffKcS2GXC8CUr7Q==
X-Received: by 2002:a17:906:2182:b0:aa6:1c4f:4642 with SMTP id a640c23a62f3a-aa61c4f48a7mr271020466b.53.1733397583627;
        Thu, 05 Dec 2024 03:19:43 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm77505266b.87.2024.12.05.03.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:19:43 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v5 01/20] dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
Date: Thu,  5 Dec 2024 12:17:36 +0100
Message-ID: <20241205111939.1796244-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
References: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unlike audio_pll1 and audio_pll2, there is no video_pll2. Further, the
name used in the RM is video_pll. So, let's add the IMX8MM_VIDEO_PLL[_*]
definitions to be consistent with the RM and avoid misunderstandings.

The IMX8MM_VIDEO_PLL1* constants have not been removed to ensure
backward compatibility of the patch.

No functional changes intended.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v5:
- New

 include/dt-bindings/clock/imx8mm-clock.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/include/dt-bindings/clock/imx8mm-clock.h b/include/dt-bindings/clock/imx8mm-clock.h
index 1f768b2eeb1a..102d8a6cdb55 100644
--- a/include/dt-bindings/clock/imx8mm-clock.h
+++ b/include/dt-bindings/clock/imx8mm-clock.h
@@ -16,7 +16,8 @@
 #define IMX8MM_CLK_EXT4				7
 #define IMX8MM_AUDIO_PLL1_REF_SEL		8
 #define IMX8MM_AUDIO_PLL2_REF_SEL		9
-#define IMX8MM_VIDEO_PLL1_REF_SEL		10
+#define IMX8MM_VIDEO_PLL_REF_SEL		10
+#define IMX8MM_VIDEO_PLL1_REF_SEL		IMX8MM_VIDEO_PLL_REF_SEL
 #define IMX8MM_DRAM_PLL_REF_SEL			11
 #define IMX8MM_GPU_PLL_REF_SEL			12
 #define IMX8MM_VPU_PLL_REF_SEL			13
@@ -26,7 +27,8 @@
 #define IMX8MM_SYS_PLL3_REF_SEL			17
 #define IMX8MM_AUDIO_PLL1			18
 #define IMX8MM_AUDIO_PLL2			19
-#define IMX8MM_VIDEO_PLL1			20
+#define IMX8MM_VIDEO_PLL			20
+#define IMX8MM_VIDEO_PLL1			IMX8MM_VIDEO_PLL
 #define IMX8MM_DRAM_PLL				21
 #define IMX8MM_GPU_PLL				22
 #define IMX8MM_VPU_PLL				23
@@ -36,7 +38,8 @@
 #define IMX8MM_SYS_PLL3				27
 #define IMX8MM_AUDIO_PLL1_BYPASS		28
 #define IMX8MM_AUDIO_PLL2_BYPASS		29
-#define IMX8MM_VIDEO_PLL1_BYPASS		30
+#define IMX8MM_VIDEO_PLL_BYPASS			30
+#define IMX8MM_VIDEO_PLL1_BYPASS		IMX8MM_VIDEO_PLL_BYPASS
 #define IMX8MM_DRAM_PLL_BYPASS			31
 #define IMX8MM_GPU_PLL_BYPASS			32
 #define IMX8MM_VPU_PLL_BYPASS			33
@@ -46,7 +49,8 @@
 #define IMX8MM_SYS_PLL3_BYPASS			37
 #define IMX8MM_AUDIO_PLL1_OUT			38
 #define IMX8MM_AUDIO_PLL2_OUT			39
-#define IMX8MM_VIDEO_PLL1_OUT			40
+#define IMX8MM_VIDEO_PLL_OUT			40
+#define IMX8MM_VIDEO_PLL1_OUT			IMX8MM_VIDEO_PLL_OUT
 #define IMX8MM_DRAM_PLL_OUT			41
 #define IMX8MM_GPU_PLL_OUT			42
 #define IMX8MM_VPU_PLL_OUT			43
-- 
2.43.0


