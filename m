Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 600FF4BE077
	for <lists+linux-clk@lfdr.de>; Mon, 21 Feb 2022 18:52:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378881AbiBUPNc (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 21 Feb 2022 10:13:32 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378877AbiBUPN1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Feb 2022 10:13:27 -0500
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 605391B792
        for <linux-clk@vger.kernel.org>; Mon, 21 Feb 2022 07:13:03 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id A629B5C022F;
        Mon, 21 Feb 2022 10:13:02 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 21 Feb 2022 10:13:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; bh=4kuN6SwYhWH1jp3mcRGG1UgtdIE7Q0R2sgI46+
        CU+QA=; b=mlqUGsW2uLpowu8d4gx6eCYc5diBj544hX2QVw3ZvLqVqYwlyQ1+bS
        N1ZUvyyaw1tWTjphZonX+3PjgSri1Ed5Le5OffWXPLCG05BqQfibmg+hBtzzFtEQ
        hXP6A5+gpNnJH2jLWhCNna3suxm5DZEkcIIil2MRsi5q0Twnp+ujKMP0HIW58/uJ
        GxNDHLyIvEIYi5cmVjAsH+hatNKGchH+7yhGT/BsoNpM16rmTa1tMPidmuT4AxCq
        tKFWMHNSAxLcI/89hYEfdI8HCCp/Mo9ogJk72a/frENSvgnQfLhOyHLd7M4Ta4rQ
        ajYq5xjVagWFtqBBuFbJD0TeJ+yEpfyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=4kuN6SwYhWH1jp3mc
        RGG1UgtdIE7Q0R2sgI46+CU+QA=; b=BJIxtJOJp1lGicnizM+jXBfio5qfyDOHS
        kRrS/Eq4KwWy39NImuc0suL3IzC5BIcY5HF4gmN5sYMbBkFFcZGSndhA3+eBLYbU
        MPOOQGFxqwm6my7JX+L6TsFdDox9lVZxOVHee+Lh+LzGCIEvka/6QuZBOv7uzu/u
        gjj/toBYVt1IQDTDcdMEhrrztPQi3kLjnfykvh0sLITAeqF8eH+rICPlCA0YP+/D
        sBQfD4mIdwJQ4njOmNjFh5vPL32ybM+koJrrrlSmNdBJEs3pGO+q+TAhxfp1bhAK
        ZIZlkftfOXbJq31yBH5zmn5yPZSU9UA00yGx3dz5N3h0XzFRTDPCQ==
X-ME-Sender: <xms:_qsTYpKE83o9kAkod9x-OU5NMR-rhf22oexubIbiSCCYPiCy0zwa1Q>
    <xme:_qsTYlK6WD3r0vNarXkqupQXkTqQS-ipJjAiAG-raSAw2V6y98FQsHecT_4Yjfdwu
    DJl0c3xavWz2Lq5YX4>
X-ME-Received: <xmr:_qsTYhtZJa2pwXyi4BvDg5ffZZQ8haWEBX51f-RAmbhSOgrVQkC17H3MRAcOmlIHly0_3jFRDYdfW6wKMK9VYPnlvc5yXPW8731BKCE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigdejvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:_qsTYqaevBrl3ssOPGFkb8bYOOfqx61R7przKO4YouIz8CttHXq3hg>
    <xmx:_qsTYgZ1JEptE9RNCLJyBoJUpxf1dakhmVrPxs7yVv3WBXWFn9I_uw>
    <xmx:_qsTYuDTF-n6NIMeKRkxi8vr5cR7lV-gIDREXLuK0VFQaINK9uWymA>
    <xmx:_qsTYg59jWS2YRvmv7FT3MGAlsR74j0fyhgYLOzE_ZguWmM1RFIL8w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 10:13:01 -0500 (EST)
Date:   Mon, 21 Feb 2022 16:12:59 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>, kunit-dev@googlegroups.com
Subject: Re: [PATCH v4 01/10] clk: Introduce Kunit Tests for the framework
Message-ID: <20220221151259.xoiyvafhkfpq5zlt@houat>
References: <20220125141549.747889-1-maxime@cerno.tech>
 <20220125141549.747889-2-maxime@cerno.tech>
 <20220219022048.19E1BC340E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gnlyikck2xjat746"
Content-Disposition: inline
In-Reply-To: <20220219022048.19E1BC340E9@smtp.kernel.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--gnlyikck2xjat746
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen,

Thanks for your review

On Fri, Feb 18, 2022 at 06:20:46PM -0800, Stephen Boyd wrote:
> It would also be good to add a test that tries to set the clk rate with
> clk_set_rate() after a range has been set that is outside the acceptable
> range and verify that it fails, and one that tries to set it within the
> range and make sure it succeeds (and changes it to be exactly what was
> set).

Do we expect it to fail though?

If we do:

clk_set_range_range(clk, 1000, 2000);
clk_set_rate(3000);

The current behaviour is that the rate is going to be rounded to 2000,
but it doesn't fail.

Or is it what you meant by fail? ie, that the return code is 0, but the
rate isn't what we asked for?

> Similarly, a call to set two disjoint ranges and verify that the call
> that tries to set the second disjoint range fails.

Ok

> We want to test the failure paths as well, to make sure we don't start
> causing them to pass, unless it's expected.

Do you have any other failure condition you want to test? I already
tried to come up with those I could think of, but I clearly missed some
if you said that :)

> This patch could also contain the failure scenario you're experiencing
> and mark it as expecting to fail. Then the patch that fixes it in the
> core could mark the test as expecting to pass, which may help us
> understand more easily what exactly changed instead of having to
> figure that out after the fact by reading the entire test.>

Ok

Maxime

--gnlyikck2xjat746
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYhOr+wAKCRDj7w1vZxhR
xcq+AQDYttqrX+MMbrMwTNw0xMCiNVLqpZp31nrbHfl/94MLmwEAvVZhsur5oyxG
ekeYX0q5VunoJJn2tWvV/f51KsCsoQw=
=/v0y
-----END PGP SIGNATURE-----

--gnlyikck2xjat746--
