Return-Path: <linux-clk+bounces-15597-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8209F9E91D5
	for <lists+linux-clk@lfdr.de>; Mon,  9 Dec 2024 12:13:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22510280ABE
	for <lists+linux-clk@lfdr.de>; Mon,  9 Dec 2024 11:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D983E21764C;
	Mon,  9 Dec 2024 11:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gJEAvzKg"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547EB217642
	for <linux-clk@vger.kernel.org>; Mon,  9 Dec 2024 11:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733742805; cv=none; b=VXwTiUYgj/VBAnZGLJ5eYMkL+EituN8MBguBnpv48o55bgFnwUTylnq7MCKsGOdwT1ixdDSSuEL/v5tL1xiTGC3hwtv8HuAkvN76N9Eq+72mfgQdrh3WQaMcg6hd7ekKIZL4nGvpBbilNb2dDJycTVxykTkC1Q3yNB1BD8MC27g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733742805; c=relaxed/simple;
	bh=ctZCAG5Aqf3Y8yiXoZO4qqr3U27BxAwSdahFvK/xCt0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hp0gidHXO62pDG2UDib7S96rpgoZvvyq4jSZt6iAJBvZS/9C4H3aX0O0Kd/3vtTEYxS+Rzi74VQouYYyrswIn5H9WK2q0g46eFaa8iYGluIrnhorMFkgPiyi0VSP21FbNUdGCDZ4MYeFNM2goTPuF7PZHx/QWeLDypN1u2uMM6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gJEAvzKg; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-434e895db69so925965e9.1
        for <linux-clk@vger.kernel.org>; Mon, 09 Dec 2024 03:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733742802; x=1734347602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Ct/JMjbQ8KPD7Q1/iLi53oFvmwtgzXtgERN5uFTBeg=;
        b=gJEAvzKgIT03nyqiKR3qCu7pNqdMQdvS1BLbkRM/9+G0R4FmHDvwCVgCt3R4x4bbee
         zqhFhQKtUflpTRqNwk+DkSFgWxr1HIWiTY7Pve+zo9nOq8lEQVbcxG5aO9bz5jwO0ad/
         d/jcbNepZEsmTwQhA9q2Ya92qHSO6ioRPOGsk3FkdLwBW0OoC1UXZNN7UuSwU9oELRri
         eVvZhjvkg+o/jpzZSrmZ+XkrhbwRjkKRcQL9ct0sip/TUoMy5DnTFP9XyizqKuELMdDu
         dJGd3mNmHVp+QQlOXHuC6jQrNLN4gnPhJynPkFIKNKgximfFCliuP29LqB67SXWWQtYR
         APCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733742802; x=1734347602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Ct/JMjbQ8KPD7Q1/iLi53oFvmwtgzXtgERN5uFTBeg=;
        b=Rwyi7q1eQG0hagiXwQh0nPuHm6AEy4nkTjDqHE1IvtA9dHvwq3bEfDCNhzT9yMgLB7
         UNmVZ094Kypt9Pot3vWKI4IyyqGDz0LCe5PTOsjM0KpEvy01spxIsrT/q1qmSIV/j7bj
         kBwr150IpfK2uEDlQudhoTHpbwZTmpl0lRH5RKYI+zuyDDOumtO/7KmCiCphFbsaWodB
         s3m4hoNux8nRiyvSgMI9zs7w32nrfhBTkdI4IT37LfXlnX7Q9z0YvOxidrtgAchJCkaB
         QncROWC0TkdSTUFpImCk8gupJDhxiRd7m3BhF4hnl+0FqobGIsSbKEzZt/6r+Mfz/+W/
         eNoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYxH0e3ACY1AODdi0dxt0Sf7jQ4oUvxBU2DYWJyRBRSOxy2Dj3Qhu8MxJw44i3HP/gvjNU9hpQI7s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcJMQ/4k5DGIqFK17gwh6IYQ5uVYo2LijckMlsmv8N22gbVhzb
	dTpj2aMMignh4TrCw/apJyyFg53kz8RggHZ66maoZ5fAclOvhxdP7VAvH9n/e30=
X-Gm-Gg: ASbGncsZ0hlkWULHLS++fCGcfx4m1vHIw3ZNyS5EUxq+Tacick2xjzvCENGeuhpo+LE
	HUWuNBjafHdpCVazMCUhKltaEQhjWFacwf1c2NmqYVPZFqLMOzhLf6+YCyfZFbL4tT7l27IRrUJ
	eKL8cfTbTNUQQOUyaoxXpQtYorbJj6LWIvGfTjC3LIiGh37Eny9BBx45Vuj9tZDdUlnjfAEiOh0
	7J1pCbTesWPV5GW7xYddhn8HAwvBojlrNGW15Onjrj2KKbqBvGPldT8+YxbRUyf
