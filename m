Return-Path: <linux-clk+bounces-1830-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EEA81B188
	for <lists+linux-clk@lfdr.de>; Thu, 21 Dec 2023 10:07:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6578A1F2163E
	for <lists+linux-clk@lfdr.de>; Thu, 21 Dec 2023 09:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 419FB5026D;
	Thu, 21 Dec 2023 09:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vNWEGEMx"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0F75026B
	for <linux-clk@vger.kernel.org>; Thu, 21 Dec 2023 09:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40d2376db79so4185885e9.0
        for <linux-clk@vger.kernel.org>; Thu, 21 Dec 2023 01:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703149252; x=1703754052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d5nr7Rmvu09+Hcflla+PbyH0bXs0avlsmc8OnLSB4Wc=;
        b=vNWEGEMxpzO82eedsGV6G/idadYCJ5dCuvzGGoNrtihjqw4llKO3aHSaDqNwDhrUF5
         Q89WqaBxkIJsEmIbMmSF8M0QIg7+rUT0o+qcUXh5zWDkKXw2okCSDDgjpG5jeRqtssft
         rzh9mNVNuxOnMxjNiEISlDYGnJ56BAuAijuNqyrdAqpPgz1zzZJb+6CqEXrOhBqkDekW
         0c74lUV/010LYGPLnwqY4ipF9CZeGNHyi6LMePYyRAjE2xUp4qm1r2egoEjJVS1MTevA
         SByLCXv/iOqicl8svaJRghIi0sCG6OFcHw6hxCr8mZk3KYGNX2+7yw9Rz1xNYkDCbQlU
         SVzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703149252; x=1703754052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d5nr7Rmvu09+Hcflla+PbyH0bXs0avlsmc8OnLSB4Wc=;
        b=KAdRyaFAh5BzJwMEfIyyEc5rDYcCQzPDHRKB+wwZBZVTFOAIzxCMSEWLDQx4Qw9iY0
         VtanTTDd/5a+2yPCPAKvVIWjx/MogwebhDSC3Sv2nWz1LeiOZqvnxP8F4faFdIXn3rkN
         WaMnwh4yyz6xqItcAwJYiSlZY4XgAsNVgYMKPLBHHAHVoST/Gsu2tEYdL/X6Zeveog5H
         v+ZfMgxal8tDjz1/yqmg30txxkalvtP10HI5CcIJ+hGWMYJLUZg0K9jCIW1hcT5Mssjw
         xFqUH2y2/J6Wj4A9YRvhMuksq3f5mrGnoHRmeLymfTFfhln5efJIB4z72HxN0cz88IHf
         ag7w==
X-Gm-Message-State: AOJu0Yy5AGkwekWChN6QrU0E4VFOofg7dWDjmPEIBIlZz74KJVUT5lyB
	ncT0TPk3yVXeL+kDCMw1R4nUug==
X-Google-Smtp-Source: AGHT+IHywzh7DivXZneCaq8VgYrlLxr2g0sHamkEZ9qmg8KKcEOnIX+t64+M6+wHLY+TrxYv9pKMMQ==
X-Received: by 2002:adf:ce11:0:b0:336:85e3:717d with SMTP id p17-20020adfce11000000b0033685e3717dmr426090wrn.122.1703149251898;
        Thu, 21 Dec 2023 01:00:51 -0800 (PST)
Received: from ta2.c.googlers.com.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id o10-20020adfeaca000000b0033677a4e0d6sm1523900wrn.13.2023.12.21.01.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 01:00:51 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peter.griffin@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Cc: conor+dt@kernel.org,
	mturquette@baylibre.com,
	alim.akhtar@samsung.com,
	semen.protsenko@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@android.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 2/2] arm64: dts: exynos: gs101: comply with the new cmu_misc clock names
Date: Thu, 21 Dec 2023 09:00:46 +0000
Message-ID: <20231221090046.1486195-2-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231221090046.1486195-1-tudor.ambarus@linaro.org>
References: <20231221090046.1486195-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cmu_misc clock-names were renamed to just "bus" and "sss" because
naming is local to the module, so cmu_misc is implied. As the bindings
and the device tree have not made a release yet, comply with the
renamed clocks.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 9747cb3fa03a..d838e3a7af6e 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -289,7 +289,7 @@ cmu_misc: clock-controller@10010000 {
 			#clock-cells = <1>;
 			clocks = <&cmu_top CLK_DOUT_CMU_MISC_BUS>,
 				 <&cmu_top CLK_DOUT_CMU_MISC_SSS>;
-			clock-names = "dout_cmu_misc_bus", "dout_cmu_misc_sss";
+			clock-names = "bus", "sss";
 		};
 
 		watchdog_cl0: watchdog@10060000 {
-- 
2.43.0.472.g3155946c3a-goog


