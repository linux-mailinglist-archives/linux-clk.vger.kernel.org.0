Return-Path: <linux-clk+bounces-21215-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A85EAA4CFB
	for <lists+linux-clk@lfdr.de>; Wed, 30 Apr 2025 15:12:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A5869C7665
	for <lists+linux-clk@lfdr.de>; Wed, 30 Apr 2025 13:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61BD7280316;
	Wed, 30 Apr 2025 13:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B59NTOEZ"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBFF27E7F4
	for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 13:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018124; cv=none; b=WhAC6cmp8DzWDEkO4r5a4uNyBol9tmaBGa0Ban9B92yRs7R3Xb1FTEKcTBpQE75TWLCZY0fPJQWa428JA5nIG7a+lE4xS0mLm0CvXKza6AIDT/lCgymnwSF7G4LLhEydPbAAxSNreEz7rXLcQcP4AR9yT4RP3e0B+bSajcJqVsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018124; c=relaxed/simple;
	bh=be21JxufejHw2rq84sJ/VfYaP1y6cCq/ZMTy8SJRrHY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fT1jEn+8bgudrSYPM4vttqKX0QFWeBQZU2///TVNTTb+/Hsv5BxOB6IB/T42DxNSOPpdLlKehLUhS1SpvPMoF/bZ5ooxLXtLLx7KwfMsA6zhh0GrUy/QljXZ1I+uLRWwhYH9W/FgMpZh7nsvveHqROOljWdci1/a262+kwBba1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B59NTOEZ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39ee6260fc7so451071f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 06:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746018121; x=1746622921; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tndmMRLasPafzGI8us3kiKmdtf1aIReqkNl96kpfR9I=;
        b=B59NTOEZSkmDsh6tERtXuQW0MRWmBlA4Fwb9J/vtgmXIQfUL5x8sqzhOZkJXyrJGaU
         AGQDhbb9c76c6QR+AI63PTCV/+YNHUv5UTwCQASAqaR0oqE5AJM0lVid3NALAOLfI3UD
         V2suoFyXu3G6g+evYJLhWNwxjDR2fEBcGRGoUL4uUdjgs5WSonbwQMwdVPGBUPiZmszB
         VKauNZNZWXEv0Gq+RrUIfvZ1yMrK0sN89wAMQirKOmCdVAG9Oa6TNI87fq3XI0Alewm9
         ss1bJ8QBPAAhMRlw2BUoqICBH80J0cp28XNoz9wQ4oF1x9PIYSncUTlgR7eZihf54OmX
         icQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746018121; x=1746622921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tndmMRLasPafzGI8us3kiKmdtf1aIReqkNl96kpfR9I=;
        b=hmgl1Y3A8KYy2ISv81weodfqtXL1l5paM8fSQeNs/KfqUN3aqxM7mNXgCgOLOXUFZv
         hC+ojUHs7ULmJo+GLDPOeddNYQiV5vpzeiR0b4wlKfg/e2jySACwVHz1jyzEVDv20L0y
         gpiCuI4bYaZTdlaUkQNaZ9M8R2A4FFyVAib/ERqCj1+PyvC8G5azvhAqgG3Bd7YXCzYy
         beqFpHeF+KJGVI+olOqC8d7nSFqLe7keMoKyDULYdTn0/2byj3jYT0CY8d1Ab3Dta9VW
         +AH+JTuH3ZjK6JTMYx0ASCF3OQ5yxeReF3gUPRJ8UGsD7A/lSMPKJ2jATENN6Zx5RicK
         nH2A==
X-Forwarded-Encrypted: i=1; AJvYcCWpz7st0SRU6aeG62PzpqnQS/yShZk3RGVhET/ocnw33HalQz3uKuAfOh16/Q/ElrZ3OcXmGy39nRY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxITHbKK+WoxrPrrRoCki5WQ/iOyGq8B5f/wHEDOxrTZ3/gkSUe
	WXH/Vpo2rlz/gkn+xD+C2lEPm7u6YA4fwG0/Kq1C7K8S2iauBwlLTBTM8StCTw0=
X-Gm-Gg: ASbGncsoEepQpG/183ARVS4p8mJCV/y39X3cyAOF2rpDqSK4MW93ELWKFoqtBlIFoyL
	RRRK0v1/czAJS9MB00VFZaZpIsSp299rJYE/c1DmYkRfKLN48b4+7ztSngBI1G/vLcPJdrPFx2q
	CNs7nPDCq1bzm2GrqEilsEsmTSyDVkpHJBqArHmmS+crWorxMpOlCeGJ4JzBMkz5Nkda7vXaDPb
	5a+SiVzu/ol/2ssPERXUeTdV7rJcSpXLx1eQHuMEjxBCL73uCLOeR/aBVfh3GfH7bT3Ls46hjDz
	1XHxUaVcRGhIvHx5YkW4F8snXjiRG829b4oJC7ApXFZZlTYe+XOAfjSp4IzXKKHyAQhCOQ==
X-Google-Smtp-Source: AGHT+IFi7AgExT+UHxJr37nV09KKAM1KH3QuKRe5WJLZQda5LnvxXNiP5Xe86NeUpMJvDYVJnyIoGw==
X-Received: by 2002:a05:6000:2404:b0:3a0:9188:ef58 with SMTP id ffacd0b85a97d-3a091d667cdmr96227f8f.14.1746018120453;
        Wed, 30 Apr 2025 06:02:00 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 06:01:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:54 +0200
