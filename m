Return-Path: <linux-clk+bounces-23603-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A469AE7BD5
	for <lists+linux-clk@lfdr.de>; Wed, 25 Jun 2025 11:14:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C04F3B1876
	for <lists+linux-clk@lfdr.de>; Wed, 25 Jun 2025 09:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C01902BCF5B;
	Wed, 25 Jun 2025 09:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="zL2aqgLy"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF40029E101
	for <linux-clk@vger.kernel.org>; Wed, 25 Jun 2025 09:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842756; cv=none; b=QaEVvk2PBACsKgxBqwDkbpDaKaoTBjk6bsBtHzZ/Aek5mPOrddPUhfJyFau8YnmOCWzOMjazCpkIeH76S3VVZk4ZjIj2jxiBn4P7RbVW8iWhqh0SmASEGdpaxrVaT0bq7AobPnoZHYdJW5cVs211DfyX5K6JVSSlysvHQSftpFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842756; c=relaxed/simple;
	bh=fsQXA74ef/0da3JWV+r+2MZan49/ihLb/trW9/zxWDU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sgZjCyS7ndfPOs94gaYyPe+ze2Oa964zQPghEqH2W1ngRC8uvO7wnRbhOs27kDguDZ9F39pOSz1Xo6n7P3GeweU+WdCAXkhlCiMAumcw8+FSokCU/fy1Xiz7Lm6v7ckpuU6C13EgO1wnGqxCrKioP3aydhCS+j3frQIlbHPnww4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=zL2aqgLy; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad8a6c202ffso1167085566b.3
        for <linux-clk@vger.kernel.org>; Wed, 25 Jun 2025 02:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842752; x=1751447552; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c2o5HXJHxmjevtnyhPsQhwg/H03yKoo+DpGmqLcT8iE=;
        b=zL2aqgLyHrHuVWnyIJc6UylYD4n1qNf1ZMDahDPOWMMUYxL0DL2yBdmAke67bgc6wZ
         U/LrUHxoxsYgpIb+T93dg+/171ujdnVB4Ed0QIMAqhGiHt3LljR39eJCzrRD0IYnfl74
         EJ5Ai5iqIp+3La/b63Jm9fDjMnCDb/0eNo8D6a4zgB2q2HTneiRC7Fw/SPpiB303TD9Y
         CLiZU4qK7/3XbdCCOXxbkf9Y/rK0BKVpSB9EVJscqFno3blGRLSzmf5BbUwhwH+TlHYF
         dAM9fxDa9iQ3nXpKP1nBb7vBnm0L6JqtWL8Zt3d5oIFbfBnNeuEs2j3RPspqw2n8zwLW
         /o/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842752; x=1751447552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c2o5HXJHxmjevtnyhPsQhwg/H03yKoo+DpGmqLcT8iE=;
        b=VP2psIFVZ0z4HpaemDYwepYJY87CRJPqxch1vrCh9KLApu3XumGYmB0Kho2E0M+EL5
         u5kNWKwJByhS71Qc3j9LaLyxuKoQUc//qQT8gEALC1H1LgRCPIAx0HbAEnl3CoVwYEzP
         r9jdzmB1HlQTfAPax1vgWPLONqkmdsE7enuQx1vQYPjH4YXK5YtX5D0oF8UodrWliv+5
         L5Zszm0rzeJJzzU8uUmCXQUExEAbnqRLgIndaVkHuxjNfE9UzWXjYPjCLVY73jNH/h4w
         1fQVdzRvvyDqS1OQgTMGKS6a5t0ZLvOVmwofh2lbzFkppASH00c5x0jb86sd0UeAgfE0
         L52g==
