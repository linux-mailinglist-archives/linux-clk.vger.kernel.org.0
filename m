Return-Path: <linux-clk+bounces-20152-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74694A7BC15
	for <lists+linux-clk@lfdr.de>; Fri,  4 Apr 2025 14:01:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AB6B3BC6E7
	for <lists+linux-clk@lfdr.de>; Fri,  4 Apr 2025 11:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E7781F428D;
	Fri,  4 Apr 2025 11:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r6ESB9MA"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAFF1EE7B3
	for <linux-clk@vger.kernel.org>; Fri,  4 Apr 2025 11:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743767828; cv=none; b=hHGvPpbIv7mmf0h7YmuP99PUmEgjKa6OPsXnoxUYRVpuRny15gxxd4UMbuv0rhur5Z/9mWOAG59jxputvXDBnJy7XW9YrugxsF+YOcqiYdkwvBH0KDPqpvut2ju4+DvOKbbvOGHBlYh1rWpac2qiDMFLWPi7SFfAd5zU2L9g/zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743767828; c=relaxed/simple;
	bh=YI259iMximjELrxM/8u/Qw6/mJUi2mzFrILZsHdPMf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FPZuhvbbdV16LZOoE8uh3PdVSr1SDymCJw8a8FevDinpbCQ8DussyQMKMMfYOwwud7L4tNSSeRJ4YMSa31ihCdrPk7l+YCnLLBfT7I9cQE7W1DrKcuYIHOM83RIcYofumTiYlO+yPgFz9kmv8JpmTU+iuLUIkN+wzDQyJ8cP+mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r6ESB9MA; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3913290f754so218065f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 04 Apr 2025 04:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743767825; x=1744372625; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gxJBcAGGDyzbDLJAvfdPdyWxOOxD5U4tNFwB4IbsSu0=;
        b=r6ESB9MA0w0jbKagB+LZhmE19V47nFepnBxnlxPxrkR/BailqdFKJKdMlXV342S82q
         RxzhM5vQuLfxM1zReNbDxpL9NJO2MA4iRjeeosrPVlycZwMcRlN1zIR0Dvwx0mbpGv/W
         V/Bhb7kCCy6ZvTGOwaja7+Dn2IzOjbr8sb2f2c01+o1Nnfkvy2HtwIVE+RA3ua0aYLEr
         I2lssKaOD/ci3CeMGDElKPZUg2zugnCnehO+8WgSrj6z0sgNsfexWYDTbY877kyqOyBC
         nn50PJ0P96fOyFdCxPdOoaKeCEKPm4sd2fxXyIuS3F5TzKqg6g/LCUTY0iCLt54wUmUv
         HGsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743767825; x=1744372625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gxJBcAGGDyzbDLJAvfdPdyWxOOxD5U4tNFwB4IbsSu0=;
        b=B8NR+LElZ5Mq4KWK3dfpC0j46mwH+QwhbZ0ezLXudOUNYKFw2ovqIiMBSCd66eJZ/e
         3ilmE1841lSF1AOUOWUnUDYrUysHf7JnpH6dyh49DliIgfzSB9wmhDSlj4p4n5+IrVDm
         k8oiA45AglygdR2N6IeBor84eemii1otS//HlggU/pREhyGCkfR6B5OarZnm6gPuN2uG
         Fj7E37cvX5+g/Vu79X0BDj5S2KFRn8bJic5SuRfZDSoGxlBIdVKnHR2Q6V2Hf2tQ+JSl
         ptnIF5hLDWtuqA+dGZjFqT3SqIspuWUVlPHyDyL/nX4KJjsSZQ3kaZY1wAe6H82yfJiy
         yODA==
