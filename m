Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90015615F5B
	for <lists+linux-clk@lfdr.de>; Wed,  2 Nov 2022 10:15:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231383AbiKBJPv (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 2 Nov 2022 05:15:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230199AbiKBJPI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Nov 2022 05:15:08 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23987286CC
        for <linux-clk@vger.kernel.org>; Wed,  2 Nov 2022 02:13:29 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d10so15847475pfh.6
        for <linux-clk@vger.kernel.org>; Wed, 02 Nov 2022 02:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z6bT5Xy6HJSVHzE3w5gAF7ODmVO+QE+Pvk+SDh7p/kA=;
        b=E3pcsNmKJwCHYP4+h8cp2Qdi0ZJw93oQ2eEiTNWjZrSfcGDGnfVsIuW/78DL8qIpgu
         JCyGeEIcLinSAAs92VkrT6MtUpexab0mwEAwwyV0wSrfDjZmsJ0uG4xGxyS1mT0qZI21
         ldp1QWbxcfaWqcv6AMHUfjYVS9AXfgZ6szI9K/QFplxK5bdfdDd7xtNnWoz/uSaTXcaF
         o450nTqt1yA5lE+/R+GloJYJlNpzJyIm8WIVPEvHSES6vXDHpj/HOsYh209vN0QaFIo5
         V9LiLPX+DCRCRpgnJwAXFAniMJZcb/7UcPCWUC2orU9Hxkp+CFaVbkXKaGXvWY4zQbSL
         NhAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z6bT5Xy6HJSVHzE3w5gAF7ODmVO+QE+Pvk+SDh7p/kA=;
        b=27BjdPcbgHL7aN9KUev3G929qPLAeMY4sFV82bR+tT2QFXnO/cqwDV+43Pjg+lR8uD
         crHrbLJICn9uJW9W2mbqvoNjo7RwFKh/rZLke+b8b2DwLIlX19TPvmFqsYxcBFHwo4Me
         RJtlMt4rGR7YH4vaPBUQbspkBlucVwS6Wb5UI2bCryCce4Qu2Td+Gn7/BUJSRPZb2FtJ
         7uwku9SLxB9zxHlWXtaV+54BGatl0ENjYK4qipOjHszQ2W2tN4s1nrWLnaBSn2sQqCTj
         +P/VDTP5bKzTGASLll9wX9lYh6830elrr2E2Cb1ihNYPJoUPjkJaUxZRWi/PSzuuW0Ib
         PQzQ==
X-Gm-Message-State: ACrzQf1UWFbNKiAvUXUqwq2Ep1E+IciEt3jyEEK9b4LOieM2EBgJTcre
        8g25hGaQoaq5snT4N4Ws0EAw
X-Google-Smtp-Source: AMsMyM60KpzKt0yB7l73uqhrr+KKKC15Y6Stqq2UU7CyxVz3h8qGMEbpZm86IpTPJAbryyd5G3nJnA==
X-Received: by 2002:a63:187:0:b0:43b:cf3c:c64d with SMTP id 129-20020a630187000000b0043bcf3cc64dmr20511639pgb.359.1667380408555;
        Wed, 02 Nov 2022 02:13:28 -0700 (PDT)
Received: from localhost.localdomain ([117.193.209.178])
        by smtp.gmail.com with ESMTPSA id n4-20020a170903110400b001869394a372sm7847689plh.201.2022.11.02.02.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 02:13:27 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, mturquette@baylibre.com,
        sboyd@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2] clk: qcom: gcc-sm8250: Use retention mode for USB GDSCs
Date:   Wed,  2 Nov 2022 14:43:20 +0530
Message-Id: <20221102091320.66007-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

USB controllers on SM8250 doesn't work after coming back from suspend.
This can be fixed by keeping the USB GDSCs in retention mode so that
hardware can keep them ON and put into rentention mode once the parent
domain goes to a low power state.

Fixes: 3e5770921a88 ("clk: qcom: gcc: Add global clock controller driver for SM8250")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

Changes in v2:

* Added Fixes tag (Stephen)

 drivers/clk/qcom/gcc-sm8250.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8250.c b/drivers/clk/qcom/gcc-sm8250.c
index 9755ef4888c1..a0ba37656b07 100644
--- a/drivers/clk/qcom/gcc-sm8250.c
+++ b/drivers/clk/qcom/gcc-sm8250.c
@@ -3267,7 +3267,7 @@ static struct gdsc usb30_prim_gdsc = {
 	.pd = {
 		.name = "usb30_prim_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 };
 
 static struct gdsc usb30_sec_gdsc = {
@@ -3275,7 +3275,7 @@ static struct gdsc usb30_sec_gdsc = {
 	.pd = {
 		.name = "usb30_sec_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 };
 
 static struct gdsc hlos1_vote_mmnoc_mmu_tbu_hf0_gdsc = {
-- 
2.25.1

