Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 533526BB8D1
	for <lists+linux-clk@lfdr.de>; Wed, 15 Mar 2023 16:58:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232675AbjCOP6b (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 15 Mar 2023 11:58:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232757AbjCOP6S (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Mar 2023 11:58:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B05E1E2A2
        for <linux-clk@vger.kernel.org>; Wed, 15 Mar 2023 08:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678895799;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=CJaCLAjqxLo9SAqmZ/ZPxPuIYyAicDla8mBV+t3lBL8=;
        b=IOZfFPchWAkCvcVhNy3AaXDuOfy/iDwCxB20ukevmD9833NHr+dat+w+kFX/EY8QMqcB71
        IjQLinAxzVkbQaEfDpBmW/FIOIni8X5tIiKdY0TgxA6BxkmhA6UAK6XfYCyskhJV/+MNFO
        BdVy3Ig+M1EOrt+0YZhbv8EgAQxzN64=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74--fpbiiexPgybd6b-aCb16A-1; Wed, 15 Mar 2023 11:56:38 -0400
X-MC-Unique: -fpbiiexPgybd6b-aCb16A-1
Received: by mail-qv1-f72.google.com with SMTP id dl18-20020ad44e12000000b005a4d5420bc6so7009614qvb.11
        for <linux-clk@vger.kernel.org>; Wed, 15 Mar 2023 08:56:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678895798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CJaCLAjqxLo9SAqmZ/ZPxPuIYyAicDla8mBV+t3lBL8=;
        b=MmO8YRQjG6nDJcmyBBOHMLkvJq727nW6Qw9lfpHkaIE06Nc8+FaHXzurMZIh2u6OOY
         YfHP5RwjR0sVHaqPeicVQ01FFrta5jRSfGhoo4wjx+UERT9AZtilMGVbwBScp7+krm6P
         2DebYDw2OGYkbnGuYDTkTLvmUjB2GMUnQsSjjC7Lf2PQPst6bUv8VBzecH3BnFKkot74
         52I08VdE73JOaFV/hsdUAoW+3fWT7iINpaKw4UtAhjJKduOp61OHNceZ0fbqbqrmNNrg
         I/dnf5fMrXRHhhxxfsBXReDl1C8EYG1a9/1l0nxmgOaJP0g1g4IIJtYCOTZSEz1MKQqe
         oM8w==
X-Gm-Message-State: AO0yUKV6H4oh1fhno3dvobUtIA22xLNkUkfME6F0DlJC5GtEloayDX7e
        vX+wzGFDHJCkWn5JpBwZN1TnGS+1+PzYX0+Hixm2Xpj/ip/6APTy2sVUvAA83dr4xzN7JniUyyY
        5tADs2p0FK8OfMbStR5aV
X-Received: by 2002:ac8:5b95:0:b0:3bf:bff0:841d with SMTP id a21-20020ac85b95000000b003bfbff0841dmr644405qta.21.1678895798120;
        Wed, 15 Mar 2023 08:56:38 -0700 (PDT)
X-Google-Smtp-Source: AK7set/MjGuH4d1AxU+OLSdm6oom5h3vCnE3goYeC+g5OzZF63DemuqYGQ2rvDXJ3heg1B3xbb48ZA==
X-Received: by 2002:ac8:5b95:0:b0:3bf:bff0:841d with SMTP id a21-20020ac85b95000000b003bfbff0841dmr644356qta.21.1678895797686;
        Wed, 15 Mar 2023 08:56:37 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id 201-20020a3705d2000000b00745a78b0b3asm3873312qkf.130.2023.03.15.08.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 08:56:37 -0700 (PDT)
From:   Tom Rix <trix@redhat.com>
To:     andersson@kernel.org, agross@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: [PATCH] clk: qcom: remove unused variables gpucc_parent_data,map_2
Date:   Wed, 15 Mar 2023 11:56:30 -0400
Message-Id: <20230315155630.1740065-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

gcc with W=1 reports these errors
drivers/clk/qcom/gpucc-sm6375.c:145:37: error:
  ‘gpucc_parent_data_2’ defined but not used [-Werror=unused-const-variable=]
  145 | static const struct clk_parent_data gpucc_parent_data_2[] = {
      |                                     ^~~~~~~~~~~~~~~~~~~
drivers/clk/qcom/gpucc-sm6375.c:139:32: error:
  ‘gpucc_parent_map_2’ defined but not used [-Werror=unused-const-variable=]
  139 | static const struct parent_map gpucc_parent_map_2[] = {
      |                                ^~~~~~~~~~~~~~~~~~

These variables are not used, so remove them.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/clk/qcom/gpucc-sm6375.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sm6375.c b/drivers/clk/qcom/gpucc-sm6375.c
index eb9ffa956950..d8f4c4b59f1b 100644
--- a/drivers/clk/qcom/gpucc-sm6375.c
+++ b/drivers/clk/qcom/gpucc-sm6375.c
@@ -136,18 +136,6 @@ static const struct clk_parent_data gpucc_parent_data_1[] = {
 	{ .index = DT_GCC_GPU_GPLL0_CLK_SRC },
 };
 
-static const struct parent_map gpucc_parent_map_2[] = {
-	{ P_BI_TCXO, 0 },
-	{ P_GCC_GPU_GPLL0_CLK_SRC, 5 },
-	{ P_GCC_GPU_GPLL0_DIV_CLK_SRC, 6 },
-};
-
-static const struct clk_parent_data gpucc_parent_data_2[] = {
-	{ .index = P_BI_TCXO },
-	{ .index = DT_GCC_GPU_GPLL0_CLK_SRC },
-	{ .index = DT_GCC_GPU_GPLL0_DIV_CLK_SRC },
-};
-
 static const struct freq_tbl ftbl_gpucc_gmu_clk_src[] = {
 	F(200000000, P_GCC_GPU_GPLL0_DIV_CLK_SRC, 1.5, 0, 0),
 	{ }
-- 
2.27.0

