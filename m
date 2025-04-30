Return-Path: <linux-clk+bounces-21214-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B64AA4CF6
	for <lists+linux-clk@lfdr.de>; Wed, 30 Apr 2025 15:12:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF7771B64A87
	for <lists+linux-clk@lfdr.de>; Wed, 30 Apr 2025 13:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D188A27F74D;
	Wed, 30 Apr 2025 13:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t/zOcfNf"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE4227E7D6
	for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 13:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018122; cv=none; b=QQG52TyhdNETDmgh5m0ZXWYoXoDv1bKLKVNCxJZajKetB10eMfxKcFrdb9ZfxUg3vpZKOBGqHsIHfCvDJ28uqPkCTk14pPhmyP9VJK6piD+pyckj88z/X5TJFMuM/Jxg3U0HlCP67r2xrf/xh6vtXUNj1gHt4f0LP8cMlml2m/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018122; c=relaxed/simple;
	bh=3e54wA8aqQN+E6w44PaExnrYmkR+KjEIhfnRbipAyRM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XBqEHqQzNCp0bEsqgKmJv7XA9HUpV5hwlobNyg2G9h+FzzEn1Mft8ozUDHqBHlDWcO/jM2NiMIfCUKIeB68LGb3u3TVhLOS2SuYPrzbWv2fbysmx060+WHx3o0c0IHGVSdvI2dGs4mgVVOpD8VjfYiIAoAbKPcKXYpYnXZGw19I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t/zOcfNf; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c2688e2bbso483710f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 06:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746018118; x=1746622918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5+MDPguozj+eCC9e25K7sO+Bjo/lqsG1BvOCa2Y7aHk=;
        b=t/zOcfNf8rxFZXcAli3eXou84p2jWkrq1uXVBtOhhZLMDOPUt1Wqnd8EsEGGksGLdj
         kjfF9U+OWzC+wqKvcCSC7yCs6eDKgn3wH0uep//S+eLo97WKqvrDrDrRlsoCrm4VyPXG
         239Uj9Bj0P1BE4462pcBtNSKUQNFgMqwZT7L+d2hEXV2PrBCIJRQPhnl5g8x35xjWB58
         5R8othD25oxi+b5npakPATUqYluiffXVpgbiAUfAIdFMeY1/lfNaiwaQzmdVqkmv6IOB
         PpeAStZHhqmtoFcFJgDMavsRc+nL1RZ8aazIuE6Ap0nYd4yQwxw3002euhhkmLLH9PLY
         z2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746018118; x=1746622918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5+MDPguozj+eCC9e25K7sO+Bjo/lqsG1BvOCa2Y7aHk=;
        b=FgjC9JX8FXXlGq22BxAzCpTBgBspkneed0Ebj9+H2euWucKD6I5WYrZvO+aGLDwZnx
         lu+ajBmJxwuirJ34GPytte7nGByZByYvSOMVUa2DK2p24cyaOIZHWm6AqifjS8bdJYom
         CA5prDsvRnBBs0yZb0S/ddtV4E6NLwuwrqyaVVAFSi6hojsvWoMxhh0f1yvn5Z5u9WIv
         ycYQqy1YH2VhGgDYcYC/C8561FPhaJ2ih5DjETnjtxHauicM3HiWvijMSOufokalw/1b
         6H9DCsKoDnoRlJ/IxoIjK5c2Bplk20NKnE5uknVcBgMQhHGQzWHWpCfCL0sYkrXbO3OK
         r9Uw==
X-Forwarded-Encrypted: i=1; AJvYcCU9+iPX/YC1HnjBC6zNsAZj7/1nmpGfnjXIumD2OHM4n9hyfZ6mCPu0jiPJU9pR+R2fURoA+x02qp8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT5ou5Dn8jfeMdLPRBDvTyzZz4OqgUg497s9gTSOHpvmjS0wh8
	H7qmjVqcEZxr+3HUhXziz+zC9K0rTpFaAX/r+ZKag3t7we8axeiPr6+P6Ia8kxU=
X-Gm-Gg: ASbGncvwyTkzatJGt8VK3ye7BXRmMWQMjNIIZK90A0s7vaO8T42yNPD9+Z9UIGsqu4R
	tfeFU+WWQMvZUN4DtZHvza6rDbZ5XMrTOh0ePKZP5xJQeCt2Pnpy4ZxaXMfj0pI2nFFbBqaoSXj
	YDGw0Mysm2/OVYhWZFhwqAIMlLGlivfcc3YJCS+DTG3Bfx5x4ckFlnxsmk/JbndDcHpbuTMZcK9
	Ts5A9wVZ+FGS3v4FpV7rpxrNw1hFO0zxWodN3MJ9Q57/NTcMvnq4BAtX2OKckmGPn0Xyvn7vdyo
	kNdARoKyMwVncv63lIXVsHxf+7o8l9i83jbbm5eR9/bo8kKmY+vgWwMatNU=
