Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 832B25FCFDC
	for <lists+linux-clk@lfdr.de>; Thu, 13 Oct 2022 02:23:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230300AbiJMAXE (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 12 Oct 2022 20:23:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230251AbiJMAWM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Oct 2022 20:22:12 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B195104D2C;
        Wed, 12 Oct 2022 17:18:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 84B21B81CCC;
        Thu, 13 Oct 2022 00:18:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A902C433C1;
        Thu, 13 Oct 2022 00:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665620312;
        bh=MrBXj5wqRP/8zvVHc6iGNZ8wD7FEGHjJ5ctjdLJHOdc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CElZ1GvCqXDqpokXsunRxB/cRUer8AavBBM9Dq6mviIW5lxTHn/MpItueeJmkEP4y
         CiacqeQ0d+XCJP149n+LDLHrh3X5igvyplrq/uBcozEHukVqr8L4WZl+CnM9qXsgMM
         i77Rh5Dgm0SsnwItaBsyzvrbm0vKrEgDRaL7lo9fZ6wrr+LT14z0uggjW4keeBc32a
         lH8NT7OpZJCEhpl/rsjEO3+pCsw5QzAHFYbRkAUjxt2O5NPpuYssQjcqgJaBScGM7H
         a5H6pogG3DE+Uuai/HfpeP+EC6Eoqhkh/HjcdLaQaL8j0WUUVXvnYrABvoKWvjGEgs
         3wuUPshw7/UYg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Maxime Ripard <maxime@cerno.tech>,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sasha Levin <sashal@kernel.org>, mturquette@baylibre.com,
        f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
        nsaenz@kernel.org, iivanov@suse.de, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.0 66/67] clk: bcm2835: Make peripheral PLLC critical
Date:   Wed, 12 Oct 2022 20:15:47 -0400
Message-Id: <20221013001554.1892206-66-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221013001554.1892206-1-sashal@kernel.org>
References: <20221013001554.1892206-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Maxime Ripard <maxime@cerno.tech>

[ Upstream commit 6c5422851d8be8c7451e968fd2e6da41b6109e17 ]

When testing for a series affecting the VEC, it was discovered that
turning off and on the VEC clock is crashing the system.

It turns out that, when disabling the VEC clock, it's the only child of
the PLLC-per clock which will also get disabled. The source of the crash
is PLLC-per being disabled.

It's likely that some other device might not take a clock reference that
it actually needs, but it's unclear which at this point. Let's make
PLLC-per critical so that we don't have that crash.

Reported-by: Noralf Trønnes <noralf@tronnes.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Link: https://lore.kernel.org/r/20220926084509.12233-1-maxime@cerno.tech
Reviewed-by: Stefan Wahren <stefan.wahren@i2se.com>
Acked-by: Noralf Trønnes <noralf@tronnes.org>
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/bcm/clk-bcm2835.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index 48a1eb9f2d55..19de0e83b65d 100644
--- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -1784,7 +1784,7 @@ static const struct bcm2835_clk_desc clk_desc_array[] = {
 		.load_mask = CM_PLLC_LOADPER,
 		.hold_mask = CM_PLLC_HOLDPER,
 		.fixed_divider = 1,
-		.flags = CLK_SET_RATE_PARENT),
+		.flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT),
 
 	/*
 	 * PLLD is the display PLL, used to drive DSI display panels.
-- 
2.35.1

