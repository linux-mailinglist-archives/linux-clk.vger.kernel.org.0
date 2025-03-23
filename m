Return-Path: <linux-clk+bounces-19719-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3329BA6D17F
	for <lists+linux-clk@lfdr.de>; Sun, 23 Mar 2025 23:39:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99F6D18867F4
	for <lists+linux-clk@lfdr.de>; Sun, 23 Mar 2025 22:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6637B1C8613;
	Sun, 23 Mar 2025 22:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AUILnTg5"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004121B041E
	for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 22:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769568; cv=none; b=N1LT1LBS5O1A6Ieu375bUk/jk3tYR5dH0Opw+JbManbasCdIfl2zpY9QvrkMaGkmZ5YdMA1iDFAIQnMaXdxDIhA8Y7I6kEcKkI2QMSCpnRT+KMxN/t9PVIvZvdaOwMiSqoA+u+j+ety63MwvMGzR0z+SHpwPE3AkDyDNifGUuKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769568; c=relaxed/simple;
	bh=6BfqEn0+AzamtK4yJsWD0fg9sFcnberX6yxt/ti3b7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qmmk61IsiMH/I7A/WpQADkHI/q7AbXYoV8my8HxKbyyv9yt31L6V5yEHI4OBppwfEHF4BF/Rp4NUKWdCiPQW97JKfhMKPFgjlDmnvCrgKtAyzVn9zTx4kuyGeGXqpgj+ekUuH2D0CyRw30lVz0EUPhzaImz+Uyibx/NrbOBXDEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AUILnTg5; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e5e63162a0so5902725a12.3
        for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 15:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769564; x=1743374364; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HXb1pE2B5VZK7eIRvGjCX0bwONX10G0/gh8FJgs0P90=;
        b=AUILnTg5pDyMjJktcjQAtmP1cN0YWyqEKXXo2XqFLorxlSzzY4rR4Y+GKYRE4L5Qpr
         YAOgFfFJ8jr/0y3aYyYRjzmlWg1XGmdvjig6nStIcR5K3EEugCpiCrtqpnbYE0xX+VzX
         cU3oJU3EJQ1l1Exx2tOzCS2IIEj5Uu9WypxXStl0JV2h1KbJ9snD3locDm9NdMXCxe+0
         PbdQf1Va1iNNfWpUo9pbv5LDd+AZs+zxuXfOmxyY5xR1GyYgq/7xw6fb+uRaQPbIsO/P
         Ggo4tyrvSmebQcqNHcSyIioe4w0x5AfrbuNtC49MKrZZRu+m5zTeEK+LYZ+baQXqFQRe
         Hq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769564; x=1743374364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HXb1pE2B5VZK7eIRvGjCX0bwONX10G0/gh8FJgs0P90=;
        b=oTffwzejHxvgqCvMg8V4yWiMFQn5PpQPYVoHe0x8RzDwWlnjJ7Fni5KR8NDZE7Zqpu
         rWH9hCPIDatuFSRIYPdKHlN/UGYy1EPY8LM/fmwVEl/Njah1MEY/87Pvpo8n2bduJhc7
         LfpFjDGQvSDdrXuu4SrIPjmd+MMazuSd7LMlmi2vW6ukPIJTVnXZa5CdGABGtw+DXp9W
         QUSsLSNg24GCtCLSdcSclmI0bMD+jUcKvR2vMeRjLxyJLo8imUtOZ8WfSQT0sLQn2+j/
         xmsKA2qP4v0+ieIiZYEFy56bXAsWTujfWHMu2wCBsBoQ+FGbWIdhSS6wiFRjw4K8G/c/
         V4NA==
X-Forwarded-Encrypted: i=1; AJvYcCVJP6ucbUK1MfUSq6kDW52PxnnR2ACVotuVHJKh9uX1jpTwx7kjsYDbIsRxmdIlFOOJ9JfEjgOp8IY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCuhRmRYlRvtAhXgOT8z5pFJqcoeyUDIxqvj9oAhAZWeN/DLy3
	sXPj6YeIgYPw0PoupMZP0F7t912PFsdoaeXstR/dVuw8nOjfIurPnmt7x4CURoo=