X-Google-Smtp-Source: AGHT+IFlt244hqEhWjxrQLdaufn8eCDuKqQ6l6DQ2EGA1ZreF6dz9H0/mMWoaknb+jsJXHz/JRWOWQ==
X-Received: by 2002:a05:6000:1ac5:b0:386:3a50:8c52 with SMTP id ffacd0b85a97d-3a08ff7241amr706803f8f.7.1746018118307;
        Wed, 30 Apr 2025 06:01:58 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 06:01:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:53 +0200
Subject: [PATCH v5 23/24] drm/msm/dpu: Implement LM crossbar for v12.0 DPU
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-23-8cab30c3e4df@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12899;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=3e54wA8aqQN+E6w44PaExnrYmkR+KjEIhfnRbipAyRM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh8Oxbbk6zNyBJlzrFn2t4de7KC9ICxpmcTAa
 8coaQl9eqeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIfDgAKCRDBN2bmhouD
 12mOEACZEA2MIGFr4FBn018leO0WSyZEWvfI+517w9cGKykPJIkzhRGYxT8Ve/mgnXHFzd/BxWx
 7jRFMzYyuKhXJTWxF6dx6ysksdLJc4qtQeKcIjjsBU2FxevRLqX9Cc/81vLPlY/UbbvqJJXVqSe
 B+BC4Su3Rw/heJE/oal7F0oegOnse009kVapwxNZUvhtCDToM/8OQl1YfdzqGXV+fDvA4nWpXVP
 4TlPRHd8yarjk9btoo6iUQWPgcT6WLb4kj1B9oVliELETa9V1eCosldneIO8zC390w6+HmYEhWd
 thzwaEBm+gusq56uDAa53da0XPCQSO2vuK20+fcIgPW872JY4hjEUosDpaD4NRCewbceymc5QzS
 z7lCBiacJ7GlYKDzOURXWa1oHzTjk7NEd7PZ4cSFMZsfHJFZ9ZV3R8tIeEjtuhqH3DWFnHyFdhg
 K3a84I0SR5LSOjZGIercxAoA6209pesmDHl40o22wCmURuwZ1QA30yz6oj6UtxxlKc7rgyLtv0V
 1BirYemBuRBPAxl/5DjSOjF3T2B0NlSAARxHJ4u5X9YEhcm4HPH+308HGDlYnV6I8n4BU3jJsdn
 JVSrsSn5b2iIGsklT5iYlwhNhG4j/8wtGNcYcJb3LCYSY1qkexm1ecftToW4VrxWD/c1BzN5j3b
 4+JktG/ZzsKo7Ow==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

v12.0 DPU on SM8750 comes with new LM crossbar that requires each pipe
rectangle to be programmed separately in blend stage.  Implement support
for this along with a new CTL_LAYER_ACTIVE register and setting the
blend stage in layer mixer code.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v4:
1. Lowercase hex
2. Add Dmitry's tag

Changes in v3:
1. New patch, split from previous big DPU v12.0.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  18 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |   6 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c  |  27 +++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h  |   9 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   | 126 ++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h   |  18 ++++
 6 files changed, 201 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 3135e5ab9e8121f3dbd93dde9458f007ae45392a..bde87533b4b39ac99998740f7ec6cc59ea96e705 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -524,6 +524,7 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 	struct dpu_hw_ctl *ctl;
 	struct dpu_hw_mixer *lm;
 	struct dpu_hw_stage_cfg stage_cfg;
+	DECLARE_BITMAP(active_lms, LM_MAX);
 	int i;
 
 	DRM_DEBUG_ATOMIC("%s\n", dpu_crtc->name);
@@ -537,10 +538,14 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 			mixer[i].lm_ctl->ops.set_active_fetch_pipes(mixer[i].lm_ctl, NULL);
 		if (mixer[i].lm_ctl->ops.set_active_pipes)
 			mixer[i].lm_ctl->ops.set_active_pipes(mixer[i].lm_ctl, NULL);
+
+		if (mixer[i].hw_lm->ops.clear_all_blendstages)
+			mixer[i].hw_lm->ops.clear_all_blendstages(mixer[i].hw_lm);
 	}
 
 	/* initialize stage cfg */
 	memset(&stage_cfg, 0, sizeof(struct dpu_hw_stage_cfg));
