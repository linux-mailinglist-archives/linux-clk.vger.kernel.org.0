Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB20C4BD54C
	for <lists+linux-clk@lfdr.de>; Mon, 21 Feb 2022 06:25:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344417AbiBUFXf (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 21 Feb 2022 00:23:35 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:49154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344396AbiBUFXd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Feb 2022 00:23:33 -0500
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77EEEF32;
        Sun, 20 Feb 2022 21:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1645420992; x=1676956992;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=uNp4RSZh2KVJ+kj1Q/Nraz3VZq+QnhRWTwAGyobmdwE=;
  b=KDBo8ROVyAycSL9pvLgA0NBZiUxLd9j17l0zKmk2jBwtj7kXTXX4nUvF
   /voptS0QPgFoSSl5Cj9Xy9d8hoSCFVF8Enm/8KpL9M3fEsu53WgSkJhtf
   OdeK7QMpsT5wGV2VShFyP37EWg0utHuZoSjfPnAj93bIh49XfuLEh5kre
   s=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 20 Feb 2022 21:23:11 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 20 Feb 2022 21:23:09 -0800
X-QCInternal: smtphost
Received: from hu-rohiagar-hyd.qualcomm.com (HELO hu-sgudaval-hyd.qualcomm.com) ([10.213.106.138])
  by ironmsg02-blr.qualcomm.com with ESMTP; 21 Feb 2022 10:52:57 +0530
Received: by hu-sgudaval-hyd.qualcomm.com (Postfix, from userid 3970568)
        id 333FB46C2; Mon, 21 Feb 2022 10:52:56 +0530 (+0530)
From:   Rohit Agarwal <quic_rohiagar@quicinc.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rohit Agarwal <quic_rohiagar@quicinc.com>
Subject: [PATCH v3 7/7] clk: qcom: Add SDX65 APCS clock controller support
Date:   Mon, 21 Feb 2022 10:52:33 +0530
Message-Id: <1645420953-21176-8-git-send-email-quic_rohiagar@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1645420953-21176-1-git-send-email-quic_rohiagar@quicinc.com>
References: <1645420953-21176-1-git-send-email-quic_rohiagar@quicinc.com>
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Update APCS Kconfig to reflect support for SDX65
APCS clock controller.

Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
---
 drivers/clk/qcom/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 5159a1d..a2fa9af 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -55,13 +55,13 @@ config QCOM_CLK_APCC_MSM8996
 	  drivers for dynamic power management.
 
 config QCOM_CLK_APCS_SDX55
-	tristate "SDX55 APCS Clock Controller"
+	tristate "SDX55 and SDX65 APCS Clock Controller"
 	depends on QCOM_APCS_IPC || COMPILE_TEST
 	help
-	  Support for the APCS Clock Controller on SDX55 platform. The
+	  Support for the APCS Clock Controller on SDX55, SDX65 platform. The
 	  APCS is managing the mux and divider which feeds the CPUs.
 	  Say Y if you want to support CPU frequency scaling on devices
-	  such as SDX55.
+	  such as SDX55, SDX65.
 
 config QCOM_CLK_RPM
 	tristate "RPM based Clock Controller"
-- 
2.7.4

