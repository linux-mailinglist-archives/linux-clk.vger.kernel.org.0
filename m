Return-Path: <linux-clk+bounces-1963-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB5381F849
	for <lists+linux-clk@lfdr.de>; Thu, 28 Dec 2023 13:58:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96DAEB236FA
	for <lists+linux-clk@lfdr.de>; Thu, 28 Dec 2023 12:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BAB379FE;
	Thu, 28 Dec 2023 12:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hzT28vd3"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CC179C3
	for <linux-clk@vger.kernel.org>; Thu, 28 Dec 2023 12:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40d5b159350so19298535e9.2
        for <linux-clk@vger.kernel.org>; Thu, 28 Dec 2023 04:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703768292; x=1704373092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLJJCnpqNRt9VWnjS9HQfnci/ScCBcd+pC2hzKQpxGg=;
        b=hzT28vd3S6H8KpN8TRyThcgbrYr6s6BlJQrvZvV4sl2+Ur7Ae3ldvMPrWqJA6Dwx01
         QGY26ni0R4QkbI96nZ7w13ZtAqdoeUOkMXeGt50YapKco/fio9DDDB0UL+TwMLtNAffF
         0skT/4SAQAwOJGgMbRpfURiRXaap2CLoAfGXgY3PVPHT7jw9kzxoeEhX4z9lbnU4pHMJ
         j8Y5kcLIUC9IWkI8hJnTCGJB0mRZoL99lRyHrJDO8JwPYDxjp18N2RtzGKSkvC7N0AUb
         SZiCMBRkD2D8EDO9jPNxyGXVfwzrd+LUvXOo6zNSk6pKtbZz2hiTRUcXIj4c0AnsM5NU
         DOPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703768292; x=1704373092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QLJJCnpqNRt9VWnjS9HQfnci/ScCBcd+pC2hzKQpxGg=;
        b=vdj4UkOIjnFxYrlKzPD3GGO92eLyljy0zE9jW6dHU1/Ez1KbPP+KxtMdGOiuhJ4J3Y
         8vOIQJiCgugbrANpJk7gjmh+vSxAGoevjNWj6+GplWT/mjTc6SJcMowO/TCnXCOm0l9K
         /w4zwlA+NB5rzxeC5LdI5Brpfg9e1fq9STpPWjqx7sumOHaQ2toOlN8xMwwOHSEJMJXc
         G45DnpG3tHWldhb5E2U3PB4aMFd1r20NMTVdXlJKvVu7JpUDTmZ4ZBfx9MyUcFVKyPlN
         0GcPHIHqUOTgwbP8oM84G3PPpekJr8a6jF+M/qhEFbfia5yRyegDOV/P23AnUIzLVHdy
         F4cw==
X-Gm-Message-State: AOJu0YyTXuraf5rvDoztOu3NPeDoCPJxDSJuaXFhA3ssjEMHkHdFxdM/
	70lGW3dttzIhtTs6d9D7jwOwuWRb0YH3gQ==
X-Google-Smtp-Source: AGHT+IEWIfqSlPG7wal12kaKVDGd2xFjtk1124PETk0To6JEBlKcPa9fVYJkh+dPWOImveFQ/z8RNQ==
X-Received: by 2002:a05:600c:3114:b0:40d:70c9:eb14 with SMTP id g20-20020a05600c311400b0040d70c9eb14mr248255wmo.146.1703768291416;
        Thu, 28 Dec 2023 04:58:11 -0800 (PST)
Received: from ta2.c.googlers.com.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id h9-20020a05600c350900b0040d5aca25f1sm8615807wmq.17.2023.12.28.04.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Dec 2023 04:58:10 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peter.griffin@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	conor+dt@kernel.org,
	andi.shyti@kernel.org,
	alim.akhtar@samsung.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	arnd@arndb.de,
	semen.protsenko@linaro.org
Cc: andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-serial@vger.kernel.org,
	kernel-team@android.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 01/12] dt-bindings: clock: google,gs101-clock: add PERIC0 clock management unit
Date: Thu, 28 Dec 2023 12:57:54 +0000
Message-ID: <20231228125805.661725-2-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231228125805.661725-1-tudor.ambarus@linaro.org>
References: <20231228125805.661725-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dt-schema documentation for the Connectivity Peripheral 0 (PERIC0)
clock management unit.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v2:
- fix comments as per Sam's suggestion and collect his R-b tag
- Rob's suggestion of renaming the clock-names to just "bus" and "ip"
  was not implemented as I felt it affects readability in the driver
  and consistency with other exynos clock drivers. I will happily update
  the names in the -rc phase if someone else has a stronger opinion than
  mine. 

 .../bindings/clock/google,gs101-clock.yaml    | 25 +++++-
 include/dt-bindings/clock/google,gs101.h      | 81 +++++++++++++++++++
 2 files changed, 104 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
index 3eebc03a309b..ba54c13c55bc 100644
--- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
@@ -30,14 +30,15 @@ properties:
       - google,gs101-cmu-top
       - google,gs101-cmu-apm
       - google,gs101-cmu-misc
+      - google,gs101-cmu-peric0
 
   clocks:
     minItems: 1
-    maxItems: 2
+    maxItems: 3
 
   clock-names:
     minItems: 1
-    maxItems: 2
+    maxItems: 3
 
   "#clock-cells":
     const: 1
