Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEB985F55EA
	for <lists+linux-clk@lfdr.de>; Wed,  5 Oct 2022 15:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbiJENzn (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 5 Oct 2022 09:55:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230190AbiJENzk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Oct 2022 09:55:40 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18EB866A48
        for <linux-clk@vger.kernel.org>; Wed,  5 Oct 2022 06:55:37 -0700 (PDT)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6154E41475
        for <linux-clk@vger.kernel.org>; Wed,  5 Oct 2022 13:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1664978135;
        bh=RXw6zATnsmcUdNJCBDtKAI7UAvNpEXVIHqhEL/cDEW4=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=Ya9Bxn9LDCiSFgrHNGbAFpRMRMKfLV0ORX48trzqvWSVaaSbgDHx6ZVPP5hyAkG9o
         TbeCOpDhEnjWKQvZpH+SR8b3hFRblQccyQ4EousekgnqrXi42ZJYi/Sl8feS3IKyBR
         KgvbvYcxuDhwJgtXPKLvE7+fhB/MUOyQ99ErZY4WCTbiLkBDXP3L2F8V5Hxq60ZALS
         6eTyvpY5SdeqQ58GvLUDuyhTz3k6LdUoaCIdOb3YGDPQRmXn/2aNgKVhuTtAT5xVpX
         dRSTV9Wl7hhyTa5g0DH8lX40224hZMI5JyE+Qzp3wypmYR4ghpOsP3ZdYzS2xeNh2r
         uAGAyErI2pLyA==
Received: by mail-qt1-f197.google.com with SMTP id j25-20020ac84c99000000b0035bb13ed4ffso11469500qtv.23
        for <linux-clk@vger.kernel.org>; Wed, 05 Oct 2022 06:55:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=RXw6zATnsmcUdNJCBDtKAI7UAvNpEXVIHqhEL/cDEW4=;
        b=7N1+JSYIw1zrkipCgVWfYk5ZiH0VPzyLQeOdcbScaSllOssEjkO7I5t74ZZ68FPuBD
         i8Sd/67vZRUeZHqV+IlxUvfiGqsb4O9Qkq3AQ/hWsj104DG7upmfhPrp6ngvSOkd4xt9
         We5j9l/Faaw8AJDbKbgo2dkH+NskvMqek2vswLelLoiF0zXsRNV60XRE4Mo0rjse1Zy5
         Ffx4voZjP3WAJHofY46PUKXECAxAtS/m8GXuFWnPW0G0abhqhRfFoDgEvTzCUcvZwKWW
         AVcQupRN2VY8QstHLRyIoumVEMTd55v+QeM5e2EH+7iV/u7dDTBrTFkUfL9TkFI87+Wd
         YrRQ==
X-Gm-Message-State: ACrzQf3R4Ke4OEr0gTi1+dff0BnqRfBgYOriPcurYDT0uP7k8m/EDgtA
        0ZouuZ3gf9NoGaNVXzRMcW1t5J9/mI6faKpJyuXt5r3D8FtVTBoCpTQMEWbtGbpXckGkNwN+DqZ
        tTccLA2Y8hVUb4LoEZjfkvt+gM0xh8gu0MNXRi8pTaYhnTVZrTb6Lww==
X-Received: by 2002:a05:622a:11cc:b0:35c:d955:db23 with SMTP id n12-20020a05622a11cc00b0035cd955db23mr23696234qtk.660.1664978133984;
        Wed, 05 Oct 2022 06:55:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4AMRhiASSdjoJDMzze8anpdlYznAQPZHod0z9/OA6HkFac/FCjPjxB5wWNIURWOMqw/azAM+ZLbmWEUA6xyFQ=
X-Received: by 2002:a05:622a:11cc:b0:35c:d955:db23 with SMTP id
 n12-20020a05622a11cc00b0035cd955db23mr23696207qtk.660.1664978133742; Wed, 05
 Oct 2022 06:55:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
 <20220929143225.17907-6-hal.feng@linux.starfivetech.com> <40d0abb6-88dc-d315-f768-27a623f60986@sifive.com>
 <CAJM55Z-PzvM_-_6jTWX+Jyy2FQ3TJdh4uYj0evpktnEENHL6WA@mail.gmail.com> <4d8a199b-f22a-a421-aae4-64e538cb97f4@codethink.co.uk>
In-Reply-To: <4d8a199b-f22a-a421-aae4-64e538cb97f4@codethink.co.uk>
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date:   Wed, 5 Oct 2022 15:55:17 +0200
Message-ID: <CAJM55Z8QN1CeknrP9nyh9ei4EFQT_VKfTTi6uH5ssE3rqW5OdA@mail.gmail.com>
Subject: Re: [PATCH v1 05/30] soc: sifive: l2 cache: Convert to platform driver
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     Ben Dooks <ben.dooks@sifive.com>,
        Hal Feng <hal.feng@linux.starfivetech.com>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Emil Renner Berthing <kernel@esmil.dk>,
        linux-kernel@vger.kernel.org, Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 5 Oct 2022 at 15:48, Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> On 05/10/2022 14:44, Emil Renner Berthing wrote:
> > On Thu, 29 Sept 2022 at 19:59, Ben Dooks <ben.dooks@sifive.com> wrote:
> >>
> >> On 29/09/2022 15:32, Hal Feng wrote:
> >>> From: Emil Renner Berthing <kernel@esmil.dk>
> >>>
> >>> This converts the driver to use the builtin_platform_driver_probe macro
> >>> to initialize the driver. This macro ends up calling device_initcall as
> >>> was used previously, but also allocates a platform device which gives us
> >>> access to much nicer APIs such as platform_ioremap_resource,
> >>> platform_get_irq and dev_err_probe.
> >>
> >> This is useful, but also there are other changes currently being sorted
> >> out by Zong Li (cc'd into this message) which have already been reviewed
> >> and are hopefully queued for the next kernel release.
> >>
> >>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> >>> Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
> >
> > I'm ok with something like this being merged, but please note that if
> > we ever want to support the JH7100 which uses registers in this
> > peripheral to flush the cache for its non-coherent DMAs then this
> > driver needs to be loaded before other peripherals or we will trigger
> > the 2nd warning in arch/riscv/mm/dma-noncoherent.c. I'm not sure we
> > can do that when it's a platform driver. See this patch for an
> > alternative to support the JH71x0s:
> > https://github.com/esmil/linux/commit/9c5b29da56ae29159c9572c5bb195fe3a1b535c5
> >
> > /Emil
>
> Are you replying to your own patch that does the conversion to
> platform driver and then saying that it could actually cause
> issues?

Yes, I can see it seems odd, but this patch lived for a while in the
kernel repo for the JH7100 until I rebased on 6.0-rc1 and realized the
above.
Hal Feng must have based his patches on a version of the code before
that when preparing this series.

> I'm all for dropping this for the moment and keeping the old
> early init for the ccache.

Cool.

/Emil

> >>>    drivers/soc/sifive/sifive_l2_cache.c | 79 ++++++++++++++--------------
> >>>    1 file changed, 40 insertions(+), 39 deletions(-)
> >>>
> >>> diff --git a/drivers/soc/sifive/sifive_l2_cache.c b/drivers/soc/sifive/sifive_l2_cache.c
> >>> index 59640a1d0b28..010d612f7420 100644
> >>> --- a/drivers/soc/sifive/sifive_l2_cache.c
> >>> +++ b/drivers/soc/sifive/sifive_l2_cache.c
> >>> @@ -7,9 +7,9 @@
> >>>     */
> >>>    #include <linux/debugfs.h>
> >>>    #include <linux/interrupt.h>
> >>> -#include <linux/of_irq.h>
> >>> -#include <linux/of_address.h>
> >>> -#include <linux/device.h>
> >>> +#include <linux/io.h>
> >>> +#include <linux/mod_devicetable.h>
> >>> +#include <linux/platform_device.h>
> >>>    #include <asm/cacheinfo.h>
> >>>    #include <soc/sifive/sifive_l2_cache.h>
> >>>
> >>> @@ -96,12 +96,6 @@ static void l2_config_read(void)
> >>>        pr_info("L2CACHE: Index of the largest way enabled: %d\n", regval);
> >>>    }
> >>>
> >>> -static const struct of_device_id sifive_l2_ids[] = {
> >>> -     { .compatible = "sifive,fu540-c000-ccache" },
> >>> -     { .compatible = "sifive,fu740-c000-ccache" },
> >>> -     { /* end of table */ },
> >>> -};
> >>> -
> >>>    static ATOMIC_NOTIFIER_HEAD(l2_err_chain);
> >>>
> >>>    int register_sifive_l2_error_notifier(struct notifier_block *nb)
> >>> @@ -192,36 +186,29 @@ static irqreturn_t l2_int_handler(int irq, void *device)
> >>>        return IRQ_HANDLED;
> >>>    }
> >>>
> >>> -static int __init sifive_l2_init(void)
> >>> +static int __init sifive_l2_probe(struct platform_device *pdev)
> >>>    {
> >>> -     struct device_node *np;
> >>> -     struct resource res;
> >>> -     int i, rc, intr_num;
> >>> -
> >>> -     np = of_find_matching_node(NULL, sifive_l2_ids);
> >>> -     if (!np)
> >>> -             return -ENODEV;
> >>> -
> >>> -     if (of_address_to_resource(np, 0, &res))
> >>> -             return -ENODEV;
> >>> -
> >>> -     l2_base = ioremap(res.start, resource_size(&res));
> >>> -     if (!l2_base)
> >>> -             return -ENOMEM;
> >>> -
> >>> -     intr_num = of_property_count_u32_elems(np, "interrupts");
> >>> -     if (!intr_num) {
> >>> -             pr_err("L2CACHE: no interrupts property\n");
> >>> -             return -ENODEV;
> >>> -     }
> >>> -
> >>> -     for (i = 0; i < intr_num; i++) {
> >>> -             g_irq[i] = irq_of_parse_and_map(np, i);
> >>> -             rc = request_irq(g_irq[i], l2_int_handler, 0, "l2_ecc", NULL);
> >>> -             if (rc) {
> >>> -                     pr_err("L2CACHE: Could not request IRQ %d\n", g_irq[i]);
> >>> -                     return rc;
> >>> -             }
> >>> +     struct device *dev = &pdev->dev;
> >>> +     int nirqs;
> >>> +     int ret;
> >>> +     int i;
> >>> +
> >>> +     l2_base = devm_platform_ioremap_resource(pdev, 0);
> >>> +     if (IS_ERR(l2_base))
> >>> +             return PTR_ERR(l2_base);
> >>> +
> >>> +     nirqs = platform_irq_count(pdev);
> >>> +     if (nirqs <= 0)
> >>> +             return dev_err_probe(dev, -ENODEV, "no interrupts\n");
> >>
> >> I wonder if zero irqs is an actual issue here?
> >>
> >>> +     for (i = 0; i < nirqs; i++) {
> >>> +             g_irq[i] = platform_get_irq(pdev, i);
> >>
> >> I wonder if we need to keep g_irq[] around now? Is it going to be useful
> >> in the future?
> >>
> >>> +             if (g_irq[i] < 0)
> >>> +                     return g_irq[i];
> >>> +
> >>> +             ret = devm_request_irq(dev, g_irq[i], l2_int_handler, 0, pdev->name, NULL);
> >>> +             if (ret)
> >>> +                     return dev_err_probe(dev, ret, "Could not request IRQ %d\n", g_irq[i]);
> >>>        }
> >>>
> >>>        l2_config_read();
> >>> @@ -234,4 +221,18 @@ static int __init sifive_l2_init(void)
> >>>    #endif
> >>>        return 0;
> >>>    }
> >>> -device_initcall(sifive_l2_init);
> >>> +
> >>> +static const struct of_device_id sifive_l2_match[] = {
> >>> +     { .compatible = "sifive,fu540-c000-ccache" },
> >>> +     { .compatible = "sifive,fu740-c000-ccache" },
> >>> +     { /* sentinel */ }
> >>> +};
> >>> +
> >>> +static struct platform_driver sifive_l2_driver = {
> >>> +     .driver = {
> >>> +             .name = "sifive_l2_cache",
> >>> +             .of_match_table = sifive_l2_match,
> >>> +             .suppress_bind_attrs = true,
> >>> +     },
> >>> +};
> >>> +builtin_platform_driver_probe(sifive_l2_driver, sifive_l2_probe);
> >>
> >>
> >> _______________________________________________
> >> linux-riscv mailing list
> >> linux-riscv@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-riscv
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> >
>
> --
> Ben Dooks                               http://www.codethink.co.uk/
> Senior Engineer                         Codethink - Providing Genius
>
> https://www.codethink.co.uk/privacy.html
>
