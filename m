Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 580BF3B9A5B
	for <lists+linux-clk@lfdr.de>; Fri,  2 Jul 2021 03:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234547AbhGBBFS (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 1 Jul 2021 21:05:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:49598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234370AbhGBBFS (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 1 Jul 2021 21:05:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 56034613F7;
        Fri,  2 Jul 2021 01:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625187767;
        bh=CfWIpKKl303hREJ4X2i7un5cOC2KayhRK9260oHQV8A=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YjLchiU5GDhN+13sDWf/CKHa3aZ/tbC4/M6tx6AYgjipkBynVAQik51CBFKZqthtN
         b1cH19kUEHXu3lKoofZdjcdxxM+tOg6jAElNbvwzCw+mHTxbY96yFIRKnFewsaNkT8
         WYnUlM/gGj0V8q5+QKu1pgUjCD5SaeF4wvS/cS2jUU9Bje02wuLcAeySVQcAh/8NKb
         jwf1y8/nu9NUxivFGIUeonPBKDLYXupjs1l2gwVwQ2Ucgj+KWEXzFu0As/UF5Uxbp8
         iD+TnD2iOsnW1ZPKVoNe/GLj0piTJQ1snOUGqD3F8vvB5ycaGMIt7skWXf4FeMZXnN
         NkFFIRsfYtW8Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAFBinCC2KB-_pOenpWPknCuHV+CCjhP5hqukSkwD3qwRe6OtQw@mail.gmail.com>
References: <20210627223959.188139-1-martin.blumenstingl@googlemail.com> <20210627223959.188139-3-martin.blumenstingl@googlemail.com> <20210701202540.GA1085600@roeck-us.net> <CAFBinCC2KB-_pOenpWPknCuHV+CCjhP5hqukSkwD3qwRe6OtQw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] clk: divider: Switch from .round_rate to .determine_rate by default
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, linux-clk@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com,
        khilman@baylibre.com, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
To:     Guenter Roeck <linux@roeck-us.net>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Thu, 01 Jul 2021 18:02:46 -0700
Message-ID: <162518776607.3570193.14348711594242395887@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Martin Blumenstingl (2021-07-01 13:57:28)
> Hi Guenter,
>=20
> On Thu, Jul 1, 2021 at 10:25 PM Guenter Roeck <linux@roeck-us.net> wrote:
> [...]
> > [    0.000000] [<c07be330>] (clk_core_determine_round_nolock) from [<c0=
7c5480>] (clk_core_set_rate_nolock+0x184/0x294)
> > [    0.000000] [<c07c5480>] (clk_core_set_rate_nolock) from [<c07c55c0>=
] (clk_set_rate+0x30/0x64)
> > [    0.000000] [<c07c55c0>] (clk_set_rate) from [<c163c310>] (imx6ul_cl=
ocks_init+0x2798/0x2a44)
> > [    0.000000] [<c163c310>] (imx6ul_clocks_init) from [<c162a4e4>] (of_=
clk_init+0x180/0x26c)
> > [    0.000000] [<c162a4e4>] (of_clk_init) from [<c1604d34>] (time_init+=
0x20/0x30)
> > [    0.000000] [<c1604d34>] (time_init) from [<c1600e0c>] (start_kernel=
+0x4c8/0x6cc)
> > [    0.000000] [<c1600e0c>] (start_kernel) from [<00000000>] (0x0)
> > [    0.000000] Code: bad PC value
> > [    0.000000] ---[ end trace 7009a0f298fd39e9 ]---
> > [    0.000000] Kernel panic - not syncing: Attempted to kill the idle t=
ask!
> >
> > Bisct points to this patch as culprit. Reverting it fixes the problem.
> sorry for breaking imx6 - and at the same time: thanks for reporting this!
>=20
> Do you have some additional information about this crash (which clock
> this relates to, file and line number, etc.)?
> I am struggling to understand the cause of this NULL dereference
> My patch doesn't change the clk_core_determine_round_nolock()
> implementation and the new determine_rate code-path (inside that
> function) doesn't seem to be more fragile in terms of NULL values
> compared to the round_rate code-path.
> Instead I think it's more likely that the problem is somewhere within
> clk_divider_determine_rate() (or in any helper function it uses), but
> that doesn't show up in the trace

My guess is that we have drivers copying the clk_ops from the
divider_ops structure and so they are copying over round_rate but not
determine_rate.

>=20
> I don't have any imx6 board myself and so far I am unable to reproduce
> this crash on any hardware I have.
> However, if it's a problem in my clk-divider.c changes then I'd like
> to find the cause (ASAP) because possibly more SoCs may be broken...
>
