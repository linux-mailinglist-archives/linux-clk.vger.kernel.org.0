Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A74B4BF909
	for <lists+linux-clk@lfdr.de>; Tue, 22 Feb 2022 14:19:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229867AbiBVNT1 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 22 Feb 2022 08:19:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230429AbiBVNT0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Feb 2022 08:19:26 -0500
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29EB5C335D
        for <linux-clk@vger.kernel.org>; Tue, 22 Feb 2022 05:18:59 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id BC1805C02A4;
        Tue, 22 Feb 2022 08:18:56 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 22 Feb 2022 08:18:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to; s=fm2; bh=NhouQ8zFFLXM6fQxEYaRibPb/klm5aDtf6cnEq
        ltKhg=; b=mT0jGuRhnUJcIF1TDWOh5ishORVi6t2ILq63oNhbdjF2eurQXOQQzt
        Kc15SF/oBoAXcFb7+PVyMSgYws4J7x9vN5YVMBnfNwzX3NgnkJPnNHPSR6Ek0f2A
        8bmRPvRkOxw6Xo0dHA8Dw7WSowDqZneHK6UgHpQE3of7aW59i+thZ+viFdjgL+gK
        De0IKTBYWrMu+Mb7i1Eigzk57FLFM3KDYa6XIs9BFuBQtmDsHG2QAxwBYzIxNouV
        mdw76MItH85MF1YmCuzMzjA7cqK9fCPXLRTXK+XBVB0uvyHdV3Pyi2nD+IWsD/KH
        Sx0LdG1G6LcLGb5wpeu2zyJOogoBd2tw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:from:from:in-reply-to:message-id
        :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=NhouQ8
        zFFLXM6fQxEYaRibPb/klm5aDtf6cnEqltKhg=; b=gsz+ogFUB0PYqGp5t9IsOv
        d4kqJE72K+9SULIXDYsQYqlI6TL5BgCUuSa3sRQBvsfeKP+s9LDTmA7B8SYflDY/
        rgA9sHn6oQQmnfyZJ8ahWrgICbNkKhfEyDuKVEyJ+Q8JkEwNiIjOj1wVR6L3/4hm
        JR+O/Huitl7I4krUvlwYxoVLtvfDEbAEA4pbAB3cQQDIysfPn3Nh1FtnzZOAXCC/
        HkFzqKHY7h/NPwC2vyRjN4WOf1ayRxdf+Udsl+7J/PTxVHeF1R8hu8rUEY0i/e0y
        WWYUvo3Y2yg4y8aQxgX5yoDZ65KXheQYughfdSSG/yICPLx0hBdbv+F6PNX0OmIg
        ==
X-ME-Sender: <xms:v-IUYhd-hXil5qFa3uLt195vIigmaPG4xsJbBbWvlzhvTIOpstqqpQ>
    <xme:v-IUYvN1Sbebs4t5_UFeeoJWZbEfrnqrt2QTktvS5I77UXfzmGRIZgD6MNh4LiU8d
    uKkmXH1hRAkjt-54jc>
X-ME-Received: <xmr:v-IUYqjio3c-LoBldWIxvtdcmWi14ZIqm7NwRZIjZgukoGeXeJtcM7h_qTXo7EYrPKxP6JJ3KnjFTQbTxyL1e7hl1gRMUR3Mve6yGCo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeekgdeglecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcu
    tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
    hrnhepteetledtudejhffftdeugfduffelleelheejgeegffduvddvgfdvhffhlefgteff
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:v-IUYq_dLRZ6gZdN6BXWzWsvE5ITpOXVC6xThGeR7-fbDDcjPmXY2w>
    <xmx:v-IUYtthSgINy0qEzXlHYMjibQx9TwgPBZ8_CHVQi0hiIaEWR_xRag>
    <xmx:v-IUYpEIYW5qPuWEu-AWefBhYeww6OxqM6Q5HuUfKXyV-dKL2aJgYQ>
    <xmx:wOIUYu9iGKEf9G5HWj1ynJTv6uVIX3kpc6aGhPsn5fjrOaWmIbOGpg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Feb 2022 08:18:55 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 00/11] clk: Improve clock range handling
