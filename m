Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E64455BFAA1
	for <lists+linux-clk@lfdr.de>; Wed, 21 Sep 2022 11:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231533AbiIUJTS (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 21 Sep 2022 05:19:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231776AbiIUJS6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Sep 2022 05:18:58 -0400
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com [66.111.4.221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7626915CE;
        Wed, 21 Sep 2022 02:18:20 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id E8F0E5817D8;
        Wed, 21 Sep 2022 05:17:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 21 Sep 2022 05:17:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1663751872; x=1663759072; bh=mDRCW58754
        cJxsMgzdDDTe0R8uGcv3CYi1zG8IpvdW8=; b=J6Y9pJauLu6Ni+2JRRbpeLEBUG
        KCrjiOg7u5/nvy1tfBlBXdLThLcQbw010xly84RHJAb8MsrKt6tsecxAmo5to0x0
        LbNwbcDe9+VBoU8ShH4QCV9mbjvGzxpUL4fxW23ftAON3xmHQRwh/7E1hiwqU+TZ
        LEMwHQzZhrfEOx+5NAlROYE7STj7HwTvu206sxNPd/4q0gIoHsfhbCyCWCQBKhbm
        YcEY+OPRIt4bZH57edAs6Ve3AivmSw/oqWmSwe4HRo35urF4KD0CqT2xnuCcAV/E
        aWybGKcvUi1uMvApEht/6nlow+STqVbQxfwLDFryEqlJ+gnb+ELjHUkDZV2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1663751872; x=1663759072; bh=mDRCW58754cJxsMgzdDDTe0R8uGc
        v3CYi1zG8IpvdW8=; b=eEIceKVPN0B77cF3oztkJIgtT3vMZEE4z/ja3I1oTJcz
        hlzSZ7fY7QqXvFXfIJGuenjd3/HV1nQ1wpc/BpWFfz1QGQsCJ82q3zBsqUoO/wM8
        doOPVQPFilJjiRElC7bO0wlFRu0s/EyPL0mdxaYdbbPMAqaZDFwbyGEXSZQkYgk7
        oDw3hbrOMrAJzcUgbwsdSBLiNt2B5vn5a/FU8JoTaxzsazKGhrfnhOyKUXo1S2b3
        ipqAu9ube0T8iCDLQUocA+LkbndEh3NUc1kk3UmXTzMxqGScqND8Xp170pqp0xt1
        PTTx13K7c2QODzbAG9OmOybBOZnD3tv/7TdApBY2Bw==
X-ME-Sender: <xms:wNYqY_70IrP5apPEhgA7V9JHdHPm2un5C-Uj4mXXSPEaUIriQ9AcvQ>
    <xme:wNYqY06gHBRAqK-OzQ6Q-N7RrYSMw03rY6uCPsQR1dAZdB698WseY3lLAc5EvzHdU
    SFQ64aOdgvHvKL-xlg>
X-ME-Received: <xmr:wNYqY2etfqvbVfs81sOyrartK9-_pBavX-PSwt5mRVn6oxXNK1KLzUP_9TU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefuddgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
    hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:wNYqYwLLkUZZAvsEGxZUHhTtYgnXUyQqkFmWEZEtBoWFe59jvAZCqQ>
    <xmx:wNYqYzIAkyYhq_zyF8vAz6Mcg4-iA0ilNH0IuiLa280eiB59aQvyww>
    <xmx:wNYqY5ydwoknO7YcBbmG1IZomjhSOxalL9g0d8jAljqq0iP-9MQMFQ>
    <xmx:wNYqYyWr8cA7k58iemG67EwkPA88zbY21YNJGBYIUbYvDpUkItoDaQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Sep 2022 05:17:51 -0400 (EDT)
Date:   Wed, 21 Sep 2022 11:17:48 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Scott Branden <sbranden@broadcom.com>,
        Stephen Boyd <sboyd@kernel.org>, Emma Anholt <emma@anholt.net>,
        Ray Jui <rjui@broadcom.com>,
        linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dom Cobley <popcornmix@gmail.com>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/7] firmware: raspberrypi: Move the clock IDs to the
 firmware header
Message-ID: <20220921091748.u6qcba6nwclvezzg@houat>
References: <20220815-rpi-fix-4k-60-v2-0-983276b83f62@cerno.tech>
 <20220815-rpi-fix-4k-60-v2-2-983276b83f62@cerno.tech>
 <688777fc-e6af-8cbe-b19d-c531a7a66b32@i2se.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="itnh57rcj5wjjcou"
Content-Disposition: inline
In-Reply-To: <688777fc-e6af-8cbe-b19d-c531a7a66b32@i2se.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--itnh57rcj5wjjcou
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 20, 2022 at 06:01:08PM +0200, Stefan Wahren wrote:
> Am 20.09.22 um 14:50 schrieb Maxime Ripard:
> > We'll need the clock IDs in more drivers than just the clock driver from
> > now on, so let's move them in the firmware header.
>=20
> recently as i reviewed the clk-raspberrypi i noticed this, too. But from =
my
> point of view the clock ids should go to include/dt-bindings/clock (like
> bcm2835.h) because these clock ids are actually referenced in the DTS fil=
es
> and we need to make sure they are in sync. AFAIR this would also result in
> change from enum to defines.
>=20
> Sorry, i didn't had the time to send a patch for this.

IMO, we need both, and this enum still belongs in the firmware header.
We have two separate things, the firmware interface and the DT
interface. The kernel is a consumer for both, but the fact that they
match is an implementation detail. It might even change in the future
for all we know.

So having a header to use defines for the clock indices in the DT looks
like a good idea to me, but I think we should keep that enum in the
firmware header as well.

Maxime

--itnh57rcj5wjjcou
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYyrWvAAKCRDj7w1vZxhR
xQb6AP9gsTEDLx4N2ddX7AdtvgY6eQfDUqVGB8S6WhNsSuhe/gD7B0sPmldeC8DV
XTcG9b2xt1s+i4ha7GqV2l+eQU2chAQ=
=Um8H
-----END PGP SIGNATURE-----

--itnh57rcj5wjjcou--
