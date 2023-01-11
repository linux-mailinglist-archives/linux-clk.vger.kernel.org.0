Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 880EB66637C
	for <lists+linux-clk@lfdr.de>; Wed, 11 Jan 2023 20:20:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232719AbjAKTUO (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 11 Jan 2023 14:20:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233869AbjAKTUJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 14:20:09 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B1FF15F0D
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 11:20:08 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id n5so16525622ljc.9
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 11:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nqckWVN1EW8nGGVGrmVxxAgycA7grXm6YjyhUvZ/LK8=;
        b=QDAO3+7FNVSpvTpgHC6ZPHLqTA4E1/skLSyUjaGLXVDi3HaafNET4be2m0nlcfxbvt
         H2OLGcizTHkFFCfpkqr0lIBBKYu34bldT5rEnA6okfihkF2NIyxuFHMXsQYAG8/vrpzt
         5Z8xmJdryZhXPSaiHCxGw5em93Exnqfky1qfQi1gjSufCIKkraNumgM40TW3neslRIGN
         9VI2tHg/BZ+QWuauTFO/6LoxF82HXUZBwyvs1udD5R6C85Ay4BoD5yAvfDQPWxQr2s4r
         r5tzjatbiEj8oRjV/NIO3AveyzxTnDGgYnq/ESd90Cxo2oaCzlxaXjLmWbGXu/lovrUh
         8omw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nqckWVN1EW8nGGVGrmVxxAgycA7grXm6YjyhUvZ/LK8=;
        b=cU3MueU3u1KrTDZoVRgPlRpsIYpp3w6S2XR/GKOYi1DjZ3CeMV16AC6IjMRFjCOQEi
         aK4A1xunejxWZPlJpeloYmv5E1wbH55xTzAMg41sMNWdgFWOYajEFv1dH/UH7hTFhdAq
         HWbjJ7FyTIttBXfztsgAWAr98FDd5YnG0NhFYMc7XzKkMIL0JszCFEcffBvWPDimG6uZ
         4DZCg0lNfSg1kC3hP39FG63z/zPJuKrHOHM5PdrAgeEPEbswfdgS/Z6ii/9tRhCyMtZQ
         lK6Zt8PAw6uxyAvo7L3/bB2rB1c/D/OHrhl9pyS9Oj8dVuad5Y2gIfSPydvxYy/wF9AS
         y9nQ==
X-Gm-Message-State: AFqh2krbJEuIESSCxyvF9oy4iqkOui+xsQjUwkJ/huY97DWULXPdoO2n
        3ea6xhHB5qSLiZgcgTk+ELrlDg==
X-Google-Smtp-Source: AMrXdXvFVr+d40Gk4K3TP8L+4m/fELfW9r1HFX3FLupJlwXBJMtXvY/gODVZ9PuVEk1NEaYNikG33w==
X-Received: by 2002:a2e:b054:0:b0:27f:e465:859e with SMTP id d20-20020a2eb054000000b0027fe465859emr10846990ljl.2.1673464806592;
        Wed, 11 Jan 2023 11:20:06 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id bj36-20020a2eaaa4000000b0027ff2fabcb5sm1807787ljb.104.2023.01.11.11.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 11:20:06 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 02/13] clk: qcom: cpu-8996: correct PLL programming
Date:   Wed, 11 Jan 2023 22:19:53 +0300
Message-Id: <20230111192004.2509750-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
References: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
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

Change PLL programming to follow the downstream setup.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index ee76ef958d31..ed8cb558e1aa 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -93,12 +93,9 @@ static const u8 prim_pll_regs[PLL_OFF_MAX_REGS] = {
 static const u8 alt_pll_regs[PLL_OFF_MAX_REGS] = {
 	[PLL_OFF_L_VAL] = 0x04,
 	[PLL_OFF_ALPHA_VAL] = 0x08,
-	[PLL_OFF_ALPHA_VAL_U] = 0x0c,
 	[PLL_OFF_USER_CTL] = 0x10,
-	[PLL_OFF_USER_CTL_U] = 0x14,
 	[PLL_OFF_CONFIG_CTL] = 0x18,
 	[PLL_OFF_TEST_CTL] = 0x20,
-	[PLL_OFF_TEST_CTL_U] = 0x24,
 	[PLL_OFF_STATUS] = 0x28,
 };
 
@@ -106,8 +103,10 @@ static const u8 alt_pll_regs[PLL_OFF_MAX_REGS] = {
 
 static const struct alpha_pll_config hfpll_config = {
 	.l = 60,
-	.config_ctl_val = 0x200d4aa8,
+	.config_ctl_val = 0x200d4828,
 	.config_ctl_hi_val = 0x006,
+	.test_ctl_val = 0x1c000000,
+	.test_ctl_hi_val = 0x00004000,
 	.pre_div_mask = BIT(12),
 	.post_div_mask = 0x3 << 8,
 	.post_div_val = 0x1 << 8,
-- 
2.30.2

