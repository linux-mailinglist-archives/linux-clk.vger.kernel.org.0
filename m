Return-Path: <linux-clk+bounces-19944-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDD1A74ABB
	for <lists+linux-clk@lfdr.de>; Fri, 28 Mar 2025 14:37:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E1B77A698A
	for <lists+linux-clk@lfdr.de>; Fri, 28 Mar 2025 13:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98A6A21C197;
	Fri, 28 Mar 2025 13:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zf2FqG/y"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC414199235
	for <linux-clk@vger.kernel.org>; Fri, 28 Mar 2025 13:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168665; cv=none; b=JlEqhtidgDIhyQGMATbAmOyzK/+z4OwLkTfCaChBq3/Z0Ml+KHLU5BsS6EJRyBHHwixT+98+dkJE8JdoS6aHy5Czcz26Wwez06hZo27YSsLsHTWiJLBZ6npuBM22wqrWwDR/w5X/L9179BzWgEEt5UIWT0b7tz3Ri0lDz+gALGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168665; c=relaxed/simple;
	bh=ch+tVjxpZDhWADsqi2xUerCCp822EcsZf6tgYWcJO4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pKBmWosJAMCWAgLNMyDTJLJTLMlZKIhzPTme5GY3o1hsaJbw+OpQ4nQYYq49rliyg9riC3nZf3nuPVYXwKhdFB3uK54WJNvs+kqYoQJaVedwbhLTuLqMLPKGffSFHPpeMSVlnOvosWFhuVsjY0vNEJmsZ2pgHQNavqt79TAuAOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zf2FqG/y; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5ed1ac116e3so3663037a12.3
        for <linux-clk@vger.kernel.org>; Fri, 28 Mar 2025 06:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168659; x=1743773459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p70205lv5Ahwks+JMv232ptcGxJ9M60C9dRMMYjFwHs=;
        b=Zf2FqG/y66Mgu8ATKGA31rciFAuExv5XNSLhAv0+YKi4j4U4gYffRGpK7M1S8Kzgtv
         LlEZ6RwmB2Jpou5Nu0DEC4YBjs7V+EdbhLTUj6Q98nIc4XEC+//hna6B4S+/fr9LEK9W
         efYuaVdPTPg++Zce4PzuR0trfm3oaEQcjN0fGXPg25Y6ug3jl2ShfRrvdEFOUJLXaPV2
         GdyhXFti/bXK8UzOE54t4NkqSnkjSXd7FzCc9kUDEQ8blR2Mgj5r5WjKbz+AvNKCi8tb
         R9UswMJyeD5S2721BlX8PwsWXX8jfCMLKhRjiF8b0M6foBA2arWpqoi2VwqGlh7j14dp
         5epw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168659; x=1743773459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p70205lv5Ahwks+JMv232ptcGxJ9M60C9dRMMYjFwHs=;
        b=juSytz9bLs2waWpEZsbOgCtr+Wb1Hc86rBz4od7sLh7+mVzwN+Epk/ebrsA40AI2iD
         hfHCq0JUMyoBdLraOat/qkN/xszLTg/SsLRzN4HMG8oge5bVVMQaYmKWHxj5Cz93wWR9
         PT+TtpBHF0jEkwX+ET7Spp1NkwHaN7+FppJKBhQi98ItpTw3PyyGW9l9XGx+7cI0Vhh5
         mlytXk+LkKJYjCSaLhrUi+6xhB4F0Pm1BzySYaSlfOxcznFLFhsmBlKJOj3zuvf5xPoa
         QuonOzq6KUeLmihArYjBq8k02HcF6CTBpESxlcJfX6jCeSqfxCHSZ6dL5HDLHL7wfpjD
         4ntw==
X-Forwarded-Encrypted: i=1; AJvYcCXLWTHUuoHp0ftG8nyAB6wMVkMXm0E0O0irwxE7YvhcPUrcronzz9lpDfQ3mDaux7hxTI+tb0XsT/w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu10r9C0qbhVgLyblUqV/gF/oZnRn64cxZipUTwD5qvNxzsafu
	w0vi9JlgRBusVTIcPM5hHjJ+34xj24i5hLVHC8kgi9dY92UhuQ3mw4xqqZTAvkU=
X-Gm-Gg: ASbGnctHpjfqfxLj2Ditp0X5lxXVQEIlg7Cds+I5jXQ5ITFjjXbuqYt2kdVG3aazYGj
	wIBLjxOW95cYBQf2s4W6EBKZz+N4v2TKo/WmeN+nY2TQOo7OY44G0zDF+kUQaVsF/nODA3iyrSx
	cu83yMNoukSNVwfAcUFjgltPJBV2V/TWvENH499g7XJGD4g/WHGTIndjzXu1qJUDzoOgOSThvP7
	ZnI5EZENbhNtsjDLWNdlNiTA+dQ4k7joeuTwNpXWIl3p8zapzRRU7Ct3PW9u8VaZ7TKqsWQ2YKr
	rY3E7mlY5l73Q6VoSDJhnASyNeKsBU4XbEVJ2wGd4yysVqo7IMMvJQ3WX8QUXYs0D4N3RdKepJi
	jOOQxR0EVrUFnwDjsR2+YxJbW/ZAM
