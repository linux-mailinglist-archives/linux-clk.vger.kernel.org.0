Return-Path: <linux-clk+bounces-22756-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65795AD3AB6
	for <lists+linux-clk@lfdr.de>; Tue, 10 Jun 2025 16:11:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44249189DFF9
	for <lists+linux-clk@lfdr.de>; Tue, 10 Jun 2025 14:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCD152DFA4E;
	Tue, 10 Jun 2025 14:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RcDSFZZ6"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675682DFA33
	for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 14:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749564406; cv=none; b=Q2c9cUYOwfKQThGJVocm9qKOr+veV/C6ws+84WQloWhGAZrXldmhAXQfg3vXlVJ6QuwxdXEI/k8lP4zj1pah6GClaB/xdtik1XUqZ/lFU0AptQwMg5+yN/vwguQ1NayteIlJuzIw4oqwsNKKQ48d+vk7nN66tJ90r+eC9qcKRQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749564406; c=relaxed/simple;
	bh=PDdJg5qIS7HbPoHRu893zZjvEEa3IuzpHJO/F1Hc654=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A8dzQ4U/PlzAbP4s8Km87l34wWDmxeLJqiiTqcsyCxrV7lnmeIvvTruXuZCn3XhFmnsQOlnpv38PPPFMLE01BFvhLLiRHKcYmd0z/6ZKt5mvaP96Q7Y0o5yg3Aa/9moxyzTl8LJkPQbIPHdAl9ChL+2JFlyHuLM+8cp2ol/+bfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RcDSFZZ6; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a4ebbfb18fso482493f8f.3
        for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 07:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749564403; x=1750169203; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CBcl3mtlA2qXlHBtwB5KJDW+hrhCZib9hqqSTtK3hgY=;
        b=RcDSFZZ6/ofukSezyhLNCbJJo9hQ0K9PoWRV5rSrBw2rknL7BW/5s1mCmc8Ng/ANKh
         TtUpMkKmTEkbNga9EUeKT7kyxDZOs3TwRMIo1CW8t8oZ+d4riwGw1HVJW0lH/f6Z4o9b
         1odq8cdbIumSEH8GoWONZ8qpP8wujdCuieDfg16AaQBfqke+iIr+WI2lLEP0W7flpY4B
         Wyw/eeL1ic5qvYgdnxJCE1O66Vio24/JA75pxgPeX07meZUemNd2VmR/pAw6SKbpU+L8
         4JUGaa02yX78lZFgvp8SMdHQ5L3R4r6V76jWIVRyLkC0fMTqzJrHOJ/S++c7qPTZK7Qj
         VX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749564403; x=1750169203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CBcl3mtlA2qXlHBtwB5KJDW+hrhCZib9hqqSTtK3hgY=;
        b=Sn3oDhpFyrWFkRo8G7tDJ+rb+k81ELF54wMvZs/lIRNYv8Pb2xHADBbA+mChwBlTPq
         OBsLOdC6haa2+lsWUJG0mxLioBgv63JFEACBZbM/pNunpNAYJWZlJRgd4/XGhFFPGD93
         vePV//vFA1rGKA5b/XiNc53OD23YhftF8/p5QwIAXnwODvbvvmLpS4QWNYhI/m6F4KDb
         otFFp3gn4f2aFls6p2yyU46BxnK67YAmgY4bVgXQOf3VsR5xm41yMFlJ/uI1G5QAmQ9E
         mmf/nQIWl5NJXBZk/GF6dtKMorrvrTisTdaCQxNmPZiv28O8YFQ76GlSy37pSHv3Zg/F
         7RIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWccoaX3oQj8W8IZ0XJ0xzW9WkY2b5g278R0KXZnhuqFQN8ISJ/+PFoLKn0+lRVApobvoJFffwI3eE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhE40IPAfRPg5MTYpI/WPn5Uz5pB+jOmmVbTYWYino8hE32Rbk
	4xlozqg/3/p0MLSeXbSKFNjNj+NVXx7DZO4ToYsaMdFLU1FS4oTKo/sK7hY8yVBLaYE=
X-Gm-Gg: ASbGncvMrVFb397Sz/rVGWMrDYE1fzogpYsZhc2Dr8DlmCgFf1+KN26LgjTABSHAf//
	H5SVx3XNKzNxzDN93QI7TKltmG0fS+fGFgdI2ZQOB2+uFP9IGNWUVPu8sQpNVwuyd2PIHWo+dMt
	4N82rb+sbXMcvf89ZrCJQP0qy3qpQNZZQKXhG5dq4zUnq4Y2CxQ6JuLDzdROYHi5+zD0QJ3p296
	73oXBpODFvn+ZG+/+t1hSM9groREUrd0NlrHqyUgllAFUxvTXdyHdHnLGKvuuCdb5Q4BYewmA4s
	43Q2pe2s/kqy3z2oRWjtQ5+pngG5K+p4DR2GU2mHoCRUrOesQ4WU6jGcX90yNdCwW452a+WqYtT
	MZ0iQNw==