+	memset(active_lms, 0, sizeof(active_lms));
 
 	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, &stage_cfg);
 
@@ -554,13 +559,22 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 		ctl->ops.update_pending_flush_mixer(ctl,
 			mixer[i].hw_lm->idx);
 
+		set_bit(lm->idx, active_lms);
+		if (ctl->ops.set_active_lms)
+			ctl->ops.set_active_lms(ctl, active_lms);
+
 		DRM_DEBUG_ATOMIC("lm %d, op_mode 0x%X, ctl %d\n",
 			mixer[i].hw_lm->idx - LM_0,
 			mixer[i].mixer_op_mode,
 			ctl->idx - CTL_0);
 
-		ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
-			&stage_cfg);
+		if (ctl->ops.setup_blendstage)
+			ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
+						  &stage_cfg);
+
+		if (lm->ops.setup_blendstage)
+			lm->ops.setup_blendstage(lm, mixer[i].hw_lm->idx,
+						 &stage_cfg);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 52ae79fe8ba8537b13948d924b68e39c5ff4c753..516cfaa31b99136c82659e9060dc1929e6271862 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2191,6 +2191,12 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
 		if (ctl->ops.setup_blendstage)
 			ctl->ops.setup_blendstage(ctl, hw_mixer[i]->idx, NULL);
 
+		if (hw_mixer[i]->ops.clear_all_blendstages)
+			hw_mixer[i]->ops.clear_all_blendstages(hw_mixer[i]);
+
+		if (ctl->ops.set_active_lms)
+			ctl->ops.set_active_lms(ctl, NULL);
+
 		if (ctl->ops.set_active_fetch_pipes)
 			ctl->ops.set_active_fetch_pipes(ctl, NULL);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index c9c65d5e9d36d3a4ce2aef9f57da631f2acd9123..2f9713227c287ffcfd6bedff7bad14cf8df6eb30 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -43,6 +43,7 @@
 #define   CTL_CDM_FLUSH                0x114
 #define   CTL_PERIPH_FLUSH              0x128
 #define   CTL_PIPE_ACTIVE               0x12c
+#define   CTL_LAYER_ACTIVE              0x130
 #define   CTL_INTF_MASTER               0x134
 #define   CTL_DSPP_n_FLUSH(n)           ((0x13C) + ((n) * 4))
 
@@ -65,6 +66,8 @@ static const u32 fetch_tbl[SSPP_MAX] = {CTL_INVALID_BIT, 16, 17, 18, 19,
 	CTL_INVALID_BIT, CTL_INVALID_BIT, CTL_INVALID_BIT, CTL_INVALID_BIT, 0,
 	1, 2, 3, 4, 5};
 
+static const u32 lm_tbl[LM_MAX] = {CTL_INVALID_BIT, 0, 1, 2, 3, 4, 5, 6, 7};
+
 static int _mixer_stages(const struct dpu_lm_cfg *mixer, int count,
 		enum dpu_lm lm)
 {
@@ -672,7 +675,11 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 				merge3d_active);
 	}
 
-	dpu_hw_ctl_clear_all_blendstages(ctx);
+	if (ctx->ops.clear_all_blendstages)
+		ctx->ops.clear_all_blendstages(ctx);
+
+	if (ctx->ops.set_active_lms)
+		ctx->ops.set_active_lms(ctx, NULL);
 
 	if (ctx->ops.set_active_fetch_pipes)
 		ctx->ops.set_active_fetch_pipes(ctx, NULL);
@@ -745,6 +752,23 @@ static void dpu_hw_ctl_set_active_pipes(struct dpu_hw_ctl *ctx,
 	DPU_REG_WRITE(&ctx->hw, CTL_PIPE_ACTIVE, val);
 }
 
+static void dpu_hw_ctl_set_active_lms(struct dpu_hw_ctl *ctx,
+				      unsigned long *active_lms)
+{
+	int i;
+	u32 val = 0;
+
+	if (active_lms) {
+		for (i = LM_0; i < LM_MAX; i++) {
+			if (test_bit(i, active_lms) &&
+			    lm_tbl[i] != CTL_INVALID_BIT)
+				val |= BIT(lm_tbl[i]);
+		}
+	}
+
+	DPU_REG_WRITE(&ctx->hw, CTL_LAYER_ACTIVE, val);
+}
+
 /**
  * dpu_hw_ctl_init() - Initializes the ctl_path hw driver object.
  * Should be called before accessing any ctl_path register.
@@ -812,6 +836,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 		c->ops.setup_blendstage = dpu_hw_ctl_setup_blendstage;
 	} else {
 		c->ops.set_active_pipes = dpu_hw_ctl_set_active_pipes;
+		c->ops.set_active_lms = dpu_hw_ctl_set_active_lms;
 	}
 	c->ops.update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
 	c->ops.update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index 186c467e1a64e71116b65b19dd8ecdbb09dac114..f9197d3f12a30d9ce2a4b3745353e35b645563c5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -264,6 +264,15 @@ struct dpu_hw_ctl_ops {
 	 */
 	void (*set_active_pipes)(struct dpu_hw_ctl *ctx,
 				 unsigned long *active_pipes);
