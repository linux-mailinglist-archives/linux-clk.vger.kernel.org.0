Return-Path: <linux-clk+bounces-2958-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3033883E832
	for <lists+linux-clk@lfdr.de>; Sat, 27 Jan 2024 01:20:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5F0E1F21E51
	for <lists+linux-clk@lfdr.de>; Sat, 27 Jan 2024 00:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0939C647;
	Sat, 27 Jan 2024 00:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z5vteu3N"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C0510EA
	for <linux-clk@vger.kernel.org>; Sat, 27 Jan 2024 00:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706314787; cv=none; b=mUWSpoii+419XYAabysMMIQsyil1QKn9NEnXwPK7c514rPosFVyS09kppO7tUwWzd5r+Sdt76GvoXSTjv2eiXwnsyCq467NP432HPv/50/680zTEJF+k/403cMRx9P/MOkJiicB6mQASDzpKXffzURPfqeTbTVpKcfyLEPItPDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706314787; c=relaxed/simple;
	bh=SRaoY6Wy5mREGBPRLeiPUUSrZarGUQsXs633eSkifMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OW52xgyp7J+Nfw3apPyO2mOBVcjabpUyl+OlVPUQAiKrsuQmfQfM9saYP9h2v/ku6Rt9e0vXtoF7U1emD+NwpR/MD7iAo1D8rbQDEtCYT4+RW8roheddI40DZBL8gGoxCKbGsZWeWagmmnl8/+zTbgSpINpMSUojcf5uLrv4MW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z5vteu3N; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a352ec00cffso18844266b.3
        for <linux-clk@vger.kernel.org>; Fri, 26 Jan 2024 16:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706314782; x=1706919582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=72FI1Gr7K77cw7b0NtV82bnbC4R0Os+Pre+olDdbzEQ=;
        b=Z5vteu3NWLMbaFTrA44z1MUI7x28cDl1ABzweSWx/0bafdEgM7KGP/VP5g6eUilx5E
         5ch6064w7k4SezG0qyhikZt0mecw3cZBwZz5mo7O5dqQdu3UpfFz2Gba0znEfzvJcslt
         7nMIyiyJXa6E1iwGwOB8Q5DFt9dgriyqRCE7BfQrpYM2F5sRqG2xndygaaQEldfP5GbH
         pqjeQxDNeuyFLZ9Rc/wMVBtWNqz0FqXy1TN63BJrFXiEy19pBBTC1w/a64OhtRhZVFyo
         AL0zATsHoTg0xNw5LxfXnTlQtYg1NmlhSLC7/8/rtzraKVmsD5u4UzNuRIW5/qdcQuF9
         Kt9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706314782; x=1706919582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=72FI1Gr7K77cw7b0NtV82bnbC4R0Os+Pre+olDdbzEQ=;
        b=I3Pe83jGUHeYmsTMzcfPWEjyez9+R3y8TpY/vyEvS3HQNBaDFgbET1uYi/5xBa+93a
         Oo3/ufWMlQ7rdewUlzRv+cVonwWW1iHdCsaJFmSdGhySpt0AFzkGoy2HIrXNrDZXx+sI
         IZrXeNRy0OycskCcJxUI0U5gqKefCIrH5drbRx3FjLVGAPH72u4yWTotdkOiLsEZqqb/
         rXcxt730+vzmurQeFYPbLfnXjKzbFUO7BrF6KQh0+zav1MN9PkGprjsfBUVNh91LPO7v
         +JUzzUonRErpGmSC2ts2oMzjSEmA/U7YEwh4BtfaY0eyyrBf5mxDqcO5ZQJrXAXHdWNP
         sMyg==
X-Gm-Message-State: AOJu0YyZ2KPCb8FFsfb9ENvU7vNZ4kdeXCDwh8jJnyhDkEVN1I1l1AhH
	BT3d9e4LTqjET6n6Iz9hkupLLH24JdlSY2SDuwS7On3UFXSYvgRzcwO4nCM97uE=
X-Google-Smtp-Source: AGHT+IENxC5NzltrZvHqg5cPuaM1cJlF4edDxysfXqaJmLH/0P2mdMA5f7sFpZvo3B8zspiigKme0Q==
X-Received: by 2002:a17:906:a001:b0:a30:70fd:7749 with SMTP id p1-20020a170906a00100b00a3070fd7749mr307520ejy.47.1706314782668;
        Fri, 26 Jan 2024 16:19:42 -0800 (PST)
Received: from puffmais.c.googlers.com.com (229.112.91.34.bc.googleusercontent.com. [34.91.112.229])
        by smtp.gmail.com with ESMTPSA id x16-20020a170906135000b00a339d705a10sm1141359ejb.80.2024.01.26.16.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 16:19:42 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
To: peter.griffin@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@android.com,
	tudor.ambarus@linaro.org,
	willmcvicker@google.com,
	semen.protsenko@linaro.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 6/9] arm64: dts: exynos: gs101: enable i2c bus 12 on gs101-oriole
Date: Sat, 27 Jan 2024 00:19:10 +0000
Message-ID: <20240127001926.495769-7-andre.draszik@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240127001926.495769-1-andre.draszik@linaro.org>
References: <20240127001926.495769-1-andre.draszik@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This bus has various USB-related devices attached to it.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index cb4d17339b6b..c8f6b955cd4e 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -72,6 +72,10 @@ eeprom: eeprom@50 {
 	};
 };
 
+&hsi2c_12 {
+	status = "okay";
+};
+
 &pinctrl_far_alive {
 	key_voldown: key-voldown-pins {
 		samsung,pins = "gpa7-3";
@@ -113,6 +117,11 @@ &usi8 {
 	status = "okay";
 };
 
+&usi12 {
+	samsung,mode = <USI_V2_I2C>;
+	status = "okay";
+};
+
 &watchdog_cl0 {
 	timeout-sec = <30>;
 	status = "okay";
-- 
2.43.0.429.g432eaa2c6b-goog


