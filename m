Return-Path: <linux-clk+bounces-29736-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9D4C00DB6
	for <lists+linux-clk@lfdr.de>; Thu, 23 Oct 2025 13:46:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3D8BD4F8078
	for <lists+linux-clk@lfdr.de>; Thu, 23 Oct 2025 11:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72AE63019A8;
	Thu, 23 Oct 2025 11:46:33 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4AF2EC0AB
	for <linux-clk@vger.kernel.org>; Thu, 23 Oct 2025 11:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761219993; cv=none; b=fjDzPr70Si0omNdxD5CeH84AkDGV3G7/a0JcoNnt3ElWVf/1wIUa0mDDEa/oiPh5s67DszmibKtXONUmDPvzc+mD4Zjtbu5BcLhm5kDSu9e/WlfIisH9KAPtyqja4hDptJqnUmNn4A2yCEV5stGTHaKdTzz5LGGD/91203hXSHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761219993; c=relaxed/simple;
	bh=t2b3ao92xy0ESrIeC6f3Ix11H+BajiEZp3Qjq0JyHMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rRfQtdDTH3xwQw2I6IEXVqA+Kfi6oerQyTguochiYkuHp5rLuHIucmF4K3fPnVqK8sgGIBZ7MRL4oq04jajLwY/ddR0ulmY/K0hqFo8z698OZ8vyUiL3LkAXtftXivH4Pr/h0FoNhmm1Gmb4AZE8agA14b5KE2AwGCLHiXTTziQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4e89183fe47so6581321cf.2
        for <linux-clk@vger.kernel.org>; Thu, 23 Oct 2025 04:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761219990; x=1761824790;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YGr3v7S6fzDOU9nQBXt6OSyvvunrcw7Wuu74VRCbNxc=;
        b=hcpDbOHHe4D9ShfXbl9xnVYu8AMtgtzH0kFSXVHPUfxmMPiQ+0DPVGLcyS03T4YibT
         eL4dlFkWdE5ZCFqGvJTUuNQaTGy4tSFklHDz/hxpBDJj0LY6DsEw/NOx/LvSHHHHzH+H
         egRzqaY631YTt9Jn0OAYXs3+FCJs8+2VyPE8DEuQSL6BBM0wXDOpWQ4KMeVFARkdgLmV
         IhANq52a8ZB8b7KC6jTlYLWDwDux40NhrevKw+pYiKjm7Kj7tMd8XbDlHjPaTpcYGThs
         f0d/CQ8++GmOsDcMK/uk4ypXJKHKTxl1ImUaPfM+rJ08o6FwFGfFKwQfuEkWFJ/HFTll
         ikdA==
X-Forwarded-Encrypted: i=1; AJvYcCUvpYqdb/J3uYz+TTkPSIKoiy09dBnRoP4lA3xFE2E9sxXcF5erYa2MGJ8a2Vplelp9XFNchqBuKIg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxG+SHPO3gVxhvLQlvULr7OWZbZepaSVYbZCi3N1BfzQeK1528Z
	/jrbEr/83GCmrOAuGBJDQ3TtNIg/Bh1AcQI4IM4lFSTjLmIFwbQ0cKvBPMo3MNpM
X-Gm-Gg: ASbGnctVLp5RMzWIJTLVEIMSyRDtKQTnTH4g97qAagRJrnApRJrx0Nub8/N96ffzxnM
	LuBcGkjHh4TJ7KFm5HPMODRwBKaaS60nfwEumrWrwrpf9e5VHDp1OR6Lq1xRM9ItVIBiUZNljsm
	YHHY/HNSYdwCX1rLPd3flYBOpBOpd8bQjPxz3WDvMEmRWfFZqdu/yEeyomfaMnBE3cYt9NnKCIx
	FVV8B1gHoBq59LoU8koZEIOqjkTr7l8oOw/dIcBa82euGZ4gLjPT/d3GIixZ7PufEod4zoR43cx
	ivQrzOrC6TFrtWDGCAW9ZXi9vIWdtDVGZj/YN+d6OXukLetzs+l/xfUi+vLQsMsONhCDPUVvlSg
	ObbiP3BnWCXZqiTsgCHqWwiJmuJyZX+em6hEv665WvaL3Py3pBLbp0tpOqkOB5kvvaNn33NalUu
	ubvBATUnqRaqxlh1w9OcOP+KZoBmkjfs4yxGIrGBXZKA==