X-Google-Smtp-Source: AGHT+IHxP2Uv5JCL7mBzhNxmy1vBuez9/wb1XD7Bn0E0BvHAW9NPQJMgxLbLOCUMtAwVk4l4WbA2Aw==
X-Received: by 2002:a05:6402:2744:b0:5e5:c847:1a56 with SMTP id 4fb4d7f45d1cf-5ed8e28cdbcmr6969582a12.10.1743168658859;
        Fri, 28 Mar 2025 06:30:58 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:30:58 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:28:56 +0000
Subject: [PATCH v2 10/32] mfd: sec: merge separate core and irq modules
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-10-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

There is no reason to have these two kernel modules separate. Having
them merged into one kernel module also slightly reduces memory
consumption and module load times a little.

mapped size (lsmod):
         before:             after:
    sec_core   20480    sec_core   24576
    sec_irq    16384
    ----------------
    total      36864

Section sizes (size -A):
         before:             after:
    sec_core    6780    sec_core   13239
    sec_irq     8046
    ----------------
    Total      14826

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Checkpatch suggests to update MAINTAINERS, but the new file is covered
already due to using a wildcard.
---
 drivers/mfd/Makefile                     | 3 ++-
 drivers/mfd/{sec-core.c => sec-common.c} | 2 ++
 drivers/mfd/sec-irq.c                    | 9 ---------
 3 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index b617782eca436e34084a9cd24c309801c5680390..8f315298b32a2a9ee114ed5e49e760bd8f930aee 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -228,7 +228,8 @@ obj-$(CONFIG_MFD_RK8XX)		+= rk8xx-core.o
 obj-$(CONFIG_MFD_RK8XX_I2C)	+= rk8xx-i2c.o
 obj-$(CONFIG_MFD_RK8XX_SPI)	+= rk8xx-spi.o
 obj-$(CONFIG_MFD_RN5T618)	+= rn5t618.o
-obj-$(CONFIG_MFD_SEC_CORE)	+= sec-core.o sec-irq.o
+sec-core-objs			:= sec-common.o sec-irq.o
+obj-$(CONFIG_MFD_SEC_CORE)	+= sec-core.o
 obj-$(CONFIG_MFD_SEC_ACPM)	+= sec-acpm.o
 obj-$(CONFIG_MFD_SEC_I2C)	+= sec-i2c.o
 obj-$(CONFIG_MFD_SYSCON)	+= syscon.o
diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-common.c
similarity index 98%
rename from drivers/mfd/sec-core.c
rename to drivers/mfd/sec-common.c
index c4b7abe511090d8f5ff2eb501f325cc8173b9bf5..782dec1956a5fd7bf0dbb2159f9d222ad3fea942 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-common.c
@@ -307,6 +307,8 @@ static int sec_pmic_resume(struct device *dev)
 DEFINE_SIMPLE_DEV_PM_OPS(sec_pmic_pm_ops, sec_pmic_suspend, sec_pmic_resume);
 EXPORT_SYMBOL_GPL(sec_pmic_pm_ops);
 
+MODULE_AUTHOR("Chanwoo Choi <cw00.choi@samsung.com>");
+MODULE_AUTHOR("Krzysztof Kozlowski <krzk@kernel.org>");
 MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
 MODULE_DESCRIPTION("Core driver for the Samsung S5M");
 MODULE_LICENSE("GPL");
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index bf86281401ac6ff05c90c2d71c84744709ed79cb..aa467e488fb5ef79d5bc7110e1ba7c26fcfa9892 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -6,7 +6,6 @@
 #include <linux/array_size.h>
 #include <linux/build_bug.h>
 #include <linux/dev_printk.h>
-#include <linux/export.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/mfd/samsung/core.h>
@@ -17,7 +16,6 @@
 #include <linux/mfd/samsung/s2mpu02.h>
 #include <linux/mfd/samsung/s2mpu05.h>
 #include <linux/mfd/samsung/s5m8767.h>
-#include <linux/module.h>
 #include <linux/regmap.h>
 #include "sec-core.h"
 
@@ -510,10 +508,3 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(sec_irq_init);
-
-MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
-MODULE_AUTHOR("Chanwoo Choi <cw00.choi@samsung.com>");
-MODULE_AUTHOR("Krzysztof Kozlowski <krzk@kernel.org>");
-MODULE_DESCRIPTION("Interrupt support for the S5M MFD");
-MODULE_LICENSE("GPL");

-- 
2.49.0.472.ge94155a9ec-goog


