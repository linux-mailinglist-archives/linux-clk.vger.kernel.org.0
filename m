Return-Path: <linux-clk+bounces-15480-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3D19E6CEC
	for <lists+linux-clk@lfdr.de>; Fri,  6 Dec 2024 12:15:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B778188422A
	for <lists+linux-clk@lfdr.de>; Fri,  6 Dec 2024 11:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB8E6200B90;
	Fri,  6 Dec 2024 11:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="In2/7Xdf"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488121FF5FC
	for <linux-clk@vger.kernel.org>; Fri,  6 Dec 2024 11:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733483646; cv=none; b=bwNnHA1Y2vqzzxSLzb04lZEcYLfQ4dcPSRLXhKlgfJd3DkvEDrRLcuwWrMkpf7s6sJQhpYAR6EopJ2UR3AfYh4l5rl00uYP7xb8gdzTL1EwYyJA9mAHaQ9pVsDY34YLABFI26Lh7ca1ucdXZMfsADSyk/5v4SYr0fuoz6z5LKf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733483646; c=relaxed/simple;
	bh=Dwmv4o74khoBQdkptuvQ4q7nGic6CB59TAj8g4R5I2A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kuA0Vr/rjxNqZN7x6yVNdALycgBsQYckK31UW0+YqcOSQHAdtOKelBO47A593WqXCRQxU8OZgycvGBWI4JM9qBP7hEPd5SHIFZCJZyAgggrPQQz7OquJU9LtlOtN1DTqCoVLz5YtSPnZHBUtjb1bCgRyN/w120YWp4Tvx7yMiaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=In2/7Xdf; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa51b8c5f4dso108820866b.2
        for <linux-clk@vger.kernel.org>; Fri, 06 Dec 2024 03:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733483643; x=1734088443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MNUU76506eldJbwNztMYjCQxf0w88SMXCYz1DW5xFro=;
        b=In2/7XdfuJQ+VvilHhtkD7O+e9S05Cfhzi+R9SmGf/eoYLhLxcRfqJ9RKkZG8CNXnB
         Jbql9fJNzGnWpQlCbPvbLy/tp3Vvk3L+vUBAqRb036S88aluvlxP3qTYTVTxghQuyziZ
         gHJnbYsb2Mk4II6juQZ+pgwZO2LH70WG5lIwUmoCGOpLo2pSqr4j8zrvpToNRb8E8hC/
         It8F/dCDIP5mqhtkjQoqCGlYb8nY1Sqljddtk/PMwoWnpEdBPO5kKVWCkpVtSZxvhMf0
         FBbJQPanKxlJmrvSKE6knIj3C21w5yH61mz+Ld+YUTUTmGGIztH9Xn8mpjmDccbencqa
         /1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733483643; x=1734088443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MNUU76506eldJbwNztMYjCQxf0w88SMXCYz1DW5xFro=;
        b=i3tQhJ9e433NYE0MLF70VqWqd1Qx3EbHJc1MT/jOBV5kNyEcM3bMyzWowpdMCkLpyC
         LHWT41F3qxroCqEeIlxbpxXvwzxnHwg48cTSDK/+UORyNPNOX3XCapJCA9Xk6K1boeys
         u4Zqto+ZZjbJqo+XTnk4W5RLoCsf0t7PV1JP7I8SDWin5NL7CQNUzjjmjIFQIr+UUWmn
         1GZ3guN8j8JJqoqDOy6Yd1yTF2vOCuthav7vitfwOc1rxacBsFcEEqaBnUlO96QVFXvY
         EkOW7+e6G/OVJRyTygyZURzBl+iq/K0YIlCzeJ2wTOgPM4ne4B+CnsytK+Fte/kj0nBr
         P+mw==
X-Forwarded-Encrypted: i=1; AJvYcCUN4cA2lFovqghNM03m7BEKpmS2CZY+XrqdKnSTJVaTIQ+RlPgew4SWV3dHnBv+7SNJGu+N8am4vS8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/rRSbCSDDmMI89PpVQ4P6Jds2w2lPiNs3dFnXvvZg23vYDCw6
	XBqyJfMd9s6sSOe8JQXq9510M2uxIn90Xe3qKmAWSNqiKUtJf+dIAj6SmLPhRu8=
