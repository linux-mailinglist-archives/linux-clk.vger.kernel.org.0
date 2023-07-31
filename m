Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E37D07693A2
	for <lists+linux-clk@lfdr.de>; Mon, 31 Jul 2023 12:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231447AbjGaKyO (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 31 Jul 2023 06:54:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231694AbjGaKxY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 31 Jul 2023 06:53:24 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69D0B1AC
        for <linux-clk@vger.kernel.org>; Mon, 31 Jul 2023 03:52:31 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fe216edaf7so3400146e87.0
        for <linux-clk@vger.kernel.org>; Mon, 31 Jul 2023 03:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690800749; x=1691405549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l9Bhu6RTLTlOkPYdGmzCZK+SJ0ApPA44TktqVizGV/E=;
        b=FSUpixS0hEpsX4k5+RZtCv+grVSWkMzhl7ckPmhqiFjgWNm/8sETE9LA1ApZFoeJN3
         rcvrR/g3U8znOLvXWkky24LyjibQu3Xol3qJzV5F3s+Eo5T9LatyLBlJRmxhAWUxEzTx
         SZj2plIjO7jeutg2P7mHeuOLrBK+ERJRNETHug7BDtap98h6zTlPv44vaGdCSzUgQ1k2
         hwTzfmyX7ouEusn3YKHv7gQtJ7ciiw75J0afTK/KUw+CGVHrrU1hMKHpxIM3iEDFQjVw
         n7fojc3hpq7bYZ9pDxrlFQXrGI77JMIU9gW8Ee4EqaVgo636qMzZE7nzmA9dzqCSuP1H
         /zwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690800749; x=1691405549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l9Bhu6RTLTlOkPYdGmzCZK+SJ0ApPA44TktqVizGV/E=;
        b=Sb6dRoIrNbe/e+7KdsibD7azCPb6cOKp8UNmWFmbRoE49T+yKVMFJunF/Z57WBr8Pc
         j2nJDIXMCO2LHr5FWQ3MFTNqitjBONx/WD6U0RiXoMJCuGyjo0IL1B9vOz65svEsUFl8
         l8v1lR+caLndjGHz4mbV3dLpddvnvYzC5h9ZciDfMUA+8Ilmog5e01I9g307vNSBZI2H
         Combs0eI18gl40459KYr+awPHNJLZpWgXoWNMwiC3QiKvfGEZN1cNbSgIm2BMTh0g0Kr
         A6xP1/z5wxoW4QYp/XHpPJh9Uq5y9z3DV19DVo3yYJwrVYt/te7idIDtVtKSU2cVF+DT
         OEfw==
X-Gm-Message-State: ABy/qLYsykUNp5HFYKO8TP9LjO254zbb0NO5d3bsa54f4UgTQJ3/JkjW
        OvwAAcJ5qi/YyNJYgpbqrzEhqg==
X-Google-Smtp-Source: APBJJlFTyKs/df9RaZ1Xt9snM4RevMAXejq8I6kL+/M1oHFu77O7JE7Zs3duk9rY6ps0sdDTiynjZQ==
X-Received: by 2002:a05:6512:3d03:b0:4fe:d15:e1d2 with SMTP id d3-20020a0565123d0300b004fe0d15e1d2mr4513778lfv.12.1690800749652;
        Mon, 31 Jul 2023 03:52:29 -0700 (PDT)
Received: from [192.168.1.101] (abyk53.neoplus.adsl.tpnet.pl. [83.9.30.53])
        by smtp.gmail.com with ESMTPSA id p13-20020a05651238cd00b004fdc7ec5cbesm2016936lft.300.2023.07.31.03.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 03:52:29 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 31 Jul 2023 12:52:17 +0200
Subject: [PATCH v2 01/10] interconnect: qcom: icc-rpm: Add AB/IB
 calculations coefficients
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230726-topic-icc_coeff-v2-1-8c91c6c76076@linaro.org>
References: <20230726-topic-icc_coeff-v2-0-8c91c6c76076@linaro.org>
In-Reply-To: <20230726-topic-icc_coeff-v2-0-8c91c6c76076@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690800744; l=3264;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=lpOHcFckHwWSXO0TNoVaSaP1oz53efg+tMkW6PdBjnc=;
 b=xSKtpZGlZ8hRkYD/YnLis4ISWkfIYAvXQnkKNd55WCVskwpczntaGE8fD2lwyIScAHZSOkPFg
 QJQpn+OY9NkAZ+oESsOmV2i6bTyGzdHwHqZK9mZ2ryD3k2vnb7HZQX6
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Presumably due to the hardware being so complex, some nodes (or busses)
have different (usually higher) requirements for bandwidth than what
the usual calculations would suggest.

Looking at the available downstream files, it seems like AB values are
adjusted per-bus and IB values are adjusted per-node.
With that in mind, introduce percentage-based coefficient struct members
and use them in the calculations.

One thing to note is that the IB coefficient is inverse (100/ib_percent)
which feels a bit backwards, but it's necessary for precision..

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/icc-rpm.c | 14 +++++++++++---
 drivers/interconnect/qcom/icc-rpm.h |  6 ++++++
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
index 2c16917ba1fd..a837d20af79e 100644
--- a/drivers/interconnect/qcom/icc-rpm.c
+++ b/drivers/interconnect/qcom/icc-rpm.c
@@ -298,7 +298,8 @@ static int qcom_icc_bw_aggregate(struct icc_node *node, u32 tag, u32 avg_bw,
  */
 static void qcom_icc_bus_aggregate(struct icc_provider *provider, u64 *agg_clk_rate)
 {
-	u64 agg_avg_rate, agg_rate;
+	struct qcom_icc_provider *qp = to_qcom_provider(provider);
+	u64 agg_avg_rate, agg_peak_rate, agg_rate;
 	struct qcom_icc_node *qn;
 	struct icc_node *node;
 	int i;
@@ -315,8 +316,15 @@ static void qcom_icc_bus_aggregate(struct icc_provider *provider, u64 *agg_clk_r
 			else
 				agg_avg_rate = qn->sum_avg[i];
 
-			agg_rate = max_t(u64, agg_avg_rate, qn->max_peak[i]);
-			do_div(agg_rate, qn->buswidth);
+			if (qp->ab_coeff)
+				agg_avg_rate = mult_frac(qp->ab_coeff, agg_avg_rate, 100);
+
+			if (qp->ib_coeff)
+				agg_peak_rate = mult_frac(100, qn->max_peak[i], qp->ib_coeff);
+			else
+				agg_peak_rate = qn->max_peak[i];
+
+			agg_rate = max_t(u64, agg_avg_rate, agg_peak_rate);
 
 			agg_clk_rate[i] = max_t(u64, agg_clk_rate[i], agg_rate);
 		}
diff --git a/drivers/interconnect/qcom/icc-rpm.h b/drivers/interconnect/qcom/icc-rpm.h
index eed3451af3e6..5e7d6a4fd2f3 100644
--- a/drivers/interconnect/qcom/icc-rpm.h
+++ b/drivers/interconnect/qcom/icc-rpm.h
@@ -44,6 +44,8 @@ struct rpm_clk_resource {
  * @type: the ICC provider type
  * @regmap: regmap for QoS registers read/write access
  * @qos_offset: offset to QoS registers
+ * @ab_coeff: a percentage-based coefficient for compensating the AB calculations
+ * @ib_coeff: an inverse-percentage-based coefficient for compensating the IB calculations
  * @bus_clk_rate: bus clock rate in Hz
  * @bus_clk_desc: a pointer to a rpm_clk_resource description of bus clocks
  * @bus_clk: a pointer to a HLOS-owned bus clock
@@ -57,6 +59,8 @@ struct qcom_icc_provider {
 	enum qcom_icc_type type;
 	struct regmap *regmap;
 	unsigned int qos_offset;
+	u16 ab_coeff;
+	u16 ib_coeff;
 	u32 bus_clk_rate[QCOM_SMD_RPM_STATE_NUM];
 	const struct rpm_clk_resource *bus_clk_desc;
 	struct clk *bus_clk;
@@ -123,6 +127,8 @@ struct qcom_icc_desc {
 	enum qcom_icc_type type;
 	const struct regmap_config *regmap_cfg;
 	unsigned int qos_offset;
+	u16 ab_coeff;
+	u16 ib_coeff;
 };
 
 /* Valid for all bus types */

-- 
2.41.0

