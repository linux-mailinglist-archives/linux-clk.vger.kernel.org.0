Return-Path: <linux-clk+bounces-1408-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 399D9812D7C
	for <lists+linux-clk@lfdr.de>; Thu, 14 Dec 2023 11:53:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D4B21C21503
	for <lists+linux-clk@lfdr.de>; Thu, 14 Dec 2023 10:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34193E46A;
	Thu, 14 Dec 2023 10:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l0hcZotC"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41BB9185
	for <linux-clk@vger.kernel.org>; Thu, 14 Dec 2023 02:52:56 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40c38de1ee4so56515495e9.0
        for <linux-clk@vger.kernel.org>; Thu, 14 Dec 2023 02:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702551174; x=1703155974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tz2Xvyg4JP2yoDb158eSoW+wfoMNINh6+jbVwRbhMzg=;
        b=l0hcZotCiUZF3GUAyXnrHKpziDKODeoJ2rFz4MeIFdYQRnOcxag8BJIwPPMn/t5DoS
         G2G1f4MMOHaNPjvHDBmer/O/zCTM1jJ6s5SLMKSV5UceeYSS+N7P7RMLlnF3SEkDK0Oo
         gIKx2JBs+8wh75o5i5MJVrAaSNToyf9h1Q3HfCxfbcAJ5NWBkDTBhcRsTlAdpAWN9YvY
         y4UoMCvdeDXAcBCJR/vshB0QjOYhGnIzP6AViUowsiNpKn5/7Bl+UpfR01VeQHYj/h1R
         u7Avswn4RgkewHE6uIUfaPE1u56gxPNVtCzsUit/K29Vp8nizjaJF4553cI/Q5HV4N7A
         5wOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702551174; x=1703155974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tz2Xvyg4JP2yoDb158eSoW+wfoMNINh6+jbVwRbhMzg=;
        b=ZodxXnK+j29OUChJQpQYcl/3XRdFJjPkosuWXRAn3l95a2vmLIBH9tcOuPYWOIYNSL
         KD8N0jIkNrSsjn27SRnQnEmgGH7owRNiNT8gL/kYI0b1ALxZrlLAFRl7tqZyyIMwILY8
         GJmBqMHjIj1rIEWe+hnSYOFNymAX4SQ5nyE13fwUj+A6vwHSnJDE791FzNr7uzQ/bF6t
         QXwkjuED7Cd4gHq1ro6xjZ4t0m4P7mGcgnBDnJBjDrInYaJsg9TwH4Foxup/Wlpu0dFL
         /tyk0zh2RBPTcVfl4PwkfzLP8a12W5/EiAVivDQpt2snTbT0auP3RRyDTk+cAci9uSw8
         b83g==
X-Gm-Message-State: AOJu0Yx97n4gVC2ehuLblMjt06kpEYhzxClngItYQXc0oFWRAr96nLak
	zwNVoKLaz9o+Qqu2LqKw0FIiOA==
X-Google-Smtp-Source: AGHT+IH4J/oPnKQvv4O5ZLerNCsWrBSRNQ4wX2oCYLqm28AWAUlwAelLEDUbwmWNrJTRLX2wmLtGdQ==
X-Received: by 2002:a1c:6a0e:0:b0:40c:2617:69c4 with SMTP id f14-20020a1c6a0e000000b0040c261769c4mr4879922wmc.78.1702551174764;
        Thu, 14 Dec 2023 02:52:54 -0800 (PST)
Received: from ta2.c.googlers.com.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id p7-20020a05600c468700b0040c420eda48sm17614854wmo.22.2023.12.14.02.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 02:52:54 -0800 (PST)
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
	catalin.marinas@arm.com,
	will@kernel.org,
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
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 03/13] dt-bindings: i2c: exynos5: add google,gs101-hsi2c compatible
Date: Thu, 14 Dec 2023 10:52:33 +0000
Message-ID: <20231214105243.3707730-4-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231214105243.3707730-1-tudor.ambarus@linaro.org>
References: <20231214105243.3707730-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add google,gs101-hsi2c dedicated compatible for representing
I2C of Google GS101 SoC.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
index df9c57bca2a8..cc8bba5537b9 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
@@ -33,6 +33,7 @@ properties:
           - const: samsung,exynos7-hsi2c
       - items:
           - enum:
+              - google,gs101-hsi2c
               - samsung,exynos850-hsi2c
           - const: samsung,exynosautov9-hsi2c
       - const: samsung,exynos5-hsi2c    # Exynos5250 and Exynos5420
-- 
2.43.0.472.g3155946c3a-goog


