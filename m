Return-Path: <linux-clk+bounces-2162-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0EC826E78
	for <lists+linux-clk@lfdr.de>; Mon,  8 Jan 2024 13:41:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A04351F22738
	for <lists+linux-clk@lfdr.de>; Mon,  8 Jan 2024 12:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ABEF54F8D;
	Mon,  8 Jan 2024 12:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n6AE8bUR"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B9D54BF2
	for <linux-clk@vger.kernel.org>; Mon,  8 Jan 2024 12:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a27733ae1dfso185516166b.3
        for <linux-clk@vger.kernel.org>; Mon, 08 Jan 2024 04:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704717174; x=1705321974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O2jFsk8miEcGzRv0SVas60MpuNUWFzdzdQXxQ+W+fTI=;
        b=n6AE8bURieBlyr6+kAOYhpIhlhCJqx1tV4EUIAl9CaXQ6UrgNJtGz+T7t+9I2BVKos
         yfrb0Ak3+8wKlHt5KjmxCQXSQmYOdAU0HPEW/i1nwqMEZb4jFiZx1GR2LW1bMAw0BIQw
         MWdOFiAmu9B9oNFGrlcJ8my2M0V712AjJr0EK2yTYQk2AJWJLKhO3kXCs2PukeEEtBPL
         r+a4at7aK4n5+GCBVLsXjYGXtE/Pfq1HS3O26bygIvdfSDMPwDBJZExQPEdQp/1MGxpI
         +f2qlD3tfKvmQ4qfOnMdo5F/Vw4F06bI8Q2kin77K96j9ymLLNS36lOgrHdrzd777HPK
         G9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704717174; x=1705321974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O2jFsk8miEcGzRv0SVas60MpuNUWFzdzdQXxQ+W+fTI=;
        b=YD2hyHb/3+zSnEs5xZc0fqtNs1WZw9Tfrqiyyr6YuknKYnJFnBdFAqdWnWBIHiv8fP
         5anYxkcX/4WZ4ZP6469wtVVVMoYGqT2hnkP8ECplVtVt5mXPDovEFTCE+V2YylnLn1jz
         8hR8nv/WkVHB5z9ocUd342djJr6pMogZbZn7yzgEntl0AtIp088P0KzKhHkOqP0n0xs/
         w4drVip+ouIv/0Slq3TNOecTQ47uyVoZxhk1AosGj9nuzKb0Cwc6B9LRIWWOkfl1pFoB
         GD3nLSiY+ERutX5w/T3kHdtzNLZTij1iGOAxqI0rPlm8wQ6z4ZqX47WlyITd4hFiNHfv
         PuxA==
X-Gm-Message-State: AOJu0Yzt9p/0quOET+PZFWUAH9oDzYMyNRoihedVgH7EH3qhHZHMmEWx
	QaNgu8Nf7ielvgAo09dlq3p/YqNrRaYz3A==
X-Google-Smtp-Source: AGHT+IGcQH9xoEAu7sZbSriC9jHFmL7RYQiWdAFtYC1g4lR9e97Pu2N03qLLo+MfvHxzCvLJSApCYw==
X-Received: by 2002:a17:907:9444:b0:a28:9d0b:e5b7 with SMTP id dl4-20020a170907944400b00a289d0be5b7mr968685ejc.128.1704717173869;
        Mon, 08 Jan 2024 04:32:53 -0800 (PST)
Received: from [10.167.154.1] (178235179081.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.81])
        by smtp.gmail.com with ESMTPSA id bs18-20020a170906d1d200b00a2808ee8ab1sm3892978ejb.150.2024.01.08.04.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 04:32:53 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 08 Jan 2024 13:32:30 +0100
Subject: [PATCH 13/18] clk: qcom: gcc-sm8650: Set delay for Venus CLK
 resets
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240105-topic-venus_reset-v1-13-981c7a624855@linaro.org>
References: <20240105-topic-venus_reset-v1-0-981c7a624855@linaro.org>
In-Reply-To: <20240105-topic-venus_reset-v1-0-981c7a624855@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704717148; l=936;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=dafvtEWyd3ePEI1J3OalDI7TTuNFzH14q4snLe82PJg=;
 b=NI87ryvzv//26vUgahL2fypxMM744QQUuJQUfZUCGcZmzgWGN6CDcXr3QEvKfQuvcpUunnYTc
 4Mv3h4PQDSCDfaHI/kaVMhPgTpKgl/5gErEXGmuFmOHKNBB5GBu05K6
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Some Venus resets may require more time when toggling. Describe that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gcc-sm8650.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8650.c b/drivers/clk/qcom/gcc-sm8650.c
index 9174dd82308c..63becb03cd90 100644
--- a/drivers/clk/qcom/gcc-sm8650.c
+++ b/drivers/clk/qcom/gcc-sm8650.c
@@ -3734,8 +3734,8 @@ static const struct qcom_reset_map gcc_sm8650_resets[] = {
 	[GCC_USB3_PHY_SEC_BCR] = { 0x5000c },
 	[GCC_USB3PHY_PHY_PRIM_BCR] = { 0x50004 },
 	[GCC_USB3PHY_PHY_SEC_BCR] = { 0x50010 },
-	[GCC_VIDEO_AXI0_CLK_ARES] = { 0x32018, 2 },
-	[GCC_VIDEO_AXI1_CLK_ARES] = { 0x32024, 2 },
+	[GCC_VIDEO_AXI0_CLK_ARES] = { .reg = 0x32018, .bit = 2, .udelay = 1000 },
+	[GCC_VIDEO_AXI1_CLK_ARES] = { .reg = 0x32024, .bit = 2, .udelay = 1000 },
 	[GCC_VIDEO_BCR] = { 0x32000 },
 };
 

-- 
2.43.0


