Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2EC55931CF
	for <lists+linux-clk@lfdr.de>; Mon, 15 Aug 2022 17:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231955AbiHOPbo (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 15 Aug 2022 11:31:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231313AbiHOPbk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Aug 2022 11:31:40 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCC5D167C9;
        Mon, 15 Aug 2022 08:31:38 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 32B75320014C;
        Mon, 15 Aug 2022 11:31:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 15 Aug 2022 11:31:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1660577493; x=1660663893; bh=COYSOGHtOo
        o3W+aHmo+tp/Q30caAeddvYY/qrRqsGjo=; b=fYjFKqLO6pKb0yjRHGlSVvezIg
        ZMrauuc4fW73ObCeuBlID5ww9vUdNUOAyKtHST9YjDK2rEJ+uw0zXj/+I/u3lNKw
        DEZbagxR+Mwps3H7VlcbakwLF3TOAGcfNqo1rR7YogdxCWyh6o2StJWXyCTO3ywB
        dV++JJNL5HIVZiW9xZP8NZRtVqP2g1I3Nojofg03oMiOJtzghN1rgVM4J50VVdY1
        tK4Xep2fBhJYEzxiaXpmH8I3tTkmAgi7BQTCLoRcLnwHr8T+P4Xe/Z1W4E6FRM80
        DF8SH++A2OiwmIxu+mum3H7KJ3DHsKkypBFZiLa+eY0Z/gqfU9z+dThqOXNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660577493; x=1660663893; bh=COYSOGHtOoo3W
        +aHmo+tp/Q30caAeddvYY/qrRqsGjo=; b=Mux3WR3JB19iIJH9Mlfz3+op3f4uH
        F9nTN7bp14nIexoCPfyFN7u3olPD/477qAt4qsN9xlk91C+sx3sItLiEWRDZfz0u
        2JROpwRb1/TteFUhj+SJHD6rjevm9r8Bx668IA86gY/sGP1FC8zDG9nIz/AyOIV4
        +x87Ozxvdp2Fn1IlAZDz20nGPP44HSPKVmpyacJNeQuy/ZgGWaumQpBMavPRPmX3
        cw7HTpBKTbQOivLRp0A7etCUdEmG4eNJD8F4+Gu4Pe5NYOo9i60XhzRv9eUOIGOa
        klaaH5CmlUj1h2elrOaQPdB4bzmhJoEdLfb0G0/eTvriUoYMa+5DyLrPA==
X-ME-Sender: <xms:1Wb6YpEXT3QZJJGqa14waDdYqYYre6RcqOVVhCITHxS6uwqLqc5_lQ>
    <xme:1Wb6YuVqe1Sv4dNOa-MndCYSmNYh-Ggr3h5nxBldM4lmxwTia_fVB25mH6g9oWYyy
    XmMRmDqcpgZ-glppSs>
X-ME-Received: <xmr:1Wb6YrKZEvOsaHSM_isGgiXHXHuCHM8MkqMPuwAJy7NJxVMuszbrDfvkP9pS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfogfesthekredtredtjeenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeehgeekgeekkedvfeehgfelleeiffejfeevhfdtfeekjeeggeetkefhteek
    leejtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
    hh
X-ME-Proxy: <xmx:1Wb6YvHI_IVBZMQM5-i3zr_z__C1401Pz4M0vkt-JojBK7anPHA3CQ>
    <xmx:1Wb6YvXYmaE8GGGiB0goZnrtTG_ulqpNWBuk3D3VbAtlqCDtdz6wBQ>
    <xmx:1Wb6YqMaMADgsJFRYQWmowjzgkTUQNl_vykmF1CehZ1_Ggtqu-YU6Q>
    <xmx:1Wb6YoXPL3bQqtucI4THci3-Dw1_UVdQxIOmxVafwksxteMnN8ek4g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 11:31:32 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Ray Jui <rjui@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <sboyd@kernel.org>,
        Scott Branden <sbranden@broadcom.com>,
        Maxime Ripard <mripard@kernel.org>,
        Emma Anholt <emma@anholt.net>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, Dom Cobley <popcornmix@gmail.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/7] drm/vc4: Fix the core clock behaviour
Date:   Mon, 15 Aug 2022 17:31:22 +0200
Message-Id: <20220815-rpi-fix-4k-60-v1-0-c52bd642f7c6@cerno.tech>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-a76f5
X-Developer-Signature: v=1; a=openpgp-sha256; l=1621; i=maxime@cerno.tech; h=from:subject:message-id; bh=NvfqtszeIkfBJ8DEBN1/EaTyTba+UU+/5+hHzJQzAnU=; b=owGbwMvMwCX2+D1vfrpE4FHG02pJDEm/0k7ohQdLG/6cnWrqd1Nrsymv2pdr1iKLYv7M+RJqG22u mPS/o4SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABN52svwo3/yiwB+zoUTFY5f+Mr61E j9559viy2P73s3T9xc88kJJUaGE0f6ghiVfPfcfdOf9cF3o6bunw+7Tq6Sf+uzKLRoSesNdgA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp; fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

Hi,

Those patches used to be part of a larger clock fixes series:
https://lore.kernel.org/linux-clk/20220715160014.2623107-1-maxime@cerno.tech/

However, that series doesn't seem to be getting anywhere, so I've split out
these patches that fix a regression that has been there since 5.18 and that
prevents the 4k output from working on the RaspberryPi4.

Hopefully, we will be able to merge those patches through the DRM tree to avoid
any further disruption.

Let me know what you think,
Maxime

---
Dom Cobley (1):
      drm/vc4: hdmi: Add more checks for 4k resolutions

Maxime Ripard (6):
      clk: bcm: rpi: Create helper to retrieve private data
      clk: bcm: rpi: Add a function to retrieve the maximum
      clk: bcm: rpi: Add a function to retrieve the minimum
      drm/vc4: hdmi: Fix hdmi_enable_4kp60 detection
      drm/vc4: hdmi: Rework hdmi_enable_4kp60 detection code
      drm/vc4: Make sure we don't end up with a core clock too high

 drivers/clk/bcm/clk-raspberrypi.c        | 73 ++++++++++++++++++++++++++++----
 drivers/gpu/drm/vc4/vc4_drv.h            | 14 ++++++
 drivers/gpu/drm/vc4/vc4_hdmi.c           | 25 +++++------
 drivers/gpu/drm/vc4/vc4_hdmi.h           |  8 ----
 drivers/gpu/drm/vc4/vc4_hvs.c            | 13 ++++++
 drivers/gpu/drm/vc4/vc4_kms.c            | 17 +++++---
 include/soc/bcm2835/raspberrypi-clocks.h | 21 +++++++++
 7 files changed, 138 insertions(+), 33 deletions(-)
---
base-commit: 568035b01cfb107af8d2e4bd2fb9aea22cf5b868
change-id: 20220815-rpi-fix-4k-60-17273650429d

Best regards,
-- 
Maxime Ripard <maxime@cerno.tech>
