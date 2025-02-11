Return-Path: <linux-clk+bounces-17879-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9605AA31306
	for <lists+linux-clk@lfdr.de>; Tue, 11 Feb 2025 18:29:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70F267A43E0
	for <lists+linux-clk@lfdr.de>; Tue, 11 Feb 2025 17:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 210E9264615;
	Tue, 11 Feb 2025 17:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="SjDKsjlf"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB942638AD
	for <linux-clk@vger.kernel.org>; Tue, 11 Feb 2025 17:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739294917; cv=none; b=FVLMG/6VNuQgm+TcfeY4BkXMdW1biVA4EAmLIh3NhYnpEZgvZGc/6FPXE5YgEn+9teQJxq3sZzJ8noOBez7U8hPjWS6dQX4iJ7hsXc14QW51EbdeKb/e/PlktBoSmDby9BP/tk4/ptv11aXhAB4pSevMZCgEGoLvk/0I52uyKsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739294917; c=relaxed/simple;
	bh=4I/YUW3hUfV7LW4vqIimfK2wLippJhEosTDRns8e2Tk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GX0i+pZQ630RSNQhQQJVIHZtw7Gt0HCmpYq5ZVjIb9ufnHL1SZk1H2CpHTllvrc7XGvfb+MUUOBLoKwpUVbD8mMZGDxzMm/G87vs63j6ZlQbRY6+Gw3LtZkcnIY5LauFX7Ic5NxRob/qu1JKuG0GROPePsCBPx4VL/9xfuK0JeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=SjDKsjlf; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38dc1dfd9f2so3886155f8f.3
        for <linux-clk@vger.kernel.org>; Tue, 11 Feb 2025 09:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739294912; x=1739899712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O2biH2pTKEoyD3yCVVt7sf7r+6yC9eORZimpeabOUGQ=;
        b=SjDKsjlfU7ysmQrydqCMPSMIAFoaCWi42m3TnHTHDXbczuHFXOhJ9c9T1xTF4JPir5
         pjuF1oWC7teFQEWPpEn7EqmA6gathLcDqWc8tMLxXSzJqukyN1dpWiddaE2hqC/DsoMp
         GasDLhsFKLcCuvdhz5O6/gHuh3QF8uzuymwC9jnBqhOVHsv6jmGB+sh3Mq2wMceHNaMl
         0JPKe6mIAH5y38qwmMK5Yv3IB7fN8aRf8/i4VBIRxjkp3v92BstRt6oeb2b7jHsKzrAl
         6uIWggib/y2fBAvYsyZORLryQ2P3QOnfRVn2rxf6cwfUIUsd5E5ZOm7N8DdINc565jJu
         v1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739294912; x=1739899712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O2biH2pTKEoyD3yCVVt7sf7r+6yC9eORZimpeabOUGQ=;
        b=WNImit+XBR+NUmI49joWYDSrUJ1Xq0ClValPl0zXEV3MU6zOmbjoedxdBKD58GDz6+
         uxJUhnLSOF1L+bilzGfU0UffW+20z0Q7kgev8we0qSS5V0kxPt2T4BJHi82GtilzF54J
         70aYERVn74PuTon10v9bnd4wRB1ZRX47+M27QsP4VV7IzEG5AJRM/T7owsCh0OyOhHN2
         5NXkGi8P9X49IwiOMmaNXJwJD13gaHvZfVOh/IGtm49K8+Lrj7aphvf+NJMDYG4hIwD5
         VjUsq5ug3wFN79TIg7+xRQItXSkx906iq2mLqsJBwaK8HoIC0K5sfeDJ/r2JbzKZ9ECp
         CxRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrRgJzyUs/XAnww/QFsG4RavD6s84WEF36blitrI0Rp3McYREq/Yx/Jt6XNjOM6rPtzUC1zoz9qoE=@vger.kernel.org
X-Gm-Message-State: AOJu0YysEGfloLdL5C7Qxq6DUuuuDYB+c/Pw2g6uXI+zAAYH3+sN1GbS
	Xy3W5KGwhqyxg1hBWD/YWQFdPnLgHBJoU7jyRWTxBuplqzcW8R1bJurGCaj6zzk=
