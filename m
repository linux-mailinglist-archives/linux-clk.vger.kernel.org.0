Return-Path: <linux-clk+bounces-19961-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 413A6A74B4A
	for <lists+linux-clk@lfdr.de>; Fri, 28 Mar 2025 14:44:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 630433A49B6
	for <lists+linux-clk@lfdr.de>; Fri, 28 Mar 2025 13:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A205C21CC46;
	Fri, 28 Mar 2025 13:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gORXIOrL"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992A61A841C
	for <linux-clk@vger.kernel.org>; Fri, 28 Mar 2025 13:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168677; cv=none; b=N7Qg9klNwswUjLBHDWjSfZyPi78fQSa6I/QmYfsq5KE94jEzvTsDNOJFy65KbsbsCQUOL6XW/1T67Mx0jMM6EveKa0c5W6pfMsUPFdPg0ddGASwnWklqC3FvEA5Znk6+xn+h0+cZo0cM/blwSPlNmsocBYQ3Wf2LgsftW1OZqzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168677; c=relaxed/simple;
	bh=YO4AyBJQaRYJNR3M/qB00qaKZDbH/de1lTqDCM4IY8M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rZExcup1C2tuh+y531au7JiZD3+i+rcB17DAKvJ6ZBdt1iVnMOiTFKumC1Sv4rYfG07e9Pk3OkfoyC54N1h4NpSYngC5M1wb8rV4T6hJ1YuXHRJZlcYaerAfM8miOG+KqWubSyAM/t/X3sbMXijYgkV67NDwTTT1b/dp7o9D8Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gORXIOrL; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5dccaaca646so3972884a12.0
        for <linux-clk@vger.kernel.org>; Fri, 28 Mar 2025 06:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168666; x=1743773466; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6KRr6Qm0gpuwraE+pyT1hJyit2ZkidoO0SCeL3UgR+0=;
        b=gORXIOrLV0Reqn502HStGud/KS6kxHJt9isdhCx3dPSaS8AXIHBWsH8TTydPylvhFG
         O8KJ2SRRownPzmDgjjDtF4y5XCcH50tQ17eFiYLTUQYy871O05MgFiKnVqs8PBKw5k3I
         xGwTbw6MTD5tI0omjwLsnCk3vKwpVFL3UHeoJ96Tu8uTLmS549Z931MzhcjetYfJZYfD
         t25nA5RmANq5WtSw/w+muie6xqkpUL+f3ydVr1qbG2vPVlLXBRz34ea8x8UnzPrMQIsP
         JZFNu7DrezOTD7mvZ8dkLef25WWRen83ttLZCfr7hmiIMyzyP//savSWV8221WfsicT7
         RHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168666; x=1743773466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6KRr6Qm0gpuwraE+pyT1hJyit2ZkidoO0SCeL3UgR+0=;
        b=hhY0A3/ThQQcD4CGJzWpmShxjpSxLa2suBsP3iWochAE2ffDcODR/O8a/7rXDH58AT
         lw0OG15QkXpFcZEZ2pjBGPMuFyLpxs6pku7IBen+OnPOVhl3OigWOvrJikSH9Wuo/IS9
         O6aFzgDVTq15eK8og8chQDFRmvojlKQTRqHk+5RppcLbBXqfcvsHGkLplxKNtjbILuaG
         3AOYv6WfLvHjcYmwj5xyhqMiVD9IZoj+w1bhO2IQrBiefaeSTcxW7QBxra4TeFLdN31l
         xGY3fRSyjc2lrZP8SlfRVp3wXrUcIvjC1E+ba8O4GyKboUFSbVJH89/2XUIxlbSwYDpb
         oKEw==
X-Forwarded-Encrypted: i=1; AJvYcCWveR5KObbHmy8GNRw6ps9XY1ywsBPn2niQqK80BZRKUX3dHVa+TttKiJxxtGISSoYXD65n8pAwbE0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUmXL+NtMcJvyMUEphbuKYrr+SFT+/8w3O+VjEKx5ShnNtQTjr
	ZugFVxsYGQPBwuO1UFxhT2KtrFJODLK7hQ706RPzMsoGVcpvE/Mp3m1zDSS7igs=
