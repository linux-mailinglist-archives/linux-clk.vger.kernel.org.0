Return-Path: <linux-clk+bounces-13264-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8BD9A2A97
	for <lists+linux-clk@lfdr.de>; Thu, 17 Oct 2024 19:18:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE080B2A520
	for <lists+linux-clk@lfdr.de>; Thu, 17 Oct 2024 17:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EFF41E1057;
	Thu, 17 Oct 2024 16:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iMN2cA9f"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C041E0DF9
	for <linux-clk@vger.kernel.org>; Thu, 17 Oct 2024 16:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729184235; cv=none; b=qvXSfCbnjz2V6FrlhJ4VZYOrjhEcfaepPvvCQ+nTIj8V/4tYCYxof3nEEPnuD6W1JZ5HZwtYmFEi5vXw2j/C4vdzUMqZXiz1v5gXS6uhNYiHPgWxQDMxp4f74xtm0+7LekX0A4dfeKipFQLaIBh2YankgzxcqAgdLExPHWMLPiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729184235; c=relaxed/simple;
	bh=bnArHMzLsW0SD4bKUl339vS2YEMu5JmkmeqitnbHlsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iXTULPu9MXOfPuUZiJmlWDx2aV3sQsWQEFL1+/EbsSwt4PgZdR1eqB/XXoCPfBW/cqGkaSJvvkSi9pYYy3Av5BFh3uoNRpCwPHuBOMp8Ut3R/5hw8KG0rxDtCzBegNntZgftXe8+GzzUVG/ngfeITG9uLn2Iz2sQxBlOCBy+Fzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iMN2cA9f; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539ebb5a20aso1281129e87.2
        for <linux-clk@vger.kernel.org>; Thu, 17 Oct 2024 09:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729184228; x=1729789028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mEg2Ja8poOCQIZoZJr+GmECWODl8OuiHB/Rzs3bFmVg=;
        b=iMN2cA9fosbwxG5L4tg7Pdn8KBHsryvkOOGCkOt8A21Qn6jcSoMttfH6W/Qi9/xDID
         xGDkZP/CPppmFHIBR3ktovM+JebuOrFbHu7exKQDCpUTay0tuVbQK9u28F18/TKcEB5t
         /lWx9OuODMmlcs3/E8/BUfMO5AH6XcGLriusym4R4MQX/E4iNxzxm5+dLWUB1rhmOJ5G
         yMQmYgP/dwIDoXm7ptrd1f0NNqsWa+rOGH4zkCmGGh4mvLD7+ozX2Ln6J9K3wmbIaTAi
         qxD6hhlKfrKp4jwjd821/mDo2Y58P71zkkU2nR/0lS2rvJ4NJkP5TBW0trsaaWgPwnOw
         8SMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729184228; x=1729789028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mEg2Ja8poOCQIZoZJr+GmECWODl8OuiHB/Rzs3bFmVg=;
        b=A6Pull6bRBO5fj3Haf4DTU1QYFYcO3FdAZcfRkXstPBDH2LhHULnEnRERhjf7Aw567
         zY1UMggtks3xKRAc5XJs42AY8bJ41O6BIUN0Pl316kmyQSKKAABecZtWHRdzjDUlfcax
         8qBE8KPtxloTNNztYZDQOLNdCBDMz+aSaKt9TDQ0ReSWdCZmyguXxmZcUfsUmPGIkbQI
         SkZEPz8mSbesOKokOJKukoBUOVPXamggl8XYX1XQMGo1OC/R/pgYNMrPLty+dybaIeGT
         QoajY22BNADUwPEUmfqiWalfdMqZl0H+Sl1seOnumCtgimTLttTAfG/k+hpRk9OYOyUi
         tXfg==
X-Forwarded-Encrypted: i=1; AJvYcCWN95YBdy1almwMOorHRnrEgniSLUu/0XdHuqXwvFVWnw/PBvQAuyDei2i2uiUO2tjcq9tBeLc61H8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzloSiE5XGIftTN6mAIOJ+vAWTEHs3Mfe3XL+GWcw3KwcDVvhZ+
	cMANhU0sB1WkweP/1ZpxO1sY6k600hon52Dy8z6AhepKpUHSXmtjmcmJh3be4F4=