Date:   Tue, 22 Feb 2022 14:18:42 +0100
Message-Id: <20220222131853.198625-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,=0D
=0D
This is a follow-up of the discussion here:=0D
https://lore.kernel.org/linux-clk/20210319150355.xzw7ikwdaga2dwhv@gilmour/=
=0D
=0D
and here:=0D
https://lore.kernel.org/all/20210914093515.260031-1-maxime@cerno.tech/=0D
=0D
While the initial proposal implemented a new API to temporarily raise and l=
ower=0D
clock rates based on consumer workloads, Stephen suggested an=0D
alternative approach implemented here.=0D
=0D
The main issue that needed to be addressed in our case was that in a=0D
situation where we would have multiple calls to clk_set_rate_range, we=0D
would end up with a clock at the maximum of the minimums being set. This=0D
would be expected, but the issue was that if one of the users was to=0D
relax or drop its requirements, the rate would be left unchanged, even=0D
though the ideal rate would have changed.=0D
=0D
So something like=0D
=0D
clk_set_rate(user1_clk, 1000);=0D
clk_set_min_rate(user1_clk, 2000);=0D
clk_set_min_rate(user2_clk, 3000);=0D
clk_set_min_rate(user2_clk, 1000);=0D
=0D
Would leave the clock running at 3000Hz, while the minimum would now be=0D
2000Hz.=0D
=0D
This was mostly due to the fact that the core only triggers a rate=0D
change in clk_set_rate_range() if the current rate is outside of the=0D
boundaries, but not if it's within the new boundaries.=0D
=0D
That series changes that and will trigger a rate change on every call,=0D
with the former rate being tried again. This way, providers have a=0D
chance to follow whatever policy they see fit for a given clock each=0D
time the boundaries change.=0D
=0D
This series also implements some kunit tests, first to test a few rate=0D
related functions in the CCF, and then extends it to make sure that=0D
behaviour has some test coverage.=0D
=0D
Let me know what you think=0D
Maxime=0D
=0D
Changes from v4:=0D
  - Rename the test file=0D
  - Move all the tests to the first patch, and fix them up as fixes are don=
e=0D
  - Improved the test conditions=0D
  - Added more tests=0D
  - Improved commit messages=0D
  - Fixed a regression where two disjoints clock ranges would now be accept=
ed=0D
=0D
Changes from v3:=0D
  - Renamed the test file and Kconfig option=0D
  - Add option to .kunitconfig=0D
  - Switch to kunit_kzalloc=0D
  - Use KUNIT_EXPECT_* instead of KUNIT_ASSERT_* where relevant=0D
  - Test directly relevant calls instead of going through a temporary varia=
ble=0D
  - Switch to more precise KUNIT_ASSERT_* macros where relevant=0D
=0D
Changes from v2:=0D
  - Rebased on current next=0D
  - Rewrote the whole thing according to Stephen reviews=0D
  - Implemented some kunit tests=0D
=0D
Changes from v1:=0D
  - Return NULL in clk_request_start if clk pointer is NULL=0D
  - Test for clk_req pointer in clk_request_done=0D
  - Add another user in vc4=0D
  - Rebased on top of v5.15-rc1=0D
=0D
Maxime Ripard (11):=0D
  clk: Introduce Kunit Tests for the framework=0D
  clk: Enforce that disjoints limits are invalid=0D
  clk: Always clamp the rounded rate=0D
  clk: Use clamp instead of open-coding our own=0D
  clk: Always set the rate on clk_set_range_rate=0D
  clk: Add clk_drop_range=0D
  clk: bcm: rpi: Add variant structure=0D
  clk: bcm: rpi: Set a default minimum rate=0D
  clk: bcm: rpi: Run some clocks at the minimum rate allowed=0D
  drm/vc4: Add logging and comments=0D
  drm/vc4: hdmi: Remove clock rate initialization=0D
=0D
 drivers/clk/.kunitconfig          |   1 +=0D
 drivers/clk/Kconfig               |   7 +=0D
 drivers/clk/Makefile              |   1 +=0D
 drivers/clk/bcm/clk-raspberrypi.c | 125 ++++-=0D
 drivers/clk/clk.c                 |  73 ++-=0D
 drivers/clk/clk_test.c            | 790 ++++++++++++++++++++++++++++++=0D
 drivers/gpu/drm/vc4/vc4_hdmi.c    |  13 -=0D
 drivers/gpu/drm/vc4/vc4_kms.c     |  11 +=0D
 include/linux/clk.h               |  11 +=0D
 9 files changed, 978 insertions(+), 54 deletions(-)=0D
 create mode 100644 drivers/clk/clk_test.c=0D
=0D
-- =0D
2.35.1=0D
=0D