X-Google-Smtp-Source: AGHT+IEQgjewV3OsM96fNpQNQUugZ6P+UuZPbdEaPCJ/8H67Pf0XQjooRz9PIEYNOLsMHD5vkPP/QA==
X-Received: by 2002:a05:600c:2d49:b0:434:f335:85c with SMTP id 5b1f17b1804b1-434f3350dafmr13428085e9.6.1733742801558;
        Mon, 09 Dec 2024 03:13:21 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434fb9bf04esm19670445e9.26.2024.12.09.03.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 03:13:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] clk: qcom: Drop unused header includes
Date: Mon,  9 Dec 2024 12:13:14 +0100
Message-ID: <20241209111315.60776-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drivers should include only headers they use so drop:
1. of.h and of_address.h: When no OF call is used (of_device_id is
   coming from mod_devicetable.h).
2. clk.h, property.h and reset-controller.h: No calls to clock consumer
   or reset framework, no fwnode/property calls.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Drop sm8750
---
 drivers/clk/qcom/camcc-sa8775p.c      | 1 -
 drivers/clk/qcom/camcc-sc7180.c       | 1 -
 drivers/clk/qcom/camcc-sc7280.c       | 1 -
 drivers/clk/qcom/camcc-sm4450.c       | 1 -
 drivers/clk/qcom/camcc-sm7150.c       | 1 -
 drivers/clk/qcom/camcc-sm8150.c       | 1 -
 drivers/clk/qcom/camcc-sm8250.c       | 1 -
 drivers/clk/qcom/dispcc-qcm2290.c     | 1 -
 drivers/clk/qcom/dispcc-sc8280xp.c    | 2 --
 drivers/clk/qcom/dispcc-sdm845.c      | 1 -
 drivers/clk/qcom/dispcc-sm4450.c      | 1 -
 drivers/clk/qcom/dispcc-sm6115.c      | 1 -
 drivers/clk/qcom/dispcc-sm7150.c      | 1 -
 drivers/clk/qcom/dispcc-sm8250.c      | 1 -
 drivers/clk/qcom/dispcc-sm8450.c      | 2 --
 drivers/clk/qcom/dispcc-sm8550.c      | 2 --
 drivers/clk/qcom/dispcc0-sa8775p.c    | 1 -
 drivers/clk/qcom/dispcc1-sa8775p.c    | 1 -
 drivers/clk/qcom/gcc-msm8960.c        | 1 -
 drivers/clk/qcom/gcc-msm8974.c        | 1 -
 drivers/clk/qcom/gpucc-msm8998.c      | 2 --
 drivers/clk/qcom/gpucc-sdm660.c       | 4 +---
 drivers/clk/qcom/gpucc-sm4450.c       | 1 -
 drivers/clk/qcom/gpucc-sm8350.c       | 1 -
 drivers/clk/qcom/kpss-xcc.c           | 1 -
 drivers/clk/qcom/krait-cc.c           | 1 -
 drivers/clk/qcom/lpasscc-sdm845.c     | 1 -
 drivers/clk/qcom/lpasscorecc-sc7180.c | 1 -
 drivers/clk/qcom/lpasscorecc-sc7280.c | 1 -
 drivers/clk/qcom/mmcc-apq8084.c       | 1 -
 drivers/clk/qcom/mmcc-msm8960.c       | 3 ---
 drivers/clk/qcom/mmcc-msm8974.c       | 1 -
 drivers/clk/qcom/mmcc-msm8994.c       | 2 --
 drivers/clk/qcom/mmcc-msm8996.c       | 3 ---
 drivers/clk/qcom/mmcc-msm8998.c       | 2 --
 drivers/clk/qcom/mmcc-sdm660.c        | 5 -----
 36 files changed, 1 insertion(+), 52 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sa8775p.c b/drivers/clk/qcom/camcc-sa8775p.c
index c04801a5af35..1df86da41940 100644
--- a/drivers/clk/qcom/camcc-sa8775p.c
+++ b/drivers/clk/qcom/camcc-sa8775p.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/camcc-sc7180.c b/drivers/clk/qcom/camcc-sc7180.c
index 10e924cd533d..a69b70ab1a70 100644
--- a/drivers/clk/qcom/camcc-sc7180.c
+++ b/drivers/clk/qcom/camcc-sc7180.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_clock.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/clk/qcom/camcc-sc7280.c b/drivers/clk/qcom/camcc-sc7280.c
index accd257632df..5a9992a5b5ba 100644
--- a/drivers/clk/qcom/camcc-sc7280.c
+++ b/drivers/clk/qcom/camcc-sc7280.c
@@ -8,7 +8,6 @@
 #include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/camcc-sm4450.c b/drivers/clk/qcom/camcc-sm4450.c
