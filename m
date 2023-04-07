Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA6E06DAAD0
	for <lists+linux-clk@lfdr.de>; Fri,  7 Apr 2023 11:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240588AbjDGJYC (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 7 Apr 2023 05:24:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240569AbjDGJXz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Apr 2023 05:23:55 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EC8FAF3A;
        Fri,  7 Apr 2023 02:23:51 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3379DCXV011312;
        Fri, 7 Apr 2023 09:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=RRsxgAHgTlm+iwTceKr7VhVyxrmQp3oO7UsRfGYfjCw=;
 b=c66zUOnFJaPJf+Vj8q+qW9foRAUA8Bo1zzK+hE3xJG4nCCbdpPaEbPUVBFU3RbACb2o3
 ydiApYcCq/BlsBNHnErAA+OmXU09TtaVpTYzq4n+9ys/cTqaLfX6K4cDPOtj1yOJHPr3
 NewVKDsNLYfUlmFPYSQJHmZU6+VcMxp27RBiQm4W4aPSPhcgxm2GtU8MGxBndlXiWQGG
 H7NI1b2dW2bXIvupmhcGZYs/B87LhjUGmOAJMpOcRSGIqoyOzaSnYGq5dA4zFiTfrMX6
 yB/3IZC1M3yxgR5KajlP78yTlBHkOSyEXxCX5YlAlQYSOOfgh3HD0VVRVNHTGH7BpT3w Yg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pt87b8w8g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 07 Apr 2023 09:23:44 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3379NhxH009369
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 7 Apr 2023 09:23:43 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 7 Apr 2023 02:23:38 -0700
From:   Mohammad Rafi Shaik <quic_mohs@quicinc.com>
To:     <swboyd@chromium.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <agross@kernel.org>, <andersson@kernel.org>, <robh+dt@kernel.org>,
        <broonie@kernel.org>, <quic_plai@quicinc.com>,
        <konrad.dybcio@somainline.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_rohkumar@quicinc.com>, <quic_visr@quicinc.com>
CC:     Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v11 3/3] clk: qcom: lpassaudiocc-sc7280: Add required gdsc power domain clks in lpass_cc_sc7280_desc
Date:   Fri, 7 Apr 2023 14:52:55 +0530
Message-ID: <20230407092255.119690-4-quic_mohs@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230407092255.119690-1-quic_mohs@quicinc.com>
References: <20230407092255.119690-1-quic_mohs@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6wnARQ7wKFN-aOt8aQe2gu3hiG4Tkkqq
X-Proofpoint-GUID: 6wnARQ7wKFN-aOt8aQe2gu3hiG4Tkkqq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-07_05,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 mlxscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304070086
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add GDSCs in lpass_cc_sc7280_desc struct.
When qcom,adsp-pil-mode is enabled, GDSCs required to solve
dependencies in lpass_audiocc probe().

Fixes: 0cbcfbe50cbf ("clk: qcom: lpass: Handle the regmap overlap of lpasscc and lpass_aon")
Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
---
 drivers/clk/qcom/lpassaudiocc-sc7280.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/lpassaudiocc-sc7280.c b/drivers/clk/qcom/lpassaudiocc-sc7280.c
index 1339f9211a14..134eb1529ede 100644
--- a/drivers/clk/qcom/lpassaudiocc-sc7280.c
+++ b/drivers/clk/qcom/lpassaudiocc-sc7280.c
@@ -696,6 +696,8 @@ static const struct qcom_cc_desc lpass_cc_sc7280_desc = {
 	.config = &lpass_audio_cc_sc7280_regmap_config,
 	.clks = lpass_cc_sc7280_clocks,
 	.num_clks = ARRAY_SIZE(lpass_cc_sc7280_clocks),
+	.gdscs = lpass_aon_cc_sc7280_gdscs,
+	.num_gdscs = ARRAY_SIZE(lpass_aon_cc_sc7280_gdscs),
 };
 
 static const struct qcom_cc_desc lpass_audio_cc_sc7280_desc = {
-- 
2.25.1

