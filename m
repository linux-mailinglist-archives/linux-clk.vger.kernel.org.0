Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 395932B73DB
	for <lists+linux-clk@lfdr.de>; Wed, 18 Nov 2020 02:44:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725823AbgKRBnq (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 17 Nov 2020 20:43:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:35772 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725730AbgKRBnp (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 17 Nov 2020 20:43:45 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EDF03208CA;
        Wed, 18 Nov 2020 01:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605663825;
        bh=zHPIzA6woQLhko/nek4/h3LRFxzWj7+HlWrv3Ceoj8U=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=eJLlnhmSoi+zViSF3MTNVHOUTzsO8Dw3touzCC0Sv5mYcd9VrZRYi1MBr8mc6M87W
         hANK+Mf49EejnfFlRzW99s4v4kLWhBtZEhT96F9LKVE7glppvQVf2q8VNOPVzvqvu5
         3sDW+X9njEORLHP8eD7/v47Z5ft1UQPUlEWLlzD4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1j7dql1gi0.fsf@starbuckisacylon.baylibre.com>
References: <20200519170733.295100-1-jbrunet@baylibre.com> <160538776372.60232.7084881096431627810@swboyd.mtv.corp.google.com> <1j7dql1gi0.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [RFC PATCH] clk: rework clk_register to use the clk_hw API
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Tue, 17 Nov 2020 17:43:43 -0800
Message-ID: <160566382364.60232.10063773478634390252@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jerome Brunet (2020-11-16 07:13:59)
>=20
> On Sat 14 Nov 2020 at 22:02, Stephen Boyd <sboyd@kernel.org> wrote:
>=20
> > Quoting Jerome Brunet (2020-05-19 10:07:33)
> >> This rework the clk_register/unregister functions to use the clk_hw AP=
I.
> >> The goal is to pave the way for the removal of the 'clk' member in
> >> struct clk_hw.
> >>=20
> >> This member is used in about 60 drivers, most of them in drivers/clk/.
> >> Some cases will be trivial to remove but some drivers are hacking arou=
nd
> >> it and will be tougher to deal with.
> >>=20
> >> This change is sent as an RFC because, until there is a clear plan to =
deal
> >> with drivers above, there is memory penality when using clk_register()
> >> (struct clk is allocated in __clk_hw_register() and clk_register())
> >>=20
> >> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> >
> > Do you plan to resend this? I'm inclined to just apply it and we can
> > sort out the memory penalty problem later.
>=20
> I had forgot about it :)
> It does not apply so I'll fix this and resend

Cool. I forgot too, just found by searching your email :)

>=20
> Could you publish an immutable branch with the clk_hw_get_clk(),
> devm_clk_notifier and the meson stuff you have applied ?

Yeah no problem! It's clk-hw branch.

>=20
> > I'm not even sure what the
> > penalty is quite honestly. Drivers can call the clk_hw_get_clk() API you
> > introduced and generate clk pointer so we should be able to fully hide
> > the clk generated in clk_register() from them and not even allocate it?
>=20
> Eventually, it is the idea and there would no penality anymore.
> At the moment, a fair amount of "struct clk_hw" user rely on the ".clk"
> member being present, even if it is bad. All those need modification
> before we can kill the .clk member.
>=20
> I was thinking of a progressive approach:
> * Migrate clk_register()
> * Nicely ask user the direct users ".clk" to update
> * Once satisfied, remove ".clk"
>=20

Sounds good to me.
