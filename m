Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C48E6D646A
	for <lists+linux-clk@lfdr.de>; Tue,  4 Apr 2023 16:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235646AbjDDOAP (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 4 Apr 2023 10:00:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235866AbjDDOAA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Apr 2023 10:00:00 -0400
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 385454C21;
        Tue,  4 Apr 2023 06:59:34 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 00A4A5821A5;
        Tue,  4 Apr 2023 09:57:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 04 Apr 2023 09:57:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
        1680616652; x=1680623852; bh=B8LNzBZ62+5wjGOJ+Ainw06cB0cXimLIqR8
        qQ4T9Zn0=; b=km7KRmL0YXjnP/meUd+DcvUHazwMYR7lt5dN45/wkkooBj4B8qU
        ZrGww+AkMePc+R2TkyXgZmskmymjuP/FzY8svkzkapVGcKdttcZHMAJDFsqGockO
        sGYg/5U6VuUfm5AP9mQxJxtbIW8IS9jT8tw6GMX5u7FTuihpQ9/dhmIwmJwh+hBy
        St5Bfecyobe3jvELshTkG8xdlASivgWsK9ZS9aSViooaOWGm0zgmvlpNF+7oI3IO
        F26GEKtCJ20wq+z7ec/UPB/z8G95sTbzHD4c/Toaa5BWdsvpzReQIY5sGfOPHP6J
        1smMSIPJbO0pNq6QqEuUbUP61Eys4M7wVZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1680616652; x=1680623852; bh=B8LNzBZ62+5wjGOJ+Ainw06cB0cXimLIqR8
        qQ4T9Zn0=; b=tBl8dAV1XGouArzqpExRFtAA2Vfup3jTGzKeWuO3PeM2IDkvf0R
        Kiz+cq7zeUKTs8MHWxy2XEMSj20y1luajaE3Ba9WNjbWqExpVL7AZJKv6E6kppwA
        ctI13AfdaDRK+fD+RBu3tr0DcAUA6LQ/uaj60rFGlsfpIk+aTVKgYhXPUs1Y13yz
        QO0vlf35OMs5BKbPKyU8/51AjEdA8tuXFcI9A9zgkKUwyexMIu7EaYyrLxh8LJPu
        GClgUYSpxxLrptoXxIA8mWCekwYOxldTcnZOuvk/xQA2btjPGeBlePOYQiCdH9cq
        ozBBNXnwR454rLqveTKA+vc2ChTIMee7fqA==
X-ME-Sender: <xms:zCwsZBK9EeId2aElEaBHn26Gfaq2IjQjps_GgL8oEcdSWFiG9f8c_g>
    <xme:zCwsZNLI-WF_-5lUBD7pbdJBpzwhAyzdRvuQmDLEC7zYYghez2XiuxXb_Oyth2yHa
    yAEtLWodFBnuwpv1HQ>
X-ME-Received: <xmr:zCwsZJuFv1YpVW4t768nHygqYUzVTQhFlImmzhg0e0NVTAcsk_IqGnq2Yb81aOnF2y54r5AA9UCTVMHn8pOQvGUP0nDtEjw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgjeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:zCwsZCaRXNtdQzi3s3VmKwVZFMjZ0TzN6QYhrDPD7yNZKM_BcZIKDg>
    <xmx:zCwsZIa1HZATPIxxoz4MWP_Lz3nIaSgrokbWZY3hbDTX8PqZ_mx0dQ>
    <xmx:zCwsZGBKKxrfzF7T-37Lbz5v2t0VAg7nKI61riyosQJZKTseJMfS-w>
    <xmx:zCwsZBkrqfQf7tuTnSdeK-HXprDE_16USYKH6esUK36M5bUpjF6LCA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 09:57:31 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Tue, 04 Apr 2023 12:11:49 +0200
Subject: [PATCH v3 59/65] clk: st: flexgen: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-59-9a1358472d52@cerno.tech>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Lechner <david@lechnology.com>,
        Sekhar Nori <nsekhar@ti.com>, Abel Vesa <abelvesa@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, patches@opensource.cirrus.com,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
        linux-rtc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        alsa-devel@alsa-project.org, linux-mips@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2831; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=ne7+Ni8GdplaAMyjTXPRz6J0r6sewA5LY1sPpnagops=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37c/XPFcOumCmLJCVs/N2q3Fv/SmMZid0OKw3f2J7/xO
 x+9vOkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjARnnhGhvttc0uMmNum5BXrr2/NWt
 j3e899x6lvmXfbrf4Tmfor5DPDP90HXyQDSy8e+xMv3B6z6Mzi2tgkO3NmgxbNfd/Vt2pn8QMA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Spam-Status: No, score=0.2 required=5.0 tests=DATE_IN_PAST_03_06,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The ST Flexgen clocks implements a mux with a set_parent hook, but
doesn't provide a determine_rate implementation.

This is a bit odd, since set_parent() is there to, as its name implies,
change the parent of a clock. However, the most likely candidate to
trigger that parent change is a call to clk_set_rate(), with
determine_rate() figuring out which parent is the best suited for a
given rate.

The other trigger would be a call to clk_set_parent(), but it's far less
used, and it doesn't look like there's any obvious user for that clock.

So, the set_parent hook is effectively unused, possibly because of an
oversight. However, it could also be an explicit decision by the
original author to avoid any reparenting but through an explicit call to
clk_set_parent().

The driver does implement round_rate() though, which means that we can
change the rate of the clock, but we will never get to change the
parent.

However, It's hard to tell whether it's been done on purpose or not.

Since we'll start mandating a determine_rate() implementation, let's
convert the round_rate() implementation to a determine_rate(), which
will also make the current behavior explicit. And if it was an
oversight, the clock behaviour can be adjusted later on.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/st/clk-flexgen.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/st/clk-flexgen.c b/drivers/clk/st/clk-flexgen.c
index 7ae4f656191e..5292208c4dd8 100644
--- a/drivers/clk/st/clk-flexgen.c
+++ b/drivers/clk/st/clk-flexgen.c
@@ -119,20 +119,21 @@ clk_best_div(unsigned long parent_rate, unsigned long rate)
 	return parent_rate / rate + ((rate > (2*(parent_rate % rate))) ? 0 : 1);
 }
 
-static long flexgen_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *prate)
+static int flexgen_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
 	unsigned long div;
 
 	/* Round div according to exact prate and wished rate */
-	div = clk_best_div(*prate, rate);
+	div = clk_best_div(req->best_parent_rate, req->rate);
 
 	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
-		*prate = rate * div;
-		return rate;
+		req->best_parent_rate = req->rate * div;
+		return 0;
 	}
 
-	return *prate / div;
+	req->rate = req->best_parent_rate / div;
+	return 0;
 }
 
 static unsigned long flexgen_recalc_rate(struct clk_hw *hw,
@@ -197,7 +198,7 @@ static const struct clk_ops flexgen_ops = {
 	.is_enabled = flexgen_is_enabled,
 	.get_parent = flexgen_get_parent,
 	.set_parent = flexgen_set_parent,
-	.round_rate = flexgen_round_rate,
+	.determine_rate = flexgen_determine_rate,
 	.recalc_rate = flexgen_recalc_rate,
 	.set_rate = flexgen_set_rate,
 };

-- 
2.39.2

