Return-Path: <linux-clk+bounces-28449-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 899B7B9CBC6
	for <lists+linux-clk@lfdr.de>; Thu, 25 Sep 2025 01:57:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED6131781EC
	for <lists+linux-clk@lfdr.de>; Wed, 24 Sep 2025 23:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AF252D0C85;
	Wed, 24 Sep 2025 23:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Av1MGkWJ"
X-Original-To: linux-clk@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A6D2C21DD
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 23:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758758224; cv=none; b=ioMzlFt6lut2pnuOWLDvAFBloJ28CZat/uMaKvxKwhLRCX7oBEJ7m7nvW8YdSzv2g7ZMxMm60STMbeCUjBzTfQuTmmCQJeeDDcFtfsqruDV48f70OxpYzq9fsf0neyE2i5K87m8bzESAYE+ELA23EAmF/5uHRjGnEea3ZZj/hk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758758224; c=relaxed/simple;
	bh=vxtCqEBXFxTSszZwXPBtJqekhBLKcmhPlBp9HR1oeIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fRuc+IYAUnXLceYokrxPBsPAdTn3bFkec8coGRrpnSK++lI1AqI2Fn8MRj9pDM3JwWWFJDIEjGemaLbQMPl2Y57ybxeTQjuzXJWH4/CbrsGfPZAyPvi3FyHTJUkO9o6/1EQU/8jh+mVcfVHQWRY/emomeWXp+51XqekWBU5xWkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Av1MGkWJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONaxE5018026
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 23:57:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pk70erFYcO2AfKKE1Z7dwoVNONUYzVa0slzE3uRgPDI=; b=Av1MGkWJ70XVj0nm
	6HHG1YbZ7o2pEheSiQC9+IH9tkgrnYvyMZkmhZadYH2LfcdGe5Tr3Xufno0k9h+q
	bwDkAStGyTIkmMnhB+auBc4pWLmz3xWv4G3oq2Abq7j2MIJ9NnRiBVVZ2Zv0dM1j
	BBU6lYnn6FrlCWZhHUjuId7rMrtV9RpfHUD6gO8LCnhx5gWf++JDU+kbP2MwgiJs
	kX0ERGKgaxm/+Q65D+gXB4QO8RxBlVdEQm2W5wI/1EH5V2yvItODyHxQjtzXrELG
	mMuhCrk1YR41I8/0qi1iFVAQ2BEspTgnvQNJIN+lu+PNqs/9atcubZtoKjH6obEF
	bOX8BA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kka29u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 23:57:01 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-272b7bdf41fso3760225ad.0
        for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 16:57:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758758220; x=1759363020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pk70erFYcO2AfKKE1Z7dwoVNONUYzVa0slzE3uRgPDI=;
        b=cLV3k9MdEFLmGzCl02Q7VIi1WPAeAuF74Yi8HGJueZP+/hHC/s2cs3QkX4nXV7qAdv
         bwsBtZMnsWB0W1OfDpJXMGcSuVVhnRM8RnyuZEHdkA20WpyKLHT5Qj5xRTPUpnrXZtJo
         C/tWQxzaPj9JxwL4U3u+f3jcBlGUG7Xn6UZsrNxQBKz7gVCD3BMBx2btoZAb06nzyZxD
         qqqMULsYUjgjQTVGOBozZXU3297o6Eze/fy16Ro80dp6RZB23UV22kdDHmgew2YsJZ4A
         v2Dub2SJZiOzNfJvLF1gr2Cln+381CWgQMSx56xLtwTKm3pZ6UFf0ev/l7Abk5el9Fvw
         M0vA==
X-Forwarded-Encrypted: i=1; AJvYcCWQmMxyBBQoCU2u7CVD4qR8+vQiHuw/8NnGQkAAojIYDNJqRzIsVLvkq5Frlq09f5MAfbYy92CIhb4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9VBjMRPpFZ7AD/aTL/bVb12eYpFzrRXYc6aOgMWJisCxSVr2F
	hRHzjzAuB3i8aix2VMQAyE+NervVRJ+KIdqrB37l0RNLQjYT5EVcqQhp6iCeX1PtXBM5gjGRRa9
	n6uMJuYJr/gW3DRGYZV72XEW9MAz7H+52dFZCOsENOT/7wDwF8zQxxPO7vqMFpcf25gJakqXyUg
	==