X-Forwarded-Encrypted: i=1; AJvYcCULqkclU/Dh0gyoDDYoZTHzYYaD17AxQb3Txbu2lfUP6l526ITEUTJ+jGH2/lUemsXqlZhDNBVxiY0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwe2NV+DeyuOxDNkDx/jJBDyB5ltvH75+vMHDATDO/+aT4uRJQ
	JM/Sbil74I/vk4NC+LlRRGxFfQxJtcJNNeZH2ZBTscprSnwimx6F0m5ia6hL+z8=
X-Gm-Gg: ASbGncvZqy03NVY3yiPLAKbzBjpXR4g0DE+ALmlR9664rk/VDPfLKLw/AwJCE0MU8zc
	ufupYUaUF8xqBIc1qL4x9b45JNs57bd35ScEFKrQFRoS2VGtm3sKY7T+H/MTXgzV9JaKhJrhIrz
	Ao30GH4rvUwSnZSqeMDOXT51VIryry5IWbmRaPOnUKIlQO6TrAdAHypRig+sc8TTlJKfLtkIBSv
	XJbGzdJOwrhMy8tnbOHILx6OOgMqv6i9drvfKD112m3+W9BwI399w4qN1lvqwSt6Y8qD3Mkxxml
	MDBnk2VhOgFikMU31WpWlVU8kEV7Q0WrxrSgz+k8fQqjEf1QcbkTJpDD0li0+95je7ghvcvFIQ=
	=
X-Google-Smtp-Source: AGHT+IEbqWVdAZjF0/qLy/H0JxxfBZjOz1OHqDHaLpBpQad1gKc6l1hGJIvzr71knts2F+y5b2ubng==
X-Received: by 2002:a5d:64c7:0:b0:39c:1258:17d7 with SMTP id ffacd0b85a97d-39cba94bb2bmr852989f8f.16.1743767824815;
        Fri, 04 Apr 2025 04:57:04 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364cb9asm43842815e9.31.2025.04.04.04.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:57:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 04 Apr 2025 13:56:59 +0200
Subject: [PATCH 3/5] clk: stm32: Do not enable by default during compile
 testing
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-kconfig-defaults-clk-v1-3-4d2df5603332@linaro.org>
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
In-Reply-To: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

Enabling the compile test should not cause automatic enabling of all
drivers.  Restrict the default to ARCH also for individual driver, even
though its choice is not visible without selecting parent Kconfig
symbol, because otherwise selecting parent would select the child during
compile testing.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/stm32/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/stm32/Kconfig b/drivers/clk/stm32/Kconfig
index dca409d52652213cfbd8d5ecf1a339ea53ba5d52..4d2eb993ea0838d408ff5b1e5b6d028cbcaa9301 100644
--- a/drivers/clk/stm32/Kconfig
+++ b/drivers/clk/stm32/Kconfig
@@ -4,7 +4,7 @@
 menuconfig COMMON_CLK_STM32MP
 	bool "Clock support for common STM32MP clocks"
 	depends on ARCH_STM32 || COMPILE_TEST
-	default y
+	default ARCH_STM32
 	select RESET_CONTROLLER
 	help
 	  Support for STM32MP SoC family clocks.
@@ -14,21 +14,21 @@ if COMMON_CLK_STM32MP
 config COMMON_CLK_STM32MP135
 	bool "Clock driver for stm32mp13x clocks"
 	depends on ARM || COMPILE_TEST
-	default y
+	default ARCH_STM32
 	help
 	  Support for stm32mp13x SoC family clocks.
 
 config COMMON_CLK_STM32MP157
 	bool "Clock driver for stm32mp15x clocks"
 	depends on ARM || COMPILE_TEST
-	default y
+	default ARCH_STM32
 	help
 	  Support for stm32mp15x SoC family clocks.
 
 config COMMON_CLK_STM32MP257
 	bool "Clock driver for stm32mp25x clocks"
 	depends on ARM64 || COMPILE_TEST
-	default y
+	default ARCH_STM32
 	help
 	  Support for stm32mp25x SoC family clocks.
 

-- 
2.45.2


