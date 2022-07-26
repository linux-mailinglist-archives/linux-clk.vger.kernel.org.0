Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86DCD58151F
	for <lists+linux-clk@lfdr.de>; Tue, 26 Jul 2022 16:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239241AbiGZOXv (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 26 Jul 2022 10:23:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239207AbiGZOXu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 Jul 2022 10:23:50 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0091B28E2B
        for <linux-clk@vger.kernel.org>; Tue, 26 Jul 2022 07:23:47 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id bn9so9508224wrb.9
        for <linux-clk@vger.kernel.org>; Tue, 26 Jul 2022 07:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=67Kung7YNnKtWIpbVwyocJw5kSHWraC1xtSnaCDvJXU=;
        b=veuzAA2UYQLNvpy8h8QV2ZWzdOP4fC4yqJOXWuyxIPxsKrGdjp4t1/Q1FNBiMe4a7H
         0Io/7OBVJFx/jXt6mwc+qoVifk4dbjJ5LmqzMkahgaX1v+/Gqa6aWmiXLECE9WE9qAgB
         G3zSFOYSKubQJKoD8oGuJ+O1mmw6yWCbCphyWGXTQFl52IXxiiTLjSr5f6UBWJbbL+o0
         c7V72n6fS4fKqOf00ei9Ue34FW4fNstxbOagNiIbzNUZBgZ6CYU+FdHJem7iJhPDEUW2
         Cz+F1JeQAMtUKUIy+mZFww//eNE7xPnCZ1FMuMsPewbAB2bCplKAJMSgR76UHXA8aouD
         7WNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=67Kung7YNnKtWIpbVwyocJw5kSHWraC1xtSnaCDvJXU=;
        b=hO6NmGc4p+Bp0pTroCQe0wEZr6cSgXCbZ3hU8GzaMmyFisyZqzOLqcCNG7vwUACsbN
         JscS3MahiVGpGr4kD1AzhTVWs14sNeNxhiv5kZGkKIS/bTqRxIbsPNkzege7eP/B+7wE
         HjhZt9Zaid8+3LM49ye8AfLI1ntsDZwmYZG9i3pN5kJ9ZA9O7vjb4NbIYJVLCPQGZfbM
         XtiYwagoQbaKvwt3XfmQrKKlN4SZEI9pET6Uz3eCOSjMsMCCFYsSQBIboURj3rWZk3op
         23mQM9NdrXnBxtO8SmbHWzkhF2JWS1IUt020E9GKgmRmlva/jCW4758u8EshbgDGD80M
         fyWg==
X-Gm-Message-State: AJIora8MF/9OHpUa/ff/tHWuleZIz+LIK/zqKiioLTnwRL1ES+ko7xHA
        +VR1zNLPEVHE4UP9EO3Ii4okt81iU1V0KQ==
X-Google-Smtp-Source: AGRyM1tHDx6KLAsjX8mxUIEt8ym0CLyglaM4t6kgRaiIFyZIvTzO3F4zOki/jIerxgufztRtlzAilA==
X-Received: by 2002:adf:fcca:0:b0:21d:68ff:2e5a with SMTP id f10-20020adffcca000000b0021d68ff2e5amr11557233wrs.453.1658845426592;
        Tue, 26 Jul 2022 07:23:46 -0700 (PDT)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id t21-20020a1c7715000000b003a331c6bffdsm17017119wmi.47.2022.07.26.07.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 07:23:46 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
Subject: [RFC 3/9] clk: qcom: rcg: Add macros to collapse definition
Date:   Tue, 26 Jul 2022 17:22:57 +0300
Message-Id: <20220726142303.4126434-4-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20220726142303.4126434-1-abel.vesa@linaro.org>
References: <20220726142303.4126434-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add macros for a visually more compact rcg clocks definition,
one for each type of rcg2 ops struct. These are only the ones
used by gcc-sdm845 driver. More will be added later on.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/clk/qcom/clk-rcg.h | 40 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index 012e745794fd..e856d472a14e 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -180,6 +180,46 @@ struct clk_rcg_dfs_data {
 	struct clk_init_data *init;
 };
 
+#define __DEFINE_QCOM_CC_CLK_RCG2(_name, _cmd_rcgr, _mnd_width,		\
+				_hid_width, _parent_map, _freq_tbl,	\
+				_parent_data, _ops, _flags)		\
+	static struct clk_init_data _name##_init = {			\
+		.name = #_name,						\
+		.parent_data = _parent_data,				\
+		.num_parents = ARRAY_SIZE(_parent_data),		\
+		.ops = _ops,						\
+	};								\
+									\
+	static struct clk_rcg2 _name = {				\
+		.cmd_rcgr = _cmd_rcgr,					\
+		.mnd_width = _mnd_width,				\
+		.hid_width = _hid_width,				\
+		.parent_map = _parent_map,				\
+		.freq_tbl = _freq_tbl,					\
+		.clkr.hw.init =	&_name##_init,				\
+	}
+
+#define DEFINE_QCOM_CC_CLK_RCG2(_name, _cmd_rcgr, _mnd_width,		\
+				_hid_width, _parent_map, _freq_tbl,	\
+				_parent_data)				\
+	__DEFINE_QCOM_CC_CLK_RCG2(_name, _cmd_rcgr, _mnd_width,		\
+				_hid_width, _parent_map, _freq_tbl,	\
+				_parent_data, &clk_rcg2_ops, 0)
+
+#define DEFINE_QCOM_CC_CLK_RCG2_SHARED(_name, _cmd_rcgr, _mnd_width,		\
+				_hid_width, _parent_map, _freq_tbl,	\
+				_parent_data)				\
+	__DEFINE_QCOM_CC_CLK_RCG2(_name, _cmd_rcgr, _mnd_width,		\
+				_hid_width, _parent_map, _freq_tbl,	\
+				_parent_data, &clk_rcg2_shared_ops, 0)
+
+#define DEFINE_QCOM_CC_CLK_RCG2_FLOOR(_name, _cmd_rcgr, _mnd_width,		\
+				_hid_width, _parent_map, _freq_tbl,	\
+				_parent_data)				\
+	__DEFINE_QCOM_CC_CLK_RCG2(_name, _cmd_rcgr, _mnd_width,		\
+				_hid_width, _parent_map, _freq_tbl,	\
+				_parent_data, &clk_rcg2_floor_ops, 0)
+
 #define DEFINE_RCG_DFS(r) \
 	{ .rcg = &r, .init = &r##_init }
 
-- 
2.34.3