index f8503ced3d05..e51590d89a3c 100644
--- a/drivers/clk/qcom/camcc-sm4450.c
+++ b/drivers/clk/qcom/camcc-sm4450.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/camcc-sm7150.c b/drivers/clk/qcom/camcc-sm7150.c
index 39033a6bb616..4a3baf5d8e85 100644
--- a/drivers/clk/qcom/camcc-sm7150.c
+++ b/drivers/clk/qcom/camcc-sm7150.c
@@ -7,7 +7,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/camcc-sm8150.c b/drivers/clk/qcom/camcc-sm8150.c
index bb3009818ad7..ed96dcb885b3 100644
--- a/drivers/clk/qcom/camcc-sm8150.c
+++ b/drivers/clk/qcom/camcc-sm8150.c
@@ -8,7 +8,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/of.h>
 #include <linux/regmap.h>
 #include <linux/pm_runtime.h>
 
diff --git a/drivers/clk/qcom/camcc-sm8250.c b/drivers/clk/qcom/camcc-sm8250.c
index 34d2f17520dc..dcbc6c354e5a 100644
--- a/drivers/clk/qcom/camcc-sm8250.c
+++ b/drivers/clk/qcom/camcc-sm8250.c
@@ -7,7 +7,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
 
 #include <dt-bindings/clock/qcom,camcc-sm8250.h>
 
diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index 449ffea2295d..bf0ff76e0745 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -7,7 +7,6 @@
 #include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/dispcc-sc8280xp.c b/drivers/clk/qcom/dispcc-sc8280xp.c
index f1ca9ae0b33f..0a810fc847ce 100644
--- a/drivers/clk/qcom/dispcc-sc8280xp.c
+++ b/drivers/clk/qcom/dispcc-sc8280xp.c
@@ -7,11 +7,9 @@
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/property.h>
 #include <linux/pm_clock.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
 
 #include <dt-bindings/clock/qcom,dispcc-sc8280xp.h>
 
diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
index e6139e8f74dc..94079c54333f 100644
--- a/drivers/clk/qcom/dispcc-sdm845.c
+++ b/drivers/clk/qcom/dispcc-sdm845.c
@@ -7,7 +7,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
 
 #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
 
diff --git a/drivers/clk/qcom/dispcc-sm4450.c b/drivers/clk/qcom/dispcc-sm4450.c
index 98ba016bc57f..465725f9bfeb 100644
--- a/drivers/clk/qcom/dispcc-sm4450.c
+++ b/drivers/clk/qcom/dispcc-sm4450.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/dispcc-sm6115.c b/drivers/clk/qcom/dispcc-sm6115.c
index 939887f82ecc..5790253e7d89 100644
--- a/drivers/clk/qcom/dispcc-sm6115.c
+++ b/drivers/clk/qcom/dispcc-sm6115.c
@@ -8,7 +8,6 @@
 #include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/dispcc-sm7150.c b/drivers/clk/qcom/dispcc-sm7150.c
index d32bd7df1433..bdfff246ed3f 100644
--- a/drivers/clk/qcom/dispcc-sm7150.c
+++ b/drivers/clk/qcom/dispcc-sm7150.c
@@ -8,7 +8,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index 884bbd3fb305..1f48e79acfac 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -8,7 +8,6 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
 
 #include <dt-bindings/clock/qcom,dispcc-sm8250.h>
 
