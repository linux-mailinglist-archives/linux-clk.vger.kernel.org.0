Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54D6A67C81E
	for <lists+linux-clk@lfdr.de>; Thu, 26 Jan 2023 11:15:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbjAZKPA (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 26 Jan 2023 05:15:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjAZKO7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Jan 2023 05:14:59 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8F77110;
        Thu, 26 Jan 2023 02:14:58 -0800 (PST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30Q91Eic020388;
        Thu, 26 Jan 2023 10:14:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=h+vmPxPfeK1+Sip+dbj1iRWCx9mbIQXFtYIghwmRAEA=;
 b=mdo5TeAiL9NwK2kHd8GBCk9LScXHD++NcGjQRqNSk74OkMObMD3TOyWFH+E4vtOLsssU
 QwkUd7DpOezaZ7anapidaVxf7/mSloueKuPZxzEBXP7P1QFrqB19iwid/wzbTqWW4jK7
 qf7R+Y+Fm1+5NPVg7sshqkHBCKLZnMywRoQ40dg9hA6z0ywP5lvXTl9TzJQM+4AuN0G5
 ibcKs5UcaZYNZnkLq8JgYEY8mO7AzRTAt/k81LXGduOcfYmSBYOwVO3PvpT+8JDIvqac
 4ooEThagBBiywngPqZcH/51klUtbc005UTzPjx0DP4R+fIPdNdhrzSHOrOky48eVg9g6 Gg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3najkhbt5t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 26 Jan 2023 10:14:45 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30QAEiBY014604
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 26 Jan 2023 10:14:44 GMT
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 26 Jan 2023 02:14:39 -0800
From:   Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To:     <swboyd@chromium.org>, <agross@kernel.org>, <andersson@kernel.org>,
        <robh+dt@kernel.org>, <broonie@kernel.org>,
        <quic_plai@quicinc.com>, <krzysztof.kozlowski+dt@linaro.org>,
        <konrad.dybcio@somainline.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_rohkumar@quicinc.com>
CC:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: [PATCH v6 0/6] Add resets for ADSP based audio clock controller driver
Date:   Thu, 26 Jan 2023 15:44:19 +0530
Message-ID: <1674728065-24955-1-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: C3P2uJTEnJXOENHa3djLIm-fiZB8iLrR
X-Proofpoint-GUID: C3P2uJTEnJXOENHa3djLIm-fiZB8iLrR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-26_03,2023-01-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 mlxlogscore=788 clxscore=1015
 lowpriorityscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301260097
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add resets and remove qdsp6ss clcok controller for audioreach based platforms. 

Changes since v5:
    -- Fix compilation issue.
Changes since v4:
    -- Update Fixes tag in Merge lpasscc into lpass_aon patch.
    -- Revert removal of clk_regmap structure in Merge lpasscc into lpass_aon patch.

Changes since v3:
    -- Remove duplicate clock resets patch.
    -- Add binding headers for q6 clocks.
    -- Create new patch for merging lpasscc q6 clocks into lpass_aon.
    -- Create new patches for handling conflicts of ADSP and bypass solution.

Changes since v2:
    -- Revert removing qdsp6ss clock control.
    -- Add Conditional check for qdsp6ss clock registration.
Changes since v1:
    -- Update commit message.
    -- Remove qdsp6ss clock control.

Srinivasa Rao Mandadapu (6):
  dt-bindings: clock: qcom,sc7280-lpasscc: Add qcom,adsp-pil-mode
    property
  dt-bindings: clock: lpassaudiocc-sc7280: Add binding headers for
    lpasscc
  clk: qcom: lpasscc-sc7280: Skip qdsp6ss clock registration
  clk: qcom: lpasscorecc-sc7280: Skip lpasscorecc registration
  clk: qcom: lpassaudiocc-sc7280: Merge lpasscc into lpass_aon
  clk: qcom: lpassaudiocc-sc7280: Skip lpass_aon_cc_pll config

 .../devicetree/bindings/clock/qcom,sc7280-lpasscc.yaml   |  7 +++++++
 drivers/clk/qcom/lpassaudiocc-sc7280.c                   | 16 +++++++++++-----
 drivers/clk/qcom/lpasscc-sc7280.c                        | 12 +++++++-----
 drivers/clk/qcom/lpasscorecc-sc7280.c                    |  3 +++
 include/dt-bindings/clock/qcom,lpassaudiocc-sc7280.h     |  2 ++
 5 files changed, 30 insertions(+), 10 deletions(-)

-- 
2.7.4

