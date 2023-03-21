Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 100786C38C4
	for <lists+linux-clk@lfdr.de>; Tue, 21 Mar 2023 18:58:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbjCUR6b (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 21 Mar 2023 13:58:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230466AbjCUR61 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Mar 2023 13:58:27 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFA771CBCF
        for <linux-clk@vger.kernel.org>; Tue, 21 Mar 2023 10:58:07 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id h8so63014206ede.8
        for <linux-clk@vger.kernel.org>; Tue, 21 Mar 2023 10:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679421485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=beQg10Ver7dN23IwCsKB//20vr3DygviG7yoTEe+FxY=;
        b=QYAinkUisZBUcqo8VDaVOtNZcE9iFdEWTyzmy+5Vslhmfcvc2PXM46b3gIzf8PAWNg
         wk0cuUkFBYCNPNdWsdLs75cyRkOfwGriVmanTFGFlETNqFqo+vVRhE22syEXMoAc9YT+
         l3W4AOQF/7195XmOmm9TRVJ+f2Iu1nTZ/mW+CJZRAfSzResa+vuByUXUjgjkMWReRX2N
         /28pe7mcY0it3eefC1NF6gAxt+MYwlGEE+fSDAhzvXVeyFDiq2H3jJst7I1sJOOOSlWl
         H587CiPo+Mczy397Hvvc6VZ3O8LQZHVzD6AmcNx5XrHWiMLMVuVgF1gRtnWi3rhlBEcB
         go3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679421485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=beQg10Ver7dN23IwCsKB//20vr3DygviG7yoTEe+FxY=;
        b=jTacBwuOpyrJ7IhnpczQVT/1RzZTJH7sn8JCqgWSntI7x7Ova5p/vFoOolK6tFyN2P
         hFjsf572F6hY5t3CypYhHeuBTgzgpif1YskHRcYSeczui5H9LgTf0YqBFLQr5A8so6lo
         pucCxZU53Wdp/LofZvAOHP67aJWjc40ojQV34Hdov+QVXBrEnxET5Jy/bWu+JKKW1fHS
         FDTLUIxYCJJ/EOq+E7tkO9FfL9s9R2bZ51vvGVbKVYBIn4BFUaNzjMCnkdsxP0/ZAOl1
         jbI39+Pr37gV/zwSj1y3NliqGpdc0VYs+fkGkhB2Qm646KkRD8c0Vp2u4EtDqGvUZw+b
         5gXw==
X-Gm-Message-State: AO0yUKUADBEJIF87y4nX5IUvbOV0679gwB9v/9EpriRO3Kh77+ojv0tB
        PN1G9aClmQ+0yTZ+w61l+CFT+w==
X-Google-Smtp-Source: AK7set8gOMiqKZ8ghAMrSL9tsj+E0T5/dhTV2S9V9Tjnei/fZr6elg7a8benpEtAOLJHv9tHtR9fcA==
X-Received: by 2002:a17:906:2855:b0:92a:7178:ab56 with SMTP id s21-20020a170906285500b0092a7178ab56mr3498973ejc.39.1679421485742;
        Tue, 21 Mar 2023 10:58:05 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id p9-20020a1709060e8900b0093313f4fc3csm4887360ejf.70.2023.03.21.10.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 10:58:04 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     andersson@kernel.org, agross@kernel.org
Cc:     konrad.dybcio@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        stable@vger.kernel.org, Amit Pundir <amit.pundir@linaro.org>
Subject: [PATCH] clk: qcom: gfm-mux: use runtime pm while accessing registers
Date:   Tue, 21 Mar 2023 17:57:58 +0000
Message-Id: <20230321175758.26738-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

gfm mux driver does support runtime pm but we never use it while
accessing registers. Looks like this driver was getting lucky and
totally depending on other drivers to leave the clk on.

Fix this by doing runtime pm while accessing registers.

Fixes: a2d8f507803e ("clk: qcom: Add support to LPASS AUDIO_CC Glitch Free Mux clocks")
Cc: stable@vger.kernel.org
Reported-by: Amit Pundir <amit.pundir@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/clk/qcom/lpass-gfm-sm8250.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/lpass-gfm-sm8250.c b/drivers/clk/qcom/lpass-gfm-sm8250.c
index 96f476f24eb2..bcf0ea534f7f 100644
--- a/drivers/clk/qcom/lpass-gfm-sm8250.c
+++ b/drivers/clk/qcom/lpass-gfm-sm8250.c
@@ -38,14 +38,37 @@ struct clk_gfm {
 static u8 clk_gfm_get_parent(struct clk_hw *hw)
 {
 	struct clk_gfm *clk = to_clk_gfm(hw);
+	int ret;
+	u8 parent;
+
+	ret = pm_runtime_resume_and_get(clk->priv->dev);
+	if (ret < 0 && ret != -EACCES) {
+		dev_err_ratelimited(clk->priv->dev,
+				    "pm_runtime_resume_and_get failed in %s, ret %d\n",
+				    __func__, ret);
+		return ret;
+	}
+
+	parent = readl(clk->gfm_mux) & clk->mux_mask;
+
+	pm_runtime_mark_last_busy(clk->priv->dev);
 
-	return readl(clk->gfm_mux) & clk->mux_mask;
+	return parent;
 }
 
 static int clk_gfm_set_parent(struct clk_hw *hw, u8 index)
 {
 	struct clk_gfm *clk = to_clk_gfm(hw);
 	unsigned int val;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(clk->priv->dev);
+	if (ret < 0 && ret != -EACCES) {
+		dev_err_ratelimited(clk->priv->dev,
+				    "pm_runtime_resume_and_get failed in %s, ret %d\n",
+				    __func__, ret);
+		return ret;
+	}
 
 	val = readl(clk->gfm_mux);
 
@@ -57,6 +80,8 @@ static int clk_gfm_set_parent(struct clk_hw *hw, u8 index)
 
 	writel(val, clk->gfm_mux);
 
+	pm_runtime_mark_last_busy(clk->priv->dev);
+
 	return 0;
 }
 
@@ -251,6 +276,8 @@ static int lpass_gfm_clk_driver_probe(struct platform_device *pdev)
 	if (IS_ERR(cc->base))
 		return PTR_ERR(cc->base);
 
+	cc->dev = dev;
+
 	err = devm_pm_runtime_enable(dev);
 	if (err)
 		return err;
-- 
2.21.0

