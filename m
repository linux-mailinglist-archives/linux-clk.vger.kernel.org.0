Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35888F5AC9
	for <lists+linux-clk@lfdr.de>; Fri,  8 Nov 2019 23:19:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730914AbfKHWSn (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 8 Nov 2019 17:18:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:44850 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726095AbfKHWSn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 8 Nov 2019 17:18:43 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2600820865;
        Fri,  8 Nov 2019 22:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573251523;
        bh=bU0RhP9Tukd8FTkIpTyvwRylYHLK6VBrDRHXYBub8Qw=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=ICcz5oBd6zOczoUqYAF5neJv9a+5ta0ghkw6r/JMbSBqdnolduccPls8wQueyWaIa
         YLDFBJo8Fr25pGpnk7tW8ZLvfuHp9lk2WpQ+becusbZOBgovoXjTHSmcD5LAtx/yLi
         0AsVd391R37syp3OPYwAs8e8q4F1SdpFLdx5BKOA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2819678.zAmqMVPImI@ada>
References: <20190823100315.2148-1-ada@thorsis.com> <20190911174948.sblu4qn44sfh3cyy@pengutronix.de> <20190916201316.ED7EB20665@mail.kernel.org> <2819678.zAmqMVPImI@ada>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Alexander Dahl <ada@thorsis.com>, linux-clk@vger.kernel.org
Cc:     u.kleine-koenig@pengutronix.de,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v2] dt-bindings: clk: Make example a bit clearer
User-Agent: alot/0.8.1
Date:   Fri, 08 Nov 2019 14:18:42 -0800
Message-Id: <20191108221843.2600820865@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Alexander Dahl (2019-10-10 07:16:00)
>=20
> > If anything, I would clarify the description of
> > the example by indicating what parts of the example we're talking about
> > when explaining, i.e.
> >=20
> >       In this example the <&pll 2> clock is set as parent of the
> >       <&clkcon 0> clock because the first clock specifier in the
> >       assigned-clocks property is <&clkcon 0> and that matches the
> >       first clock specifier in the assigned-clock-parents property.
> >       Similarly the <&pll 2> clock is assigned a frequency value of
> >       460800 Hz because the second frequency in the
> >       assigned-clock-rates property is 460800 Hz and that matches the
> >       second clock specifier in the assigned-clocks property <&pll 2>.
>=20
> I could go with that and send a v3 with the obfuscation from above (I'd l=
ike=20
> to keep that) and this paragraph of yours?
>=20

Sure. Please resend.