X-Gm-Gg: ASbGnctxJkoIu6wM1GKGzu0nrSaCWvlZ3eQ/CEAy8MgUHa7nbaOyQ3W5Axw/ZAerEN9
	VieldLvJhKZZnD5NXCG503x/pJRW5bOTJtK6zoZgANgawvJSYw5YwbNciRi7s29OjBvm2xMvRJl
	2cYyJDXzNWZe8u+P+O4f8++9BuCwFUcRABVJs1i2c8Cep0upDzmAhpY+l8aYRCv7k28m7BDaeuD
	F77z1v7rqfaJarKXVLxPmIXQ50BHuxVnRI7wUpMvW8mGJK8b/y+K/+IPhsWL09Z9Ey7H+6lzT2h
	e4vpjwng9gjzilHoaQ==
X-Google-Smtp-Source: AGHT+IE/lWpaI6pWVO8Sv+YQSGH06MG0caNle2AbW37wTjANlrKJ9s7lqNySg7B+IZ8uIOLB+l1Tjw==
X-Received: by 2002:a5d:47aa:0:b0:38d:d69e:1314 with SMTP id ffacd0b85a97d-38dd69e1ba1mr9007347f8f.9.1739294912415;
        Tue, 11 Feb 2025 09:28:32 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:fc0c:6c04:7ae0:c5c2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38dc6c80df2sm13691082f8f.18.2025.02.11.09.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 09:28:31 -0800 (PST)
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
Subject: [PATCH v3 3/7] drm/bridge: ti-sn65dsi86: use the auxiliary device creation helper
Date: Tue, 11 Feb 2025 18:28:00 +0100
Message-ID: <20250211-aux-device-create-helper-v3-3-7edb50524909@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4038; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=4I/YUW3hUfV7LW4vqIimfK2wLippJhEosTDRns8e2Tk=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnq4g3KBrsjz/YbGJrLq2rlkWwu0SsOmQVpTCXu
 VtviTS8naaJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ6uINwAKCRDm/A8cN/La
 hV5wD/9CJGF/RCRwHbIbJXrKSWU73Zd91U9+X8P+nRRrN2lbOiILtbHRZF2AXs7l2tOiLDUVf4G
 hypCmzHSVFVgMR06Q7kXrEbTRx0O2Ul1Q07H0IFD4k0xt58ug/V7ezrJ8lMEcM/FcwImcVkoYJ8
 lwmjvrONgcgoZBExdOnJlv1UD+Dddr4Wi+sWDLmDALlFjbDYuQrfZjHc4L2zc9ve8rHjnU0pC6f
 YMm6EjEhHMcFgsbKge/+kkfDcTqsuk4jfLytI2sF2jHT2cwesgQfceYXMsqKePtNCuHTv8Tpp1b
 5nWhj/l8S+yLfIAiVNy2nxba00yx5R4v4NoCPZCX05JCtquBC2WB4CNUzhQYHyHMMQ+ePGN7JKm
 NVtRFVPUx9oJOjGRhqWRi88hiSwNg4QPj+OFtWuOs7D51J/yTJdD5XMgYgADimBsSrLGtGB/1r/
 IorMXfmpkm0xw+RREwA4WKwLMT/KLgfShgDVdmOk4Kbnh4GrUvX/Rspym/xjVfg9es+PgegGjWK
 rCix4SNzCGiSAgOwWvJGJDOCAjzpvnzAHYXnvgCoFs75RSMC9B2KvyOk+IQ1l+9g5tLRkthUfJX
 P2X8n0M0gtdsistRrOtkv7GakcFOKAF6ZmIzmj/mW2xQRBXpnMf+sa95bdok5/LFdpbKMw5knAN dqVQqlnz7A0W1ig==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp; fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Content-Transfer-Encoding: 8bit

The auxiliary device creation of this driver is simple enough to
use the available auxiliary device creation helper.

Use it and remove some boilerplate code.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 84 +++++++++--------------------------
 1 file changed, 20 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index e4d9006b59f1b975cf63e26b221e985206caf867..e583b8ba1fd4f27d98e03d4382e0417bbd50436f 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -454,62 +454,6 @@ static void ti_sn65dsi86_debugfs_init(struct ti_sn65dsi86 *pdata)
 	debugfs_create_file("status", 0600, debugfs, pdata, &status_fops);
 }
 
