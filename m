Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95C6A3D565B
	for <lists+linux-clk@lfdr.de>; Mon, 26 Jul 2021 11:20:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232454AbhGZIjw (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 26 Jul 2021 04:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232295AbhGZIjw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Jul 2021 04:39:52 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43DB3C061765
        for <linux-clk@vger.kernel.org>; Mon, 26 Jul 2021 02:20:21 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id bp1so14293255lfb.3
        for <linux-clk@vger.kernel.org>; Mon, 26 Jul 2021 02:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UyAhVW8SUVdW2juHf4NXSIfTyUpw2d4E9HcLC6UlbsU=;
        b=PFhaUyyioW4u4jvnVZfDpQc+0BSgWt8O5W+h2/JkXloGBxxa1lz6qvX+LcbuUXQc2N
         Z/sV52rf44gz4YnpyNlA3a5x50wV6yKSQCx7U00BnemtwgGM+ascTy/4/9Bei7pKU0i6
         ejhLDXqu6p6hD3mYKZgz79DXesDgefxzliTwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UyAhVW8SUVdW2juHf4NXSIfTyUpw2d4E9HcLC6UlbsU=;
        b=l++qwGwphYJ/PG7YmqD0wWjBrH+zLdhKplOOlqK+UbIcSTQ9MFANqcVa76bcfIlD8D
         mYTk71h2n+qR+tFIbuRok2bE6xQhZljnuS2z7JVvl5rGw4iOQxan0NI8fr39/8yVUb5u
         MKDc19w35LP7LFBs0VboQ+k+78AFjUV2RHLlMSPrDInNQR3egnkaZQcXz8pMC2kgKj7Y
         lRbUR53AYvaNKGqNqG3we3677b+Tab5Q9ELozWApW4JvzqTjAAKuZyVAooABBRbzBTor
         ui8fiAmY/wAFN2wErjST8hgO+yExd8GMZFho5pfS1Z09D6F57wYySg5800fPIlbn6AYG
         peaA==
X-Gm-Message-State: AOAM5307sNOGUgcwtcxEC87gQz1FfcuWiAu1Dgn7KxoJY6D9WvtrzcQZ
        UvxnnLHEQ8W43pbjHkn5JSwf4t5vPzKdgd0LPOxCBw==
X-Google-Smtp-Source: ABdhPJxZeDoaO4+lBiCkXyq/2Admv1+kefRfVNjKKrFIMZn357CPp9SKVLhT5mJJhxTofCy8T41M60sD5j6u/8BBBOQ=
X-Received: by 2002:ac2:48b8:: with SMTP id u24mr12319860lfg.587.1627291219448;
 Mon, 26 Jul 2021 02:20:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210726071439.14248-1-sam.shih@mediatek.com> <20210726071439.14248-2-sam.shih@mediatek.com>
In-Reply-To: <20210726071439.14248-2-sam.shih@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 26 Jul 2021 17:20:08 +0800
Message-ID: <CAGXv+5GeEBAkXKfA=S7XGOLYtCRihP5ov6kSiw+eevPAi74GAQ@mail.gmail.com>
Subject: Re: [PATCH 01/12] dt-bindings: clock: mediatek: document clk bindings
 for mediatek mt7986 SoC
To:     Sam Shih <sam.shih@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Fabien Parent <fparent@baylibre.com>,
        Seiya Wang <seiya.wang@mediatek.com>,
        Devicetree List <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, linux-gpio@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-crypto@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org,
        John Crispin <john@phrozen.org>,
        Ryder Lee <Ryder.Lee@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Jul 26, 2021 at 3:17 PM Sam Shih <sam.shih@mediatek.com> wrote:
>
> This patch adds the binding documentation for topckgen, apmixedsys,
> infracfg, infracfg_ao, and ethernet subsystem clocks.
>
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt    | 1 +
>  .../devicetree/bindings/arm/mediatek/mediatek,ethsys.txt        | 1 +
>  .../devicetree/bindings/arm/mediatek/mediatek,infracfg.txt      | 2 ++
>  .../devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt      | 2 ++
>  .../devicetree/bindings/arm/mediatek/mediatek,topckgen.txt      | 1 +
>  5 files changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
> index ea827e8763de..3fa755866528 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
> @@ -14,6 +14,7 @@ Required Properties:
>         - "mediatek,mt7622-apmixedsys"
>         - "mediatek,mt7623-apmixedsys", "mediatek,mt2701-apmixedsys"
>         - "mediatek,mt7629-apmixedsys"
> +       - "mediatek,mt7986-apmixedsys"
>         - "mediatek,mt8135-apmixedsys"
>         - "mediatek,mt8167-apmixedsys", "syscon"
>         - "mediatek,mt8173-apmixedsys"
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt
> index 6b7e8067e7aa..0502db73686b 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt
> @@ -10,6 +10,7 @@ Required Properties:
>         - "mediatek,mt7622-ethsys", "syscon"
>         - "mediatek,mt7623-ethsys", "mediatek,mt2701-ethsys", "syscon"
>         - "mediatek,mt7629-ethsys", "syscon"
> +       - "mediatek,mt7986-ethsys", "syscon"
>  - #clock-cells: Must be 1
>  - #reset-cells: Must be 1
>
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
> index eb3523c7a7be..5f68c30162bf 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
> @@ -15,6 +15,8 @@ Required Properties:
>         - "mediatek,mt7622-infracfg", "syscon"
>         - "mediatek,mt7623-infracfg", "mediatek,mt2701-infracfg", "syscon"
>         - "mediatek,mt7629-infracfg", "syscon"
> +       - "mediatek,mt7986-infracfg", "syscon"
> +       - "mediatek,mt7986-infracfg_ao", "syscon"
>         - "mediatek,mt8135-infracfg", "syscon"
>         - "mediatek,mt8167-infracfg", "syscon"
>         - "mediatek,mt8173-infracfg", "syscon"
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt
> index 30cb645c0e54..0e1184392941 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt
> @@ -8,6 +8,8 @@ Required Properties:
>  - compatible: Should be:
>         - "mediatek,mt7622-sgmiisys", "syscon"
>         - "mediatek,mt7629-sgmiisys", "syscon"
> +       - "mediatek,mt7986-sgmiisys", "mediatek,mt7986-sgmiisys_0", "syscon"
> +       - "mediatek,mt7986-sgmiisys", "mediatek,mt7986-sgmiisys_1", "syscon"

The order should be: most specific compatible string first, followed by
fallbacks.

Furthermore, based on the driver patch and the fact that they share the
same compatible string, it seems you shouldn't need to have two compatible
strings for two identical hardware blocks. The need for separate entries
to have different clock names is an implementation detail. Please consider
using and supporting clock-output-names.

Also, please check out the MT8195 clock driver series [1]. I'm guessing
a lot of the comments apply to this one as well.

Regards
ChenYu

[1] https://lore.kernel.org/linux-mediatek/20210616224743.5109-1-chun-jie.chen@mediatek.com/T/#t


>  - #clock-cells: Must be 1
>
>  The SGMIISYS controller uses the common clk binding from
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt
> index 5ce7578cf274..b82422bb717f 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt
> @@ -14,6 +14,7 @@ Required Properties:
>         - "mediatek,mt7622-topckgen"
>         - "mediatek,mt7623-topckgen", "mediatek,mt2701-topckgen"
>         - "mediatek,mt7629-topckgen"
> +       - "mediatek,mt7986-topckgen", "syscon"
>         - "mediatek,mt8135-topckgen"
>         - "mediatek,mt8167-topckgen", "syscon"
>         - "mediatek,mt8173-topckgen"
> --
> 2.29.2
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
