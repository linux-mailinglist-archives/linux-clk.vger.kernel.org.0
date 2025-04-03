Return-Path: <linux-clk+bounces-20101-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FDCA79F45
	for <lists+linux-clk@lfdr.de>; Thu,  3 Apr 2025 11:02:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34EA217584A
	for <lists+linux-clk@lfdr.de>; Thu,  3 Apr 2025 09:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED9E2244195;
	Thu,  3 Apr 2025 08:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="URzP2DcC"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5B32459C0
	for <linux-clk@vger.kernel.org>; Thu,  3 Apr 2025 08:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670761; cv=none; b=oV5bO7/i4w44s6bG7Xpu5vKqLz/Zds2eImtT5p29s+lCaa+womI/G4BkHiTN+yWfy8oNsaSaAdkoG1v2TyKyz3zI4Z0hpqV/cQ92fwj7coQli4tMr18pcHiO5jx+pkIT1AxPfvyaZW+2p5+8UNRinDI+4U4o5xUi6suRmOfFR5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670761; c=relaxed/simple;
	bh=X0QQTgyZyBPIURJ3v2tympUyOwlqSVYuYyMtIMSpfpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ProD90I7RwIyAWq/C2GF1jf2ZA6chX4Qmz1tyZmIpDPhYqvJ60/MsaQcjI9S2glGCtQv8153/MEFBFdAU/zTNfMqPf4FhfmGE91p8E86UMbxaiYzH53Jls9oc9RsWE+u/l9jI1ajkPbis4P+1/mNkVlFGjQAMLPmLJXuL54u/cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=URzP2DcC; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac2dfdf3c38so119349366b.3
        for <linux-clk@vger.kernel.org>; Thu, 03 Apr 2025 01:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670753; x=1744275553; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kV75c5wurwfdiB4LfjbAT+jBLqgbz3xs0SfJTGIePwA=;
        b=URzP2DcCIIAiVaxYYoMP73MU7SEV97+smhklH5zWxCElfDYlenJFBlbTeXnyL8euh9
         yojM2ojq8gpYSFUyO2o2EhhfuWdSdqE6duPdeILAc6qZkUMbuqsv9XxgL6bSEzE+mK/E
         EtiCau9LX0kSw5SH1+t27TYBgm6G4/KfA0GmLOdOjst66COPikk+kVdmsVqbe8w56XwL
         BwIa8v3iuxg3ViEGY1horI+IRPXbyVb1QEIeUvyTu133yDODP3FjYSed/DTCOBw0Qcdq
         bMNZ/3xs8eqL/QQJHld6leDsJAG29QtCUVMndeGfgnxz1KwMzppjXf+8PoXaPWKvrDaJ
         wfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670753; x=1744275553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kV75c5wurwfdiB4LfjbAT+jBLqgbz3xs0SfJTGIePwA=;
        b=VYGv8Fd7SdUxWCfKKgAjPXxbnZ1mHD6rGLtV1bTJeH3ADqM9OmqI+/HYJe+yiYP0/B
         /rLZbB3o1LPwxCgUZjHZBj+lvOcBHFaDxr6mUqQclHWwFqAwg7i03KUby0U7eo4gs5mB
         8dO4U9cVOEE4oR9ID5UpVskitPsh8fHEEWjqOeQztuB26m/lqCt6lgLRVKgEc6FitgzS
         HC6qDqicGi1wtBXuoYoxgAhkZzttnjsZIDR0QgLja1VzSu8pz0cmDiqZiCyKvRbjQgHe
         Th6VYFTXkOeWYzYLIk2Fuq2E3UcVPC3A9rGj4B3zQPKEnkzgi+2D+GTq1zIDXepRTQ5a
         fIzg==
X-Forwarded-Encrypted: i=1; AJvYcCUz+xLBc8bD92e+ll2UFgAsDPtW969um4Q1vKMSXMi1/YhFbFBQGkVOX+fQfAC0pHdt6CBGsQaPH8c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzItpLIgy5YIYudMxAqUThN0jdQkRxakScWteZIjATIDwIB+nyl
	bXXADFu+Hl+roMbXBAvyWNQJavObV2zxO9sB9UG/WxrVFPDqTJ87bBfRQ2aCOkM=
X-Gm-Gg: ASbGnctngROL3+qpBRHjQvZIkXtWGT2+QsltFIKF4blTgDt5a3gHMljtCtIiDZt7mi3
	fQpJCaqQfNPe+OHtAIMQpi4XfJL4m8bW8GdP435OV1np3O/tstXuP8J9TKEmpe49VBcB+h1w77+
	d6m0/OKE0+pjOCUvX0x3x9HztZA9kLMjrRtUOc5bOP79VAnXronKt9cAo60hFlB8okd7uWT9wpr
	R08s3aohjVxZhPmQhC9Tddr+3Pva9UvygU3vWI9+KClbDV9m3wOcGUkzblEzEg31iLEmGZX0f6Q
	ZngyD75tf7FVPorYKz7TWNhFXLOR2vmqsfFTbR/BF3+D1UrmeE4c8t+QHqDf3gRWp21jSEJaAtc
	6sJ8GUUVfvQvG8tF4S+nh9e9e6BbN
X-Google-Smtp-Source: AGHT+IGcX+tYkvLIpCQDt/tVecCK/2rtCpUV2gBjKE/E/xLa7G15uMrlM8X/q+3JmlSAkeK9HlD3fA==
X-Received: by 2002:a17:907:9692:b0:ac3:49f0:4d10 with SMTP id a640c23a62f3a-ac7bc259458mr148490166b.38.1743670752608;
        Thu, 03 Apr 2025 01:59:12 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:12 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:12 +0100
Subject: [PATCH v3 20/32] mfd: sec: use sizeof(*var), not sizeof(struct
 type_of_var)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-20-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
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

Using sizeof(*var) is generally preferred over using the size of its
open-coded type when allocating memory.

This helps avoiding bugs when the variable type changes but the memory
allocation isn't updated, and it simplifies renaming of the struct if
ever necessary.

No functional change.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 55edeb0f73ff4643f23b9759b115658d3bf03e9a..e8e35f7d5f06b522a953e8f21603e6904401c983 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -163,7 +163,7 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 	struct sec_pmic_dev *sec_pmic;
 	int ret, num_sec_devs;
 
-	sec_pmic = devm_kzalloc(dev, sizeof(struct sec_pmic_dev), GFP_KERNEL);
+	sec_pmic = devm_kzalloc(dev, sizeof(*sec_pmic), GFP_KERNEL);
 	if (!sec_pmic)
 		return -ENOMEM;
 

-- 
2.49.0.472.ge94155a9ec-goog


