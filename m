Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB192AD152
	for <lists+linux-clk@lfdr.de>; Tue, 10 Nov 2020 09:32:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgKJIb7 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 10 Nov 2020 03:31:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbgKJIb7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 Nov 2020 03:31:59 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69DC7C0613CF
        for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2020 00:31:57 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id k2so8313922wrx.2
        for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2020 00:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=YdVm+RMVBZ5c4fhXdJnD+KzbuIzyYWJgCSlyloNp+OI=;
        b=RFyaleQhVb65qbDmZcrSTOZ5slBNPYmCEBpdgvwmJ/M3KabTNr4qaWoERWqjG2HeEd
         XFpHH40WOTprdK5QWbezsAANlN4UR7rQuEQo9UenEO/LZ8NTl0lH+ph2nadErPJrb/nP
         EuaYdecjnonqKn9haqeObyYCY6BCxEWnVVNSkT/FFEwjSD3siJq03/uDmmER8+Cls9Gs
         zOpA3NlHbzAnYvsQ92jhEyG6vudEOab8LisXeyC/ijzwnaApOiB0e9E1boLEvQsRSBVe
         bKF39Il5QvJu+cw5gQH7KRiYU0DnKmZWVZkXKFxsehT0qbcrzwrUA9fJxUp7iT7EojWS
         F9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=YdVm+RMVBZ5c4fhXdJnD+KzbuIzyYWJgCSlyloNp+OI=;
        b=aZS9lPGfQNAYZOdymH9Oe6RlV59McAjGvkcJEbKu7V2fRkKbmt5/5NOevs9bFwuj6n
         xh3mz66QxzJdprg+UarvGuSRIvhQBa/9FI4phlS216XYxBKL3SvrjZFGGdNd90aganyD
         vjFFB8hhlAx6RbnonPn6rF/TrieSq/HmWHRr0nt3Z0gCnhkbPhcn3kx2aL3YvHOgQZXz
         i8Lp6tknrjthNOvZCpdUXkSdtPtP8OP+fAyGjD2pYysbzgaZctj+8oCrIIfh9w6O9UC4
         LDA6VTrwY5ygncIhoxHfsDoIgXCvLVTt/mLUrwMFEY6yv7UxKyDemd2ai46ev8shIBU5
         XCQA==
X-Gm-Message-State: AOAM532MVPwTri8Q5tRaCz3bby8OdG5IyebMY1MjspdxdLBhK1pPNtdL
        OKViUUHohQFLOBo6E1XxXv0DtA==
X-Google-Smtp-Source: ABdhPJxPbeiyv6TbH42tc7dPsPd2xHRWlzEkmWsDx7fYTf0GLfgf3f0Lney5HcmHGoXxtvsw1vzFNQ==
X-Received: by 2002:a5d:4883:: with SMTP id g3mr22646828wrq.19.1604997115869;
        Tue, 10 Nov 2020 00:31:55 -0800 (PST)
Received: from localhost (253.35.17.109.rev.sfr.net. [109.17.35.253])
        by smtp.gmail.com with ESMTPSA id m12sm15984083wrs.92.2020.11.10.00.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 00:31:55 -0800 (PST)
References: <20201109233622.23598-1-khilman@baylibre.com>
User-agent: mu4e 1.4.10; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org
Cc:     linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: meson: enable building as modules
In-reply-to: <20201109233622.23598-1-khilman@baylibre.com>
Message-ID: <1jft5hpq85.fsf@starbuckisacylon.baylibre.com>
Date:   Tue, 10 Nov 2020 09:31:54 +0100
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Tue 10 Nov 2020 at 00:36, Kevin Hilman <khilman@baylibre.com> wrote:

> Make it possible to build all clk drivers as modules, but default
> remains built-in.
>
> No functional changes.
>
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---
> Depends on series adding new API to get clk consumer from clk_hw:
> https://lore.kernel.org/linux-amlogic/20201021162147.563655-1-jbrunet@baylibre.com/

and

https://lore.kernel.org/r/20201021163847.595189-1-jbrunet@baylibre.com

Once these notifier allocations are dealt with, I'm happy to take this.

One minor details though ...

