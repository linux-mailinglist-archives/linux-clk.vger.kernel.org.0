Return-Path: <linux-clk+bounces-2157-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED6B826E64
	for <lists+linux-clk@lfdr.de>; Mon,  8 Jan 2024 13:40:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AD5C1F22D22
	for <lists+linux-clk@lfdr.de>; Mon,  8 Jan 2024 12:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08B4053E20;
	Mon,  8 Jan 2024 12:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wI77nr0f"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB1653E16
	for <linux-clk@vger.kernel.org>; Mon,  8 Jan 2024 12:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50e7e55c0f6so1592636e87.0
        for <linux-clk@vger.kernel.org>; Mon, 08 Jan 2024 04:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704717165; x=1705321965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jNQmxSUZglVo4SGjDZ7CSwXshCAzDjDtd35drvc52JQ=;
        b=wI77nr0fG/M46zeUKqMY1KCm8rmuT4OmbGZZI9NALFWkY0PZ0A8eg4Ua6SOrb2rVKq
         bjNv2FpCoLozb1fetGQSyKKdPO5LDW/0LC6xuy83x/aPrZnOrpdn3XRGwaiWBX/FBsnm
         J1wt6q2En+uEk+eoymmtAHHfj+eb37r85+ZJL3c7XqqR77omFNqiL4xw1Wdnr7Qcrkgz
         GwrWMoEIvXaeIV43pvL8oPCicFlqqXOGUao0LUxYNuieVLaWL25LNsjJx/m6CmYY+eXS
         ksbb1nLdiWUlfcG5HNY4b/CHYUrUD34yHQ8O5RIpktPZkRKBQwykCwJO5tye4kr82quF
         DnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704717165; x=1705321965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jNQmxSUZglVo4SGjDZ7CSwXshCAzDjDtd35drvc52JQ=;
        b=i0CvxZvIqOobGKo2RcFNHCBI8rRZnPYXfV4LtpzOqJY/gy4XF+fYfwFCGOPQx7Uy+s
         BdR6GvFP6LADSl25S2VqfosmQRKBKN7V4+o1zmefS5sDezJcHPC1f9J0BTT2UVof5Osk
         McYrvGVg+p9FXfnz1rcM5zImCsT8rWmcihvegFx0XoP13pt0m9yeOlITLctMv9TlYxuk
         LAxDDKdzzAOU5/KYeTZxbXaehmVQLhJQZsGmE3bHxU79iF9pNCthLhwLToaNjLJ/TSvJ
         MEpphp+hS5hCrlUq68k8hfPaTKCNPkKjBDJTziH+ZNo0Ga/R1XMnaWfj/+NCC8x4R/YX
         V/YA==
X-Gm-Message-State: AOJu0Yzk/QWExRScNM58eyDH7pPSlP4uCMAAZF3ytFfsyGiuD6E23PKQ
	PKlximw2lY3qZvI9y8pR909ylblxTLIVNA==
X-Google-Smtp-Source: AGHT+IFdpDAQtaMEVjE/cifi9CN3gpfw/kUYZi+wYtaBMWuteDwgHdJqFrtlaDmRXq0zczXQ0CpnPg==
X-Received: by 2002:ac2:58e4:0:b0:50e:62b7:153b with SMTP id v4-20020ac258e4000000b0050e62b7153bmr654345lfo.184.1704717165011;
        Mon, 08 Jan 2024 04:32:45 -0800 (PST)
Received: from [10.167.154.1] (178235179081.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.81])
        by smtp.gmail.com with ESMTPSA id bs18-20020a170906d1d200b00a2808ee8ab1sm3892978ejb.150.2024.01.08.04.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 04:32:44 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 08 Jan 2024 13:32:25 +0100
Subject: [PATCH 08/18] clk: qcom: gcc-sm7150: Set delay for Venus CLK
 resets
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240105-topic-venus_reset-v1-8-981c7a624855@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704717148; l=827;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=SneXieVlJPscW7pjYlUwK7ABSP0X3okszmbJYTG0dt0=;
 b=eaRYkxYRjkbNuCEQzJUl2KGLBnwFikuQ+kTndvPt1ihUlqeYTs6qwdLG9QV2IvrDzqz9pYK34
 tN2D+vF6ovjC3xSMoXGUr24x7nRRf36hu06P4J04CMVqVGP2glA/1OY
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Some Venus resets may require more time when toggling. Describe that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gcc-sm7150.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-sm7150.c b/drivers/clk/qcom/gcc-sm7150.c
index d9983bb27475..7c5596331c30 100644
--- a/drivers/clk/qcom/gcc-sm7150.c
+++ b/drivers/clk/qcom/gcc-sm7150.c
@@ -2918,7 +2918,7 @@ static const struct qcom_reset_map gcc_sm7150_resets[] = {
 	[GCC_USB3_PHY_PRIM_BCR] = { 0x50000 },
 	[GCC_USB3_PHY_SEC_BCR] = { 0x5000c },
 	[GCC_QUSB2PHY_PRIM_BCR] = { 0x26000 },
-	[GCC_VIDEO_AXI_CLK_BCR] = { 0xb01c, 2 },
+	[GCC_VIDEO_AXI_CLK_BCR] = { .reg = 0xb01c, .bit = 2, .udelay = 150 },
 };
 
 static const struct clk_rcg_dfs_data gcc_sm7150_dfs_desc[] = {

-- 
2.43.0


