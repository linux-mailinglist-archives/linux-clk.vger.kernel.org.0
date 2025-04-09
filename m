Return-Path: <linux-clk+bounces-20374-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 15691A8322A
	for <lists+linux-clk@lfdr.de>; Wed,  9 Apr 2025 22:38:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBD2917C45F
	for <lists+linux-clk@lfdr.de>; Wed,  9 Apr 2025 20:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1596D21A928;
	Wed,  9 Apr 2025 20:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rpEp9wod"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA132147F3
	for <linux-clk@vger.kernel.org>; Wed,  9 Apr 2025 20:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231063; cv=none; b=t13Ti/W94TlHBZmHm3xByQeZuLXUFM3YL0h3UcEWj8bP+yrc8VQocY13ps31QnZ+lHu4kMAcCMKSA/NyFsBuPeo++DumjcgOge2Lqc2ud553rrpeFT2oB2si73V8MftzRNwFEOISuhYiqOBwYYG7ZisUY3gyomR3Rc6vOY9bgLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231063; c=relaxed/simple;
	bh=Tg+EECJEMhDBy26h09EPf/zAPOdiicgT6zSdtCPLtV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y9UVn/fQbdQHcBCyuq98QHROZWqxVjX8q1vY3A8lIl9ircvqkMQyPts70fPD5cCRPXt2sf5CRGlTpuUYn/N8LnhloC/utxr+HlNvVmbRrJsQu7lBy4rMxdui+HZ4wb51avrd0O+AmcsL2xWInQ5DX/e7bk7sHyHDt7vqx89Jjmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rpEp9wod; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac25d2b2354so16855566b.1
        for <linux-clk@vger.kernel.org>; Wed, 09 Apr 2025 13:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231055; x=1744835855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P3fOqZDxBeGvRIRUqcDmtOeRQ71JamkiET0HGj8mn70=;
        b=rpEp9wodKkyBPGCI3GQR0SE0Ynlimr/VUoDzZxmU1WWWMcGVzIaLavVD5lm/ssJc8H
         95HdjEYJMxTPpUZrmd2k5PgoSX25udyQLWmZEReT1rXiS3EoDQLGECqLSXrSll+02Ya3
         5OrG6KkJERosj1O3yzYDAPtZJO8khEEz9j4XQr/a/QmgjBg3VyCTmAz+ErwDxF/MqYIp
         i3DX2n7qb8pzawGuPm7bc/i0NikmdP8cxKa9Lf/u1Tf69bammKp2utlQy99xnUyQzcdM
         e2CvXf8IerK8NbNuWwxuZSBoVl0097023JbboXvd1ac9smy0ZXHkMWE+u4n/bSaTmspg
         FyEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231055; x=1744835855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3fOqZDxBeGvRIRUqcDmtOeRQ71JamkiET0HGj8mn70=;
        b=BgoKeWr61fiYIuc7b4fl06lhHIHczAtBokyuf0y62aP9YtTNiPIuQYSBNst+pDtdCF
         A5GPf1FScJQCCjeUVUiO8dDiPwkvZirCmGPB11QnBijpOtpZFCDvrNmQJf79SxC+P4ul
         YBe7qnidZG2IVN3CVOnQ0sjVSoFs/91+8FIF0ejQ6fls/bC2nszDdObaJjETJrqq3YNw
         RZfUtoSY4FWSM62HgsElnGqzS/N2ZsHxZQGOVJcVqC+UGiRqSvX6LjQZqr039hpb/XVP
         Le2RJDaHtmbR7FkZYHmFIugLau4O6FWUenfyjjDJc+mHYoz0o3xenjraFPDo5MjULDuk
         j+xQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw5o5bMd1bIW+1I4zO1UgiUrhs8nNGPjOU/3Utgbp9tGtrPbi/DeAOo1W9ZjggvmECb282WptjECI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMo95inrq0TnTL5980qi5p36U5mCUmDHMQ1n8inQfncT7tx59N
	wy/44eQQCCqlrheoITf4SeDa+s8prceBl73hsSGSCtpASaTt6fALOEmXFNR8ynI=
X-Gm-Gg: ASbGncsD3kYSbwTMeOK9JybmMWjeDKoO5HMrs9MqZLymAl1vmNqSPgH64g6K2Rp+0bH
	vpTn6QnioLIQuEmlNxCbX1qM3axhX2o6zoT3Baqa/sAScpYf5qPJ00CYVOXYPp0EVDukvKqCoP1
	v2ZJmMMHLRIS8yo1mC/Q5gbODVaHl0b27abCn/+XTG/qtc+iMiHjtt0DhkBaf/RaMqNlQWamLjw
	uN5sBvGDnAqz/y0AL/ypNQjMMHJ55yNxjNE6/X0X1ZMpYAV0WgTPnQIUcNCianc5a73cYfWbho3
	JJNU1I81hPpmUBbz0X1hmjYjwBNys1aR3Pm36v1INOZQD+xpFufXEPSVM8VYNV2CoXp9xmMmhja
	c5toweAeOhlv6wdK8yKbrMM1huz8=
X-Google-Smtp-Source: AGHT+IHJuWMraf2Rg5PhLN6Df1HN4IcFp4yjz25Ca2aiIRnrBI5pfymQKmIjo+to0QjALf4ZkpSB8Q==
X-Received: by 2002:a17:907:6eab:b0:ac7:d101:2a with SMTP id a640c23a62f3a-acabd3b9653mr8791266b.48.1744231054640;
        Wed, 09 Apr 2025 13:37:34 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:34 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:31 +0100
Subject: [PATCH v4 10/32] mfd: sec: Merge separate core and irq modules
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-10-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
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
index e9beaa2a53fb42120eeb465a7c19acb4af6a0e59..b75d7fe86253037b4b7256a4d8c089003d58bc44 100644
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
2.49.0.604.gff1f9ca942-goog


