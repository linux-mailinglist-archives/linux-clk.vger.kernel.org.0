Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84FAB5A3F60
	for <lists+linux-clk@lfdr.de>; Sun, 28 Aug 2022 21:22:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230224AbiH1TWp (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 28 Aug 2022 15:22:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230141AbiH1TWd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 28 Aug 2022 15:22:33 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEADA2A405;
        Sun, 28 Aug 2022 12:22:16 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27SJFDgq001946;
        Sun, 28 Aug 2022 19:22:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=2cXmoaZmUvxrzyNuWMuVIZ2vrVLcb3DzfphaeWIbGlE=;
 b=PMiI4RhMVuJKCI50FogeiNK4jhxBMuTGJycmeeKHL6WMgCrL+eht/MOlYJuRZskySyus
 ZZKnZleCdZ5WrM+93aCeoOw46cEbnvLS12/xGZT9QqYSPddCV9dk3AIOmHF0WRlMrIRg
 kv/gk3/+DNEZZ68iig5O9wLVOiDt4wBw8AVKCwXZCs43IgR17T9zQ9qq2fTMus6wixIN
 U1pv8TUlqJotxayCY/hQOi7A6P7hCilsU7x8zB18IbDHcsjaBX5x8wZeXgyTX0uNW0Wo
 e4CHnhPU9KviVxBDplrBqGs96Ky5bNspcGM1Aigew2q2BMeet9s/r2o/8btQp29/8etg fA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j7a7ykfbj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 28 Aug 2022 19:22:08 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27SJM7MC022694
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 28 Aug 2022 19:22:07 GMT
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Sun, 28 Aug 2022 12:22:02 -0700
From:   Akhil P Oommen <quic_akhilpo@quicinc.com>
To:     freedreno <freedreno@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Stephen Boyd" <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC:     <krzysztof.kozlowski@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        "Andy Gross" <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 4/6] clk: qcom: gpucc-sc7280: Add cx collapse reset support
Date:   Mon, 29 Aug 2022 00:51:17 +0530
Message-ID: <20220829005035.v5.4.I5e64ff4b77bb9079eb2edeea8a02585c9e76778f@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1661714479-28981-1-git-send-email-quic_akhilpo@quicinc.com>
References: <1661714479-28981-1-git-send-email-quic_akhilpo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Law2ownpdrgjLH6FX4QXxcXjUdTXFqpt
X-Proofpoint-GUID: Law2ownpdrgjLH6FX4QXxcXjUdTXFqpt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-28_12,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 clxscore=1015 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208280080
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Allow a consumer driver to poll for cx gdsc collapse through Reset
framework.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

(no changes since v3)

Changes in v3:
- Convert 'struct qcom_reset_ops cx_gdsc_reset' to 'static const' (Krzysztof)

Changes in v2:
- Minor update to use the updated custom reset ops implementation

 drivers/clk/qcom/gpucc-sc7280.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/qcom/gpucc-sc7280.c b/drivers/clk/qcom/gpucc-sc7280.c
index 9a832f2..fece3f4 100644
--- a/drivers/clk/qcom/gpucc-sc7280.c
+++ b/drivers/clk/qcom/gpucc-sc7280.c
@@ -433,12 +433,22 @@ static const struct regmap_config gpu_cc_sc7280_regmap_config = {
 	.fast_io = true,
 };
 
+static const struct qcom_reset_ops cx_gdsc_reset = {
+	.reset = gdsc_wait_for_collapse,
+};
+
+static const struct qcom_reset_map gpucc_sc7280_resets[] = {
+	[GPU_CX_COLLAPSE] = { .ops = &cx_gdsc_reset, .priv = &cx_gdsc },
+};
+
 static const struct qcom_cc_desc gpu_cc_sc7280_desc = {
 	.config = &gpu_cc_sc7280_regmap_config,
 	.clks = gpu_cc_sc7280_clocks,
 	.num_clks = ARRAY_SIZE(gpu_cc_sc7280_clocks),
 	.gdscs = gpu_cc_sc7180_gdscs,
 	.num_gdscs = ARRAY_SIZE(gpu_cc_sc7180_gdscs),
+	.resets = gpucc_sc7280_resets,
+	.num_resets = ARRAY_SIZE(gpucc_sc7280_resets),
 };
 
 static const struct of_device_id gpu_cc_sc7280_match_table[] = {
-- 
2.7.4