-/* -----------------------------------------------------------------------------
- * Auxiliary Devices (*not* AUX)
- */
-
-static void ti_sn65dsi86_uninit_aux(void *data)
-{
-	auxiliary_device_uninit(data);
-}
-
-static void ti_sn65dsi86_delete_aux(void *data)
-{
-	auxiliary_device_delete(data);
-}
-
-static void ti_sn65dsi86_aux_device_release(struct device *dev)
-{
-	struct auxiliary_device *aux = container_of(dev, struct auxiliary_device, dev);
-
-	kfree(aux);
-}
-
-static int ti_sn65dsi86_add_aux_device(struct ti_sn65dsi86 *pdata,
-				       struct auxiliary_device **aux_out,
-				       const char *name)
-{
-	struct device *dev = pdata->dev;
-	struct auxiliary_device *aux;
-	int ret;
-
-	aux = kzalloc(sizeof(*aux), GFP_KERNEL);
-	if (!aux)
-		return -ENOMEM;
-
-	aux->name = name;
-	aux->dev.parent = dev;
-	aux->dev.release = ti_sn65dsi86_aux_device_release;
-	device_set_of_node_from_dev(&aux->dev, dev);
-	ret = auxiliary_device_init(aux);
-	if (ret) {
-		kfree(aux);
-		return ret;
-	}
-	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_uninit_aux, aux);
-	if (ret)
-		return ret;
-
-	ret = auxiliary_device_add(aux);
-	if (ret)
-		return ret;
-	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_delete_aux, aux);
-	if (!ret)
-		*aux_out = aux;
-
-	return ret;
-}
-
 /* -----------------------------------------------------------------------------
  * AUX Adapter
  */
@@ -671,7 +615,12 @@ static int ti_sn_aux_probe(struct auxiliary_device *adev,
 	 * The eDP to MIPI bridge parts don't work until the AUX channel is
 	 * setup so we don't add it in the main driver probe, we add it now.
 	 */
-	return ti_sn65dsi86_add_aux_device(pdata, &pdata->bridge_aux, "bridge");
+	pdata->bridge_aux = devm_auxiliary_device_create(pdata->dev, "bridge",
+							 NULL, 0);
+	if (IS_ERR(pdata->bridge_aux))
+		return PTR_ERR(pdata->bridge_aux);
+
+	return 0;
 }
 
 static const struct auxiliary_device_id ti_sn_aux_id_table[] = {
@@ -1950,15 +1899,17 @@ static int ti_sn65dsi86_probe(struct i2c_client *client)
 	 */
 
 	if (IS_ENABLED(CONFIG_OF_GPIO)) {
-		ret = ti_sn65dsi86_add_aux_device(pdata, &pdata->gpio_aux, "gpio");
-		if (ret)
-			return ret;
+		pdata->gpio_aux = devm_auxiliary_device_create(pdata->dev, "gpio",
+							       NULL, 0);
+		if (IS_ERR(pdata->gpio_aux))
+			return PTR_ERR(pdata->gpio_aux);
 	}
 
 	if (IS_ENABLED(CONFIG_PWM)) {
-		ret = ti_sn65dsi86_add_aux_device(pdata, &pdata->pwm_aux, "pwm");
-		if (ret)
-			return ret;
+		pdata->pwm_aux = devm_auxiliary_device_create(pdata->dev, "pwm",
+							      NULL, 0);
+		if (IS_ERR(pdata->pwm_aux))
+			return PTR_ERR(pdata->pwm_aux);
 	}
 
 	/*
@@ -1967,7 +1918,12 @@ static int ti_sn65dsi86_probe(struct i2c_client *client)
 	 * AUX channel is there and this is a very simple solution to the
 	 * dependency problem.
 	 */
-	return ti_sn65dsi86_add_aux_device(pdata, &pdata->aux_aux, "aux");
+	pdata->aux_aux = devm_auxiliary_device_create(pdata->dev, "aux",
+						      NULL, 0);
+	if (IS_ERR(pdata->aux_aux))
+		return PTR_ERR(pdata->aux_aux);
+
+	return 0;
 }
 
 static const struct i2c_device_id ti_sn65dsi86_id[] = {

-- 
2.45.2


