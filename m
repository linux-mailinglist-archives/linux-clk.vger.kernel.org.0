Return-Path: <linux-clk+bounces-20108-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48537A79F48
	for <lists+linux-clk@lfdr.de>; Thu,  3 Apr 2025 11:02:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1EFC3B76DD
	for <lists+linux-clk@lfdr.de>; Thu,  3 Apr 2025 09:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B5B524EAA6;
	Thu,  3 Apr 2025 08:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rVFmg+Vy"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D303624290B
	for <linux-clk@vger.kernel.org>; Thu,  3 Apr 2025 08:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670767; cv=none; b=rUFQ+zC1F5PQuajP5ETICr4ryIv/1jRZB+h93KpqhP4lPshVgYrM28mkhcNlVpcXg16ktECoJyGGuQcub0fyoQNRu9qFYJMTqHg+wHJoYafwPkSsgfzfm4rW1tNxcC9WmV/Sf+OiDHMbcZW5oudQwAam7RG8pUtxKMW8C8ICsLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670767; c=relaxed/simple;
	bh=sbOiK9Z/f00bA00NdDdv7dxhs7NOGeZKoor5kyfk8Ho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IushiUZ/U9LjWVbajsTqNNTq9gX/Qb1eL/gV5ncd7HHY89AX7TJ7EwYITQzLxP5cyGg74WlhzxsdmPaD2NZ1eNGq4WP/0joQdvJDEW/XD6QXDy2Phikt5vCfEcSOd5ibDjUO+IxUVQ3BSOh241WxEMCA3Nu3PTD8pEEMTdFhwWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rVFmg+Vy; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e60cfef9cfso1043507a12.2
        for <linux-clk@vger.kernel.org>; Thu, 03 Apr 2025 01:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670757; x=1744275557; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RKjSO+JBCZWmTR2KI3Lfut4sG9sU0pAz1iqONtK29C8=;
        b=rVFmg+VyKzAk5QLjyChTYgfPRekK4WenzUvJ7mVXRfVE+xZISBqFq2BDbyo5ePSO/i
         b6UFl8BEfdBBenn5GFtYriyK8o8E1voPDl5bBlWgyhLtBgXU3bQoxCHffp2TDC3CES6M
         AOihCczzHCz2rZcyyLf7JW3DDjApWgnqPqZrquyI1VMh+bvUbOomVIUyk7tOXSgaLKzN
         3ttkcgunBYQ5xFPX+YeZbM9AXNYDjdkjj68hSDh1tFE9PoywQXULvxFF496aVnLSXlXP
         EcK8DpIsj/tfUO9nadYQuYXaioZ9Z0J7xb9DIGT9njOQ8iTCalhXA7JIHz0hSe762MXd
         urqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670757; x=1744275557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RKjSO+JBCZWmTR2KI3Lfut4sG9sU0pAz1iqONtK29C8=;
        b=QpaJqV2UNHH4lO779jIH8sbbTLto1w76ON+giA+MXoDy85RF864heK4lx/peUc0Os/
         mc9D4NakKCoXwo3v3AEsogZmSHc5IeouHImMbc27WDpdlyuhaH0xlRXOWhhfeG6ayg1Q
         LCOwfbh0aWdUO7Os6tSKFFAvs/NZoU6tuphgWTBP8/3/ch50+N5eeZnFdfcZE2mg1brS
         3nUy0OFEutxP72Z8o75zguLowfjYYHCKXqQUitGtgsg/sRlByl5rbG7WyIt8INEofJG0
         ORvNcKWmnW9ANOUXgn4Kcyrdcvb+VcEQ2UcBEkImXA82R2FXR5GNZ8MqE0zM7SB+KD9B
         /fRA==
X-Forwarded-Encrypted: i=1; AJvYcCUzPgUw4XeA7CdbWl5FbtTX+ewv6pMDPhsAhUYXxAFS5U8BF9sGqAjqfwGf3P1pkKGBK68iLwkDddE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDYdmJ/jjfEUzw+LeXkeiWgFPdxZR2sCx7vAgLHMZkO82goTx8
	QBIKUkHyvX9NHeKD/BOEh0b9FCPcsZ1oEPX+2YgG4jD1jtEsonjf8ivVMITsJMo=
X-Gm-Gg: ASbGnctRgPafwxCmmettntSOpsKZUUkrXIL6Hu7479LwN3s8Ph7sr/RKJLmyeTG0Vrg
	9Oh2Z/LQFqDkVK7A3cIhyicdm7GmVVin9ZRcGZXIPD/kk8HimFoIcKdXHU1JWW70gShEI3RC+pW
	ZsHgerajV4Or3/duGa9wCmLBJ4lSpMkc9YA6GislP+bB6Q7FHqL/p9Ex+nmmX9Mo1KcU2jcHaU7
	xq0Ry/NMCnaQf17uhcbRvsqms/PQCQjOu415+NlhBH5c8jE4kqTAO4nwljvWklzr6rx2ypsKZ7b
	jpclHXCLOMf996JPqLD4NhAmuICtoYynTYzJGN08BX86LjEHVbw2/lcCmiHvxVjWmkqWYroBkYb
	WcwdenhxOku/dMJaNQs08E/RLwQn2
X-Google-Smtp-Source: AGHT+IF6fx+pJv4iCabB+Gq0Y1FWCxO1y1Kv+NIBC2jENVtzdFZG3oNJuULm8j69u/Q8i/sO7cV86g==
X-Received: by 2002:a05:6402:3204:b0:5f0:82cd:500b with SMTP id 4fb4d7f45d1cf-5f082cd5216mr2775019a12.19.1743670756751;
        Thu, 03 Apr 2025 01:59:16 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:16 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:19 +0100
Subject: [PATCH v3 27/32] rtc: s5m: add support for S2MPG10 RTC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-27-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Add support for Samsung's S2MPG10 PMIC RTC, which is similar to the
existing PMIC RTCs supported by this driver.

S2MPG10 doesn't use I2C, so we expect the core driver to have created a
regmap for us.

Additionally, it can be used for doing a cold-reset. If requested to do
so (via DT), S2MPG10 is programmed with a watchdog configuration that
will perform a full power cycle upon watchdog expiry.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 86ccf666c68059408907c97f2647716ffaad10c6..0d8783577bab4f4ebe61050dbd68387d970773bd 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -11,6 +11,7 @@
 #include <linux/i2c.h>
 #include <linux/bcd.h>
 #include <linux/regmap.h>
+#include <linux/reboot.h>
 #include <linux/rtc.h>
 #include <linux/platform_device.h>
 #include <linux/mfd/samsung/core.h>
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
+	} else if (id->driver_data == S2MPG10) {
+		info->regs = &s2mpg10_rtc_regs;
+		alarm_irq = S2MPG10_IRQ_RTCA0;
 	} else {
 		return dev_err_probe(&pdev->dev, -ENODEV,
 				     "Unsupported device type %lu\n",
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
2.49.0.472.ge94155a9ec-goog


