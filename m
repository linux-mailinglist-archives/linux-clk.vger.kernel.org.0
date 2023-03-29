Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 580BB6CDB5B
	for <lists+linux-clk@lfdr.de>; Wed, 29 Mar 2023 16:01:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbjC2OBn (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 29 Mar 2023 10:01:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjC2OBn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Mar 2023 10:01:43 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36F254229
        for <linux-clk@vger.kernel.org>; Wed, 29 Mar 2023 07:01:40 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id j11so20321926lfg.13
        for <linux-clk@vger.kernel.org>; Wed, 29 Mar 2023 07:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680098498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OhTgON0dpxaPIhYp4g9uF92+QxjyZ+xguuLpohTAKmg=;
        b=Wq54+Cc+T37WaDD5ViDJJfCLih1P8ghtEFm+JK1BlYhNcjOePgW88UhvHRmjx5/RAl
         B+Ay1hNAolar1G7lAeqYARt8W4wseQimTn1W7EXv0qiyXRhhms8s2nyKymUmt6FCThvq
         LSBI0Mx24/3ZP9zFH+B6kfpGoF5qw0E1hJG0BmgnhN7FE/Na77S4PAiE+0TFyL4lAstq
         eXiQeaK90rcoqXUJBi8MB4R4dwFTXK7NzSZuPywYRdfAw5PZNxNtOmHppt8cjz3OeAn5
         PT8WWYAUBEJQtzyaPNwMmGmc8bv3yXVWE8N2qN+5/VWW/zlfA8MgAQsbYhfyWj0y3KGu
         pZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680098498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OhTgON0dpxaPIhYp4g9uF92+QxjyZ+xguuLpohTAKmg=;
        b=XsVAo6GV11C7T11jtXaibFbKAYaP9gNH/7t953uSCHqgBrEXnvvfiODY0+HjDThrV9
         qzKM7J6+UBz7Oa6fzjyRH+x6BJUFRQwbL2BrwrHd+0QqfEM7UmyL2Wxov6p/M1CDe/ya
         +SxSWK9bQ5df0jhHweyxmz0cZwpI//5icDbgByat3pxOUWwoW3ny6OtF/xBeSgJHJl2D
         w7e3zVPEXppwyFj+75AXiPW0Ag1+WYj9ha/kk3mnP04jVi1tVB4SPX6qBXj25oQi6yRj
         hLRtY2o9pJ8fY4iP3wvitKqJBI+8KHOt5S86XoJ6oWTy3wilEOIvXD95F1TBHlK68GgW
         FthA==
X-Gm-Message-State: AAQBX9dL4+Msv7fIFJ55nC1rFk/AqLh6tdKCmSa+Dign0hjGUO3ZaDEQ
        5Vym/wHNjC1bJqezBaX+LLMeXw==
X-Google-Smtp-Source: AKy350ZNTKzZtKddMtavq1i1b8KNqFHuir9cjj6n6vuYljnvf66eJhkvpodYJQTkAmrMpveW6iW6pQ==
X-Received: by 2002:ac2:5ddb:0:b0:4ea:d6c7:c897 with SMTP id x27-20020ac25ddb000000b004ead6c7c897mr5782374lfq.31.1680098498119;
        Wed, 29 Mar 2023 07:01:38 -0700 (PDT)
Received: from localhost.localdomain (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id f25-20020ac251b9000000b004d4d7fb0e07sm5511340lfk.216.2023.03.29.07.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 07:01:37 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: gpucc-sm6375: Configure CX_GDSC disable wait value
Date:   Wed, 29 Mar 2023 16:01:35 +0200
Message-Id: <20230329140135.2178957-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Configure the disable wait value on the CX GDSC to ensure we don't get
any undefined behavior. This was omitted when first adding the driver.

Fixes: 8397e24278b3 ("clk: qcom: Add GPU clock controller driver for SM6375")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gpucc-sm6375.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gpucc-sm6375.c b/drivers/clk/qcom/gpucc-sm6375.c
index d8f4c4b59f1b..d3620344a009 100644
--- a/drivers/clk/qcom/gpucc-sm6375.c
+++ b/drivers/clk/qcom/gpucc-sm6375.c
@@ -358,6 +358,7 @@ static struct clk_branch gpucc_sleep_clk = {
 static struct gdsc gpu_cx_gdsc = {
 	.gdscr = 0x106c,
 	.gds_hw_ctrl = 0x1540,
+	.clk_dis_wait_val = 8,
 	.pd = {
 		.name = "gpu_cx_gdsc",
 	},
-- 
2.40.0

