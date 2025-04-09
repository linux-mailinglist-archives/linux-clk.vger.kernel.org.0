Return-Path: <linux-clk+bounces-20393-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C97A8327F
	for <lists+linux-clk@lfdr.de>; Wed,  9 Apr 2025 22:40:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC7AE3BD471
	for <lists+linux-clk@lfdr.de>; Wed,  9 Apr 2025 20:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CDF4227581;
	Wed,  9 Apr 2025 20:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="chJUj7jt"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D999B2135A1
	for <linux-clk@vger.kernel.org>; Wed,  9 Apr 2025 20:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231076; cv=none; b=c+WEvZy6uXTG7fUyVGB3C8rBy2m/RigLaqzqI0djZlt9N6MNQab8jNaHyPPV4EtE4tcrPrOPdnbmH+MLYoHc54W2AgoZHTOL36X9xz83lGbUrM1qm8AZspnx2O6OHgrxAUpCrcjfQTBKiNVzqnflKli+FFgNkj+okhweC7/BhFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231076; c=relaxed/simple;
	bh=6MAg2XALis+Rtua2lDVBlN4I/q6DE1qmn9E7X0+PP3U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aO7zZxWDQZrn/IYHank9j+cNcGIKJDzVo/x14haCnwSF62n/EDDier54KOQv0IAtpq2tNJWiLRHmN/P0Y4u4uHexK4bGsun76gJUMaku/i0fRCblSy20tZD3sMZK/fW37gOYnqat37k4WbWe5HIw8JvfsmRGGryM9SFPMEDk5AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=chJUj7jt; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e61da95244so188377a12.2
        for <linux-clk@vger.kernel.org>; Wed, 09 Apr 2025 13:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231063; x=1744835863; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tv6T8/JtNiPh/U9srmK1zriSPC7xSek3blAJnMyaQM0=;
        b=chJUj7jt/pif+O5xRFfOatyWKBZw/6diXVoYp0SXWS1x331yT9skOKjatRp4SdNUSp
         cJKmKB7bzAN+2Wze7f8f696SZ29+W0g9Jcv9xLo/hf3DNunDmyQruInM5o4zFpQuQB2j
         mNslGTWvdTbX3tuZTdAJLY85aeovWqypgJuxq6ss+3W7saEcSa17bskOL7SZcrFf/e8G
         2YW05s/0c2xLkLVeI9kasQ14JV5u5sxAhEHuxvx6ozXV6/MtsvkZsOGij+NLoJUNqBMZ
         o7fHpVbcv6uBOPL7FYjUmimL9oIP8BNBwyHWQ6p/HwaNDXr44C3ILG3MwgzxKTc7Qt7B
         E5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231063; x=1744835863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tv6T8/JtNiPh/U9srmK1zriSPC7xSek3blAJnMyaQM0=;
        b=QATwe5Ru53HNOAcAxcaM5VUSf5qMOiwOGWADA6Q0EtwS1QydltTPbGlYxrQ4fKv3R3
         +JK9rmaqDNrK4ruLNYMMcLa+0eyHEpATbLw2T1Hlx386AxnV7rwKYVBUc7pspKmJ2lPv
         hQLEksZGLZ2v3MDn7e8YrZ5pjLtaCZlbjrm2VF7vLR0ikHpzfT+ymFbD5Tl3XtRR/6OI
         KzlONh1NGRBfzli7K5e4y0oue8GGRubWsrf40a30b8ZogetY1EHtNo1aPovJDjqvlO8x
         f1Qrsx8O9ctwRvyL3jpwFKoA1Vby5HKaUCF/WQMPyffx7oTdBGnWHjus/OmliZA6gQ2/
         HRuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBuZUmnDD14Ew4SblukI4vN4JzpBgHI6R0CdzXaCFzvifG+0zWHr10mmXAe84ZJ7VkmG3YO6nxyUg=@vger.kernel.org
X-Gm-Message-State: AOJu0YymNj8UfnD+Pv+7iMzmRLaylUjkQIu+bNvokS3SeBXCF8sc60QR
	F6yz0tS5d7FX9+b/rCj+yjxgkRSL0FgQI2swAYAo56o2jEhn92yLS73QPQkk1yQ=
