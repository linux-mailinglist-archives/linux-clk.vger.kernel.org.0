Return-Path: <linux-clk+bounces-9117-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D9A925BC5
	for <lists+linux-clk@lfdr.de>; Wed,  3 Jul 2024 13:11:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 054402921E4
	for <lists+linux-clk@lfdr.de>; Wed,  3 Jul 2024 11:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01255193097;
	Wed,  3 Jul 2024 10:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="wISD4EBF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Dg2sO7lV"
X-Original-To: linux-clk@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD5E16F8F5;
	Wed,  3 Jul 2024 10:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720004254; cv=none; b=kd79FgLlgRE440pL7x64I2u1DcLdxYT0mRpRy3cP7N5/SNvz2SCNNn57Wv7VTcX1o/vx8whJ1SPeOaLUeHXbvjWSgzn1kFsCiVqgIvIyvDJcQ1fmV4dnXBdUC5gEAMOqwrO6EFgDu3dOb3HzR2y0aQSjYKHqQxjXIiSS2fg74jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720004254; c=relaxed/simple;
	bh=l9z64ZPMWPMl8y3ly3ERrzjeKSZu1yZI5qBR/tADUwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JEXuyFTGHVe5Eo+HiLOzwmuQuihiZz2sAq+VGoybcjnj1rdCeg3kBK5kjM8SrPemVv2NqDiMSw+Qj5M+zhGK+bMGOf/Hx7WFkNxAEZIw92MfeCw+NLE65/IJQC7RvNS539ZaF++7roFJn0n8jKRF9+CNdb0Qs/t+EZ8+6AYT3fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=wISD4EBF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Dg2sO7lV; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 962041380501;
	Wed,  3 Jul 2024 06:57:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 03 Jul 2024 06:57:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1720004252; x=
	1720090652; bh=V6kXhDOR28GY7K17QHJNbJAm+pQYGaOIMaC93g+Xacc=; b=w
	ISD4EBFcWv9irGxX/6oaEYjxEZqyQmA2hl5l0KKSTHL8nSudnhbjE+aqQPymX7Y2
	4eV2qHaoP79P1kRjtzqB3PM//ubKQP8hOwy/TYQioCAoQLTRYlHYTeW3vNBXTXM3
	Ats8C/0XGooDPJly7pUHvflkVANsJxB4butIId/muuRgEgo+iE9g5dz7w5W3FYNs
	i0SU+UuQGTnuEDDxBxjyacWER54CG1YTotX8ZFqvT+E/2XrYYgJg/z7/e90/DsUs
	i+Y82+TlZXUUN6PDMH41y3kb2DJx1GpZ1s2da6ItN52R+zW/H8e3IvblOGb/dPxT
	pAM1uRYUk3sIbUfO1KNog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720004252; x=
	1720090652; bh=V6kXhDOR28GY7K17QHJNbJAm+pQYGaOIMaC93g+Xacc=; b=D
	g2sO7lVgFTPcHwJQ5prJjDIUJETyv4M8nhkAw+wtg/BRDCPaStbZQJ9rwvT7Hn9h
	WDA+nnCGMHNkW3+10i5WFlchHwijC2FiB977MhQ3hgPptRS3siY/u3Dond2/WQoT
	R4yxtIXe5/YJf+5yeUKEZkfdXNbY2UPYLN8R2NTap4VSwVlIFWDGQEf73+hdFR75
	HKpkkgAwx2JeVk79IJRV+/yxdKDoRPRPpBZzUR+OHAdpg6JEYRFczH/dsfCHTmIa
	ufM8YAs6A3hDLqr+oJGQ0BGgHQ71v3323yN6JNieHc5Mfvyh4RwynceNf3gd5/PB
	TVYAs/BaSFY0pG/A3dJ6A==
X-ME-Sender: <xms:nC6FZoNUigxlwA-MloAUYLXfne1jNnvKF8E8xKID0wBaZvsz2qs8Tg>
    <xme:nC6FZu_JjWn90GMUavj3bX2AE08todbskGcq2KvkJBgFvat_ubWVjb5j95e_4oxNr
    hIvak5_-fVwWFb8ow>
