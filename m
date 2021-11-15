Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52EB245282E
	for <lists+linux-clk@lfdr.de>; Tue, 16 Nov 2021 04:04:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242098AbhKPDH2 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 15 Nov 2021 22:07:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240953AbhKPDHG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Nov 2021 22:07:06 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99D85C10C145
        for <linux-clk@vger.kernel.org>; Mon, 15 Nov 2021 15:34:10 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id e9so39021725ljl.5
        for <linux-clk@vger.kernel.org>; Mon, 15 Nov 2021 15:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CWr1EeMoYrDdPrgeNpLvZbaGnBGlvAW/pRNybJFkHXs=;
        b=J0i+SahCYqbmr4ANgWbIyy/o6gvr1f+8IirIQR5/2L5SGuiG4W23PFc1i5S3mZJ0MV
         wAoxGgAQPehkpmLtzg91C2iyVABzhhreYdHud0xIb1mziO0VLPmPbvAAQm6IfPYOoErd
         OkkL7cD/JRceo/C9AnX3etGOrapU5smB/LTHhGoQ9ynRRaqM7oB+YSLWxbPpQAXmE0/t
         FsoQgDCEC1myzqkCNO1nb1SJAB7fKKTo+W17Xn15NuTmKxdfFcVu3YvTMEv3emz2Wta9
         HhTukKN7NGoBeDDbn6qQCuLt6nF7IweOXp3fzvQO3NRK/xIV5KOMEymIQvx0B8dXgenG
         vyWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CWr1EeMoYrDdPrgeNpLvZbaGnBGlvAW/pRNybJFkHXs=;
        b=b16bDPfta8MQp9b/QeADNyiNt0+fOA3BOCFEjjs825VO+JjcsuuN7E9kG8sLA7fx/R
         ZrrvNZ6Sj4lYvpZge/v0vJ3s6MEIfOhnTTCQht9B31FzzSw+CpFVS1eKN1UNfxWdxjJw
         OS+0T0D6yFASPMEGPc234FP6YpeDQ5oQXXq7eU4GIBJwjE0etv6FsXYKjKEPdv6hjD7y
         TMNTP/4DSdc4DBIVmLukP2Jl9iJdNFmPR1W2rxDQB4uO4zScKS75irmyRhiXG1TkTRje
         6jOLAYzLsKlWWlGAD4HIBSl46LxFocSD2mC3kzjCcLCFwVfYoP1I3Jf7QZH+7bw501wi
         MBsA==
X-Gm-Message-State: AOAM533KgWKwwzJzKbI2ZcgxZjNStuz76zcukQGbR7FhjHjh7KUaOuF3
        XLkvgVh6/0Xq/sj3JXWraQAUQw==
X-Google-Smtp-Source: ABdhPJymjFNYZZVb2r0qB7SgT5nPMJPemVYUG9zIXHI5oUIwaIh3DPr23dbyX01Lc0aSVLseJKRTgA==
X-Received: by 2002:a2e:a370:: with SMTP id i16mr2477990ljn.336.1637019248681;
        Mon, 15 Nov 2021 15:34:08 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m27sm1566546lfp.268.2021.11.15.15.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 15:34:08 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        stable@vger.kernel.org
Subject: [PATCH] clk: qcom: regmap-mux: fix parent clock lookup
Date:   Tue, 16 Nov 2021 02:34:07 +0300
Message-Id: <20211115233407.1046179-1-dmitry.baryshkov@linaro.org>
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
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

