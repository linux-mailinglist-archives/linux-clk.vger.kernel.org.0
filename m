Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC7676CF8E
	for <lists+linux-clk@lfdr.de>; Wed,  2 Aug 2023 16:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234887AbjHBOHt (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 2 Aug 2023 10:07:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234780AbjHBOHd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Aug 2023 10:07:33 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF58D2D4C;
        Wed,  2 Aug 2023 07:07:18 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 372DftRc023804;
        Wed, 2 Aug 2023 14:07:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=niowAYNB5wIXCEvFD3tvhaqBNHV1YYvrEWRuS4x66S8=;
 b=KCEosVIZkKCP9eXQNAGhqRfi80Q1TSbffqJgzE/mfw63Sy3ZAXK1EeeUMtu2bk9hhlSe
 XnUu+pZmLGUJcNQE2aTsrbSR5GG3t90uSQ8rT8DqmflJIGgNDPoglUVxjt23TpmeNF4M
 klGiVEwQr3obWmCn47LjnWpvN7WGFOuKXZUUQE+wFbLSNzl9QcKZxRdr7NDMjlcYKx0V
 HwQkWXKUpwF/V1LIj1MAgWwi3AvpJm3qlCdl+8/DOHehTdWqUqQKJ5gtLv9ygwyiiTRQ
 Fe1Jwci1qbS7R9xi9YQLVJLSRx0TJFJe+U9Z1BCDdzmEQPjXhwsGy6ssXp9QjRhRhSR3 RA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s76jv2dmc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 02 Aug 2023 14:07:14 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 372E7DAS019439
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 2 Aug 2023 14:07:13 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 2 Aug 2023 07:07:06 -0700
From:   Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To:     <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <mathieu.poirier@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <quic_eberman@quicinc.com>,
        <quic_gurus@quicinc.com>, <kvalo@kernel.org>,
        <quic_mmanikan@quicinc.com>, <loic.poulain@linaro.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
CC:     <quic_srichara@quicinc.com>, <quic_sjaganat@quicinc.com>,
        <quic_kathirav@quicinc.com>, <quic_anusha@quicinc.com>,
        <quic_varada@quicinc.com>
Subject: [PATCH v5 06/11] firmware: qcom_scm: ipq5332: add support to pass metadata size
Date:   Wed, 2 Aug 2023 19:36:01 +0530
Message-ID: <20230802140606.2041889-7-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230802140606.2041889-1-quic_mmanikan@quicinc.com>
References: <20230802140606.2041889-1-quic_mmanikan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7Qk7Dru2vwL0rYmV7gZ0ZPoX1tfXOujZ
X-Proofpoint-GUID: 7Qk7Dru2vwL0rYmV7gZ0ZPoX1tfXOujZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-02_09,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308020125
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

IPQ5332 security software running under trustzone
requires metadata size. With V2 cmd, pass metadata
size as well.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
Changes in v5:
	- Rebased on linux-next

Changes in v4:
	- Rebased on linux-next

 drivers/firmware/qcom_scm.c | 8 ++++++++
 drivers/firmware/qcom_scm.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 06fe8aca870d..5e1ff137ab52 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -495,6 +495,14 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 
 	desc.args[1] = mdata_phys;
 
+	if (__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
+					 QCOM_SCM_PAS_INIT_IMAGE_V2)) {
+		desc.cmd = QCOM_SCM_PAS_INIT_IMAGE_V2;
+		desc.arginfo =
+			QCOM_SCM_ARGS(3, QCOM_SCM_VAL, QCOM_SCM_RW, QCOM_SCM_VAL);
+		desc.args[2] = size;
+	}
+
 	ret = qcom_scm_call(__scm->dev, &desc, &res);
 
 	qcom_scm_bw_disable();
diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
index e6e512bd57d1..6ab5e7c77e8d 100644
--- a/drivers/firmware/qcom_scm.h
+++ b/drivers/firmware/qcom_scm.h
@@ -91,6 +91,7 @@ extern int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
 
 #define QCOM_SCM_SVC_PIL		0x02
 #define QCOM_SCM_PIL_PAS_INIT_IMAGE	0x01
+#define QCOM_SCM_PAS_INIT_IMAGE_V2	0x1a
 #define QCOM_SCM_PIL_PAS_MEM_SETUP	0x02
 #define QCOM_SCM_PIL_PAS_AUTH_AND_RESET	0x05
 #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06
-- 
2.34.1

