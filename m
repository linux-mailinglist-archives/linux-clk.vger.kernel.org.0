Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10C604C38D1
	for <lists+linux-clk@lfdr.de>; Thu, 24 Feb 2022 23:32:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235523AbiBXWdP (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 24 Feb 2022 17:33:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231328AbiBXWdP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Feb 2022 17:33:15 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAD37ECB3C
        for <linux-clk@vger.kernel.org>; Thu, 24 Feb 2022 14:32:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id ED840CE21B7
        for <linux-clk@vger.kernel.org>; Thu, 24 Feb 2022 22:32:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B0B8C340E9;
        Thu, 24 Feb 2022 22:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645741959;
        bh=NcvLD+wZKrYEdSg47YbaVSfJCAeRgRIGRh4801MgTY4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=EKlTWCx01FLoKVTcOsvQLu4d5JQIXZ4poLTULy7izKvOm/ywxqcR6XQFQv70TmfFH
         i7c/5aX9Gjh9LKIksIPFLpmPniMt9+czuPa1aKVMUvZQCr/2uTJDhAL/C0cHBuDUWW
         CNfaMNCUtWxeOJjNkRqAzKqim8WDiucJDmP1PqHIrADh4/aDI2s9GeH8PzCKhu8i4P
         DTykH8SE8Wjzc3QlQVgF8/HTdGTVzY3hi1zrmUs+8Smz0+uBwOZljaEBbC3Bg2dlaF
         K/Veqw9olhREXbTVY+m4UOon/DtQ+Ofx2CieSPA6ljEajGz20uOadSDtfWWi1VHofr
         Dsa4sBPSo/MFQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220221161821.jbktbgx2t6aaxds3@houat>
References: <20220125141549.747889-1-maxime@cerno.tech> <20220125141549.747889-3-maxime@cerno.tech> <20220218231508.7B5FCC340E9@smtp.kernel.org> <20220221161821.jbktbgx2t6aaxds3@houat>
Subject: Re: [PATCH v4 02/10] clk: Always clamp the rounded rate
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>
To:     Maxime Ripard <maxime@cerno.tech>
Date:   Thu, 24 Feb 2022 14:32:37 -0800
User-Agent: alot/0.10
Message-Id: <20220224223239.0B0B8C340E9@smtp.kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2022-02-21 08:18:21)
> Hi,
>=20
> On Fri, Feb 18, 2022 at 03:15:06PM -0800, Stephen Boyd wrote:
> > Quoting Maxime Ripard (2022-01-25 06:15:41)
> > > The current core while setting the min and max rate properly in the
> > > clk_request structure will not make sure that the requested rate is
> > > within these boundaries, leaving it to each and every driver to make
> > > sure it is.
> >=20
> > It would be good to describe why. Or decide that it was an oversight and
> > write that down here.
> >=20
> > > Add a clamp call to make sure it's always done, and add a few unit te=
sts
> > > to make sure we don't have any regression there.
> >=20
> > I looked through the per-user constraint patch history on the list but I
> > couldn't really figure out why it was done this way. I guess we didn't
> > clamp the rate in the core because we wanted to give the clk providers
> > all the information, i.e. the rate that was requested and the boundaries
> > that the consumers have placed on the rate.
>=20
> I'm not really sure we should really leave it to the users, something lik=
e:
>=20
> clk_set_range_rate(clk, 1000, 2000);
> clk_set_rate(clk, 500);
> clk_get_rate(clk) # =3D=3D 500
>=20
> Is definitely weird, and would break the least surprise :)
>=20
> We shouldn't leave that to drivers, especially since close to none of
> them handle this properly.

Ok.

>=20
> > With the round_rate() clk_op the providers don't know the min/max
> > because the rate request structure isn't passed. I think my concern a
> > long time ago was that a consumer could call clk_round_rate() and get
> > one frequency and then call clk_set_rate() and get another frequency.
>=20
> I'm not sure I follow you there.
>=20
> The function affected is clk_core_determine_round_nolock(), which is
> called by clk_core_round_rate_nolock() and clk_calc_new_rates(). In
> turn, they will be part of clk(_hw_)_round_clock for the former, and
> clk_core_set_rate_nolock() (and thus clk_set_rate()) for the latter.
>=20
> I don't see how you can get a discrepancy between clk_round_rate() and
> clk_set_rate().
>=20
> And yeah, it's true that the round_rate op won't have the min and max
> passed to them, but i'd consider this an argument for doing this check
> here, since you don't have that option at all for those clocks.

When the range setting API was introduced the rounding logic and the
rate setting logic didn't use the same code paths. It looks like that
code got consolidated now though so we should be fine.
