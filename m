Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07CE34958ED
	for <lists+linux-clk@lfdr.de>; Fri, 21 Jan 2022 05:34:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231241AbiAUEeL (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 20 Jan 2022 23:34:11 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:34116 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230192AbiAUEeK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Jan 2022 23:34:10 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C6337B81D84
        for <linux-clk@vger.kernel.org>; Fri, 21 Jan 2022 04:34:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C186C340E1;
        Fri, 21 Jan 2022 04:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642739648;
        bh=smguCCpDFjKrkhpoCN9F1T+vPwz8XFk3dC5dlOpzYE0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YH77BMEHg7zok8UWCXIPd8kdnV8ReEG+qHvt7YS4NQuquwFfaeA9Q+dKFSiFO/vb1
         YfCOqAxGzsERop0F8fhX8Cnmd4bIrl13087wch6xtz2lbiQezsIx/1xGRjXR3XeKpx
         rqJWDBZKKsUjfgSG3JSstS+qkOo7k7eT1JkKdgPOp+qs4ASH1uuWdjbvXFjppDA5MJ
         v1I4R0s7DvALzqmbHuy0WyYCIxYOqyT/kjfd1xTYsa954dIHEvAgvKw7+N52Lr1i2f
         i81JIRA3pFTQHQBvxd1phCU6sviO/H0kOoOHaV6l64V+1d+Qx9PPVlMCDOztGypgRx
         GgIOJCHkD4qTw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAGS_qxq9qFjx+Su_E5sQF5tsgPCyhzGMFEMZbVqPN=N6U+s+9g@mail.gmail.com>
References: <20220120143417.543744-1-maxime@cerno.tech> <20220120143417.543744-2-maxime@cerno.tech> <20220120213118.40F0AC340E3@smtp.kernel.org> <CAGS_qxq9qFjx+Su_E5sQF5tsgPCyhzGMFEMZbVqPN=N6U+s+9g@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] clk: Add Kunit tests for rate
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>, kunit-dev@googlegroups.com
To:     Daniel Latypov <dlatypov@google.com>
Date:   Thu, 20 Jan 2022 20:34:06 -0800
User-Agent: alot/0.10
Message-Id: <20220121043408.6C186C340E1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Daniel Latypov (2022-01-20 13:56:39)
> On Thu, Jan 20, 2022 at 1:31 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > I was thinking this would be more generic so that one file tests clk.c
> > and all the code in there, but I guess there may be config dependencies
> > like CONFIG_OF that we may want to extract out and depend on
> > differently. I'm not sure how kunit will handle testing different paths
> > depending on build configuration so this approach may head off future
> > problems. If it doesn't then we can always slam the test together.
>=20
> KUnit doesn't have hard technical limitations in this regard.
>=20
> You could have something like this
>=20
> static void my_optional_kunit_test(struct kunit *test)
> {
> #ifdef CONFIG_OPTIONAL_FEATURE
>=20
> # else
>   kunit_skip(test, "CONFIG_OPTIONAL_FEATURE is not enabled");
> #endif
> }
>=20
> I think it's just a matter of what's least confusing to users.

Ok, I see. Is there some way to have multiple configs checked into the
tree so we can test different kernel configuration code paths? This
discussion isn't really relevant to this patch so we can take this up in
another thread if you like.

>=20
> >
> > Maybe kunit should check that there was an EXPECT on return from the
> > test. Daniel?
>=20
> Sorry, I'm not sure I understand the question.
>=20
> Are you saying you want kunit to flag cases like
>   static void empty_test(struct kunit *) {}
> ?

Yes. I'd like kunit to enforce that all tests have at least one
EXPECT_*() in them.
