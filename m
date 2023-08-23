Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8A9C7853D3
	for <lists+linux-clk@lfdr.de>; Wed, 23 Aug 2023 11:26:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235064AbjHWJZy (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 23 Aug 2023 05:25:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235068AbjHWIxl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Aug 2023 04:53:41 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C62F51BEC;
        Wed, 23 Aug 2023 01:51:08 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37N7kMOq012185;
        Wed, 23 Aug 2023 08:50:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=2/yf5uT0zL481EAjDnvaec+OWBfPrjCMDWVDhD/GUx0=;
 b=XfkKqnNV4GSv38hY3D7QZLMZS0NujKPtZA1RpDcm1Y/GXz0XoT+5pTeVeFxtwXoobp2h
 yu33P1zFLXrrgzGXivg4pqBslWMv4+PG1fyAn26/UxWDf1YohJfut87RP6Z3yxZhwKKP
 7DOwck3bcClsEIf/MG3pZHXJzffdl2Zq35n8YrJdLIUtU2oorktSegC/Uth3VgSBsFeX
 RUe0BW1C2dIro16t1KMMqyDDzvDlIODOEfkGKpe0bPOe2jbiV8Vl7OQJY42izd3YntIi
 lN2zROZKQOXrAZltH/CFKHC+PqAuWIGfjNriBfKy6FYuJwyskrA4KvqefjYybNrQwg9H 9A== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sn24j1k13-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 23 Aug 2023 08:50:53 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37N8oroI022403
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 23 Aug 2023 08:50:53 GMT
Received: from akronite-sh-dev02.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 23 Aug 2023 01:50:48 -0700
From:   Luo Jie <quic_luoj@quicinc.com>
To:     <andersson@kernel.org>, <agross@kernel.org>,
        <konrad.dybcio@linaro.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <p.zabel@pengutronix.de>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_srichara@quicinc.com>
Subject: [PATCH v5 0/4] add clock controller of qca8386/qca8084
Date:   Wed, 23 Aug 2023 16:50:27 +0800
Message-ID: <20230823085031.27252-1-quic_luoj@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nxGIqyc4Hkq5HWo3GyPOjlC5gRbka9Xn
X-Proofpoint-GUID: nxGIqyc4Hkq5HWo3GyPOjlC5gRbka9Xn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-23_06,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 mlxscore=0
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308230080
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

qca8xxx is 4 * 2.5GBaseT ports chip, working as switch mode
named by qca8386, or working as PHY mode named by qca8084,
clock hardware reigster is accessed by MDIO bus.

This patch series add the clock controller of qca8363/qca8084,
and add the clock ops clk_branch2_mdio_ops to avoid spin lock
used during the clock operation of qca8k clock controller where
the sleep happens when accessing clock control register by MDIO
bus.

Changes in v2:
	* remove clock flag CLK_ENABLE_MUTEX_LOCK.
	* add clock ops clk_branch2_qca8k_ops.
	* improve yaml file for fixing dtschema warnings.
	* enable clock controller driver in defconfig.

Changes in v3:
	* rename clk_branch2_qca8k_ops to clk_branch2_mdio_ops.
	* fix review comments on yaml file.
	* use dev_err_probe on driver probe error.
	* only use the compatible "qcom,qca8084-nsscc".
	* remove enable clock controller driver patch.

Changes in v4:
	* add _qcom_cc_really_probe function.
	* commonizing the probe function.
	* remove flag CLK_IS_CRITICAL from clocks only needed
	to be enabled in switch device.
	* update device tree property reg to 0x10. 

Changes in v5:
	* commonize qcom_cc_really_probe.
	* add halt_check for the branch clocks.
	* fix the review comments on nsscc-qca8k.c. 

Luo Jie (4):
  clk: qcom: branch: Add clk_branch2_mdio_ops
  dt-bindings: clock: add qca8386/qca8084 clock and reset definitions
  clk: qcom: common: commonize qcom_cc_really_probe
  clk: qcom: add clock controller driver for qca8386/qca8084

 .../bindings/clock/qcom,qca8k-nsscc.yaml      |   79 +
 drivers/clk/qcom/Kconfig                      |    8 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/apss-ipq6018.c               |    2 +-
 drivers/clk/qcom/camcc-sc7180.c               |    2 +-
 drivers/clk/qcom/camcc-sc7280.c               |    2 +-
 drivers/clk/qcom/camcc-sdm845.c               |    2 +-
 drivers/clk/qcom/camcc-sm6350.c               |    2 +-
 drivers/clk/qcom/camcc-sm8250.c               |    2 +-
 drivers/clk/qcom/camcc-sm8450.c               |    2 +-
 drivers/clk/qcom/clk-branch.c                 |    7 +
 drivers/clk/qcom/clk-branch.h                 |    1 +
 drivers/clk/qcom/common.c                     |    7 +-
 drivers/clk/qcom/common.h                     |    2 +-
 drivers/clk/qcom/dispcc-qcm2290.c             |    2 +-
 drivers/clk/qcom/dispcc-sc7180.c              |    2 +-
 drivers/clk/qcom/dispcc-sc7280.c              |    2 +-
 drivers/clk/qcom/dispcc-sc8280xp.c            |    2 +-
 drivers/clk/qcom/dispcc-sdm845.c              |    2 +-
 drivers/clk/qcom/dispcc-sm6115.c              |    2 +-
 drivers/clk/qcom/dispcc-sm6125.c              |    2 +-
 drivers/clk/qcom/dispcc-sm6350.c              |    2 +-
 drivers/clk/qcom/dispcc-sm6375.c              |    2 +-
 drivers/clk/qcom/dispcc-sm8250.c              |    2 +-
 drivers/clk/qcom/dispcc-sm8450.c              |    2 +-
 drivers/clk/qcom/dispcc-sm8550.c              |    2 +-
 drivers/clk/qcom/gcc-ipq6018.c                |    2 +-
 drivers/clk/qcom/gcc-ipq8074.c                |    2 +-
 drivers/clk/qcom/gcc-mdm9607.c                |    2 +-
 drivers/clk/qcom/gcc-mdm9615.c                |    2 +-
 drivers/clk/qcom/gcc-msm8917.c                |    2 +-
 drivers/clk/qcom/gcc-msm8939.c                |    2 +-
 drivers/clk/qcom/gcc-msm8953.c                |    2 +-
 drivers/clk/qcom/gcc-msm8976.c                |    2 +-
 drivers/clk/qcom/gcc-msm8996.c                |    2 +-
 drivers/clk/qcom/gcc-msm8998.c                |    2 +-
 drivers/clk/qcom/gcc-qcm2290.c                |    2 +-
 drivers/clk/qcom/gcc-qcs404.c                 |    2 +-
 drivers/clk/qcom/gcc-qdu1000.c                |    2 +-
 drivers/clk/qcom/gcc-sa8775p.c                |    2 +-
 drivers/clk/qcom/gcc-sc7180.c                 |    2 +-
 drivers/clk/qcom/gcc-sc7280.c                 |    2 +-
 drivers/clk/qcom/gcc-sc8180x.c                |    2 +-
 drivers/clk/qcom/gcc-sc8280xp.c               |    2 +-
 drivers/clk/qcom/gcc-sdm660.c                 |    2 +-
 drivers/clk/qcom/gcc-sdm845.c                 |    2 +-
 drivers/clk/qcom/gcc-sdx55.c                  |    2 +-
 drivers/clk/qcom/gcc-sdx65.c                  |    2 +-
 drivers/clk/qcom/gcc-sdx75.c                  |    2 +-
 drivers/clk/qcom/gcc-sm6115.c                 |    2 +-
 drivers/clk/qcom/gcc-sm6125.c                 |    2 +-
 drivers/clk/qcom/gcc-sm6350.c                 |    2 +-
 drivers/clk/qcom/gcc-sm6375.c                 |    2 +-
 drivers/clk/qcom/gcc-sm7150.c                 |    2 +-
 drivers/clk/qcom/gcc-sm8150.c                 |    2 +-
 drivers/clk/qcom/gcc-sm8250.c                 |    2 +-
 drivers/clk/qcom/gcc-sm8350.c                 |    2 +-
 drivers/clk/qcom/gcc-sm8450.c                 |    2 +-
 drivers/clk/qcom/gcc-sm8550.c                 |    2 +-
 drivers/clk/qcom/gpucc-msm8998.c              |    2 +-
 drivers/clk/qcom/gpucc-sa8775p.c              |    2 +-
 drivers/clk/qcom/gpucc-sc7180.c               |    2 +-
 drivers/clk/qcom/gpucc-sc7280.c               |    2 +-
 drivers/clk/qcom/gpucc-sc8280xp.c             |    2 +-
 drivers/clk/qcom/gpucc-sdm660.c               |    2 +-
 drivers/clk/qcom/gpucc-sdm845.c               |    2 +-
 drivers/clk/qcom/gpucc-sm6115.c               |    2 +-
 drivers/clk/qcom/gpucc-sm6125.c               |    2 +-
 drivers/clk/qcom/gpucc-sm6350.c               |    2 +-
 drivers/clk/qcom/gpucc-sm6375.c               |    2 +-
 drivers/clk/qcom/gpucc-sm8150.c               |    2 +-
 drivers/clk/qcom/gpucc-sm8250.c               |    2 +-
 drivers/clk/qcom/gpucc-sm8350.c               |    2 +-
 drivers/clk/qcom/gpucc-sm8450.c               |    2 +-
 drivers/clk/qcom/gpucc-sm8550.c               |    2 +-
 drivers/clk/qcom/lcc-ipq806x.c                |    2 +-
 drivers/clk/qcom/lcc-mdm9615.c                |    2 +-
 drivers/clk/qcom/lcc-msm8960.c                |    2 +-
 drivers/clk/qcom/lpassaudiocc-sc7280.c        |    4 +-
 drivers/clk/qcom/lpasscorecc-sc7180.c         |    2 +-
 drivers/clk/qcom/lpasscorecc-sc7280.c         |    2 +-
 drivers/clk/qcom/mmcc-msm8960.c               |    2 +-
 drivers/clk/qcom/mmcc-msm8974.c               |    2 +-
 drivers/clk/qcom/mmcc-msm8994.c               |    2 +-
 drivers/clk/qcom/mmcc-msm8996.c               |    2 +-
 drivers/clk/qcom/mmcc-msm8998.c               |    2 +-
 drivers/clk/qcom/mmcc-sdm660.c                |    2 +-
 drivers/clk/qcom/nsscc-qca8k.c                | 2178 +++++++++++++++++
 drivers/clk/qcom/tcsrcc-sm8550.c              |    2 +-
 drivers/clk/qcom/videocc-sc7180.c             |    2 +-
 drivers/clk/qcom/videocc-sc7280.c             |    2 +-
 drivers/clk/qcom/videocc-sdm845.c             |    2 +-
 drivers/clk/qcom/videocc-sm8150.c             |    2 +-
 drivers/clk/qcom/videocc-sm8250.c             |    2 +-
 drivers/clk/qcom/videocc-sm8350.c             |    2 +-
 drivers/clk/qcom/videocc-sm8450.c             |    2 +-
 drivers/clk/qcom/videocc-sm8550.c             |    2 +-
 include/dt-bindings/clock/qcom,qca8k-nsscc.h  |  101 +
 include/dt-bindings/reset/qcom,qca8k-nsscc.h  |   75 +
 99 files changed, 2544 insertions(+), 95 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,qca8k-nsscc.yaml
 create mode 100644 drivers/clk/qcom/nsscc-qca8k.c
 create mode 100644 include/dt-bindings/clock/qcom,qca8k-nsscc.h
 create mode 100644 include/dt-bindings/reset/qcom,qca8k-nsscc.h


base-commit: 6176b8c4a19e150c4176b1ed93174e2f5965c4b5
-- 
2.17.1

