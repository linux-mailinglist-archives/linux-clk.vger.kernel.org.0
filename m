Return-Path: <linux-clk+bounces-19725-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9E1A6D19A
	for <lists+linux-clk@lfdr.de>; Sun, 23 Mar 2025 23:40:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C9DA188C731
	for <lists+linux-clk@lfdr.de>; Sun, 23 Mar 2025 22:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A0561DE3D1;
	Sun, 23 Mar 2025 22:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b5hOKARr"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE8C1CAA7B
	for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 22:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769572; cv=none; b=SpZr3RRiBGD+Z8eKdcCw+gnOXcnQC7+W1NO2BWtYSCEq9M+4hWUwgMm5sptSFF57UDGMfiheX6aEhwrzAW5Oozt955u4cc8d5kdduFIvIrw0rd0gTr5zROD6wNx3nLxhAe5kb2iCBWPdXlz6MmagNK7uxF+8ulhiadHnmDIp7vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769572; c=relaxed/simple;
	bh=78YLeSjujtRUeSeH8Vmm4IW9a6yqsbDcHABSrgUettU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LEjk8km/1ySHT0mg6zQflr4cAVKvQKR5hsYGf5KTfQhAny2kOqc2Nd15Xh9J/Lo6IAFYr3mdB86SNy3JoAqpck3MLJQ7bt6sPNrg1sFh/LPJYsrD7MlXXAS1LpPkox8UWha3WtGpAqQNe8GI9OsHSWhKwQX0GgoS/C0oG+jh+T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b5hOKARr; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ab771575040so944742366b.1
        for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 15:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769568; x=1743374368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0uX6CkEO0NwgPlFwhM+5SvUIZg247JR2UUxHaZZQTw4=;
        b=b5hOKARryU99nrH+vk+1gXNyeAwqNlf6uuW7rALv1d4ffsSGK1CVF5QweC+IyZ1YsU
         ID36Wiout5/4QBC1wAB7ZlQMbAK4KRkYB37zmbS1Y3ANcra8qkMXry9M7M5itzN7JFfd
         RnNeEHKinM3ip/QmcLQ2+p9N1R7l0nsORC4SOFLbRKgwM+q2rF3cAB3RuG4CkRQ/n4S3
         1qLf2W4WMfw1eEy3DNFb4lBVbIyN/u2uinBdtP+J1lWsac5Q8ZB5bSfySbT3ErLKZXV6
         4N44MEY6A0ymwkxAlM9qDSxNY//q6eJsSQoaYkX7q+pMyckK7spFg8fX9g6FQjkavLuH
         HPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769568; x=1743374368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0uX6CkEO0NwgPlFwhM+5SvUIZg247JR2UUxHaZZQTw4=;
        b=dzWUu5y+ZpboJNIRzzY5pHBrrDAXLIuOXmAyMV5shkValI57UGoDLwCqPIRn3Fs2eH
         ouvZXcHl7L9yzTdSMVa7OKHuZs8USSK8D1eR7wR9r+Uq9xZfzldL4Fkv0zeVj2hj7aJ/
         nOexsc33q0uZue+gII3HhOyVgTxvK227TAj5KdgoS/wXDb5fl5/vo7E6Zpq0AMHyYCNc
         jKYxkYL5qaYMOxmUHTnAvwW5rkoK5Xp+gcqOv6YPHAYV36dcsMVukQqUcOJUUYUK9N90
         05Ow6DM+1B98hJ9YlExUlC+UOpPAjkTftwHqXmvJzjQ/f5LKsBj+vivwmY1HxHUqWyDX
         bXnQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1tKSdEF59pUwEpsmZ04LraqdRmo0rt+RGufMnexoJXsyHeBp93RLWnZxA+gCpvrvijg9T4ZsxYVU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk70OyewotTrphohjoKFM3hBprIfBREy+kIynoFxXYpk++CWww
	cly4S0o2eCiEdNzzz1loPkzoPwtpbOFgPrTxEowOGo/QGMgREPOgHgLctSre5jk=
