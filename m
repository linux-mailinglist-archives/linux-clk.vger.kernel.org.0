Return-Path: <linux-clk+bounces-652-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5BB7FDFE0
	for <lists+linux-clk@lfdr.de>; Wed, 29 Nov 2023 19:59:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A876728320B
	for <lists+linux-clk@lfdr.de>; Wed, 29 Nov 2023 18:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49A8B5DF27;
	Wed, 29 Nov 2023 18:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZAbQVSP9"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10CD2D71
	for <linux-clk@vger.kernel.org>; Wed, 29 Nov 2023 10:59:42 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a00f67f120aso12106366b.2
        for <linux-clk@vger.kernel.org>; Wed, 29 Nov 2023 10:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701284380; x=1701889180; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/EYvH2o2FDAOc1jBHzE94w2pt5/T4uUYkpgbUck9NPc=;
        b=ZAbQVSP94l6zdgg71Dj8Pdt8xPJOp9nkse7UIdx+wZgoKLH5cF5kdHGoIPn78DD9/+
         smvZxjzc3rI6oB0mZb2ESaNAN40b6ndetm/jCzNqNco74Yj5fwBGWEahZz1FyJFtbpk+
         UL0mQWcU4j6ZIKBogG8tmPtQuNPcZOJReMxfWpG0xa3dgGJdgP/OkoKDxdWpJ7u69N20
         pxj0P2SGZbiBMZ3hWBwSUvLMBNwcsUBQiP3nBC+qPMSQjWIFH/IpaSNWGfbZEPiFGpwg
         putAiPAx4Gs5q55BI3PneqFPBMGP0bXYVtm1fhVUHRavbiS4xcVbPnmjeEVbOeRsmjLx
         g7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701284380; x=1701889180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/EYvH2o2FDAOc1jBHzE94w2pt5/T4uUYkpgbUck9NPc=;
        b=luW+sdcI3n7e+zKqLvFYzoYBfDuKCL+CXAe/HsPakfJ38RUBZuKDNEZoJtS/3BOctW
         n8orGwo+V4wC58p5W2xwvcR/IzhwiZPqL5Wj91qzZVjyTBxF+4aSdotT/0szrDpFBqvl
         G6CxLBRmOs8MJUfwFQvvs004wiCvxkfCNNOmJ7paHnOPN66f5+4MQzFUwZSloBzJ/ClU
         HIIbx5/oVydVa4S3V2X8ziUFGgd2TsG1XJOrCikc7P5QHizjRlkQJUL0cTYk60Tr4ChM
         Vf6ZvU6EgUvfbpo/CXVuhFaak4AqYfDC2ZzZroOQuvv69pkk1x1YP1O8qmXVj2SwE6MX
         94Kg==
X-Gm-Message-State: AOJu0YyzjQQyedFKZjOzyhwHUf8EiXhYVTlpil2BBi7Aa5GzF+0Qgwrn
	BK2BrwPb3LeN9cLzaRtWZF0ksw==
X-Google-Smtp-Source: AGHT+IHnwydVDMEGbarq/ML2PKUrinCaUPdXE9gNOoO6r4th3lvOOKzKYtnqfiDvDEvz7p2OTc5iDQ==
X-Received: by 2002:a17:906:2659:b0:9c6:9342:1459 with SMTP id i25-20020a170906265900b009c693421459mr14090995ejc.20.1701284380460;
        Wed, 29 Nov 2023 10:59:40 -0800 (PST)
Received: from [10.167.154.1] (178235187166.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.166])
        by smtp.gmail.com with ESMTPSA id o11-20020a1709061d4b00b009faca59cf38sm8160232ejh.182.2023.11.29.10.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 10:59:40 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 29 Nov 2023 19:59:26 +0100
Subject: [PATCH v2 07/15] clk: qcom: gpucc-sm6115: Add runtime PM
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230717-topic-branch_aon_cleanup-v2-7-2a583460ef26@linaro.org>
References: <20230717-topic-branch_aon_cleanup-v2-0-2a583460ef26@linaro.org>
In-Reply-To: <20230717-topic-branch_aon_cleanup-v2-0-2a583460ef26@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701284367; l=2049;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=wo6RqwrpI+TvZGgUHlprTgAEXXwaEB8xXAWdfaiQ80I=;
 b=5sNZ4fs0hGm079Nd1/queDozn73YeqMcTog04Up3RSBebWyseWuWWiVed4cA+E+SBYqs2UAy+
 p/OOqMgizeyCZBR8nfDyP/yh5VefKtJAt7THnWS8+fzIp3TK3aOGdm1
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The GPU_CC block on SM6115 is powered by the VDD_CX rail. We need to
ensure that CX is enabled to prevent unwanted power collapse and that
the reference is dropped when unused so that the system can enter a
firmware-managed lower power state.

Enable runtime PM to keep the power flowing only when necessary.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gpucc-sm6115.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sm6115.c b/drivers/clk/qcom/gpucc-sm6115.c
index 93a50431aef8..b50979ce1cbe 100644
--- a/drivers/clk/qcom/gpucc-sm6115.c
+++ b/drivers/clk/qcom/gpucc-sm6115.c
@@ -8,6 +8,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,sm6115-gpucc.h>
@@ -443,10 +444,21 @@ MODULE_DEVICE_TABLE(of, gpu_cc_sm6115_match_table);
 static int gpu_cc_sm6115_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap;
+	int ret;
+
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret)
+		return ret;
 
 	regmap = qcom_cc_map(pdev, &gpu_cc_sm6115_desc);
-	if (IS_ERR(regmap))
+	if (IS_ERR(regmap)) {
+		pm_runtime_put(&pdev->dev);
 		return PTR_ERR(regmap);
+	}
 
 	clk_alpha_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
 	clk_alpha_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
@@ -461,7 +473,10 @@ static int gpu_cc_sm6115_probe(struct platform_device *pdev)
 	qcom_branch_set_clk_en(regmap, 0x1078); /* GPU_CC_AHB_CLK */
 	qcom_branch_set_clk_en(regmap, 0x1060); /* GPU_CC_GX_CXO_CLK */
 
-	return qcom_cc_really_probe(pdev, &gpu_cc_sm6115_desc, regmap);
+	ret = qcom_cc_really_probe(pdev, &gpu_cc_sm6115_desc, regmap);
+	pm_runtime_put(&pdev->dev);
+
+	return ret;
 }
 
 static struct platform_driver gpu_cc_sm6115_driver = {

-- 
2.43.0


