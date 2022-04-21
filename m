Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D313E50971E
	for <lists+linux-clk@lfdr.de>; Thu, 21 Apr 2022 08:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384633AbiDUGIN (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 21 Apr 2022 02:08:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358324AbiDUGIM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Apr 2022 02:08:12 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3CBC2194
        for <linux-clk@vger.kernel.org>; Wed, 20 Apr 2022 23:05:22 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-2ebf3746f87so41268967b3.6
        for <linux-clk@vger.kernel.org>; Wed, 20 Apr 2022 23:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gEbbg2zUxEbfOPOeQbHxD+QIKFZ02AhkGwLbMa0NQSM=;
        b=KLsAX0i9jDGFxcJ1StIniQy3cR6kMX25Hk/LgVmLefBQl/yALbKZ+rvMpxwfzZ9B9A
         wqulaM7y65JqbZWNrH23JjM7ZCVW9hCgBbLIm3x4Qo3l3uOrLKR7cBwrXzuzUhxDhpnc
         +AGPPjIGkT/talsWQY5pjnXm7wvtFWO4cssX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gEbbg2zUxEbfOPOeQbHxD+QIKFZ02AhkGwLbMa0NQSM=;
        b=dsLn0Wg+5BpGW5Y4rd+v2/1FKBrfCMl0XArRos2GvdBqlz/je/r2hYZHi/3VbhlYoU
         e+3BrwI5ATCwHyfmNgXW3kVS8BtxmO84daoQtO4xcsx3nmlz/NFFuTiy/tAlts7n+uZU
         RNYDK3Hl9QC/ZDZHgGD2jIVAKDVB1YB0JW8crK/iFJY0FUa5pQ2kVzmQXiqPUcMJuMbW
         rJIpzb3wYfXYaX472aTAaYcYdMGbvHTItLwk0uNvdg3VXw7lFFMB7D7bXna+4r2+5OfA
         /78hJSOUnAsJNbu/PkB3g8Cg4V6oBeC2L3jAHQW25OR3iRM9x45D1XuDmLaIdylBJyYb
         7U7w==
X-Gm-Message-State: AOAM532Mp4QmckJIqsms9F5SsD+f14hDs472VyikMSQIbBvKZ4FlGwZo
        mZW8WVNQxGsOXVGWqgofTTwhYFu+wd0CeFcDDPrAOA==
X-Google-Smtp-Source: ABdhPJzzdgkklWVlYeUDIN7ffgffId2uPhqM9WuJYRxVahXvUomxKUoe1jLZymEecsTdjNSGDTjwSXCB2zRhqiYXq+o=
X-Received: by 2002:a05:690c:110:b0:2ec:2d79:eee1 with SMTP id
 bd16-20020a05690c011000b002ec2d79eee1mr24722358ywb.21.1650521121784; Wed, 20
 Apr 2022 23:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220419081246.2546159-1-wenst@chromium.org> <3591fcc1-d34a-b40a-4e78-edcf9d2ddf08@collabora.com>
 <CAGXv+5HhcQbdGLQFtgPnvzVbSKaQ5GQGvmjwPVOVxjrYnMh1dg@mail.gmail.com> <ca8048f4-2e75-a49b-6c54-9f6abba6ead3@collabora.com>
In-Reply-To: <ca8048f4-2e75-a49b-6c54-9f6abba6ead3@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 21 Apr 2022 14:05:10 +0800
Message-ID: <CAGXv+5G2Uyq5fdMUnhr5wOm6O8M3dHNKGaSP2L_Vv1o28mXmOQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] clk: mediatek: Move to struct clk_hw provider APIs
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        Rex-BC Chen <rex-bc.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Apr 20, 2022 at 8:02 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 19/04/22 18:09, Chen-Yu Tsai ha scritto:
> > On Tue, Apr 19, 2022 at 11:08 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Il 19/04/22 10:12, Chen-Yu Tsai ha scritto:
> >>> Hi everyone,
> >>>
> >>> This is part 2 of my proposed MediaTek clk driver cleanup work [1].
> >>>
> >>
> >> ..snip..
> >>
> >>>
> >>> The next phase of the cleanup/improvement shall be to introduce some
> >>> variant of `struct clk_parent_data` to describe clk relationships
> >>> efficiently.
> >>>
> >>> Please have a look.
> >>>
> >>
> >> Hello Chen-Yu,
> >>
> >> I am grateful to see this series, as the MediaTek clock drivers are getting
> >> a bit old, despite new platforms being implemented practically as we speak.
> >>
> >> With this, you surely get that I completely agree with the proposed cleanup
> >> and modernization of the entire MediaTek clocks infrastructure, but I think
> >> that introducing a `struct clk_parent_data` for these drivers is, at this
> >> point, a must, that not only fully justifies these patches, but also "makes
> >> the point" - as the effect of that would be a performance improvement as we
> >> would *at least* avoid lots of clk_cpy_name() in case of parent_hws, or in
> >> case or parent_data where no .fw_name is provided (which would be the case
> >> for most of the clocks).

