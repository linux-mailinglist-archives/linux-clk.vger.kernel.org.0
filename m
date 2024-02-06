Return-Path: <linux-clk+bounces-3356-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A47584BD22
	for <lists+linux-clk@lfdr.de>; Tue,  6 Feb 2024 19:44:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFF4F28B755
	for <lists+linux-clk@lfdr.de>; Tue,  6 Feb 2024 18:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 894BDDF59;
	Tue,  6 Feb 2024 18:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kr6FWYwV"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA59314F64
	for <linux-clk@vger.kernel.org>; Tue,  6 Feb 2024 18:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707245029; cv=none; b=eCgm0Ctsl0Lkqc03/uiNboF7iT0Ejh1jpWiNBzJvLv54teq+lJi0w113t7DOLC6TwIFNTJbAOTPWn3X6Aoq8u8kKQMIsxvTXt0P0zM/z5vcfyZsrXIOqsheTMegZFKqZyFMd226onLYl+TU0VuajeAurKYjx4idIrpQDWrNlWG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707245029; c=relaxed/simple;
	bh=xI8Pz/GiLYIx99t2tjsSwt/3C03sZIdZzmRztviEUeI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wd+YXCCi/XDjN41DP7C4uLAXvcxPiz3N1PYpPUqsClhSXduVE2b+cWLNJl1kdRtl/EXsZLa2ACO6TzRDdd+Fb41Hjv2oj0FLE2KwlPrEcRtjnut2SWzw5Q1vn2IbRRKr6DctQt9WRApxwnLQ8hrfUcajYaYyZOac0ah2Z8peKq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kr6FWYwV; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a38291dbe65so104886966b.3
        for <linux-clk@vger.kernel.org>; Tue, 06 Feb 2024 10:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707245026; x=1707849826; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dAa8E9ANX6Nu3efVaQVeq8bdKbITl5R3NB9pzT3L0B4=;
        b=Kr6FWYwVs5sqK4a8s7pXdKeguyAmPS1LoroSGHC2SQFsBhV0Tg+npVlcyb8uzS6b/I
         pvBWfjzZ4lHKTn4ATbTg8PVOq2UM2ghEqSnnNNmjoOC6BJbPN5iFfFR6ud7RQzmgHZ3E
         IU32uSYfT8Nds81/7JPeGdvpbgwPUHoAU66Wgb4YWr7BCUyJkKNsXOKvB9tqSW16+JgW
         i+41m775RFu8JDs8Hex6i17872QSGaExNbcGvNIhMxKQgSQ74CG4KKHy5OHLCd7ACJdS
         v9C9rslISjyEwHV5F031J5OU3aJwZ9d5RNz6wAjgRGISYZ0zTSzBlRebdzpjkOl1+mUy
         DhUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707245026; x=1707849826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dAa8E9ANX6Nu3efVaQVeq8bdKbITl5R3NB9pzT3L0B4=;
        b=nfS3LmiR51ly3aavVvXHie/rxOdC66noeJoJqIgE0MRCxDZt/cGCDiL+TqI5bDHlhG
         sNrXztoMBqRA1QGhhYV0QrpaE+RmjfUvKsl22Hjv44V5DIaP4/T5PXXHHhNFVRyRz5Ai
         mhg5b6k1zN8YhKGBgQka3JgTeMfmfqHDh81ftyT9lL0oKm/KZkd0r+Q2H1SHZpuDfaG5
         SK7T/oO/Y3EXiRYIEPVTsCo0SvuiOUyuzKIQP0U26ulh6/89PCOe2xIdMn0Drt5+YdvN
         XsOJ2Xrd+6smBjf+oqvHkJ4t2WE6JfkfRokRHRLYwK8lNt+cQE0x0JO/XL4ZU+kvKjBk
         cV4w==
X-Gm-Message-State: AOJu0Yz1GPHpQK5L7HIcvafdQfg9COCStQhBr8O+WwhMdmuuJDk1waok
	NT3H8AAdXZnISgj3WoEBS0jAtfBKzF2ULyhnJMLSFZ72KteYw37rOKbj743/Qcw=