X-Gm-Gg: ASbGncv74xzYvzEWJrcrX50LaRBWi4c3eX+2Lc6uD1HNP4W/bXGSE33JIADuVjE0EZ4
	oyENPV9+qoTHNCnbRCGr9R++IU9ec+uCLCDlsnw7zoM6Pn9/Mha6BgYwt2SJmJnkMkqKtupdzV6
	8DdfAnyv89sss7Uld584oIvs2e3D/wFobohJ+4OUGDLUtkr82FfxiXO0IdnuGW4OrQPoYR7MB1P
	pABn3qr0dJ62Z30y6ZX0bAQm56mjfBt3L4XkGAt+Ge7HwVVPJFAx8NEruGC/SxYV3nrlns76C+r
	sDcDhanE5aeHckD7+726E2b9C1PKO1I+vwfj2apYn8RZTi9zN3SYc1/D7rgDRV1Mz8HRkNPG4D1
	dYicNIctDXsV179M=
X-Received: by 2002:a17:902:fc47:b0:264:1afd:82e6 with SMTP id d9443c01a7336-27ed4a60f9bmr13196235ad.53.1758758220445;
        Wed, 24 Sep 2025 16:57:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbTbTp2me/2Ozbja2PwjyojwjJ05KsAp6cuIPrATe9oMmVCAbQuTu3rQBw9zmosE+LnsGZKA==
X-Received: by 2002:a17:902:fc47:b0:264:1afd:82e6 with SMTP id d9443c01a7336-27ed4a60f9bmr13195805ad.53.1758758219947;
        Wed, 24 Sep 2025 16:56:59 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6881fd6sm4557185ad.87.2025.09.24.16.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:56:59 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:56:45 -0700
Subject: [PATCH 4/9] dt-bindings: clock: qcom: Add Kaanapali video clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-mmclk-v1-4-d7ea96b4784a@oss.qualcomm.com>
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
In-Reply-To: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758758212; l=3732;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=0aHzA87ne9/I9u0KuPsqyfzOGqP9ZE4Qht8AQaI9SGA=;
 b=bfaEOWxv1PpaU5TCtCim6m8Ui/1XV/Z5ELraJs8RZIFMQHjsxdCFjvh14YtqielMA/B97NvTr
 OAtVVOXv3NOBInq0arVHFQzREhI8KWLdmxqYVb/o1gaV5NHfMBA/fl3
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: RYZp09CpXLyB6FFLmpC8WudKwO4Jydq7
X-Proofpoint-ORIG-GUID: RYZp09CpXLyB6FFLmpC8WudKwO4Jydq7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfXyu4VZ3t44uLE
 tLnz80I7TPE10LnVFPkxFva+4/He3ZNt3LMnAk88Q1M7nlXGU5QkEQv+zmqQ5B+7sCe81+/t/Jr
 tgyC97cBJ95ssu/gOPKPU8zWo8e10muRfTRQhPPeKJZRmvUT8aJUdGQeCaKjZpWukIgKhRz+2+g
 NJR4UvHahzwVCthYAUR/Ds5hSCKkn7GbO4wkm40Jy1+EDFKqHgFw0zRRQxf/uIOvADXw9iPLa0w
 702+NWSFRZyA/USaRD/hc3EnQPzN5lCbV7wdoI8SpjOWPsGWqKbUCrEXRjtP39Cb+GVEMpDqAnJ
 idjfvntKmJBYdV5+9q5/Nc1S0tRUlnByEY+mUUGNQdf1IgmX9ly0KlLkH5sSP3ig0YwC12SEsYV
 9l1cjyB1
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d4854d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=_xnZC5tmkvlqoiR1VIgA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add device tree bindings for the video clock controller on Qualcomm
Kaanapali SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml        |  3 ++
 include/dt-bindings/clock/qcom,kaanapali-videocc.h | 58 ++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index b31bd8335529..e6beebd6a36e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -15,6 +15,7 @@ description: |
   domains on SM8450.
 
   See also:
