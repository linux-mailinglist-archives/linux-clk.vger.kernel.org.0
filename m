Return-Path: <linux-clk+bounces-655-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD097FDFEA
	for <lists+linux-clk@lfdr.de>; Wed, 29 Nov 2023 20:00:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CD361C20E12
	for <lists+linux-clk@lfdr.de>; Wed, 29 Nov 2023 19:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5438B5DF34;
	Wed, 29 Nov 2023 18:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eWXi+Fwk"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60A85198C
	for <linux-clk@vger.kernel.org>; Wed, 29 Nov 2023 10:59:45 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a00a9d677fcso16249166b.0
        for <linux-clk@vger.kernel.org>; Wed, 29 Nov 2023 10:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701284383; x=1701889183; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TfCS7EJc5WZz01BXUAh+J5+ayBuQvlNbLl5dADuNIr0=;
        b=eWXi+FwkEeykvAIkfTJ3q9XLTq63hkmWKRgBD2kWeTzJ1gEKVp39kyT86AKisFlVif
         Z2rPmSrEGWUQnN9qSskLJhN5BAAoF+fO2s05TE7jRSTKUfs1p87A1Y7m4ixGITWetqsj
         NsMmrvXY5oymfqYjOUQqR6VBPyAYB1JkP81tguNTk3JQFahzDiwTW11CcvWzXiEbB6RQ
         xoWijcsfq4OzotzSUIYaFSzzNDYX7TD2+TUpkf0xsFLYCBmsq/f9ghwWkr/RB3aLoufs
         LRJUxMuDjzbXNbvQSbH5zN9yUbTrGXosp20foAyoJ+U1VEvLUBok/pSriwD0/wskfs21
         Q7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701284383; x=1701889183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TfCS7EJc5WZz01BXUAh+J5+ayBuQvlNbLl5dADuNIr0=;
        b=kurt5teOcweqScR3re9rXZ+e/IujelnBqXnb/yD2c61UiB8u1dpYsvo019EVHspZBP
         6PbmdDfEK8nPasOI93KDssB2hHAfvlRmBmacfDQI6U4/Cl7Vcl5ZVP1IJ8Fl+09wrNvG
         fLos5bszGgAd4/w2Cb3pRwrwJGgBYN0FbB93tiecqAwaIenlaxAgvieGSEEJ69Bh64H6
         Ss0cdQuWAAVHmXZBoHUumdcAQYgsG0YbdSoR/Vono+MNA1dRJmKZS/eSU5ERWSxKCuRy
         QT8qpIoOiQ7xUKlLKp4RAB5rHqXrlgOhtOLPTTrOoBppVcL1t6n+yFRaGLXKE0iZdSiS
         7BTQ==
X-Gm-Message-State: AOJu0Yygf+EA223mJ/O0py7JakKWZ9lVE297t/ydKmgJ6WXu43AeNkx6
	nWXHnr1v6faWnzU2jqE7v2ZX8w==
X-Google-Smtp-Source: AGHT+IHdsAEntAPDNPbOmIJ9ctzpXER6XkzToZVGHNKTijCtH9Cu2wlbCO+KcXmcyrZtzhKCEcA++w==
X-Received: by 2002:a17:907:1687:b0:a12:7347:3b5d with SMTP id cx7-20020a170907168700b00a1273473b5dmr4777939ejd.16.1701284383644;
        Wed, 29 Nov 2023 10:59:43 -0800 (PST)
Received: from [10.167.154.1] (178235187166.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.166])
        by smtp.gmail.com with ESMTPSA id o11-20020a1709061d4b00b009faca59cf38sm8160232ejh.182.2023.11.29.10.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 10:59:43 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 29 Nov 2023 19:59:28 +0100
Subject: [PATCH v2 09/15] clk: qcom: gcc-sm6115: Add runtime PM
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230717-topic-branch_aon_cleanup-v2-9-2a583460ef26@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701284367; l=2112;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=qGB7J3P0DJtbWo81wrMojy7eEnHmPOy4px200OELZEk=;
 b=aIRs2rJlONz8naMSqsaqRWgFHG1nnH/4qxSnOHk2nrHC8tiATP5GenS/hkWEDZjLTjFjESVeT
 ii6pxDzgV4WBTZFi8rmYx+KpJrUry8oLFFbRFwabsdeDdzps/0fjRE4
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The GCC block on SM6115 is powered by the VDD_CX rail. We need to ensure
that CX is enabled to prevent unwanted power collapse and that the
reference is dropped when unused so that the system can enter a
firmware-managed lower power state.

Enable runtime PM to keep the power flowing only when necessary.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gcc-sm6115.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm6115.c b/drivers/clk/qcom/gcc-sm6115.c
index 87a2bfe222a3..3e0a3fd09718 100644
--- a/drivers/clk/qcom/gcc-sm6115.c
+++ b/drivers/clk/qcom/gcc-sm6115.c
@@ -9,6 +9,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/clk-provider.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset-controller.h>
 
@@ -3384,14 +3385,26 @@ static int gcc_sm6115_probe(struct platform_device *pdev)
 	struct regmap *regmap;
 	int ret;
 
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret)
+		return ret;
+
 	regmap = qcom_cc_map(pdev, &gcc_sm6115_desc);
-	if (IS_ERR(regmap))
+	if (IS_ERR(regmap)) {
+		pm_runtime_put(&pdev->dev);
 		return PTR_ERR(regmap);
+	}
 
 	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
 			ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
+	if (ret) {
+		pm_runtime_put(&pdev->dev);
 		return ret;
+	}
 
 	clk_alpha_pll_configure(&gpll8, regmap, &gpll8_config);
 	clk_alpha_pll_configure(&gpll9, regmap, &gpll9_config);
@@ -3406,7 +3419,10 @@ static int gcc_sm6115_probe(struct platform_device *pdev)
 	qcom_branch_set_clk_en(regmap, 0x36004); /* GCC_GPU_CFG_AHB_CLK */
 	qcom_branch_set_clk_en(regmap, 0x2b06c); /* GCC_SYS_NOC_CPUSS_AHB_CLK */
 
-	return qcom_cc_really_probe(pdev, &gcc_sm6115_desc, regmap);
+	ret = qcom_cc_really_probe(pdev, &gcc_sm6115_desc, regmap);
+	pm_runtime_put(&pdev->dev);
+
+	return ret;
 }
 
 static struct platform_driver gcc_sm6115_driver = {

-- 
2.43.0


