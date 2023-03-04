Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC28C6AA9F3
	for <lists+linux-clk@lfdr.de>; Sat,  4 Mar 2023 14:28:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbjCDN2Y (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 4 Mar 2023 08:28:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229834AbjCDN2C (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 4 Mar 2023 08:28:02 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DF0A10B
        for <linux-clk@vger.kernel.org>; Sat,  4 Mar 2023 05:27:54 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id d36so3868056lfv.8
        for <linux-clk@vger.kernel.org>; Sat, 04 Mar 2023 05:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677936473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u4xjt06WuAITrEBDOoRj+XcumFMWUoW9/PgZ8QRo1yo=;
        b=qsH57wZVqsviRiiy+sAvZQeDJz6JOSQJrqq7pMaajwjdJpKR7JK/3yyGLjDqV7Lkig
         iO8PZoTutgbJoXnqilTeWS4bVDXmAC4Nv0IEfKDUNAAIZfekEYcLM6BzTW6jOw7T+f7q
         YBsNc+N6DuEjFpJWygbDU6io212Mi4Czl18FYZ7Sn9747PMbEQMnXp9SFVNOQi/uzinB
         UW0QESCIcRiY4nyUjoA7kiZfDORGJRnRPV0p59lMErg/QIElhOz+JCGtl0XjpQEQJtKQ
         XCeSphFnAGb8CLVdy5rlBo3UEqQqKjXM2s/zST7VckzdR1At9NRDF4YsTsvaw7IQzr/3
         nxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677936473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u4xjt06WuAITrEBDOoRj+XcumFMWUoW9/PgZ8QRo1yo=;
        b=jhBxYSNZmKmHH06rCC6QvuvCuJJxhRg4OEMwKFX61nfP1itUhAlmbmQZMxazXf+KDg
         CTvP8Cg96XOQXfJKAhmqHRCQ33Qc0AZG9ziTkQcNLzsSgHBRF6A4eDvpiGalPwVIWmx1
         0woL9nu5OeTzXZKIjCvfhSZRITJiqvf4pkuiS9Rgafl8sHy9/9nICJfas5A3GLO85inS
         k1npFvrP+5knW1jWJnlZC72FG5POEIoni2Zg1n22QLqTlA5WorGg7otPPs6cPP9ky/JX
         Ffx6qFYLWaKwQHZYhx5oNsNiP0zj/6t97EOTUux37TYpxOzOKf8r0JI6Ea+hr+GIhiaV
         AnDA==
X-Gm-Message-State: AO0yUKV1QDLxvfUWf2kRnFQVrFbUCWlQ45EpNc+XwepDB9Jrxe5KNez5
        B/stfpPCYhbG+toSziiBYIuikQ==
X-Google-Smtp-Source: AK7set/CTUB4TtljN8nsuZVG5WhmIRgCpK4mO2WAK+VtRvCPNoXzUk26JHKe87g1K3LvBAX57AuaQg==
X-Received: by 2002:ac2:508b:0:b0:4dc:4afe:1622 with SMTP id f11-20020ac2508b000000b004dc4afe1622mr1544781lfm.42.1677936473075;
        Sat, 04 Mar 2023 05:27:53 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id j15-20020a19f50f000000b004e7fa99f2b5sm342975lfb.186.2023.03.04.05.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 05:27:52 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Sat, 04 Mar 2023 14:27:44 +0100
Subject: [PATCH RFT 09/20] clk: qcom: smd-rpm: Add keepalive_clks for
 MSM8974
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230303-topic-rpmcc_sleep-v1-9-d9cfaf9b27a7@linaro.org>
References: <20230303-topic-rpmcc_sleep-v1-0-d9cfaf9b27a7@linaro.org>
In-Reply-To: <20230303-topic-rpmcc_sleep-v1-0-d9cfaf9b27a7@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677936461; l=782;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=yyAylWkjsHJ9M8f72hhFGXM7popO5Dzt7+QVKW2XYCk=;
 b=4+QXrXJyh0wapuYvuA1ri2hQ0axqyeo9BQ/+5lOsCyS4bb1RxeUj3NwF+dEOZcWUWkQy4hW3j2m3
 rZl1rasHBDo4YWi4Sy27GGjEbQTSzZpb44ZJDJHiJGqrB7bXJOA8
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

MSM8974 requires that the PCNoC clock always gets an active vote.
Guarantee that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 6db78aeae9dd..a390ec3d6c01 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -686,6 +686,8 @@ static struct clk_smd_rpm *msm8974_clks[] = {
 static const struct rpm_smd_clk_desc rpm_clk_msm8974 = {
 	.clks = msm8974_clks,
 	.num_clks = ARRAY_SIZE(msm8974_clks),
+	.keepalive_clks = pnoc_keepalive_clks,
+	.num_keepalive_clks = ARRAY_SIZE(pnoc_keepalive_clks),
 };
 
 static struct clk_smd_rpm *msm8976_clks[] = {

-- 
2.39.2