+
+	/**
+	 * Set active layer mixers attached to this CTL
+	 * @ctx: ctl path ctx pointer
+	 * @active_lms: bitmap of enum dpu_lm
+	 */
+	void (*set_active_lms)(struct dpu_hw_ctl *ctx,
+			       unsigned long *active_lms);
+
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index f220a68e138cb9e7c88194e53e47391de7ed04f7..d5928c7cecc818d8d8f85c3cfff4d79794eab1d4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -28,11 +28,19 @@
 #define LM_FG_COLOR_FILL_XY              0x14
 
 /* >= v12 DPU */
+#define LM_BG_SRC_SEL_V12                0x14
+#define LM_BG_SRC_SEL_V12_RESET_VALUE    0x0000c0c0
 #define LM_BORDER_COLOR_0_V12            0x1c
 #define LM_BORDER_COLOR_1_V12            0x20
 
 /* >= v12 DPU with offset to mixer base + stage base */
+#define LM_BLEND0_FG_SRC_SEL_V12         0x04
 #define LM_BLEND0_CONST_ALPHA_V12        0x08
+#define LM_FG_COLOR_FILL_COLOR_0_V12     0x0c
+#define LM_FG_COLOR_FILL_COLOR_1_V12     0x10
+#define LM_FG_COLOR_FILL_SIZE_V12        0x14
+#define LM_FG_COLOR_FILL_XY_V12          0x18
+
 #define LM_BLEND0_FG_ALPHA               0x04
 #define LM_BLEND0_BG_ALPHA               0x08
 
@@ -215,6 +223,122 @@ static void dpu_hw_lm_setup_color3_v12(struct dpu_hw_mixer *ctx,
 	}
 }
 