X-Google-Smtp-Source: AGHT+IFNUPYncBn+drwhWJbk25hoUKBZG1K7vszAbCN8tUsBq2Qg7tdZ77Ar4+uXunmkvSiWy20GEA==
X-Received: by 2002:ac2:4e07:0:b0:539:88f7:d3c4 with SMTP id 2adb3069b0e04-539e5514af3mr8852254e87.29.1729184227531;
        Thu, 17 Oct 2024 09:57:07 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a00007078sm821563e87.212.2024.10.17.09.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 09:57:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 17 Oct 2024 19:56:52 +0300
Subject: [PATCH 02/14] dt-bindings: clock: qcom: document SAR2130P Global
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241017-sar2130p-clocks-v1-2-f75e740f0a8d@linaro.org>
References: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org>
In-Reply-To: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9545;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=bnArHMzLsW0SD4bKUl339vS2YEMu5JmkmeqitnbHlsA=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnEUHZ542x+l5KUo8Qs1JWLAB/HM8XCVdNR9Zlh
 mardqABxyuJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxFB2QAKCRAU23LtvoBl
 uDl1D/9BynD3B3Dr5GqCPT3ZGlanEwG/zuujX9dBGdXRJUC5MnxTge0ina1GtibamgAnLJd+G+Z
 IyffoQBzS6StRMgcfCChhrWo2HSpWuK9lsOcwGEMumO3Uzs8YHJMViCl4a5uTwELcW3jbUpLivn
 gKDVQTgPeSpm0p6F1gp6gxs5rF1Eo/m65ufFDX8Vi2wsrsaMMl+wuNNyMNjgNlDmJRfiARloRy2
 nysUCg7BS0sfAkhayX+s8yXOjNnNeAZRjOMmx3HOosf5oY+qUPbTF/wkg8W1L4WvG+ez/mXsWxU
 gUL3zY6jULUOlUPdjoaqY74pBoUzsWW+/dPAbHDATp/G1Bgw1zniQIOK9KBhdjT7GF1g44VDRBz
 vYqZeyRvhJtME6mRcYhwtTFd4Zn3YJkERkVHuo4L951aEwJ6BcGMrLVoT5i42vC2h69ZOc7n0aV
 B57Qm+0HABQ++ZuX2qC8sLV82buHCniNNNaZ6s9ZjR9BknNeZYGwEvIt2RcU7kYoJ5qFrBf94pW
 nE7eHTU8rYoZU+hC2MARNlUur9vMaPlyu+ieGuoQhU1CuAmftmf0pIDZ5/Jt7PJlsPFneJq6yVr
 G2GNWcuWuWA9z2AjLB47Sq+4z28cz+0nWp05vnpRoe0R6uDhmLfkv3ASjg9v3yDXSl1IzHUjod1
 8BfK8LrpIS997SA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add bindings for the Global Clock Controller (GCC) present on the
Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,sar2130p-gcc.yaml          |  65 ++++++++
 include/dt-bindings/clock/qcom,sar2130p-gcc.h      | 181 +++++++++++++++++++++
 2 files changed, 246 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sar2130p-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sar2130p-gcc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..9a430bbd872aebf765a6a0f36c09fdc2301ffefb
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sar2130p-gcc.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sar2130p-gcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller on sar2130p
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+
+description: |
+  Qualcomm global clock control module provides the clocks, resets and
+  power domains on sar2130p.
+
+  See also: include/dt-bindings/clock/qcom,sar2130p-gcc.h
+
+properties:
+  compatible:
+    const: qcom,sar2130p-gcc
+
+  clocks:
+    items:
+      - description: XO reference clock
+      - description: Sleep clock
+      - description: PCIe 0 pipe clock
+      - description: PCIe 1 pipe clock
+      - description: Primary USB3 PHY wrapper pipe clock
+
+  protected-clocks:
+    maxItems: 240
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - '#power-domain-cells'
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    gcc: clock-controller@100000 {
+        compatible = "qcom,sar2130p-gcc";
+        reg = <0x100000 0x1f4200>;
+        clocks = <&rpmhcc RPMH_CXO_CLK>,
+                 <&sleep_clk>,
+                 <&pcie_0_pipe_clk>,
+                 <&pcie_1_pipe_clk>,
+                 <&usb_0_ssphy>;
+        power-domains = <&rpmhpd RPMHPD_CX>;
+
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,sar2130p-gcc.h b/include/dt-bindings/clock/qcom,sar2130p-gcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..b22701922136a3db1684baf97a84dd258985d1ab
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sar2130p-gcc.h
@@ -0,0 +1,181 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (c) 2021-2022, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_SAR2130P_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_SAR2130P_H
+
+/* GCC clocks */
+#define GCC_GPLL0						0
+#define GCC_GPLL0_OUT_EVEN					1
+#define GCC_GPLL1						2
+#define GCC_GPLL9						3
+#define GCC_GPLL9_OUT_EVEN					4
+#define GCC_AGGRE_NOC_PCIE_1_AXI_CLK				5
+#define GCC_AGGRE_USB3_PRIM_AXI_CLK				6
+#define GCC_BOOT_ROM_AHB_CLK					7
+#define GCC_CAMERA_AHB_CLK					8
+#define GCC_CAMERA_HF_AXI_CLK					9
+#define GCC_CAMERA_SF_AXI_CLK					10
+#define GCC_CAMERA_XO_CLK					11
+#define GCC_CFG_NOC_PCIE_ANOC_AHB_CLK				12
+#define GCC_CFG_NOC_USB3_PRIM_AXI_CLK				13
+#define GCC_DDRSS_GPU_AXI_CLK					14
+#define GCC_DDRSS_PCIE_SF_CLK					15
+#define GCC_DISP_AHB_CLK					16
+#define GCC_DISP_HF_AXI_CLK					17
+#define GCC_GP1_CLK						18
+#define GCC_GP1_CLK_SRC						19
+#define GCC_GP2_CLK						20
+#define GCC_GP2_CLK_SRC						21
+#define GCC_GP3_CLK						22
+#define GCC_GP3_CLK_SRC						23
+#define GCC_GPU_CFG_AHB_CLK					24
+#define GCC_GPU_GPLL0_CLK_SRC					25
+#define GCC_GPU_GPLL0_DIV_CLK_SRC				26
+#define GCC_GPU_MEMNOC_GFX_CLK					27
+#define GCC_GPU_SNOC_DVM_GFX_CLK				28
+#define GCC_IRIS_SS_HF_AXI1_CLK					29
+#define GCC_IRIS_SS_SPD_AXI1_CLK				30
+#define GCC_PCIE_0_AUX_CLK					31
+#define GCC_PCIE_0_AUX_CLK_SRC					32
+#define GCC_PCIE_0_CFG_AHB_CLK					33
+#define GCC_PCIE_0_MSTR_AXI_CLK					34
+#define GCC_PCIE_0_PHY_RCHNG_CLK				35
+#define GCC_PCIE_0_PHY_RCHNG_CLK_SRC				36
+#define GCC_PCIE_0_PIPE_CLK					37
+#define GCC_PCIE_0_PIPE_CLK_SRC					38
+#define GCC_PCIE_0_SLV_AXI_CLK					39
+#define GCC_PCIE_0_SLV_Q2A_AXI_CLK				40
+#define GCC_PCIE_1_AUX_CLK					41
+#define GCC_PCIE_1_AUX_CLK_SRC					42
+#define GCC_PCIE_1_CFG_AHB_CLK					43
+#define GCC_PCIE_1_MSTR_AXI_CLK					44
+#define GCC_PCIE_1_PHY_RCHNG_CLK				45
+#define GCC_PCIE_1_PHY_RCHNG_CLK_SRC				46
+#define GCC_PCIE_1_PIPE_CLK					47
+#define GCC_PCIE_1_PIPE_CLK_SRC					48
+#define GCC_PCIE_1_SLV_AXI_CLK					49
+#define GCC_PCIE_1_SLV_Q2A_AXI_CLK				50
+#define GCC_PDM2_CLK						51
+#define GCC_PDM2_CLK_SRC					52
+#define GCC_PDM_AHB_CLK						53
+#define GCC_PDM_XO4_CLK						54
+#define GCC_QMIP_CAMERA_NRT_AHB_CLK				55
+#define GCC_QMIP_CAMERA_RT_AHB_CLK				56
+#define GCC_QMIP_GPU_AHB_CLK					57
+#define GCC_QMIP_PCIE_AHB_CLK					58
+#define GCC_QMIP_VIDEO_CV_CPU_AHB_CLK				59
+#define GCC_QMIP_VIDEO_CVP_AHB_CLK				60
+#define GCC_QMIP_VIDEO_LSR_AHB_CLK				61
+#define GCC_QMIP_VIDEO_V_CPU_AHB_CLK				62
+#define GCC_QMIP_VIDEO_VCODEC_AHB_CLK				63
+#define GCC_QUPV3_WRAP0_CORE_2X_CLK				64
+#define GCC_QUPV3_WRAP0_CORE_CLK				65
+#define GCC_QUPV3_WRAP0_S0_CLK					66
+#define GCC_QUPV3_WRAP0_S0_CLK_SRC				67
+#define GCC_QUPV3_WRAP0_S1_CLK					68
+#define GCC_QUPV3_WRAP0_S1_CLK_SRC				69
+#define GCC_QUPV3_WRAP0_S2_CLK					70
+#define GCC_QUPV3_WRAP0_S2_CLK_SRC				71
+#define GCC_QUPV3_WRAP0_S3_CLK					72
+#define GCC_QUPV3_WRAP0_S3_CLK_SRC				73
+#define GCC_QUPV3_WRAP0_S4_CLK					74
+#define GCC_QUPV3_WRAP0_S4_CLK_SRC				75
+#define GCC_QUPV3_WRAP0_S5_CLK					76
+#define GCC_QUPV3_WRAP0_S5_CLK_SRC				77
+#define GCC_QUPV3_WRAP1_CORE_2X_CLK				78
+#define GCC_QUPV3_WRAP1_CORE_CLK				79
+#define GCC_QUPV3_WRAP1_S0_CLK					80
+#define GCC_QUPV3_WRAP1_S0_CLK_SRC				81
+#define GCC_QUPV3_WRAP1_S1_CLK					82
+#define GCC_QUPV3_WRAP1_S1_CLK_SRC				83
+#define GCC_QUPV3_WRAP1_S2_CLK					84
+#define GCC_QUPV3_WRAP1_S2_CLK_SRC				85
+#define GCC_QUPV3_WRAP1_S3_CLK					86
+#define GCC_QUPV3_WRAP1_S3_CLK_SRC				87
+#define GCC_QUPV3_WRAP1_S4_CLK					88
+#define GCC_QUPV3_WRAP1_S4_CLK_SRC				89
+#define GCC_QUPV3_WRAP1_S5_CLK					90
+#define GCC_QUPV3_WRAP1_S5_CLK_SRC				91
+#define GCC_QUPV3_WRAP_0_M_AHB_CLK				92
+#define GCC_QUPV3_WRAP_0_S_AHB_CLK				93
+#define GCC_QUPV3_WRAP_1_M_AHB_CLK				94
+#define GCC_QUPV3_WRAP_1_S_AHB_CLK				95
+#define GCC_SDCC1_AHB_CLK					96
+#define GCC_SDCC1_APPS_CLK					97
+#define GCC_SDCC1_APPS_CLK_SRC					98
+#define GCC_SDCC1_ICE_CORE_CLK					99
+#define GCC_SDCC1_ICE_CORE_CLK_SRC				100
+#define GCC_USB30_PRIM_MASTER_CLK				101
+#define GCC_USB30_PRIM_MASTER_CLK_SRC				102
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK				103
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC			104
+#define GCC_USB30_PRIM_MOCK_UTMI_POSTDIV_CLK_SRC		105
+#define GCC_USB30_PRIM_SLEEP_CLK				106
+#define GCC_USB3_PRIM_PHY_AUX_CLK				107
+#define GCC_USB3_PRIM_PHY_AUX_CLK_SRC				108
+#define GCC_USB3_PRIM_PHY_COM_AUX_CLK				109
+#define GCC_USB3_PRIM_PHY_PIPE_CLK				110
+#define GCC_USB3_PRIM_PHY_PIPE_CLK_SRC				111
+#define GCC_VIDEO_AHB_CLK					112
+#define GCC_VIDEO_AXI0_CLK					113
+#define GCC_VIDEO_AXI1_CLK					114
+#define GCC_VIDEO_XO_CLK					115
+#define GCC_GPLL4						116
+#define GCC_GPLL5						117
+#define GCC_GPLL7						118
+#define GCC_DDRSS_SPAD_CLK					119
+#define GCC_DDRSS_SPAD_CLK_SRC					120
+#define GCC_VIDEO_AXI0_SREG					121
+#define GCC_VIDEO_AXI1_SREG					122
+#define GCC_IRIS_SS_HF_AXI1_SREG				123
+#define GCC_IRIS_SS_SPD_AXI1_SREG				124
+
+/* GCC resets */
+#define GCC_CAMERA_BCR						0
+#define GCC_DISPLAY_BCR						1
+#define GCC_GPU_BCR						2
+#define GCC_PCIE_0_BCR						3
+#define GCC_PCIE_0_LINK_DOWN_BCR				4
+#define GCC_PCIE_0_NOCSR_COM_PHY_BCR				5
+#define GCC_PCIE_0_PHY_BCR					6
+#define GCC_PCIE_0_PHY_NOCSR_COM_PHY_BCR			7
+#define GCC_PCIE_1_BCR						8
+#define GCC_PCIE_1_LINK_DOWN_BCR				9
+#define GCC_PCIE_1_NOCSR_COM_PHY_BCR				10
+#define GCC_PCIE_1_PHY_BCR					11
+#define GCC_PCIE_1_PHY_NOCSR_COM_PHY_BCR			12
+#define GCC_PCIE_PHY_BCR					13
+#define GCC_PCIE_PHY_CFG_AHB_BCR				14
+#define GCC_PCIE_PHY_COM_BCR					15
+#define GCC_PDM_BCR						16
+#define GCC_QUPV3_WRAPPER_0_BCR					17
+#define GCC_QUPV3_WRAPPER_1_BCR					18
+#define GCC_QUSB2PHY_PRIM_BCR					19
+#define GCC_QUSB2PHY_SEC_BCR					20
+#define GCC_SDCC1_BCR						21
+#define GCC_USB30_PRIM_BCR					22
+#define GCC_USB3_DP_PHY_PRIM_BCR				23
+#define GCC_USB3_DP_PHY_SEC_BCR					24
+#define GCC_USB3_PHY_PRIM_BCR					25
+#define GCC_USB3_PHY_SEC_BCR					26
+#define GCC_USB3PHY_PHY_PRIM_BCR				27
+#define GCC_USB3PHY_PHY_SEC_BCR					28
+#define GCC_VIDEO_AXI0_CLK_ARES					29
+#define GCC_VIDEO_AXI1_CLK_ARES					30
+#define GCC_VIDEO_BCR						31
+#define GCC_IRIS_SS_HF_AXI_CLK_ARES				32
+#define GCC_IRIS_SS_SPD_AXI_CLK_ARES				33
+#define GCC_DDRSS_SPAD_CLK_ARES					34
+
+/* GCC power domains */
+#define PCIE_0_GDSC						0
+#define PCIE_0_PHY_GDSC						1
+#define PCIE_1_GDSC						2
+#define PCIE_1_PHY_GDSC						3
+#define USB30_PRIM_GDSC						4
+#define USB3_PHY_GDSC						5
+
+#endif

-- 
2.39.5


