Return-Path: <linux-clk+bounces-21203-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7252CAA4CC7
	for <lists+linux-clk@lfdr.de>; Wed, 30 Apr 2025 15:09:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D653C9E2E66
	for <lists+linux-clk@lfdr.de>; Wed, 30 Apr 2025 13:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F9F8270556;
	Wed, 30 Apr 2025 13:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XStl3a4L"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F32726B2B1
	for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 13:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018097; cv=none; b=tKhnEsPh9bMkfwL+n9b+T5zboyWvXRTY57ZPmuCSJlU2uzTa8snxwzA+Ug71P/ISTMZehvBNMUIfVb6c71q7ytrM1KaKU5bWrM00iM+6w1pD/Db3bnnfwWZMs0qj6tXtx7qQT80GygW/nDRAAiLjkI+Gce1+EvKN/N7zyTEYs20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018097; c=relaxed/simple;
	bh=FYQmnOteyEsh43W4459/HI5xmvv5foibNDY/l+BCr8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y4COojpuksB3mSRCNdapfToDdt5g4FfTPpncuI9/n4vL4UE52QUKLGD+zcZamj4WwVFKzOS12WP+wTtIR/NNrV+95yH5VWvN9zxX+/uoQgSCdqn8G3Xg5LAzOnZ2Zb+I76P5eTeKrl1K3V81MLq1PctRKkKDRGtBlX8oDKnP3Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XStl3a4L; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39123ad8a9fso492765f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 06:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746018093; x=1746622893; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2UTx8i3tlDwXsUWoT5VcMCQwgrRqwv+71jsU3q5eQlU=;
        b=XStl3a4LarEN60tmHZb1XjVfKxVpEpIUV+CtDU9NoqWYfe25e08X5PGx1TngCTCeSs
         Jo7D/F65XKdHu21Y2JdstAX62b7CfhNp9sPX+ZQwFbbaDYgb4L/Mn5qX1rRtxDl7SsZ9
         3Ecws3hMdo2atL2iF21LiiZgT08npTj92XiiDKFirL7Dz3iZkNJmhvzyGB2vLUj4Xv+c
         sPZ6dpgGHYBQQDDXRTk8j8IGKjMghv8nRnnuJzce0thfnPetjVNT9lTKf+Rqa2ybCF5O
         MdbRGvE6QTXyI1vcbSsb7ft2FM0M8y/SeGvKO+WJU9jiG7xzMZ4MHt/Zww6D1OKWL+yf
         orwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746018093; x=1746622893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2UTx8i3tlDwXsUWoT5VcMCQwgrRqwv+71jsU3q5eQlU=;
        b=SkYBPed/Ht95DJcr7AvxjXcgwSZ4kOVXmQG6EZb2G4shA6WySIcjPhyqDmfJ9IfWBg
         OD1hM1XeHpgoY7EsZTNorKUGwaHxb77yogRGQE6XCHZHorVlC0eQj1JrshSdsdIrmM5G
         Y4rx8pWwTDrXLJQP+fIYQgwFqViBVc8gQYKPNOaTlOdOUJYI8JPpwmnS4k/XqApz1Hy2
         jsRBhACo8IKbABiBqxUQMr8UH6xyEiQ4saHS384yAy6ZThnhWRe5HililSszuaLMVJAr
         t5OUP9LifRigFotlCVj90cL4et6oHQFyjfkXmdmRSqC3xuyjzuhLDpDbCSjEmthbFrhD
         Q7oA==
X-Forwarded-Encrypted: i=1; AJvYcCW3xOU1ODXsQNVXnR+HtqfX7NhEcjYGN+HvgVJ6gF20Vijl9ZEdu8T5dy7Yj70XW6X3GaGH+tcJTxg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRe6RS5qqHCHmPrQaEKq91BkvJnhen0zjoMjb1Y25LQ4w7hGq3
	DhDNrYF1Q6kFTxw0AMVDY1hy3B4JC4Fm25bpR6QSUjGikNqZkjZJMQ8RIyH1xTs=