X-Google-Smtp-Source: AGHT+IFnue5hc35VVNgvb+VArzqO/xMlK9wQa6Q2rScaAFY6GDOjKfFaMoYtpeOxRfR6atMZBXHMzQ==
X-Received: by 2002:a5d:5f8b:0:b0:3a4:e0e1:8dc8 with SMTP id ffacd0b85a97d-3a53319cb6emr4791148f8f.9.1749564401173;
        Tue, 10 Jun 2025 07:06:41 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244df06sm12734469f8f.69.2025.06.10.07.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:06:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 10 Jun 2025 16:05:53 +0200
Subject: [PATCH v6 15/17] drm/msm/dpu: Implement CTL_PIPE_ACTIVE for v12.0
 DPU
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-b4-sm8750-display-v6-15-ee633e3ddbff@linaro.org>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
In-Reply-To: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
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
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6580;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=PDdJg5qIS7HbPoHRu893zZjvEEa3IuzpHJO/F1Hc654=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSDvMj11z6OwjHQNIAPJQ3fXNkq2xWlp9svl9k
 1pofTOhOXOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEg7zAAKCRDBN2bmhouD
 1/mRD/9fsunALr5xCqYqRm1+udEXhJyuzA6VBVaxqH36ReMkUZmNkTtGNZ5l5Bkv1AXIaRw98aT
 xStOZ0TJ1wpjKwGkcOnYZ1ocBgKQabXSYrGe/bMRcrkLW96WcvZrzKXsaZz1uMiCn9HKUh/ZhrI
 UleqjsoasJPBeWWkWFgbeWUgriFkpxpQy9vw3M9Q6oMFjlzPlqiNEssXcZMZpQWIlJD40XPQl7o
 92G2z5hfXZn5XQWtstlQzp01i5+2pvLONcDjvfbAptVVhPHXkMqleVJsMCjr21b9UbDtTE3IomF
 hewtTpeGEE5ADFDtmqB20bb85WUvqPYksxzlQHRGhx++xNdJ/DCVv0SOL/KHOt8BdE+nL7zv+90
 qaC9z7ywNg3NM449nP7Bv3TDEfd/R4bUc/9KctsX2EFAv0VME/OdkzML5/czCqRBcSEAcA3PBz2
 M8nXXk+9kloa+Sd2w87pbKQToYTfmhL37mVvsDaTFW1xdc8HJXUfbGcmHJYmuCe65/GjBFpFFz1
 2mV3fKYv4C3pQ04PiNwl2kA14e/blcPmzLdNbsqpRTFmCv0PcvWoF5dR3x0PsoIMT9mni2bAo30
 HjtvO14oNWMPN975mal2ojmvqppLb2o5dCUXDjHyiv0luugrGYODx0epiMGNCkx0bI+Z7g9quHF
 VkNSkYypmckAJlQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

v12.0 DPU on SM8750 comes with new CTL_PIPE_ACTIVE register for
selective activation of pipes, which replaces earlier
dpu_hw_ctl_setup_blendstage() code path for newer devices.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v4:
1. Lowercase hex
2. Add Dmitry's tag

Changes in v3:
1. New patch, split from previous big DPU v12.0.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  9 +++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  3 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c  | 29 +++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h  |  8 ++++++++
 4 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 5e986640c8ce5b49d0ce2f91cc47f677a2e3f061..50897de0ab55c2d8dc2e6547b9f3a033a3ca9b45 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -453,8 +453,10 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	u32 lm_idx;
 	bool bg_alpha_enable = false;
 	DECLARE_BITMAP(active_fetch, SSPP_MAX);
+	DECLARE_BITMAP(active_pipes, SSPP_MAX);
 
 	memset(active_fetch, 0, sizeof(active_fetch));
