Return-Path: <linux-clk+bounces-2159-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB79826E6E
	for <lists+linux-clk@lfdr.de>; Mon,  8 Jan 2024 13:40:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02952B22ABD
	for <lists+linux-clk@lfdr.de>; Mon,  8 Jan 2024 12:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC2B54662;
	Mon,  8 Jan 2024 12:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fLBEcKd7"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2294E53E0E
	for <linux-clk@vger.kernel.org>; Mon,  8 Jan 2024 12:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a28e31563ebso172617366b.2
        for <linux-clk@vger.kernel.org>; Mon, 08 Jan 2024 04:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704717168; x=1705321968; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5z5yUvqcicNviZoQ1keoobP6j7WXXaRy5LaqfnUo/lw=;
        b=fLBEcKd7Fq7C0IKeAxplyYrLyzgPj2NU+MTyaWm/02rMr4HWV9EfvzkQ5QqzsljemL
         PHm5psUcByiWJ5rUbFgtrDUf9OwXDzuFIlBdTZtdsVfur+wB585qDMoe1MXcBWIdLPNa
         QkiCszoWq+go6CeiGLUIGOfJEk8DasnuifTca+EfsD+xiBdGP13NxuBqSVXmteMIlV31
         SzROCM3OrGQ7l7jHGSYP+xsMphc315li9qhp9QjQeXtI5C2lkrKFDUQWgGB1Rr7tAp1E
         mDIE6+LDjcxAF4cmzN7ty3qCcHsPZPzv6hbS5s+3Z3XJxz49/KFbfaSKG9e8qH7H9Vwf
         BFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704717168; x=1705321968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5z5yUvqcicNviZoQ1keoobP6j7WXXaRy5LaqfnUo/lw=;
        b=ZanGuPONkK++VA3yhH4eccg9L8G7XuN/90YXDr0y8xK5I7tTQb86EHVcIGejXFcjI9
         ocojJ39d82N1j7PAkgtOXtyBK/H75HjsyHJmToy3cai7oojISlA6jyY/ovPKRXnd5ump
         U0BV+M+uP31MqpNa1VHDLPjkcyozJ7tZr1xYYeX0h/TEDVpX0t6bsqAt7iF5cl/fDI6z
         Gmj42bi+8ZVYy5vQV5Ebao4i8KEfY2mNMBLjpxz70kHRLaxbKuaULRMohPV04SvQy5K0
         OuA3tDvGGkoxn78bp+yAWDcCfVJX59iSbjNjyeDJEUn1sEW6WyI/0EutT71DTXCD+JWb
         Hriw==
X-Gm-Message-State: AOJu0YygVR5hHtfKH2XMvscJMfNq/K84lWUooqDf9Dw6dF1+qF4YBJGo
	ESDnuui8/HTciH8xJkm8P3OA/GtDeBEqDQ==
X-Google-Smtp-Source: AGHT+IGqGzfdWQ3/JX7GDAKAVjEGLM9iF1MJEeYZ4anKHrA1z+inEBSsZBDL39DIgJUMlRq0y1HVrg==
X-Received: by 2002:a17:906:51c2:b0:a28:fb5:4389 with SMTP id v2-20020a17090651c200b00a280fb54389mr1477784ejk.0.1704717168568;
        Mon, 08 Jan 2024 04:32:48 -0800 (PST)
Received: from [10.167.154.1] (178235179081.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.81])
        by smtp.gmail.com with ESMTPSA id bs18-20020a170906d1d200b00a2808ee8ab1sm3892978ejb.150.2024.01.08.04.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 04:32:48 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 08 Jan 2024 13:32:27 +0100
Subject: [PATCH 10/18] clk: qcom: gcc-sm8350: Set delay for Venus CLK
 resets
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240105-topic-venus_reset-v1-10-981c7a624855@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704717148; l=941;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=OLPxtvXqfSyhCTWcq+01XHn2DaYTX7g8uZCGKb6FcxQ=;
 b=6TL92acn8ty2HTUqvb61CLEe8msKXhlTDJUT1kf+Uz4x2+Im+mdbxiGKI++huH/CS3MYX3Wvw
 wKdKTkNJxbaCXwScNGqE9rqj1mJ0hVcWk005hsHdGlFe1lS/+kAP2Ku
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Some Venus resets may require more time when toggling. Describe that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gcc-sm8350.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8350.c b/drivers/clk/qcom/gcc-sm8350.c
index 1385a98eb3bb..df4842588a24 100644
--- a/drivers/clk/qcom/gcc-sm8350.c
+++ b/drivers/clk/qcom/gcc-sm8350.c
@@ -3743,8 +3743,8 @@ static const struct qcom_reset_map gcc_sm8350_resets[] = {
 	[GCC_USB3PHY_PHY_PRIM_BCR] = { 0x50004 },
 	[GCC_USB3PHY_PHY_SEC_BCR] = { 0x50010 },
 	[GCC_USB_PHY_CFG_AHB2PHY_BCR] = { 0x6a000 },
-	[GCC_VIDEO_AXI0_CLK_ARES] = { 0x28010, 2 },
-	[GCC_VIDEO_AXI1_CLK_ARES] = { 0x28018, 2 },
+	[GCC_VIDEO_AXI0_CLK_ARES] = { .reg = 0x28010, .bit = 2, .udelay = 400 },
+	[GCC_VIDEO_AXI1_CLK_ARES] = { .reg = 0x28018, .bit = 2, .udelay = 400 },
 	[GCC_VIDEO_BCR] = { 0x28000 },
 };
 

-- 
2.43.0


