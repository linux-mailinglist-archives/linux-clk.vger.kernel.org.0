Return-Path: <linux-clk+bounces-17880-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22355A31309
	for <lists+linux-clk@lfdr.de>; Tue, 11 Feb 2025 18:29:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9F6A3A2ECB
	for <lists+linux-clk@lfdr.de>; Tue, 11 Feb 2025 17:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BB0F2638B7;
	Tue, 11 Feb 2025 17:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="A5L3XSOE"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C772638BB
	for <linux-clk@vger.kernel.org>; Tue, 11 Feb 2025 17:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739294918; cv=none; b=KuycZpAwqmLJAFF374DI0wA6pSvlRoQHz3uq7VaRmDowRWnVc/tMyRO0BSTOLf9pRUMLXw3bXef23ydujhesTzTuIoUQiHvSvsLJ022d1vh+D9roqqR5dGBKOgpzIOablJKlPYPy6Ox1MOQdQlwtqD2BZVzVJQ4oEnoHzhkDMHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739294918; c=relaxed/simple;
	bh=qoSrX8iU6ZsOmDdt2vcxpMmdn8e+H5V+wLsqMb+WXTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SLTEMaWHp3QHe5N72n1tdxe8UCY2KUlGJd5G/KnYS4G/YYo4jXHqw3E49nufnRXbCvakhI9Ex9VHA2oPZYiFtHC+9L4AqqIpfkbOLw/4KuXJJNwihFO4aj6l59+4TIhtgs5q1AX9gbpZGIMd3FXUpdmOXTaHjPVBUvRqfOXTDho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=A5L3XSOE; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4394a823036so18010825e9.0
        for <linux-clk@vger.kernel.org>; Tue, 11 Feb 2025 09:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739294914; x=1739899714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDYe4zVCJHl1J7zmO8YwQPUsImFhukXxkzdj3E5Ja/8=;
        b=A5L3XSOEaczVKW8AeMfejVaXZdguYtpi/ASfz7IMcWD320p4Y4/TWOMkA8s5UEHg2T
         4T8t81j0xe+/6RPMMF+j5R2yLS97dc46a4F5r7b0w1gHitT7tdIBN0s/6rP8KnO/IXSv
         2Ny/LiAN2dWspjN1+M+P6lOyWND23JYOcjIsw3w8dz4iPrmAwo2t5MsdHiQFlOdV9Wql
         hCjIcBoPjsWL/vk0vWqsyBCV5Xg9TxxU2t5OlMcloo2l6XQwyLhvyPl6iWWYvXXXopPj
         obYtH2pBgv0bd4Sa9bxHcEP/E/X/3/00kImO6x3SH+eH6Myk5+3a+RuSLvDjuoDAPdPF
         9dsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739294914; x=1739899714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDYe4zVCJHl1J7zmO8YwQPUsImFhukXxkzdj3E5Ja/8=;
        b=rkS9ZXDI8rEOK8uNyryFuDfn1j+NFc+cMOINb6gpSroPJyVT12EMmk5ENloIsIse69
         6BtkCipWPnBPurCuWFOZV/ScqYmSD3e1kn6TyK1eraKJ+ot0c76cJzeiS4eybLwjPxkS
         oEtFYbN8ehgebGaA7XhGdXLPBWzU2mi0NiwuSNJ/BT8DpR3BZBSczMzWoOyk/VsyLgMc
         FVCDEXTqCmk8X58RweOFTvOnSSKSjx9FTysqezmSecwm+vL0lZLcffyvXd2Ttmu1jZ21
         +ePc5+enLRDxLwfqN1eod4SYhntmX7lWkkxqmzEC82lqDkU+0+x4DbIms2wtz/Mg/5DP
         2XTg==
X-Forwarded-Encrypted: i=1; AJvYcCVyWkPdB1Thc3p79yrc+lOiIlWMgZpvd3jlcG/T4YyU3IkAmB/ady1AUBdfi1cPcfA60FC+v2c6whs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0ztvqLTGyEDDUTujs/vi3EqIYMs0njF4L1hHmnae7ogg02kAP
	daIMRL4pQ1y+qNCRZRxSrEyg5byqBJChXM87hN+GJe+XkxmvxUbD8npX8JTEEhQ=
X-Gm-Gg: ASbGncsXDYnPURpsvtVj4BihU9RM28ZybNAMLsOLPaXonUixtDzipQNx+n6VSXQRIau
	8ZUKo9BonqWs3jDuJDjVqeQSxqAgRy9a/7n/LzIrVYCtqbFTD2c2P2F8BLPdGE/cWS/sEjeO87R
	klgCWD8ZaJuErEMSQ5oSYQO1PkYzL5Jl1u1mqR+ns3hRSp9TyfWP/Y073JyNj5iNyrgCJ6oZZpt
	mnYp7y+VKwbFTLDDvG2Z2m+hBRVc5h1BNxuAOPRTm1ajs8t5wT/PgtVvJsxkKH183nt+53NEiWW
	l1HUOVdrOUnduCDzhg==
