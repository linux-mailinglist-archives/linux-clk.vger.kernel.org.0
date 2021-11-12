Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46BD144E78B
	for <lists+linux-clk@lfdr.de>; Fri, 12 Nov 2021 14:40:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234909AbhKLNmw (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 12 Nov 2021 08:42:52 -0500
Received: from mail-ua1-f44.google.com ([209.85.222.44]:35706 "EHLO
        mail-ua1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233894AbhKLNmw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Nov 2021 08:42:52 -0500
Received: by mail-ua1-f44.google.com with SMTP id l24so14573686uak.2;
        Fri, 12 Nov 2021 05:40:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hd4mT8j/7UACpiBDtGHrwN1mhksetRGczTew0AK43BQ=;
        b=fQDIYFbDquNXJ0DPtEk1tVJMWEgUxz+VOM3HAu84EkVBbvYOBqKtc5BPslu0YX+v9P
         TcqnqP10hGWuHnA0vTLtlJpRmAjBjysN9wHQ96XTyb6ATgBQgbE4FzGI/SuCq+NeJoF1
         Nm40deoR29zPdgfjOMxHxgeZBwqCWk8g7KkJPrqC0VD7FNhrPU6tMMvNCz3hLgWZrE2q
         gsQp5YeRGVyWPjpVzddXNJKFavvQ52YDeWfCGS0Nqcp41hvkCZlN8nNwg9LnHThKhK4R
         5LH7PnIWtB3R6T9yobiBFl9IcC/UQ28NJxmr5Df3BiPS/Yrxn2sSue4z7sygAum9Zyp2
         50QQ==
X-Gm-Message-State: AOAM531FNHjPNnHIPforr1t2IvqNG60r775K6KtQG/5ubgX3p2QqbFwU
        xZ+zC0aOJjGBUzx1k63r5b2F8sLicDhJiQ==
X-Google-Smtp-Source: ABdhPJyMvg/qRUgaVqD+b1lKHF++ii+Uwc4wfm0fs75EQ+GL68cTYTnhnuIJStfoG513Ira5WRFQwg==
X-Received: by 2002:ab0:3c9f:: with SMTP id a31mr23166873uax.134.1636724400153;
        Fri, 12 Nov 2021 05:40:00 -0800 (PST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id g21sm4772253vkd.26.2021.11.12.05.39.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 05:39:59 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id a129so5098496vkb.8;
        Fri, 12 Nov 2021 05:39:59 -0800 (PST)
X-Received: by 2002:a05:6122:20ab:: with SMTP id i43mr23557923vkd.19.1636724399212;
 Fri, 12 Nov 2021 05:39:59 -0800 (PST)
MIME-Version: 1.0
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com> <20211110191610.5664-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211110191610.5664-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 14:39:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW7dZTFoZkuqCcxVfZf5iH-HFzd0mdPXckdhz8bEGzHGg@mail.gmail.com>
Message-ID: <CAMuHMdW7dZTFoZkuqCcxVfZf5iH-HFzd0mdPXckdhz8bEGzHGg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 02/21] clk: renesas: rcar-gen3: add SDnH clock
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

CC clk

On Wed, Nov 10, 2021 at 8:16 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Currently a pass-through clock but we will make it a real divider clock
> in the next patches.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Changes since RFC v1:
> * fixed subject prefix
> * fixed whitespace issues
> * added tag from Geert
>
>  drivers/clk/renesas/r8a774a1-cpg-mssr.c | 12 ++++++++----
>  drivers/clk/renesas/r8a774b1-cpg-mssr.c | 12 ++++++++----
>  drivers/clk/renesas/r8a774c0-cpg-mssr.c |  9 ++++++---
>  drivers/clk/renesas/r8a774e1-cpg-mssr.c | 12 ++++++++----
>  drivers/clk/renesas/r8a7795-cpg-mssr.c  | 12 ++++++++----
>  drivers/clk/renesas/r8a7796-cpg-mssr.c  | 12 ++++++++----
>  drivers/clk/renesas/r8a77965-cpg-mssr.c | 12 ++++++++----
>  drivers/clk/renesas/r8a77980-cpg-mssr.c |  3 ++-
>  drivers/clk/renesas/r8a77990-cpg-mssr.c |  9 ++++++---
>  drivers/clk/renesas/r8a77995-cpg-mssr.c |  3 ++-
>  10 files changed, 64 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/clk/renesas/r8a774a1-cpg-mssr.c b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
> index 39b185d8e957..804f3362763c 100644
> --- a/drivers/clk/renesas/r8a774a1-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
> @@ -100,10 +100,14 @@ static const struct cpg_core_clk r8a774a1_core_clks[] __initconst = {
>         DEF_FIXED("s3d2",       R8A774A1_CLK_S3D2,  CLK_S3,         2, 1),
>         DEF_FIXED("s3d4",       R8A774A1_CLK_S3D4,  CLK_S3,         4, 1),
>
> -       DEF_GEN3_SD("sd0",      R8A774A1_CLK_SD0,   CLK_SDSRC,     0x074),
> -       DEF_GEN3_SD("sd1",      R8A774A1_CLK_SD1,   CLK_SDSRC,     0x078),
> -       DEF_GEN3_SD("sd2",      R8A774A1_CLK_SD2,   CLK_SDSRC,     0x268),
> -       DEF_GEN3_SD("sd3",      R8A774A1_CLK_SD3,   CLK_SDSRC,     0x26c),
> +       DEF_GEN3_SDH("sd0h",    R8A774A1_CLK_SD0H,  CLK_SDSRC,        0x074),
> +       DEF_GEN3_SD( "sd0",     R8A774A1_CLK_SD0,   R8A774A1_CLK_SD0H, 0x074),
> +       DEF_GEN3_SDH("sd1h",    R8A774A1_CLK_SD1H,  CLK_SDSRC,        0x078),
> +       DEF_GEN3_SD( "sd1",     R8A774A1_CLK_SD1,   R8A774A1_CLK_SD1H, 0x078),
> +       DEF_GEN3_SDH("sd2h",    R8A774A1_CLK_SD2H,  CLK_SDSRC,        0x268),
> +       DEF_GEN3_SD( "sd2",     R8A774A1_CLK_SD2,   R8A774A1_CLK_SD2H, 0x268),
> +       DEF_GEN3_SDH("sd3h",    R8A774A1_CLK_SD3H,  CLK_SDSRC,        0x26c),
> +       DEF_GEN3_SD( "sd3",     R8A774A1_CLK_SD3,   R8A774A1_CLK_SD3H, 0x26c),
>
>         DEF_FIXED("cl",         R8A774A1_CLK_CL,    CLK_PLL1_DIV2, 48, 1),
>         DEF_FIXED("cp",         R8A774A1_CLK_CP,    CLK_EXTAL,      2, 1),
> diff --git a/drivers/clk/renesas/r8a774b1-cpg-mssr.c b/drivers/clk/renesas/r8a774b1-cpg-mssr.c
> index af602d83c8ce..97fe5d2227fe 100644
> --- a/drivers/clk/renesas/r8a774b1-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a774b1-cpg-mssr.c
> @@ -97,10 +97,14 @@ static const struct cpg_core_clk r8a774b1_core_clks[] __initconst = {
>         DEF_FIXED("s3d2",       R8A774B1_CLK_S3D2,  CLK_S3,         2, 1),
>         DEF_FIXED("s3d4",       R8A774B1_CLK_S3D4,  CLK_S3,         4, 1),
>
> -       DEF_GEN3_SD("sd0",      R8A774B1_CLK_SD0,   CLK_SDSRC,     0x074),
> -       DEF_GEN3_SD("sd1",      R8A774B1_CLK_SD1,   CLK_SDSRC,     0x078),
> -       DEF_GEN3_SD("sd2",      R8A774B1_CLK_SD2,   CLK_SDSRC,     0x268),
> -       DEF_GEN3_SD("sd3",      R8A774B1_CLK_SD3,   CLK_SDSRC,     0x26c),
> +       DEF_GEN3_SDH("sd0h",    R8A774B1_CLK_SD0H,  CLK_SDSRC,         0x074),
> +       DEF_GEN3_SD( "sd0",     R8A774B1_CLK_SD0,   R8A774B1_CLK_SD0H, 0x074),
> +       DEF_GEN3_SDH("sd1h",    R8A774B1_CLK_SD1H,  CLK_SDSRC,         0x078),
> +       DEF_GEN3_SD( "sd1",     R8A774B1_CLK_SD1,   R8A774B1_CLK_SD1H, 0x078),
> +       DEF_GEN3_SDH("sd2h",    R8A774B1_CLK_SD2H,  CLK_SDSRC,         0x268),
> +       DEF_GEN3_SD( "sd2",     R8A774B1_CLK_SD2,   R8A774B1_CLK_SD2H, 0x268),
> +       DEF_GEN3_SDH("sd3h",    R8A774B1_CLK_SD3H,  CLK_SDSRC,         0x26c),
> +       DEF_GEN3_SD( "sd3",     R8A774B1_CLK_SD3,   R8A774B1_CLK_SD3H, 0x26c),
>
>         DEF_FIXED("cl",         R8A774B1_CLK_CL,    CLK_PLL1_DIV2, 48, 1),
>         DEF_FIXED("cp",         R8A774B1_CLK_CP,    CLK_EXTAL,      2, 1),
> diff --git a/drivers/clk/renesas/r8a774c0-cpg-mssr.c b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
> index 5b938eb2df25..cef676c6b04e 100644
> --- a/drivers/clk/renesas/r8a774c0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
> @@ -108,9 +108,12 @@ static const struct cpg_core_clk r8a774c0_core_clks[] __initconst = {
>         DEF_FIXED("s3d2",      R8A774C0_CLK_S3D2,  CLK_S3,         2, 1),
>         DEF_FIXED("s3d4",      R8A774C0_CLK_S3D4,  CLK_S3,         4, 1),
>
> -       DEF_GEN3_SD("sd0",     R8A774C0_CLK_SD0,   CLK_SDSRC,     0x0074),
> -       DEF_GEN3_SD("sd1",     R8A774C0_CLK_SD1,   CLK_SDSRC,     0x0078),
> -       DEF_GEN3_SD("sd3",     R8A774C0_CLK_SD3,   CLK_SDSRC,     0x026c),
> +       DEF_GEN3_SDH("sd0h",   R8A774C0_CLK_SD0H, CLK_SDSRC,         0x0074),
> +       DEF_GEN3_SD( "sd0",    R8A774C0_CLK_SD0,  R8A774C0_CLK_SD0H, 0x0074),
> +       DEF_GEN3_SDH("sd1h",   R8A774C0_CLK_SD1H, CLK_SDSRC,         0x0078),
> +       DEF_GEN3_SD( "sd1",    R8A774C0_CLK_SD1,  R8A774C0_CLK_SD1H, 0x0078),
> +       DEF_GEN3_SDH("sd3h",   R8A774C0_CLK_SD3H, CLK_SDSRC,         0x026c),
> +       DEF_GEN3_SD( "sd3",    R8A774C0_CLK_SD3,  R8A774C0_CLK_SD3H, 0x026c),
>
>         DEF_FIXED("cl",        R8A774C0_CLK_CL,    CLK_PLL1,      48, 1),
>         DEF_FIXED("cp",        R8A774C0_CLK_CP,    CLK_EXTAL,      2, 1),
> diff --git a/drivers/clk/renesas/r8a774e1-cpg-mssr.c b/drivers/clk/renesas/r8a774e1-cpg-mssr.c
> index 40c71466df37..98beea6f4f6c 100644
> --- a/drivers/clk/renesas/r8a774e1-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a774e1-cpg-mssr.c
> @@ -100,10 +100,14 @@ static const struct cpg_core_clk r8a774e1_core_clks[] __initconst = {
>         DEF_FIXED("s3d2",       R8A774E1_CLK_S3D2,  CLK_S3,         2, 1),
>         DEF_FIXED("s3d4",       R8A774E1_CLK_S3D4,  CLK_S3,         4, 1),
>
> -       DEF_GEN3_SD("sd0",      R8A774E1_CLK_SD0,   CLK_SDSRC,     0x074),
> -       DEF_GEN3_SD("sd1",      R8A774E1_CLK_SD1,   CLK_SDSRC,     0x078),
> -       DEF_GEN3_SD("sd2",      R8A774E1_CLK_SD2,   CLK_SDSRC,     0x268),
> -       DEF_GEN3_SD("sd3",      R8A774E1_CLK_SD3,   CLK_SDSRC,     0x26c),
> +       DEF_GEN3_SDH("sd0h",    R8A774E1_CLK_SD0H,  CLK_SDSRC,         0x074),
> +       DEF_GEN3_SD( "sd0",     R8A774E1_CLK_SD0,   R8A774E1_CLK_SD0H, 0x074),
> +       DEF_GEN3_SDH("sd1h",    R8A774E1_CLK_SD1H,  CLK_SDSRC,         0x078),
> +       DEF_GEN3_SD( "sd1",     R8A774E1_CLK_SD1,   R8A774E1_CLK_SD1H, 0x078),
> +       DEF_GEN3_SDH("sd2h",    R8A774E1_CLK_SD2H,  CLK_SDSRC,         0x268),
> +       DEF_GEN3_SD( "sd2",     R8A774E1_CLK_SD2,   R8A774E1_CLK_SD2H, 0x268),
> +       DEF_GEN3_SDH("sd3h",    R8A774E1_CLK_SD3H,  CLK_SDSRC,         0x26c),
> +       DEF_GEN3_SD( "sd3",     R8A774E1_CLK_SD3,   R8A774E1_CLK_SD3H, 0x26c),
>
>         DEF_FIXED("cl",         R8A774E1_CLK_CL,    CLK_PLL1_DIV2, 48, 1),
>         DEF_FIXED("cr",         R8A774E1_CLK_CR,    CLK_PLL1_DIV4,  2, 1),
> diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> index c32d2c678046..9ca26057e809 100644
> --- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> @@ -104,10 +104,14 @@ static struct cpg_core_clk r8a7795_core_clks[] __initdata = {
>         DEF_FIXED("s3d2",       R8A7795_CLK_S3D2,  CLK_S3,         2, 1),
>         DEF_FIXED("s3d4",       R8A7795_CLK_S3D4,  CLK_S3,         4, 1),
>
> -       DEF_GEN3_SD("sd0",      R8A7795_CLK_SD0,   CLK_SDSRC,     0x074),
> -       DEF_GEN3_SD("sd1",      R8A7795_CLK_SD1,   CLK_SDSRC,     0x078),
> -       DEF_GEN3_SD("sd2",      R8A7795_CLK_SD2,   CLK_SDSRC,     0x268),
> -       DEF_GEN3_SD("sd3",      R8A7795_CLK_SD3,   CLK_SDSRC,     0x26c),
> +       DEF_GEN3_SDH("sd0h",    R8A7795_CLK_SD0H,  CLK_SDSRC,        0x074),
> +       DEF_GEN3_SD( "sd0",     R8A7795_CLK_SD0,   R8A7795_CLK_SD0H, 0x074),
> +       DEF_GEN3_SDH("sd1h",    R8A7795_CLK_SD1H,  CLK_SDSRC,        0x078),
> +       DEF_GEN3_SD( "sd1",     R8A7795_CLK_SD1,   R8A7795_CLK_SD1H, 0x078),
> +       DEF_GEN3_SDH("sd2h",    R8A7795_CLK_SD2H,  CLK_SDSRC,        0x268),
> +       DEF_GEN3_SD( "sd2",     R8A7795_CLK_SD2,   R8A7795_CLK_SD2H, 0x268),
> +       DEF_GEN3_SDH("sd3h",    R8A7795_CLK_SD3H,  CLK_SDSRC,        0x26c),
> +       DEF_GEN3_SD( "sd3",     R8A7795_CLK_SD3,   R8A7795_CLK_SD3H, 0x26c),
>
>         DEF_FIXED("cl",         R8A7795_CLK_CL,    CLK_PLL1_DIV2, 48, 1),
>         DEF_FIXED("cr",         R8A7795_CLK_CR,    CLK_PLL1_DIV4,  2, 1),
> diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
> index 41593c126faf..0dc0ba349a54 100644
> --- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
> @@ -106,10 +106,14 @@ static const struct cpg_core_clk r8a7796_core_clks[] __initconst = {
>         DEF_FIXED("s3d2",       R8A7796_CLK_S3D2,  CLK_S3,         2, 1),
>         DEF_FIXED("s3d4",       R8A7796_CLK_S3D4,  CLK_S3,         4, 1),
>
> -       DEF_GEN3_SD("sd0",      R8A7796_CLK_SD0,   CLK_SDSRC,     0x074),
> -       DEF_GEN3_SD("sd1",      R8A7796_CLK_SD1,   CLK_SDSRC,     0x078),
> -       DEF_GEN3_SD("sd2",      R8A7796_CLK_SD2,   CLK_SDSRC,     0x268),
> -       DEF_GEN3_SD("sd3",      R8A7796_CLK_SD3,   CLK_SDSRC,     0x26c),
> +       DEF_GEN3_SDH("sd0h",    R8A7796_CLK_SD0H,  CLK_SDSRC,        0x074),
> +       DEF_GEN3_SD( "sd0",     R8A7796_CLK_SD0,   R8A7796_CLK_SD0H, 0x074),
> +       DEF_GEN3_SDH("sd1h",    R8A7796_CLK_SD1H,  CLK_SDSRC,        0x078),
> +       DEF_GEN3_SD( "sd1",     R8A7796_CLK_SD1,   R8A7796_CLK_SD1H, 0x078),
> +       DEF_GEN3_SDH("sd2h",    R8A7796_CLK_SD2H,  CLK_SDSRC,        0x268),
> +       DEF_GEN3_SD( "sd2",     R8A7796_CLK_SD2,   R8A7796_CLK_SD2H, 0x268),
> +       DEF_GEN3_SDH("sd3h",    R8A7796_CLK_SD3H,  CLK_SDSRC,        0x26c),
> +       DEF_GEN3_SD( "sd3",     R8A7796_CLK_SD3,   R8A7796_CLK_SD3H, 0x26c),
>
>         DEF_FIXED("cl",         R8A7796_CLK_CL,    CLK_PLL1_DIV2, 48, 1),
>         DEF_FIXED("cr",         R8A7796_CLK_CR,    CLK_PLL1_DIV4,  2, 1),
> diff --git a/drivers/clk/renesas/r8a77965-cpg-mssr.c b/drivers/clk/renesas/r8a77965-cpg-mssr.c
> index bc1be8bcbbe4..d20a9a0fb3b8 100644
> --- a/drivers/clk/renesas/r8a77965-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a77965-cpg-mssr.c
> @@ -101,10 +101,14 @@ static const struct cpg_core_clk r8a77965_core_clks[] __initconst = {
>         DEF_FIXED("s3d2",       R8A77965_CLK_S3D2,      CLK_S3,         2, 1),
>         DEF_FIXED("s3d4",       R8A77965_CLK_S3D4,      CLK_S3,         4, 1),
>
> -       DEF_GEN3_SD("sd0",      R8A77965_CLK_SD0,       CLK_SDSRC,      0x074),
> -       DEF_GEN3_SD("sd1",      R8A77965_CLK_SD1,       CLK_SDSRC,      0x078),
> -       DEF_GEN3_SD("sd2",      R8A77965_CLK_SD2,       CLK_SDSRC,      0x268),
> -       DEF_GEN3_SD("sd3",      R8A77965_CLK_SD3,       CLK_SDSRC,      0x26c),
> +       DEF_GEN3_SDH("sd0h",    R8A77965_CLK_SD0H,      CLK_SDSRC,         0x074),
> +       DEF_GEN3_SD( "sd0",     R8A77965_CLK_SD0,       R8A77965_CLK_SD0H, 0x074),
> +       DEF_GEN3_SDH("sd1h",    R8A77965_CLK_SD1H,      CLK_SDSRC,         0x078),
> +       DEF_GEN3_SD( "sd1",     R8A77965_CLK_SD1,       R8A77965_CLK_SD1H, 0x078),
> +       DEF_GEN3_SDH("sd2h",    R8A77965_CLK_SD2H,      CLK_SDSRC,         0x268),
> +       DEF_GEN3_SD( "sd2",     R8A77965_CLK_SD2,       R8A77965_CLK_SD2H, 0x268),
> +       DEF_GEN3_SDH("sd3h",    R8A77965_CLK_SD3H,      CLK_SDSRC,         0x26c),
> +       DEF_GEN3_SD( "sd3",     R8A77965_CLK_SD3,       R8A77965_CLK_SD3H, 0x26c),
>
>         DEF_FIXED("cl",         R8A77965_CLK_CL,        CLK_PLL1_DIV2, 48, 1),
>         DEF_FIXED("cr",         R8A77965_CLK_CR,        CLK_PLL1_DIV4,  2, 1),
> diff --git a/drivers/clk/renesas/r8a77980-cpg-mssr.c b/drivers/clk/renesas/r8a77980-cpg-mssr.c
> index 9fe372286c1e..4ff2abad1de0 100644
> --- a/drivers/clk/renesas/r8a77980-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a77980-cpg-mssr.c
> @@ -96,7 +96,8 @@ static const struct cpg_core_clk r8a77980_core_clks[] __initconst = {
>         DEF_FIXED("s3d2",       R8A77980_CLK_S3D2,  CLK_S3,         2, 1),
>         DEF_FIXED("s3d4",       R8A77980_CLK_S3D4,  CLK_S3,         4, 1),
>
> -       DEF_GEN3_SD("sd0",      R8A77980_CLK_SD0,   CLK_SDSRC,    0x0074),
> +       DEF_GEN3_SDH("sd0h",    R8A77980_CLK_SD0H,  CLK_SDSRC,         0x0074),
> +       DEF_GEN3_SD( "sd0",     R8A77980_CLK_SD0,   R8A77980_CLK_SD0H, 0x0074),
>
>         DEF_FIXED("cl",         R8A77980_CLK_CL,    CLK_PLL1_DIV2, 48, 1),
>         DEF_FIXED("cp",         R8A77980_CLK_CP,    CLK_EXTAL,      2, 1),
> diff --git a/drivers/clk/renesas/r8a77990-cpg-mssr.c b/drivers/clk/renesas/r8a77990-cpg-mssr.c
> index a582f2ec3294..637c3f062fae 100644
> --- a/drivers/clk/renesas/r8a77990-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a77990-cpg-mssr.c
> @@ -100,9 +100,12 @@ static const struct cpg_core_clk r8a77990_core_clks[] __initconst = {
>         DEF_FIXED("s3d2",      R8A77990_CLK_S3D2,  CLK_S3,         2, 1),
>         DEF_FIXED("s3d4",      R8A77990_CLK_S3D4,  CLK_S3,         4, 1),
>
> -       DEF_GEN3_SD("sd0",     R8A77990_CLK_SD0,   CLK_SDSRC,     0x0074),
> -       DEF_GEN3_SD("sd1",     R8A77990_CLK_SD1,   CLK_SDSRC,     0x0078),
> -       DEF_GEN3_SD("sd3",     R8A77990_CLK_SD3,   CLK_SDSRC,     0x026c),
> +       DEF_GEN3_SDH("sd0h",   R8A77990_CLK_SD0H,  CLK_SDSRC,         0x0074),
> +       DEF_GEN3_SD( "sd0",    R8A77990_CLK_SD0,   R8A77990_CLK_SD0H, 0x0074),
> +       DEF_GEN3_SDH("sd1h",   R8A77990_CLK_SD1H,  CLK_SDSRC,         0x0078),
> +       DEF_GEN3_SD( "sd1",    R8A77990_CLK_SD1,   R8A77990_CLK_SD1H, 0x0078),
> +       DEF_GEN3_SDH("sd3h",   R8A77990_CLK_SD3H,  CLK_SDSRC,         0x026c),
> +       DEF_GEN3_SD( "sd3",    R8A77990_CLK_SD3,   R8A77990_CLK_SD3H, 0x026c),
>
>         DEF_FIXED("cl",        R8A77990_CLK_CL,    CLK_PLL1,      48, 1),
>         DEF_FIXED("cr",        R8A77990_CLK_CR,    CLK_PLL1D2,     2, 1),
> diff --git a/drivers/clk/renesas/r8a77995-cpg-mssr.c b/drivers/clk/renesas/r8a77995-cpg-mssr.c
> index 81c0bc1e78af..007f6fda1db4 100644
> --- a/drivers/clk/renesas/r8a77995-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a77995-cpg-mssr.c
> @@ -103,7 +103,8 @@ static const struct cpg_core_clk r8a77995_core_clks[] __initconst = {
>         DEF_GEN3_PE("s3d2c",   R8A77995_CLK_S3D2C, CLK_S3, 2, CLK_PE, 2),
>         DEF_GEN3_PE("s3d4c",   R8A77995_CLK_S3D4C, CLK_S3, 4, CLK_PE, 4),
>
> -       DEF_GEN3_SD("sd0",     R8A77995_CLK_SD0,   CLK_SDSRC,     0x268),
> +       DEF_GEN3_SDH("sd0h",   R8A77995_CLK_SD0H, CLK_SDSRC,         0x268),
> +       DEF_GEN3_SD( "sd0",    R8A77995_CLK_SD0,  R8A77995_CLK_SD0H, 0x268),
>
>         DEF_DIV6P1("canfd",    R8A77995_CLK_CANFD, CLK_PLL0D3,    0x244),
>         DEF_DIV6P1("mso",      R8A77995_CLK_MSO,   CLK_PLL1D2,    0x014),

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
