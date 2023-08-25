Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 845E1788CB7
	for <lists+linux-clk@lfdr.de>; Fri, 25 Aug 2023 17:39:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343915AbjHYPjD (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 25 Aug 2023 11:39:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343921AbjHYPiq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Aug 2023 11:38:46 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 671AD270E
        for <linux-clk@vger.kernel.org>; Fri, 25 Aug 2023 08:38:37 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fe1b00fce2so1648104e87.3
        for <linux-clk@vger.kernel.org>; Fri, 25 Aug 2023 08:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692977915; x=1693582715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oTsJupvOxpa/fLz2jUo4zGYaUoVq8SU+eirkqgzntY0=;
        b=JxKRFQr5rwgjz3y2OlZPJDLs3znQsFi3JjJ2VGH2LRvqthq0oSB1fTuE/dWZvQnp45
         3nvhJoqptG2xSfH92KEcvneRXMY2YmwShhJwW4zr3DEp8Tdkq0Q3chF1kPxxA2DkStrY
         lIXpQVf1ZjypJERrcU7plMnt6hlT6mtp9sdg2X2/O3DxMX756FShU1vRGSQKEVfCjyK8
         2akYLrJJgfy1xFh2f15j7M2BLm/ueSPxiZicUUKU/fCOjsjxo221Fu04mK6ThLA3tuvM
         zqMFolHG4LlY/jQFPqwcg//sf5oR6ywR+soy1d34CA2sd1O+U0XioY5EDvitei6h4Iqw
         WZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692977915; x=1693582715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oTsJupvOxpa/fLz2jUo4zGYaUoVq8SU+eirkqgzntY0=;
        b=eaevczXs+rf3VdSBaXcI+a9HtCuiKv7t1hZkiargaY99M2goRCXCn+55vKYYMA8DEW
         IBN8QO9gYrzGv89RF7AQv6ARTkQ09lDyom9+ZHUdapZgQTQYXj0rSJuZ5GGowlNBCpY7
         r9ajIJ3o/gWJlyWef4PZ4aG3Md5WhmHMBHl+SV4JlsoBX3wc/moqzhU1ooLFLMJLJ4KS
         4B9ygL969tQsudv2+uAe1+CAhN7ZqAxSkZ93KzSNvgGfxUVwqNPP+fN//c/hhw0Q4SmB
         isuyuFOGox0RPXH3dIpCathjRxWso81cYO1uU0i0u8IWGOTwh1aGM1eEiJoQFDAT15hY
         v8OA==
X-Gm-Message-State: AOJu0Yys2uFjOi6HxB3dYh5VYbEyNeGQordADcT2ZMpK5i818vlujy76
        +A3wmZP6B6nXBHC62dVigbwlmA==
X-Google-Smtp-Source: AGHT+IG+gm97orJLlW4xUxKCU9QvvOPMQ8WhucMASc4t7eCwYPa11tM1zcKrousEw5P/dQj6MXSLAw==
X-Received: by 2002:ac2:4e95:0:b0:500:7dcc:621 with SMTP id o21-20020ac24e95000000b005007dcc0621mr9931027lfr.31.1692977915744;
        Fri, 25 Aug 2023 08:38:35 -0700 (PDT)
Received: from [192.168.1.101] (abxh59.neoplus.adsl.tpnet.pl. [83.9.1.59])
        by smtp.gmail.com with ESMTPSA id y17-20020a197511000000b004fe432108absm326002lfe.182.2023.08.25.08.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 08:38:35 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 25 Aug 2023 17:38:30 +0200
Subject: [PATCH v4 08/10] interconnect: qcom: sdm660: Set AB/IB
 coefficients
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230726-topic-icc_coeff-v4-8-c04b60caa467@linaro.org>
References: <20230726-topic-icc_coeff-v4-0-c04b60caa467@linaro.org>
In-Reply-To: <20230726-topic-icc_coeff-v4-0-c04b60caa467@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692977905; l=1519;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=k/Cm9gmYXz5bp/vBXbZFWoKJc7XFdBGSN+LYtJyOew0=;
 b=Ii8HGcg6M0stWaaKslOhXJsc+X1cpC/nf/E53SdNuEDOoB50xUzQYYLhysV9fSLTzDrdo4eM+
 9uabXi/Xcp3D20BAK4H7hTV4T2mh8GCJJKnsQfy1kpQ9O8mryY+/16b
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some buses and nodes need additional manual adjustments atop the usual
calculations. Fill in the missing coefficients.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/sdm660.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/interconnect/qcom/sdm660.c b/drivers/interconnect/qcom/sdm660.c
index 36962f7bd7bb..7392bebba334 100644
--- a/drivers/interconnect/qcom/sdm660.c
+++ b/drivers/interconnect/qcom/sdm660.c
@@ -602,6 +602,7 @@ static struct qcom_icc_node mas_mdp_p0 = {
 	.name = "mas_mdp_p0",
 	.id = SDM660_MASTER_MDP_P0,
 	.buswidth = 16,
+	.ib_coeff = 50,
 	.mas_rpm_id = 8,
 	.slv_rpm_id = -1,
 	.qos.ap_owned = true,
@@ -621,6 +622,7 @@ static struct qcom_icc_node mas_mdp_p1 = {
 	.name = "mas_mdp_p1",
 	.id = SDM660_MASTER_MDP_P1,
 	.buswidth = 16,
+	.ib_coeff = 50,
 	.mas_rpm_id = 61,
 	.slv_rpm_id = -1,
 	.qos.ap_owned = true,
@@ -1540,6 +1542,7 @@ static const struct qcom_icc_desc sdm660_bimc = {
 	.num_nodes = ARRAY_SIZE(sdm660_bimc_nodes),
 	.bus_clk_desc = &bimc_clk,
 	.regmap_cfg = &sdm660_bimc_regmap_config,
+	.ab_coeff = 153,
 };
 
 static struct qcom_icc_node * const sdm660_cnoc_nodes[] = {
@@ -1659,6 +1662,7 @@ static const struct qcom_icc_desc sdm660_mnoc = {
 	.intf_clocks = mm_intf_clocks,
 	.num_intf_clocks = ARRAY_SIZE(mm_intf_clocks),
 	.regmap_cfg = &sdm660_mnoc_regmap_config,
+	.ab_coeff = 153,
 };
 
 static struct qcom_icc_node * const sdm660_snoc_nodes[] = {

-- 
2.42.0

