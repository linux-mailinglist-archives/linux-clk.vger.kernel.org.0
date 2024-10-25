Return-Path: <linux-clk+bounces-13815-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 258A99B0B52
	for <lists+linux-clk@lfdr.de>; Fri, 25 Oct 2024 19:24:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D60C2843FD
	for <lists+linux-clk@lfdr.de>; Fri, 25 Oct 2024 17:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E73A22803B;
	Fri, 25 Oct 2024 17:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="gZxP74nX"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E002B216E1B
	for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 17:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729876588; cv=none; b=gR6s9t3j+zjqXSqnzFqeDtJAYb05UCnitWjFO7ngJYI5Ge6Hhmd/xErNYMepN7wBjq/ZQp7qauw4puesSrlin5UOAr92va5OaWJqts2FBqy6ZfVb3vrzX81J+h7kgAdqYIdrSP63c/m+cl2RXhaTKjfVJETrKp6gKcpw5DgJmqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729876588; c=relaxed/simple;
	bh=F0XAo5mz5eUCdJ+Qp7hebNYu4JuOVVuD+OJwvRorfLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M6YQ2Xk9jd7Q6vHKvf2aewW59/pVqFkEsg0W43O4hNsl2pLwXhROyaZIFec6SROIWaRCF+WVnTXN/88e9gJayWwS+3o98QMS8S+DJJSM5bUas+30RwMLhuRwsD3iUA6qphOt2DdTCCRHFJx04BgpXM3X/8WFwaK6Qgre2vaXia0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=gZxP74nX; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-431616c23b5so16376495e9.0
        for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 10:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876582; x=1730481382; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xU//JPSDEyUFE1ZFqfKvgV23VREouvKrVYoOcahlOXU=;
        b=gZxP74nXhgSkHewcRkTkJ7WbuoBNnobywlAlcWcbyGnAqsywOBrarRVJFBwrh2bvYQ
         xsd4+J4Zrsx9+f7JQJmVRIRGvrA9mYWbiq9CBxZTOBxYZ63ny52dlgGXDnWjAnqIxksM
         SsxFU/vhgA9x0ajzGqMfrwecaukSXcHMK3W5bKFXWXxi9IIpDehSQt2MvDltC0DcpoU6
         eGFZSsPyi9yN9yBcJFR2st77Z0AX0DLyoOaeZvJbr1iOAX198NQKxRvqZti+AysKhc+Q
         4rw3QhqpQK03bM7JDBs6AbA6ULY0+VrM2x2mIlhCG+Q59CurEquO9f7NPBadtndyosUm
         4bhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876582; x=1730481382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xU//JPSDEyUFE1ZFqfKvgV23VREouvKrVYoOcahlOXU=;
        b=YBI/yueNWlo27I5hs4yyDP/yxn0/fsAqyvsSSxKJKG5l+pA+sFvbVJKAOYm1bRzSw4
         qAAYCMaxNJwwcT9BqHZ0K7PNwfD/LGjMBAHJBsO3DIDA4p4ilMHjDhDnoxATDznEssKs
         TP61NLn/eoXIMC050BURRz5XvzP//62KMBTYz3refJNAxFy3MCL7SbMk/gmITHqXh9XC
         z7AOGhmYkWIC5RRo9mTpvSfQ7i+iZJfVQNIBSBOAAnz1KKB+xSpOVOijh97QxpyS1Gwk
         yzZapMloQOXcUugRw5etRhU1mywowmGBQ5FPoSd2d/VLaJ49XNReOLC6IH7me+gbomJw
         kqNA==
X-Forwarded-Encrypted: i=1; AJvYcCWv7II0SBuuWlQCvHJ7WqyXAPxXzk3CVn3yh7eIqbiP+b2/M6OGNERqYpmXGLYgGtDGp1aahYnGuM0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaAx0u/21qjtvpAimEhy/WGMYIq6iNxpxxeMGXExbyC2NvsSw4
	4/gLir/SOPYcTv1S+QccyF1V8NCM2NyPd1XCAIVDbZo+2LQwmW1/Ohlltvu3fu0=
X-Google-Smtp-Source: AGHT+IHAWpLHmHwxEQ7ZVCnrScJ+3akRtweGAEi8Ve0sUsAzGKfVQQMDJC1MG28sgbwB6TwBnzAs5Q==
X-Received: by 2002:a05:600c:1e1e:b0:431:5226:1633 with SMTP id 5b1f17b1804b1-4319a576ba8mr2501215e9.6.1729876581722;
        Fri, 25 Oct 2024 10:16:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:21 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:52 +0100
Subject: [PATCH v2 21/36] drm/vc4: txp: Add BCM2712 MOPLET support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-21-35efa83c8fc0@raspberrypi.com>
References: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
In-Reply-To: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
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

The BCM2712 features a simpler TXP called MOPLET. Let's add support for
it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_txp.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 0fb8a57652b5..f6b6f8627f61 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -524,6 +524,19 @@ static const struct vc4_txp_data bcm2712_mop_data = {
 	.supports_40bit_addresses = true,
 };
 
+static const struct vc4_txp_data bcm2712_moplet_data = {
+	.base = {
+		.name = "moplet",
+		.debugfs_name = "moplet_regs",
+		.hvs_available_channels = BIT(1),
+		.hvs_output = 4,
+	},
+	.encoder_type = VC4_ENCODER_TYPE_TXP1,
+	.high_addr_ptr_reg = TXP_DST_PTR_HIGH_MOPLET,
+	.size_minus_one = true,
+	.supports_40bit_addresses = true,
+};
+
 const struct vc4_txp_data bcm2835_txp_data = {
 	.base = {
 		.name = "txp",
@@ -630,6 +643,7 @@ static void vc4_txp_remove(struct platform_device *pdev)
 
 static const struct of_device_id vc4_txp_dt_match[] = {
 	{ .compatible = "brcm,bcm2712-mop", .data = &bcm2712_mop_data },
+	{ .compatible = "brcm,bcm2712-moplet", .data = &bcm2712_moplet_data },
 	{ .compatible = "brcm,bcm2835-txp", .data = &bcm2835_txp_data },
 	{ /* sentinel */ },
 };

-- 
2.34.1


