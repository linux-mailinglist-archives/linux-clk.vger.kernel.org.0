Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE3B36C5871
	for <lists+linux-clk@lfdr.de>; Wed, 22 Mar 2023 22:06:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229678AbjCVVGh (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 22 Mar 2023 17:06:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbjCVVGg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Mar 2023 17:06:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EAEE8A76;
        Wed, 22 Mar 2023 14:06:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 255C6622DB;
        Wed, 22 Mar 2023 21:06:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8BEBC433D2;
        Wed, 22 Mar 2023 21:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679519166;
        bh=IwqcGZUb+JAwQ49B5qlPxqjaSl7Z1L+y305zKBfg5xk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IPpZBwRMbkG1hrPfdnOcabVKfBq9aOmy9U0hxbSGokCQcO0A8voh1JNXTo9Ui92e7
         +oAT/mkzC3IcamAvCYtXv0yTUIfBeDgEbC1MtOWfzRWSdLSQnaSLHdaV4FSCSe0TaZ
         MgWIkW/D5X8HBrSCyZyol0h6+jAai0ufW/Qz0HupiQKtpHtQhG8C2btGprgZi5lbFX
         XEETgsDVJW0AEOVdeeiRlES75/Q25qQBvRYyGWVWpeLAuCmv6YHGGG+PhdExIvkXaA
         j5UADPATWWUwZYM8aOmlJMFlGbHg83GJ9xvkYI1IpGGjzsIqtCCV8lEJLLkmdqBKb6
         dOtDrHnzD9i/g==
Date:   Wed, 22 Mar 2023 21:06:00 +0000
From:   Conor Dooley <conor@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Hal Feng <hal.feng@starfivetech.com>, kernel@esmil.dk,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Ben Dooks <ben.dooks@sifive.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 00/21] Basic clock, reset & device tree support for
 StarFive JH7110 RISC-V SoC
Message-ID: <a6358a5f-bbfd-4a14-a828-a3c28f82709a@spud>
References: <20230320103750.60295-1-hal.feng@starfivetech.com>
 <95f11f7c-611f-49a9-97e8-0de89846e430@spud>
 <62b766cef78d95793af95f428693c359.sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qDgrhF5nMeMRIFyO"
Content-Disposition: inline
In-Reply-To: <62b766cef78d95793af95f428693c359.sboyd@kernel.org>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--qDgrhF5nMeMRIFyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 21, 2023 at 04:57:52PM -0700, Stephen Boyd wrote:
> Quoting Conor Dooley (2023-03-21 16:03:54)
> >=20
> > If you're happy on the driver side of things, do you want to pick those
> > patches up on top of the bindings and send a PR to Stephen?
>=20
> This sounds fine to me. Let me know if you plan to send a PR with the
> starfive clk bits.

Since it was off-list:
Emil and I spoke about this briefly today at the weekly linux-riscv
meeting, the upshot of which is that it is likely to be me, rather than
him, sending you a PR as he's pretty busy at the moment.
That said, Emil mentioned that he has some doubts as to whether the
bindings are correct, and from taking a look - he's right, so there'll
likely not be a PR just yet! I'll go leave a comment about that...

I've got no real desire to maintain these drivers going forward though,
so perhaps Hal, or one of the other StarFive folks, can get themselves
set up to send them to you going forwards?

Cheers,
Conor.

--qDgrhF5nMeMRIFyO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBttuAAKCRB4tDGHoIJi
0ov6AQCours97BTI/h1YoGjIRSzsJumk9V2x34rQsvT3HtmqjwEAsc+9b9pMzD1r
LJ0vwnpZibKnjwdjkP9faV1TdgSO7Ac=
=SQwY
-----END PGP SIGNATURE-----

--qDgrhF5nMeMRIFyO--
