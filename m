Return-Path: <linux-clk+bounces-21198-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3BAAA4CA2
	for <lists+linux-clk@lfdr.de>; Wed, 30 Apr 2025 15:07:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF18A50269A
	for <lists+linux-clk@lfdr.de>; Wed, 30 Apr 2025 13:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B890264625;
	Wed, 30 Apr 2025 13:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HK4/fQ3b"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA9E261372
	for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 13:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018086; cv=none; b=ow64uHY1mUzTdPRl8Ldlo2LL3R35c2xRIWhQ+K6xcyQ2eLglUqKb+9sY7fPQhOb8jHnl0ghVqNmLzV1xyJLJcmqxLHa+Ne3cqzr3S4h8t3hp8pBcMgxAfbEllS581b/67MhZQPufqXSudP3+alG8GeQGZd1TZYUqG5xAflNQfag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018086; c=relaxed/simple;
	bh=r6fKo5PXibO0QzyWpcwqycmMtKI/yjYBhbjx5uv53zQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JAmVENDJk674AmrMKgG2HpkC/PZ0hitF13OJSztc+eCRr43UZAON25nthaPpeFAdndGC3jKyGCbkuIGtCC4m7WHF2pUHQHrU0PzNAe9EgBFQkL5G8cdZ6QHWHi0QbpzNMoY7HpDMCWSj6ovxYayZzYieHGrHX0JQkbctqBIbxac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HK4/fQ3b; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39ab85402c9so244396f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 06:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746018083; x=1746622883; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UiMJSYIfbTscEgfa/S7hm841Cae3JL3KHIhG5qDZ+4c=;
        b=HK4/fQ3bxFrqW9L2WonIbAQ8G/CQ6BdQ0mdnAHlk1MN6hNuBE2HqP7PrJuQ86BKB5X
         0Iyw/Z0SlV4rW+vB6u1EDbvQLhj9/dKLZwSlNWrMTkWB+DMtq48PPlu09ztotn0+1lkk
         oGFCx7p60shN3/yM+bxNOuUu7V5uKg3kh3Y+gpb3aJNfsmXRdMDn8RhyOJWGapf5D1ES
         1padprqS5pn/gtTl6dkh7seKFEnKR6y2HMTbbPSZeHrVj2pQG5rO7yvEWgj7PDNq7+6l
         GBtmMlwQdZRsedmoJ6JY2tZz9brFQNyydelfuQhHsAwr29f4R4pKXknhCXw1lPh4fJZU
         F5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746018083; x=1746622883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UiMJSYIfbTscEgfa/S7hm841Cae3JL3KHIhG5qDZ+4c=;
        b=NeNREUBOeCKxiPYaRrFPi+uCieV6PO7II2AJMXChT5ZP3Q5dBAbyCLD51dRiGp97Ip
         AHVhv1MoA7VJA5DCZLiM1ZUPupFCvvDYG8yD9gftmLuWPb22cSCLFAOaDZcpj5X54Hw0
         oEEee2ajTSkNQA53rNvo/9pMME/jnaNAcrtJkhnF65KYQnSwTalLp5GKU7zlOa3+cXyp
         876vHGPWF16FG3jwBQbw2ttEBGqwbVxc/T1AZ738JBVCnpQNthlivEaRrRSyLXWgFNri
         CBcHfLYp4mFZpaviatpzbIkIH/S0G7bTEb6EIIIHLX9rJZSiAk7btMIFk8EYTbVGOwWA
         4Caw==
X-Forwarded-Encrypted: i=1; AJvYcCXn9vprEHd4nfTAikns3tJ9xcq90iZqsgh283RtVgN0j58UB66CFsPQbta/iNbrW8TFJoFK504EC4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDNpLoIpMSBo/djjHl1Kbq2f8f+88rzoJqcnBMUZi5ojm+FBIY
	a+1CM/HbZdtE3WlVW7Rh9Zcq6GDO5eiy8d0w61fULW+BGiHoqQQdfbA7yLMn1Mk=
X-Gm-Gg: ASbGncvbINBG/yIcrhYzvxvP4rkg8/Ew4zV2opVdLeHvFgbTiic1zQg/hiw2cGznZJY
	jkykpgT1ctWjyuwpVVQYA1o6ZOO0sqOk9N5JemEJwzA/i/u2YXSzYhnswFIZXBBguOOoOAvaPkv
	0k8mzfnM0fpxWq+G/hzgCkcIyIbJ+70/FzzKZVXEjYQmF43Bws8/jPWHm9NNOCRiR66miTNA+89
	68K0JK6MboJ1xmsCQSolo9xBc4Q68bSwTZqHKgvK3G2rvWaScD6tOTez+t1NmwAxmfzcTH01z+X
	/TJm7AbocdvZRUzZJrgjK1Mu+IZRsnHnCgvQ6e2PjeWnYJ+kQXXS01By+SA=
X-Google-Smtp-Source: AGHT+IFn111tvgyYFaZmfJPbWLNTKODE28cUWFrm8Mcmmd/nHWt2qqg3zfUH6GXahG8qUSQNfig2kQ==
X-Received: by 2002:a05:6000:2288:b0:3a0:85de:e05c with SMTP id ffacd0b85a97d-3a09009b735mr767112f8f.15.1746018082697;
        Wed, 30 Apr 2025 06:01:22 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 06:01:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:37 +0200
