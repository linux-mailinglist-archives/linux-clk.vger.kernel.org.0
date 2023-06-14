Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06483715B93
	for <lists+linux-clk@lfdr.de>; Tue, 30 May 2023 12:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231467AbjE3KVp (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 30 May 2023 06:21:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231473AbjE3KVE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 May 2023 06:21:04 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDE7A1BB
        for <linux-clk@vger.kernel.org>; Tue, 30 May 2023 03:20:23 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f4c264f6c6so4838787e87.3
        for <linux-clk@vger.kernel.org>; Tue, 30 May 2023 03:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685442022; x=1688034022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CR+0em3GpCANRHldk9JU4PWpumHfW3iAUBiSmQ2eF1I=;
        b=e9lC3oTsWajr/O02O+p/3/y4omPDftEKS8Tz+16IYuMy6pEklqi128Nuv8sJDOnOvj
         pYJwD39SyDjgrRHi7SlDD+vd+VuosWHDMds5m0rhbYrAPgHbLOmSJIOnWxrkpBRwx9V+
         agWxWL/kNG79EtYGMQ4xh3SAd6vsvzhULDAlZxfea1lAg3ZBt6hsr/PnNhFOwHT4T+e/
         R1mduj4fkUUSQQveVdiby/gJM4GNbglGj/U9QQhvRkAa1+xIpXi5dYVPmXTkZ6FZdSmr
         BGvW5NZpJou/LuqENKc3HK9EuHHmcBXWj6ff7ry7V5LT/T4LNCIELQBY9DheKMhSiwnY
         swyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685442022; x=1688034022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CR+0em3GpCANRHldk9JU4PWpumHfW3iAUBiSmQ2eF1I=;
        b=AY4EBwEA6XV6ZrcxbLlNwU/FU7w3Ds7JO5GgVwe9D7hc1gcJeBv8edCHtR+E4AXaU+
         wAqAtqIx5JQAcONxTnMmuKe8claqldwxoIEEgwSbyVhIP5WcUYMZRut+lTUADwNGJKUF
         xPyyp8zDMArIOnd7GYwULuZWZqI4fFyWOREH8l52MuSPMdDJCvRx67gwpwd388RuKLoS
         A1QW+e1ca0K8ApFY3MxpDnSSU5JCS+xB7lY1RjzECuO0S85+WCItxXlM9/22sAYn7cwx
         6pePQt7ap2cA5EMA4NxOdPZcpMEW8Osu5d4dvHUDBaPqzjKSKJRI5c3QtfKYU99m8MM7
         +BPg==
X-Gm-Message-State: AC+VfDxQPm8jfc8dfSyGc/vapDlaOdgyhLzI5VjGaFh+XCIRuY4RffWp
        StY1H0f8KCncPb+DiIcdG2sb6Q==
X-Google-Smtp-Source: ACHHUZ7hslOpJLuxk00r9E9dB0xL/7mn5/Fq1WmpBr/w7sfzLntQkFAYkVPPyB/1JSIEYrPoDSbbNw==
X-Received: by 2002:ac2:44ac:0:b0:4f3:a44d:6982 with SMTP id c12-20020ac244ac000000b004f3a44d6982mr528945lfm.45.1685442022025;
        Tue, 30 May 2023 03:20:22 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id c25-20020ac24159000000b004cc8196a308sm290902lfi.98.2023.05.30.03.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 03:20:21 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 30 May 2023 12:20:13 +0200
Subject: [PATCH 14/20] interconnect: qcom: msm8939: Hook up RPM bus clk
 definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230526-topic-smd_icc-v1-14-1bf8e6663c4e@linaro.org>
References: <20230526-topic-smd_icc-v1-0-1bf8e6663c4e@linaro.org>
In-Reply-To: <20230526-topic-smd_icc-v1-0-1bf8e6663c4e@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Leo Yan <leo.yan@linaro.org>, Evan Green <evgreen@chromium.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685442001; l=1621;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=BzBOG/hZueCjmgEDIlJxmzcotc3IrE0BhEB5lZiOOVU=;
 b=IUtiwOzEUrRLXx4rxJl4psLwCWnuyxeJBvMFhE7RZHP29Qf/A9LfTelYYFSJPdyXzvSXZRuCk
 XFgd2lxy9OyC22G4IfTNOtFNGrAU52KVz8EvietTGj0AIgVGuQCEcfc
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Assign the necessary definitions to migrate to the new bus clock
handling mechanism.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/msm8939.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/interconnect/qcom/msm8939.c b/drivers/interconnect/qcom/msm8939.c
index 639566dce45a..94b11b590a8e 100644
--- a/drivers/interconnect/qcom/msm8939.c
+++ b/drivers/interconnect/qcom/msm8939.c
@@ -1284,6 +1284,7 @@ static const struct qcom_icc_desc msm8939_snoc = {
 	.type = QCOM_ICC_NOC,
 	.nodes = msm8939_snoc_nodes,
 	.num_nodes = ARRAY_SIZE(msm8939_snoc_nodes),
+	.bus_clk_desc = &bus_1_clk,
 	.regmap_cfg = &msm8939_snoc_regmap_config,
 	.qos_offset = 0x7000,
 };
@@ -1304,6 +1305,7 @@ static const struct qcom_icc_desc msm8939_snoc_mm = {
 	.type = QCOM_ICC_NOC,
 	.nodes = msm8939_snoc_mm_nodes,
 	.num_nodes = ARRAY_SIZE(msm8939_snoc_mm_nodes),
+	.bus_clk_desc = &bus_2_clk,
 	.regmap_cfg = &msm8939_snoc_regmap_config,
 	.qos_offset = 0x7000,
 };
@@ -1332,6 +1334,7 @@ static const struct qcom_icc_desc msm8939_bimc = {
 	.type = QCOM_ICC_BIMC,
 	.nodes = msm8939_bimc_nodes,
 	.num_nodes = ARRAY_SIZE(msm8939_bimc_nodes),
+	.bus_clk_desc = &bimc_clk,
 	.regmap_cfg = &msm8939_bimc_regmap_config,
 	.qos_offset = 0x8000,
 };
@@ -1403,6 +1406,7 @@ static const struct qcom_icc_desc msm8939_pcnoc = {
 	.type = QCOM_ICC_NOC,
 	.nodes = msm8939_pcnoc_nodes,
 	.num_nodes = ARRAY_SIZE(msm8939_pcnoc_nodes),
+	.bus_clk_desc = &bus_0_clk,
 	.regmap_cfg = &msm8939_pcnoc_regmap_config,
 	.qos_offset = 0x7000,
 };

-- 
2.40.1