>
>  drivers/clk/meson/Kconfig       | 7 ++++---
>  drivers/clk/meson/axg-aoclk.c   | 5 ++++-
>  drivers/clk/meson/axg.c         | 5 ++++-
>  drivers/clk/meson/g12a-aoclk.c  | 5 ++++-
>  drivers/clk/meson/g12a.c        | 5 ++++-
>  drivers/clk/meson/gxbb-aoclk.c  | 5 ++++-
>  drivers/clk/meson/gxbb.c        | 5 ++++-
>  drivers/clk/meson/meson-aoclk.c | 4 ++++
>  drivers/clk/meson/meson-eeclk.c | 3 +++
>  9 files changed, 35 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index 034da203e8e0..fc002c155bc3 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -58,7 +58,7 @@ config COMMON_CLK_MESON8B
>  	  want peripherals and CPU frequency scaling to work.
>  
>  config COMMON_CLK_GXBB
> -	bool "GXBB and GXL SoC clock controllers support"
> +	tristate "GXBB and GXL SoC clock controllers support"
>  	depends on ARM64
>  	default y
>  	select COMMON_CLK_MESON_REGMAP
> @@ -74,7 +74,7 @@ config COMMON_CLK_GXBB
>  	  Say Y if you want peripherals and CPU frequency scaling to work.
>  
>  config COMMON_CLK_AXG
> -	bool "AXG SoC clock controllers support"
> +	tristate "AXG SoC clock controllers support"
>  	depends on ARM64
>  	default y
>  	select COMMON_CLK_MESON_REGMAP
> @@ -100,7 +100,7 @@ config COMMON_CLK_AXG_AUDIO
>  	  aka axg, Say Y if you want audio subsystem to work.
>  
>  config COMMON_CLK_G12A
> -	bool "G12 and SM1 SoC clock controllers support"
> +	tristate "G12 and SM1 SoC clock controllers support"
>  	depends on ARM64
>  	default y
>  	select COMMON_CLK_MESON_REGMAP
> @@ -110,6 +110,7 @@ config COMMON_CLK_G12A
>  	select COMMON_CLK_MESON_AO_CLKC
>  	select COMMON_CLK_MESON_EE_CLKC
>  	select COMMON_CLK_MESON_CPU_DYNDIV
> +	select COMMON_CLK_MESON_VID_PLL_DIV

This looks like a fix which could be sent separately with a fix tag,
doesn't it ?