diff --git a/drivers/clk/qcom/dispcc-sm8450.c b/drivers/clk/qcom/dispcc-sm8450.c
index a1f183e6c636..96987d8445cb 100644
--- a/drivers/clk/qcom/dispcc-sm8450.c
+++ b/drivers/clk/qcom/dispcc-sm8450.c
@@ -4,12 +4,10 @@
  * Copyright (c) 2022, Linaro Ltd.
  */
 
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-sm8550.c
index e41d4104d770..4c5feb96ae53 100644
--- a/drivers/clk/qcom/dispcc-sm8550.c
+++ b/drivers/clk/qcom/dispcc-sm8550.c
@@ -4,12 +4,10 @@
  * Copyright (c) 2023, Linaro Ltd.
  */
 
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/clk/qcom/dispcc0-sa8775p.c b/drivers/clk/qcom/dispcc0-sa8775p.c
index 6e399b5f1383..bf9de92a5dd2 100644
--- a/drivers/clk/qcom/dispcc0-sa8775p.c
+++ b/drivers/clk/qcom/dispcc0-sa8775p.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/dispcc1-sa8775p.c b/drivers/clk/qcom/dispcc1-sa8775p.c
index 30ccea59415a..cd2f2eb7ffb4 100644
--- a/drivers/clk/qcom/dispcc1-sa8775p.c
+++ b/drivers/clk/qcom/dispcc1-sa8775p.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/gcc-msm8960.c b/drivers/clk/qcom/gcc-msm8960.c
index 9ddce11db6df..c2e4fa5d63ad 100644
--- a/drivers/clk/qcom/gcc-msm8960.c
+++ b/drivers/clk/qcom/gcc-msm8960.c
@@ -7,7 +7,6 @@
 #include <linux/bitops.h>
 #include <linux/err.h>
 #include <linux/platform_device.h>
-#include <linux/property.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
diff --git a/drivers/clk/qcom/gcc-msm8974.c b/drivers/clk/qcom/gcc-msm8974.c
index b32e66714951..92ad35cfb75e 100644
--- a/drivers/clk/qcom/gcc-msm8974.c
+++ b/drivers/clk/qcom/gcc-msm8974.c
@@ -7,7 +7,6 @@
 #include <linux/bitops.h>
 #include <linux/err.h>
 #include <linux/platform_device.h>
-#include <linux/property.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/clk-provider.h>
diff --git a/drivers/clk/qcom/gpucc-msm8998.c b/drivers/clk/qcom/gpucc-msm8998.c
index 9efeab2691ba..066793e47f79 100644
--- a/drivers/clk/qcom/gpucc-msm8998.c
+++ b/drivers/clk/qcom/gpucc-msm8998.c
@@ -8,10 +8,8 @@
 #include <linux/err.h>
 #include <linux/platform_device.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
 
 #include <dt-bindings/clock/qcom,gpucc-msm8998.h>
 
diff --git a/drivers/clk/qcom/gpucc-sdm660.c b/drivers/clk/qcom/gpucc-sdm660.c
index 3ae1b80e38d9..6d37b3d8d1a4 100644
--- a/drivers/clk/qcom/gpucc-sdm660.c
+++ b/drivers/clk/qcom/gpucc-sdm660.c
@@ -6,15 +6,13 @@
  */
 
 #include <linux/bitops.h>
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/of.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
+
 #include <dt-bindings/clock/qcom,gpucc-sdm660.h>
 
 #include "clk-alpha-pll.h"
diff --git a/drivers/clk/qcom/gpucc-sm4450.c b/drivers/clk/qcom/gpucc-sm4450.c
index a14d0bb031ac..34c7ba0c7d55 100644
--- a/drivers/clk/qcom/gpucc-sm4450.c
+++ b/drivers/clk/qcom/gpucc-sm4450.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/gpucc-sm8350.c b/drivers/clk/qcom/gpucc-sm8350.c
index f3b6bdc24485..6d2660bdd825 100644
--- a/drivers/clk/qcom/gpucc-sm8350.c
+++ b/drivers/clk/qcom/gpucc-sm8350.c
@@ -9,7 +9,6 @@
 #include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/kpss-xcc.c b/drivers/clk/qcom/kpss-xcc.c
index e7cfa8d22044..97bfb21a5e5e 100644
--- a/drivers/clk/qcom/kpss-xcc.c
+++ b/drivers/clk/qcom/kpss-xcc.c
@@ -5,7 +5,6 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/property.h>
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/of.h>
diff --git a/drivers/clk/qcom/krait-cc.c b/drivers/clk/qcom/krait-cc.c
index ae325f4e1047..f29d6dd1f3ac 100644
--- a/drivers/clk/qcom/krait-cc.c
+++ b/drivers/clk/qcom/krait-cc.c
@@ -5,7 +5,6 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/property.h>
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/of.h>
diff --git a/drivers/clk/qcom/lpasscc-sdm845.c b/drivers/clk/qcom/lpasscc-sdm845.c
index 7040da952728..5c1ea75f9ba8 100644
--- a/drivers/clk/qcom/lpasscc-sdm845.c
+++ b/drivers/clk/qcom/lpasscc-sdm845.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/platform_device.h>
 #include <linux/module.h>
