Return-Path: <linux-clk+bounces-3361-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3323F84BD31
	for <lists+linux-clk@lfdr.de>; Tue,  6 Feb 2024 19:46:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB4CE28CF21
	for <lists+linux-clk@lfdr.de>; Tue,  6 Feb 2024 18:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2866179AF;
	Tue,  6 Feb 2024 18:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U8YB1/Sb"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4251B806
	for <linux-clk@vger.kernel.org>; Tue,  6 Feb 2024 18:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707245037; cv=none; b=PfiMeohrmwBcxMIB33yscnXq33Na9QP7h3VJpHtoXk2EIYs+25fd/cVl+2Ab/xdhhl8PqO3TopvVQ6yPZt/KQbWwXxTAWDEaFS4qcwGX7X5hRGNRhXY7VBxy8c863A0nJBXOsPLar6u+/RwUh0/znTCb5NdpqHxX9kz37xFERDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707245037; c=relaxed/simple;
	bh=7ZxBeTpI7rU3/jGQrGYsBGxNSFTwMdNCV6VkV77JbJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hs7XXTlvg90AcMxfnbySc03+SOYPK2twuFYvfJ8uKg7EAcLGQhHX9umR3HlRZNIuEAd1OvWoWxxAcuGEFkxUp3If5rNpBd675679eCml2GLrDwpSlnD72lNCCQrxB3r1OQsrVV6wO3YOaIOKYXOiX0SMD7a+5CchDdn94ZdlY+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U8YB1/Sb; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-560c696ccffso407151a12.1
        for <linux-clk@vger.kernel.org>; Tue, 06 Feb 2024 10:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707245034; x=1707849834; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6JFIAAu62FuQn/HSZ5tKqmYhrMc0VqNnJVz9VNDCrjM=;
        b=U8YB1/SbcajaNo6MtJJPaP7bx7DCjn0g02KnCGkLTRlmLFQHGLcWP2BRhMXZfH2Tnw
         TG66AM7XS9/oxglXwdq2uyM714U5w3OmMoGsO2938GynQeUBPFFdTjkybPy3yfO+s8Bs
         UbSXSAW/OFkO5cuUl6chYgoteaBmCFKFK7Oog5ik5w/OwZ5F5hl5pSMswmShMyuCFCqo
         mu9T/JJqvf2V/xd0FUCX4HmNTwE+nICu1YugobOn6RUiBremDZDh6oflwcprncmeHBBG
         QfVbtUGKY+csQe7jhEBiuwONOHoW7RHJKEs1Tz9gFHmo65Mf2s9YNNkSlu4MQvVhpMHH
         ZxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707245034; x=1707849834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6JFIAAu62FuQn/HSZ5tKqmYhrMc0VqNnJVz9VNDCrjM=;
        b=hahUUTB6f8ALTaqC9+SyCAYoZa1MfbdvKO6zaIiRCKJU0lCIMOzmyLhwxhSEmvdZK1
         893+2E+2aaWuHou++e4ROTQk3GhRGKoBEMzXBveBktro1yyUIzhdedJbMwc1Xq0g75ea
         PW3DX7xg3MG799nBfWEAuCnnD5TEn4CAiTypM1lOoqyqH3px5qqCHIWORfAZX7m4qR3a
         RLROOl1s6j+HCKs3fisIpMM0m8kcFUY56UDBGhxlcYUQGDN4DnpldkvMJmtj1NaNo62b
         b5ksm6JO2U1a6BpezSFPFfzgzh0Y/XYFHDlD89H1t/fWKDlNbcoj8uoregeKW2toetkC
         DnVw==
X-Gm-Message-State: AOJu0YzMgPdPb1d611ty78JpsWqkp/quxqr+IvCQi87rTmhIbOZoh+E4
	lfLN4zceqpr7QFrhqJM6IwjGjwNeeDNxfsLFrlMVlnRt4reVEtadbtN8LVYk06s=
X-Google-Smtp-Source: AGHT+IFRnU7S9WuINV3NhaAKT2gjDWTwPGpFeNX4WG2QF1077VknapVFzp8zFOquS5VGWgaguqZCwg==
X-Received: by 2002:a17:906:3297:b0:a35:b59c:fc04 with SMTP id 23-20020a170906329700b00a35b59cfc04mr3562614ejw.25.1707245034391;
        Tue, 06 Feb 2024 10:43:54 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU3GW7DesvZfeZqzLXJ9bmcXbGuiNMy3LJq+VOD/cMGEPUlLtDY/ddOTJAliMHrcBDDAz2a6vd0Iij1ilRqUNdnK4nToxkPvOM2ID/b67mvZbZvKnSObM7cwpHAvnAUX2QwJ6AVvoV4q4PNRXNqD3ZAbpBWrCzoc9uhCY9uuzufzopIF7Pwri/sIspnjvVXd0Fmc2I0pfIgeYj0Jv22+T+oFO9p03oqvCLgpJ5LRLOIU+pvv15CuSAqna0R87VuBdR7R21jlXfGHAdbXEbeEfVh/9b61KoQjNHA33HhjYBkSXBPlZEMATZ7Nt+jSnD/V7vsH0sNLCBRLVVtlS3w9pdh6tJKLrEuEExVL4rftP3DQqIgdlP88q9AdPoxmSX6pB5FcF3jdCRRHSh8kAx4+MHEWn93+DiQKqI5NbFn9FUHGTMWPlIDHtQQ6Cq4BQwik+5GlUJRVcew
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id un9-20020a170907cb8900b00a384365e3b9sm562305ejc.195.2024.02.06.10.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 10:43:54 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 06 Feb 2024 19:43:43 +0100
Subject: [PATCH v2 10/18] clk: qcom: gcc-sm8350: Set delay for Venus CLK
 resets
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240105-topic-venus_reset-v2-10-c37eba13b5ce@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707245017; l=1113;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=7ZxBeTpI7rU3/jGQrGYsBGxNSFTwMdNCV6VkV77JbJc=;
 b=IjZM3jN5XHZrj5wc5iXTiZuKe8lstZqNruPJ13n3kYfjb61cQtY0BWSyA+c4+SNxU5Z59zsEl
 FFlmLMVgijVBk9qV7fgkaVVVDBpl/9tfRtod4o1RKlRwx1jwkHM0HHx
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Some Venus resets may require more time when toggling. Describe that.

The value is known for SM8350, see [1].

[1] https://git.codelinaro.org/clo/la/platform/vendor/opensource/video-driver/-/commit/dfe241edf23daf3c1ccbb79b02798965123fad98
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


