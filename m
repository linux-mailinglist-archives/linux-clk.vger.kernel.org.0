Return-Path: <linux-clk+bounces-274-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1745D7EEE77
	for <lists+linux-clk@lfdr.de>; Fri, 17 Nov 2023 10:28:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 483D61C20A63
	for <lists+linux-clk@lfdr.de>; Fri, 17 Nov 2023 09:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AE1E12E5E;
	Fri, 17 Nov 2023 09:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dQCoY1Ff"
X-Original-To: linux-clk@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 400E0D51;
	Fri, 17 Nov 2023 01:28:28 -0800 (PST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AH68obv025683;
	Fri, 17 Nov 2023 09:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=tV4ChuQEIG4h7iNbZIHpIZiDq4WwG3YyiYQ4bU1vDgI=;
 b=dQCoY1Ffupq9TlsNG33421g9qNpFCelNw4+KA25JPqkpQRDCKonMep3zKxozkCyOGS1M
 VffPHUtDDXiI9QXxeczCAbrZafBXojPf6V+HnKFjyOTP4NUjgKWTaKoUl5UAqH1i9Ibx
 wii+TdoHaICfYnP6ZdGfUcdb+jYVCSf7UlqftqvNODfciovJ9YPZukEEZJ63K89nlBzl
 mmrzFLHkdtWQwDcd1YETdxDE0T2ZqvnvDL5jvpoS7Me1cuseTMmOpa/y8qP41yvpkYfM
 jyp9rrbCk/DEq9z2oKbPlvTwOn9trysAMaQyv/EtKtokNGyUhGcHDvw+EQsxRtEk4Tvf 0A== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ue2na0dr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 09:28:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AH9SNP5007377
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 09:28:23 GMT
Received: from blr-ubuntu-87.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Fri, 17 Nov 2023 01:28:17 -0800
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC: <agross@kernel.org>, <conor+dt@kernel.org>, <quic_tdas@quicinc.com>,
        <quic_rjendra@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <neil.armstrong@linaro.org>,
        <abel.vesa@linaro.org>, <quic_tsoni@quicinc.com>,
        Sibi Sankar
	<quic_sibis@quicinc.com>
Subject: [PATCH V2 3/4] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC bindings for X1E80100
Date: Fri, 17 Nov 2023 14:57:36 +0530
Message-ID: <20231117092737.28362-4-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231117092737.28362-1-quic_sibis@quicinc.com>
References: <20231117092737.28362-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Kxctvb5vt1grnOIYzt5McQScF6LOd4Vh
X-Proofpoint-ORIG-GUID: Kxctvb5vt1grnOIYzt5McQScF6LOd4Vh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_07,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=897 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311170069

From: Rajendra Nayak <quic_rjendra@quicinc.com>

Add bindings and update documentation for clock rpmh driver on X1E80100
SoCs.

Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
Co-developed-by: Sibi Sankar <quic_sibis@quicinc.com>
Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

v2:
* Update the part number from sc8380xp to x1e80100.
* Pick-up Rbs from the list.

 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 4eb5e59f6772..603da187d62e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -35,6 +35,7 @@ properties:
       - qcom,sm8350-rpmh-clk
       - qcom,sm8450-rpmh-clk
       - qcom,sm8550-rpmh-clk
+      - qcom,x1e80100-rpmh-clk
 
   clocks:
     maxItems: 1
-- 
2.17.1