X-Gm-Gg: ASbGncsmPR7JO1/pczV/10dYzNuNpslJ9lNt5fjBw/qg1kLfOSfT0rsa3MvXDFZW8Id
	YSgwahLxebkwij1+6c0d2GMefzWxNPk5Tw51t5XGbQjVpnWS4IJtOsiN7rMHp4tqqv8Ja0MTS8v
	tO+jVROlHwNzeVxKEL+rDi3XAXuwXejJNByGFDkOmj9jI3hCSFb09vhmNunqZhiqcq4q6wNeFCz
	XnsBwOHwo59+zhM/qg+Epcc9OZAY7WxAZq3MYTXgccgLt4i/7HzyNO1qqv7yEqnS96Dyxogxgrn
	hi1GhBHforlmDJzgFXAKCP83eY7RH6oSeVBqlKQytXqbZwIVTliylUBIlBsWv99eLzDb/S4bVQW
	eD/LFzBB5OTDz1sRFQju4u8f1OC2E
X-Google-Smtp-Source: AGHT+IG7PqQiTAeCLYeu4XFO7xoUmzB0J+twGC6cGhlHhLLeNWFRkIRumwPXFqyHrKLHI6/YYrbfIg==
X-Received: by 2002:a05:6402:241d:b0:5ec:6feb:5742 with SMTP id 4fb4d7f45d1cf-5edc4c93702mr2791136a12.16.1743168666473;
        Fri, 28 Mar 2025 06:31:06 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:06 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:10 +0000
Subject: [PATCH v2 24/32] clk: s2mps11: add support for S2MPG10 PMIC clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-24-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
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

Add support for Samsung's S2MPG10 PMIC clock, which is similar to the
existing PMIC clocks supported by this driver.

S2MPG10 has three clock outputs @ 32kHz: AP, peri1 and peri2.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/clk-s2mps11.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
index 8ddf3a9a53dfd5bb52a05a3e02788a357ea77ad3..92c8d36dafcf8a448873567fb3541a1b90cd9837 100644
--- a/drivers/clk/clk-s2mps11.c
+++ b/drivers/clk/clk-s2mps11.c
@@ -11,6 +11,7 @@
 #include <linux/regmap.h>
 #include <linux/clk-provider.h>
 #include <linux/platform_device.h>
+#include <linux/mfd/samsung/s2mpg10.h>
 #include <linux/mfd/samsung/s2mps11.h>
 #include <linux/mfd/samsung/s2mps13.h>
 #include <linux/mfd/samsung/s2mps14.h>
@@ -140,6 +141,9 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
 	clk_data->num = S2MPS11_CLKS_NUM;
 
 	switch (hwid) {
+	case S2MPG10:
+		s2mps11_reg = S2MPG10_PMIC_RTCBUF;
+		break;
 	case S2MPS11X:
 		s2mps11_reg = S2MPS11_REG_RTC_CTRL;
 		break;
@@ -221,6 +225,7 @@ static void s2mps11_clk_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id s2mps11_clk_id[] = {
+	{ "s2mpg10-clk", S2MPG10},
 	{ "s2mps11-clk", S2MPS11X},
 	{ "s2mps13-clk", S2MPS13X},
 	{ "s2mps14-clk", S2MPS14X},
@@ -241,6 +246,9 @@ MODULE_DEVICE_TABLE(platform, s2mps11_clk_id);
  */
 static const struct of_device_id s2mps11_dt_match[] __used = {
 	{
+		.compatible = "samsung,s2mpg10-clk",
+		.data = (void *)S2MPG10,
+	}, {
 		.compatible = "samsung,s2mps11-clk",
 		.data = (void *)S2MPS11X,
 	}, {

-- 
2.49.0.472.ge94155a9ec-goog


