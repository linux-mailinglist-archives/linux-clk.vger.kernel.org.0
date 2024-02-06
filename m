Return-Path: <linux-clk+bounces-3367-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 781EB84BD43
	for <lists+linux-clk@lfdr.de>; Tue,  6 Feb 2024 19:47:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E2DE2B26DB2
	for <lists+linux-clk@lfdr.de>; Tue,  6 Feb 2024 18:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B33D13FFB;
	Tue,  6 Feb 2024 18:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V/99DOJL"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C121CD2F
	for <linux-clk@vger.kernel.org>; Tue,  6 Feb 2024 18:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707245046; cv=none; b=Qlv33dU8hPmpZ//mVeBNiHZREmABmnLIE8CUQjM6IQ64CB4upL7b+tXgVgCUZ7zIqgWC+KU7fnrZvlnKSqemh5/ZYJFtvMS7MLu4ghJYDTAJFo1PEDtU70H0CmoiiGjvHTPNzkspW1Rw7PINcEbj64StD9+cD8fqs0DxXvK8M/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707245046; c=relaxed/simple;
	bh=Y7Ggulm32WM6/RAQVocHOsRN4fBmgKhsAW4zx43ZHnw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FsPLeaO9t1FTO8yeEY0bXYKQAank6m1v6UHUZ+T/VKH4iL5iT97+H2lidkaLKQkFMVS8kmJP49YSZIMvhfQPmOHnSl9vh2qXJD8McNBEXxQGv3RUPEipQgdu9+YnrSen0eGECg7rQcBln/ZVpJLO15HEe1x2gsDzSBesfrSzuoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V/99DOJL; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a34c5ca2537so815672166b.0
        for <linux-clk@vger.kernel.org>; Tue, 06 Feb 2024 10:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707245043; x=1707849843; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=isVYwPY6ofdkrPg4X2oYZpRBZGZUPttUGJohkW2kvxI=;
        b=V/99DOJLQJ6tJE7E7UyXPiq61AcIkRz2/n9tFHcGRgD+Ui8d3y8FiHClrH3NbTF5ii
         ZkMbg4wQKFZP+61Ie1VYPgiqvDdDiJd3KAEJfX7snYar72NPbYeZE5gjiJmiVRkiyde3
         d4ArfsrQRIJb4SLjcL6QcjZSHe1TxQafTIGXCfR/jqr9mXDpdzKlH/Ekq5qLUgPcSv9J
         oCNRAEXVG8fbD0C8ECuKyxnlJSSGDJShbzghh13poe7qD6NNxvU9rnamMaVETlTMRNI0
         tpfiFeNxSlJiHUhcR2Et8nlBtsg4g3/blrew+wkakGBHQUwv+Ww0pwydzVv52SM24gZs
         xklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707245043; x=1707849843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=isVYwPY6ofdkrPg4X2oYZpRBZGZUPttUGJohkW2kvxI=;
        b=WwnERLZU+tsRq3OD6v5bXO4EiFTtoUURmJFBzop+W8I1paxSwqBwU3q3sa2s5acxyV
         v9GtvgS0MDLb9wuZOL/E/21wOMl0P7LvR3iTQ+Tp43K3bNx5Go1P5FjbeUo1N5XUKPb9
         1XbsOfWcQ+LmiGFENMGEeDsxNYjS6GdIr8UxkXFNLPgWv4INtlhbLPRqPIoTtzomWB5b
         2Lw1Jzrkl++b7+DJ8ihXIKxfvYLqi4TmxLWzfAc4BGAoC+WNgNfOAjKG2+KuWkQ7REOE
         bCzDUVN5L7IHxMLPdxn0LnmPuJyLs+l73/BrAB3BafGk3GFj13zJhHqG74l/OO7LTkEF
         hyRg==
X-Gm-Message-State: AOJu0Yx/8/EEAopx56R5+YJYN5P0Fy/kESXQCkF2dl5yW6PV8im9AAhN
	SH+nC4QF5UF8aTT5mjMy8jjGkS6nrICr0nP55vZZ3ka+8D2VKeFa7YwaZYmLufw=
