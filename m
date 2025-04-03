Return-Path: <linux-clk+bounces-20113-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A828DA79F77
	for <lists+linux-clk@lfdr.de>; Thu,  3 Apr 2025 11:04:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97D0C175A34
	for <lists+linux-clk@lfdr.de>; Thu,  3 Apr 2025 09:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 661442500CE;
	Thu,  3 Apr 2025 08:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BjAy18u5"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CF0244EAB
	for <linux-clk@vger.kernel.org>; Thu,  3 Apr 2025 08:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670772; cv=none; b=MRGleQIx9GtpIScSeGuj2Yehx6jTmRDdEnNFjmhkwtsAaWkz47HtDUpZKyT84ahIQK97yXbPSvRf1926E1+E/OF01HcK6BlTUDuVmppX91ijMM/jHCOtumn+W2oVnohtQtuEENGVZqrSleBqjK8NG8UMk1k4cECzGDLgpsvv7v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670772; c=relaxed/simple;
	bh=GESUUSr32C5v+JmyTkWMyaf4NO/174Vzhegyb1L9aRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PizNlroCrR/TD93IplfH/RT015rqj15xfhb7rwvh48wZytd0pnYHcfMFKT7jDibLkFZTByMiuivo6MT1yRvwmIHdixUGFJ8IHFx8Z2vMkkbmbwb4+qVmINFnwMYxHYdb1ROhUmF+u/UTyE4fRWz/5VuhrY+t3ZuCba1r4SlJSdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BjAy18u5; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac2a9a74d9cso115722166b.1
        for <linux-clk@vger.kernel.org>; Thu, 03 Apr 2025 01:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670759; x=1744275559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PSEpA1j4+zmEauzOiOoF/mVKhD6CkjV25eyM5OWecNk=;
        b=BjAy18u5MDej46oSBLQj9uVL1Sf6Rm4PoIgfKOjGinEeCUa9eopc4vUN5LTSw8eQ0O
         KTh/zspz9CGcOj4RXCBWPauFPj5z3+7caeFdcB3iMMHTiztBuqFll3G82TeCMsHP0uoO
         gRk/E6nTEEj/R+RXpo6u2RaPjb/3UGgr0PIugrhU4jbkxD1zmJ10jfQU76aLRnMq6liz
         wnRlZGQfZF47MrHsz/ttO99IjC19HSV+bATLwDazmoLahCcuXevWH71OM259jXhQTN+z
         UKI15hg7XN9Lf80ZWYNViOMEuCHA2wyOsXw5lVRCisF8y43b2auBJXwzz9Y3lNWV9Np2
         +wcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670759; x=1744275559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PSEpA1j4+zmEauzOiOoF/mVKhD6CkjV25eyM5OWecNk=;
        b=FpG9WFhS1BqTk87fTXj/OPvpq+d46LcRuXUC2cnpi+eyuwk0dAW/TCY9h3Zq22vgaN
         o3qi8D2+qUJIKLzXq+FKauegoE2WZE9JuNelGfkluDx0QyZ+WqZyrDgiul6lxxOlrYS0
         rTgsU3yUAxaaRcsy2DGihhS9W/DXd3P2K5kUf+BuqibVvySTVY8EAaJJ6CLrJl6285Vw
         YZhApulM9vp8s+/n+7GAlx3AecfUVwLt+PbA81l/qpkTeR9yC6HAbZgenK5gMCrOFclx
         xSt67dbjTdz1AzSrZVmD5/Iir00r62HudJU7YQ4RvgJ/lriHmSlD8dQHbYMEA7IYM8x6
         IZrA==
X-Forwarded-Encrypted: i=1; AJvYcCXyjNcKWmG2LQCEMBcjTwOGHwJ1iz7+l0sc+/FsJS2UvwsnsMPTvty+YuZI6l6RUGHpjqIovdC1/WI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSbycftrKO53szUYq85WF6Znu037LKqDJgesZkMjLTexOjwzWY
	H6dZ6HN9dRnbthpNLf9tJ8WZugpTBELYG6lS0FViwTXmOp4z25pfyAeIALYyWec=