X-Google-Smtp-Source: AGHT+IFqg6evg/XDZH8nJLRuX9fBt/6Mjmi72cw4rVSL4RY+2xz/4CksKXtrXF/1MGuY1RcXlZ2BBQ==
X-Received: by 2002:ac8:5754:0:b0:4e8:9140:f3cf with SMTP id d75a77b69052e-4e89d1fad24mr324332191cf.11.1761219990165;
        Thu, 23 Oct 2025 04:46:30 -0700 (PDT)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com. [209.85.222.179])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4eb805d0b89sm12776791cf.4.2025.10.23.04.46.29
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 04:46:29 -0700 (PDT)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-890deb84f95so67919185a.1
        for <linux-clk@vger.kernel.org>; Thu, 23 Oct 2025 04:46:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWwqJoCSDo146mWN+HsHsESlmGBr8tA9/5deBVdCUNUf830haeaH9X+u+A4O7O030eAUeR+gEY/3oU=@vger.kernel.org
X-Received: by 2002:a05:6102:c8b:b0:5db:350f:2c6b with SMTP id
 ada2fe7eead31-5db350f2f90mr173817137.38.1761219546544; Thu, 23 Oct 2025
 04:39:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1760696560.git.geert+renesas@glider.be> <67c1998f144b3a21399672c8e4d58d3884ae2b3c.1760696560.git.geert+renesas@glider.be>
 <aPKQMdyMO-vrb30X@yury> <CAMuHMdXq7xubX4a6SZWcC1HX+_TsKeQigDVQrWvA=js5bhaUiQ@mail.gmail.com>
 <aPhbhQEWAel4aD9t@yury> <CAMuHMdUOX=ToDU_44fHrqKWUtee1LKpgisfTKOe4R33er9g+DA@mail.gmail.com>
 <aPj9Tu75OFenm7U0@yury>
In-Reply-To: <aPj9Tu75OFenm7U0@yury>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Oct 2025 13:38:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX0dmJ_bEkKBZkzqXwM9m-Agwr_zMhMDXgdS+LSyoeG5w@mail.gmail.com>
X-Gm-Features: AWmQ_bkfy7WIJP3UTtd6EyoPnmrw_M6kCYJ9kC1xrPr1U7jSNAuuLhNrJ5p1ts4
Message-ID: <CAMuHMdX0dmJ_bEkKBZkzqXwM9m-Agwr_zMhMDXgdS+LSyoeG5w@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] bitfield: Add non-constant field_{prep,get}() helpers
To: Yury Norov <yury.norov@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Miller <davem@davemloft.net>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Jakub Kicinski <kuba@kernel.org>, Alex Elder <elder@ieee.org>, 
	David Laight <david.laight.linux@gmail.com>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Jason Baron <jbaron@akamai.com>, Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Kim Seer Paller <kimseer.paller@analog.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Cosmin Tanislav <demonsingur@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Jianping Shen <Jianping.Shen@de.bosch.com>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-edac@vger.kernel.org, qat-linux@intel.com, 
	linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-iio@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"

Hi Yury,

