Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5DBA60F813
	for <lists+linux-clk@lfdr.de>; Thu, 27 Oct 2022 14:53:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235908AbiJ0MxM (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 27 Oct 2022 08:53:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235838AbiJ0Mw7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Oct 2022 08:52:59 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABE5916F435;
        Thu, 27 Oct 2022 05:52:58 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id E14FE32000EB;
        Thu, 27 Oct 2022 08:52:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 27 Oct 2022 08:52:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1666875176; x=
        1666961576; bh=xJhT/X4VixnYkgfkFnbHw3X17ZeGBdQGVdACyR+HRo0=; b=L
        YmsxzeWZLlTui1WxzvlWV826Ti5DgB9VafZQQCEjyf++phQLo+M5AT+02+UaWyqj
        zrtk0UGAN457E+PvYBrak7kGXs6jUTw2lDm/1TJRF52hWtRe0+KTlk8JqmXG0Q9w
        bqYjO1mxWjS9vN4z/jFQGTddwzCnnyVfzOQSMzZGz3M7xputu+56qriZY1t6ALP5
        QzIhd7Xto8VZrWFgH8hjm04woIRhg0G1MHIZwBCeSZv0YY5gmaEw8vGG3ODGpqcE
        G+6HyTjk9mm3yTwkLxGqb/WKACBwpXAk366tIbCRmOFm7EipGRk+p8mjX5K1S9yW
        uaufLxvzciRUYzL9dmaeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666875176; x=
        1666961576; bh=xJhT/X4VixnYkgfkFnbHw3X17ZeGBdQGVdACyR+HRo0=; b=Z
        4S8N/fXPNd7PeMOLKh46QrQHb4v+JI1dPhV1nk6d8oFSlk1815+P/Di9va9tbj2r
        xspueAEDVoPFxmyrhkhEZJRGiirItjH6Rd1LtogshPxbRVjrcxaDvKuuiCWF4PmQ
        cd00QDVbhOtXdQESyecVPKthRbO+tzr6XEM2l3GrZjrazyjJx3rBZ5SprhsFofPq
        lggbQJtYAcEmAqidWZZbds1utXdXssumccKbf4sqZ9a+oPbXg4nklzAT6l7Ln75W
        GLTzFXE5tnLqD3VDQTeKH+dITW/cBeKJi9BDdeU6MiOAIEN/lX9YhL9U0U3aF7hg
        NKnIj5iejhMJ/aL0kY5Rw==
X-ME-Sender: <xms:J39aY_jSsIdgbFiRZZe3nALvStSkyBlIRXlnlvD8KjpBt-ASFppfgw>
    <xme:J39aY8C_angFJY1s81e1MUDekRLnx3Vo7EXgjv-GAn0vUvOFP0kRMz-GniNHFE5is
    AplMN1Vmyz7Rk3ldE4>
X-ME-Received: <xmr:J39aY_F8Gmpc1ETcNGrm_YbKEPGBeDnGjDwIc3O5OHg-osz2o2ryVX-ObAXkkEKo8Bq7nqEIp-Rs9Xj9Zark5ZIgz7wql0fhmRYVX5dUeFZH0A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtdeggdehhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
    ledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:J39aY8Qkl2rIQk6wrFDBYdYaXa9y2VnSFt4d_egEGHczuBgWv5pKgA>
    <xmx:J39aY8yDVkaEfP4-dka_7rhKMPoJQYKkg1c4Ee2OUzw0B1IALNy72A>
    <xmx:J39aYy4CNpZjnooEcqBt4djEALX8pcL4AUW2VD6KeaJa58_EKWuOPg>
    <xmx:KH9aYwkEGqWNnHXwuy9ooaJNB6UtOShHH4DnZqSuQoDYajgZ2WeXjw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Oct 2022 08:52:55 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Thu, 27 Oct 2022 14:52:42 +0200
Subject: [PATCH v5 2/7] firmware: raspberrypi: Move the clock IDs to the firmware
 header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220815-rpi-fix-4k-60-v5-2-fe9e7ac8b111@cerno.tech>
References: <20220815-rpi-fix-4k-60-v5-0-fe9e7ac8b111@cerno.tech>
In-Reply-To: <20220815-rpi-fix-4k-60-v5-0-fe9e7ac8b111@cerno.tech>
To:     Stephen Boyd <sboyd@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>,
        David Airlie <airlied@linux.ie>, Ray Jui <rjui@broadcom.com>
Cc:     linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Maxime Ripard <maxime@cerno.tech>,
        dri-devel@lists.freedesktop.org, Dom Cobley <popcornmix@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        Stefan Wahren <stefan.wahren@i2se.com>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=2437; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=v6OAg/oRO6br6X91V3Q/wUOT5FkjIJwqVZUcg1VTWyo=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMlR9TJ3OT0X3eTkTPWKYVo0cfJ7Nu2X+14vW8g6t0xy6wbZ
 jUftOkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjARCw9Ghm/tyk7ys2r0I/copd3y+1
 TL3pc9WWPzyqKqk7NPdlTd/8fIMLPaZu7J/79lD3DqFyY7akyOU37AdKd2QzqrbtPfScc/MwIA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We'll need the clock IDs in more drivers than just the clock driver from
now on, so let's move them in the firmware header.

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/bcm/clk-raspberrypi.c          | 19 -------------------
 include/soc/bcm2835/raspberrypi-firmware.h | 19 +++++++++++++++++++
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 679f4649a7ef..ce2f93479736 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -18,25 +18,6 @@
 
 #include <soc/bcm2835/raspberrypi-firmware.h>
 
-enum rpi_firmware_clk_id {
-	RPI_FIRMWARE_EMMC_CLK_ID = 1,
-	RPI_FIRMWARE_UART_CLK_ID,
-	RPI_FIRMWARE_ARM_CLK_ID,
-	RPI_FIRMWARE_CORE_CLK_ID,
-	RPI_FIRMWARE_V3D_CLK_ID,
-	RPI_FIRMWARE_H264_CLK_ID,
-	RPI_FIRMWARE_ISP_CLK_ID,
-	RPI_FIRMWARE_SDRAM_CLK_ID,
-	RPI_FIRMWARE_PIXEL_CLK_ID,
-	RPI_FIRMWARE_PWM_CLK_ID,
-	RPI_FIRMWARE_HEVC_CLK_ID,
-	RPI_FIRMWARE_EMMC2_CLK_ID,
-	RPI_FIRMWARE_M2MC_CLK_ID,
-	RPI_FIRMWARE_PIXEL_BVB_CLK_ID,
-	RPI_FIRMWARE_VEC_CLK_ID,
-	RPI_FIRMWARE_NUM_CLK_ID,
-};
-
 static char *rpi_firmware_clk_names[] = {
 	[RPI_FIRMWARE_EMMC_CLK_ID]	= "emmc",
 	[RPI_FIRMWARE_UART_CLK_ID]	= "uart",
diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index 63426082bcb9..9b1db12d013f 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -136,6 +136,25 @@ enum rpi_firmware_property_tag {
 	RPI_FIRMWARE_GET_DMA_CHANNELS =                       0x00060001,
 };
 
+enum rpi_firmware_clk_id {
+	RPI_FIRMWARE_EMMC_CLK_ID = 1,
+	RPI_FIRMWARE_UART_CLK_ID,
+	RPI_FIRMWARE_ARM_CLK_ID,
+	RPI_FIRMWARE_CORE_CLK_ID,
+	RPI_FIRMWARE_V3D_CLK_ID,
+	RPI_FIRMWARE_H264_CLK_ID,
+	RPI_FIRMWARE_ISP_CLK_ID,
+	RPI_FIRMWARE_SDRAM_CLK_ID,
+	RPI_FIRMWARE_PIXEL_CLK_ID,
+	RPI_FIRMWARE_PWM_CLK_ID,
+	RPI_FIRMWARE_HEVC_CLK_ID,
+	RPI_FIRMWARE_EMMC2_CLK_ID,
+	RPI_FIRMWARE_M2MC_CLK_ID,
+	RPI_FIRMWARE_PIXEL_BVB_CLK_ID,
+	RPI_FIRMWARE_VEC_CLK_ID,
+	RPI_FIRMWARE_NUM_CLK_ID,
+};
+
 #if IS_ENABLED(CONFIG_RASPBERRYPI_FIRMWARE)
 int rpi_firmware_property(struct rpi_firmware *fw,
 			  u32 tag, void *data, size_t len);

-- 
b4 0.11.0-dev-99e3a