X-Gm-Gg: ASbGncvyfKo4WIdoQ1l4baeumhHX+LTrYvnXSH5L3biGFcxb8qIBf8El6HsFhZvdwoA
	mavZU8j/TtsKVH1xFqmeceaiRVUX8HJxLVuMs5PKqbHIPxgbKLEzI5+dPQINlBfUcvoLSZedXk+
	TvN1l9kEj5CuK9HyyambaAdqsDMRrjT2+hlAclow/i/p/nZwkAPo5bRaSVu+xy/1QPcIlyfKrVw
	K3jWQ+MwjBprjRhw6IANOUPYkSUZCXxebRCJPl4RMti9xFR0vIT84me2RF+lSc94zgv8ycIH200
	AJrwq/7ublEsXU+viO7i7RCUyzPUrN00HLHS+EPsh6wkar+L5xEZ4U6HIdraoR49hSXFHJjTjAq
	+u24KYUn24Sx2BB1WvQfmYO18nEub
X-Google-Smtp-Source: AGHT+IH778midZRWwNsQwTegqpsc1cU2/xzEiQMSkFa1kd7UfUZDcEcX+jZvLbDF0curTDRXNPPiPQ==
X-Received: by 2002:a17:907:3d8f:b0:ac7:81bd:60e3 with SMTP id a640c23a62f3a-ac7c0935350mr136224366b.27.1743670758907;
        Thu, 03 Apr 2025 01:59:18 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:18 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:23 +0100
Subject: [PATCH v3 31/32] rtc: s5m: replace open-coded read/modify/write
 registers with regmap helpers
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-31-b542b3505e68@linaro.org>
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

Instead of the open-coded read/modify/write sequence, we can simply use
the regmap helpers regmap_set_bits() and regmap_update_bits()
respectively.

This makes the code easier to read, and avoids extra work in case the
underlying bus supports updating bits via
struct regmap_bus::reg_update_bits() directly (which is the case for
S2MPG10 on gs101 where this driver communicates via ACPM).

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index fb65a8e439d72d9070751c00f5826a403ac0b416..2ad01fb3bc72fe9259a8307584c9cf3a839bd492 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -279,17 +279,9 @@ static int s5m_check_pending_alarm_interrupt(struct s5m_rtc_info *info,
 static int s5m8767_rtc_set_time_reg(struct s5m_rtc_info *info)
 {
 	int ret;
-	unsigned int data;
-
-	ret = regmap_read(info->regmap, info->regs->udr_update, &data);
-	if (ret < 0) {
-		dev_err(info->dev, "failed to read update reg(%d)\n", ret);
-		return ret;
-	}
-
-	data |= info->regs->write_time_udr_mask;
 
-	ret = regmap_write(info->regmap, info->regs->udr_update, data);
+	ret = regmap_set_bits(info->regmap, info->regs->udr_update,
+			      info->regs->write_time_udr_mask);
 	if (ret < 0) {
 		dev_err(info->dev, "failed to write update reg(%d)\n", ret);
 		return ret;
@@ -303,19 +295,12 @@ static int s5m8767_rtc_set_time_reg(struct s5m_rtc_info *info)
 static int s5m8767_rtc_set_alarm_reg(struct s5m_rtc_info *info)
 {
 	int ret;
-	unsigned int data;
-
-	ret = regmap_read(info->regmap, info->regs->udr_update, &data);
-	if (ret < 0) {
-		dev_err(info->dev, "%s: fail to read update reg(%d)\n",
-			__func__, ret);
-		return ret;
-	}
+	unsigned int udr_mask;
 
-	data |= info->regs->write_alarm_udr_mask;
+	udr_mask = info->regs->write_alarm_udr_mask;
 	switch (info->device_type) {
 	case S5M8767X:
-		data &= ~S5M_RTC_TIME_EN_MASK;
+		udr_mask |= S5M_RTC_TIME_EN_MASK;
 		break;
 	case S2MPG10:
 	case S2MPS15X:
@@ -327,7 +312,8 @@ static int s5m8767_rtc_set_alarm_reg(struct s5m_rtc_info *info)
 		return -EINVAL;
 	}
 
-	ret = regmap_write(info->regmap, info->regs->udr_update, data);
+	ret = regmap_update_bits(info->regmap, info->regs->udr_update,
+				 udr_mask, info->regs->write_alarm_udr_mask);
 	if (ret < 0) {
 		dev_err(info->dev, "%s: fail to write update reg(%d)\n",
 			__func__, ret);

-- 
2.49.0.472.ge94155a9ec-goog


