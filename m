Return-Path: <linux-clk+bounces-1120-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E93A80B7C7
	for <lists+linux-clk@lfdr.de>; Sun, 10 Dec 2023 00:32:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D34C4B20B06
	for <lists+linux-clk@lfdr.de>; Sat,  9 Dec 2023 23:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6451E53F;
	Sat,  9 Dec 2023 23:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="km5V7j/Q"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D0841716
	for <linux-clk@vger.kernel.org>; Sat,  9 Dec 2023 15:31:24 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40c38de1ee4so14484015e9.0
        for <linux-clk@vger.kernel.org>; Sat, 09 Dec 2023 15:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702164683; x=1702769483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OLTmFy+aGpsyLwOEhYkWRbjPeTt0aEpPpmb55d4OE4E=;
        b=km5V7j/Q9oJ0v38UsJLrwcbkBRo1D8m7DlWjiuHoTPqpuQY5yYv1xBLgcratFJqpy6
         ZxtmRrjaDt/0IrwOaRAhoT+W4sTynMCwM0QsgC80Yi8lsfLarnNVzR/yRuNW9LteQGiS
         i+xwTYjSjL5ZTflGoBpvjiv8MfiCCaEmXK32hFV6hsLkHbwswI3kqJgy/fs63YAkQDzo
         7Vys7OGArvJsOW7EUIfbnVGxEvBeHbiWi8MJo2l7Ml98foi+Ni/bdWMjQ2oZBJOF/0L+
         e8+8ZtZYPL/snXHxtNBhWsF/kj9VGY55aXvaNLjslRcPjVeNFiWF7WrF8DK07JWUZ9K/
         F/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702164683; x=1702769483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OLTmFy+aGpsyLwOEhYkWRbjPeTt0aEpPpmb55d4OE4E=;
        b=AL1N+4UoyLRWpFb9SHS/mYDMfuxG8yuiDyQZDnzQ1sKiKJxZfimLm6u52y2WWpDzKl
         lvODMsapjHlAWByf7gNPblae8XQSsjg9+19S/5WTULyz/bSQs4wx54cvhzlw5SXMZspI
         8CUPsG+0cDrm9ci+QUVH+3WzLfFhwEFN87s6RmdjqH1sHz25myhwvT3eM/+xD+P9X/5r
         9DfIQeSvxcwFMka2RnfilQjmvVHzoImP9/dY161R8Hm92CXvwkDSgqSMNfaq/RhxmVxG
         U3zjrCfqILpb3NQSlTK2g9YueZILSHO1yu7473SstR2hAlcFNelUVGau24S9xV96X38a
         Q1Lg==
X-Gm-Message-State: AOJu0Yy94m7DfUGwFHp5XYt9lKwV9TMR/oa6Ddu3RYIbyJtKTkKFK5Df
	g4JkI4qnYQwgW/KLSKwmaoQK3g==
X-Google-Smtp-Source: AGHT+IHZzuf9nj8AkteP8DCv0mhXpSmMS1+a+kuhBxEPUJQvoaaHh9qKEIYtsLnxuemYPnpFsZAh+Q==
X-Received: by 2002:a05:600c:1913:b0:40b:5e21:ec16 with SMTP id j19-20020a05600c191300b0040b5e21ec16mr1031961wmq.72.1702164682864;
        Sat, 09 Dec 2023 15:31:22 -0800 (PST)
Received: from gpeter-l.lan (host-92-23-61-173.as13285.net. [92.23.61.173])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c4f8900b0040c41846923sm1875277wmq.26.2023.12.09.15.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 15:31:22 -0800 (PST)
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
Subject: [PATCH v6 06/20] dt-bindings: pinctrl: samsung: add google,gs101-pinctrl compatible
Date: Sat,  9 Dec 2023 23:30:52 +0000
Message-ID: <20231209233106.147416-7-peter.griffin@linaro.org>
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

Add the "google,gs101-pinctrl" compatible to the dt-schema bindings
documentation.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 9f04a0c76403..118549c25976 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -35,6 +35,7 @@ properties:
 
   compatible:
     enum:
+      - google,gs101-pinctrl
       - samsung,s3c2412-pinctrl
       - samsung,s3c2416-pinctrl
       - samsung,s3c2440-pinctrl
-- 
2.43.0.472.g3155946c3a-goog


