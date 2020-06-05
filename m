Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C661A1EFF74
	for <lists+linux-clk@lfdr.de>; Fri,  5 Jun 2020 19:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726693AbgFER5L (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 5 Jun 2020 13:57:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726245AbgFER5L (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 Jun 2020 13:57:11 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2F46C08C5C3
        for <linux-clk@vger.kernel.org>; Fri,  5 Jun 2020 10:57:10 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id b6so12853363ljj.1
        for <linux-clk@vger.kernel.org>; Fri, 05 Jun 2020 10:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anholt-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YYnGgbB/yUYHLwRnIgeOB2yfvVDg5PB29KwRpcC2gN4=;
        b=HWlIvo8Gx/GfSgNGX7LbvmwrB8R2/UprUCF6ZpGdTm5eFaUvsIhs/YyhRxIi6C0Bgu
         eKvjCs9vk7Z007hp+pg8+29RTakK0BG4LfZ6KfTBUENIJULV/m/bqBnWIrwsUs1JUM8/
         1/NGt2NwWfaMLuXqDXVe3Io4BwZBxhMbAeR1RevZ7FRe6WgNb1P0/6bzp39+eac5SSI0
         IJ2t/onuc/NeLjFksiSRP+9/3pOoJpsXpFqF1xvY2lFz/Ngtj3zgOT8AEn6f/pRSyZwx
         xSg9J8jx/18GSu+o8jK2uEzV4XTjjcqiZW53KhDmRBA/9Xatc7A9DzNlyF1ysAUOFHM0
         xEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YYnGgbB/yUYHLwRnIgeOB2yfvVDg5PB29KwRpcC2gN4=;
        b=IwBDIj1PR7voH8Y8CsVsYgi4bNARfJwvIiILAwDhReMFvZxg30d/ZFMvyXwZfG8gMq
         3FJbiDo/9Fo2C3xYM2NmQWrlWH3GjVeidIrtSBplJmbSrNsQ3HFwp8/XuExwRY5vj45T
         Jb5Vwy6R0Q1S/8aQX832SFP74j8R1oECxWT0g/BctwdfN+tKCj0lE3xpgcWw7CIkezYG
         7Dir6Zq+5xmTmfoJrw+Z87jnIgXkXF1O7YEF0QMj4MGpC+QAmf7uzcJSSTUCkszvJQk4
         5yYMaHSKbdJwvLHrl717nxCEWjVMFOeLV5zEiYRTQHS1sLrkzZtGAhBCpPCYqlIEQUgU
         RInA==
X-Gm-Message-State: AOAM531Q/mQS5bWenGEWrURnU352x2hvjYrixLPBsI97MYMUq4aJ3b9p
        665WCvpmDAatKKm6I6rSADZSO1I3JXg1XLshO/By4Q==
X-Google-Smtp-Source: ABdhPJz1QchXGicuq/e4UbyBXjj2+Lh2IaK3OLii9lagU/34toEvTJek1PSUAitdFBhMHfD0XxPR6jfp824v8PIIWqE=
X-Received: by 2002:a2e:8705:: with SMTP id m5mr5176522lji.269.1591379829143;
 Fri, 05 Jun 2020 10:57:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
 <6615a61b8af240e3d10f8890e4b2462ccdaac9b9.1590594512.git-series.maxime@cerno.tech>
In-Reply-To: <6615a61b8af240e3d10f8890e4b2462ccdaac9b9.1590594512.git-series.maxime@cerno.tech>
From:   Eric Anholt <eric@anholt.net>
Date:   Fri, 5 Jun 2020 10:56:58 -0700
Message-ID: <CADaigPUOJMwR0y6CjVpu5+nPAvejbCvEQNLEC+EKq9haBaQynw@mail.gmail.com>
Subject: Re: [PATCH v3 004/105] clk: bcm: Add BCM2711 DVP driver
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        linux-rpi-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        LKML <linux-kernel@vger.kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, May 27, 2020 at 8:49 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> The HDMI block has a block that controls clocks and reset signals to the
> HDMI0 and HDMI1 controllers.
>
> Let's expose that through a clock driver implementing a clock and reset
> provider.
>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/clk/bcm/Kconfig           |  11 +++-
>  drivers/clk/bcm/Makefile          |   1 +-
>  drivers/clk/bcm/clk-bcm2711-dvp.c | 127 +++++++++++++++++++++++++++++++-
>  3 files changed, 139 insertions(+)
>  create mode 100644 drivers/clk/bcm/clk-bcm2711-dvp.c
>
> diff --git a/drivers/clk/bcm/Kconfig b/drivers/clk/bcm/Kconfig
> index 8c83977a7dc4..784f12c72365 100644
> --- a/drivers/clk/bcm/Kconfig
> +++ b/drivers/clk/bcm/Kconfig
> @@ -1,4 +1,15 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +
> +config CLK_BCM2711_DVP
> +       tristate "Broadcom BCM2711 DVP support"
> +       depends on ARCH_BCM2835 ||COMPILE_TEST
> +       depends on COMMON_CLK
> +       default ARCH_BCM2835
> +       select RESET_SIMPLE
> +       help
> +         Enable common clock framework support for the Broadcom BCM2711
> +         DVP Controller.
> +
>  config CLK_BCM2835
>         bool "Broadcom BCM2835 clock support"
>         depends on ARCH_BCM2835 || ARCH_BRCMSTB || COMPILE_TEST
> diff --git a/drivers/clk/bcm/Makefile b/drivers/clk/bcm/Makefile
> index 0070ddf6cdd2..2c1349062147 100644
> --- a/drivers/clk/bcm/Makefile
> +++ b/drivers/clk/bcm/Makefile
> @@ -6,6 +6,7 @@ obj-$(CONFIG_CLK_BCM_KONA)      += clk-kona-setup.o
>  obj-$(CONFIG_CLK_BCM_KONA)     += clk-bcm281xx.o
>  obj-$(CONFIG_CLK_BCM_KONA)     += clk-bcm21664.o
>  obj-$(CONFIG_COMMON_CLK_IPROC) += clk-iproc-armpll.o clk-iproc-pll.o clk-iproc-asiu.o
> +obj-$(CONFIG_CLK_BCM2835)      += clk-bcm2711-dvp.o
>  obj-$(CONFIG_CLK_BCM2835)      += clk-bcm2835.o
>  obj-$(CONFIG_CLK_BCM2835)      += clk-bcm2835-aux.o
>  obj-$(CONFIG_CLK_RASPBERRYPI)  += clk-raspberrypi.o

I do think that single driver is the right model here, but I noticed
that you're not using your new CONFIG_ symbol.  With that fixed, r-b
from me.

(though I'd also recommend devm_platform_get_and_ioremap_resource and
devm_reset_controller_register())
