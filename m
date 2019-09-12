Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A655DB10D0
	for <lists+linux-clk@lfdr.de>; Thu, 12 Sep 2019 16:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732563AbfILOPn (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 12 Sep 2019 10:15:43 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37946 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732480AbfILOPn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Sep 2019 10:15:43 -0400
Received: by mail-wr1-f65.google.com with SMTP id l11so28624805wrx.5
        for <linux-clk@vger.kernel.org>; Thu, 12 Sep 2019 07:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z05c2SbQyHgmdiyuA9SdCH+TDRrblP4cUHUsGoERNgM=;
        b=PUmIQ5HDdUAHPqQqa2qkOdoCcTkoTOmHBainGMaiWInzyotClK6/EvL+Lr5NX2w2pn
         /51IqSxwmwlUB11nQJO51XWYrN1f8TZQrQSR+nsWJc0ru1KXHDZtduvWYvTLNImSiWba
         7cylqwtEiPEzC/LQD+1vb9adi8MeFrOafQpA9S3CfQnT0t7TGUegUPHp6wPAMTNF7bZD
         ZUtzngU4q3yceUwhcFiPt9gur5UX4H86SzjybcQgVnzuwzmBElqZv9deF+wovJ22gHWO
         VjAx1hVSxrAkSivUMHqHJC1XKXjrUr7xm7sWTtPFJJg3KJAZZvqj+Vf5T2pWyEVVv3bX
         O/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z05c2SbQyHgmdiyuA9SdCH+TDRrblP4cUHUsGoERNgM=;
        b=a9orVlhK2R2DFyTCuYYTkiLHRZ69jI5Z/AELdxVRK0CMln3KRRFMBfidl4/Jxrsaxf
         AlffWCuNW/yQ/i4B2f3ZccWkdUBiHGqkFDTSK0ATHenstydJBgsxi8X7EmQ1kRs1snhL
         CZmALAyaSqXvwukaddoqLEwYA7KVkbeRs2UcoIFPINPP03/EZml/x+L1b/0ghrwnRhqL
         bquoPGrN4iP1cftHeCjrA7rd1WEkgkX/duuYCKcipi6Fgz9amOKFnDJyM2yAbT/CoY4A
         0VryLdlP/C05mSdO+/lNEZXp/10NqnigzZsxkZhi2DMz42MwYf3vRkrPWKq8hGMdPkKC
         g9Ng==
X-Gm-Message-State: APjAAAXKhv/1+jlilk8D5bk5zx5Tm/AhmqsdUrhvW+EHNCrSx2i/6/6b
        QAuehvkl50tL2qsPcpJRNKf2sw==
X-Google-Smtp-Source: APXvYqyhMKOViR6GZTbCm1+FFBtUvh+7AEdHliZLV0+hczJUYYUBhFvGhSeEqdjd07H0xRiliAQpBg==
X-Received: by 2002:a5d:650d:: with SMTP id x13mr2334646wru.37.1568297741707;
        Thu, 12 Sep 2019 07:15:41 -0700 (PDT)
Received: from localhost.localdomain (69.red-83-35-113.dynamicip.rima-tde.net. [83.35.113.69])
        by smtp.gmail.com with ESMTPSA id p23sm137599wma.18.2019.09.12.07.15.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 12 Sep 2019 07:15:41 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org,
        agross@kernel.org, mturquette@baylibre.com,
        bjorn.andersson@linaro.org
Cc:     niklas.cassel@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] clk: qcom: gcc: limit GPLL0_AO_OUT operating frequency
Date:   Thu, 12 Sep 2019 16:15:30 +0200
Message-Id: <20190912141534.28870-2-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190912141534.28870-1-jorge.ramirez-ortiz@linaro.org>
References: <20190912141534.28870-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Limit the GPLL0_AO_OUT_MAIN operating frequency as per its hardware
specifications.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 8 ++++++++
 drivers/clk/qcom/clk-alpha-pll.h | 1 +
 drivers/clk/qcom/gcc-qcs404.c    | 2 +-
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 0ced4a5a9a17..ef51f302bdf0 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -730,6 +730,14 @@ static long alpha_pll_huayra_round_rate(struct clk_hw *hw, unsigned long rate,
 	return alpha_huayra_pll_round_rate(rate, *prate, &l, &a);
 }
 
+const struct clk_ops clk_alpha_pll_fixed_ops = {
+	.enable = clk_alpha_pll_enable,
+	.disable = clk_alpha_pll_disable,
+	.is_enabled = clk_alpha_pll_is_enabled,
+	.recalc_rate = clk_alpha_pll_recalc_rate,
+};
+EXPORT_SYMBOL_GPL(clk_alpha_pll_fixed_ops);
+
 const struct clk_ops clk_alpha_pll_ops = {
 	.enable = clk_alpha_pll_enable,
 	.disable = clk_alpha_pll_disable,
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 66755f0f84fc..6b4eb74706b4 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -104,6 +104,7 @@ struct alpha_pll_config {
 };
 
 extern const struct clk_ops clk_alpha_pll_ops;
+extern const struct clk_ops clk_alpha_pll_fixed_ops;
 extern const struct clk_ops clk_alpha_pll_hwfsm_ops;
 extern const struct clk_ops clk_alpha_pll_postdiv_ops;
 extern const struct clk_ops clk_alpha_pll_huayra_ops;
diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index 29cf464dd2c8..18c6563889f3 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -330,7 +330,7 @@ static struct clk_alpha_pll gpll0_ao_out_main = {
 			.parent_names = (const char *[]){ "cxo" },
 			.num_parents = 1,
 			.flags = CLK_IS_CRITICAL,
-			.ops = &clk_alpha_pll_ops,
+			.ops = &clk_alpha_pll_fixed_ops,
 		},
 	},
 };
-- 
2.23.0

