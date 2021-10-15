Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E16642FDC6
	for <lists+linux-clk@lfdr.de>; Sat, 16 Oct 2021 00:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238768AbhJOWFm (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 15 Oct 2021 18:05:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:54970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235521AbhJOWFm (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 15 Oct 2021 18:05:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5D83761163;
        Fri, 15 Oct 2021 22:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634335415;
        bh=C+8ImSjOE4e/oErYg2vp5sosCuJhm/T5ZYTjwR9eR/w=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Vbyc5NQenlvVHhDUrIqPcPRWgRIhUFUxhg0gwOjbTIgtxUYq0QeuRXpLgVYOiRn7V
         gp/KDQlNeLPkNSHcO2dGvX99ltXzy11lWO99rMGAh2Ft28TTbI/7klAtfi3y3NxDJB
         p8uANg+Gz4XNDU2Vidawg+FIuVvPgYNxHsCuke6MFZHBdXxB2RcZR2fWAPRuA7RUae
         stOSwN15C2W3dcif8SbXjaKXKoZwhpMRpP58THRO9MiaOoAFpX+mID0+bpco3ImhVU
         Tn+cFvD/ool/xjMdtk/r4SnRd1oKeZAKPjD8PtgvlpO9PNF7bPd8xysIg8qeypCiiW
         eB6PuuGAHQ9Pw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMuHMdU1TCOvDwx6pjg=0-hLkFywRGQsZUNM+0aJLb96fZGAQA@mail.gmail.com>
References: <20210923064137.60722-1-zhang.lyra@gmail.com> <YV1XpL7ibF1y4LbV@google.com> <CAL_Jsq+eqqv=qtKOiNdEpYGi2amek_m+Q-Z9A769pXXqJ4R88A@mail.gmail.com> <YWVD0RXHVLxuXEIN@google.com> <CAMuHMdWqYVp1JyzZoidAJhPy9ypRnSOWHJLz5knDUMcFHPOzAw@mail.gmail.com> <YWfSz00Rj5AVhkgT@google.com> <CAL_Jsq+GHt+DqHa0GeLKWoni+Lghg5wg5ssREZBdSD-=K3XQ1A@mail.gmail.com> <163425256290.1688384.5646232860050218479@swboyd.mtv.corp.google.com> <CAL_JsqJV_CoPH7VrX-D5=u2WsoUpp-pTKbcR2y+gWxhv+WKcEg@mail.gmail.com> <CAMuHMdU1TCOvDwx6pjg=0-hLkFywRGQsZUNM+0aJLb96fZGAQA@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: mfd: sprd: Add bindings for ums512 global registers
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>, Baolin Wang <baolin.wang7@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        LKML <linux-kernel@vger.kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>
Date:   Fri, 15 Oct 2021 15:03:34 -0700
Message-ID: <163433541408.1688384.16269113818432626325@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Geert Uytterhoeven (2021-10-15 10:09:10)
> Hi Rob, Stephen,
>=20
> On Fri, Oct 15, 2021 at 3:59 PM Rob Herring <robh+dt@kernel.org> wrote:
> > On Thu, Oct 14, 2021 at 6:02 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > > Quoting Rob Herring (2021-10-14 09:18:16)
> > > > On Thu, Oct 14, 2021 at 1:48 AM Lee Jones <lee.jones@linaro.org> wr=
ote:
> > > > >
> > > > > I don't explicitly build DT documentation.
> > > > >
> > > > > Since I use the build bots to let me know if there are strange !(=
C,
> > > > > ASM, arm, aarch64, mips, ppc, x86) build issues or ones with odd
> > > > > configuration possibilities (randconfig) in the repos I maintain,=
 you
> > > > > might have to convince them that this is important too.
> > > >
> > > > It's really just a matter of turning on the build in
> > > > allyesconfig/allmodconfig builds. I've not done that primarily beca=
use
> > > > there's one person I don't want to yell at me, but I could probably
> > > > make it arm and/or arm64 only. It's really arch and config
> > > > independent, so doing it multiple times is kind of pointless.
> > > >
> > > > I assume for bots you mean kernel-ci mainly? Do you run that before
> > > > stuff gets into linux-next? IMO, that's too late. But still a slight
> > > > improvement if things go in via one tree. Otherwise, I see the
> > > > breakage twice, 1st linux-next then the merge window.
> > > >
> > >
> > > I run `make dt_binding_check DT_SCHEMA_FILES=3D"<path to yaml file>"`=
 but
> > > nowadays this seems to check all the bindings and not just the one
> > > binding I care to check. Did something break?
> >
> > It should apply all the schemas to the example in DT_SCHEMA_FILES.
> > Originally, it only applied DT_SCHEMA_FILES schema to the example in
> > DT_SCHEMA_FILES.
>=20
> Probably Stephen means that yamllint is still run on all files, which
> I tried to fix in [1]?
>=20
> I've been running an improved version for months, but I haven't sent
> it out yet.
>=20

Oh yeah probably. Do I need to carry this patch locally until it is
fixed?
