Return-Path: <linux-clk+bounces-724-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF7E800F0E
	for <lists+linux-clk@lfdr.de>; Fri,  1 Dec 2023 17:11:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89EA8281C02
	for <lists+linux-clk@lfdr.de>; Fri,  1 Dec 2023 16:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AEA74BAA2;
	Fri,  1 Dec 2023 16:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JarhZEjf"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B50F31707
	for <linux-clk@vger.kernel.org>; Fri,  1 Dec 2023 08:10:51 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3332fc9b9b2so869990f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 01 Dec 2023 08:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701447050; x=1702051850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ywdUZXMyLf6C9Ys3Kgiwpz0dOO3A0ZXqyMleZjsaYg=;
        b=JarhZEjf4cNxikdu0feE6XqwtTjtLhYyRTYXiXykYNQA7Kw1I3FI+6Ms76EKkWgAJ+
         ZY4zX2RBD8KKcdIbGb8h1+521G+JKK0OOvcyVth0kiDiXCArUq0D152eW6W5BimGAOkW
         9M5BE34sY4tCv0vGwsYSsyI2J/MuFsqquDmCGCtUQsawe0/NRs8vW8gQebifwb6r/ZlG
         bavTE0P+Wm1ZTQegZRNnifOeH78ZWWKPomeNSPotbaw7EzB9UnfhQsSu3OzLDOKCNrge
         kJFJjg8nIyo3j/inTwlS7XlSOiiOImwgfAyc9U41oA9BnCuatwnB487UEuhOESQJg91W
         i13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701447050; x=1702051850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ywdUZXMyLf6C9Ys3Kgiwpz0dOO3A0ZXqyMleZjsaYg=;
        b=KS279ZN9R9HFPN+OKrLYQwcolZdGdPuvDcP+F0rv6zYDe8DIHcBj1K/FTpiQ+qXrA+
         lJF/Up1vY5A8mKqlEA/h5JqJaGnvIMzG05poc/VRCcBtqK9BWbEGgPGfAgPKdQWFTuut
         G5niGkkSTJja3CC8lUotZqEUDk973c/wYns0kususWSrG1ZUCp5rvK0czUXSx5i93Gro
         iPr3Li7JmWlIVGwFpn7J2FaKezN3rpEPb2UlWFDfqkJXWqQVPHQCpH2wuAYJ2qvHRA4u
         gcS6ki8oHfcWs5vl6Fo0av8fLzebwV9oz76UEczenHhDc4Q9T2zgXpExtVHPO1nlmizm
         9dgg==
X-Gm-Message-State: AOJu0YwTBtfO+TTb+H3e+MQRe3hyU00O73+ZAmu6BTNELNEff7K3RmZH
	ziXVQyXjQ4rD3Tm32gZEdNDScw==
X-Google-Smtp-Source: AGHT+IG7OOrnhouiLBwZm+VnT6C5HGH4CpJmfnG5KQGGluemLDGUdIgkXzi8CNGO3fHX+180nLdF9Q==
X-Received: by 2002:a5d:4402:0:b0:333:2e28:46f5 with SMTP id z2-20020a5d4402000000b003332e2846f5mr450720wrq.1.1701447049944;
        Fri, 01 Dec 2023 08:10:49 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id cg16-20020a5d5cd0000000b003332656cd73sm3907386wrb.105.2023.12.01.08.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 08:10:49 -0800 (PST)
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
Subject: [PATCH v5 01/20] dt-bindings: soc: samsung: exynos-pmu: Add gs101 compatible
Date: Fri,  1 Dec 2023 16:09:06 +0000
Message-ID: <20231201160925.3136868-2-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231201160925.3136868-1-peter.griffin@linaro.org>
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add gs101-pmu compatible to the bindings documentation.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 28e2cb50d85e..ce1bba980961 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -15,6 +15,7 @@ select:
     compatible:
       contains:
         enum:
+          - google,gs101-pmu
           - samsung,exynos3250-pmu
           - samsung,exynos4210-pmu
           - samsung,exynos4212-pmu
@@ -35,6 +36,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - google,gs101-pmu
               - samsung,exynos3250-pmu
               - samsung,exynos4210-pmu
               - samsung,exynos4212-pmu
-- 
2.43.0.rc2.451.g8631bc7472-goog


