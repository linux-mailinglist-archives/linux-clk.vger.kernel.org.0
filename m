Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 498EA4BE511
	for <lists+linux-clk@lfdr.de>; Mon, 21 Feb 2022 18:59:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380936AbiBUQnu (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 21 Feb 2022 11:43:50 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357779AbiBUQnu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Feb 2022 11:43:50 -0500
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 475E01EC6D
        for <linux-clk@vger.kernel.org>; Mon, 21 Feb 2022 08:43:27 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 99A3C5C026C;
        Mon, 21 Feb 2022 11:43:26 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 21 Feb 2022 11:43:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; bh=xhsVqRnfiI/ik+lB3wi0y8rl04cEDc32FCF1xG
        oPTtQ=; b=e30WPDbqwFkt7bQuFs+JZ97Shvh028Cdq6aaK6VXruPXul5m6Y//Sy
        SU+Q5a4kg2D9OAw2hXdzJcxM1YhQ+4vumwT+ZrWst4dLgPEEk3XF4KSs8ImnVqoI
        XndoG5ezhSUb2oM1XUlFUG10apfOaje0tpSomSkk+AXfLaPiW5xSZ10mZ2T/MgEe
        74D+5ayQsRk3sHuLGtf0xStTFtCMU0QKUEjFsmuz42+X+DdiYJpfpnh6nGTD5RAe
        shB4VKNV9RZVNvY8xmE+b6115pITPjFm8jGpNxUlFk1pxjap0R8tMNU6cyCNGLlE
        9OCXBe/yIEBCkui1pu+SVSLD+zNZTXxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=xhsVqRnfiI/ik+lB3
        wi0y8rl04cEDc32FCF1xGoPTtQ=; b=ZUnqcB8aP64UyNocgE2UKNwS6XTIaYfF5
        k0FxrWzGAaJApK0QjgWoIqPEcTCke09WnaCHqpySc+SNjOyWQYPNybNKZelmXU4S
        Y72Jb8qbpTMrtOqdpoxUsrvnyRMDj6/D/Tn6YEADwf7J1l3Bn5huznnpiD38aFcr
        ufnFk2pCvTdaldz+Bk+6Fw7s3NoMRr5lmwg6ACgupmVVQwer9C0IAjmFpNYrqgi1
        S8pDfvvZQaHKeuRwEY5CukcIfvmHIVxM2BHHHQluK8YdIeOOEjXznDtRkrSuE+D5
        LWcKS1+w8nhkOLNPSHJBqrnGCdpcKN5oHfZuUlrN88r+GOwD/apog==
X-ME-Sender: <xms:LsETYrzEbYXnpYy8BWvuL9iX1-Um-wGDUiE1lLqb-yBPgxjCa4acHg>
    <xme:LsETYjTIwxuTVDWNzx1znSCm8HOaa_grvlGvi1r8AM_qBNg1ObZmUXCdzrr9Hp32r
    _sdA94KEVQc4Jn-N8Q>
X-ME-Received: <xmr:LsETYlVOi1dSegCKWOAHMIg4MA_zSBj8JTc58OVG-PZfuh9-cLiwg9b0dC2qCVAH0lZnGIQB3jM-tAYtqp0Q4KTM362HA00fFvaQCwE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigdeltdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:LsETYlgk8J-MkCjAhKse10HodEHEMzWfPqcQRtoODCSVxnZ4VvUWTQ>
    <xmx:LsETYtBNSuc-EYh7t4yx7HZNaSbHN6qYNegvApbU2k8YRE_hg64tRQ>
    <xmx:LsETYuKdMtk-cXG1a_Wra7X4vpTN57Ig4n_BvbmIPRmwzkmYTC4e9w>
    <xmx:LsETYv3QBQ3DKAWUgUQkezKuEUMXxLkiJlWtYs1EhAmnleKP_hmMXA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 11:43:25 -0500 (EST)
Date:   Mon, 21 Feb 2022 17:43:23 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>
Subject: Re: [PATCH v4 02/10] clk: Always clamp the rounded rate
Message-ID: <20220221164323.6xacozlk3usiidfy@houat>
References: <20220125141549.747889-1-maxime@cerno.tech>
 <20220125141549.747889-3-maxime@cerno.tech>
 <20220218231508.7B5FCC340E9@smtp.kernel.org>
 <20220221161821.jbktbgx2t6aaxds3@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vim6tjiiy5wotyct"
Content-Disposition: inline
In-Reply-To: <20220221161821.jbktbgx2t6aaxds3@houat>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--vim6tjiiy5wotyct
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi again,

On Mon, Feb 21, 2022 at 05:18:21PM +0100, Maxime Ripard wrote:
> On Fri, Feb 18, 2022 at 03:15:06PM -0800, Stephen Boyd wrote:
> > Quoting Maxime Ripard (2022-01-25 06:15:41)
> > > +/*
> > > + * Test that if our clock has some boundaries and we try to round a =
rate
> > > + * lower than the minimum, the returned rate will be within range.
> > > + */
> > > +static void clk_range_test_set_range_round_rate_lower(struct kunit *=
test)
> > > +{
> > > +       struct clk_dummy_context *ctx =3D test->priv;
> > > +       struct clk_hw *hw =3D &ctx->hw;
> > > +       struct clk *clk =3D hw->clk;
> > > +       long rate;
> > > +
> > > +       KUNIT_ASSERT_EQ(test,
> > > +                       clk_set_rate_range(clk,
> > > +                                          DUMMY_CLOCK_RATE_1,
> > > +                                          DUMMY_CLOCK_RATE_2),
> > > +                       0);
> > > +
> > > +       rate =3D clk_round_rate(clk, DUMMY_CLOCK_RATE_1 - 1000);
> > > +       KUNIT_ASSERT_GT(test, rate, 0);
> > > +       KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
> >=20
> > The comment says within range but this test says exactly the minimum
> > rate. Please change it to test that the rate is within rate 1 and rate
> > 2. Also, we should call clk_get_rate() here to make sure the rate is
> > within the boundaries and matches what clk_round_rate() returned.
>=20
> Ok

Actually, that doesn't work. Calling clk_round_rate() won't affect the
clock rate, so the rate returned by clk_get_rate() won't match what
clk_round_rate() will return.

Maxime

--vim6tjiiy5wotyct
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYhPBKwAKCRDj7w1vZxhR
xQ78AQDEtLblfYMGDqcRFNfjqydpoYdzjhL9Y6Mx5dtOGWmGJQD/XlL1IVl1SD1c
8fz0VakRzj7A8P/dJdtswEdjNj5QTgY=
=zque
-----END PGP SIGNATURE-----

--vim6tjiiy5wotyct--