X-Google-Smtp-Source: AGHT+IHFkzaOXapiWN4/SxKHetf09scMUxofFapehDhsYxM6Mf+yjBALSpgOHKp7OlGFg6yNQWYZRQ==
X-Received: by 2002:a5d:5f8b:0:b0:38d:cf33:31a1 with SMTP id ffacd0b85a97d-38de92887dbmr644098f8f.23.1739294914574;
        Tue, 11 Feb 2025 09:28:34 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:fc0c:6c04:7ae0:c5c2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38dc6c80df2sm13691082f8f.18.2025.02.11.09.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 09:28:34 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Danilo Krummrich <dakr@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Douglas Anderson <dianders@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Hans de Goede <hdegoede@redhat.com>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v3 4/7] platform: arm64: lenovo-yoga-c630: use the auxiliary device creation helper
Date: Tue, 11 Feb 2025 18:28:01 +0100
Message-ID: <20250211-aux-device-create-helper-v3-4-7edb50524909@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2003; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=qoSrX8iU6ZsOmDdt2vcxpMmdn8e+H5V+wLsqMb+WXTw=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnq4g4/dIaY7N0MjawcCtYO6owHszhAtyjcgr7D
 3Gd3AdMv6qJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ6uIOAAKCRDm/A8cN/La
 hR9uEACtV/xHFmThUeYWuRuZeLIZDjRSGPPZEm0NF1IUEyqMa+/w0GkdSU2I/GhBRDekpL969e+
 flE7DvZyypim/I0FZ9+E91BhWYhmSRaSfH/9/AKcVVKiogJILw22nAQLwHQAU4pI9XrwljjuAbt
 MSgI6Qhm5jlq1GlYCQ/hou9AbHVR9B2Oe4/YFrBkUNxEblpZLIcnrsPVO2FY5baXHpZvJ2k5CAZ
 MSpgdClj9yIkdl580XYiAPYYvwvjElVhwesa1zzt/XSJ1Idm/YRnZRAjDFe/uief6LxhKmzn8Cq
 PTKk6exeDtcsIhy2ONXg2237HCo0rho1EMRdeb/E1B5sDTqLMLKfHFYyvFYva/imfWDg260QPE8
 SB0ucc4PEGbCTcI28Hh+JdOrNP9ChRaJgfsOqR+3qLLQgWYBJ5ScIXYmp0UW91AvMrtqrwf9ySl
 UBWBVpazEhLxSaE9ItQoc2xzaUOqL71se/uZnoCaqvztP8gDdl+8GXSP2/fps5dhBhhCYQi0gi2
 n4q1VatCARnM9Gq2nM8qG9+sE/r+6AOa9faLGrXdf3ZP5y7Z1f9I1TqXigFb/dco4k7vTWAFo3Z
 /tSZVYtq1SnEy4BRJqk9nLxSPeko3sbBy6g+ly8JaELAzWpBynghDBX7iUt8qUwY3k22TI1x6Zi chvp+TE0JiJbh2Q==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp; fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Content-Transfer-Encoding: 8bit

The auxiliary device creation of this driver is simple enough to
use the available auxiliary device creation helper.

Use it and remove some boilerplate code.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/platform/arm64/lenovo-yoga-c630.c | 42 +++----------------------------
 1 file changed, 4 insertions(+), 38 deletions(-)

diff --git a/drivers/platform/arm64/lenovo-yoga-c630.c b/drivers/platform/arm64/lenovo-yoga-c630.c
index 1f05c9a6a89d5ee146144062f5d2e36795c56639..921a93d4ea39ac54344cc964e2805e974cc7e808 100644
--- a/drivers/platform/arm64/lenovo-yoga-c630.c
+++ b/drivers/platform/arm64/lenovo-yoga-c630.c
@@ -191,50 +191,16 @@ void yoga_c630_ec_unregister_notify(struct yoga_c630_ec *ec, struct notifier_blo
 }
 EXPORT_SYMBOL_GPL(yoga_c630_ec_unregister_notify);
 
-static void yoga_c630_aux_release(struct device *dev)
-{
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
-
-	kfree(adev);
-}
-
-static void yoga_c630_aux_remove(void *data)
-{
-	struct auxiliary_device *adev = data;
-
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
-}
-
 static int yoga_c630_aux_init(struct device *parent, const char *name,
 			      struct yoga_c630_ec *ec)
 {
 	struct auxiliary_device *adev;
-	int ret;
-
-	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
-	if (!adev)
-		return -ENOMEM;
-
-	adev->name = name;
-	adev->id = 0;
-	adev->dev.parent = parent;
-	adev->dev.release = yoga_c630_aux_release;
-	adev->dev.platform_data = ec;
 
-	ret = auxiliary_device_init(adev);
-	if (ret) {
-		kfree(adev);
-		return ret;
-	}
-
-	ret = auxiliary_device_add(adev);
-	if (ret) {
-		auxiliary_device_uninit(adev);
-		return ret;
-	}
+	adev = devm_auxiliary_device_create(parent, name, ec, 0);
+	if (IS_ERR(adev))
+		return PTR_ERR(adev);
 
-	return devm_add_action_or_reset(parent, yoga_c630_aux_remove, adev);
+	return 0;
 }
 
 static int yoga_c630_ec_probe(struct i2c_client *client)

-- 
2.45.2


