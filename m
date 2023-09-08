Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20A2279842A
	for <lists+linux-clk@lfdr.de>; Fri,  8 Sep 2023 10:36:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233940AbjIHIgz (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 8 Sep 2023 04:36:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231751AbjIHIgz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Sep 2023 04:36:55 -0400
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 305C21BF0;
        Fri,  8 Sep 2023 01:36:51 -0700 (PDT)
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-5738949f62cso1096212eaf.0;
        Fri, 08 Sep 2023 01:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694162210; x=1694767010; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qYYciz9pZ17dkOkkZ5ISdXjWbpfXV9VdpwJOupV0UNE=;
        b=fHfLDOjxNE8uTmcAW1Wn5dO4YlCKBKFPUlgGVGZnfzT0ZTRAgqWcGn+JvU0elMvWa6
         hJy+DFfrBVAobUCrjIf68ZcaZJmFxKERXkU/trO4EmOAn8gxgo2YJtg90woX8WwPjSnL
         0uIBdmye4WUdNpMKk0Nv88FIjDS36InWmua8DTSptq90vjcNBCvgUEGJm49fjHSIthWD
         LA2qv5HYYVIUZPudHVc+2Y6Mj3p5bhtYs7RzaMSCEuextFyUjaarV2k99WuxGsGNCaj8
         FzqOpGo+ezMAcohaB1Jx3ZxKLsgoN6A0ncO4Q1J78tkVSKKDdn4qlOjGVOEjDt9+NDgD
         pZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694162210; x=1694767010;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qYYciz9pZ17dkOkkZ5ISdXjWbpfXV9VdpwJOupV0UNE=;
        b=Xn0Ug9ErhKIVk30UhwOqpxlRKvtl8wdKdEECVB5RO/puVm5BeyXCsy/EdmyPHlWJts
         DHGdIbNrKEpKMaRtTaHZVrD3z+QOdBIiE4LmEdik6stlsH3XEoMjt+o1M3lxYepkkd8c
         TZKPbYTfIKjXEVFhJzUk0REn3D36B8FECznNv5rH78KmQnpG+CQtZGtNUsCEAav1Ez7U
         6d7S6hPb5L2cEEnK2yPP+oko1PIeANPyInLI1tac7mBuTBhKJ0xmMRwGMHxgyHFunk27
         YuuRKgY8PZJpxSrJQ5H2nFTsPGWdZHtxuhV/sweZJnhdlczDZ2DWkfqAmRuuJrIrawJZ
         uguQ==
X-Gm-Message-State: AOJu0Ywhgq+qGrEh4Rp1qQAWvUmA9u6uSBErFSTMTVOhcJEzf758y/WR
        yClodXtNYBK0C8OzC9hWiO+ou+171oNUopyPAmVvQR1vxuZM1g==
X-Google-Smtp-Source: AGHT+IEyfD5ksednB3iPoUhqciAfR8pqlZIuiKwuNfktlOeW6c0+TO8AVgo7Nz4ewNE5nbT7fJSRn9cPmHwpV5W1TQo=
X-Received: by 2002:a4a:7550:0:b0:571:2ad1:35be with SMTP id
 g16-20020a4a7550000000b005712ad135bemr1799131oof.3.1694162210319; Fri, 08 Sep
 2023 01:36:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230822134849.3352329-1-alessandro.carminati@gmail.com>
 <CAPp5cGTshQJ3aLeLqv=CbaVeg9GnK_k9nsoaWrBKs1dcXzNZow@mail.gmail.com> <fc8023b435f78e02c96fecbe8e7599ee.sboyd@kernel.org>
In-Reply-To: <fc8023b435f78e02c96fecbe8e7599ee.sboyd@kernel.org>
From:   Alessandro Carminati <alessandro.carminati@gmail.com>
Date:   Fri, 8 Sep 2023 10:36:14 +0200
Message-ID: <CAPp5cGQ0Wp4my93tEm9-Huc6R+22zCj91mNJsPpGTFoo49=mcQ@mail.gmail.com>
Subject: Re: [PATCH] Sanitize possible_parent_show to Handle Return Value of of_clk_get_parent_name
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Philip Daly <pdaly@redhat.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Stephen,
Thank you for your review and the time you dedicated to it.

Il giorno ven 8 set 2023 alle ore 00:33 Stephen Boyd
<sboyd@kernel.org> ha scritto:
>
> Quoting Alessandro Carminati (2023-09-07 07:15:36)
> > this is a gentle ping
> >
>
> I couldn't read your email because it was sent to nobody
> (unlisted-recipients). Can you resend with a proper To: line?
>
> >
> > Il giorno mar 22 ago 2023 alle ore 15:49 Alessandro Carminati
> > <alessandro.carminati@gmail.com> ha scritto:
> > >
> > > In the possible_parent_show function, ensure proper handling of the return
> > > value from of_clk_get_parent_name to prevent potential issues arising from
> > > a NULL return.
> > > The current implementation invokes seq_puts directly on the result of
> > > of_clk_get_parent_name without verifying the return value, which can lead
> > > to kernel panic if the function returns NULL.
> > >
> > > This patch addresses the concern by introducing a check on the return
> > > value of of_clk_get_parent_name. If the return value is not NULL, the
>
> Use of_clk_get_parent_name() to signify that it is a function.
>
> > > function proceeds to call seq_puts, providing the returned value as
> > > argument.
> > > However, if of_clk_get_parent_name returns NULL, the function provides a
> > > static string as argument, avoiding the panic.
> > >
> > > Reported-by: Philip Daly <pdaly@redhat.com>
> > > Signed-off-by: Alessandro Carminati (Red Hat) <alessandro.carminati@gmail.com>
> > > ---
>
> It needs a Fixes tag.
Sure!
I need to be more careful on this.

>
> > >  drivers/clk/clk.c | 11 ++++++-----
> > >  1 file changed, 6 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > index c249f9791ae8..ab999644e185 100644
> > > --- a/drivers/clk/clk.c
> > > +++ b/drivers/clk/clk.c
> > > @@ -3416,6 +3416,7 @@ static void possible_parent_show(struct seq_file *s, struct clk_core *core,
> > >                                  unsigned int i, char terminator)
> > >  {
> > >         struct clk_core *parent;
> > > +       const char *tmp;
> > >
> > >         /*
> > >          * Go through the following options to fetch a parent's name.
> > > @@ -3436,12 +3437,12 @@ static void possible_parent_show(struct seq_file *s, struct clk_core *core,
> > >                 seq_puts(s, core->parents[i].name);
> > >         else if (core->parents[i].fw_name)
> > >                 seq_printf(s, "<%s>(fw)", core->parents[i].fw_name);
> > > -       else if (core->parents[i].index >= 0)
> > > -               seq_puts(s,
> > > -                        of_clk_get_parent_name(core->of_node,
> > > -                                               core->parents[i].index));
> > > -       else
> > > +       else if (core->parents[i].index >= 0) {
> > > +               tmp = of_clk_get_parent_name(core->of_node, core->parents[i].index);
> > > +               seq_puts(s, tmp ? tmp : "(none)");
>
> How about using seq_printf("%s", ...) instead? That should print out
> "(null)" in the case that it is NULL, instead of "(none)" and it is a
> one line change.

I did consider using seq_printf("%s", ...) as an alternative approach to
address the issue initially.
However, after a review of the file's history, I arrived at a different
conclusion.

The commit [1] that introduced this bug was primarily focused on replacing
seq_printf() with seq_putc().
I considered that to maintain code consistency and align with the intentions
of that commit, it may be more appropriate to continue using seq_putc() in
this particular instance.
I agree however with the idea of rolling back that particular change, but
in this case, we perhaps may want to consider also [2], a similar change made
in the same period.
I haven't proceeded with a patch submission for it[2], mainly due to the lack
of evidence of a kernel splash related to it and my uncertainty around the
fact that can exist use cases where the name field in the struct cgroup_subsys
can hit that code set to NULL.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/patch/?id=1ccc0ddf046a0197f2f9acca02a64da10aa6112d
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/patch/?id=85db0023376f529c477c6110043e069ccee16d9c