X-Gm-Gg: ASbGncsdiaPI1sn3D2LjebmcNtK4CoFaE8xNjnlExzTbMSOJW8BG4gpBCeeHFfZQqbI
	oJIx1inmENrSQH9PdL/mNxpCPdgxlyZK0lAJyFV2vCQnx/hcKYfT55EfAUjOzCL9E6KobhvJJCc
	ihRJALQTvk5T+5HnqrCZpsNjFVxGnOyOpprT5om2lkRhnL9ucsTjOQaY2NOw27LSO1U2MrCCyWJ
	kBSutxhqIxhB+Sl2vGR+N97wfYCclp1gxXNGlXglTl20Y9XZIDQ8lEfK/yKlElD0ayhydQH/lbY
	RWFgcSCTExS1Lth2c93jubKZ1PF8HPuUmoq7fOi8rWIk4SKAMdUWeN693LfCWjRQnUfT/bSaiYU
	iWQH34elXZ5I6nqt76Ft2BA3PWN3vvTt8Nw6+MA==
X-Google-Smtp-Source: AGHT+IHuFxbIJJjU+odGQEb+Z2z7HvoeRr2IGwkfZgpVlPcf92trUW7rJVrEbL1uMQYZ7TzU/wGXvA==
X-Received: by 2002:a17:907:608d:b0:ac3:8895:2776 with SMTP id a640c23a62f3a-acabd12c4b4mr7347566b.5.1744231063463;
        Wed, 09 Apr 2025 13:37:43 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:43 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:48 +0100
Subject: [PATCH v4 27/32] rtc: s5m: add support for S2MPG10 RTC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-27-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

Add support for Samsung's S2MPG10 PMIC RTC, which is similar to the
existing PMIC RTCs supported by this driver.

S2MPG10 doesn't use I2C, so we expect the core driver to have created a
regmap for us.

Additionally, it can be used for doing a cold-reset. If requested to do
so (via DT), S2MPG10 is programmed with a watchdog configuration that
will perform a full power cycle upon watchdog expiry.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v4:
- keep headers as alphabetical as possible (Krzysztof)
---
 drivers/rtc/rtc-s5m.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index f8abcdee8611d1181fb575aeb8d094360538ca7e..c6394faaee860427e8b84e9c6df2d8229cf06d93 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/i2c.h>
 #include <linux/bcd.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/rtc.h>
 #include <linux/platform_device.h>
