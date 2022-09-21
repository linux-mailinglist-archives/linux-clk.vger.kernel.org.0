Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AC425BF25D
	for <lists+linux-clk@lfdr.de>; Wed, 21 Sep 2022 02:45:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231400AbiIUApN (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 20 Sep 2022 20:45:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231425AbiIUApL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Sep 2022 20:45:11 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E33078584
        for <linux-clk@vger.kernel.org>; Tue, 20 Sep 2022 17:45:09 -0700 (PDT)
Received: from localhost.localdomain (95.49.29.188.neoplus.adsl.tpnet.pl [95.49.29.188])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id B31FB3F62F;
        Wed, 21 Sep 2022 02:45:04 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: clock: qcom: rpmcc: Add BIMC_FREQ_LOG
Date:   Wed, 21 Sep 2022 02:44:57 +0200
Message-Id: <20220921004458.151842-2-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220921004458.151842-1-konrad.dybcio@somainline.org>
References: <20220921004458.151842-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the missing definition for the aforementioned clock.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
No changes

 include/dt-bindings/clock/qcom,rpmcc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/qcom,rpmcc.h b/include/dt-bindings/clock/qcom,rpmcc.h
index 015db95303d1..c0ad624e930e 100644
--- a/include/dt-bindings/clock/qcom,rpmcc.h
+++ b/include/dt-bindings/clock/qcom,rpmcc.h
@@ -167,5 +167,6 @@
 #define RPM_SMD_CPUSS_GNOC_A_CLK		121
 #define RPM_SMD_MSS_CFG_AHB_CLK		122
 #define RPM_SMD_MSS_CFG_AHB_A_CLK		123
+#define RPM_SMD_BIMC_FREQ_LOG			124
 
 #endif
-- 
2.37.3