X-ME-Received: <xmr:nC6FZvQMgLb1PHQzAHW5oGWrDtFkuFkA0ztsRDuTbXZP14mahl0cSGhVm8NX2UOuwkK3xqa-_Cxp2hnnzbrxyodm7a7GSDYhcqH8DlWeY8BJ7191>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejgdefgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcu
    hggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrth
    htvghrnhepffehieffgedtgfffjeetveegfeekleeileekveeuteffteetudffveegieei
    heetnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomheprh
    ihrghnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:nC6FZgso_I08SHK6DMkY4r_QX9yFybUpc7kVYA00vyV_ZYz6U4hTNw>
    <xmx:nC6FZgezvrDwRHel7S7cB9VT2YoREentnkIwpRC-9m8bTY-kKYcoDA>
    <xmx:nC6FZk0gZTOcPc7PG8H4oP7IHLCg9cSPBHtiv-dMWpllWYLTVSQZ_g>
    <xmx:nC6FZk-ArbzKCZP6NO3D9fk3LZOfHVWUbesYlvMhzSbywapV41GcLA>
    <xmx:nC6FZkPsikd1sFH7PvCmAjNSB3sW-2O2KmT9pWnWXXJsXLf23wslxX9P>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jul 2024 06:57:26 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	John Watts <contact@jookia.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 22/23] drm: sun4i: de33: fmt: add Display Engine 3.3 (DE33) support
Date: Wed,  3 Jul 2024 22:51:12 +1200
Message-ID: <20240703105454.41254-23-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703105454.41254-1-ryan@testtoast.com>
References: <20240703105454.41254-1-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@gmail.com>

Like the DE3, the DE33 has a FMT (formatter) module, which
provides YUV444 to YUV422/YUV420 conversion, format re-mapping and color
depth conversion, although the DE33 module appears significantly more
capable, including up to 4K video support.

Add support for the DE33.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 drivers/gpu/drm/sun4i/sun50i_fmt.c | 21 +++++++++++++++++++--
 drivers/gpu/drm/sun4i/sun50i_fmt.h |  1 +
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun50i_fmt.c b/drivers/gpu/drm/sun4i/sun50i_fmt.c
index 050a8716ae862..39682d4e6d208 100644
--- a/drivers/gpu/drm/sun4i/sun50i_fmt.c
+++ b/drivers/gpu/drm/sun4i/sun50i_fmt.c
@@ -51,6 +51,19 @@ static void sun50i_fmt_de3_limits(u32 *limits, u32 colorspace, bool bit10)
 	}
 }
 
+static void sun50i_fmt_de33_limits(u32 *limits, u32 colorspace)
+{
+	if (colorspace == SUN50I_FMT_CS_YUV444RGB) {
+		limits[0] = SUN50I_FMT_LIMIT(0, 4095);
+		limits[1] = SUN50I_FMT_LIMIT(0, 4095);
+		limits[2] = SUN50I_FMT_LIMIT(0, 4095);
+	} else {
+		limits[0] = SUN50I_FMT_LIMIT(256, 3840);
+		limits[1] = SUN50I_FMT_LIMIT(256, 3840);
+		limits[2] = SUN50I_FMT_LIMIT(256, 3840);
+	}
+}
+
 void sun50i_fmt_setup(struct sun8i_mixer *mixer, u16 width,
 		      u16 height, u32 format)
 {
@@ -60,10 +73,14 @@ void sun50i_fmt_setup(struct sun8i_mixer *mixer, u16 width,
 
 	colorspace = sun50i_fmt_get_colorspace(format);
 	bit10 = sun50i_fmt_is_10bit(format);
-	base = SUN50I_FMT_DE3;
+	base = mixer->cfg->de_type == sun8i_mixer_de3 ?
+		SUN50I_FMT_DE3 : SUN50I_FMT_DE33;
 	regs = sun8i_blender_regmap(mixer);
 
-	sun50i_fmt_de3_limits(limit, colorspace, bit10);
+	if (mixer->cfg->de_type == sun8i_mixer_de3)
+		sun50i_fmt_de3_limits(limit, colorspace, bit10);
+	else
+		sun50i_fmt_de33_limits(limit, colorspace);
 
 	regmap_write(regs, SUN50I_FMT_CTRL(base), 0);
 
diff --git a/drivers/gpu/drm/sun4i/sun50i_fmt.h b/drivers/gpu/drm/sun4i/sun50i_fmt.h
index 4127f7206aade..3e60d5c788b39 100644
--- a/drivers/gpu/drm/sun4i/sun50i_fmt.h
+++ b/drivers/gpu/drm/sun4i/sun50i_fmt.h
@@ -9,6 +9,7 @@
 #include "sun8i_mixer.h"
 
 #define SUN50I_FMT_DE3 0xa8000
+#define SUN50I_FMT_DE33 0x5000
 
 #define SUN50I_FMT_CTRL(base)   ((base) + 0x00)
 #define SUN50I_FMT_SIZE(base)   ((base) + 0x04)
-- 
2.45.2


