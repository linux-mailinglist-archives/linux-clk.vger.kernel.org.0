Return-Path: <linux-clk+bounces-1121-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D08FB80B7C6
	for <lists+linux-clk@lfdr.de>; Sun, 10 Dec 2023 00:32:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D6721C2088D
	for <lists+linux-clk@lfdr.de>; Sat,  9 Dec 2023 23:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E118922091;
	Sat,  9 Dec 2023 23:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o2MrQYLm"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D681C171D
	for <linux-clk@vger.kernel.org>; Sat,  9 Dec 2023 15:31:25 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40c41b43e1eso4848995e9.1
        for <linux-clk@vger.kernel.org>; Sat, 09 Dec 2023 15:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702164684; x=1702769484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ev7tBmAL4exKhbL7aDYuVJcQPzB8BKI+lGm5G38LuBA=;
        b=o2MrQYLmPX37cUnfRn7wu4HmeecVWNyoKjZpiXdqJlNLDC3GLYWsyTXV2toCfT/HHo
         //kCgbnoBRaoaS7g5B8eKuROjH3qNw4wGga2hnrEf7JbBoWWf7V1Kh+Exv73QaSLjXL3
         UW0noIKD/5r6IAF7e3GuQCeh1EBcHWk9rTZZiCUzEhWgj7lYNkDyXp4L2xIYMdzguLHt
         EqL0JtQOxZkvrLIuSsXiUNTDUdsLe4X8vsCsbMLSlJ7gR0eIAT+g5nmLwxKL/OW8jM64
         3ydB9lP0WyAC+2Bgcys+XBvqznGjpxowNBW9f8Mdt06i4TqM1UZyHKnThfVguh6GM3I/
         ab/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702164684; x=1702769484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ev7tBmAL4exKhbL7aDYuVJcQPzB8BKI+lGm5G38LuBA=;
        b=RvcutBUTKQor7btHxoBUur0E2ys01vwF9aEgUlnzBDa/1h6aLPkHQ3XvyMfVoqf3J/
         2acY7geZpSXT/gH/U9hcTGJ7sHSxv2nH966G1CQ9ijDMYOQxFvHfPXzm4wXVhW3NMekz
         wOhky0ox27Lc2jCf9b4tOewb5HcbJEU7c7BjwClwvvw7h4nyZ2Xh6u6Y5YFY4AFvRtpW
         6HnfFbbN3m/8r/C5+XhkgOwcVffHWA3nVyl1nvjZzLzBQi/Cq4mLc0YStBfEmY4+rdwz
         tu4FL4IQ3Vm/LUpM/QZsU9dq9nWGMEThr6C0wnmgeWDFIvE3YsBfL+2rDYe9UlJSb8Sd
         bVXw==
X-Gm-Message-State: AOJu0YzaboXEe+wvtpZ4qYeEwXBRbCmGN3qpUSE6bh2cL+Jt0hRomkWq
	xiGL8Ll3OXY81jlyLRk+34LF6g==
X-Google-Smtp-Source: AGHT+IHRMsrr+sTrifsHJqlSrVxQ9iiSsPWjrda4g5ASm2G4g/kv6N85c9HQuG9gSEeYRQWjo7iYvg==
X-Received: by 2002:a05:600c:4591:b0:40c:325a:545c with SMTP id r17-20020a05600c459100b0040c325a545cmr934635wmo.221.1702164684360;
        Sat, 09 Dec 2023 15:31:24 -0800 (PST)
Received: from gpeter-l.lan (host-92-23-61-173.as13285.net. [92.23.61.173])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c4f8900b0040c41846923sm1875277wmq.26.2023.12.09.15.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 15:31:23 -0800 (PST)
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
Subject: [PATCH v6 07/20] dt-bindings: pinctrl: samsung: add gs101-wakeup-eint compatible
Date: Sat,  9 Dec 2023 23:30:53 +0000
Message-ID: <20231209233106.147416-8-peter.griffin@linaro.org>
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

gs101 is similar to newer Exynos SoCs like Exynos850 and ExynosAutov9
where more than one pin controller can do external wake-up interrupt.
So add a dedicated compatible for it.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 2bafa867aea2..4c0e25754c6b 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -44,6 +44,7 @@ properties:
           - const: samsung,exynos7-wakeup-eint
       - items:
           - enum:
+              - google,gs101-wakeup-eint
               - samsung,exynosautov9-wakeup-eint
               - samsung,exynosautov920-wakeup-eint
           - const: samsung,exynos850-wakeup-eint
-- 
2.43.0.472.g3155946c3a-goog


