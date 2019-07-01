Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B8735B7B3
	for <lists+linux-clk@lfdr.de>; Mon,  1 Jul 2019 11:14:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728361AbfGAJNO (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 1 Jul 2019 05:13:14 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50656 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728346AbfGAJNO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 1 Jul 2019 05:13:14 -0400
Received: by mail-wm1-f68.google.com with SMTP id n9so3133710wmi.0
        for <linux-clk@vger.kernel.org>; Mon, 01 Jul 2019 02:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qYJwtVX2r7KnFTDIFCTGswCpHKhjGFZMmXuYYyexqis=;
        b=r81XUdllxw5uXCyKEsvqIiwFjD4+Lrm0Imlfz2u7g/nBUVEQ/H/q2CcOkbeh1IoekK
         XqmukpLUNFQgaTn4IzOvgmZdqpd98YvfrZ7VM1YVyM7O5eDofTXxiSS1mEh+NDA/Dbr/
         Z3rI9N48FtEgbYu/2B2DhrOANpStsKc6vG9zfUvuIwAIhkKO792IlVEEN/ne/3TDpBV2
         UMhi4YZeH4ltR34+Y1erlZG1nyZ5RNqBMezdYHN4zSt9QqeyPrjfBFHM9wEpAnv1QO1z
         /3GabGCSPZoKQPdlx6VzaT707o+ONkoZ9Yy3YgxKcPSkOCS95zyEqQqYpKHXjSJMRrcy
         iJ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qYJwtVX2r7KnFTDIFCTGswCpHKhjGFZMmXuYYyexqis=;
        b=PoRjYZPiCZAt8tT25sVBHxLneKhJA4TSKacFdVWo4n8DgAEIb7Yzaoql02UG70s6Zx
         pKy298qPRaGNQF/EUO3y1Wu6sxIWe0HizrNGyayOlYUV/iiF2iXAtweP7Pl34/gFp/+O
         t2EAhv7GdXUxvk75b9/JHXIXGpkCf+SNsAd3Mo908rFjQqXKduRWo6s31bk2EVl5f1VR
         s8cNuc9b0eiBCJjEn99YCGYMksMyoi7Gb20eQ6DooaRYBJ5wJb2UAhyho042gwsWD8u0
         gLhvLVUbTXwDqI7uZs2Jh+3uYWVQRz9tOUlj0OOsAai3mdnVqy5RlOfzB5Rl4vRl34yR
         eUUA==
X-Gm-Message-State: APjAAAU2VFmRskIWmhfgubxCsiTdIUnPbUjZ/eoDapKItI18QxFBgDV8
        OCXPL3b7NCy761eW4GYQMWQQKg==
X-Google-Smtp-Source: APXvYqyKAKMyxCAc6vR2xD8svMCql407vi8e1s9D1IiPlHCg1OCzLfGcgLf5UyySc+lgVIZBWOUuTA==
X-Received: by 2002:a05:600c:303:: with SMTP id q3mr16802095wmd.130.1561972391870;
        Mon, 01 Jul 2019 02:13:11 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id i16sm6305659wrm.37.2019.07.01.02.13.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 01 Jul 2019 02:13:11 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, khilman@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        linux-gpio@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC/RFT v3 01/14] pinctrl: meson-g12a: add pwm_a on GPIOE_2 pinmux
Date:   Mon,  1 Jul 2019 11:12:45 +0200
Message-Id: <20190701091258.3870-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190701091258.3870-1-narmstrong@baylibre.com>
References: <20190701091258.3870-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the missing pinmux for the pwm_a function on the GPIOE_2 pin.

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/pinctrl/meson/pinctrl-meson-g12a.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-g12a.c b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
index d494492e98e9..f69af4fa7cf8 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-g12a.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
@@ -801,6 +801,9 @@ static const unsigned int remote_ao_input_pins[]	= { GPIOAO_5 };
 /* ir_out */
 static const unsigned int remote_ao_out_pins[]		= { GPIOAO_4 };
 
+/* pwm_a_e */
+static const unsigned int pwm_a_e_pins[]		= { GPIOE_2 };
+
 /* pwm_ao_a */
 static const unsigned int pwm_ao_a_pins[]		= { GPIOAO_11 };
 static const unsigned int pwm_ao_a_hiz_pins[]		= { GPIOAO_11 };
@@ -888,6 +891,7 @@ static struct meson_pmx_group meson_g12a_aobus_groups[] = {
 	GROUP(i2c_ao_slave_sda,		3),
 	GROUP(remote_ao_input,		1),
 	GROUP(remote_ao_out,		1),
+	GROUP(pwm_a_e,			3),
 	GROUP(pwm_ao_a,			3),
 	GROUP(pwm_ao_a_hiz,		2),
 	GROUP(pwm_ao_b,			3),
@@ -1192,6 +1196,10 @@ static const char * const remote_ao_out_groups[] = {
 	"remote_ao_out",
 };
 
+static const char * const pwm_a_e_groups[] = {
+	"pwm_a_e",
+};
+
 static const char * const pwm_ao_a_groups[] = {
 	"pwm_ao_a", "pwm_ao_a_hiz",
 };
@@ -1290,6 +1298,7 @@ static struct meson_pmx_func meson_g12a_aobus_functions[] = {
 	FUNCTION(i2c_ao_slave),
 	FUNCTION(remote_ao_input),
 	FUNCTION(remote_ao_out),
+	FUNCTION(pwm_a_e),
 	FUNCTION(pwm_ao_a),
 	FUNCTION(pwm_ao_b),
 	FUNCTION(pwm_ao_c),
-- 
2.21.0

