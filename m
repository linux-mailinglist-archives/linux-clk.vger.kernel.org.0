Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D09CD60E540
	for <lists+linux-clk@lfdr.de>; Wed, 26 Oct 2022 18:09:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234600AbiJZQJx (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 26 Oct 2022 12:09:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234649AbiJZQJt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Oct 2022 12:09:49 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B0682AC5B
        for <linux-clk@vger.kernel.org>; Wed, 26 Oct 2022 09:09:47 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id fy4so22646725ejc.5
        for <linux-clk@vger.kernel.org>; Wed, 26 Oct 2022 09:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v4TjJfHoFen8k91HvZEu2vMEr0hcvOdzlk4V3gwZmwo=;
        b=hnNrWvxMjwCLbbsqFBUQlHWS/cSpVem1riuEADioRpL8usOiencOo+gNqDDS46qkRU
         IIN5Axth1gM49TNoCnFOF0yW4lY6N60VOXIuk6DmidKtCZ0fQXLjADom0pQ68RWOAZMU
         XGDCAMVYf7oeqgzW+O3I1WjVo4Z/Uc8t+TS4NkEdTtN0Wvs6bFd/Jc9BIKT+hy7M1icf
         btAeXwmANbEC2ADqiER4P6sQMwy8vlrX19wdRo0+u4bVHGJtxUWdQhZPzWzvlrUGYvTA
         3L+rqLFTBaqrUhGgUmXo6NoE9JZedkJgCtkjIbSLezec9ZWcSJy1SpFpO5/EBeoNdXnB
         gkdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v4TjJfHoFen8k91HvZEu2vMEr0hcvOdzlk4V3gwZmwo=;
        b=rxWE5Q84A1K7NU/7GR1B4sTFL95q3QCiR5lppEmPntFb+R3dkELr35EFqyG0YvuQIm
         T2IzICgdfsuubRspE9xCt3mnUi0lXZ8ssqBbG1xWF6rnIZ1ED8pDGxElPJ9ViTbWN4Zu
         yecLiQlfxqW5GtBMKPTZsf+LpnMSqfOcGioKQE7and3EoRUnyAWE9XjgwEe6Mz93fvAN
         dT3REMU+HZoSqCgYa0LJZ/BKo2JxQg+sH4HqbT3d71+Te4abKo5hy0HunuwOenMQDkL8
         dRaiKytmQX0OJa43hnVNLDXIb+C576Te9ZCxjcxRuuZg9oz+O0ObN6r8IVOHs4CyDiC5
         0AOg==
X-Gm-Message-State: ACrzQf2Vb/xgOTVqCFkylk/imIYWWKI09oR9+AbpGf1QJo0GnYAMOHTC
        U4Ia1IA1crhxG67mlAZtQgm+hoSFUk7ZzyW9f7hWSw==
X-Google-Smtp-Source: AMsMyM5aJtEhnKAeLvrxz6KK33kFn+/f1RoIKweC5DbUEpqqf8knVV8v92IAI++i5aotttyiBb9K+2I05FUrrST4V04=
X-Received: by 2002:a17:907:3e11:b0:78d:9918:217f with SMTP id
 hp17-20020a1709073e1100b0078d9918217fmr37159234ejc.742.1666800586213; Wed, 26
 Oct 2022 09:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220815-rpi-fix-4k-60-v4-0-a1b40526df3e@cerno.tech> <20220815-rpi-fix-4k-60-v4-7-a1b40526df3e@cerno.tech>
In-Reply-To: <20220815-rpi-fix-4k-60-v4-7-a1b40526df3e@cerno.tech>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Wed, 26 Oct 2022 17:09:31 +0100
Message-ID: <CAPY8ntDvg4Ei-b=adWHi5A8BKamd53Q3FnoyOXvW5zeuYyLArg@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] drm/vc4: Make sure we don't end up with a core
 clock too high
To:     maxime@cerno.tech
Cc:     Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Ray Jui <rjui@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Dom Cobley <popcornmix@gmail.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 20 Oct 2022 at 10:14, <maxime@cerno.tech> wrote:
>
> Following the clock rate range improvements to the clock framework,
> trying to set a disjoint range on a clock will now result in an error.
>
> Thus, we can't set a minimum rate higher than the maximum reported by
> the firmware, or clk_set_min_rate() will fail.
>
> Thus we need to clamp the rate we are about to ask for to the maximum
> rate possible on that clock.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Thanks Maxime.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_kms.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
> index 4419e810103d..5c97642ed66a 100644
> --- a/drivers/gpu/drm/vc4/vc4_kms.c
> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> @@ -396,8 +396,8 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
>         if (vc4->is_vc5) {
>                 unsigned long state_rate = max(old_hvs_state->core_clock_rate,
>                                                new_hvs_state->core_clock_rate);
> -               unsigned long core_rate = max_t(unsigned long,
> -                                               500000000, state_rate);
> +               unsigned long core_rate = clamp_t(unsigned long, state_rate,
> +                                                 500000000, hvs->max_core_rate);
>
>                 drm_dbg(dev, "Raising the core clock at %lu Hz\n", core_rate);
>
> @@ -431,14 +431,17 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
>         drm_atomic_helper_cleanup_planes(dev, state);
>
>         if (vc4->is_vc5) {
> -               drm_dbg(dev, "Running the core clock at %lu Hz\n",
> -                       new_hvs_state->core_clock_rate);
> +               unsigned long core_rate = min_t(unsigned long,
> +                                               hvs->max_core_rate,
> +                                               new_hvs_state->core_clock_rate);
> +
> +               drm_dbg(dev, "Running the core clock at %lu Hz\n", core_rate);
>
>                 /*
>                  * Request a clock rate based on the current HVS
>                  * requirements.
>                  */
> -               WARN_ON(clk_set_min_rate(hvs->core_clk, new_hvs_state->core_clock_rate));
> +               WARN_ON(clk_set_min_rate(hvs->core_clk, core_rate));
>
>                 drm_dbg(dev, "Core clock actual rate: %lu Hz\n",
>                         clk_get_rate(hvs->core_clk));
>
> --
> b4 0.10.1
