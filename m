Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE7A94953C3
	for <lists+linux-clk@lfdr.de>; Thu, 20 Jan 2022 18:59:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233306AbiATR7H (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 20 Jan 2022 12:59:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233243AbiATR7G (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Jan 2022 12:59:06 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 806F5C06173F
        for <linux-clk@vger.kernel.org>; Thu, 20 Jan 2022 09:59:06 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id u18so17933578edt.6
        for <linux-clk@vger.kernel.org>; Thu, 20 Jan 2022 09:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RMYKnqjemjcb0E+AaBErJZMGI9+nxXGUgJ8R5RRJWKk=;
        b=NakAoe4Z4c2ZRLmoFhtPt4i4tY4Ud1UuxJtMNenkhTC0aWR393gCjZt8BmKRBsgpl0
         F5S/oxNMxTHg6QAFFhRg1+sqAncPkFxpXzY06ygtitcNst4BFBxrDmFuOyqdh8OONbjt
         lSbHCc3aVV6V9pT5VlLdSbJzF/4vp8d4vq5PK4lNzdmyr22vMv64EOMZ7ktx+e8sjs8m
         2wR2XIDFeBwANjO6Y8RY43n3eYnY7/yEO0YQ9WB2oaaatfeuxQnHmOygIipoDdrUWzSJ
         mmuKnzHSa5CHgXv7zAvGEHMqKLTf1OgA6Eipa4ZCEWbUAs3zbo2ETVK3j4BGDvJXf8Ko
         3LXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RMYKnqjemjcb0E+AaBErJZMGI9+nxXGUgJ8R5RRJWKk=;
        b=SFiyW0aAmiGUPAglfRK+hU+RkJpvxw0DaTDvubt4un4bXFF6L3BFynfQ+xJf7daqdI
         yWL9aWxvNDP/ow+jK/4MtUZ1LXWrXtVOhsa47xq4dYAsfN7qgJ56yaptnY4yyYfLGGwf
         g9zVRxtjVJViQXBL3OH75DKYSeAuqygJmecHR6vJBOSJHOAzyP78tpp44G9IzGn82mnT
         kqekeLMAJVU/3Nfcwvd9W+ILOT23LFxHbI8mkID8MsSQCuq6eUBv2g+AauKvL6v7acVN
         iQA5y4cpFnZyCRaInt+gU69alFLCoPN75BFO2DtnkCBIOcaRldpaVcSyVYx2eA7ZnfN2
         CZhg==
X-Gm-Message-State: AOAM5339paYkkLDnYHG8WNq16JXds4Jy8qXdZO0418XM+Bh/s0gCfe9f
        7/LGKWEcoE6g6D3RIlNkAEdowxxj4QSuaoGCfkr9iA==
X-Google-Smtp-Source: ABdhPJxzrAtZLQIcd/LaLUcalng7q7M0c3cu+ryhRb1xOlLviSKD+iyOmWOc0rzgnVHt2xY5446cTYuVkHo6QHuIwr4=
X-Received: by 2002:a05:6402:1693:: with SMTP id a19mr199339edv.247.1642701544770;
 Thu, 20 Jan 2022 09:59:04 -0800 (PST)
MIME-Version: 1.0
References: <20220120052303.2098394-1-sboyd@kernel.org> <CAGS_qxoMRsvx8HDex9Aq9KUALAQrdNe3VVYikyzT59TEYfbLdg@mail.gmail.com>
 <20220120175140.D8989C340E3@smtp.kernel.org>
In-Reply-To: <20220120175140.D8989C340E3@smtp.kernel.org>
From:   Daniel Latypov <dlatypov@google.com>
Date:   Thu, 20 Jan 2022 09:58:53 -0800
Message-ID: <CAGS_qxqUUnvSOs8ihGQJLVgZtUfKbjj7E_2RiMTQT4u=WmKCXw@mail.gmail.com>
Subject: Re: [PATCH v2] clk: gate: Add some kunit test suites
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Brendan Higgins <brendanhiggins@google.com>,
        kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jan 20, 2022 at 9:51 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Daniel Latypov (2022-01-19 22:26:50)
> >  On Wed, Jan 19, 2022 at 9:23 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > > +
> > > +static void clk_gate_test_exit(struct kunit *test)
> > > +{
> > > +       struct clk_gate_test_context *ctx = test->priv;
> > > +
> > > +       clk_hw_unregister_gate(ctx->hw);
> > > +       clk_hw_unregister_fixed_rate(ctx->parent);
> > > +       kfree(ctx);
> >
> > I think we forgot to drop some kfree's now that we're using
> > test->priv = ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
> >
> > This will result in duplicate kfree's.
>
> Good catch! I forgot that it was a managed allocation like that. Doesn't
> help that I had to go all the way to the kunit_kmalloc_array()
> kernel-doc to read that test managed means it is freed when the test is
> done.

Good point.
We should at least have kunit_kmalloc() doc comments make that clear.

>
> > > +
> > > +static void clk_gate_test_is_enabled(struct kunit *test)
> > > +{
> > > +       struct clk_hw *hw;
> > > +       struct clk_gate_test_context *ctx;
> > > +
> > > +       ctx = clk_gate_test_alloc_ctx(test);
> > > +       ctx->fake_reg = BIT(7);
> > > +       hw = clk_hw_register_gate(NULL, "test_gate", NULL, 0, ctx->fake_mem, 7,
> > > +                                 0, NULL);
> > > +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hw);
> > > +       KUNIT_ASSERT_TRUE(test, clk_hw_is_enabled(hw));
> > > +
> > > +       clk_hw_unregister_gate(hw);
> > > +       kfree(ctx);
> >
> > ditto
> >
> >
>
> Thanks! Next time can you trim your mails? It's quite long and I have to
> scroll down to find everything.

Thanks for the tip.
In the past I was wary of doing so since gmail can behave pretty
erratically when composing plain-text emails (it randomly jumps back
to the top at times, sometimes while typing???).
But I'll keep that in mind going forward. Hopefully having less text
will make gmail less buggy too...
