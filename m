Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E21704DAC93
	for <lists+linux-clk@lfdr.de>; Wed, 16 Mar 2022 09:37:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348902AbiCPIjC (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 16 Mar 2022 04:39:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233630AbiCPIjB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Mar 2022 04:39:01 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08609C6B
        for <linux-clk@vger.kernel.org>; Wed, 16 Mar 2022 01:37:46 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id BB2E75C0228;
        Wed, 16 Mar 2022 04:37:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 16 Mar 2022 04:37:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; bh=18XKH3GFDQ+Ep+q25Q1/K+i7TdNK2S5fPAytfx
        lQ4CI=; b=lG4LLQHaH/uhxmlDCK0JyYlFT+qTRn1o4C0vRM1eC+cyOpFWHnbBRi
        sDUAsWiebgVxiRxWymgj/tNSqBT/7Z0ZfXfm1P8FSmhQuMxjEvtSRxOBuWBn0A7L
        Mt8xiSJKdqEBiW/yRJWm6cSMfkTicCjq1eILExXsyuiowoyHDAsaIHLh59ydhtrK
        LcQ800/uSVxgczMfFT+3cWfhiHvaJppspak48tBi8j8uSZRfclAemBLayRkL4JZZ
        Bw3H5cZuGSbIX33+6EfzlYZIXbR5CfuGV9IxPJU3sF/rXOCgfF/fQ5QVlYQ8lrQ2
        DWJrRm9AI95il1TFGIXleDnUTDunj9qA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=18XKH3GFDQ+Ep+q25
        Q1/K+i7TdNK2S5fPAytfxlQ4CI=; b=FPeBWKiF5ixx9K2jTufISYHPrNvtx2kgq
        Ov9bgLg/tsfTmAvPRhim+CTgoL2rYSSJaa1loKyp2T7D57vQOjBOVaecwHrftBm8
        1LkHsHXvMuplSbUJ/G4EWNAHqf7jsHjjn88qz9o18EPrcA7MwsDwmr+DOQBd97qb
        qMQqT5v0yMqQF35jEwKy8dbcKpquSVgHws9S4R3xqICfbdnSnUFQzR/wjcrby7gz
        KF7GSum2TbbB3nrcHLd0MHqJyICVCKjkR+NAlyu+K47Q5cNhG761RVqSdWqUxvpb
        PV3WhbTWCrdrOq+jrguACJgBFg8tJMh/B6wFXrE/VnVrLBG3xx6Hg==
X-ME-Sender: <xms:16ExYg0kON57HZjw6oripiZsO5sTtChVj8yMt6MIvZZi2h9v6GSQkw>
    <xme:16ExYrEjPdgT3gGav0ygTkxw9y352rs_hsjRLCOco5F0BaEcfC9zKHaILNmEwsvBD
    6bZb91zjTomTK-Bqw4>
X-ME-Received: <xmr:16ExYo6QpVwIUDFo0T7a7qbLN-YX_vmzJFb2Iwwj2YOCoEqlhk61ez-uzVUgBnTKczCT7sxA1z58rkLhAi3xdniWnVMXGG_yZNrsgU0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudefuddguddvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleff
    gfejvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
    hh
X-ME-Proxy: <xmx:16ExYp2MKd40NjsLWoDrdEnAJkh24XvOKoyANkNxIor2KQEDZzITCw>
    <xmx:16ExYjGxBe8rUaSCg6lmuxuVjX5O3R1gzXA-W1gQrh72wqtRDySLvA>
    <xmx:16ExYi8UsTop4VeK8MPd96mgSt1GiRO--6kjVpR0hDxkLNRh0_JZcw>
    <xmx:16ExYo6m2r3WN1YgHrQM0IouYUj0o1uBBf7w0jc1XXxxoXt4klcckg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Mar 2022 04:37:43 -0400 (EDT)
Date:   Wed, 16 Mar 2022 09:37:41 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v7 00/12] clk: Improve clock range handling
Message-ID: <20220316083741.5hvuli2cvxlqr2ji@houat>
References: <20220225143534.405820-1-maxime@cerno.tech>
 <20220312030842.DB69FC340E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mdxmlp5d2ghaq3tj"
Content-Disposition: inline
In-Reply-To: <20220312030842.DB69FC340E9@smtp.kernel.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--mdxmlp5d2ghaq3tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Mar 11, 2022 at 07:08:39PM -0800, Stephen Boyd wrote:
> Quoting Maxime Ripard (2022-02-25 06:35:22)
> > Hi,
> >=20
> > This is a follow-up of the discussion here:
> > https://lore.kernel.org/linux-clk/20210319150355.xzw7ikwdaga2dwhv@gilmo=
ur/
> >=20
> > and here:
> > https://lore.kernel.org/all/20210914093515.260031-1-maxime@cerno.tech/
> >=20
> > While the initial proposal implemented a new API to temporarily raise a=
nd lower
> > clock rates based on consumer workloads, Stephen suggested an
> > alternative approach implemented here.
> >=20
> > The main issue that needed to be addressed in our case was that in a
> > situation where we would have multiple calls to clk_set_rate_range, we
> > would end up with a clock at the maximum of the minimums being set. This
> > would be expected, but the issue was that if one of the users was to
> > relax or drop its requirements, the rate would be left unchanged, even
> > though the ideal rate would have changed.
> >=20
> > So something like
> >=20
> > clk_set_rate(user1_clk, 1000);
> > clk_set_min_rate(user1_clk, 2000);
> > clk_set_min_rate(user2_clk, 3000);
> > clk_set_min_rate(user2_clk, 1000);
> >=20
> > Would leave the clock running at 3000Hz, while the minimum would now be
> > 2000Hz.
> >=20
> > This was mostly due to the fact that the core only triggers a rate
> > change in clk_set_rate_range() if the current rate is outside of the
> > boundaries, but not if it's within the new boundaries.
> >=20
> > That series changes that and will trigger a rate change on every call,
> > with the former rate being tried again. This way, providers have a
> > chance to follow whatever policy they see fit for a given clock each
> > time the boundaries change.
> >=20
> > This series also implements some kunit tests, first to test a few rate
> > related functions in the CCF, and then extends it to make sure that
> > behaviour has some test coverage.
> >=20
> > Let me know what you think
>=20
> Thanks. I'm going to apply this to clk-next but not the last two drm
> patches. That is OK?

Yes, that will be perfect, thanks!
Maxime

--mdxmlp5d2ghaq3tj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYjGh1QAKCRDj7w1vZxhR
xe+0AQCXDnxMwBcdSas+jyIQJCIGV1nH10as/gYsRRfoxH63mwD+Ie0RrDh9YB1m
dNrIjZlCP0+Ijrn9vHDT5uvla1NklQ0=
=PeNm
-----END PGP SIGNATURE-----

--mdxmlp5d2ghaq3tj--
