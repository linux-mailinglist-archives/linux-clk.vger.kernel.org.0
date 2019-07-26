Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B88787637E
	for <lists+linux-clk@lfdr.de>; Fri, 26 Jul 2019 12:28:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbfGZK2B (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 26 Jul 2019 06:28:01 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:37213 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbfGZK2B (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Jul 2019 06:28:01 -0400
Received: by mail-io1-f67.google.com with SMTP id q22so103700398iog.4
        for <linux-clk@vger.kernel.org>; Fri, 26 Jul 2019 03:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PzjlKYE1qIEe+zKWFnMwDGXGnYev6skKpACtw6FQfYA=;
        b=p+nKFgaFf1tHT5RNgpYZWcBsVVbiRzd9FTC6bAefOmIFtOJykeCT870R0C3ufGn4vc
         PWNSHa9kupTBucYBi70mlGlMiWsQwW88AcJuMNi5mjP54uMz6VZTDvOW5gQB50uT826R
         /3jc+gCyD43CXmaYBm+H1J6xVxPIKxZljbTPKqfSqimsMLP1H/7mnErn8M/dO8XfkwBs
         Y8w+IWSRvxAAfKb+sUeug4rr67gfH28OOcUOArjUBaDPMDvrVhBHZHe4UYjco91heF+s
         t/WQTFMrSsSh695Tzti0YJ2GBXe7DRanAgzk+m0sBiPGcJrsR60z20QSPaumVw4KZ0cp
         y5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PzjlKYE1qIEe+zKWFnMwDGXGnYev6skKpACtw6FQfYA=;
        b=U5wJazNTBPaUwkdNnhCBKnJmcFH9oI0q+VudpYaqLLuzMMp6zN5BgWnfmEEJ/Vrjfy
         cqmV7uyw4kAIPwdRm05+j1UWc3VeZ6wOURVYG1qLKMDs+eQ5N8+FaOzdS5byOe1/a85b
         6YEAKTXoHlvdhMVKyKnhKTUImQCOxxMJ6jikrtdtEreAyvja8n6Zr/ypV6H/CKelFwLX
         iM1LvnOU8i3ERbyeO5tRhZFJnwwlItfX4OTLxrddXyUekNj4jLK/zl6q0rG1CgYuP6id
         rlvYcr5tqcbSKLVrBYfT+D0iFl2DLUkJB2VWgxdaaU8O4XcgtYk2J0MS6zUZAAjzXrwL
         YksA==
X-Gm-Message-State: APjAAAXS/4OR5gFIp3mkLRDedcZxsGTVvxLhvo4QDxq0AQDcrqkaXBpY
        rr02VPmDpNEmeCmi70hk0X32a1hISYGQaZH9/ounBg==
X-Google-Smtp-Source: APXvYqxoHOdlu6x2hPEYf3RYGZ50mSWqUgxy2lpy/ibkVJblKXu8OocARgg+QmSbMwzq0EcY+IGZEkPKkyfBWG3maHg=
X-Received: by 2002:a5d:8e08:: with SMTP id e8mr7172969iod.139.1564136880220;
 Fri, 26 Jul 2019 03:28:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190722095425.14193-1-amergnat@baylibre.com> <20190722095425.14193-4-amergnat@baylibre.com>
 <1j5znqxj74.fsf@starbuckisacylon.baylibre.com> <CAGb2v64AJFMkZQaytYMN+EsLT0sS-3VwzWUfb3g7SdL7kCfu+g@mail.gmail.com>
In-Reply-To: <CAGb2v64AJFMkZQaytYMN+EsLT0sS-3VwzWUfb3g7SdL7kCfu+g@mail.gmail.com>
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Fri, 26 Jul 2019 12:27:48 +0200
Message-ID: <CAFGrd9pWdhktEjQzGTTk1zdVVXuXaZL--CFjA-BPwia6AzmRQA@mail.gmail.com>
Subject: Re: [PATCH 3/8] clk: meson: gxbb: migrate to the new parent
 description method
To:     Chen-Yu Tsai <wens@kernel.org>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        baylibre-upstreaming@groups.io,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Le jeu. 25 juil. 2019 =C3=A0 19:09, Chen-Yu Tsai <wens@kernel.org> a =C3=A9=
crit :
>
> On Thu, Jul 25, 2019 at 10:50 PM Jerome Brunet <jbrunet@baylibre.com> wro=
te:
> >
> > On Mon 22 Jul 2019 at 11:54, Alexandre Mergnat <amergnat@baylibre.com> =
wrote:
> >
> >
> > > @@ -1592,13 +1737,29 @@ static struct clk_regmap gxbb_vid_pll_div =3D=
 {
> > >       .hw.init =3D &(struct clk_init_data) {
> > >               .name =3D "vid_pll_div",
> > >               .ops =3D &meson_vid_pll_div_ro_ops,
> > > -             .parent_names =3D (const char *[]){ "hdmi_pll" },
> > > +             .parent_data =3D &(const struct clk_parent_data) {
> > > +                     /*
> > > +                      * This clock is declared here for GXL and GXBB=
 SoC, so
> > > +                      * we must use string name to set this parent t=
o avoid
> > > +                      * pointer issue.
> > > +                      */
> >
> > I don't really get the issue with this comment.
> >
> > How about:
> >
> > /*
> >  * Note:
> >  * gxl and gxbb have different hdmi_plls (with different struct clk_hw)=
.
> >  * We fallback to the global naming string mechanism so vid_pll_div pic=
ks
> >  * up the appropriate one.
> >  */
>
> If you're sticking to global names for now, you could just skip convertin=
g
> this clock altogether. I suspect .parent_names will be around for some ti=
me.

I prefer to perform a complete migration because it is possible that
.parent_names
becomes deprecated one day. I think it's cleaner to do it one shot and
avoid keeping
redundant structure with the new one.

>
> On the other hand, if you really want to get rid of global clock name bas=
ed
> parenting, you could use clk_hw pointers, and have the probe function fix
> up this one based on the compatible string. That's what I did.

Sounds good, may I have the commit or file which is implement this please?
I wonder if it worth to add complexity in probe instead of using a dedicate=
d
field in .parent_data for string name. I guess that depend on the complexit=
y
done in probe.

>
> Just my two cents.
>
> ChenYu
>
> > > +                     .name =3D "hdmi_pll",
> > > +                     .index =3D -1,
> > > +             },
> > >               .num_parents =3D 1,
> > >               .flags =3D CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
> > >       },
> > >  };
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
