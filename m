Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85C9225BDC
	for <lists+linux-clk@lfdr.de>; Wed, 22 May 2019 04:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728239AbfEVCHq (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 21 May 2019 22:07:46 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:46633 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727930AbfEVCHq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 May 2019 22:07:46 -0400
Received: by mail-oi1-f193.google.com with SMTP id 203so382989oid.13
        for <linux-clk@vger.kernel.org>; Tue, 21 May 2019 19:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PW2Ksp4dF+kCYGO2bVRBw5OwUH5NVUnvQm1hs6EDl6g=;
        b=YENWXgYBjKoO0LJUuXsbbL9ODcCAtlfjp9Zm6wsARsbNfeRLCI23TVVM3BF/uL00AM
         BLgVZdXe7kq0jzXclwNKvS1rTgULLOlEENmBV/Y+o/61bNq4aR4ywl/InH5pmMxoRgKG
         UtXhrd6Fnz0Fi0pKGBV9ETLvcd2AWAcO2iwPkx/iGFhiWPy/N7sHS56TY2e+5RkTzQqE
         7GQnhX7osJRKB6smAWzymNNMQ94E2QRgPyO1WcpHNM9CU0NXQUejAv8hGQXGTOV3qc5L
         5I10NNR7uYkWqWvEpZUQb6pE14tf+vHvR2c8doFRh8z1Rp+dVyi5zTfBZSVoLOPx6w8V
         iCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PW2Ksp4dF+kCYGO2bVRBw5OwUH5NVUnvQm1hs6EDl6g=;
        b=ldUsv4JZPOubiHO6zdsGJelRT8q7J+dpPx97oUPuAJCCoK4swxRfP1hz0AyfPWG6QL
         +VkmxwkmvfO3S0HibskqqxeSAy3pmMDdn7RCRK0t8AxzKOP75QQKQgJ21AfTAnFGCfcb
         1/05Z48R+4Vg1YMoKfG2+i24aB46zO4FvLrecPy/THRPAnER1JSUYVorSiixf0yNiW3X
         nol+h0KzzWxO5F7aaSOsmHRjY3dQslY4VXXJBNQxi7wPDnxhh5/dhs2AdCaeq04VZXbx
         mFgxLod4y6PwNWEImsPNrUe4yNOG0/jnHHiXr1IwE6nUzFYV7h2LgywAaPJZ0wLdfaex
         88iA==
X-Gm-Message-State: APjAAAWl6nkNZPuPJa82nPWA4LUj1qGrEDUnRHTRqWEhxIn+pgW83PYL
        oEGkjWX0rUpVHP+I1/A0vpB2Ehz75i7EtnvvVe7P1Q==
X-Google-Smtp-Source: APXvYqxjqcRRR4xBTNMXgyICOQLiOPpbilh/rSzqCR3MbAtsroT4lNBzp+g7xdHt2NeHrKTxYN1cMbG6dh67ig9jpfY=
X-Received: by 2002:aca:d846:: with SMTP id p67mr2797618oig.6.1558490865822;
 Tue, 21 May 2019 19:07:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190522011504.19342-1-zhang.chunyan@linaro.org> <20190522011504.19342-2-zhang.chunyan@linaro.org>
In-Reply-To: <20190522011504.19342-2-zhang.chunyan@linaro.org>
From:   Baolin Wang <baolin.wang@linaro.org>
Date:   Wed, 22 May 2019 10:07:33 +0800
Message-ID: <CAMz4kuKbw+HHbALGEJaoYvV435-RS7gMzWbmwZekLWdKT=GV7A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] clk: sprd: Switch from of_iomap() to devm_ioremap_resource()
To:     Chunyan Zhang <zhang.chunyan@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 22 May 2019 at 09:15, Chunyan Zhang <zhang.chunyan@linaro.org> wrote:
>
> devm_ioremap_resources() automatically requests resources and devm_ wrappers
> do better error handling and unmapping of the I/O region when needed,
> that would make drivers more clean and simple.
>
> Signed-off-by: Chunyan Zhang <zhang.chunyan@linaro.org>

Reviewed-by: Baolin Wang <baolin.wang@linaro.org>

> ---
>  drivers/clk/sprd/common.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/sprd/common.c b/drivers/clk/sprd/common.c
> index e038b0447206..9ce690999eaa 100644
> --- a/drivers/clk/sprd/common.c
> +++ b/drivers/clk/sprd/common.c
> @@ -42,6 +42,7 @@ int sprd_clk_regmap_init(struct platform_device *pdev,
>         void __iomem *base;
>         struct device_node *node = pdev->dev.of_node;
>         struct regmap *regmap;
> +       struct resource *res;
>
>         if (of_find_property(node, "sprd,syscon", NULL)) {
>                 regmap = syscon_regmap_lookup_by_phandle(node, "sprd,syscon");
> @@ -50,7 +51,11 @@ int sprd_clk_regmap_init(struct platform_device *pdev,
>                         return PTR_ERR(regmap);
>                 }
>         } else {
> -               base = of_iomap(node, 0);
> +               res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +               base = devm_ioremap_resource(&pdev->dev, res);
> +               if (IS_ERR(base))
> +                       return PTR_ERR(base);
> +
>                 regmap = devm_regmap_init_mmio(&pdev->dev, base,
>                                                &sprdclk_regmap_config);
>                 if (IS_ERR_OR_NULL(regmap)) {
> --
> 2.17.1
>


-- 
Baolin Wang
Best Regards