@@ -53,6 +54,7 @@ enum {
  * Device     | Write time | Read time | Write alarm
  * =================================================
  * S5M8767    | UDR + TIME |           | UDR
+ * S2MPG10    | WUDR       | RUDR      | AUDR
  * S2MPS11/14 | WUDR       | RUDR      | WUDR + RUDR
  * S2MPS13    | WUDR       | RUDR      | WUDR + AUDR
  * S2MPS15    | WUDR       | RUDR      | AUDR
@@ -99,6 +101,20 @@ static const struct s5m_rtc_reg_config s5m_rtc_regs = {
 	.write_alarm_udr_mask	= S5M_RTC_UDR_MASK,
 };
 
+/* Register map for S2MPG10 */
+static const struct s5m_rtc_reg_config s2mpg10_rtc_regs = {
+	.regs_count		= 7,
+	.time			= S2MPG10_RTC_SEC,
+	.ctrl			= S2MPG10_RTC_CTRL,
+	.alarm0			= S2MPG10_RTC_A0SEC,
+	.alarm1			= S2MPG10_RTC_A1SEC,
+	.udr_update		= S2MPG10_RTC_UPDATE,
+	.autoclear_udr_mask	= S2MPS15_RTC_WUDR_MASK | S2MPS15_RTC_AUDR_MASK,
+	.read_time_udr_mask	= S2MPS_RTC_RUDR_MASK,
+	.write_time_udr_mask	= S2MPS15_RTC_WUDR_MASK,
+	.write_alarm_udr_mask	= S2MPS15_RTC_AUDR_MASK,
+};
+
 /* Register map for S2MPS13 */
 static const struct s5m_rtc_reg_config s2mps13_rtc_regs = {
 	.regs_count		= 7,
@@ -238,6 +254,7 @@ static int s5m_check_peding_alarm_interrupt(struct s5m_rtc_info *info,
 		ret = regmap_read(info->regmap, S5M_RTC_STATUS, &val);
 		val &= S5M_ALARM0_STATUS;
 		break;
+	case S2MPG10:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -300,6 +317,7 @@ static int s5m8767_rtc_set_alarm_reg(struct s5m_rtc_info *info)
 	case S5M8767X:
 		data &= ~S5M_RTC_TIME_EN_MASK;
 		break;
+	case S2MPG10:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -351,6 +369,7 @@ static int s5m_rtc_read_time(struct device *dev, struct rtc_time *tm)
 
 	switch (info->device_type) {
 	case S5M8767X:
+	case S2MPG10:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -374,6 +393,7 @@ static int s5m_rtc_set_time(struct device *dev, struct rtc_time *tm)
 
 	switch (info->device_type) {
 	case S5M8767X:
+	case S2MPG10:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -411,6 +431,7 @@ static int s5m_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 
 	switch (info->device_type) {
 	case S5M8767X:
+	case S2MPG10:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -449,6 +470,7 @@ static int s5m_rtc_stop_alarm(struct s5m_rtc_info *info)
 
 	switch (info->device_type) {
 	case S5M8767X:
+	case S2MPG10:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -487,6 +509,7 @@ static int s5m_rtc_start_alarm(struct s5m_rtc_info *info)
 
 	switch (info->device_type) {
 	case S5M8767X:
+	case S2MPG10:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -524,6 +547,7 @@ static int s5m_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 
 	switch (info->device_type) {
 	case S5M8767X:
+	case S2MPG10:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -604,6 +628,7 @@ static int s5m8767_rtc_init_reg(struct s5m_rtc_info *info)
 		ret = regmap_raw_write(info->regmap, S5M_ALARM0_CONF, data, 2);
 		break;
 
+	case S2MPG10:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -634,6 +659,25 @@ static int s5m8767_rtc_init_reg(struct s5m_rtc_info *info)
 	return ret;
 }
 
+static int s5m_rtc_restart_s2mpg10(struct sys_off_data *data)
+{
+	struct s5m_rtc_info *info = data->cb_data;
+	int ret;
+
+	if (data->mode != REBOOT_COLD && data->mode != REBOOT_HARD)
+		return NOTIFY_DONE;
+
+	/*
+	 * Arm watchdog with maximum timeout (2 seconds), and perform full reset
+	 * on expiry.
+	 */
+	ret = regmap_set_bits(info->regmap, S2MPG10_RTC_WTSR,
+			      (S2MPG10_WTSR_COLDTIMER | S2MPG10_WTSR_COLDRST
+			       | S2MPG10_WTSR_WTSRT | S2MPG10_WTSR_WTSR_EN));
+
+	return ret ? NOTIFY_BAD : NOTIFY_DONE;
+}
+
 static int s5m_rtc_probe(struct platform_device *pdev)
 {
 	struct sec_pmic_dev *s5m87xx = dev_get_drvdata(pdev->dev.parent);
@@ -689,6 +733,9 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 		if (IS_ERR(info->regmap))
 			return dev_err_probe(&pdev->dev, PTR_ERR(info->regmap),
 					     "Failed to allocate regmap\n");
+	} else if (device_type == S2MPG10) {
+		info->regs = &s2mpg10_rtc_regs;
+		alarm_irq = S2MPG10_IRQ_RTCA0;
 	} else {
 		return dev_err_probe(&pdev->dev, -ENODEV,
 				     "Unsupported device type %d\n",
@@ -735,6 +782,18 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 		device_init_wakeup(&pdev->dev, true);
 	}
 
+	if (of_device_is_system_power_controller(pdev->dev.parent->of_node) &&
+	    info->device_type == S2MPG10) {
+		ret = devm_register_sys_off_handler(&pdev->dev,
+						    SYS_OFF_MODE_RESTART,
+						    SYS_OFF_PRIO_HIGH + 1,
+						    s5m_rtc_restart_s2mpg10,
+						    info);
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret,
+				       "Failed to register restart handler\n");
+	}
+
 	return devm_rtc_register_device(info->rtc_dev);
 }
 
@@ -766,6 +825,7 @@ static SIMPLE_DEV_PM_OPS(s5m_rtc_pm_ops, s5m_rtc_suspend, s5m_rtc_resume);
 
 static const struct platform_device_id s5m_rtc_id[] = {
 	{ "s5m-rtc",		S5M8767X },
+	{ "s2mpg10-rtc",	S2MPG10 },
 	{ "s2mps13-rtc",	S2MPS13X },
 	{ "s2mps14-rtc",	S2MPS14X },
 	{ "s2mps15-rtc",	S2MPS15X },

-- 
2.49.0.604.gff1f9ca942-goog


