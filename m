Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25AAF4C47AB
	for <lists+linux-clk@lfdr.de>; Fri, 25 Feb 2022 15:36:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241818AbiBYOg2 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 25 Feb 2022 09:36:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241819AbiBYOg1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Feb 2022 09:36:27 -0500
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 740701AE64D
        for <linux-clk@vger.kernel.org>; Fri, 25 Feb 2022 06:35:54 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 397BC5C0198;
        Fri, 25 Feb 2022 09:35:54 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 25 Feb 2022 09:35:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; bh=QlOq15mubNZxvpuMRZ3gIcykADRMVQ
        WEqEwOiGentj0=; b=s6U5KNrStgEIT5FIj7h9ePKRKTxsHzixHJJ7u3JWVl8G3D
        02XYxIcYU9+oJpUVL5NwxNebhHt5JK4oXIuvN5CZgA3ZyNNUU7KdCC4fRwfbUirg
        HuJ+A9VapOIyDnogAX5ekT30qHdfsx5nkLrZNqlGxNgjiCO35eKZLzBV8kKVO6nC
        ghBtVLS/670hGP7dofP+1hNSxm9g5Fb5wW/aIS1x5AntwqkpnRyUKCPF8+8r/iXC
        LQTs/b8ymv7fM7+Fpl9WdIsFDIIcw1u+cKerJuusUgIA939U8on5+097TR9vcMYI
        jmhcODdKAehRWzhenb7tKzeju+hbf3lWG4a+59gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=QlOq15
        mubNZxvpuMRZ3gIcykADRMVQWEqEwOiGentj0=; b=jwtBA/tz2CLLx/4NNpXXu7
        rlMmeZZ2X8vbDjYRYSJnLwtez8HLG643amzZOQfMMJkwBEqYSPIhAACT86qcZQa3
        QcOY17Pw/Q9BLZumizaddD6S0dIb9BpgN/71u65lvjLAVx96TGQbxucMXursP/1s
        MvroDLcvr3JrDqYCxWuco/h9KkEEGVAjRMmNYMspj8IIU4OwpmfktP5QuYM+Fy5C
        wFACJnbJ6fLaCDk9eSE7/+gkekOZKptAwshcwZ+d8g6pmNZlgBl2NjXBztd8F8VE
        DDPPBdB2byddCUxtQr/EW2FT7xhO+mGrA2e+vz6DMdG2PpN34fROwo9vA2issEiA
        ==
X-ME-Sender: <xms:SukYYgW7CuAJWwmCU7k6YDtYHGe56lyuj4bNhYxlqjPCq5GRl3MXNQ>
    <xme:SukYYkk7Kg8QTaz1Gflhl_R5rmAN8_EHfHMR_OknEPlkYTYj2uYFM88aRjzACQj4Y
    U0_ru6O7fWmHnqrT8U>
X-ME-Received: <xmr:SukYYkYs61IAivELskGWKwq6KqJDNnFRcv9ETiTglRObWR5odqbRBODDM46WXoeLAERPMhPwNx_e7VQd39mlD3wOKFLVuFAq6uyNz_8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleeggdeijecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:SukYYvUpVGHsy33jVmZGthAFJ1ebiftDR8tanCytC3F7wIhHgWKHkg>
    <xmx:SukYYqm_p25Z-bIv2c9YVBvgDiOgnMXi2k2-21NtIeGvept1Cxk9Jg>
    <xmx:SukYYkcNUZLE61rSDseX_u-3aEhsJiKrR1q5folVqpcn-7byHtgcmg>
    <xmx:SukYYsUprV3nGw6ulEu-AITFahxp9vSVCNbXcTAWA1_iJMqVTEJY1w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Feb 2022 09:35:53 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v7 09/12] clk: bcm: rpi: Set a default minimum rate
Date:   Fri, 25 Feb 2022 15:35:31 +0100
Message-Id: <20220225143534.405820-10-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220225143534.405820-1-maxime@cerno.tech>
References: <20220225143534.405820-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The M2MC clock provides the state machine clock for both HDMI
controllers.

However, if no HDMI monitor is plugged in at boot, its clock rate will
be left at 0 by the firmware and will make any register access end up in
a CPU stall, even though the clock was enabled.

We had some code in the HDMI controller to deal with this before, but it
makes more sense to have it in the clock driver. Move it there.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/bcm/clk-raspberrypi.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index f7185d421085..c879f2e9a4a7 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -76,6 +76,7 @@ struct raspberrypi_clk_data {
 struct raspberrypi_clk_variant {
 	bool		export;
 	char		*clkdev;
+	unsigned long	min_rate;
 };
 
 static struct raspberrypi_clk_variant
@@ -89,6 +90,18 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	},
 	[RPI_FIRMWARE_M2MC_CLK_ID] = {
 		.export = true,
+
+		/*
+		 * If we boot without any cable connected to any of the
+		 * HDMI connector, the firmware will skip the HSM
+		 * initialization and leave it with a rate of 0,
+		 * resulting in a bus lockup when we're accessing the
+		 * registers even if it's enabled.
+		 *
+		 * Let's put a sensible default so that we don't end up
+		 * in this situation.
+		 */
+		.min_rate = 120000000,
 	},
 	[RPI_FIRMWARE_V3D_CLK_ID] = {
 		.export = true,
@@ -267,6 +280,19 @@ static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
 		}
 	}
 
+	if (variant->min_rate) {
+		unsigned long rate;
+
+		clk_hw_set_rate_range(&data->hw, variant->min_rate, max_rate);
+
+		rate = raspberrypi_fw_get_rate(&data->hw, 0);
+		if (rate < variant->min_rate) {
+			ret = raspberrypi_fw_set_rate(&data->hw, variant->min_rate, 0);
+			if (ret)
+				return ERR_PTR(ret);
+		}
+	}
+
 	return &data->hw;
 }
 
-- 
2.35.1

