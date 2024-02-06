Return-Path: <linux-clk+bounces-3362-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A1B84BD34
	for <lists+linux-clk@lfdr.de>; Tue,  6 Feb 2024 19:46:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FFA81C2149E
	for <lists+linux-clk@lfdr.de>; Tue,  6 Feb 2024 18:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 364B71B805;
	Tue,  6 Feb 2024 18:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="euIvd72z"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3DD1B945
	for <linux-clk@vger.kernel.org>; Tue,  6 Feb 2024 18:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707245039; cv=none; b=qhEm2SgcH8cO6KpqLVIV19wtUpmgcCTXErYw4ily0+DS1fYeH5wgX8KF85yG2KtHZMc9ffb+kjest/93eLxoB8VyJwpgt5g9AT5je0NovQEVdg55bOD7Krm4m100uUp/ug1c7BjBwcxUVLxNLySXeSHGOSyxesnD5tNI+pZSYxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707245039; c=relaxed/simple;
	bh=MVwKMyl639pfSSp12W8ZsSkDXB3e+0oIGZYQAcJEWn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sBwtdMRIazGeETI9dlnFoE0iXe+JHovzz4JAjF66y40VtgMqtSfWZ1tBEg+Pwg8FIhj9Rv54+LSTq4BkuENJ9rPcEHdu5d1ZyU7FxMKSOpPVrmUx31D2gg/6FvN9XAvUDpYpk9qJ+9IddVVtJQGRduw+BlmSKPNuCibEtCqcZtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=euIvd72z; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a38392b9917so104697466b.1
        for <linux-clk@vger.kernel.org>; Tue, 06 Feb 2024 10:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707245035; x=1707849835; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B1iY3/5e1vVwTp9GAkTk6iF085CLAD1vcMZhFA07ufA=;
        b=euIvd72z37mvmr7a2/GiUUpDaQ9nvm6BKImV/VSX/V4h5tHIxf6vFgBqhIeKOi3JLW
         WDHZH4MjORqjEUEz8XjGkLcQ0m6ZL+q/73kx8JbxkoeZDwHUzVK5oMEHcF8Pg95tad+J
         /f0y/Fm5vRQtuROxH0QqvGJxxdGbf3SGuchvvpFKYIafQKPY/z2o2dZWQPkdz8t1jx4V
         B89Ri6oZMnIXA4yUvLIuMXBUyNQYZ9E085dLKAEN4uoWbkyAEwvRbJId9I8179r37L1F
         3Ea+kF7/q4ivfX7c2W9/XJCt4utVBq5P/TVFcWXh8jZ84RZtvkQi9ZqAjy5VkI+2+gaM
         GK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707245035; x=1707849835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B1iY3/5e1vVwTp9GAkTk6iF085CLAD1vcMZhFA07ufA=;
        b=Ft6BO8TMK3fnNatHIynoQbOZ+N6CZCzxAcxHQPCR4dfA6UThP4xUbeDlwp33GKH1dU
         SKFtuZgUWp9PUDdgbUNuzES3275xiYK7KdcvnJISeMjPpoMcR9b/zNEHfVbcQZ97IL6U
         GH9egO/xaqG9qW+xvomOYPrwr7BOiqKs+EEDTQF4zjBpOiG7cxLTgo3rnI9q8ib492pA
         g7fvm3KF6gzBhE7zmZV72Qfqz1LDWm/TKpvFr2UadwwN6jm5pjPtPzHun9ayS3H8PG2m
         c4hniG6F3WCSPoTMsDu12LxvsaFi4UZjyU1uN9mFiu//VIPEVEg7oFpEvZ/gGaZB59vH
         Ikrw==
X-Gm-Message-State: AOJu0YxSJYyAPZl9JVdd1Hn2W66KSHChUZhdH3MKYH5b15bNVEf1zEUN
	+BGItk6lvc4P/uyKa5be5l9m+CbV6TVDm1kTHgoEh2Ahi3i85IQZs3fLOzOZ+uc=
X-Google-Smtp-Source: AGHT+IFXZnNdvjQhBhhzhvuBB7qAUVEaTm2wSqzeYCTFnPSXWnZYiFNDajN85a53sow3DUCPDc6nGw==
X-Received: by 2002:a17:906:5ad4:b0:a37:b795:264d with SMTP id x20-20020a1709065ad400b00a37b795264dmr2605624ejs.57.1707245035596;
        Tue, 06 Feb 2024 10:43:55 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWMjlpNtix6mgvC3tfpf/8y/JqEIom7qxcpy55JwHa4+w4vvKy2LExr5+HSHQlm/nxjrAdoWIX135smiu6gYZVJigacTT/0S8yp7xSMspA2Bi7RjjSnIvcR6uw5Z4ynP27YM7RNhgjBDN98vXjygJW61PcX7MqbHfct2W4Mb4BUJzJFMOfWvZ5gf7OTrDmJesx69f78MDgou9fS39CeowLJvQJIO9SRokW083rA6J4DGtwI7Hm5jYlthgPJ1jwptHUyX7eIeGlo/+3NOMdW2Z6AV47R5V7xorYnuwzUEZ8pqNpMk+qH65ZMk0iMqs6yFm4zDXCdO/PsE4qusQri7Y4Lo/q9IlRjZsj4KETuMWBkcZuXp+lwSS7ihea7Xp7kxpXfFeySjWSyUD2+3Xk92zYD6Fc/nT2IekKyJWYoby5/21XWSlhySdxc40Retexm/uJHyTWiPwLg
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id un9-20020a170907cb8900b00a384365e3b9sm562305ejc.195.2024.02.06.10.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 10:43:55 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 06 Feb 2024 19:43:44 +0100
Subject: [PATCH v2 11/18] clk: qcom: gcc-sm8450: Set delay for Venus CLK
 resets
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240105-topic-venus_reset-v2-11-c37eba13b5ce@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707245017; l=1115;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=MVwKMyl639pfSSp12W8ZsSkDXB3e+0oIGZYQAcJEWn4=;
 b=WzApI+i5HPCSE0QP9FS1c4W2SGt6W8PgU1ss9ttY5Ud4sBM4SP+FzyQ+ZJnXqTpM3AZyRIN7e
 aQQNJissTeNASVyp8/0xSbNXuTmCUQi8VVR6PhVlJREXkKx962v1QBC
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Some Venus resets may require more time when toggling. Describe that.

The value is known for SM8450, see [1].

[1] https://git.codelinaro.org/clo/la/platform/vendor/opensource/video-driver/-/commit/d0730ea5867264ee50b793f6700eb6a376ddcbbb
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