X-Gm-Gg: ASbGncsBsbnOPRxxRXS2nll8i3ViljNoRLJMZUNVbMsD8dkxHXT/YPiFj2eDuJN3mhY
	6WHDwGCU3TwERh4uweND2gLxU8EY638OJlQy5gERGw+vDM1PNzHQUdmT/NAYVvB7gQg36qTW/YJ
	mZJ6BbPRQcJKbFSzV3xxQ838JnVq7YujoIhcV0tBUnMrM6cYPaKtpgBlWwVe3qlX3cgpvc3AsCs
	ZKMptVkqg5bdGIQ8dx9vcLy5JzR/lBHog5c8LsMbdlASXvbBbGt7MrPdkgdzZRtTBlqSolfG7Zm
	KxHe
X-Google-Smtp-Source: AGHT+IH6Yt9ImiRFWWuZjkCgbEGYygXRPHwjAYhKDD1eg/rWy5S/tL1CQg/zDPDowgi1wK/HCr+qTA==
X-Received: by 2002:a17:907:75d8:b0:aa6:2867:4dc5 with SMTP id a640c23a62f3a-aa63a285650mr203661266b.49.1733483642631;
        Fri, 06 Dec 2024 03:14:02 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eee2a6sm226877866b.90.2024.12.06.03.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 03:14:02 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: prabhakar.mahadev-lad.rj@bp.renesas.com,
	jic23@kernel.org,
	lars@metafoo.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 05/15] iio: adc: rzg2l_adc: Switch to RUNTIME_PM_OPS() and pm_ptr()
Date: Fri,  6 Dec 2024 13:13:27 +0200
Message-Id: <20241206111337.726244-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241206111337.726244-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241206111337.726244-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The use of SET_RUNTIME_PM_OPS() is now deprecated and requires
__maybe_unused annotations to avoid warnings about unused functions.
Switching to RUNTIME_PM_OPS() and pm_ptr() eliminates the need for such
annotations because the compiler can directly reference the runtime PM
functions, thereby suppressing the warnings. As a result, the
__maybe_unused markings can be removed.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 drivers/iio/adc/rzg2l_adc.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/adc/rzg2l_adc.c b/drivers/iio/adc/rzg2l_adc.c
index 780cb927eab1..482da6dcf174 100644
--- a/drivers/iio/adc/rzg2l_adc.c
+++ b/drivers/iio/adc/rzg2l_adc.c
@@ -454,7 +454,7 @@ static const struct of_device_id rzg2l_adc_match[] = {
 };
 MODULE_DEVICE_TABLE(of, rzg2l_adc_match);
 
-static int __maybe_unused rzg2l_adc_pm_runtime_suspend(struct device *dev)
+static int rzg2l_adc_pm_runtime_suspend(struct device *dev)
 {
 	struct iio_dev *indio_dev = dev_get_drvdata(dev);
 	struct rzg2l_adc *adc = iio_priv(indio_dev);
@@ -464,7 +464,7 @@ static int __maybe_unused rzg2l_adc_pm_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rzg2l_adc_pm_runtime_resume(struct device *dev)
+static int rzg2l_adc_pm_runtime_resume(struct device *dev)
 {
 	struct iio_dev *indio_dev = dev_get_drvdata(dev);
 	struct rzg2l_adc *adc = iio_priv(indio_dev);
@@ -475,9 +475,7 @@ static int __maybe_unused rzg2l_adc_pm_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rzg2l_adc_pm_ops = {
-	SET_RUNTIME_PM_OPS(rzg2l_adc_pm_runtime_suspend,
-			   rzg2l_adc_pm_runtime_resume,
-			   NULL)
+	RUNTIME_PM_OPS(rzg2l_adc_pm_runtime_suspend, rzg2l_adc_pm_runtime_resume, NULL)
 };
 
 static struct platform_driver rzg2l_adc_driver = {
@@ -485,7 +483,7 @@ static struct platform_driver rzg2l_adc_driver = {
 	.driver		= {
 		.name		= DRIVER_NAME,
 		.of_match_table = rzg2l_adc_match,
-		.pm		= &rzg2l_adc_pm_ops,
+		.pm		= pm_ptr(&rzg2l_adc_pm_ops),
 	},
 };
 
-- 
2.39.2


