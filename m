Return-Path: <linux-clk+bounces-2160-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31946826E71
	for <lists+linux-clk@lfdr.de>; Mon,  8 Jan 2024 13:40:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 118301C21A4D
	for <lists+linux-clk@lfdr.de>; Mon,  8 Jan 2024 12:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C17053E10;
	Mon,  8 Jan 2024 12:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R8zcL/6l"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151B353E38
	for <linux-clk@vger.kernel.org>; Mon,  8 Jan 2024 12:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a28cc85e6b5so183705166b.1
        for <linux-clk@vger.kernel.org>; Mon, 08 Jan 2024 04:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704717170; x=1705321970; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=htl20WivVJFeJAmwM5KBpciVYSbljcJAemXWAsEgyN4=;
        b=R8zcL/6lzyjaQYwEBD7zWnhnUffj9o2lP8II2DVFe/pEGeSl2p1/BWMT73+RdQwcT8
         gaxhsZyc5C1BONXnwP4xp3ktAWBx49AZdWrcUre+GedzjWB9SbVFvS+g2WFLgtcInupl
         RIqTa/ckRFv8huV2QEACmr6w89vif2LwG/JuPzkn1mfknAOkZb5rpRg9wM0+A5PSk3gH
         b5JatJwzlj+RY24oLrNBRYjMg/AItpGUAiDuSxA9QSSXvGBXAg2LQrZBdnMmAmdGewjU
         zfw2KIXOLFdS55/3CVNPduXibVRlaJv4x+ZlzQzYZ7gUDjFgkwzc7BeI4JhmHclH2T2T
         6TDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704717170; x=1705321970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=htl20WivVJFeJAmwM5KBpciVYSbljcJAemXWAsEgyN4=;
        b=lq364qxD0L3kvUdFU2GRm9sfBAr+wbzzFvi0i+DolGhfOQl0K+BkLmU6LTKOOSYMmZ
         CUQUrJSwVBt4UXqBHp9n86JlCnYBiV/ZiXethGXGW213bmhzNsLN6on1Rje5L5U7iMFU
         4fY/DLpxt1ubO5/pjc+Q8KreDlTJq19MaFm3HrpHC2MBHfdw34/n/Pp1S2NxIxl3w01C
         032zmxi1skdkt798xdYTz9lojKKj8lIciWZH9VlUdUBUVJpocdTn+LD4CfLDCeu09E78
         ArBPoNVWABfSP6VKB9XDtiRXKnmSlbxdqu6u51L2HRBk/6+fwK9ikUosEhQCUektBu0U
         n+Gg==
X-Gm-Message-State: AOJu0YxLRgWgoiHth/ljJGp6giukqMCgwBRPET4pkSfykZGDEyF1qZgb
	ZRSySGvHGV+eCfAGHsxbanF7QOZsnPPHSg==
X-Google-Smtp-Source: AGHT+IH1Nkbe490loNErkKcMLuLGIIzHVPrW/EFa27LhxdkAZqexQsdBZiVpSL3IdAwXlOR/UvKSNQ==
X-Received: by 2002:a17:906:a41a:b0:a26:9876:ae88 with SMTP id l26-20020a170906a41a00b00a269876ae88mr1024074ejz.73.1704717170374;
        Mon, 08 Jan 2024 04:32:50 -0800 (PST)
Received: from [10.167.154.1] (178235179081.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.81])
        by smtp.gmail.com with ESMTPSA id bs18-20020a170906d1d200b00a2808ee8ab1sm3892978ejb.150.2024.01.08.04.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 04:32:50 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 08 Jan 2024 13:32:28 +0100
Subject: [PATCH 11/18] clk: qcom: gcc-sm8450: Set delay for Venus CLK
 resets
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240105-topic-venus_reset-v1-11-981c7a624855@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704717148; l=943;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=U2C43YGEbbHUs3MA9UmdBCau40b0NyWHab0tGfzoC9s=;
 b=A0rKhsuGQQOZcx5LAU4J/wUenj8yoazvEda15d0QtsVG79rG6nzGGVk/I/qtfYpoN5kkA9f3K
 dZHoWC06ChrBZUjUkiweRsC3GELH3oRNazgR5apzZLciYG8MmCclcbl
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Some Venus resets may require more time when toggling. Describe that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gcc-sm8450.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index 563542982551..1825b3456dd0 100644
--- a/drivers/clk/qcom/gcc-sm8450.c
+++ b/drivers/clk/qcom/gcc-sm8450.c
@@ -3202,8 +3202,8 @@ static const struct qcom_reset_map gcc_sm8450_resets[] = {
 	[GCC_USB3PHY_PHY_PRIM_BCR] = { 0x60004 },
 	[GCC_USB3PHY_PHY_SEC_BCR] = { 0x60010 },
 	[GCC_USB_PHY_CFG_AHB2PHY_BCR] = { 0x7a000 },
-	[GCC_VIDEO_AXI0_CLK_ARES] = { 0x42018, 2 },
-	[GCC_VIDEO_AXI1_CLK_ARES] = { 0x42020, 2 },
+	[GCC_VIDEO_AXI0_CLK_ARES] = { .reg = 0x42018, .bit = 2, .udelay = 1000 },
+	[GCC_VIDEO_AXI1_CLK_ARES] = { .reg = 0x42020, .bit = 2, .udelay = 1000 },
 	[GCC_VIDEO_BCR] = { 0x42000 },
 };
 

-- 
2.43.0