On Wed, 22 Oct 2025 at 17:50, Yury Norov <yury.norov@gmail.com> wrote:
> On Wed, Oct 22, 2025 at 12:01:37PM +0200, Geert Uytterhoeven wrote:
> > On Wed, 22 Oct 2025 at 06:20, Yury Norov <yury.norov@gmail.com> wrote:
> > > On Mon, Oct 20, 2025 at 03:00:24PM +0200, Geert Uytterhoeven wrote:
> > > > On Fri, 17 Oct 2025 at 20:51, Yury Norov <yury.norov@gmail.com> wrote:
> > > > > On Fri, Oct 17, 2025 at 12:54:10PM +0200, Geert Uytterhoeven wrote:
> > > > > > The existing FIELD_{GET,PREP}() macros are limited to compile-time
> > > > > > constants.  However, it is very common to prepare or extract bitfield
> > > > > > elements where the bitfield mask is not a compile-time constant.
> > > > > >
> > > > > > To avoid this limitation, the AT91 clock driver and several other
> > > > > > drivers already have their own non-const field_{prep,get}() macros.
> > > > > > Make them available for general use by consolidating them in
> > > > > > <linux/bitfield.h>, and improve them slightly:
> > > > > >   1. Avoid evaluating macro parameters more than once,
> > > > > >   2. Replace "ffs() - 1" by "__ffs()",
> > > > > >   3. Support 64-bit use on 32-bit architectures.
> > > > > >
> > > > > > This is deliberately not merged into the existing FIELD_{GET,PREP}()
> > > > > > macros, as people expressed the desire to keep stricter variants for
> > > > > > increased safety, or for performance critical paths.
> > > > > >
> > > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > > Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > > > > > Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > > > > > Acked-by: Crt Mori <cmo@melexis.com>
> > > > > > ---
> > > > > > v4:
> > > > > >   - Add Acked-by,
> > > > > >   - Rebase on top of commit 7c68005a46108ffa ("crypto: qat - relocate
> > > > > >     power management debugfs helper APIs") in v6.17-rc1,
> > > > > >   - Convert more recently introduced upstream copies:
> > > > > >       - drivers/edac/ie31200_edac.c
> > > > > >       - drivers/iio/dac/ad3530r.c
> > > > >
> > > > > Can you split out the part that actually introduces the new API?
> > > >
> > > > Unfortunately not, as that would cause build warnings/failures due
> > > > to conflicting redefinitions.
> > > > That is a reason why I want to apply this patch ASAP: new copies show
> > > > up all the time.
> > >
> > > In a preparation patch, for each driver:
> > >
> > >  +#ifndef field_prep
> > >  #define field_prep() ...
> > >  +#endif
> > >
> > > Or simply
> > >
> > >  +#undef field_prep
> > >  #define field_prep() ...
> > >
> > > Then add the generic field_prep() in a separate patch. Then you can drop
> > > ifdefery in the drivers.
> > >
> > > Yeah, more patches, but the result is cleaner.
> >
> > And we need 3 kernel releases, as the addition of the macros to
> > the header file now has a hard dependency on adding the #undefs?
> > Unless I still apply all of them to an immutable branch, but then what
> > is the point?
>
> Not sure what do you mean. You can do it in a single series, and you
> don't need and should not split the series across releases. Consider
> my recent cpumask_next_wrap() rework as an example:
>
> https://lore.kernel.org/all/20250128164646.4009-1-yury.norov@gmail.com/
>
> 1. #1-4 switch kernel users to alternative functions;
> 2. #5 deprecates cpumask_next_wrap(), making sure it's a pure renaming,
>    i.e. no-op.
> 3. #6 introduces the new nice implementation. It's the core-only patch,
>    no drivers are touched.
> 4. #7-12 switch the rest of codebase from old version to new.
> 5. #13 drops deprecated old function.
>
> This is the most common scheme. In you case you can cut the corners.
>
> The goals here are:
>
>  - keep core patches free of non-core code;
>  - switch drivers to the new functionality one-by-one in sake of
>    bisectability.

OK, I'll make it so...

> > > > > > --- a/include/linux/bitfield.h
> > > > > > +++ b/include/linux/bitfield.h
> > > > > > @@ -220,4 +220,40 @@ __MAKE_OP(64)
> > > > > >  #undef __MAKE_OP
> > > > > >  #undef ____MAKE_OP
> > > > > >
> > > > > > +/**
> > > > > > + * field_prep() - prepare a bitfield element
> > > > > > + * @mask: shifted mask defining the field's length and position
> > > > > > + * @val:  value to put in the field
> > > > > > + *
> > > > > > + * field_prep() masks and shifts up the value.  The result should be
> > > > > > + * combined with other fields of the bitfield using logical OR.
> > > > > > + * Unlike FIELD_PREP(), @mask is not limited to a compile-time constant.
> > > > > > + */
> > > > > > +#define field_prep(mask, val)                                                \
> > > > > > +     ({                                                              \
> > > > > > +             __auto_type __mask = (mask);                            \
> > > > > > +             typeof(mask) __val = (val);                             \
> > > > > > +             unsigned int __shift = sizeof(mask) <= 4 ?              \
> > > > > > +                                    __ffs(__mask) : __ffs64(__mask); \
> > > > > > +             (__val << __shift) & __mask;    \
> > > > >
> > > > > __ffs(0) is undef. The corresponding comment in
> > > > > include/asm-generic/bitops/__ffs.h explicitly says: "code should check
> > > > > against 0 first".
> > > >
> > > > An all zeroes mask is a bug in the code that calls field_{get,prep}().
> > >
> > > It's a bug in FIELD_GET() - for sure. Because it's enforced in
> > > __BF_FIELD_CHECK(). field_get() doesn't enforce it, doesn't even
> > > mention that in the comment.
> > >
> > > I'm not fully convinced that empty runtime mask should be a bug.
> >
> > Getting (and using) data from nowhere is a bug.

^^^ This is about field_get().

> > Storing data where there is no space to store is also a bug.

^^^ This is about field_prep().

> > I will add a comment.
> >
> > > Consider memcpy(dst, src, 0). This is a no-op, but not a bug as
> > > soon as the pointers are valid. If you _think_ it's a bug - please
> > > enforce it.
> >
> > memcpy() with a fixed size of zero is probably a bug.
> > memcpy() with a variable size is usually used to copy "as much as is
> > needed", so zero is usually not a bug.

^^^ These 3 lines are about memcpy().

> 5 lines above you say: "Getting (and using) data from nowhere is a bug".
> Now you're saying: "so zero is usually not a bug". So, is it a bug or
> not?

> > > > > I think mask = 0 is a sign of error here. Can you add a code catching
> > > > > it at compile time, and maybe at runtime too? Something like:
> > > > >
> > > > >  #define __field_prep(mask, val)
> > > > >  ({
> > > > >         unsigned __shift = sizeof(mask) <= 4 ? __ffs(mask) : __ffs64(mask);
> > > > >         (val << __shift) & mask;
> > > > >  })
> > > > >
> > > > >  #define field_prep(mask, val)
> > > > >  ({
> > > > >         unsigned int __shift;
> > > > >         __auto_type __mask = (mask), __ret = 0;
> > > > >         typeof(mask) __val = (val);
> > > > >
> > > > >         BUILD_BUG_ON_ZERO(const_true(mask == 0));
> > > >
> > > > Futile, as code with a constant mask should use FIELD_PREP() instead.
> > >
> > > It's a weak argument. Sometimes compiler is smart enough to realize
> > > that something is a constant, while people won't. Sometimes code gets
> > > refactored. Sometimes people build complex expressions that should
> > > work both in run-time and compile time cases. Sometimes variables are
> > > compile- or run-time depending on config (nr_cpu_ids is an example).
> > >
> > > The field_prep() must handle const case just as good as capitalized
> > > version does.
> >
> > OK, I will add the (build-time) check.
>
> If mask is compile-time, you can wire field_prep() to FIELD_PREP(), so
> it will do the work for you.

OK, I will look into it.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

