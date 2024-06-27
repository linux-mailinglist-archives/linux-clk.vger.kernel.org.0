Return-Path: <linux-clk+bounces-8761-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C452591AA45
	for <lists+linux-clk@lfdr.de>; Thu, 27 Jun 2024 17:03:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54BE5288C7A
	for <lists+linux-clk@lfdr.de>; Thu, 27 Jun 2024 15:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE34198E78;
	Thu, 27 Jun 2024 15:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b="gyo4P4vE"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC73197A97
	for <linux-clk@vger.kernel.org>; Thu, 27 Jun 2024 15:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719500606; cv=none; b=GiQTap/p9Axo2Vv4v62/CKIomBwI543d8JVRwNg4uZHON74cHtFvWpHGyXuaMxDdFlTA9eOhAGDlFwr+1OKiBWMk4EyCMnOTn+iZ9Y212E1DD+w/eIMchawrQKZ4fUBdtnB012SVJ8Wg3oBOriQg8rUpFTimMpZWB10LtSRy7PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719500606; c=relaxed/simple;
	bh=MOy/zclnpM1qz9tlFoI7C6TAtMnrzA/3fX7zjAQAoDQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lqJXVQWSxGOLUrhW5UojxceKfC89Uus/fpVKNhKzt6nuyOOEvdVZ7K+R66QWuazVZMzH33zkf+gZ7x6HFz3b1yf/o74jVMYTVx2NuglrrC48f4dzfG5+F4+s7O9NHyO7K/jEveNiIABTE+J594svZxTFCuf5W9q/sWhR8MVRcUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com; spf=pass smtp.mailfrom=timesys.com; dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b=gyo4P4vE; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timesys.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52cdf2c7454so10358821e87.1
        for <linux-clk@vger.kernel.org>; Thu, 27 Jun 2024 08:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1719500601; x=1720105401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wfvNY7tGM2S+4v6UaWLAdWnrWccCsZezGAwDSPje/fE=;
        b=gyo4P4vE+W5TaJExutRzBG+QEGdzwh/9iqGOxcMgc7WFtP0Lii/MnqY7xd/Byi9iUT
         Evg1RpHPRKiJlLku3jTvnNZU/zCE7v31DlkU9RQQezKZESdhs/hgPmOxCwos/KYY80MV
         LBlLejvW6Bx75tD1SNYa9sZXXyIwEmWdXxSroBWsfGCiS+YmflKU2zVLDC89/yl9YWYu
         qwYjPjkkm786l1F9wUfM39oFxOqAaXViIVIRfnpWIbVJ16Fyi7/KOlZxB4J3dLv8xJ/I
         lPQzkCzhNqTcsaLnSd3jl34uUv5UgckOsURYNAFDTQcL0LnRkLl+k31DdliwUOhW+j17
         vNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719500601; x=1720105401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wfvNY7tGM2S+4v6UaWLAdWnrWccCsZezGAwDSPje/fE=;
        b=rmwqXWQpEzAk7uOkrncA82BHMasY3P65W0B6CDvD1grecElB16oknSg6emhQOCJ/zf
         qv0DH7aWPFZwXMy0iTZYZkwx81RVmO/kx0DXYqgECWmz0ZlSW0+IqH+pGajfHQriL3HQ
         N94WaBbp49+GX7YisKDJGks9EttNjDLj+1Tp4R8ilkPgzXULFUKk2CWcogp1Ty7JboB+
         +Raoyn27CyD2YKSKjdoBx71TzF+VGAYeu+WpY5bHIfUggpbuaqquIGNJZPk7PDT5y1oh
         gNvg6RUuGbmvpaWjLqCBO4GX6NNAS2V2ev1F8JK7gCMp2Pg2gH3W9TJi0Nl8Igdut6g4
         5KyA==
X-Forwarded-Encrypted: i=1; AJvYcCUamAgj2W968dCxLPT75bZXCmDVs6CiNgc8cDTqXShu06iZHW+yCa3D4Dq/1usJ79Gy5pdt2Mz74dBokA9ZlNigF33nTE9CSJeX
X-Gm-Message-State: AOJu0YxWJqeJfwyOvgWXwvUCZSK1KXaThpABBHdZ54hF7i+fee1uM5KE
	hQtc2N41G5HdXEe76qDOK20B/autNzIqi9QTSh7+PPlcbV4bAQuq6KFRPd60oEY=
X-Google-Smtp-Source: AGHT+IHllh+sTlu3HrGAUtGTIRMnmFNSl2sKuSvILBbha0AGpyRun3RsrXSjlrG4YcRJnhpgiuUbGw==
X-Received: by 2002:a05:6512:3b95:b0:52c:dd94:bda9 with SMTP id 2adb3069b0e04-52ce185c196mr13457029e87.56.1719500601213;
        Thu, 27 Jun 2024 08:03:21 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a729d7ca289sm67189066b.222.2024.06.27.08.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:03:20 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yangtao Li <frank.li@vivo.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Li Zetao <lizetao1@huawei.com>,
	Chancel Liu <chancel.liu@nxp.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Corentin Labbe <clabbe@baylibre.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [Patch v5 06/12] ARM: dts: lpc32xx: Add missing i2s properties
Date: Thu, 27 Jun 2024 17:00:24 +0200
Message-Id: <20240627150046.258795-7-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
References: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds properties declared in the new DT binding nxp,lpc3220-i2s.yaml

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v5:
- This patch is new in v5
- Split previous patch for lpc32xx.dtsi in to 3 patches

 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index 6135ce4dde61..c58dc127e59f 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
@@ -240,8 +240,11 @@ spi2: spi@20090000 {
 			i2s0: i2s@20094000 {
 				compatible = "nxp,lpc3220-i2s";
 				reg = <0x20094000 0x1000>;
+				interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk LPC32XX_CLK_I2S0>;
 				dmas = <&dma 0 1>, <&dma 13 1>;
 				dma-names = "rx", "tx";
+				#sound-dai-cells = <0>;
 				status = "disabled";
 			};
 
@@ -260,8 +263,11 @@ sd: sd@20098000 {
 			i2s1: i2s@2009c000 {
 				compatible = "nxp,lpc3220-i2s";
 				reg = <0x2009c000 0x1000>;
+				interrupts = <23 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk LPC32XX_CLK_I2S1>;
 				dmas = <&dma 2 1>, <&dmamux 10 1 1>;
 				dma-names = "rx", "tx";
+				#sound-dai-cells = <0>;
 				status = "disabled";
 			};
 
-- 
2.25.1