+    include/dt-bindings/clock/qcom,kaanapali-videocc.h
     include/dt-bindings/clock/qcom,sm8450-videocc.h
     include/dt-bindings/clock/qcom,sm8650-videocc.h
     include/dt-bindings/clock/qcom,sm8750-videocc.h
@@ -22,6 +23,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,kaanapali-videocc
       - qcom,sm8450-videocc
       - qcom,sm8475-videocc
       - qcom,sm8550-videocc
@@ -61,6 +63,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,kaanapali-videocc
               - qcom,sm8450-videocc
               - qcom,sm8550-videocc
               - qcom,sm8750-videocc
diff --git a/include/dt-bindings/clock/qcom,kaanapali-videocc.h b/include/dt-bindings/clock/qcom,kaanapali-videocc.h
new file mode 100644
index 000000000000..cc0d41b895c9
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,kaanapali-videocc.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_KAANAPALI_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_KAANAPALI_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK					0
+#define VIDEO_CC_AHB_CLK_SRC					1
+#define VIDEO_CC_MVS0_CLK					2
+#define VIDEO_CC_MVS0_CLK_SRC					3
+#define VIDEO_CC_MVS0_FREERUN_CLK				4
+#define VIDEO_CC_MVS0_SHIFT_CLK					5
+#define VIDEO_CC_MVS0_VPP0_CLK					6
+#define VIDEO_CC_MVS0_VPP0_FREERUN_CLK				7
+#define VIDEO_CC_MVS0_VPP1_CLK					8
+#define VIDEO_CC_MVS0_VPP1_FREERUN_CLK				9
+#define VIDEO_CC_MVS0A_CLK					10
+#define VIDEO_CC_MVS0A_CLK_SRC					11
+#define VIDEO_CC_MVS0A_FREERUN_CLK				12
+#define VIDEO_CC_MVS0B_CLK					13
+#define VIDEO_CC_MVS0B_CLK_SRC					14
+#define VIDEO_CC_MVS0B_FREERUN_CLK				15
+#define VIDEO_CC_MVS0C_CLK					16
+#define VIDEO_CC_MVS0C_CLK_SRC					17
+#define VIDEO_CC_MVS0C_FREERUN_CLK				18
+#define VIDEO_CC_MVS0C_SHIFT_CLK				19
+#define VIDEO_CC_PLL0						20
+#define VIDEO_CC_PLL1						21
+#define VIDEO_CC_PLL2						22
+#define VIDEO_CC_PLL3						23
+#define VIDEO_CC_SLEEP_CLK					24
+#define VIDEO_CC_TS_XO_CLK					25
+#define VIDEO_CC_XO_CLK						26
+#define VIDEO_CC_XO_CLK_SRC					27
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0A_GDSC					0
+#define VIDEO_CC_MVS0_GDSC					1
+#define VIDEO_CC_MVS0_VPP1_GDSC					2
+#define VIDEO_CC_MVS0_VPP0_GDSC					3
+#define VIDEO_CC_MVS0C_GDSC					4
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_BCR					1
+#define VIDEO_CC_MVS0_VPP0_BCR					2
+#define VIDEO_CC_MVS0_VPP1_BCR					3
+#define VIDEO_CC_MVS0A_BCR					4
+#define VIDEO_CC_MVS0C_CLK_ARES					5
+#define VIDEO_CC_MVS0C_BCR					6
+#define VIDEO_CC_MVS0_FREERUN_CLK_ARES				7
+#define VIDEO_CC_MVS0C_FREERUN_CLK_ARES				8
+#define VIDEO_CC_XO_CLK_ARES					9
+
+#endif

-- 
2.25.1


