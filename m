Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E5695BE658
	for <lists+linux-clk@lfdr.de>; Tue, 20 Sep 2022 14:53:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230237AbiITMxI (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 20 Sep 2022 08:53:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230262AbiITMxE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Sep 2022 08:53:04 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7456475CC6;
        Tue, 20 Sep 2022 05:53:01 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 7B83A320094D;
        Tue, 20 Sep 2022 08:52:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 20 Sep 2022 08:53:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1663678379; x=
        1663764779; bh=vbFyspAQsg3yNRKNMEYHBJbMt9LJYRJ5b26Dvh979Qk=; b=v
        sK/UngwTugPfIsTCCqWL0HVQiUHWOhNnKrheAMPeBbIzKFSh/qJuDg2zNEFA8dJ1
        VBvd5kc6GPonPe5b8LqjLEUDl+o8vw33JBQZ+h6bS303QJ644l2WDqNeNzSbptzU
        L2m+sva5YL3/Ovh4G+D0cMkUk4dERjViK1u6B2L420cE1YWyZr1Ct4fHaCwVG30D
        9+Uavi40C7ob1t38jkcKK9hyrig30SmS/5fdu0CkEA9/M6yCQi4GocsVqBMr2hCG
        fCKEcJuVgkPcqxITMAA7d3JDkEWv1/1U7ki8uQxegCDFYCm1ap3jbO9kxIUMHZIF
        qceiq0ARxytRc6Z2lfULg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663678379; x=
        1663764779; bh=vbFyspAQsg3yNRKNMEYHBJbMt9LJYRJ5b26Dvh979Qk=; b=S
        RepxWrcdnlKEvbeAOl3WQNvcm4uGmLtIotrMC3KIkGCM+TwK1WbDbhv/19bk04NM
        pmXfap/EfbnRlSKJ1d4u+LrANWJ1I9KAFdotFv7d3G0WksKoQKzJ0U7DPIei6nLz
        zjeX8uRvMseJCd0mnfL3yuPvGzx2KdRUlANmYZPSvaZGXh4kwO06HaObS6ZRfRgA
        k2us+gfY5iRF4axdQ+sEy4m9oWQK+XnnSDHoz3bLAYOcd3en8jRN/+F9A48MWoXI
        Q3JUSORlVw4MZv/KBVLfI8cojJVx+d76+CmWPq/m/tH18lnf2VRayrLdRgWkVO3n
        v5IRBvsud+f5XvwDDdbWg==
X-ME-Sender: <xms:qrcpY8uUScuLKG93TRIgghnK5_9ifp75wNgb5PYDLhxhdyM9LC7-cQ>
    <xme:qrcpY5fYHCchyST7LJ3D4RHsiLAOwJnkT9Pckfz_Y_g-aPH4aHBMlHQ8kxeHAc0j-
    HKKrI6COzOBlie_uiU>
X-ME-Received: <xmr:qrcpY3w6dCZlQbAm5oe0ZV_Bbbss-E45hylvO0Oqz01AdGDYacRQamZHqsAT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvledgheekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
    jeeltdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:qrcpY_O6O4MxX5UKvb07g_yviNnaDQO_28rZmDKonN2i6jHvHg5Iow>
    <xmx:qrcpY8-vrNjagNo8sboD9L8opV4pq3g_b3R9OYKznps7ueJaXUyUcw>
    <xmx:qrcpY3VxNX1_PrQdvCMDfQ2HB0cZa5Z6Hv3prSDDpvHk1MMnVrU8JA>
    <xmx:q7cpY_fhkqpIOT7L9f9mJMR4snSTIwiHFibjXssJvlPL9AOZwTCh2g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Sep 2022 08:52:58 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Tue, 20 Sep 2022 14:50:21 +0200
Subject: [PATCH v2 2/7] firmware: raspberrypi: Move the clock IDs to the firmware
 header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220815-rpi-fix-4k-60-v2-2-983276b83f62@cerno.tech>
References: <20220815-rpi-fix-4k-60-v2-0-983276b83f62@cerno.tech>
In-Reply-To: <20220815-rpi-fix-4k-60-v2-0-983276b83f62@cerno.tech>
To:     Daniel Vetter <daniel@ffwll.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Scott Branden <sbranden@broadcom.com>,
        Stephen Boyd <sboyd@kernel.org>, Emma Anholt <emma@anholt.net>,
        Ray Jui <rjui@broadcom.com>, Maxime Ripard <mripard@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dom Cobley <popcornmix@gmail.com>,
        dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.10.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2076; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=TrD+SFGf4YZRmdJ85X/XZBFv+MxAtrE6oLVm8pSPxrw=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMma2/leWNqdblzx/Y+AwZ8j3HPZbF4dVSmZGliQHbXNb1LG
 mvNbO0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjARtk2MDPP/1rtrfb6j+k36uGize3
 Nk8e/Vtg/rfr2RWO55RuBP3xNGhlPLtO40VXrUJSzWeWgwS7AyteNG6gPzrVVTa9euCf2Qww4A
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 876b37b8683c..1f5e6a1554e6 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -18,24 +18,6 @@
 
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
-	RPI_FIRMWARE_NUM_CLK_ID,
-};
-
 static char *rpi_firmware_clk_names[] = {
 	[RPI_FIRMWARE_EMMC_CLK_ID]	= "emmc",
 	[RPI_FIRMWARE_UART_CLK_ID]	= "uart",
diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index 63426082bcb9..74c7bcc1ac2a 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -136,6 +136,24 @@ enum rpi_firmware_property_tag {
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
+	RPI_FIRMWARE_NUM_CLK_ID,
+};
+
 #if IS_ENABLED(CONFIG_RASPBERRYPI_FIRMWARE)
 int rpi_firmware_property(struct rpi_firmware *fw,
 			  u32 tag, void *data, size_t len);

-- 
b4 0.10.0
