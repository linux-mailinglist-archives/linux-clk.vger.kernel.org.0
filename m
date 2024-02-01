Return-Path: <linux-clk+bounces-3239-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEBB845CB0
	for <lists+linux-clk@lfdr.de>; Thu,  1 Feb 2024 17:13:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DEE31C2C011
	for <lists+linux-clk@lfdr.de>; Thu,  1 Feb 2024 16:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1481C15DBB3;
	Thu,  1 Feb 2024 16:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Eh6QzoSq"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59C1626B6
	for <linux-clk@vger.kernel.org>; Thu,  1 Feb 2024 16:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706803997; cv=none; b=TlzAskSVF8F98jCDZWmIslsTJihhr9OJ0uy9kS5xJwGJ7945JCLngAzPdX2jd6pZ4AuI3dvq9ewCJWEx7YpJzgZlnv+LvH9ejQN4EB/aHnugmw43d8syCY2Xwuarz1niJb+9WMNdkGIVBOw3lMRUJopPhwJ2CTcgHqCfmMUfRj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706803997; c=relaxed/simple;
	bh=iB21JC633KeTBy+UMkMipOhAFPyI+D4BRVNQBmbMJTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YXCfhNEJDQ3R4RNIQFenSfw1iJ1wjtWWuES+8mxZ8Wg4+F9IJSH0o/56S/m4FO5zzrpzgUY6B3oNtZA0V4YcbTO9Kv89E6xnArrVk6MxR2+/mXSpskKviNcJZKZaRqcVALszBpI6P+ENIZTRVLzb1hDRu9r4DnOaI6IxD7jxpiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Eh6QzoSq; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-55f15762840so1306288a12.0
        for <linux-clk@vger.kernel.org>; Thu, 01 Feb 2024 08:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706803994; x=1707408794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3e/ST4U2wBhhutsLLQy14BiuOoshMmvKqzzyJfq1nY=;
        b=Eh6QzoSq8y8AwGyBw/Yw0TPesO7rbcFI2Dy1Qb3W6u5BLhyQa/tdZf9PcAWRNxWSe4
         5pVinZyBY/LoUoCbCjFD06WSDtITmv45ePM+B99HdogPNFjRM6w8lb5GCcW7QGoM6GF+
         P8bbL0rJ+FpLiymyIjnEoB51dTX4YUV1m8kBxo99OyfrCqg43MYT/zYk3BcZ7jJwX+20
         zB+s5lmgC2QnMWt6k+dUwG0aplEv649WBZNmI2X3kGgXrP76KYKPbJf0Y63cd/dQJyb9
         xFCVGGSEzhloMEE728VZ1qhGIz+2voumBa2tKc5K5PzljF6+RHM1aq9rjOPayb3b6h7b
         bTbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706803994; x=1707408794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R3e/ST4U2wBhhutsLLQy14BiuOoshMmvKqzzyJfq1nY=;
        b=xN3R576bL4M1oxiZjFW++nmWhl/7ywvcV5q4ITSrqx7cKjOiF1F4t28Dpb+i1kGhOe
         3TTFITId+Mh9OOI0CYICoIGAevz0DqV+FIwKPOLV32oFSI0KODVI+bEK4npFwRvAotgh
         p3gfb59AwZRiEqKh0zK5wSMsO2OvlhN9LDQpUaxWKG/nEn5oDy34j2bmIJxEHP5f5jjg
         W6Qbgrzs4IQskADFr2RVw/Xl+PcPrqKwj9efhGAzdTe+gHuJ6BRAla3+XeYhujep9/4v
         9oZ1iZeGmbCgySbhQ1Kvmgxjyqi2LmHvEH6qw7zpaTLTb1GjFzIbRUk2v5ILyz66Buz7
         pwGA==
X-Gm-Message-State: AOJu0YwtZ3ypxDWTLN5QtCq0WZIxo+WGhH3Yk99ymsHdryQU7EBRVXLo
	yatLoDVcRWGIaqKyRJgt2pPur+lWSWUK+/aNN3hhfPvwfQ/5pcSTGMpUYHZb+V0=