X-Gm-Gg: ASbGncu+uICfOSl/Mksro4OHI5TNalfVXUIQ0i3pHax/R73TfLW5cNHL4yc3gEmZCFo
	igJ7awDqoJJ24+5DRsGtIUtbDXGUd0Fjwh6OBU4ZxHE9wjYUQ4jZXRz3Q/UHyuvt1bSpmC4tlhd
	Ti4L96NgkZWVdDqzGPyI3j3PFh4N7YL2tpS3O4m635RkiEctffRsju8hxTpPZvJLT5unJ1YGU6Z
	jWvK3Rwq14WW0PYvlPNtPFmyH5U+7AV3NqiGxb4UPdp6n/L1A/YoAPUAGCvPeMERcNDfCJQfPN2
	DK5nqxO11e8SLA012zbkFREY8NDXyHJQRu09LfVbZSpLAHY6XxPnw/cIycE=
X-Google-Smtp-Source: AGHT+IHTVW6h6Ul1dB4RYQ82JlgeupEVs6D5ssmYrEuuWYidHldAYwbLTL4y7ZCltOiWRm2Xax3Xrg==
X-Received: by 2002:a05:6000:40dd:b0:3a0:8b90:1acd with SMTP id ffacd0b85a97d-3a08ff347b3mr843158f8f.0.1746018093445;
        Wed, 30 Apr 2025 06:01:33 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 06:01:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:42 +0200
Subject: [PATCH v5 12/24] drm/msm/dpu: Add LM_7, DSC_[67], PP_[67] and
 MERGE_3D_5
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-12-8cab30c3e4df@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1188;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=FYQmnOteyEsh43W4459/HI5xmvv5foibNDY/l+BCr8Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh8Az8NfK/s+6V+lgG7g1iFiCCXAt5FaCBQoh
 7X6AIKruHWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIfAAAKCRDBN2bmhouD
 12VoD/9ZRMJIrOOLeG7gKh0PkygcJiEgZVQdMe3GNEdLpNLy4r0RSli85RwY+ymOetvLU4LuKJT
 JUcZhQlWry41vKc4N0+1hZkQRp9/O+9vjWt1bRCEEmQClYnT3GShpuMETn02wx3Sh+O4BkrBiA6
 /Xnab/7A9wSeoQDOiUmrtxe3QOKg9+4x6KHFL1b29/cRzZeE8pZcIVP3wi4qNL6U6yqaO0XWGXE
 HYAx1lv9i2vV/oWqPCIa4NJXyf2U/MiLlTit2eFQ3sDRKinHFr/cZBVYPZI5UjxyKlB0YGbdhSm
 e30SkGc11ODeNZvTxpDyOmpSWxzAC+ra6+xRGaTDVXIYp2/Fra+Ji0pBbOvKCXQQPVHlfyHfSgS
 rnMO8QVEO1pb+AacsEkMwoqxQs6TFC3KbRZXC/re+LCdOyts78Q2ReMQLQfSbky1ZX252ZPqS1G
 n9TGueq4YMez+KVlyQIQ+mJgxcOWP0H4daCnIIaSN3DDOom4E0w3QxeNDz8/Gnsufc3JhpzKAeN
 qEYK3a3e/OsB8Licbk0pHc6/ykZvtGeJAr4l60YJbn/Ia1JUMwdazYf4FR6AD+xM0DeVUBh2hdI
 djz2s4hLGCz1jBokqwfI8eQgPJjKdCOMstCPzQ6kNSdJAO8L6yKeKMvkZUevp/bXCcJ46HOBLx9
 ef8Dq4UKRzhyILA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add IDs for new blocks present in MDSS/MDP v12 for LM, DSC, PINGPONG and
MERGE_3D blocks.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 8d820cd1b5545d247515763039b341184e814e32..175639c8bfbb9bbd02ed35f1780bcbd869f08c36 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -125,6 +125,7 @@ enum dpu_lm {
 	LM_4,
 	LM_5,
 	LM_6,
+	LM_7,
 	LM_MAX
 };
 
@@ -169,6 +170,8 @@ enum dpu_dsc {
 	DSC_3,
 	DSC_4,
 	DSC_5,
+	DSC_6,
+	DSC_7,
 	DSC_MAX
 };
 
@@ -185,6 +188,8 @@ enum dpu_pingpong {
 	PINGPONG_3,
 	PINGPONG_4,
 	PINGPONG_5,
+	PINGPONG_6,
+	PINGPONG_7,
 	PINGPONG_CWB_0,
 	PINGPONG_CWB_1,
 	PINGPONG_CWB_2,
@@ -199,6 +204,7 @@ enum dpu_merge_3d {
 	MERGE_3D_2,
 	MERGE_3D_3,
 	MERGE_3D_4,
+	MERGE_3D_5,
 	MERGE_3D_MAX
 };
 

-- 
2.45.2


