Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E7B64C10BA
	for <lists+linux-clk@lfdr.de>; Wed, 23 Feb 2022 11:56:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237755AbiBWK4h (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 23 Feb 2022 05:56:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236233AbiBWK4g (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Feb 2022 05:56:36 -0500
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B0FE7DE04
        for <linux-clk@vger.kernel.org>; Wed, 23 Feb 2022 02:56:08 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 6EDB55C0153;
        Wed, 23 Feb 2022 05:56:07 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 23 Feb 2022 05:56:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; bh=DD5Ix+IEk47ry3gfmjU/T7/9gYnF9Y
        y1lDEaoDCp7LE=; b=RSDsOXk/M4/S9V4Vc00zJii9rR7445/PBieenaLomyQADK
        +IrrITwd0Zr0XrsBBcdrjagGeH5fsnAvL4WY6j1ByEU1H4k/1PTClx7HnlVsOxCU
        xiicLKTESIv3qgiO3rG1jm+hAY8z7l5ci44uj0aVjZvuDoaqO//pnGBPy9SInxCg
        oE1JYzhJBkW9Vf9J/rhvWfaWXXWE0BDsbdlRnPAPlswMQtVdZTctwPVR4ljCu8Us
        8wlMDRPGcBumT2MSwTMrXoxxWmLZ+cQC6dRokyEK9kApAQF+2xo3gC7PR5dEKNhx
        LoTlQh4vhOlQWWncSdlyY1yNTVUCIeHyZYjmw+ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=DD5Ix+
        IEk47ry3gfmjU/T7/9gYnF9Yy1lDEaoDCp7LE=; b=GM5mXyFH55Rf3zZAYhhMyI
        5PpTOYJJC7acCobjV+1K+5E7OiBZWAEbGSQG4GP1XYaL8ijlGQls+82/87R62LhA
        BF0NYxmta62pddkL9znTU9qoLAdUymNisD1LRXyJWwqHfHwjNkDeso0ERgLQikGU
        ZAq5gYkpxZErQtU0krH2paWkMWPvRNMsQucM8egSVibzIyTEUxOhOHkmQ4gH9JOv
        GthUYG93TgsH5fBXIICIhw+sV15vz0zswj6Q4I7v/2/DIufx2kBiySc6pd/Qj8Y4
        5r0PpsQk91YEaMJUaYS/e3fI9bC9aGRaKtrtInuJq7l8rGNx4ykVf/Be7yWbxHXA
        ==
X-ME-Sender: <xms:xxIWYiF2LDwBMmAO9Z4mUskbjmBxuThxF9AiC0intk26gUUM9RZiMw>
    <xme:xxIWYjUOcl1YhsZne6WoAbNBf_4fTyvMBD8BGeHjpLsnZZZTPUpHkYtBv2lPiOM7P
    R3cSvJ_Lu6U82dJh1I>
X-ME-Received: <xmr:xxIWYsICkEhiXIpoxkMOZjvhcBJVu5p-b4xvhTZ-SxzrZktVNu_BRPdhXorJ-VoBv4oNxo8CnaZW6cg19g7lTJO-WerDPiInhJNmPEU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrledtgddvudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:xxIWYsHkhlNHI23z2T2kDJv5Iq7Z4vqmMsbA48bVdeTfgTITEhH5tA>
    <xmx:xxIWYoWQJD7DOlzSnsDrOKpelp82qXwxHolB7QL_DWz1-_jKuSbIdw>
    <xmx:xxIWYvOi62C7N5mYhxRPE-MggRI-EkFko3ZGYx1pnw51RnUMfI216g>
    <xmx:xxIWYrGPf-D6mvyqJQ-jrw1R-ojWTbxMsTKAvEQCtfMh2D91Vt6amw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Feb 2022 05:56:06 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v6 01/12] clk: Fix clk_hw_get_clk() when dev is NULL
Date:   Wed, 23 Feb 2022 11:55:49 +0100
Message-Id: <20220223105600.1132593-2-maxime@cerno.tech>
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

Any registered clk_core structure can have a NULL pointer in its dev
field. While never actually documented, this is evidenced by the wide
usage of clk_register and clk_hw_register with a NULL device pointer,
and the fact that the core of_clk_hw_register() function also passes a
NULL device pointer.

A call to clk_hw_get_clk() on a clk_hw struct whose clk_core is in that
case will result in a NULL pointer derefence when it calls dev_name() on
that NULL device pointer.

Add a test for this case and use NULL as the dev_id if the device
pointer is NULL.

Fixes: 30d6f8c15d2c ("clk: add api to get clk consumer from clk_hw")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 8de6a22498e7..fff5edb89d6d 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3773,8 +3773,9 @@ struct clk *clk_hw_create_clk(struct device *dev, struct clk_hw *hw,
 struct clk *clk_hw_get_clk(struct clk_hw *hw, const char *con_id)
 {
 	struct device *dev = hw->core->dev;
+	const char *name = dev ? dev_name(dev) : NULL;
 
-	return clk_hw_create_clk(dev, hw, dev_name(dev), con_id);
+	return clk_hw_create_clk(dev, hw, name, con_id);
 }
 EXPORT_SYMBOL(clk_hw_get_clk);
 
-- 
2.35.1