X-Google-Smtp-Source: AGHT+IE5GEi05gDsS4H1aDcM6RzjHx5Nhn4bjyRoXi5ltCCdYAL3EnKocy/ZhBUqFyXPjh8uJJDm/g==
X-Received: by 2002:a17:906:a855:b0:a35:6299:a349 with SMTP id dx21-20020a170906a85500b00a356299a349mr3950503ejb.32.1706803994025;
        Thu, 01 Feb 2024 08:13:14 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWj6VTnS2OaBlc06Z1q6xX1ptZKAlwrtHkxd0h3rfrSSzzlLKxXZhuhytkML9UUr+cqKHmh0npqFP/xFaHPidYz2SgQ0D++wvkgyfgg8FVKoA4cZBgXQ18JxS3KpMbRBOy7n+b5oHXA+ysrPxieh+dwkBwgbYeG67eviiEeQZewqIEnEcq68bK5eDjiSNwItKFJZErreTc/4kS3pZHbVlJtwlq50kOpaCqfWCR+8Vayo7Ym5NTYvRBSql0OZbXMm9g3brBdi2N6gPC2Uj+D656Qanax+f8hBZqbvJeDE6jvC6vj4JZGjHNVwVUULsJ6Vqp4MdhfWJV/qD7MvAXoBw9tDwbzyfpjdDNGibbG4vnoAHkutxbBx0P4e5+OMtzjyaOes5Nx4CLHDHML7WO9xpjqta6zoGIy7+alN4dbGQQsuAMkwsyMs3yc/1l8Rv0p99qby22fj4HaZAAS+NiVkiRF5aRWsYO5D71hu8nS0T4gPZ2XTJ3ILqWE18kCnQCkiZ+4i3OxVt9D7a2Q9/Y+huVLhjF4Jnz8wZplWVobPs/4UXxayuOv822YeC8vbZ7fUJIA/7Il+tB4vUqBdCLgys7Pky3ZTPb6JsGuwEI+ain/1FzsUlFTAcTTYe2eSTa3GoFfwHMc8OnTfFASmot7NhDWpJkCkRtVs0y+L3liZh/fwoPCLITgYA==
Received: from puffmais.c.googlers.com.com (94.189.141.34.bc.googleusercontent.com. [34.141.189.94])
        by smtp.gmail.com with ESMTPSA id hw18-20020a170907a0d200b00a3600d7c2fbsm3449288ejc.176.2024.02.01.08.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 08:13:13 -0800 (PST)
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
	devicetree@vger.kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v3 5/7] arm64: dts: exynos: gs101: enable cmu-peric1 clock controller
Date: Thu,  1 Feb 2024 16:11:41 +0000
Message-ID: <20240201161258.1013664-6-andre.draszik@linaro.org>
X-Mailer: git-send-email 2.43.0.594.gd9cf4e227d-goog
In-Reply-To: <20240201161258.1013664-1-andre.draszik@linaro.org>
References: <20240201161258.1013664-1-andre.draszik@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Enable the cmu-peric1 clock controller. It feeds additional USI, I3C
and PWM interfaces / busses.

Note that &sysreg_peric1 needs a clock to be able to access its
registers and now that Linux knows about this clock, we need to add it
in this commit as well so as to keep &sysreg_peric1 working, so that
the clock can be enabled as and when needed.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

---
v3: collect Reviewed-by: tags

v2:
* merge patch #8 from original series version 1 into this patch, i.e.
add the clock to &sysreg_peric1 in this commit & update commit message
* collect Reviewed-by: tags
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index aaac04df5e65..e1bcf490309a 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -429,9 +429,20 @@ serial_0: serial@10a00000 {
 			};
 		};
 
+		cmu_peric1: clock-controller@10c00000 {
+			compatible = "google,gs101-cmu-peric1";
+			reg = <0x10c00000 0x4000>;
+			#clock-cells = <1>;
+			clocks = <&ext_24_5m>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_BUS>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_IP>;
+			clock-names = "oscclk", "bus", "ip";
+		};
+
 		sysreg_peric1: syscon@10c20000 {
 			compatible = "google,gs101-peric1-sysreg", "syscon";
 			reg = <0x10c20000 0x10000>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK>;
 		};
 
 		pinctrl_peric1: pinctrl@10c40000 {
-- 
2.43.0.594.gd9cf4e227d-goog


