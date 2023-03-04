Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78AC56AA9DC
	for <lists+linux-clk@lfdr.de>; Sat,  4 Mar 2023 14:27:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbjCDN1w (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 4 Mar 2023 08:27:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbjCDN1t (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 4 Mar 2023 08:27:49 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83EC71E29F
        for <linux-clk@vger.kernel.org>; Sat,  4 Mar 2023 05:27:48 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id i9so7025188lfc.6
        for <linux-clk@vger.kernel.org>; Sat, 04 Mar 2023 05:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677936468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qEzJqXZMmu7+Aq//5Xx4Jhn8LF4cNTc/ZIgGx+BB0mc=;
        b=akBJZ12AJt/MTokT8ZFeplkfm0LAFtS+EW0Wf2LI5uDt9RXc1Ps/c/y198w4Nsciwi
         mZPwDh57dd+FiR42kN2jbmh5/MxhoW1OpU8xj8qu/coeOnF6rA1pUVxwwPLBLn5YgWcM
         fQlVzDtmBmGI2SgvFV1vwdgkYvplwEzy0C5TVzNeS59AylktROmyygAIlIgE+Q7Oa2D/
         wKNlS9M0lJN1/YKET9Fk+FgUm+AjjtIjD1GWOT0dTmpUizmp7gLvGewr7+uN+otWkPCy
         sMHE5J6koUt5Pxl7ItALHpcA+lOTmly827/gjYGlA73blHHSCYgFKHhXTkYQLHJu6BXm
         ec6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677936468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qEzJqXZMmu7+Aq//5Xx4Jhn8LF4cNTc/ZIgGx+BB0mc=;
        b=fEIO0wBY0AnlmHpNJ5yWKaLpW0U3NiPmIZPTIDCoh21DBScEUFqRotpn4PCh3hyPQw
         94FyRs67jdAf727U5VHoxHjD8ZWHjn8gVylJJG2TjWcqD5G9LYPdCp02uxeehIHBu3DM
         SclnBv4M1ZDulbIOVlKhggZAQFEXQ/r6jEE91gzU9gJ7YQ0EmBjg1LuDRnw9gQS5yLN+
         YQTFajLwQHlLT0bXImHRSVERad9qMjAdWEx5oPFdRkCuGSJ6c/y9z+bVekPQsNGPyL4F
         8+FT/PzG7fLtMNEXwqgyl5GiqSqSl0nS7JhMsLOqK4R1/UC18MwevtEfL+UgRA4sKeK8
         9c5Q==
X-Gm-Message-State: AO0yUKU6+rgtotrASn3q2Sslc6aXoKbdxzDNetE5kEzGxoPBsn7dvz87
        AceS1ij4USVPvTKl6e5vMDThTg==
X-Google-Smtp-Source: AK7set/yEc1fHaibN6cLQaKcyQCVm+Zqgm7zJUHjtboelSF1x87V5IyPXBP2jGNCNCihu9dpo8HhKw==
X-Received: by 2002:ac2:4acc:0:b0:4b5:2cf4:cc1d with SMTP id m12-20020ac24acc000000b004b52cf4cc1dmr1351192lfp.68.1677936468137;
        Sat, 04 Mar 2023 05:27:48 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id j15-20020a19f50f000000b004e7fa99f2b5sm342975lfb.186.2023.03.04.05.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 05:27:47 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Sat, 04 Mar 2023 14:27:39 +0100
Subject: [PATCH RFT 04/20] clk: qcom: smd-rpm: Add keepalive_clks for
 SM6375
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230303-topic-rpmcc_sleep-v1-4-d9cfaf9b27a7@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677936461; l=1290;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=3tXzpwvDzDe0SY21gtzHXJKH89A17frdRG3PtQq3coY=;
 b=u6E6FhjC6QbGcfwGEM+W1OWP4En1GI7YuaXqpIpeh2GWY8bXrtOdmeTQhpi6oRYLVG3G5puoZynU
 NUluyBrcDlFQS4AZqcKezAZ6Li8tMUOaYif8FeJfRd1GJ9jWpKID
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SM6375 requires that CNoC and SNoC clocks always get an active vote.
Guarantee that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 8e017c575361..8ca301c58909 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -521,6 +521,11 @@ DEFINE_CLK_SMD_RPM_XO_BUFFER(div_clk1, 11, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER(div_clk2, 12, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER(div_clk3, 13, 19200000);
 
+static struct clk_hw *cnoc_snoc_keepalive_clks[] = {
+	&clk_smd_rpm_bus_1_cnoc_a_clk.hw,
+	&clk_smd_rpm_bus_2_snoc_a_clk.hw,
+};
+
 static struct clk_smd_rpm *msm8909_clks[] = {
 	[RPM_SMD_PCNOC_CLK]		= &clk_smd_rpm_bus_0_pcnoc_clk,
 	[RPM_SMD_PCNOC_A_CLK]		= &clk_smd_rpm_bus_0_pcnoc_a_clk,
@@ -1189,6 +1194,8 @@ static struct clk_smd_rpm *sm6375_clks[] = {
 static const struct rpm_smd_clk_desc rpm_clk_sm6375 = {
 	.clks = sm6375_clks,
 	.num_clks = ARRAY_SIZE(sm6375_clks),
+	.keepalive_clks = cnoc_snoc_keepalive_clks,
+	.num_keepalive_clks = ARRAY_SIZE(cnoc_snoc_keepalive_clks),
 };
 
 static struct clk_smd_rpm *qcm2290_clks[] = {

-- 
2.39.2