Subject: [PATCH v5 24/24] drm/msm/mdss: Add support for SM8750
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-24-8cab30c3e4df@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
In-Reply-To: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3191;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=be21JxufejHw2rq84sJ/VfYaP1y6cCq/ZMTy8SJRrHY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh8PByvnI0Trv3zsZhzQ6VfXKE9citqdjgGC3
 PsTmPZCN/WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIfDwAKCRDBN2bmhouD
 1wrrD/4u2PuQ2ouXBCx8tly07ATHb1/Zj1EzEBIaw19Oi3HJew675YV4BPClQF9J7CrOB2m/ywR
 hbw/dqZXqTP4kUCrmDAqP8pwBvmJGIPQcCuznZGjaUFbdLyBqJeVV95jMfLE31jOOkDhWSZEYwV
 5jc29JXj/nPLvDAjfUv/yylQnfHKEpLeliBjwI9j6hFpDUHUEIWYsFrD7XC5gRowjCIrVWYArhu
 mg57pYWMhuBdbvtzbhsZ5Tu84iPLXB98/DznQXv97jj0t81MD1NB6vz1NN6c3s1uOrA4shA+N6L
 fpAXoNrr2+b/F6pw5r/BomV7TrYL3CX0nN4cxW11IA74vPAIV8Jgu2t0mOui5caqBaPR0rvT36m
 Kw1qNZIVTme4Ql8nZmmon1XlHcDKyjXljdJQyS0zNuyPOR4h9bFO5Fd4ZQi/vMYZIyNgL4xIVVn
 eFobglFBZ/q6CZkQ1vAotPvPkkIfBmigkKk7Q5ZdddttpPEA/Nq6UN77mcgpg+KyOVSMIToABqe
 FFzMztgK+MUi2pBiL4pp5TvizsJL5qolZqdIT6SSwni8B/WhYEl/YOH7cqaAccf7vh7IpLLW1tK
 DlnN4VVi0lbl86fzVBqvpNpfIbVkSE2PxXaOdvdUFFFEYmDm5zo0ifolEz4rzBiPZlD1TBHug82
 ZgJejiSvYezahmg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add support for the Qualcomm SM8750 platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 33 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_mdss.h |  1 +
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index dcb49fd30402b80edd2cb5971f95a78eaad6081f..3f00eb6de3a9d2bee7637c6f516efff78b7d872b 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -222,6 +222,24 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 	}
 }
 
+static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
+{
+	const struct msm_mdss_data *data = msm_mdss->mdss_data;
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
+		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
+
+	if (data->ubwc_bank_spread)
+		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
+
+	if (data->macrotile_mode)
+		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
+
+	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
+
+	writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
+}
+
 #define MDSS_HW_MAJ_MIN		\
 	(MDSS_HW_VERSION_MAJOR__MASK | MDSS_HW_VERSION_MINOR__MASK)
 
@@ -339,6 +357,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	case UBWC_4_3:
 		msm_mdss_setup_ubwc_dec_40(msm_mdss);
 		break;
+	case UBWC_5_0:
+		msm_mdss_setup_ubwc_dec_50(msm_mdss);
+		break;
 	default:
 		dev_err(msm_mdss->dev, "Unsupported UBWC decoder version %x\n",
 			msm_mdss->mdss_data->ubwc_dec_version);
@@ -722,6 +743,17 @@ static const struct msm_mdss_data sm8550_data = {
 	.reg_bus_bw = 57000,
 };
 
+static const struct msm_mdss_data sm8750_data = {
+	.ubwc_enc_version = UBWC_5_0,
+	.ubwc_dec_version = UBWC_5_0,
+	.ubwc_swizzle = 6,
+	.ubwc_bank_spread = true,
+	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
+	.highest_bank_bit = 3,
+	.macrotile_mode = true,
+	.reg_bus_bw = 57000,
+};
+
 static const struct msm_mdss_data x1e80100_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_3,
@@ -756,6 +788,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sm8450-mdss", .data = &sm8350_data },
 	{ .compatible = "qcom,sm8550-mdss", .data = &sm8550_data },
 	{ .compatible = "qcom,sm8650-mdss", .data = &sm8550_data},
+	{ .compatible = "qcom,sm8750-mdss", .data = &sm8750_data},
 	{ .compatible = "qcom,x1e80100-mdss", .data = &x1e80100_data},
 	{}
 };
diff --git a/drivers/gpu/drm/msm/msm_mdss.h b/drivers/gpu/drm/msm/msm_mdss.h
index 14dc53704314558841ee1fe08d93309fd2233812..dd0160c6ba1a297cea5b87cd8b03895b2aa08213 100644
--- a/drivers/gpu/drm/msm/msm_mdss.h
+++ b/drivers/gpu/drm/msm/msm_mdss.h
@@ -22,6 +22,7 @@ struct msm_mdss_data {
 #define UBWC_3_0 0x30000000
 #define UBWC_4_0 0x40000000
 #define UBWC_4_3 0x40030000
+#define UBWC_5_0 0x50000000
 
 const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev);
 

-- 
2.45.2