X-Google-Smtp-Source: AGHT+IHFPjKbAz5P4i4tT0GMpAj5TQXxO8zp22PMieudmKvyJB0rPn0WlcyQcFE0y30rsoOB57vrCg==
X-Received: by 2002:a17:906:5a49:b0:a37:78f1:1302 with SMTP id my9-20020a1709065a4900b00a3778f11302mr2015332ejc.70.1707245026190;
        Tue, 06 Feb 2024 10:43:46 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVtQhPkko9kgb74rZc6QzMcRvtf8zXA8mdt+YXjWJCnvKVadM8Oj1izAu++D0nXjyNZxY6zCPuM30srknTZFOiIcU5YdtHxGRwKmgP8OtRjwRHlVmqOvZHN69LHnPcHR+yTZMTx5KPqrpRauO2g05QH/SSGmBtIXlmYFmJC6iWBbLQjOqDQ9WUbC5w/QA3VmXoFImO1p0f5LycoJLczspAhhpQ9xZFoE73qOm67OiI4f3TdXXNDZQqoJ+7lX5uvLbO/t29GytAfgZ6RWb5VFlzW4uVLvLL5zhBbnVla2qkaaC/rD9YBxcqHAFIubs0SLsExq1eD1CQ0Dju0HUhOX3rOcnEeT7HYLm9WA1/6TfMHwCvpF1XqtUIvfsoiUpZtlyAoStvpTiDCU/N3PoqvZMzxxzESIY9VZozNzRQBTCs2m4w4ikV+Jraw0LoRsM23nufgv1UIYfMc
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id un9-20020a170907cb8900b00a384365e3b9sm562305ejc.195.2024.02.06.10.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 10:43:45 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 06 Feb 2024 19:43:38 +0100
Subject: [PATCH v2 05/18] clk: qcom: gcc-sc8180x: Set delay for Venus CLK
 resets
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240105-topic-venus_reset-v2-5-c37eba13b5ce@linaro.org>
References: <20240105-topic-venus_reset-v2-0-c37eba13b5ce@linaro.org>
In-Reply-To: <20240105-topic-venus_reset-v2-0-c37eba13b5ce@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707245017; l=1320;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=xI8Pz/GiLYIx99t2tjsSwt/3C03sZIdZzmRztviEUeI=;
 b=BvYvh8VMtDO2ojSwG6EKKNmDTPNM3CZ//jLbMYVFrd3SBxGrYeb/ueF4t1pd5ecykCt8iau/5
 9hisTvNIiAxDNbTWDlWASMXLvySnJwy3jHdwAkpruTaQCgqRVqYWI17
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Some Venus resets may require more time when toggling. Describe that.

The value was obtained by referencing the msm-4.19 driver, which uses a
single value for all platforms [1].

[1] https://git.codelinaro.org/clo/la/platform/vendor/opensource/video-driver/-/blob/LA.UM.9.15.c26/msm/vidc/hfi_common.c?ref_type=heads#L3662-3663
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gcc-sc8180x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc8180x.c b/drivers/clk/qcom/gcc-sc8180x.c
index ae2147381559..1351c52bcacb 100644
--- a/drivers/clk/qcom/gcc-sc8180x.c
+++ b/drivers/clk/qcom/gcc-sc8180x.c
@@ -4528,9 +4528,9 @@ static const struct qcom_reset_map gcc_sc8180x_resets[] = {
 	[GCC_USB30_PRIM_BCR] = { 0xf000 },
 	[GCC_USB30_SEC_BCR] = { 0x10000 },
 	[GCC_USB_PHY_CFG_AHB2PHY_BCR] = { 0x6a000 },
-	[GCC_VIDEO_AXIC_CLK_BCR] = { 0xb02c, 2 },
-	[GCC_VIDEO_AXI0_CLK_BCR] = { 0xb024, 2 },
-	[GCC_VIDEO_AXI1_CLK_BCR] = { 0xb028, 2 },
+	[GCC_VIDEO_AXIC_CLK_BCR] = { .reg = 0xb02c, .bit = 2, .udelay = 150 },
+	[GCC_VIDEO_AXI0_CLK_BCR] = { .reg = 0xb024, .bit = 2, .udelay = 150 },
+	[GCC_VIDEO_AXI1_CLK_BCR] = { .reg = 0xb028, .bit = 2, .udelay = 150 },
 };
 
 static struct gdsc *gcc_sc8180x_gdscs[] = {

-- 
2.43.0