+static int _set_staged_sspp(u32 stage, struct dpu_hw_stage_cfg *stage_cfg,
+			    int pipes_per_stage, u32 *value)
+{
+	int i;
+	u32 pipe_type = 0, pipe_id = 0, rec_id = 0;
+	u32 src_sel[PIPES_PER_STAGE];
+
+	*value = LM_BG_SRC_SEL_V12_RESET_VALUE;
+	if (!stage_cfg || !pipes_per_stage)
+		return 0;
+
+	for (i = 0; i < pipes_per_stage; i++) {
+		enum dpu_sspp pipe = stage_cfg->stage[stage][i];
+		enum dpu_sspp_multirect_index rect_index = stage_cfg->multirect_index[stage][i];
+
+		src_sel[i] = LM_BG_SRC_SEL_V12_RESET_VALUE;
+
+		if (!pipe)
+			continue;
+
+		/* translate pipe data to SWI pipe_type, pipe_id */
+		if (pipe >= SSPP_DMA0 && pipe <= SSPP_DMA5) {
+			pipe_type = 0;
+			pipe_id = pipe - SSPP_DMA0;
+		} else if (pipe >= SSPP_VIG0 && pipe <= SSPP_VIG3) {
+			pipe_type = 1;
+			pipe_id = pipe - SSPP_VIG0;
+		} else {
+			DPU_ERROR("invalid rec-%d pipe:%d\n", i, pipe);
+			return -EINVAL;
+		}
+
+		/* translate rec data to SWI rec_id */
+		if (rect_index == DPU_SSPP_RECT_SOLO || rect_index == DPU_SSPP_RECT_0) {
+			rec_id = 0;
+		} else if (rect_index == DPU_SSPP_RECT_1) {
+			rec_id = 1;
+		} else {
+			DPU_ERROR("invalid rec-%d rect_index:%d\n", i, rect_index);
+			rec_id = 0;
+		}
+
+		/* calculate SWI value for rec-0 and rec-1 and store it temporary buffer */
+		src_sel[i] = (((pipe_type & 0x3) << 6) | ((rec_id & 0x3) << 4) | (pipe_id & 0xf));
+	}
+
+	/* calculate final SWI register value for rec-0 and rec-1 */
+	*value = 0;
+	for (i = 0; i < pipes_per_stage; i++)
+		*value |= src_sel[i] << (i * 8);
+
+	return 0;
+}
+
+static int dpu_hw_lm_setup_blendstage(struct dpu_hw_mixer *ctx, enum dpu_lm lm,
+				      struct dpu_hw_stage_cfg *stage_cfg)
+{
+	struct dpu_hw_blk_reg_map *c = &ctx->hw;
+	int i, ret, stages, stage_off, pipes_per_stage;
+	u32 value;
+
+	stages = ctx->cap->sblk->maxblendstages;
+	if (stages <= 0)
+		return -EINVAL;
+
+	if (ctx->cap->sourcesplit)
+		pipes_per_stage = PIPES_PER_STAGE;
+	else
+		pipes_per_stage = 1;
+
+	/*
+	 * When stage configuration is empty, we can enable the
+	 * border color by setting the corresponding LAYER_ACTIVE bit
+	 * and un-staging all the pipes from the layer mixer.
+	 */
+	if (!stage_cfg)
+		DPU_REG_WRITE(c, LM_BG_SRC_SEL_V12, LM_BG_SRC_SEL_V12_RESET_VALUE);
+
+	for (i = DPU_STAGE_0; i <= stages; i++) {
+		stage_off = _stage_offset(ctx, i);
+		if (stage_off < 0)
+			return stage_off;
+
+		ret = _set_staged_sspp(i, stage_cfg, pipes_per_stage, &value);
+		if (ret)
+			return ret;
+
+		DPU_REG_WRITE(c, LM_BLEND0_FG_SRC_SEL_V12 + stage_off, value);
+	}
+
+	return 0;
+}
+
+static int dpu_hw_lm_clear_all_blendstages(struct dpu_hw_mixer *ctx)
+{
+	struct dpu_hw_blk_reg_map *c = &ctx->hw;
+	int i, stages, stage_off;
+
+	stages = ctx->cap->sblk->maxblendstages;
+	if (stages <= 0)
+		return -EINVAL;
+
+	DPU_REG_WRITE(c, LM_BG_SRC_SEL_V12, LM_BG_SRC_SEL_V12_RESET_VALUE);
+
+	for (i = DPU_STAGE_0; i <= stages; i++) {
+		stage_off = _stage_offset(ctx, i);
+		if (stage_off < 0)
+			return stage_off;
+
+		DPU_REG_WRITE(c, LM_BLEND0_FG_SRC_SEL_V12 + stage_off,
+			      LM_BG_SRC_SEL_V12_RESET_VALUE);
+	}
+
+	return 0;
+}
+
 /**
  * dpu_hw_lm_init() - Initializes the mixer hw driver object.
  * should be called once before accessing every mixer.
@@ -257,6 +381,8 @@ struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
 		c->ops.setup_border_color = dpu_hw_lm_setup_border_color;
 	} else {
 		c->ops.setup_alpha_out = dpu_hw_lm_setup_color3_v12;
+		c->ops.setup_blendstage = dpu_hw_lm_setup_blendstage;
+		c->ops.clear_all_blendstages = dpu_hw_lm_clear_all_blendstages;
 		c->ops.setup_border_color = dpu_hw_lm_setup_border_color_v12;
 	}
 	c->ops.setup_misr = dpu_hw_lm_setup_misr;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
index fff1156add683fec8ce6785e7fe1d769d0de3fe0..1b9ecd082d7fd72b07008787e1caea968ed23376 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
@@ -11,6 +11,7 @@
 #include "dpu_hw_util.h"
 
 struct dpu_hw_mixer;
+struct dpu_hw_stage_cfg;
 
 struct dpu_hw_mixer_cfg {
 	u32 out_width;
@@ -48,6 +49,23 @@ struct dpu_hw_lm_ops {
 	 */
 	void (*setup_alpha_out)(struct dpu_hw_mixer *ctx, uint32_t mixer_op);
 
+	/**
+	 * Clear layer mixer to pipe configuration
+	 * @ctx		: mixer ctx pointer
+	 * Returns: 0 on success or -error
+	 */
+	int (*clear_all_blendstages)(struct dpu_hw_mixer *ctx);
+
+	/**
+	 * Configure layer mixer to pipe configuration
+	 * @ctx		: mixer ctx pointer
+	 * @lm		: layer mixer enumeration
+	 * @stage_cfg	: blend stage configuration
+	 * Returns: 0 on success or -error
+	 */
+	int (*setup_blendstage)(struct dpu_hw_mixer *ctx, enum dpu_lm lm,
+				struct dpu_hw_stage_cfg *stage_cfg);
+
 	/**
 	 * setup_border_color : enable/disable border color
 	 */

-- 
2.45.2