X-Gm-Gg: ASbGncsbHaVFLn5+BwuVj+emjCYVZ2YY0pYklvolY0c3kghTGhSmASgUzUeHJaIX21g
	34Lmn9Jvwne2t3+I+ZUrclpu+5aEwXd5Y+gygD6xmDkuDAUJxePe8W16nfDqgifc1yBdedj8Pn5
	DC+0mg9JZdSm+d8aIJp6c5Amhn9WxlpUyt2SHjjsyfxuNmERCjMd/SznOpggCUiepHpZpWIpyn8
	9O/H/TE/hyKyG77toNnMTuYS3qrTlH3qQbEk5qZAwMfRI+7vM4YYXpsVFFL3jTq7AeH7hYvBBRy
	YdVfme9tqqR8oPuCfFTzsoHfYLiAI/xvHOTcwm/kZrnCrWxboggQ2ig0GoT/xNhNaxMeWJ4jjZJ
	C4VH4yzzXxToPT7xCxSZyNKKrB3dz
X-Google-Smtp-Source: AGHT+IFEmZ9BlAcg5cpLq9P2zpjpd5ecowSIznI/DDr2rcI73G5OWcR4yuBPI4oD1OUtU38fBId+Ng==
X-Received: by 2002:a17:907:7ba8:b0:ac2:b684:542a with SMTP id a640c23a62f3a-ac3f23df97emr1170613466b.33.1742769564196;
        Sun, 23 Mar 2025 15:39:24 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:23 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:17 +0000
Subject: [PATCH 01/34] dt-bindings: mfd: samsung,s2mps11: add s2mpg10
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-1-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
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

The Samsung S2MPG10 PMIC is similar to the existing PMICs supported by
this binding.

It is a Power Management IC for mobile applications with buck
converters, various LDOs, power meters, RTC, clock outputs, and
additional GPIOs interfaces.

Unlike other Samsung PMICs, communication is not via I2C, but via the
Samsung ACPM firmware, it therefore doesn't need a 'reg' property but a
handle to the ACPM firmware node instead.

S2MPG10 can also act as a system power controller allowing
implementation of a true cold-reset of the system.

Support for the other components will be added in subsequent future
patches.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../devicetree/bindings/mfd/samsung,s2mps11.yaml   | 34 ++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
index ac5d0c149796b6a4034b5d4245bfa8be0433cfab..ae8adb80b3af7ec3722c2a5718ad8fddf0a5df34 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
@@ -20,6 +20,7 @@ description: |
 properties:
   compatible:
     enum:
+      - samsung,s2mpg10-pmic
       - samsung,s2mps11-pmic
       - samsung,s2mps13-pmic
       - samsung,s2mps14-pmic
@@ -43,6 +44,12 @@ properties:
     description:
       List of child nodes that specify the regulators.
 
+  exynos,acpm-ipc:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      Phandle to the ACPM node for when ACPM is used to communicate with the
+      PMIC, rather than I2C.
+
   samsung,s2mps11-acokb-ground:
     description: |
       Indicates that ACOKB pin of S2MPS11 PMIC is connected to the ground so
@@ -58,16 +65,39 @@ properties:
       reset (setting buck voltages to default values).
     type: boolean
 
+  system-power-controller: true
+
   wakeup-source: true
 
 required:
   - compatible
-  - reg
-  - regulators
 
 additionalProperties: false
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,s2mpg10-pmic
+    then:
+      properties:
+        regulators: false
+        samsung,s2mps11-acokb-ground: false
+        samsung,s2mps11-wrstbi-ground: false
+
+      required:
+        - exynos,acpm-ipc
+
+    else:
+      properties:
+        exynos,acpm-ipc: false
+        system-power-controller: false
+
+      required:
+        - reg
+        - regulators
+
   - if:
       properties:
         compatible:

-- 
2.49.0.395.g12beb8f557-goog


