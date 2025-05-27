Return-Path: <linux-clk+bounces-22328-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B315BAC5ABB
	for <lists+linux-clk@lfdr.de>; Tue, 27 May 2025 21:32:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BB8B3B7934
	for <lists+linux-clk@lfdr.de>; Tue, 27 May 2025 19:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AC5328A1D0;
	Tue, 27 May 2025 19:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="V7jAMbPL"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D429B1B040B
	for <linux-clk@vger.kernel.org>; Tue, 27 May 2025 19:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748374353; cv=none; b=tr3ZkewAxnGMZWBdVP7ZMbjyoQtm8AVMXOc4idUC9/l2bEEVrhQ22cx0mUWAT4gFp4prDS9eztZUZOhTPnGQ2at6rCLQA0zE8bDgWtWvsZ79YhCFg5ZnULSH+UNLi0piMa7epXzDqpoCZjAJChlK0V88fDWBUQ+PhaibVQOqRog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748374353; c=relaxed/simple;
	bh=uzFA3ilBQ504lpBzuzMHiBkcD8tJcsjTFHHxhNpX7Dg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QnRyux+2k8yleWwoOdiwSOX4N1BLGDvp/p5UYJdgB6b2bK8Nei7kTD3NsWF9Ge7wrMU3nPVMEhkWWQZMj6mLBfNrL1XGqDXTxRpTf/rf5wCfbv4KHHZfcMDVIOWxJf2YsvgvYjw17lHeyZiH97j0gEES+1GqD8p9Y+K7WFRuXTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=V7jAMbPL; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-70dd2d35449so26846437b3.3
        for <linux-clk@vger.kernel.org>; Tue, 27 May 2025 12:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748374350; x=1748979150; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAMW61EAomfw/fUNyk8GW0NVdz9vS8vCzbD7XJ2g2mk=;
        b=V7jAMbPLHTUYE+G6aQubFXk6ZDcFzXRkLgbnbVg1n+GuqNUrKVGN7G0yhRA55+kZDS
         pWUfivBFJWCBZtyVgZYtrBFlvgiP6GXWdiLZN4pWbt1g+uZSfuHAKvZ2mz/WzHLVRNaF
         ifaJUXP2dKokwhVradYbYyZLVH8ykIR4GX3qI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748374350; x=1748979150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RAMW61EAomfw/fUNyk8GW0NVdz9vS8vCzbD7XJ2g2mk=;
        b=g7N0QZoqiU3uPHjHgobWU0suNDZgyvqmK0KqWBLW21CiN+s9Mmr8YpfcvzbpSWPiXL
         sixxhm3r15vSj/cuJVJk/yKZl8XhwfrVgf35eGg9u1rt7358VKxoC6lCBjpuwQhv05vx
         xo0s6+0SE5KwE4CF7CSYaP0AEEZSjGaKs3Lu/TJocnCQh8YVmSkPuiKd71E557KNoYck
         T7ByYRY62iQWxny+Cbih4Ggzl48MCJ//iqY+i8FKNanuG5oB2GeoJNL9W5tbapvRGeLu
         gM8ZFCfQqTSm8yhEAw5DrjSH8pfNYOYoYa/U58eHLooyS2Aixa/Uybuj0cXdqWdftN+x
         MSWg==
X-Forwarded-Encrypted: i=1; AJvYcCXOBID0OVIhFIKnDvGJ3qiq8zKtuJjxdM7KGGWFprEyBiU+ri5YBQywjap4Vv4X/IomKBTQYLTbdwU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcgDDBkN8U+y8fsi901dZKN2OdhzGdXaGSfUXw/on9WKAh1JnF
	iy+3iF4kLzSQwmeO5k0rDV/2vhFX4ZZ9NXqLlDynpSeCTyCjNKgmAJcgxw6KaC9jle2uMN5qjgh
	ruNMdLCdbkZ7OBC3lIQWMjXQK62Oi5IEbGdTUhV8KUQ==
X-Gm-Gg: ASbGncvrU7wfVmndem1vfu4NFbfVjjSJ/HeksxexXvtqw1JZuZiQpCgWkm+97oR8Ia/
	Q+xVXwkdz8KxBD+G/QkHdftefxJWSRbSdwCavqmEFWqzvcJYeD1d00gI/MyP7mB+5exKnJFws7X
	4y80iFE6MpMSRy7h6JbSR5Qe5j0mVYL7c=
X-Google-Smtp-Source: AGHT+IHpKdA2pbbNG4OrRbDcCpmkqycRDPThJP4yF+uhXUiU6y0MFBDvKQJkquESUTC+W3my9RdaR3/1y98M7NJ8QHE=
X-Received: by 2002:a05:690c:6083:b0:70e:2355:3fe0 with SMTP id
 00721157ae682-70e2d9daa58mr179805047b3.16.1748374349722; Tue, 27 May 2025
 12:32:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
 <174643143452.2950397.16722215892279685541.b4-ty@linaro.org>
 <CABGWkvq=pXhrzyCV2ABvQ3uwx4qKYL_G9280p5ECb8nsJ859yw@mail.gmail.com> <b2ed96a4-a236-4ea2-9e02-6896ff03caaa@kernel.org>