BTW, clk_cpy_name() handles const values correctly, i.e. it won't actually
copy them. The performance issue with using names is the clk core has to
match them against the ever increasing list of clks in the system to find
the actual clk object.

> > You and me both. :) And yes, one of the intended results is to make the
> > clk driver probe faster.
> >
> >> That said, my advice would be to add that conversion to declaring clocks
> >> with .hw.init.parent_data and/or .hw.init.parent_hws to this series as to
> >> really make it complete.
> >
> > This series itself already touches a lot of code, even if most of it was
> > done by coccinelle. I'd like to send them separately to not overwhelm
> > people.
> >
> > Also, I haven't actually started on that part yet. It is actually part 3
> > of my overall plan. I have a good idea of what to do, given I did similar
> > work for the sunxi-ng clk drivers (though half finished...).
>
> Having a good plan means that you're already half-done though :) :) :)
>
> Besides, the reason why I said that you should do the conversion in the same
> series was exactly because your changes are done with coccinelle scripts...
> ...but I thought that you already had something in the works for that.

The final part won't be doable with coccinelle scripts though. It involves
converting the existing list of clk parent names to IDs. It might be doable
in Perl or Python, but would likely involve a whole lot of string parsing
and pattern matching ...

> Since you still need some time for the final part, having this kind of (even
> if partial) modernization is still golden.
> Let's do it in two steps as you prefer then, that's fine for me.
>
> >
> > Most of the clk references are internal to each driver, and those would
> > be mapped from some CLK_ID to some `struct clk_hw *` internally, but all
> > blocks have external parents that need to be modeled as well, and we
> > would likely need global clk name fallbacks for the blocks that don't
> > have parents declared in the device tree, which is unfortunately most
> > of them. Especially the central clock controllers like infracfg or pericfg
> > take many clk inputs, to the point that MediaTek folks were somewhat
> > unwilling to bloat the device tree with them.
> >
> > So it does seem easier to use something like clk_parent_data with
> > `struct clk_hw *` replaced with an index everywhere. This structure
> > would get converted into clk_parent_data by the singular clk registration
> > helpers.
> >
>
> I may not be understanding what you mean by mapping the CLK_ID internally, but
> from what my brain processed, I think that you want to look at, and basically
> replicate, how it's done in the Qualcomm clock drivers (and perhaps standardize
> that in the clock API?).
>
> Specifically, clk/qcom/common.h, struct parent_map.
>
> Though, I admit I haven't looked at the MTK clocks *very deeply*, so I may be
> misunderstanding something.

Not exactly. All the clocks in the MTK drivers are allocated at runtime,
so we can't use clk_parent_data to point to not-yet-allocated clk_hw-s.
Instead we'll need to have

    struct mtk_clk_parent_data {
        unsigned int clk_id; /* Match CLK_XXX_YYY from dt-binding headers */
        ... /* remaining fields same as mtk_clk_parent_data */
    };

and create the actual clk_parent_data at runtime by looking up clk_id in
the set of already registered clks:

    int mtk_clk_register_XXX(..., struct mtk_clk_parent_data *pdata,
                             struct clk_hw_onecell_data *clk_data) {
        struct clk_parent_data data = {
            .hw = clk_data[pdata->clk_id],
            /* copy other fields verbatim */
        };
        ...
    }

Obviously this forces some ordering of how the clks are registered.
I believe the order is already correct, and if it isn't, it would be
easy to detect, and we can reorder things to fix it.

> > This would have to coexist with the existing helpers we have. So I think
> > this work would be combined with the helper API cleanup / alignment with
> > clk provider API.
> >
> > Does that make sense to you?
> >
>
> Yes that does fully make sense to me.
>
> >> Of course, if you have concerns about old platforms that you cannot test,
> >> or for which this kind of conversion would require a huge amount of effort,
> >> then I would go for converting as many as possible as a first step and then
> >> leave the others for later.
> >>
> >> I would envision MT8183, 8186, 8192, 8195 to be a good amount of first
> >> candidates for this great effort.
> >
> > I'm working with MT8183 right now, as it can readily boot mainline to a
> > shell. Depending on the schedule and whose on board with resources, I'd

* who's onboard *

> > probably handle the other ChromeOS platforms, or delegate it internally.
> >
> >
>
> That sounds like a plan. Besides, I wasn't trying to give you any hurry
> whatsoever - I was simply thinking out loud :))

Got it. :)


Regards
ChenYu
