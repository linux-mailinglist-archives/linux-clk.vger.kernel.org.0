Return-Path: <linux-clk+bounces-1117-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B8480B7B1
	for <lists+linux-clk@lfdr.de>; Sun, 10 Dec 2023 00:31:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2C311F21002
	for <lists+linux-clk@lfdr.de>; Sat,  9 Dec 2023 23:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1857920DE8;
	Sat,  9 Dec 2023 23:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xjUEjpM4"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7DC710E0
	for <linux-clk@vger.kernel.org>; Sat,  9 Dec 2023 15:31:19 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40c19467a63so37507755e9.3
        for <linux-clk@vger.kernel.org>; Sat, 09 Dec 2023 15:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702164678; x=1702769478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AlntL3e7CU21B53Om8w1Bn176sZIdCQXro73e+5XJx4=;
        b=xjUEjpM4QMbR6Dj2dnho8IryKnPKO8VmQXSgOTQhTYse/Xbj1QRIzYgsIdcThjBKsF
         URZoLuORelL1Hxy37YdcuAqo0ulHlhAimI3naWpxE4pVz4cAPckS8B2c4hvEhwMGaODU
         7MfL8Jekh4Z2DT2YoJGb6bbjKmNf4Qy+UFqUhU09AnIGUuBAoq81dfKjlbQt4RRlPGYs
         2qsj3oToXMEPdcFAQ8vENSH0if7yJ6PlQ2PzE5dCAps0pzu3/eKIRocTyb2cvVHEaTxH
         dZiJmoxbnsU9b8VyB6nFUZiowsVgkjO6wReUoq9ffNCgCmXM9OSP75e9ADaOzlSTClbR
         c/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702164678; x=1702769478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AlntL3e7CU21B53Om8w1Bn176sZIdCQXro73e+5XJx4=;
        b=gKePTFT6iBHddFZbN8ute2KHF0MvrrvDudSNz7+Gn0Ba8puEwWwKb0sLARJz4K3/MS
         WalobkqG0RFx+2qHHSD8CnSQcrUzY9YKA3Qc2zUBT4CW0YH0Ycs1jz4ldvpq+mPuFNxk
         TZDIKEi0geuPtUm+EaoC9OEgRUHZAeiORmlheSUl+iIiZg/8qIpgq03fhwlW0c2+QtMt
         UVWpSIdKXypg4grcdWQzhRLx8RNTsNaxExeGmNc7nuvvsgX10NDXci6pjmtyQTV6jC/9
         MXm6sNml6/PXwLs3cy5qW/qVtDhjiGASweMabGo6N2Q9PyO9szu9Bkns5VMu1HHY1XGY
         zJjg==
X-Gm-Message-State: AOJu0Yyfp7LRZmeVEpieBSq9dvXVHA6Y1yVyV5zrGr6SC1LHC9rI+iud
	dGzNQe+OJq6B+kez5dBW4U2X3Q==
X-Google-Smtp-Source: AGHT+IG7dyYZn24iRWJwzOFDMLdk9RqcmFN/SLEXWuhcY+EiXb6lMZj13Q3ubjvMSQZL/cKAexoxcw==
X-Received: by 2002:a7b:c8c2:0:b0:40c:279d:31a3 with SMTP id f2-20020a7bc8c2000000b0040c279d31a3mr1088695wml.176.1702164678218;
        Sat, 09 Dec 2023 15:31:18 -0800 (PST)
Received: from gpeter-l.lan (host-92-23-61-173.as13285.net. [92.23.61.173])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c4f8900b0040c41846923sm1875277wmq.26.2023.12.09.15.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 15:31:17 -0800 (PST)
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
Subject: [PATCH v6 03/20] dt-bindings: soc: google: exynos-sysreg: add dedicated SYSREG compatibles to GS101
Date: Sat,  9 Dec 2023 23:30:49 +0000
Message-ID: <20231209233106.147416-4-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231209233106.147416-1-peter.griffin@linaro.org>
References: <20231209233106.147416-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GS101 has three different SYSREG controllers, add dedicated
compatibles for them to the documentation.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../bindings/soc/samsung/samsung,exynos-sysreg.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index 2de4301a467d..127f4ffde76a 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -22,6 +22,12 @@ properties:
               - tesla,fsd-fsys1-sysreg
               - tesla,fsd-peric-sysreg
           - const: syscon
+      - items:
+          - enum:
+              - google,gs101-apm-sysreg
+              - google,gs101-peric0-sysreg
+              - google,gs101-peric1-sysreg
+          - const: syscon
       - items:
           - enum:
               - samsung,exynos5433-cam0-sysreg
-- 
2.43.0.472.g3155946c3a-goog