@@ -88,6 +89,26 @@ allOf:
             - const: dout_cmu_misc_bus
             - const: dout_cmu_misc_sss
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101-cmu-peric0
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (24.576 MHz)
+            - description: Connectivity Peripheral 0 bus clock (from CMU_TOP)
+            - description: Connectivity Peripheral 0 IP clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: dout_cmu_peric0_bus
+            - const: dout_cmu_peric0_ip
+
 additionalProperties: false
 
 examples:
diff --git a/include/dt-bindings/clock/google,gs101.h b/include/dt-bindings/clock/google,gs101.h
index 21adec22387c..64e6bdc6359c 100644
--- a/include/dt-bindings/clock/google,gs101.h
+++ b/include/dt-bindings/clock/google,gs101.h
@@ -389,4 +389,85 @@
 #define CLK_GOUT_MISC_WDT_CLUSTER1_PCLK			73
 #define CLK_GOUT_MISC_XIU_D_MISC_ACLK			74
 
+/* CMU_PERIC0 */
+#define CLK_MOUT_PERIC0_BUS_USER			1
+#define CLK_MOUT_PERIC0_I3C_USER			2
+#define CLK_MOUT_PERIC0_USI0_UART_USER			3
+#define CLK_MOUT_PERIC0_USI14_USI_USER			4
+#define CLK_MOUT_PERIC0_USI1_USI_USER			5
+#define CLK_MOUT_PERIC0_USI2_USI_USER			6
+#define CLK_MOUT_PERIC0_USI3_USI_USER			7
+#define CLK_MOUT_PERIC0_USI4_USI_USER			8
+#define CLK_MOUT_PERIC0_USI5_USI_USER			9
+#define CLK_MOUT_PERIC0_USI6_USI_USER			10
+#define CLK_MOUT_PERIC0_USI7_USI_USER			11
+#define CLK_MOUT_PERIC0_USI8_USI_USER			12
+#define CLK_DOUT_PERIC0_I3C				13
+#define CLK_DOUT_PERIC0_USI0_UART			14
+#define CLK_DOUT_PERIC0_USI14_USI			15
+#define CLK_DOUT_PERIC0_USI1_USI			16
+#define CLK_DOUT_PERIC0_USI2_USI			17
+#define CLK_DOUT_PERIC0_USI3_USI			18
+#define CLK_DOUT_PERIC0_USI4_USI			19
+#define CLK_DOUT_PERIC0_USI5_USI			20
+#define CLK_DOUT_PERIC0_USI6_USI			21
+#define CLK_DOUT_PERIC0_USI7_USI			22
+#define CLK_DOUT_PERIC0_USI8_USI			23
+#define CLK_GOUT_PERIC0_IP				24
+#define CLK_GOUT_PERIC0_PERIC0_CMU_PERIC0_PCLK		25
+#define CLK_GOUT_PERIC0_CLK_PERIC0_OSCCLK_CLK		26
+#define CLK_GOUT_PERIC0_D_TZPC_PERIC0_PCLK		27
+#define CLK_GOUT_PERIC0_GPC_PERIC0_PCLK			28
+#define CLK_GOUT_PERIC0_GPIO_PERIC0_PCLK		29
+#define CLK_GOUT_PERIC0_LHM_AXI_P_PERIC0_I_CLK		30
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_0		31
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_1		32
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_10		33
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_11		34
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_12		35
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_13		36
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_14		37
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_15		38
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_2		39
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_3		40
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_4		41
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_5		42
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_6		43
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_7		44
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_8		45
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_9		46
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_0		47
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_1		48
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_10		49
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_11		50
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_12		51
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_13		52
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_14		53
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_15		54
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_2		55
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_3		56
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_4		57
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_5		58
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_6		59
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_7		60
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_8		61
+#define CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_9		62
+#define CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_0		63
+#define CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_2		64
+#define CLK_GOUT_PERIC0_PERIC0_TOP1_PCLK_0		65
+#define CLK_GOUT_PERIC0_PERIC0_TOP1_PCLK_2		66
+#define CLK_GOUT_PERIC0_CLK_PERIC0_BUSP_CLK		67
+#define CLK_GOUT_PERIC0_CLK_PERIC0_I3C_CLK		68
+#define CLK_GOUT_PERIC0_CLK_PERIC0_USI0_UART_CLK	69
+#define CLK_GOUT_PERIC0_CLK_PERIC0_USI14_USI_CLK	70
+#define CLK_GOUT_PERIC0_CLK_PERIC0_USI1_USI_CLK		71
+#define CLK_GOUT_PERIC0_CLK_PERIC0_USI2_USI_CLK		72
+#define CLK_GOUT_PERIC0_CLK_PERIC0_USI3_USI_CLK		73
+#define CLK_GOUT_PERIC0_CLK_PERIC0_USI4_USI_CLK		74
+#define CLK_GOUT_PERIC0_CLK_PERIC0_USI5_USI_CLK		75
+#define CLK_GOUT_PERIC0_CLK_PERIC0_USI6_USI_CLK		76
+#define CLK_GOUT_PERIC0_CLK_PERIC0_USI7_USI_CLK		77
+#define CLK_GOUT_PERIC0_CLK_PERIC0_USI8_USI_CLK		78
+#define CLK_GOUT_PERIC0_SYSREG_PERIC0_PCLK		79
+
 #endif /* _DT_BINDINGS_CLOCK_GOOGLE_GS101_H */
-- 
2.43.0.472.g3155946c3a-goog


