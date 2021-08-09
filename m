Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C99F3E443F
	for <lists+linux-clk@lfdr.de>; Mon,  9 Aug 2021 12:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233738AbhHIKzw (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 9 Aug 2021 06:55:52 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:41050
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234409AbhHIKzw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Aug 2021 06:55:52 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 2407A3F355
        for <linux-clk@vger.kernel.org>; Mon,  9 Aug 2021 10:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628506531;
        bh=0/QQ7GCmzFb/lwnEgdDUeVfna7ZuR+UkebHo1Vz0Gqw=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=hviaMZc7abVW9mcR7OZWv9Npa/2iXnaI4ccJvxktbQeUZvASpMpaCjtbn/QWxtoxd
         t+4AF0Yr4Xozua5bMnUMGSpAK7PO8cIfK0tuIuVI8P7F630ZHVow3vvRIl4v0Qge6c
         SnMYB1QTW9msiKzlBpuWOEAy3gHuDK4ue/MbR/uqGCa55GYTQ/T9eXlRw9l9OuChhL
         8T8vZ28TvGACO3mnml3ZRcFnnJk92OM/TktT6t6DDzGjfUnEpDE8DgZKj+Ww9gZLTr
         a5ySrtAB4H8MpAIo5xaqPaKCblXhZLrgEkTBPNHVrd2g53u7epGMQ45VWQj3tPV0Ds
         FdVrt75sDHWRg==
Received: by mail-ed1-f69.google.com with SMTP id v11-20020a056402348bb02903be68e116adso804481edc.14
        for <linux-clk@vger.kernel.org>; Mon, 09 Aug 2021 03:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0/QQ7GCmzFb/lwnEgdDUeVfna7ZuR+UkebHo1Vz0Gqw=;
        b=B+IVmDRxu6qxme6EmP6S2LR+TnYrqjvZrEdWOUHAnXkTlDl5fpKUTwcidIgpUT/TmV
         Pp1GTcYogHqBaTbFcoq3CxO9J+9AcX2qwvuxNxbPIJVWIyYJxukqJKBCZVGejKoKw1YG
         ONIXA0TB8NsdP2x9ryUW5wcV69lhJuQPN7aWiCtJvHbsvAkHOTX7RcOCJYdCbTROzofy
         PPJX3KFFWk7WuNs0q3U2wjM1ZJNKmKGGUWNgXIvtxrq+0rRyVnOK7pJlW9NzVuInipZI
         pgm0nKKwgd6LtEMnifY+LYm/heNl8+D+/BJvFj6cx3fVp2NuWTGzTAm2g1TsXphnQwuq
         xYRg==
X-Gm-Message-State: AOAM532y1ornx6p17MDxYFIinAMZ86/8arRe7Gkxh+sCKXPgAII4Wbjy
        ZHmI3rdMJLJxECRcEM9/wpemKt5Ls8pPDYFv9OjgRwwPWMcc6U/HqzYT+m75ojUJ1aMf3GxmAf3
        xGZAt81IDVlnup3L/3KAGTFMoaL4Fwa6H5Eb8Og==
X-Received: by 2002:a17:906:1b54:: with SMTP id p20mr404466ejg.395.1628506530735;
        Mon, 09 Aug 2021 03:55:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUplgKeUyXmIIles2EuYZDpGS9skc6nxGXUAbVQyS+5moWpAWS0mJjpD2RuM252XF4XwBPcA==
X-Received: by 2002:a17:906:1b54:: with SMTP id p20mr404451ejg.395.1628506530585;
        Mon, 09 Aug 2021 03:55:30 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id b5sm5798891ejq.56.2021.08.09.03.55.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Aug 2021 03:55:29 -0700 (PDT)
Subject: Re: [PATCH v2 7/8] clk: samsung: Add Exynos850 clock driver stub
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Cc:     Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20210806152146.16107-1-semen.protsenko@linaro.org>
 <20210806152146.16107-8-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <7110b1e2-1aee-6ddf-803f-ee392e494f2d@canonical.com>
Date:   Mon, 9 Aug 2021 12:55:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806152146.16107-8-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 06/08/2021 17:21, Sam Protsenko wrote:
> For now it's just a stub driver to make the serial driver work. Later it
> will be implemented properly. This driver doesn't really change clocks,
> only registers the UART clock as a fixed-rate clock. Without this clock
> driver the UART driver won't work, as it's trying to obtain "uart" clock
> and fails if it's not able to.

You know that as temporary solution you can add necessary clocks
directly in your DTS as fixed-rate-clocks? Effect would be quite similar
to the one here for UART driver but instead adding some temporary code
you would add temporary DTS nodes and references.

I am fine with this approach although the binding (if ever defined...)
would need to be marked as experimental.

> 
> In order to get a functional serial console we have to implement that
> minimal clock driver with "uart" clock. It's not necessary to actually
> configure clocks, as those are already configured in bootloader, so
> kernel can rely on that for now.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
> Changes in v2:
>   - Used hard coded clock indexes, as clock bindings were removed; will
>     add clock bindings back (reimplemented) once proper clock driver is
>     ready
>   - Removed .data = 0 for exynos850-oscclk, as it's in BSS section
>   - Removed comma for terminator {}
>   - Made exynos850_clk_init() static
>   - Removed checking np for NULL, as it's already done in of_iomap()
> 
>  drivers/clk/samsung/Makefile        |  1 +
>  drivers/clk/samsung/clk-exynos850.c | 64 +++++++++++++++++++++++++++++
>  2 files changed, 65 insertions(+)
>  create mode 100644 drivers/clk/samsung/clk-exynos850.c
> 
> diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
> index 028b2e27a37e..c46cf11e4d0b 100644
> --- a/drivers/clk/samsung/Makefile
> +++ b/drivers/clk/samsung/Makefile
> @@ -17,6 +17,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos5433.o
>  obj-$(CONFIG_EXYNOS_AUDSS_CLK_CON) += clk-exynos-audss.o
>  obj-$(CONFIG_EXYNOS_CLKOUT)	+= clk-exynos-clkout.o
>  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos7.o
> +obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos850.o
>  obj-$(CONFIG_S3C2410_COMMON_CLK)+= clk-s3c2410.o
>  obj-$(CONFIG_S3C2410_COMMON_DCLK)+= clk-s3c2410-dclk.o
>  obj-$(CONFIG_S3C2412_COMMON_CLK)+= clk-s3c2412.o
> diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
> new file mode 100644
> index 000000000000..36c7c7fe7cf0
> --- /dev/null
> +++ b/drivers/clk/samsung/clk-exynos850.c
> @@ -0,0 +1,64 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2019 Samsung Electronics Co., Ltd.
> + * Copyright (C) 2021 Linaro Ltd.
> + *
> + * Common Clock Framework support for Exynos850 SoC.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clkdev.h>
> +#include <linux/clk-provider.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +
> +#include "clk.h"
> +
> +/* Will be extracted to bindings header once proper clk driver is implemented */
> +#define OSCCLK		1
> +#define DOUT_UART	2
> +#define CLK_NR_CLKS	3
> +
> +/* Fixed rate clocks generated outside the SoC */
> +static struct samsung_fixed_rate_clock exynos850_fixed_rate_ext_clks[] __initdata = {
> +	FRATE(OSCCLK, "fin_pll", NULL, 0, 26000000),
> +};
> +
> +/*
> + * Model the UART clock as a fixed-rate clock for now, to make serial driver
> + * work. This clock is already configured in the bootloader.
> + */
> +static const struct samsung_fixed_rate_clock exynos850_peri_clks[] __initconst = {
> +	FRATE(DOUT_UART, "DOUT_UART", NULL, 0, 200000000),
> +};
> +
> +static const struct of_device_id ext_clk_match[] __initconst = {
> +	{ .compatible = "samsung,exynos850-oscclk" },
> +	{}
> +};
> +
> +static void __init exynos850_clk_init(struct device_node *np)
> +{
> +	void __iomem *reg_base;
> +	struct samsung_clk_provider *ctx;
> +
> +	reg_base = of_iomap(np, 0);
> +	if (!reg_base)
> +		panic("%s: failed to map registers\n", __func__);
> +
> +	ctx = samsung_clk_init(np, reg_base, CLK_NR_CLKS);
> +	if (!ctx)
> +		panic("%s: unable to allocate ctx\n", __func__);

Not needed, the samsung_clk_init() panics or returns valid memory.

> +
> +	samsung_clk_of_register_fixed_ext(ctx,
> +			exynos850_fixed_rate_ext_clks,
> +			ARRAY_SIZE(exynos850_fixed_rate_ext_clks),
> +			ext_clk_match);
> +
> +	samsung_clk_register_fixed_rate(ctx, exynos850_peri_clks,
> +			ARRAY_SIZE(exynos850_peri_clks));
> +
> +	samsung_clk_of_add_provider(np, ctx);
> +}
> +
> +CLK_OF_DECLARE(exynos850_clk, "samsung,exynos850-clock", exynos850_clk_init);
> 

Best regards,
Krzysztof
