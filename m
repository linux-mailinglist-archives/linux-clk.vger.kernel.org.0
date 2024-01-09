Return-Path: <linux-clk+bounces-2295-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A564F8286B2
	for <lists+linux-clk@lfdr.de>; Tue,  9 Jan 2024 14:02:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9755DB248EE
	for <lists+linux-clk@lfdr.de>; Tue,  9 Jan 2024 13:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92643BB25;
	Tue,  9 Jan 2024 12:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jvboTT8H"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B163B2A1
	for <linux-clk@vger.kernel.org>; Tue,  9 Jan 2024 12:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40d5b89e2bfso31015565e9.0
        for <linux-clk@vger.kernel.org>; Tue, 09 Jan 2024 04:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704805126; x=1705409926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66WHfoChmjF44TpuZe1F+scHybHenf1Nb7ZkRVtSfIY=;
        b=jvboTT8HDIIbPBJx1k1H6z2qsvXcBmMSE75MdksfIdcMvurkDML9c3BrdRy6wKiYf4
         37Yl0qte142lNSU0zGWV4AQR6d+UaRSmHa9UINdfrRy8ecbSoFnXJ4MLRZDxjV7TVHZh
         HjhdkkyXozC78rPMvPTIJdVCa0t9olnBOzYcIOQ/WaesBxn9vErQaOmLXxsY2fpO9PBI
         nCGTfIsMjxzoSZhk9LvgseeJElpXgCP34aPrS+BvZvFpofmXzE+fYYEyFziS7J0j/3gL
         NzXmw2gSJhoKuN/5UzNrJAvO45A+wHz3xQ7xnfVe6b2pSh7rKSyiC7s4GLp6UV9BgM64
         WOxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704805126; x=1705409926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=66WHfoChmjF44TpuZe1F+scHybHenf1Nb7ZkRVtSfIY=;
        b=v4kgAgTaUhd7LpIu1aNQIVcps5gYp093BziJFErcVfuvRecPjiXm0j2lU+Tuz94a8p
         DbZ8gO+hinnFqaGvDCnDb9qbRQG3IfnJFm4Y2Q1t7InMO92q7IdHUIuIXmr2BSbR2CjY
         zCtL1bjFvJ7y+BIbUcCwvjh2OcaXxC3sK6IkUNqK1+N6EFh3u4s6yF4FGkeV1b9RZH0m
         kYSzfj3jwo3NbxnVrTS4Nm1Q1Wupql1Z28FjspvMY2iiUGkOZIRIQnvCQrZAs1Kw2wT+
         lL+gZzsusisk8CeKda00vfh/pYJ0RISIqRGyvyPidbTaWzPEiDqKc3BMRpqhYT6GkSK8
         kMCg==
X-Gm-Message-State: AOJu0Yzr3ie2Dckzou6HvNj+lcudxmYKZfqQuM4bk951EmdQG1RJgJbq
	FRZIqYyXYfT3UBapBMbLOvGBtFjozYfQgA==
X-Google-Smtp-Source: AGHT+IHTeV8EyfLOccPihdbXSpbOQ08P0ffNZMnT6S1UpNLyuVQRXyqsi0Qq1eRPCQMkBY5K2Eql1A==
X-Received: by 2002:a05:600c:538d:b0:40e:41f2:6d74 with SMTP id hg13-20020a05600c538d00b0040e41f26d74mr2481510wmb.67.1704805126502;
        Tue, 09 Jan 2024 04:58:46 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id cw16-20020a056000091000b0033753a61e96sm2351302wrb.108.2024.01.09.04.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 04:58:45 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peter.griffin@linaro.org,
	krzysztof.kozlowski+dt@linaro.org,
	gregkh@linuxfoundation.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	conor+dt@kernel.org,
	andi.shyti@kernel.org,
	alim.akhtar@samsung.com,
	jirislaby@kernel.org,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-serial@vger.kernel.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>
Subject: [PATCH v3 12/12] arm64: dts: exynos: gs101: enable eeprom on gs101-oriole
Date: Tue,  9 Jan 2024 12:58:14 +0000
Message-ID: <20240109125814.3691033-13-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20240109125814.3691033-1-tudor.ambarus@linaro.org>
References: <20240109125814.3691033-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the eeprom found on the battery connector.

The selection of the USI protocol is done in the board dts file because
the USI CONFIG register comes with a 0x0 reset value, meaning that USI8
does not have a default protocol (I2C, SPI, UART) at reset.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v3: collect Peter's R-b tag
v2:
- move cells and pinctrls properties to dtsi
- collect Sam's R-b

 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index 4a71f752200d..cb4d17339b6b 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -63,6 +63,15 @@ &ext_200m {
 	clock-frequency = <200000000>;
 };
 
+&hsi2c_8 {
+	status = "okay";
+
+	eeprom: eeprom@50 {
+		compatible = "atmel,24c08";
+		reg = <0x50>;
+	};
+};
+
 &pinctrl_far_alive {
 	key_voldown: key-voldown-pins {
 		samsung,pins = "gpa7-3";
@@ -99,6 +108,11 @@ &usi_uart {
 	status = "okay";
 };
 
+&usi8 {
+	samsung,mode = <USI_V2_I2C>;
+	status = "okay";
+};
+
 &watchdog_cl0 {
 	timeout-sec = <30>;
 	status = "okay";
-- 
2.43.0.472.g3155946c3a-goog