Subject: [PATCH v5 07/24] drm/msm/dpu: Add missing "fetch" name to
 set_active_pipes()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-7-8cab30c3e4df@linaro.org>
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
 Srinivas Kandagatla <srini@kernel.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4099;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=r6fKo5PXibO0QzyWpcwqycmMtKI/yjYBhbjx5uv53zQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh76ZVLS3hv6ZdJp/fyARXjXLcVt1FyaktOnX
 Ipz9UhKKuKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIe+gAKCRDBN2bmhouD
 1yO4D/wLdNCJWipHGPvZ4tPbMw4jWM1bNS5dssup3qk5JC1/VFl9mWz74nVsmJcrN1eYfTaf+eZ
 pAxXozoVqNtTC8T5q+0D6Bc6bEnvNQYiW4dMirKR97t6ryMrgtVntZ+o09MqB3LDaxWKOTFmO57
 CJc3v8hC1k33K564U/wniOqMl560KTvZ1nEqNJB0Bn6Iq12IP8El6OV5zpkKvudZxzCm+i09vX0
 Ps/IG5Dgdjy89P4gTMe7Bv6f+XZMTLf1UWxsrKSLXRfAEWInGHEiQJJhHGAu9Ek90eu5jEcRQo/
 Scvm7DvNtsX6O0nLhOR99DLKJmd0KpAKcT59G8aocExhaoSRcVsKRYd/wUmoQp+pbTjogB51+ie
 Am4i8mW78qriRw59IUQ9LlPeofH2oeRqVtzDJ7cXKqgrpqY+ToivakOL0uT2NT1sWgVIn5uKkLF
 FcGrarQP3cct2LjT5ikXgZXBTl7x9AdNCAXN4qs4TS8eBz+dsmi4JAX1gjQLy11zMqw7uDmdJYr
 sV8XyZISe38pRUgE/JD/o/U+ihQEFmhwVpC1GZnaBC8LgIiTrSzqmitZMFgu7EHxkYpXyFIzE8Q
 F2OFIP7cJ2Uk8HBphWCGRtEfml+sVWGhvdX/i9vicZ7N9DYP32KKHqJMIg+SRwMiubRTfNIKwcm
 ey6Q3tOr1Z+M9Ng==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The set_active_pipes() callback configures CTL_FETCH_PIPE_ACTIVE and
newer DPU v12.0 comes with CTL_PIPE_ACTIVE, thus rename it to
set_active_fetch_pipes() to better match the purpose.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v2:
1. New patch
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c   | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h |  2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 0714936d883523e5c53bfb42f932234db76c58db..2d7af6fff2708c12520a78cc6c979b9930dffc95 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -445,9 +445,9 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 
 	uint32_t lm_idx;
 	bool bg_alpha_enable = false;
-	DECLARE_BITMAP(fetch_active, SSPP_MAX);
+	DECLARE_BITMAP(active_fetch, SSPP_MAX);
 
-	memset(fetch_active, 0, sizeof(fetch_active));
+	memset(active_fetch, 0, sizeof(active_fetch));
 	drm_atomic_crtc_for_each_plane(plane, crtc) {
 		state = plane->state;
 		if (!state)
@@ -464,7 +464,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
 			bg_alpha_enable = true;
 
-		set_bit(pstate->pipe.sspp->idx, fetch_active);
+		set_bit(pstate->pipe.sspp->idx, active_fetch);
 		_dpu_crtc_blend_setup_pipe(crtc, plane,
 					   mixer, cstate->num_mixers,
 					   pstate->stage,
@@ -472,7 +472,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 					   &pstate->pipe, 0, stage_cfg);
 
 		if (pstate->r_pipe.sspp) {
-			set_bit(pstate->r_pipe.sspp->idx, fetch_active);
+			set_bit(pstate->r_pipe.sspp->idx, active_fetch);
 			_dpu_crtc_blend_setup_pipe(crtc, plane,
 						   mixer, cstate->num_mixers,
 						   pstate->stage,
@@ -492,8 +492,8 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		}
 	}
 
-	if (ctl->ops.set_active_pipes)
-		ctl->ops.set_active_pipes(ctl, fetch_active);
+	if (ctl->ops.set_active_fetch_pipes)
+		ctl->ops.set_active_fetch_pipes(ctl, active_fetch);
 
 	_dpu_crtc_program_lm_output_roi(crtc);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 216dfcabcb92d410ce185c0d34db69c99930d2b8..951d5dccab6faf34a519d06683514aea1ee6ef60 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -698,8 +698,8 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	}
 }
 
-static void dpu_hw_ctl_set_fetch_pipe_active(struct dpu_hw_ctl *ctx,
-	unsigned long *fetch_active)
+static void dpu_hw_ctl_set_active_fetch_pipes(struct dpu_hw_ctl *ctx,
+					      unsigned long *fetch_active)
 {
 	int i;
 	u32 val = 0;
@@ -787,7 +787,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
 
 	if (mdss_ver->core_major_ver >= 7)
-		c->ops.set_active_pipes = dpu_hw_ctl_set_fetch_pipe_active;
+		c->ops.set_active_fetch_pipes = dpu_hw_ctl_set_active_fetch_pipes;
 
 	c->idx = cfg->id;
 	c->mixer_count = mixer_count;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index aa560df698ed4e57a25e4a893d7333e19b065fe8..1b40d8cc92865e31e5ac4a8c3ee8fac8c5499bbd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -254,7 +254,7 @@ struct dpu_hw_ctl_ops {
 	void (*setup_blendstage)(struct dpu_hw_ctl *ctx,
 		enum dpu_lm lm, struct dpu_hw_stage_cfg *cfg);
 
-	void (*set_active_pipes)(struct dpu_hw_ctl *ctx,
+	void (*set_active_fetch_pipes)(struct dpu_hw_ctl *ctx,
 		unsigned long *fetch_active);
 };
 

-- 
2.45.2


