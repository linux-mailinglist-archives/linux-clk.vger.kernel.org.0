Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6234D22AC35
	for <lists+linux-clk@lfdr.de>; Thu, 23 Jul 2020 12:11:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727859AbgGWKKv (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 23 Jul 2020 06:10:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728252AbgGWKKu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Jul 2020 06:10:50 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3E39C0619E4
        for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2020 03:10:49 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id c7so1634643uap.0
        for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2020 03:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4yoJQz6lc93ZFuC1vSh5aTw5SRyF7ZD50XPwFhu/krQ=;
        b=XCKk9hOqO0p5OWBU7kP/quBONyMD7A9N/NDx4dZesyLHCwi2Ujzv1+piwUlOI64CyA
         NCUIU6xdnEDK0mKCCEPOLd7ehUPoq1Q0e2udZf/ZTrXxNOL0BQj5UnmvhPom8yiANGaV
         kAMRAdu4YzM9tt1D2WRPKTpGCbjNTwTWEdLkok9I2O2mk/Ytx30jI1Y+UwQNEaIxcAJM
         AZzWRLvS0J/nTOQc2co0+wkWhXLzjWZZ+NpgbgVZGFqcnbBpIecpenwYZMfmLjt7FSdP
         c8h3VGbqmmoWIL54h1rS/XqozcfJljW7oM6ODqpZ90nsm16tGf6C9t/912+nio0BWIBH
         PA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4yoJQz6lc93ZFuC1vSh5aTw5SRyF7ZD50XPwFhu/krQ=;
        b=AoQRzTL8mueA/6NeWwXTbsFQyny4Npu1+bGZHKq8+eJgwFE1B+7+LLksQUzpTb38/B
         VipXytZVo4KCEyrWvNTvg77mgwW6eja56QUfEM+6YWTAO/oMsDEbpTmFWnUQ/zkVIZr/
         NiEfgZWNQ49EBiWZMIfG4cPPwQqqabgDLLXMEDJw6tzEtP2iXN51SchlCK8KQBncfNsP
         qOmXJPUwxPUrBd/PoM1aQeFjbf5CrIAUS1udl5Lnq1Ztq9U6CTUQq+QaMFU977MzOa+5
         4TOOlWqjdCxFWIatgQ3EQEiDXhUhJHv+uxj/TV8MqcqTuyQT+wR2jIa5bnqlPW9AfogG
         QESw==
X-Gm-Message-State: AOAM530Rc13eg5dUd5PxWJ4p64qz7h+lJb8Zbqpf4Wqi6emwr/q980pH
        0ULhtDQ2+GNO3KO0gLOv9Wc3qc7PFoabO+PRre4apw==
X-Google-Smtp-Source: ABdhPJxxlPWeM9mTT10PFLdHevZKA9RcowuhyqKZiYf5pxjOTON0R9TbU9qezUZcD9P6HDAOYt8ORXwcxVMOt6xhnjU=
X-Received: by 2002:a9f:236c:: with SMTP id 99mr3553006uae.14.1595499048751;
 Thu, 23 Jul 2020 03:10:48 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvGXOcsF=70FVwOxqVYOeGTUuzhUzh5od1cKV1hshsW_g@mail.gmail.com>
 <CAK8P3a1ReCDR8REM7AWMisiEJ_D45pC8dXaoYFFVG3aZj91e7Q@mail.gmail.com> <159549159798.3847286.18202724980881020289@swboyd.mtv.corp.google.com>
In-Reply-To: <159549159798.3847286.18202724980881020289@swboyd.mtv.corp.google.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 23 Jul 2020 15:40:37 +0530
Message-ID: <CA+G9fYte5U-D7fqps2qJga_LSuGrb6t9Y1rOvPCPzz46BwchyA@mail.gmail.com>
Subject: Re: stable-rc 4.14: arm64: Internal error: Oops: clk_reparent
 __clk_set_parent_before on db410c
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        linux- stable <stable@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, lkft-triage@lists.linaro.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Clark <robdclark@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Eric Anholt <eric@anholt.net>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        samuel@sholland.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 23 Jul 2020 at 13:36, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Arnd Bergmann (2020-07-21 02:51:32)
> >                         __clk_set_parent_before(orphan, parent);
> >
> > None of the above have changed in stable kernels.
> >
> > > [    5.633668]  pll_28nm_register+0xa4/0x340 [msm]
> > > [    5.637492]  msm_dsi_pll_28nm_init+0xc8/0x1d8 [msm]
> > > [    5.642007]  msm_dsi_pll_init+0x34/0xe0 [msm]
> > > [    5.646870]  dsi_phy_driver_probe+0x1cc/0x310 [msm]
> >
> > The only changes to the dsi driver in v4.14-stable were:
> >
> > 89e30bb46074 drm/msm/dsi: save pll state before dsi host is powered off
> > 892afde0f4a1 drm: msm: Fix return type of dsi_mgr_connector_mode_valid for kCFI
> > 35ff594b0da2 drm/msm/dsi: Implement reset correctly
> > 5151a0c8d730 drm/msm/dsi: use correct enum in dsi_get_cmd_fmt
> > e6bc3a4b0c23 clk: divider: fix incorrect usage of container_of
> >
> > None of these look suspicious to me.
> >
>
> It sounds like maybe you need this patch?
>
> bdcf1dc25324 ("clk: Evict unregistered clks from parent caches")

Cherry-pick did not work on stable-rc 4.14
this patch might need backporting.
I am not sure.

>
> or
>
> 4368a1539c6b ("drm/msm: Depopulate platform on probe failure")

This commit already is in stable-rc 4.14 branch.
    drm/msm: Depopulate platform on probe failure

    [ Upstream commit 4368a1539c6b41ac3cddc06f5a5117952998804c ]

> I vaguelly recall that the display driver wasn't removing clks becaues
> it wasn't removing devices when probe defer happened and then we had
> dangling clks in the parent cache confusing things.

Thanks for your email.

- Naresh