+	memset(active_pipes, 0, sizeof(active_pipes));
 	drm_atomic_crtc_for_each_plane(plane, crtc) {
 		state = plane->state;
 		if (!state)
@@ -472,6 +474,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 			bg_alpha_enable = true;
 
 		set_bit(pstate->pipe.sspp->idx, active_fetch);
+		set_bit(pstate->pipe.sspp->idx, active_pipes);
 		_dpu_crtc_blend_setup_pipe(crtc, plane,
 					   mixer, cstate->num_mixers,
 					   pstate->stage,
@@ -480,6 +483,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 
 		if (pstate->r_pipe.sspp) {
 			set_bit(pstate->r_pipe.sspp->idx, active_fetch);
+			set_bit(pstate->r_pipe.sspp->idx, active_pipes);
 			_dpu_crtc_blend_setup_pipe(crtc, plane,
 						   mixer, cstate->num_mixers,
 						   pstate->stage,
@@ -503,6 +507,9 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	if (ctl->ops.set_active_fetch_pipes)
 		ctl->ops.set_active_fetch_pipes(ctl, active_fetch);
 
+	if (ctl->ops.set_active_pipes)
+		ctl->ops.set_active_pipes(ctl, active_pipes);
+
 	_dpu_crtc_program_lm_output_roi(crtc);
 }
 
@@ -529,6 +536,8 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 					mixer[i].lm_ctl);
 		if (mixer[i].lm_ctl->ops.set_active_fetch_pipes)
 			mixer[i].lm_ctl->ops.set_active_fetch_pipes(mixer[i].lm_ctl, NULL);
+		if (mixer[i].lm_ctl->ops.set_active_pipes)
+			mixer[i].lm_ctl->ops.set_active_pipes(mixer[i].lm_ctl, NULL);
 	}
 
 	/* initialize stage cfg */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index c0ed110a7d30fa1282676e3ae4c9f1316a3a3bf1..a52d5a74759ed9b1b12a0f00ee2417d9ee37fef9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2197,6 +2197,9 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
 
 		if (ctl->ops.set_active_fetch_pipes)
 			ctl->ops.set_active_fetch_pipes(ctl, NULL);
+
+		if (ctl->ops.set_active_pipes)
+			ctl->ops.set_active_pipes(ctl, NULL);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index fe4fdfb8774b176fb024d76dc0bd269d9736d226..4299e94351d5e5371a86608f5ec1246f0cbe4290 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -42,6 +42,7 @@
 #define   CTL_INTF_FLUSH                0x110
 #define   CTL_CDM_FLUSH                0x114
 #define   CTL_PERIPH_FLUSH              0x128
+#define   CTL_PIPE_ACTIVE               0x12c
 #define   CTL_INTF_MASTER               0x134
 #define   CTL_DSPP_n_FLUSH(n)           ((0x13C) + ((n) * 4))
 
@@ -681,6 +682,9 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	if (ctx->ops.set_active_fetch_pipes)
 		ctx->ops.set_active_fetch_pipes(ctx, NULL);
 
+	if (ctx->ops.set_active_pipes)
+		ctx->ops.set_active_pipes(ctx, NULL);
+
 	if (cfg->intf) {
 		intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
 		intf_active &= ~BIT(cfg->intf - INTF_0);
@@ -737,6 +741,23 @@ static void dpu_hw_ctl_set_active_fetch_pipes(struct dpu_hw_ctl *ctx,
 	DPU_REG_WRITE(&ctx->hw, CTL_FETCH_PIPE_ACTIVE, val);
 }
 
+static void dpu_hw_ctl_set_active_pipes(struct dpu_hw_ctl *ctx,
+					unsigned long *active_pipes)
+{
+	int i;
+	u32 val = 0;
+
+	if (active_pipes) {
+		for (i = 0; i < SSPP_MAX; i++) {
+			if (test_bit(i, active_pipes) &&
+			    fetch_tbl[i] != CTL_INVALID_BIT)
+				val |= BIT(fetch_tbl[i]);
+		}
+	}
+
+	DPU_REG_WRITE(&ctx->hw, CTL_PIPE_ACTIVE, val);
+}
+
 /**
  * dpu_hw_ctl_init() - Initializes the ctl_path hw driver object.
  * Should be called before accessing any ctl_path register.
@@ -800,8 +821,12 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 	c->ops.trigger_pending = dpu_hw_ctl_trigger_pending;
 	c->ops.reset = dpu_hw_ctl_reset_control;
 	c->ops.wait_reset_status = dpu_hw_ctl_wait_reset_status;
-	c->ops.clear_all_blendstages = dpu_hw_ctl_clear_all_blendstages;
-	c->ops.setup_blendstage = dpu_hw_ctl_setup_blendstage;
+	if (mdss_ver->core_major_ver < 12) {
+		c->ops.clear_all_blendstages = dpu_hw_ctl_clear_all_blendstages;
+		c->ops.setup_blendstage = dpu_hw_ctl_setup_blendstage;
+	} else {
+		c->ops.set_active_pipes = dpu_hw_ctl_set_active_pipes;
+	}
 	c->ops.update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
 	c->ops.update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
 	if (mdss_ver->core_major_ver >= 7)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index 9cd9959682c21cc1c6d8d14b8fb377deb33cc10d..ca8f34ff3964c1adaaacdd3f0a60572da53870e1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -258,6 +258,14 @@ struct dpu_hw_ctl_ops {
 
 	void (*set_active_fetch_pipes)(struct dpu_hw_ctl *ctx,
 		unsigned long *fetch_active);
+
+	/**
+	 * Set active pipes attached to this CTL
+	 * @ctx: ctl path ctx pointer
+	 * @active_pipes: bitmap of enum dpu_sspp
+	 */
+	void (*set_active_pipes)(struct dpu_hw_ctl *ctx,
+				 unsigned long *active_pipes);
 };
 
 /**

-- 
2.45.2


