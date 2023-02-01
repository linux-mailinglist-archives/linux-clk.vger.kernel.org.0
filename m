Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CB72686CC9
	for <lists+linux-clk@lfdr.de>; Wed,  1 Feb 2023 18:23:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232228AbjBARXN (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 1 Feb 2023 12:23:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232129AbjBARXK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Feb 2023 12:23:10 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBC5565ED1
        for <linux-clk@vger.kernel.org>; Wed,  1 Feb 2023 09:23:08 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id p26so42308309ejx.13
        for <linux-clk@vger.kernel.org>; Wed, 01 Feb 2023 09:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=blLbGHjcnInKnpgLd74KkVGuQXPZCKH7VadoYSWViY0=;
        b=EUEhmI4hTcVmH1QCRrvubxL9Zc99+YSbqDWb71VuEnrY0OVDAFiSzuXLBclkpwJXrN
         R0sIcsi7QE/X/B93awonJ4jKDg5YdTuvxkngERfQiGI381f2nKUbDAljOs/pPHBuTPbx
         Mc51AG9+GjeYoxWUbQe6A0CnRsL32IssJ19QVfp6QeI+VBpXVVyir3ssFFne4u7nOSzK
         JTUoYDNNiOMGLncgIIk04P764dGpxonrNmHo6rhbP51Tqi48USA/DknKd6RH/qu+/eFw
         cs7flz+wIBkcjqUhcmh228bFlVp/B9khpPjLx1qTci70hcVhHq+9Usluf8mOheYM6YBF
         jwvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=blLbGHjcnInKnpgLd74KkVGuQXPZCKH7VadoYSWViY0=;
        b=pQyMJ/rEiZJZjzByt4u95rOzC7xXY/iupXGGHlHOXM8aYHvtMAYs/I5iex/I+7R5X2
         Fz6Lw126Ktz08xZOID0LVI8jQ7EnFr1BZnwK7PDmNcBhMPwGuoYt3Ug1aynvT+1wsRA5
         N4Z0aUw3HP553KuNryP/ca2tvuyp8lkgwFAAcz5/FT7Q82pENRmSAz1eELwNeypHRMZ/
         ZyA5JEaTWK1qP4zmhkxXFqUxl8+KnXSbgszdA3hCf1fKqAXXw7ns5pJCJft/aIQZXuNI
         hAJXcL9voyoGvLa1h7PYb5w13pFH4akvu9hP3JiUWbm0BnTdc8K1pJ9TXIuEIjO5Cysv
         I2nA==
X-Gm-Message-State: AO0yUKWSZVQGvJ26eYz7qOxAhL15RfwS2jQTWXp1tlHO/PGZlXoaVNjx
        4SXvhGAwNE2y0a4YMed+hx7b4g==
X-Google-Smtp-Source: AK7set8DmlMk6MrvJNkeil+R4XuQz+m6Fo0xCbjSSUmgujF13VWztguD605FoDk3nOEp1vBjXsNQbA==
X-Received: by 2002:a17:906:694c:b0:881:ad59:97f5 with SMTP id c12-20020a170906694c00b00881ad5997f5mr2829732ejs.2.1675272187367;
        Wed, 01 Feb 2023 09:23:07 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id ci20-20020a170906c35400b0088e5f3e1faesm601873ejb.36.2023.02.01.09.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 09:23:06 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 1/2] clk: qcom: gpucc-sc7180: fix clk_dis_wait being programmed for CX GDSC
Date:   Wed,  1 Feb 2023 19:23:04 +0200
Message-Id: <20230201172305.993146-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
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

The gdsc_init() function will rewrite the CLK_DIS_WAIT field while
registering the GDSC (writing the value 0x2 by default). This will
override the setting done in the driver's probe function.

Set cx_gdsc.clk_dis_wait_val to 8 to follow the intention of the probe
function.

Fixes: 745ff069a49c ("clk: qcom: Add graphics clock controller driver for SC7180")
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gpucc-sc7180.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sc7180.c b/drivers/clk/qcom/gpucc-sc7180.c
index d738251cba17..6839b4b71a2f 100644
--- a/drivers/clk/qcom/gpucc-sc7180.c
+++ b/drivers/clk/qcom/gpucc-sc7180.c
@@ -21,8 +21,6 @@
 #define CX_GMU_CBCR_SLEEP_SHIFT		4
 #define CX_GMU_CBCR_WAKE_MASK		0xF
 #define CX_GMU_CBCR_WAKE_SHIFT		8
-#define CLK_DIS_WAIT_SHIFT		12
-#define CLK_DIS_WAIT_MASK		(0xf << CLK_DIS_WAIT_SHIFT)
 
 enum {
 	P_BI_TCXO,
@@ -160,6 +158,7 @@ static struct clk_branch gpu_cc_cxo_clk = {
 static struct gdsc cx_gdsc = {
 	.gdscr = 0x106c,
 	.gds_hw_ctrl = 0x1540,
+	.clk_dis_wait_val = 8,
 	.pd = {
 		.name = "cx_gdsc",
 	},
@@ -242,10 +241,6 @@ static int gpu_cc_sc7180_probe(struct platform_device *pdev)
 	value = 0xF << CX_GMU_CBCR_WAKE_SHIFT | 0xF << CX_GMU_CBCR_SLEEP_SHIFT;
 	regmap_update_bits(regmap, 0x1098, mask, value);
 
-	/* Configure clk_dis_wait for gpu_cx_gdsc */
-	regmap_update_bits(regmap, 0x106c, CLK_DIS_WAIT_MASK,
-						8 << CLK_DIS_WAIT_SHIFT);
-
 	return qcom_cc_really_probe(pdev, &gpu_cc_sc7180_desc, regmap);
 }
 
-- 
2.39.1