>  	select MFD_SYSCON
>  	help
>  	  Support for the clock controller on Amlogic S905D2, S905X2 and S905Y2
> diff --git a/drivers/clk/meson/axg-aoclk.c b/drivers/clk/meson/axg-aoclk.c
> index b488b40c9d0e..af6db437bcd8 100644
> --- a/drivers/clk/meson/axg-aoclk.c
> +++ b/drivers/clk/meson/axg-aoclk.c
> @@ -12,6 +12,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/reset-controller.h>
>  #include <linux/mfd/syscon.h>
> +#include <linux/module.h>
>  #include "meson-aoclk.h"
>  #include "axg-aoclk.h"
>  
> @@ -326,6 +327,7 @@ static const struct of_device_id axg_aoclkc_match_table[] = {
>  	},
>  	{ }
>  };
> +MODULE_DEVICE_TABLE(of, axg_aoclkc_match_table);
>  
>  static struct platform_driver axg_aoclkc_driver = {
>  	.probe		= meson_aoclkc_probe,
> @@ -335,4 +337,5 @@ static struct platform_driver axg_aoclkc_driver = {
>  	},
>  };
>  
> -builtin_platform_driver(axg_aoclkc_driver);
> +module_platform_driver(axg_aoclkc_driver);
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
> index 13fc0006f63d..7ca7ea7345e5 100644
> --- a/drivers/clk/meson/axg.c
> +++ b/drivers/clk/meson/axg.c
> @@ -13,6 +13,7 @@
>  #include <linux/init.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
> +#include <linux/module.h>
>  
>  #include "clk-regmap.h"
>  #include "clk-pll.h"
> @@ -1354,6 +1355,7 @@ static const struct of_device_id clkc_match_table[] = {
>  	{ .compatible = "amlogic,axg-clkc", .data = &axg_clkc_data },
>  	{}
>  };
> +MODULE_DEVICE_TABLE(of, clkc_match_table);
>  
>  static struct platform_driver axg_driver = {
>  	.probe		= meson_eeclkc_probe,
> @@ -1363,4 +1365,5 @@ static struct platform_driver axg_driver = {
>  	},
>  };
>  
> -builtin_platform_driver(axg_driver);
> +module_platform_driver(axg_driver);
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/clk/meson/g12a-aoclk.c b/drivers/clk/meson/g12a-aoclk.c
> index 62499563e4f5..b52990e574d2 100644
> --- a/drivers/clk/meson/g12a-aoclk.c
> +++ b/drivers/clk/meson/g12a-aoclk.c
> @@ -12,6 +12,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/reset-controller.h>
>  #include <linux/mfd/syscon.h>
> +#include <linux/module.h>
>  #include "meson-aoclk.h"
>  #include "g12a-aoclk.h"
>  
> @@ -461,6 +462,7 @@ static const struct of_device_id g12a_aoclkc_match_table[] = {
>  	},
>  	{ }
>  };
> +MODULE_DEVICE_TABLE(of, g12a_aoclkc_match_table);
>  
>  static struct platform_driver g12a_aoclkc_driver = {
>  	.probe		= meson_aoclkc_probe,
> @@ -470,4 +472,5 @@ static struct platform_driver g12a_aoclkc_driver = {
>  	},
>  };
>  
> -builtin_platform_driver(g12a_aoclkc_driver);
> +module_platform_driver(g12a_aoclkc_driver);
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index b814d44917a5..66094bfec2cc 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -15,6 +15,7 @@
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/clk.h>
> +#include <linux/module.h>
>  
>  #include "clk-mpll.h"
>  #include "clk-pll.h"
> @@ -5370,6 +5371,7 @@ static const struct of_device_id clkc_match_table[] = {
>  	},
>  	{}
>  };
> +MODULE_DEVICE_TABLE(of, clkc_match_table);
>  
>  static struct platform_driver g12a_driver = {
>  	.probe		= meson_g12a_probe,
> @@ -5379,4 +5381,5 @@ static struct platform_driver g12a_driver = {
>  	},
>  };
>  
> -builtin_platform_driver(g12a_driver);
> +module_platform_driver(g12a_driver);
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/clk/meson/gxbb-aoclk.c b/drivers/clk/meson/gxbb-aoclk.c
> index e940861a396b..fce95cf89836 100644
> --- a/drivers/clk/meson/gxbb-aoclk.c
> +++ b/drivers/clk/meson/gxbb-aoclk.c
> @@ -5,6 +5,7 @@
>   */
>  #include <linux/platform_device.h>
>  #include <linux/mfd/syscon.h>
> +#include <linux/module.h>
>  #include "meson-aoclk.h"
>  #include "gxbb-aoclk.h"
>  
> @@ -287,6 +288,7 @@ static const struct of_device_id gxbb_aoclkc_match_table[] = {
>  	},
>  	{ }
>  };
> +MODULE_DEVICE_TABLE(of, gxbb_aoclkc_match_table);
>  
>  static struct platform_driver gxbb_aoclkc_driver = {
>  	.probe		= meson_aoclkc_probe,
> @@ -295,4 +297,5 @@ static struct platform_driver gxbb_aoclkc_driver = {
>  		.of_match_table = gxbb_aoclkc_match_table,
>  	},
>  };
> -builtin_platform_driver(gxbb_aoclkc_driver);
> +module_platform_driver(gxbb_aoclkc_driver);
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
> index 0a68af6eec3d..d6eed760327d 100644
> --- a/drivers/clk/meson/gxbb.c
> +++ b/drivers/clk/meson/gxbb.c
> @@ -8,6 +8,7 @@
>  #include <linux/init.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
> +#include <linux/module.h>
>  
>  #include "gxbb.h"
>  #include "clk-regmap.h"
> @@ -3519,6 +3520,7 @@ static const struct of_device_id clkc_match_table[] = {
>  	{ .compatible = "amlogic,gxl-clkc", .data = &gxl_clkc_data },
>  	{},
>  };
> +MODULE_DEVICE_TABLE(of, clkc_match_table);
>  
>  static struct platform_driver gxbb_driver = {
>  	.probe		= meson_eeclkc_probe,
> @@ -3528,4 +3530,5 @@ static struct platform_driver gxbb_driver = {
>  	},
>  };
>  
> -builtin_platform_driver(gxbb_driver);
> +module_platform_driver(gxbb_driver);
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/clk/meson/meson-aoclk.c b/drivers/clk/meson/meson-aoclk.c
> index bf8bea675d24..f0858fe789bc 100644
> --- a/drivers/clk/meson/meson-aoclk.c
> +++ b/drivers/clk/meson/meson-aoclk.c
> @@ -14,6 +14,8 @@
>  #include <linux/reset-controller.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/of_device.h>
> +#include <linux/module.h>
> +
>  #include <linux/slab.h>
>  #include "meson-aoclk.h"
>  
> @@ -84,3 +86,5 @@ int meson_aoclkc_probe(struct platform_device *pdev)
>  	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
>  		(void *) data->hw_data);
>  }
> +EXPORT_SYMBOL_GPL(meson_aoclkc_probe);
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/clk/meson/meson-eeclk.c b/drivers/clk/meson/meson-eeclk.c
> index a7cb1e7aedc4..8d5a5dab955a 100644
> --- a/drivers/clk/meson/meson-eeclk.c
> +++ b/drivers/clk/meson/meson-eeclk.c
> @@ -9,6 +9,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/regmap.h>
> +#include <linux/module.h>
>  
>  #include "clk-regmap.h"
>  #include "meson-eeclk.h"
> @@ -54,3 +55,5 @@ int meson_eeclkc_probe(struct platform_device *pdev)
>  	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
>  					   data->hw_onecell_data);
>  }
> +EXPORT_SYMBOL_GPL(meson_eeclkc_probe);
> +MODULE_LICENSE("GPL v2");

