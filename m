Return-Path: <linux-clk+bounces-365-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 359807F1EC0
	for <lists+linux-clk@lfdr.de>; Mon, 20 Nov 2023 22:21:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EC1D1C2118B
	for <lists+linux-clk@lfdr.de>; Mon, 20 Nov 2023 21:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2162938DDA;
	Mon, 20 Nov 2023 21:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mrs1G55o"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06BC8110
	for <linux-clk@vger.kernel.org>; Mon, 20 Nov 2023 13:21:12 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4083dbc43cfso16829855e9.3
        for <linux-clk@vger.kernel.org>; Mon, 20 Nov 2023 13:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700515271; x=1701120071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KEC9m1sVf+gIOTorVlWOWetqCtBoH8t51Urz8Bp1ZAU=;
        b=Mrs1G55ohLYtlYqONtbRAAkz8k1igdm/Ae/sybagIa2W6vAksqwjDKefRAdCm3Ce1E
         wZc65zYJBUEmjbyPIy0xbIxlcBtqE5n/EUjKtsCxAN+Tmmvi4bdK7Yddi7yFO91UPzIX
         P/UhPU4LB8qLh9lczEiCb4OSL4hhepZE0NoS8mBA7AcQiZytr0DSObWPCI1+0tCiIZ9Q
         8LwunOXpz2mUULE76EX/Mh9gybCwLcrPK0pWMYL/yPnEo53ThKTFPknfnv4FrfwXlV8t
         f8LTlvhwYrtZ2kPMBY+ktTcm5GIQtM6wtPTja3lQ7FJE3PqVb+B0ETSxzpjtF8nvcyKs
         ZofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700515271; x=1701120071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KEC9m1sVf+gIOTorVlWOWetqCtBoH8t51Urz8Bp1ZAU=;
        b=Pt9vFgBxdHB4rxfp/fGVaoavFQsDwiowI/UHMymtkh1ojnfbaPBw2LHPdEEnyXzXx7
         RQwsQTgA4E9BXbOa5n2vEAZGFOPad5ODIAbeC68AwZ8m9ZqTh4n1PVngyuAIqgAjTYOA
         9BBuvHbw3vzSNADSW0vBdA35jvceMSkJiCL0wM49xurVcqsaKZ6hUDyXdk57/J+l3Zhg
         0Dc2NgDUBvLklj55yWyl/q+GfhGu8Dfmmi0BFgcoC7YCZkogn2lq1EszNqepfhhXWIVK
         xq+kQlRmKBEu+yz+Xs4JdKuo3yNleQoZDzuVSmwviTakaX4H2WaR7843FJDWX34bpV8U
         VuAg==
X-Gm-Message-State: AOJu0YygdnsiSWdhNENvd7D8CYRLhPwffW3eJ5LyAV8VptoRtzKnE3vm
	txH6Y8ibf6gH8pWy6rhYAU02ow==
X-Google-Smtp-Source: AGHT+IFnkvKJwJBysGZpS8nFvlKDKPHNMjEYxQ4sEoz66mjYdkd3vAWAH3NdAz3AUc2EElNngqiZZw==
X-Received: by 2002:a05:600c:a4c:b0:40a:4609:9c90 with SMTP id c12-20020a05600c0a4c00b0040a46099c90mr7665820wmq.29.1700515271448;
        Mon, 20 Nov 2023 13:21:11 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id je14-20020a05600c1f8e00b0040596352951sm19518451wmb.5.2023.11.20.13.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:21:10 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com
Cc: peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel-team@android.com,
	linux-serial@vger.kernel.org
Subject: [PATCH v4 04/19] dt-bindings: watchdog: Document Google gs101 watchdog bindings
Date: Mon, 20 Nov 2023 21:20:22 +0000
Message-ID: <20231120212037.911774-5-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
In-Reply-To: <20231120212037.911774-1-peter.griffin@linaro.org>
References: <20231120212037.911774-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the "google,gs101-wdt" compatible to the dt-schema documentation.

gs101 SoC has two CPU clusters and each cluster has its own dedicated
watchdog timer (similar to exynos850 and exynosautov9 SoCs).

These WDT instances are controlled using different bits in PMU
registers.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../devicetree/bindings/watchdog/samsung-wdt.yaml         | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 8fb6656ba0c2..57468c2c5ece 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -17,6 +17,7 @@ description: |+
 properties:
   compatible:
     enum:
+      - google,gs101-wdt                      # for Google gs101
       - samsung,s3c2410-wdt                   # for S3C2410
       - samsung,s3c6410-wdt                   # for S3C6410, S5PV210 and Exynos4
       - samsung,exynos5250-wdt                # for Exynos5250
@@ -42,13 +43,14 @@ properties:
   samsung,cluster-index:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-      Index of CPU cluster on which watchdog is running (in case of Exynos850)
+      Index of CPU cluster on which watchdog is running (in case of Exynos850
+      or Google gs101).
 
   samsung,syscon-phandle:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
       Phandle to the PMU system controller node (in case of Exynos5250,
-      Exynos5420, Exynos7 and Exynos850).
+      Exynos5420, Exynos7, Exynos850 and gs101).
 
 required:
   - compatible
@@ -64,6 +66,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - google,gs101-wdt
               - samsung,exynos5250-wdt
               - samsung,exynos5420-wdt
               - samsung,exynos7-wdt
@@ -77,6 +80,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - google,gs101-wdt
               - samsung,exynos850-wdt
               - samsung,exynosautov9-wdt
     then:
-- 
2.43.0.rc1.413.gea7ed67945-goog