In-Reply-To: <b2ed96a4-a236-4ea2-9e02-6896ff03caaa@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 27 May 2025 21:32:18 +0200
X-Gm-Features: AX0GCFvlrZYhHqibbEv_6cXxIS8smjjQnIVNkeTDjWWzyIinppoBbEgrE74Khx0
Message-ID: <CABGWkvpu+quSY1y7u7eXOuiDLz8j2Sgs=sn=muZW80e-vNnHbg@mail.gmail.com>
Subject: Re: (subset) [PATCH v12 00/19] Support spread spectrum clocking for
 i.MX8M PLLs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	linux-amarula@amarulasolutions.com, Abel Vesa <abelvesa@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 8:42=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 23/05/2025 17:19, Dario Binacchi wrote:
> > Hello Abel,
> >
> > On Mon, May 5, 2025 at 9:52=E2=80=AFAM Abel Vesa <abel.vesa@linaro.org>=
 wrote:
> >>
> >>
> >> On Thu, 24 Apr 2025 08:21:30 +0200, Dario Binacchi wrote:
> >>> This version keeps the version v9 patches that can be merged and
> >>> removes the patches that will need to be modified in case Peng's
> >>> PR https://github.com/devicetree-org/dt-schema/pull/154 is accepted.
> >>> The idea is to speed up the merging of the patches in the series
> >>> that have already been reviewed and are not dependent on the
> >>> introduction of the assigned-clocks-sscs property, and postpone
> >>> the patches for spread spectrum to a future series once it becomes
> >>> clear what needs to be done.
> >>>
> >>> [...]
> >>
> >> Applied, thanks!
> >
> > I was surprised to see that the series has been removed from linux-next=
.
>
> Did you miss entire email thread explaining why? I think you never
> answered to several emails in this thread... and we - including myself -
> sent them a lot.

I don't think so:

The answers related to the errors encountered during DTC compilation:

https://lore.kernel.org/oe-kbuild-all/CABGWkvp7n=3DOr-OqnLoOJsQQCHF+=3D8eQ9=
EV5=3DO+Qp4sQF49_DbA@mail.gmail.com/
https://lore.kernel.org/all/CABGWkvqfyH=3Ddcuw6EDZaFVVebj8SZhJF0P944+mmzL5Y=
K3-Pug@mail.gmail.com/

The patch to fix the regression reported by Mark Brown:

https://lore.kernel.org/all/20250516134945.14692-1-dario.binacchi@amarulaso=
lutions.com/

Also successfully tested by him.

And when I didn=E2=80=99t reply, I was expecting the maintainers to handle =
it
=E2=80=94 as Peng Fan had requested in version 10:

https://lore.kernel.org/all/20250314093503.GD12210@nxa18884-linux/

I may have made some mistakes, but don't tell me I never replied.

After all, anyone can make mistakes:
https://lore.kernel.org/all/d421a6e8-e72c-48d9-8806-09724723b5d8@kernel.org=
/

Best regards,
Dario

>
> >
> > It=E2=80=99s been 8 months since the first version dated September 28, =
2024.
> > The most critical phase was version 3 -
> > https://lore.kernel.org/all/20241106090549.3684963-1-dario.binacchi@ama=
rulasolutions.com/
> > -
> > where two key issues emerged:
> >
> >  1 The CCM design is flawed because "in the current design, CCM is
> >    taken as the producer of CLK_IMX8M_VIDEO_PLL, not the consumer."
> >
> >  2 A driver for anatop needs to be implemented because "using clocks
> >    to replace fsl,ssc-clocks is possible under CCM mode, but you need
> >    to develop the fsl,imx8mm-anatop clock driver."
> >
> > These development guidelines, agreed upon with Krzysztof and Peng,
> > enabled a coherent implementation of both the DT bindings and the
> > code. The following versions, from v4 to v8, were necessary to
> > review and refine those implementations, bringing us to January 2025.
> >
> > At that point, Peng opened a separate pull request -
> > https://github.com/devicetree-org/dt-schema/pull/154 -
> > for the definition of general-purpose DT bindings for spread spectrum
> > handling, which ended up invalidating mine.
> >
> > While waiting for his pull request to be accepted, I submitted version =
9,
> > trying to at least get the patches for the anatop driver merged,
> > eventually reaching version 12.
> >
> > This final version was merged, but then a few days ago it was dropped.
>
> And explained why. There were bug reports which you completely ignored.
>
> >
> > As it stands now:
> >
> > - We still don=E2=80=99t have proper spread spectrum handling
> > - Peng=E2=80=99s pull request has been stalled since February 20
> > - We don=E2=80=99t have a driver for anatop
> > - The CCM design remains flawed
> > - Not even the first 4 patches of the series were merged =E2=80=94 thes=
e were
> >   simply a replication for i.MX8MM and i.MX8MP of patch
> >   bedcf9d1dcf88 ("clk: imx: rename video\_pll1 to video\_pll"), which
> >   was already merged some time ago.
> >
> > Could you please let me know if you're still interested in this series?
> > If so, could you suggest how to resolve the issues that led you to drop=
 it?
>
>
> You got several replies what is wrong. Can you respond to these instead
> of coming now surprised?
>
> Best regards,
> Krzysztof



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

