Return-Path: <linux-clk+bounces-742-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CE6800F7A
	for <lists+linux-clk@lfdr.de>; Fri,  1 Dec 2023 17:12:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56576B215B1
	for <lists+linux-clk@lfdr.de>; Fri,  1 Dec 2023 16:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A50F34CB53;
	Fri,  1 Dec 2023 16:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wQ5yYzsu"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6A4C1985
	for <linux-clk@vger.kernel.org>; Fri,  1 Dec 2023 08:11:22 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40a4848c6e1so19944155e9.1
        for <linux-clk@vger.kernel.org>; Fri, 01 Dec 2023 08:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701447081; x=1702051881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NW19mxe4mqyEScY6tYe0GRvxeq4h2O2gsGPGYkrMyss=;
        b=wQ5yYzsuY34CGLshiJUSEMmCIOQpepP6X7nM4cbw3//Pr8v7YZXW876Jrc3uvIKo9H
         lE4xEi2ckW+6gbsFHJb+U72bam1o3Xlkk8zth7s7gYdc5JylypzAiVNiKOhAL54yRFGp
         jcJIcibCcpfL9arg7VzzhZX4vOqDTp7aFJ10hQ4wcQzWt+XBZZBYi9Ig1PaB7QB/8FyO
         Ml8A8zbX/k5hXOCFVjUIjAP5hHI73WVPU9KL8G/ItPaVPasj8E3FIRwJdXanGbB4zhzv
         DB+Q1mGl0L14AbybzPBeWF6noGaKL4FtXOA2v/r3IaYD5fguB13pVeHeRKP1z25N77k6
         MCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701447081; x=1702051881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NW19mxe4mqyEScY6tYe0GRvxeq4h2O2gsGPGYkrMyss=;
        b=llYmq4r4Th6oXxd5ZkTK0rnXwyYODAIRkHw0+8idKZB35mExDi4GLdf5Gu9v7lARaa
         6kiW66Dt5lZ1WVXIGvTqmN+JoqoeNwa69UAhQ+F/ue9jGSkjL9Rrb6jFlGbZDA/XZJ3i
         mI9HokM0kDAf6ANkjKAr4QOeJL2JrV7x4oqZJcNtEV0klGV5mxnI5QQzCg6m62tZdZvm
         vXZeXR7/t/K+wRYsQDjGyAi5cFQd/B4nOInzD1VnIKrxvqC48GD3Zfux6EQS5IcLvf2i
         vKUyvYjkKmdHN8Ez6IP0wGjra4QSmNLhyOU7foDf05pVpXt2qLAx34ntr4WL+p7fOBtv
         TxGQ==
X-Gm-Message-State: AOJu0Yx42v2wohXV7MXoBYzAdm0qpuxj+sxndPVGKauyWGiogZ12tIyU
	Skiv0ulMtP3i5JbpuD6S1dFWiA==
X-Google-Smtp-Source: AGHT+IEAInbF0fkztmGpsgy6V1cv3bcIiQ/CkWEoRX4j4aDC0mNAEkPg+rKi6QFg/uuZCcRUUH4s0A==
X-Received: by 2002:a05:600c:230c:b0:40b:5e21:bde1 with SMTP id 12-20020a05600c230c00b0040b5e21bde1mr406099wmo.112.1701447081131;
        Fri, 01 Dec 2023 08:11:21 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id cg16-20020a5d5cd0000000b003332656cd73sm3907386wrb.105.2023.12.01.08.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 08:11:20 -0800 (PST)
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
Subject: [PATCH v5 20/20] MAINTAINERS: add entry for Google Tensor SoC
Date: Fri,  1 Dec 2023 16:09:25 +0000
Message-ID: <20231201160925.3136868-21-peter.griffin@linaro.org>
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

Add maintainers entry for the Google tensor SoC based
platforms.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 36f6e76170e6..a3bd682c9e32 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9032,6 +9032,16 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git
 F:	drivers/firmware/google/
 
+GOOGLE TENSOR SoC SUPPORT
+M:	Peter Griffin <peter.griffin@linaro.org>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+F:	arch/arm64/boot/dts/exynos/google/
+F:	drivers/clk/samsung/clk-gs101.c
+F:	include/dt-bindings/clock/google,clk-gs101.h
+
 GPD POCKET FAN DRIVER
 M:	Hans de Goede <hdegoede@redhat.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.43.0.rc2.451.g8631bc7472-goog