-#include <linux/of_address.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,lpass-sdm845.h>
diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
index 726c6378752f..605516d03993 100644
--- a/drivers/clk/qcom/lpasscorecc-sc7180.c
+++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
@@ -9,7 +9,6 @@
 #include <linux/platform_device.h>
 #include <linux/pm_clock.h>
 #include <linux/pm_runtime.h>
-#include <linux/of.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,lpasscorecc-sc7180.h>
diff --git a/drivers/clk/qcom/lpasscorecc-sc7280.c b/drivers/clk/qcom/lpasscorecc-sc7280.c
index b0888cd2460b..56882c202376 100644
--- a/drivers/clk/qcom/lpasscorecc-sc7280.c
+++ b/drivers/clk/qcom/lpasscorecc-sc7280.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_clock.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/clk/qcom/mmcc-apq8084.c b/drivers/clk/qcom/mmcc-apq8084.c
index cc03722596a4..3affa525b875 100644
--- a/drivers/clk/qcom/mmcc-apq8084.c
+++ b/drivers/clk/qcom/mmcc-apq8084.c
@@ -8,7 +8,6 @@
 #include <linux/platform_device.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
 
 #include <dt-bindings/clock/qcom,mmcc-apq8084.h>
 #include <dt-bindings/reset/qcom,mmcc-apq8084.h>
diff --git a/drivers/clk/qcom/mmcc-msm8960.c b/drivers/clk/qcom/mmcc-msm8960.c
index 3f41249c5ae4..c0adb2b86718 100644
--- a/drivers/clk/qcom/mmcc-msm8960.c
+++ b/drivers/clk/qcom/mmcc-msm8960.c
@@ -8,13 +8,10 @@
 #include <linux/err.h>
 #include <linux/delay.h>
 #include <linux/platform_device.h>
-#include <linux/property.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
 
 #include <dt-bindings/clock/qcom,mmcc-msm8960.h>
 #include <dt-bindings/reset/qcom,mmcc-msm8960.h>
diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
index 169e85f60550..f2e802cf6afc 100644
--- a/drivers/clk/qcom/mmcc-msm8974.c
+++ b/drivers/clk/qcom/mmcc-msm8974.c
@@ -11,7 +11,6 @@
 #include <linux/of.h>
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
 
 #include <dt-bindings/clock/qcom,mmcc-msm8974.h>
 #include <dt-bindings/reset/qcom,mmcc-msm8974.h>
diff --git a/drivers/clk/qcom/mmcc-msm8994.c b/drivers/clk/qcom/mmcc-msm8994.c
index f70d080bf51c..0a273630e852 100644
--- a/drivers/clk/qcom/mmcc-msm8994.c
+++ b/drivers/clk/qcom/mmcc-msm8994.c
@@ -11,8 +11,6 @@
 #include <linux/of.h>
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
-#include <linux/clk.h>
 
 #include <dt-bindings/clock/qcom,mmcc-msm8994.h>
 
diff --git a/drivers/clk/qcom/mmcc-msm8996.c b/drivers/clk/qcom/mmcc-msm8996.c
index a742f848e4ee..3426e3dde924 100644
--- a/drivers/clk/qcom/mmcc-msm8996.c
+++ b/drivers/clk/qcom/mmcc-msm8996.c
@@ -8,11 +8,8 @@
 #include <linux/err.h>
 #include <linux/platform_device.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
-#include <linux/clk.h>
 
 #include <dt-bindings/clock/qcom,mmcc-msm8996.h>
 
diff --git a/drivers/clk/qcom/mmcc-msm8998.c b/drivers/clk/qcom/mmcc-msm8998.c
index 5738445a8656..5c37be700fa7 100644
--- a/drivers/clk/qcom/mmcc-msm8998.c
+++ b/drivers/clk/qcom/mmcc-msm8998.c
@@ -8,10 +8,8 @@
 #include <linux/err.h>
 #include <linux/platform_device.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
 
 #include <dt-bindings/clock/qcom,mmcc-msm8998.h>
 
diff --git a/drivers/clk/qcom/mmcc-sdm660.c b/drivers/clk/qcom/mmcc-sdm660.c
index 98ba5b4518fb..b3beeabe39ed 100644
--- a/drivers/clk/qcom/mmcc-sdm660.c
+++ b/drivers/clk/qcom/mmcc-sdm660.c
@@ -9,14 +9,9 @@
 #include <linux/bitops.h>
 #include <linux/err.h>
 #include <linux/platform_device.h>
-#include <linux/property.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
-#include <linux/reset-controller.h>
-#include <linux/clk.h>
-
 
 #include <dt-bindings/clock/qcom,mmcc-sdm660.h>
 
-- 
2.43.0


