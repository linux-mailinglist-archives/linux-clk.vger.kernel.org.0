Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABAC53B7088
	for <lists+linux-clk@lfdr.de>; Tue, 29 Jun 2021 12:24:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232898AbhF2K1J (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 29 Jun 2021 06:27:09 -0400
Received: from relay06.th.seeweb.it ([5.144.164.167]:40135 "EHLO
        relay06.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232892AbhF2K1J (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 Jun 2021 06:27:09 -0400
Received: from localhost.localdomain (bband-dyn27.178-40-203.t-com.sk [178.40.203.27])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 829173EBB7;
        Tue, 29 Jun 2021 12:24:40 +0200 (CEST)
From:   Martin Botka <martin.botka@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        paul.bouchara@somainline.org,
        Martin Botka <martin.botka@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v2 2/3] dt-bindings: clk: qcom: smd-rpm: Document SM6125 compatible
Date:   Tue, 29 Jun 2021 12:24:03 +0200
Message-Id: <20210629102405.192053-3-martin.botka@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629102405.192053-1-martin.botka@somainline.org>
References: <20210629102405.192053-1-martin.botka@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Document the newly added compatible for sm6125 rpmcc.

Signed-off-by: Martin Botka <martin.botka@somainline.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmcc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
index b44a0622fb3a..bc6ef573aa7c 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
@@ -24,6 +24,7 @@ Required properties :
 			"qcom,rpmcc-msm8998", "qcom,rpmcc"
 			"qcom,rpmcc-qcs404", "qcom,rpmcc"
 			"qcom,rpmcc-sdm660", "qcom,rpmcc"
+			"qcom,rpmcc-sm6125", "qcom,rpmcc"
 
 - #clock-cells : shall contain 1
 
-- 
2.32.0

