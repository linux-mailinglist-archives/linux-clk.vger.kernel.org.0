Return-Path: <linux-clk+bounces-2152-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD15826E50
	for <lists+linux-clk@lfdr.de>; Mon,  8 Jan 2024 13:38:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E4CDB2278B
	for <lists+linux-clk@lfdr.de>; Mon,  8 Jan 2024 12:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87559524C2;
	Mon,  8 Jan 2024 12:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JxNFTI0M"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D058C51C56
	for <linux-clk@vger.kernel.org>; Mon,  8 Jan 2024 12:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a2adc52f213so57089066b.0
        for <linux-clk@vger.kernel.org>; Mon, 08 Jan 2024 04:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704717156; x=1705321956; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Da5WEFJ7Rox0nWyoU5Lxh9Tri/61lPju+1E7YeaEqkE=;
        b=JxNFTI0MZuhNAVbfoZLQu7P9FvabwFbf6Q+AfCnt24bj3tVdIGjrxcLcB+fBuOWR/+
         uTL9ska02NIoiiEs2R7Nqp3FbWZN0YP3UoYTCDCAqCQYzlR8sANI8t/1epKGMnTE9EUd
         y2x5TDg5QiCJcd6BLP8OC4kWRGpZg2KC7/54XzVrDHgKgSBnwwL/UvJk6JJ4myMoykXZ
         keANuGLvt9XwG23Tz53SNIMjyTWtWeFf8b91OphWO6PtG38S8DDtkVH3HPQSa9lRsgeV
         doVA1+gswN/WnfDKXXRLBCoi5X8J0vuhcHlLs8i00dnhVPM2nF5TybxLOVefi2WP+PuK
         JKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704717156; x=1705321956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Da5WEFJ7Rox0nWyoU5Lxh9Tri/61lPju+1E7YeaEqkE=;
        b=WaVCsVYpAuc41a3b77wxGK+WWIjA5hLjBnrp28OYFODQ3nsjViU6lwVvi5c9IQ0BjI
         1DGZz3Dj+UK8PeXw0mg/BXsGD7e4LlG5Emw6I56yhGQn/g/UOxw1lP8Ms6kpeHiXZnCX
         6pxGugwbjudZjtm1l8l4Ki5dHOswbmmQNnqF1LY7ymhYsIrJ95de0vcv6ZDQHYnjOQdt
         Ysu6ahcuDPU4iJx2SkJFC+RFeojeWA01YGZoMvi++ekIfiPQHmsb6c9wOibczsgv5Yhn
         fqUIex+8G5h+IVnF6FWzs59fgudqLTDnZ7WQq3/tuZXOUtPzyIx+ETXXvPqEn5aXlmci
         6+/A==
X-Gm-Message-State: AOJu0Yw3BxV2RNSxYS3vW/BIT0jDMnW1YOrAokvU8YzqCTyHsf6xVtwb
	Z6OhcAtyNU+iLTQMnVERGEE8JuRqHqKgQg==
X-Google-Smtp-Source: AGHT+IFI9k/aRUS21Ysjert7ta28rIgJcnuKs5Mprrpj0fA/QdwbI8+hb9fkqnYLOkAQ9ZSFYuXxyg==
X-Received: by 2002:a17:906:260c:b0:a27:f7a1:2ad2 with SMTP id h12-20020a170906260c00b00a27f7a12ad2mr973815ejc.69.1704717156067;
        Mon, 08 Jan 2024 04:32:36 -0800 (PST)
Received: from [10.167.154.1] (178235179081.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.81])
        by smtp.gmail.com with ESMTPSA id bs18-20020a170906d1d200b00a2808ee8ab1sm3892978ejb.150.2024.01.08.04.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 04:32:35 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 08 Jan 2024 13:32:20 +0100
Subject: [PATCH 03/18] clk: qcom: reset: Ensure write completion on reset
 de/assertion
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240105-topic-venus_reset-v1-3-981c7a624855@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704717148; l=1265;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=JNyercWD/irj0WnMZM+/XNK5jH058/unr+ghbvtjtsA=;
 b=PiEP2x1LKi1nXUSfujrMpb2rsufCxzBXzXIuwd/XKExri1mGJnHEXZM3mYML6D2hNcbfCq9s1
 DnonS2BI0z8AfP+XkIRhdNm+Z1N1OVN22WZJpK8p9rxnLjRjT4QpIxh
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Trying to toggle the resets in a rapid fashion can lead to the changes
not actually arriving at the clock controller block when we expect them
to. This was observed at least on SM8250.

Read back the value after regmap_update_bits to ensure write completion.

Fixes: db1029814f1f ("clk: qcom: reset: Ensure write completion on reset de/assertion")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/reset.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/reset.c b/drivers/clk/qcom/reset.c
index c4ac4d18829b..57024d1a0524 100644
--- a/drivers/clk/qcom/reset.c
+++ b/drivers/clk/qcom/reset.c
@@ -33,7 +33,12 @@ static int qcom_reset_set_assert(struct reset_controller_dev *rcdev, unsigned lo
 	map = &rst->reset_map[id];
 	mask = map->bitmask ? map->bitmask : BIT(map->bit);
 
-	return regmap_update_bits(rst->regmap, map->reg, mask, assert ? mask : 0);
+	regmap_update_bits(rst->regmap, map->reg, mask, assert ? mask : 0);
+
+	/* Read back the register to ensure write completion, ignore the value */
+	regmap_read(rst->regmap, map->reg, &mask);
+
+	return 0;
 }
 
 static int qcom_reset_assert(struct reset_controller_dev *rcdev, unsigned long id)

-- 
2.43.0


