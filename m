Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D901557DC4
	for <lists+linux-clk@lfdr.de>; Thu, 23 Jun 2022 16:29:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231624AbiFWO3D (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 23 Jun 2022 10:29:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231841AbiFWO3C (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Jun 2022 10:29:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A517A4551F
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 07:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655994539;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=WD6aAT4eAfkhBAGxc5usx5w9FCyTvm/RJ0Dv5y8ZHUg=;
        b=LUL52ma29PfNPz6sWUK35UC0yOwUdBPgllsZVCkvIXiz4+EEFvREGt/akXpqELNQLnVRCa
        ahidn44ArhC3PRjPtaQ+6fPIHAMIirwpR4B2nERsZYW4MPNYFRk+YHavOkgM1zjF7V+or1
        HDMbRZUlEbF+KX1G35Tvhr/ibgfLYT0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-ETGGYBGHM3WmQ39TjVvLdg-1; Thu, 23 Jun 2022 10:28:58 -0400
X-MC-Unique: ETGGYBGHM3WmQ39TjVvLdg-1
Received: by mail-qk1-f200.google.com with SMTP id y8-20020a05620a44c800b006a6f8cd53cbso23655885qkp.5
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 07:28:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WD6aAT4eAfkhBAGxc5usx5w9FCyTvm/RJ0Dv5y8ZHUg=;
        b=cU9wE1pEVA+kIUZMqU1hIj0erw+kQnoIYVVvBG4uLpptun7PE3lQna0DGthOLclrqD
         dvmMhwx3oIGKfBW0255QGCZXE/03cUuhrg3uYu7gnFrseJZFwrbCvj4qFD07Zj5W+XeE
         Hx7kwiTh3G+OXxQpGkoTURqyQCyNROtgStYWFMzYv/sKilTB7D4/M48gjzfxC8Sewsy1
         pvzTM4JPw6cu81MyKQ1VnOHAu6i/+SPQuzAQTO35E2hVmJm2JihNNcQjD7Uu4T6dOz4d
         WfW0yh77bZjcoRa3EsUcRZuvlMqaajtmMaVxeb7cYTyUeDBswOwklvjLF53XClD86A5A
         fHXg==
X-Gm-Message-State: AJIora+VC7jxUGol6Wdr5OGY5u1UQS5yM22KAhBmYQdZtXVvis8MAHmv
        dMunQKbk5WQF4uJOFB6r/P6akzdWVx0XUfMqgRFkSgt9sAYSj/3+lx3wA9/pZkHze0+U43brrUF
        FIexn8L61a2n334ENuSis
X-Received: by 2002:a05:6214:b69:b0:470:4d46:a399 with SMTP id ey9-20020a0562140b6900b004704d46a399mr14931481qvb.68.1655994537268;
        Thu, 23 Jun 2022 07:28:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s3HQBpI082cjSWrflbTXyicJSxjqvis1d5yO6iArcXxXYDi5XlJzjhdU6+uUThw6LfTCvY2Q==
X-Received: by 2002:a05:6214:b69:b0:470:4d46:a399 with SMTP id ey9-20020a0562140b6900b004704d46a399mr14931452qvb.68.1655994536929;
        Thu, 23 Jun 2022 07:28:56 -0700 (PDT)
Received: from xps13.redhat.com (c-98-239-145-235.hsd1.wv.comcast.net. [98.239.145.235])
        by smtp.gmail.com with ESMTPSA id d124-20020a379b82000000b006a6ae9150fesm18412531qke.41.2022.06.23.07.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 07:28:56 -0700 (PDT)
From:   Brian Masney <bmasney@redhat.com>
To:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org
Cc:     agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        ahalaney@redhat.com, echanude@redhat.com
Subject: [PATCH] clk: qcom: sc8280xp: add parent to gcc_ufs_phy_axi_clk for sa8540p
Date:   Thu, 23 Jun 2022 10:28:37 -0400
Message-Id: <20220623142837.3140680-1-bmasney@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The sa8540p automotive board has the same SOC as the sc8280xp. In order
to get the first UFS controller working on the sa8540p,
GCC_UFS_REF_CLKREF_CLK needs to be setup as a parent to
GCC_UFS_PHY_AXI_CLK.

This clock name came from the DTS for the downstream MSM 5.4 kernel
sources for the sa8540p. It also references GCC_UFS_CARD_CLKREF_CLK,
however that wasn't needed to get the first UFS controller working.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
I originally added this under GCC_UFS_PHY_PHY_AUX_CLK since that's
what's in the downstream DTS. I was getting errors about
GCC_UFS_PHY_AXI_CLK being stuck at off so I moved it there.

Also I don't have access to any documentation for this board so I'm
hoping that someone with docs access can verify that this is the
appropriate place to put this.

 drivers/clk/qcom/gcc-sc8280xp.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc8280xp.c b/drivers/clk/qcom/gcc-sc8280xp.c
index 4b894442fdf5..4639b50da418 100644
--- a/drivers/clk/qcom/gcc-sc8280xp.c
+++ b/drivers/clk/qcom/gcc-sc8280xp.c
@@ -5685,6 +5685,19 @@ static struct clk_branch gcc_ufs_phy_ahb_clk = {
 	},
 };
 
+static struct clk_branch gcc_ufs_ref_clkref_clk = {
+	.halt_reg = 0x8c058,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8c058,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_ufs_ref_clkref_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_ufs_phy_axi_clk = {
 	.halt_reg = 0x77010,
 	.halt_check = BRANCH_HALT_VOTED,
@@ -5696,6 +5709,7 @@ static struct clk_branch gcc_ufs_phy_axi_clk = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_ufs_phy_axi_clk",
 			.parent_hws = (const struct clk_hw*[]){
+				&gcc_ufs_ref_clkref_clk.clkr.hw,
 				&gcc_ufs_phy_axi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
@@ -5899,19 +5913,6 @@ static struct clk_branch gcc_ufs_phy_unipro_core_hw_ctl_clk = {
 	},
 };
 
-static struct clk_branch gcc_ufs_ref_clkref_clk = {
-	.halt_reg = 0x8c058,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x8c058,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_ufs_ref_clkref_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_usb2_hs0_clkref_clk = {
 	.halt_reg = 0x8c044,
 	.halt_check = BRANCH_HALT,
-- 
2.36.1