X-Google-Smtp-Source: AGHT+IEGDzYnSZ0kqdSVkgFHv5O2mtFy9VYJ1S7QGal0lAihMkpjZ4JaqcIQJnJKuV7bAlu0DJTNgQ==
X-Received: by 2002:a17:907:7710:b0:a38:9ff:5711 with SMTP id kw16-20020a170907771000b00a3809ff5711mr2492169ejc.51.1707245043218;
        Tue, 06 Feb 2024 10:44:03 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVCEuPRSNphr/lrCNEQgaplXOouJICClOqTHCkZ0QwrWXba7Wvy3sHFnfKnmAD8wLlVYv2Q4/bmT2M/S27soAQ7ruY8n8uwcQPftk7qc2zvPFCkQ9ceNqI8ONnqPd45DpmfdJE5V8DEFOZaJpZBo0PdsRcS3gvnDiI4LTqfis5KkSc2Wx1PvrSGgJo91iRhgRiwUXn6eoho+Ss/IgT0lEe8nS3P2lgBhY10Rk36qOn6L9ZOYD3v+EoxMeEjbCSx7UfpLsTBtMRtwRWLRlEk5JzE31DAhpGosUNKCZ0q0qwvRsjnqaHClaNzS9TQ/yM2iQPxeKXVoBOZOkunF9sZo60uRY/NmTYxug9nzEymkxn7KwHsxWyvVNQ25JxJVonk+Rwb62v76BdZ0G3ZMQWhyoid3sD+E1+I6f4uQWLYXFzDG5Xbc1a78P4FPRAIXPVWP0xP6KLIJTlR
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id un9-20020a170907cb8900b00a384365e3b9sm562305ejc.195.2024.02.06.10.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 10:44:02 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 06 Feb 2024 19:43:49 +0100
Subject: [PATCH v2 16/18] clk: qcom: videocc-sm8350: Set delay for Venus
 CLK resets
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240105-topic-venus_reset-v2-16-c37eba13b5ce@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707245017; l=1223;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Y7Ggulm32WM6/RAQVocHOsRN4fBmgKhsAW4zx43ZHnw=;
 b=+zg3ql5xeaQtsYwzLD5OeLyA/UT3wxi+MNWyvdMP2mGfUDA5EH5HlLCL3b0D79zdaSA6kZGd8
 1hQdTOOGi3AAhPoThaHiyCxx6+NWX3VA+XBmBBHY5s5L2A8MM/sxAPA
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Some Venus resets may require more time when toggling. Describe that.

The value is known for SM8350, see [1].

[1] https://git.codelinaro.org/clo/la/platform/vendor/opensource/video-driver/-/commit/dfe241edf23daf3c1ccbb79b02798965123fad98
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/videocc-sm8350.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8350.c b/drivers/clk/qcom/videocc-sm8350.c
index 7246f3c99492..8db2bb995558 100644
--- a/drivers/clk/qcom/videocc-sm8350.c
+++ b/drivers/clk/qcom/videocc-sm8350.c
@@ -488,10 +488,10 @@ static struct clk_regmap *video_cc_sm8350_clocks[] = {
 static const struct qcom_reset_map video_cc_sm8350_resets[] = {
 	[VIDEO_CC_CVP_INTERFACE_BCR] = { 0xe54 },
 	[VIDEO_CC_CVP_MVS0_BCR] = { 0xd14 },
-	[VIDEO_CC_MVS0C_CLK_ARES] = { 0xc34, 2 },
+	[VIDEO_CC_MVS0C_CLK_ARES] = { .reg = 0xc34, .bit = 2, .udelay = 400 },
 	[VIDEO_CC_CVP_MVS0C_BCR] = { 0xbf4 },
 	[VIDEO_CC_CVP_MVS1_BCR] = { 0xd94 },
-	[VIDEO_CC_MVS1C_CLK_ARES] = { 0xcd4, 2 },
+	[VIDEO_CC_MVS1C_CLK_ARES] = { .reg = 0xcd4, .bit = 2, .udelay = 400 },
 	[VIDEO_CC_CVP_MVS1C_BCR] = { 0xc94 },
 };
 

-- 
2.43.0


