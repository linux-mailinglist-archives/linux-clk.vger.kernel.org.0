Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A54534C10C9
	for <lists+linux-clk@lfdr.de>; Wed, 23 Feb 2022 11:56:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239722AbiBWK4z (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 23 Feb 2022 05:56:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239730AbiBWK4y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Feb 2022 05:56:54 -0500
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D21168E194
        for <linux-clk@vger.kernel.org>; Wed, 23 Feb 2022 02:56:26 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 402325C00D0;
        Wed, 23 Feb 2022 05:56:26 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 23 Feb 2022 05:56:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; bh=xZ5tDfJaUnDK2zdKkFq1Tltv4rLSsG
        LP6zUbM5VRt6k=; b=YFVPrYy6WNB6yyYPaf1kCDDgTVUg0CKo0VgvlUt5cP7/3r
        /JJRq8bvjQOpM7wU1mhCz1FlXnPjafVbV+9i+c26e2X4r8VYmF6ekwujSaV5XsmB
        +6Cw3bPdtm9QbjF7GPlASrGqnWVPfyF7UlfoUw9pR0w46Z/IcMS2m39Ojw+FIIh+
        0Yw21RH/3a5aNCv+1X2gVRIshSHmlw95LOVHImEzIRe/YpV6Nqag3DPztqpYVfTP
        4rvRCBncF0hkAsKhTm7bCu0ESyNdJzsBtMOyDp+xEbyWRVrDgWTBswQ2xaYq7UBW
        tIDj0YZM0QEQuw9dTdpHxULuUPJGvjoS9EGZNdTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=xZ5tDf
        JaUnDK2zdKkFq1Tltv4rLSsGLP6zUbM5VRt6k=; b=BEUXKgoDzRrZDdJ+wczTX2
        NCkPAlxy3of7gOaBkMZufJFwC2USTTjFqbDc49vZ5Lc4Ys3EjRwwQV6omcDjVJfa
        h4caCMqdfLZ08aNciSE9X9/FV8aCNIDZ7/1K3SKU9uISNuzW6UyngC4+IraqWqgg
        +4rizDkmdYnimmNhkdBmiYLdyOTRZkZFV0Td74NfpaE1MS/r3KXlgJsqeT5BbEcy
        o/pyKgtaYlNZVh1YaGOHnlIJZupcI8+nUJ0oUv3zsPQCaMESp29aDIs2nwTnEZWY
        XhqWVmF5/m6ERAO1S8vMYQTbCcnww+gp+jDQwCXJBuiWHJHcCuCH/e/+2xioDToQ
        ==
X-ME-Sender: <xms:2hIWYlSgIx5PqE7w1n0tbqBVzVy19Uk6EVSQqKBxBmO2Rqw4mLL9bA>
    <xme:2hIWYuzXnMT4Ik1N6oA2D3mrrGBbZrTR41oWClqWn-MaRBQ9SX1DTkmRulksMqPVl
    4kpMZTMiHPbUZ23IwA>
X-ME-Received: <xmr:2hIWYq1Ptk1FMMaySiafHueCzy6evHfoKzx_1ytQ6iKFZvmbQjO1j-xGkUJ8thc3jBui1QyfweLY9AXiRSnfo2YYc55kXERqjxbaEbY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrledtgddvudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:2hIWYtDGlKDts9vBs4EkSD6VBTwsqwqYRXekgHkzZAsWlSkPbmF5tw>
    <xmx:2hIWYuhK--0A498SfGkAuOATJrZX9gPJdLyG9YEdf1zFA9M3iaYqeQ>
    <xmx:2hIWYhrxEdg-v2a8yb9U73iha-rmfeC1Gy40Myt47SWTCT_XRzRmEQ>
    <xmx:2hIWYig13G5gd3-aZT_ycWSc2FTJM0xigsW5kzs4u4JsO4pXBg4rLQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Feb 2022 05:56:25 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v6 10/12] clk: bcm: rpi: Run some clocks at the minimum rate allowed
Date:   Wed, 23 Feb 2022 11:55:58 +0100
Message-Id: <20220223105600.1132593-11-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220223105600.1132593-1-maxime@cerno.tech>
References: <20220223105600.1132593-1-maxime@cerno.tech>
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

The core clock and M2MC clocks are shared between some devices (Unicam
controllers and the HVS, and the HDMI controllers, respectively) that
will have various, varying, requirements depending on their current work
load.

Since those loads can require a fairly high clock rate in extreme
conditions (up to ~600MHz), we can end up running those clocks at their
maximum frequency even though we no longer require such a high rate.

Fortunately, those devices don't require an exact rate but a minimum
rate, and all the drivers are using clk_set_min_rate. Thus, we can just
rely on the fact that the clk_request minimum (which is the aggregated
minimum of all the clock users) is what we want at all times.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/bcm/clk-raspberrypi.c | 37 +++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index c879f2e9a4a7..9d09621549b9 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -77,6 +77,7 @@ struct raspberrypi_clk_variant {
 	bool		export;
 	char		*clkdev;
 	unsigned long	min_rate;
+	bool		minimize;
 };
 
 static struct raspberrypi_clk_variant
@@ -87,6 +88,18 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	},
 	[RPI_FIRMWARE_CORE_CLK_ID] = {
 		.export = true,
+
+		/*
+		 * The clock is shared between the HVS and the CSI
+		 * controllers, on the BCM2711 and will change depending
+		 * on the pixels composited on the HVS and the capture
+		 * resolution on Unicam.
+		 *
+		 * Since the rate can get quite large, and we need to
+		 * coordinate between both driver instances, let's
+		 * always use the minimum the drivers will let us.
+		 */
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_M2MC_CLK_ID] = {
 		.export = true,
@@ -102,6 +115,16 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 		 * in this situation.
 		 */
 		.min_rate = 120000000,
+
+		/*
+		 * The clock is shared between the two HDMI controllers
+		 * on the BCM2711 and will change depending on the
+		 * resolution output on each. Since the rate can get
+		 * quite large, and we need to coordinate between both
+		 * driver instances, let's always use the minimum the
+		 * drivers will let us.
+		 */
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_V3D_CLK_ID] = {
 		.export = true,
@@ -206,12 +229,26 @@ static int raspberrypi_fw_set_rate(struct clk_hw *hw, unsigned long rate,
 static int raspberrypi_fw_dumb_determine_rate(struct clk_hw *hw,
 					      struct clk_rate_request *req)
 {
+	struct raspberrypi_clk_data *data =
+		container_of(hw, struct raspberrypi_clk_data, hw);
+	struct raspberrypi_clk_variant *variant = data->variant;
+
 	/*
 	 * The firmware will do the rounding but that isn't part of
 	 * the interface with the firmware, so we just do our best
 	 * here.
 	 */
+
 	req->rate = clamp(req->rate, req->min_rate, req->max_rate);
+
+	/*
+	 * We want to aggressively reduce the clock rate here, so let's
+	 * just ignore the requested rate and return the bare minimum
+	 * rate we can get away with.
+	 */
+	if (variant->minimize && req->min_rate > 0)
+		req->rate = req->min_rate;
+
 	return 0;
 }
 
-- 
2.35.1

