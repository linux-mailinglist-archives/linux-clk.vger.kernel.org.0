Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65144496FC7
	for <lists+linux-clk@lfdr.de>; Sun, 23 Jan 2022 06:10:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbiAWFK0 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 23 Jan 2022 00:10:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbiAWFK0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 23 Jan 2022 00:10:26 -0500
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A99CBC061401
        for <linux-clk@vger.kernel.org>; Sat, 22 Jan 2022 21:10:25 -0800 (PST)
Received: by mail-ua1-x92b.google.com with SMTP id m90so24758837uam.2
        for <linux-clk@vger.kernel.org>; Sat, 22 Jan 2022 21:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L0I9JpiDO39RUjCBeN2pfI72csyh/weIor+yFnevV54=;
        b=YeLxWALEglUczTZRa4Qdnktyv387v83n4okwro11MxhmoOuV/QEX4DuqGa7wJqdUXd
         NscwOiySXq3uwDRcImlB06aI4ZVloEPKq1gNq9aqZpNU+CVgIb43rknAbqqhSWt3aokq
         cFhtGyhQGdXkU41m9mNgiBwn8zn0wj157CiXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L0I9JpiDO39RUjCBeN2pfI72csyh/weIor+yFnevV54=;
        b=lgJLwWhbYC5GJbDfXCn/ifoHs4r96kaQxRiUat0GdmaZ46WhIkrhx+djniLGflTf5D
         ePyVqnKnJYVS0mRQVBydm/Ue9UuFnJ4Q6RA59lIR22x0oRNTGQYcpOfH+IgfvsRD0uti
         7LlXdhlQ3NsD0ovOvcMR4yB7Sjua/j/wBRISTshkgrHsOnWuZyv3qBAriozAwmw6rN3r
         NhDCd6HyxYKES8KpNX9NfQKLQdBCjuj4/pxRD7FyWxCvyVUQnadxP/Q824fp78RP8Vtj
         f4kbAhINEJGnw0+T6tKjdUiJ1qd4EugCKBwHdCtuoSEr873RbYxmIMxRsZvrMup2j06P
         bNvw==
X-Gm-Message-State: AOAM530yOyvpg6q1CyL6IQBHU64uofQF4NULdQ7UxGDua/HCbOmpyb4c
        saPLNGOTYXkC4bOiBYNVlGML0+aKWXwUZtcLI6YYhQ==
X-Google-Smtp-Source: ABdhPJyqefgEWiUZuQRUr5p43Mx2YS3LrVPhG7vsnbKEMI2TMaFUiz9EolrL5Rd4KlI5keraJKKs5KwekYydKSA1Y5w=
X-Received: by 2002:a67:d983:: with SMTP id u3mr1114253vsj.55.1642914623709;
 Sat, 22 Jan 2022 21:10:23 -0800 (PST)
MIME-Version: 1.0
References: <20220121193544.23231-1-romain.perier@gmail.com> <20220121193544.23231-4-romain.perier@gmail.com>
In-Reply-To: <20220121193544.23231-4-romain.perier@gmail.com>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Sun, 23 Jan 2022 14:10:12 +0900
Message-ID: <CAFr9PXkWpQqgnNV4+6s-ENwRepHxxm6R0htHkoVYEgjZN5nGkQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] ARM: mstar: Add cpupll to base dtsi
To:     Romain Perier <romain.perier@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Romain,

On Sat, 22 Jan 2022 at 04:35, Romain Perier <romain.perier@gmail.com> wrote:
>
> From: Daniel Palmer <daniel@0x0f.com>
>
> All MStar/SigmaStar ARMv7 SoCs have the CPU PLL at the same
> place so add it to the base dtsi.
>
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> ---
>  arch/arm/boot/dts/mstar-v7.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm/boot/dts/mstar-v7.dtsi b/arch/arm/boot/dts/mstar-v7.dtsi
> index 89ebfe4f29da..2249faaa3aa7 100644
> --- a/arch/arm/boot/dts/mstar-v7.dtsi
> +++ b/arch/arm/boot/dts/mstar-v7.dtsi
> @@ -155,6 +155,13 @@ mpll: mpll@206000 {
>                                 clocks = <&xtal>;
>                         };
>
> +                       cpupll: cpupll@206400 {
> +                               compatible = "mstar,msc313-cpupll";
> +                               reg = <0x206400 0x200>;
> +                               #clock-cells = <0>;
> +                               clocks = <&mpll MSTAR_MSC313_MPLL_DIV2>;
> +                       };
> +
>                         gpio: gpio@207800 {
>                                 #gpio-cells = <2>;
>                                 reg = <0x207800 0x200>;
> --
> 2.34.1
>

I guess I can't add a reviewed by for my own commit but this looks good to me.
The same CPUPLL is present on all of the chips seen so far so this is
the right place for this.

Cheers,

Daniel
