Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8940A454570
	for <lists+linux-clk@lfdr.de>; Wed, 17 Nov 2021 12:14:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236687AbhKQLQP (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 17 Nov 2021 06:16:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233710AbhKQLQP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 Nov 2021 06:16:15 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2E3CC061570
        for <linux-clk@vger.kernel.org>; Wed, 17 Nov 2021 03:13:16 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id b40so6490092lfv.10
        for <linux-clk@vger.kernel.org>; Wed, 17 Nov 2021 03:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EXIbkKZxAkyHyjuCL6JqGRGmyvREvEfhZ6nYCklz6yU=;
        b=HZrPnu20pO3jcpFidPz7JXjJNNGkS2LVTyW5C88qzkXMY7qKzGysIErgVFQtHAfegr
         5r1M5qZM5yhxoEP73rUhrZmKwKiwn1xvo8r92Y724kkzDcKwZw59YJVjUJvALXcLVrtR
         BT+RsVHrJc9qlchE/yvI2ra4s/J3PFndGaE6GC0qNNU522Q2VIZMbVzz/Ap9RKtieG3M
         KDNCZ3Qm2UJLS3cC0eJgutzln/6j5WL//67pSwzeU2crCzKSY6twjjLBNDzkYjp8sEIs
         PJ3rSkcAromGlHhbPm93WFhr0vpNOOEe1B3ka0oh+E+HJ/5NssGQIfrZEHQP7wgMxB24
         ywqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EXIbkKZxAkyHyjuCL6JqGRGmyvREvEfhZ6nYCklz6yU=;
        b=r0H8aIomA85p0kZz4pfdGrNxySr186IOtb8ZOlSwxfVxqSgCeLXQROWWZSNQvW35tK
         aPh3C6zmsFOgK4EtKAlDMQoF3j+3QxY5i/Mz/lF4M45hekuW4bnQRMonsvONrrJkuV0C
         4F+22tivQMPcHcbNFRZvEKdK7bpVBses8RWDFr2r5XDnog5M8SdIlhjxBdgbTYMnqF+T
         w/FqbbLqwV2vUC9dNg2V/PsqGltdvuXz+p381mMoFBIrjGWm28DsGUx1qRwBcuSr5JSs
         GsGrg1ssBDfmSw8sMI4LQLhyRUzuHuXvpQ4fUJw5rcrKay/N+MiW9SyfXUOLF24861+c
         lp2g==
X-Gm-Message-State: AOAM531otroJ3TmkEzGSm4AlRjJU5azwnSh7JnItLYg1A8RJV7j19+xY
        xGTbrTv9EDNiQ6SsKsnXcQzECK93pxeZGA==
X-Google-Smtp-Source: ABdhPJzXSzaUqHCF4jDisIbbluy18P4t2feSH/0R6ctMUI3qwffeGAUXVdXDgxtwN/T2ssWYulsMTA==
X-Received: by 2002:a05:6512:1520:: with SMTP id bq32mr14468705lfb.232.1637147595246;
        Wed, 17 Nov 2021 03:13:15 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f23sm2345057ljg.90.2021.11.17.03.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 03:13:14 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        stable@vger.kernel.org
Subject: [PATCH v2] clk: qcom: regmap-mux: fix parent clock lookup
Date:   Wed, 17 Nov 2021 14:13:14 +0300
Message-Id: <20211117111314.543781-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The function mux_get_parent() uses qcom_find_src_index() to find the
parent clock index, which is incorrect: qcom_find_src_index() uses src
enum for the lookup, while mux_get_parent() should use cfg field (which
corresponds to the register value). Add qcom_find_cfg_index() function
doing this kind of lookup and use it for mux parent lookup.

Fixes: df964016490b ("clk: qcom: add parent map for regmap mux")
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes since v1:
 - Added stable cc tag instead of manually Cc'ing the list.
---
 drivers/clk/qcom/clk-regmap-mux.c |  2 +-
 drivers/clk/qcom/common.c         | 12 ++++++++++++
 drivers/clk/qcom/common.h         |  2 ++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-regmap-mux.c b/drivers/clk/qcom/clk-regmap-mux.c
index b2d00b451963..45d9cca28064 100644
--- a/drivers/clk/qcom/clk-regmap-mux.c
+++ b/drivers/clk/qcom/clk-regmap-mux.c
@@ -28,7 +28,7 @@ static u8 mux_get_parent(struct clk_hw *hw)
 	val &= mask;
 
 	if (mux->parent_map)
-		return qcom_find_src_index(hw, mux->parent_map, val);
+		return qcom_find_cfg_index(hw, mux->parent_map, val);
 
 	return val;
 }
diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 60d2a78d1395..2af04fc4abfa 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -69,6 +69,18 @@ int qcom_find_src_index(struct clk_hw *hw, const struct parent_map *map, u8 src)
 }
 EXPORT_SYMBOL_GPL(qcom_find_src_index);
 
+int qcom_find_cfg_index(struct clk_hw *hw, const struct parent_map *map, u8 cfg)
+{
+	int i, num_parents = clk_hw_get_num_parents(hw);
+
+	for (i = 0; i < num_parents; i++)
+		if (cfg == map[i].cfg)
+			return i;
+
+	return -ENOENT;
+}
+EXPORT_SYMBOL_GPL(qcom_find_cfg_index);
+
 struct regmap *
 qcom_cc_map(struct platform_device *pdev, const struct qcom_cc_desc *desc)
 {
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index bb39a7e106d8..9c8f7b798d9f 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -49,6 +49,8 @@ extern void
 qcom_pll_set_fsm_mode(struct regmap *m, u32 reg, u8 bias_count, u8 lock_count);
 extern int qcom_find_src_index(struct clk_hw *hw, const struct parent_map *map,
 			       u8 src);
+extern int qcom_find_cfg_index(struct clk_hw *hw, const struct parent_map *map,
+			       u8 cfg);
 
 extern int qcom_cc_register_board_clk(struct device *dev, const char *path,
 				      const char *name, unsigned long rate);
-- 
2.33.0