X-Gm-Gg: ASbGncsMgxMzZqvJeyB1RHUnCQYHa+z4JjEVkwiRZZvB8KkMYfBuxTjihCkyGmT1uCu
	oG/Ha6y8gUrAH3WBiep5f1mdu7YnBwzhbkqy6zPEV+LYuYFw4aRg0YEcOyTw8y94+9rspXc+fYs
	ytk4K95xML5WetMMkfapON+hVWq7hvt4n+YrhErfsfIIor/WGOCrXPkMQMgjrmMC2zaG5CMflz4
	1FAvPuUhPuA4PG112I+owV5UReBVVB8Z9Bb5XQMXlJXFkR1zQLAqnSPNK2exbTj4873q8TmE8Hb
	mUafWR2RqgkZvplmAPETQ8R+YxBn0li0WrmqBASxVV4ka8xJ0EyIM0SSZp0QZc1LiQSxWkzwTZS
	F3qaVV4rEJeuSlm+jtV17msBNVZ/OD43CII4HfCs=
X-Google-Smtp-Source: AGHT+IFvkyM7m55m5DAsodXq5EZ4AXqEDqM6V8YHvLrK06u5ugX5A70IcVFVe8/Urn5Sgh48Nw6Uvw==
X-Received: by 2002:a17:907:2d20:b0:ac2:26a6:febf with SMTP id a640c23a62f3a-ac3cdf8a8bbmr1398647266b.20.1742769567610;
        Sun, 23 Mar 2025 15:39:27 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:27 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:23 +0000
Subject: [PATCH 07/34] mfd: sec: move private internal API to internal
 header
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-7-d08943702707@linaro.org>
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

sec_irq_init() is an internal API for the core driver, and doesn't
belong into the public header.

Due to an upcoming split of the driver into a core and i2c driver,
we'll also be adding more internal APIs, which again shouldn't be in
the public header.

Move it into a new internal include.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 MAINTAINERS                      |  2 +-
 drivers/mfd/sec-core.c           |  1 +
 drivers/mfd/sec-core.h           | 15 +++++++++++++++
 drivers/mfd/sec-irq.c            |  1 +
 include/linux/mfd/samsung/core.h |  2 --
 5 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ebf7fa9a814d2d198fce853f7ff9a01f2bb69f5f..d686e02dc7ccd61e35173df997d2f894ee5ab515 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21351,7 +21351,7 @@ F:	Documentation/devicetree/bindings/mfd/samsung,s5m*.yaml
 F:	Documentation/devicetree/bindings/regulator/samsung,s2m*.yaml
 F:	Documentation/devicetree/bindings/regulator/samsung,s5m*.yaml
 F:	drivers/clk/clk-s2mps11.c
-F:	drivers/mfd/sec*.c
+F:	drivers/mfd/sec*.[ch]
 F:	drivers/regulator/s2m*.c
 F:	drivers/regulator/s5m*.c
 F:	drivers/rtc/rtc-s5m.c
diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index b12020c416aa8bf552f3d3b7829f6a38a773f674..83693686567df61b5e09f7129dc6b01d69156ff3 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -23,6 +23,7 @@
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include "sec-core.h"
 
 static const struct mfd_cell s5m8767_devs[] = {
 	{ .name = "s5m8767-pmic", },
diff --git a/drivers/mfd/sec-core.h b/drivers/mfd/sec-core.h
new file mode 100644
index 0000000000000000000000000000000000000000..b3fded5f02a0ddc09a9508fd49a5d335f7ad0ee7
--- /dev/null
+++ b/drivers/mfd/sec-core.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2012 Samsung Electronics Co., Ltd
+ *                http://www.samsung.com
+ * Copyright 2025 Linaro Ltd.
+ *
+ * Samsung SxM core driver internal data
+ */
+
+#ifndef __SEC_CORE_INT_H
+#define __SEC_CORE_INT_H
+
+int sec_irq_init(struct sec_pmic_dev *sec_pmic);
+
+#endif /* __SEC_CORE_INT_H */
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 3ed2902c3a2634a6ea656d890ecea934053bd192..4d49bb42bd0d109263f485c8b58e88cdd8d598d9 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -18,6 +18,7 @@
 #include <linux/mfd/samsung/s5m8767.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
+#include "sec-core.h"
 
 static const struct regmap_irq s2mps11_irqs[] = {
 	[S2MPS11_IRQ_PWRONF] = {
diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index b7008b50392ab857751b89e0a05d2c27f6306906..8a4e660854bbc955b812b4d61d4a52a0fc2f2899 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -71,8 +71,6 @@ struct sec_pmic_dev {
 	struct regmap_irq_chip_data *irq_data;
 };
 
-int sec_irq_init(struct sec_pmic_dev *sec_pmic);
-
 struct sec_platform_data {
 	struct sec_regulator_data	*regulators;
 	struct sec_opmode_data		*opmode;

-- 
2.49.0.395.g12beb8f557-goog