X-Forwarded-Encrypted: i=1; AJvYcCVEDeFt2swppHOxCrrN7JWnDnemZ4SMqHfAREqWCyxgcsYOzvfTlCeCK6n3zNzXbgVXII/cOMCyoJ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQlyRKGW48H7CcV5oYlbTcVOyLUxtvA5q6KaiF/ctFbfZDth3t
	4oUXGgc+ARLM8DB/Pm99pbpMaqaZ4u3XXD5JR1O85gzjzfdhw49soHPhPinSfusgxou7Zw/7j5q
	YUQwd
X-Gm-Gg: ASbGnctkeCPXtVgiDdJ1Zv3hax5H8iWPY42vpkLEcNGVJWedozXhDMU6Mm/z1XlpWUF
	tr9n1kBEqAxlHVB/oNngkl3undikyJ1T74kR8gjSNExjD64m0C9O0boJ6EQcTIcsezmUXZUmMtl
	T2rSBn1/gIiRcIIuyINj6fGGuL3qBCyWqKRAd8A3Ug2kLGthIL2RpoNcmUTYL++rg1DX97syusr
	YpG4q3U1K61HJcGTzVzBUfG7ugZTnHtjfMgKW/c9tD14v2Iq4SOq3IZ8jXPhn+R/dIU0jxQi9ol
	SIYXoWTJ+5sCI/PDoxX3VPoG+1J/nLFBR71domfsjmOMI23LzEC2DtIDes8/kaEE7kEgRQAq9MO
	Xtny28flcRD6+gA0afqeFlo5QHf0U5aiE
X-Google-Smtp-Source: AGHT+IGuL1SfmDAvVFesiZDcTjSbFUKGgYqVNSqaFycD2rK+OCa1/lyPnKqxqBfGFT2BjrhFDcbyFQ==
X-Received: by 2002:a17:906:57c6:b0:ade:3a1b:88a4 with SMTP id a640c23a62f3a-ae0beb56080mr227791266b.17.1750842752017;
        Wed, 25 Jun 2025 02:12:32 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0b887ab4csm154937366b.129.2025.06.25.02.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:12:31 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:12:21 +0200
Subject: [PATCH 03/10] dt-bindings: clock: qcom: document the SM7635 Camera
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-clocks-v1-3-ca3120e3a80e@fairphone.com>
References: <20250625-sm7635-clocks-v1-0-ca3120e3a80e@fairphone.com>
In-Reply-To: <20250625-sm7635-clocks-v1-0-ca3120e3a80e@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842748; l=6883;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=fsQXA74ef/0da3JWV+r+2MZan49/ihLb/trW9/zxWDU=;
 b=CGems+dmHLEUn+fb0YZAcnoaEsMNDaRzcAEl8oepVd8qGwvr70lCnhkqT79GyU0OG/EGeeW7m
 gGPFtTRlP4TBK4rW0BUCEPGrQfCEecQLOG2H6uxAawu5X4IhtumlaPY
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings documentation for the SM7635 Camera Clock Controller.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/clock/qcom,sm7635-camcc.yaml          |  51 ++++++++
 include/dt-bindings/clock/qcom,sm7635-camcc.h      | 131 +++++++++++++++++++++
 2 files changed, 182 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm7635-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm7635-camcc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..30066aacca6d0d617255bd08dc696fee7b45c289
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sm7635-camcc.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sm7635-camcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Camera Clock & Reset Controller on SM7635
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description: |
+  Qualcomm camera clock control module provides the clocks, resets and power
+  domains on SM7635.
+
+  See also: include/dt-bindings/clock/qcom,sm7635-camcc.h
+
+properties:
+  compatible:
+    const: qcom,sm7635-camcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Sleep clock source
+      - description: Camera AHB clock from GCC
+
+required:
+  - compatible
+  - clocks
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,sm7635-gcc.h>
+    clock-controller@adb0000 {
+        compatible = "qcom,sm7635-camcc";
+        reg = <0x0adb0000 0x40000>;
+        clocks = <&bi_tcxo_div2>,
+                 <&sleep_clk>,
+                 <&gcc GCC_CAMERA_AHB_CLK>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        #power-domain-cells = <1>;
+    };
+
+...
diff --git a/include/dt-bindings/clock/qcom,sm7635-camcc.h b/include/dt-bindings/clock/qcom,sm7635-camcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..ee6a5afab6ef8ebf519ed7d9874a8166884a9640
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm7635-camcc.h
@@ -0,0 +1,131 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_CAM_CC_SM7635_H
+#define _DT_BINDINGS_CLK_QCOM_CAM_CC_SM7635_H
+
+/* CAM_CC clocks */
+#define CAM_CC_PLL0						0
+#define CAM_CC_PLL0_OUT_EVEN					1
+#define CAM_CC_PLL0_OUT_ODD					2
+#define CAM_CC_PLL1						3
+#define CAM_CC_PLL1_OUT_EVEN					4
+#define CAM_CC_PLL2						5
+#define CAM_CC_PLL2_OUT_EVEN					6
+#define CAM_CC_PLL3						7
+#define CAM_CC_PLL3_OUT_EVEN					8
+#define CAM_CC_PLL4						9
+#define CAM_CC_PLL4_OUT_EVEN					10
+#define CAM_CC_PLL5						11
+#define CAM_CC_PLL5_OUT_EVEN					12
+#define CAM_CC_PLL6						13
+#define CAM_CC_PLL6_OUT_EVEN					14
+#define CAM_CC_BPS_AHB_CLK					15
+#define CAM_CC_BPS_AREG_CLK					16
+#define CAM_CC_BPS_CLK						17
+#define CAM_CC_BPS_CLK_SRC					18
+#define CAM_CC_CAMNOC_ATB_CLK					19
+#define CAM_CC_CAMNOC_AXI_CLK_SRC				20
+#define CAM_CC_CAMNOC_AXI_HF_CLK				21
+#define CAM_CC_CAMNOC_AXI_SF_CLK				22
+#define CAM_CC_CAMNOC_NRT_AXI_CLK				23
+#define CAM_CC_CAMNOC_RT_AXI_CLK				24
+#define CAM_CC_CCI_0_CLK					25
+#define CAM_CC_CCI_0_CLK_SRC					26
+#define CAM_CC_CCI_1_CLK					27
+#define CAM_CC_CCI_1_CLK_SRC					28
+#define CAM_CC_CORE_AHB_CLK					29
+#define CAM_CC_CPAS_AHB_CLK					30
+#define CAM_CC_CPHY_RX_CLK_SRC					31
+#define CAM_CC_CRE_AHB_CLK					32
+#define CAM_CC_CRE_CLK						33
+#define CAM_CC_CRE_CLK_SRC					34
+#define CAM_CC_CSI0PHYTIMER_CLK					35
+#define CAM_CC_CSI0PHYTIMER_CLK_SRC				36
+#define CAM_CC_CSI1PHYTIMER_CLK					37
+#define CAM_CC_CSI1PHYTIMER_CLK_SRC				38
+#define CAM_CC_CSI2PHYTIMER_CLK					39
+#define CAM_CC_CSI2PHYTIMER_CLK_SRC				40
+#define CAM_CC_CSI3PHYTIMER_CLK					41
+#define CAM_CC_CSI3PHYTIMER_CLK_SRC				42
+#define CAM_CC_CSIPHY0_CLK					43
+#define CAM_CC_CSIPHY1_CLK					44
+#define CAM_CC_CSIPHY2_CLK					45
+#define CAM_CC_CSIPHY3_CLK					46
+#define CAM_CC_FAST_AHB_CLK_SRC					47
+#define CAM_CC_GDSC_CLK						48
+#define CAM_CC_ICP_ATB_CLK					49
+#define CAM_CC_ICP_CLK						50
+#define CAM_CC_ICP_CLK_SRC					51
+#define CAM_CC_ICP_CTI_CLK					52
+#define CAM_CC_ICP_TS_CLK					53
+#define CAM_CC_MCLK0_CLK					54
+#define CAM_CC_MCLK0_CLK_SRC					55
+#define CAM_CC_MCLK1_CLK					56
+#define CAM_CC_MCLK1_CLK_SRC					57
+#define CAM_CC_MCLK2_CLK					58
+#define CAM_CC_MCLK2_CLK_SRC					59
+#define CAM_CC_MCLK3_CLK					60
+#define CAM_CC_MCLK3_CLK_SRC					61
+#define CAM_CC_MCLK4_CLK					62
+#define CAM_CC_MCLK4_CLK_SRC					63
+#define CAM_CC_OPE_0_AHB_CLK					64
+#define CAM_CC_OPE_0_AREG_CLK					65
+#define CAM_CC_OPE_0_CLK					66
+#define CAM_CC_OPE_0_CLK_SRC					67
+#define CAM_CC_SLEEP_CLK					68
+#define CAM_CC_SLEEP_CLK_SRC					69
+#define CAM_CC_SLOW_AHB_CLK_SRC					70
+#define CAM_CC_SOC_AHB_CLK					71
+#define CAM_CC_SYS_TMR_CLK					72
+#define CAM_CC_TFE_0_AHB_CLK					73
+#define CAM_CC_TFE_0_CLK					74
+#define CAM_CC_TFE_0_CLK_SRC					75
+#define CAM_CC_TFE_0_CPHY_RX_CLK				76
+#define CAM_CC_TFE_0_CSID_CLK					77
+#define CAM_CC_TFE_0_CSID_CLK_SRC				78
+#define CAM_CC_TFE_1_AHB_CLK					79
+#define CAM_CC_TFE_1_CLK					80
+#define CAM_CC_TFE_1_CLK_SRC					81
+#define CAM_CC_TFE_1_CPHY_RX_CLK				82
+#define CAM_CC_TFE_1_CSID_CLK					83
+#define CAM_CC_TFE_1_CSID_CLK_SRC				84
+#define CAM_CC_TFE_2_AHB_CLK					85
+#define CAM_CC_TFE_2_CLK					86
+#define CAM_CC_TFE_2_CLK_SRC					87
+#define CAM_CC_TFE_2_CPHY_RX_CLK				88
+#define CAM_CC_TFE_2_CSID_CLK					89
+#define CAM_CC_TFE_2_CSID_CLK_SRC				90
+#define CAM_CC_TOP_SHIFT_CLK					91
+#define CAM_CC_XO_CLK_SRC					92
+
+/* CAM_CC resets */
+#define CAM_CC_BPS_BCR						0
+#define CAM_CC_CAMNOC_BCR					1
+#define CAM_CC_CAMSS_TOP_BCR					2
+#define CAM_CC_CCI_0_BCR					3
+#define CAM_CC_CCI_1_BCR					4
+#define CAM_CC_CPAS_BCR						5
+#define CAM_CC_CRE_BCR						6
+#define CAM_CC_CSI0PHY_BCR					7
+#define CAM_CC_CSI1PHY_BCR					8
+#define CAM_CC_CSI2PHY_BCR					9
+#define CAM_CC_CSI3PHY_BCR					10
+#define CAM_CC_ICP_BCR						11
+#define CAM_CC_MCLK0_BCR					12
+#define CAM_CC_MCLK1_BCR					13
+#define CAM_CC_MCLK2_BCR					14
+#define CAM_CC_MCLK3_BCR					15
+#define CAM_CC_MCLK4_BCR					16
+#define CAM_CC_OPE_0_BCR					17
+#define CAM_CC_TFE_0_BCR					18
+#define CAM_CC_TFE_1_BCR					19
+#define CAM_CC_TFE_2_BCR					20
+
+/* CAM_CC power domains */
+#define CAM_CC_CAMSS_TOP_GDSC					0
+
+#endif

-- 
2.50.0


