Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC223C21A6
	for <lists+linux-clk@lfdr.de>; Fri,  9 Jul 2021 11:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231970AbhGIJgC (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 9 Jul 2021 05:36:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231932AbhGIJgC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Jul 2021 05:36:02 -0400
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15110C0613E6
        for <linux-clk@vger.kernel.org>; Fri,  9 Jul 2021 02:33:18 -0700 (PDT)
Received: by mail-ua1-x932.google.com with SMTP id e20so3345557ual.9
        for <linux-clk@vger.kernel.org>; Fri, 09 Jul 2021 02:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UJADR0aBys9GFxg0He3i+UvK4vlW/z9FqFDsWxRdgz8=;
        b=cIArgiyb0ldUhoQL522OU+q3Q8cahZncsZCKLDqi/4NPL2QXZXZBI1y/Rcet4BH6Re
         LQiP8hnD3SqNC0XDESODA5Zl3sXRLSCk+/0M4C0S3QcyFHMxV0GkvonpKnFytK42xMyF
         CO2VGxPTfIbZuqDaOl1rRcMC9t7/fSXtJHxVBEi6Ne1hgrB+ICX2oXOhk2xXKcF9YX7L
         PPNlHy1Y4NGBKUVulEB9+/4TZnQ2TOo/VCwU4mXR6FeU9ES31IEV/h5QPl8JpvN0S7pr
         dkVOKgCnQTo1JW1+7S2nNk+BFKp0XVKJSQDkD9crF0+6WYoF/Hg0asGyGFUgEGiP1wbU
         usWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UJADR0aBys9GFxg0He3i+UvK4vlW/z9FqFDsWxRdgz8=;
        b=nk+L+nRfdgMjfRbxrZ7GGlfYAsRexvN+aTNAzTRfbUhYIN6LGm6j4UnBy6hINP6ZRu
         aN2vrLpqMFp7913RqCOKjIWmOBBhDcEzycszalo7leYAFSDIkQeKsZ7zbfDwOFP9eSMR
         Pa2J5TXRygRhnyabrGcUBjEFFSfGtbarAHtq3DpMMUeYxcGq0t4SIOmFAELMYO0htvvr
         BbrR5T0dYXREG3DrvSqH5fHqjKacb4tHuIcsUW5jp23xW37+7CMwLC8D3xf9zwws6BXI
         00t641lv8+/uR4NcndqZSbwPS3ps6zkQMsYSAtIFAPqLH2LXoHrwCDHERjf7qDpE+fmH
         cQYQ==
X-Gm-Message-State: AOAM531SiJmWf3Fvpn/oZ3OGPlxsD2WrWoF+dN4rwFMykmJ9nS+ZRKsf
        JNV+FWvFO7zrGSzH5N6s0kEbsFYcDp2vqaYAPGW/SQ==
X-Google-Smtp-Source: ABdhPJzG2uYHESJjE3iBmLuZDYFsn+nYbWYUgj0XEv2AEw2USFSt1hD6BfaXuOvTi5lYXAQG705JGqGPInjtXYX/JAA=
X-Received: by 2002:ab0:42a6:: with SMTP id j35mr33721424uaj.129.1625823197188;
 Fri, 09 Jul 2021 02:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210709043136.533205-1-dmitry.baryshkov@linaro.org> <20210709043136.533205-5-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210709043136.533205-5-dmitry.baryshkov@linaro.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 9 Jul 2021 11:32:40 +0200
Message-ID: <CAPDyKFprYK8bSk+rdnDt3xRUR9BRNdyRiBdefO+s7qzOwHf7hg@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 4/7] clk: qcom: gdsc: enable optional power
 domain support
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 9 Jul 2021 at 06:32, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On sm8250 dispcc and videocc registers are powered up by the MMCX power
> domain. Currently we used a regulator to enable this domain on demand,
> however this has some consequences, as genpd code is not reentrant.
>
> Teach Qualcomm clock controller code about setting up power domains and
> using them for gdsc control.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

[...]

> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index 51ed640e527b..9401d01533c8 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -427,6 +427,7 @@ int gdsc_register(struct gdsc_desc *desc,
>                         continue;
>                 scs[i]->regmap = regmap;
>                 scs[i]->rcdev = rcdev;
> +               scs[i]->pd.dev.parent = desc->dev;
>                 ret = gdsc_init(scs[i]);
>                 if (ret)
>                         return ret;
> @@ -439,6 +440,8 @@ int gdsc_register(struct gdsc_desc *desc,
>                         continue;
>                 if (scs[i]->parent)
>                         pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
> +               else if (!IS_ERR_OR_NULL(dev->pm_domain))

So dev_pm_domain_attach() (which calls genpd_dev_pm_attach() is being
called for gdsc platform device from the platform bus', to try to
attach the device to its corresponding PM domain.

Looking a bit closer to genpd_dev_pm_attach(), I realize that we
shouldn't really try to attach a device to its PM domain, when its OF
node (dev->of_node) contains a "#power-domain-cells" specifier. This
is because it indicates that the device belongs to a genpd provider
itself. In this case, a "power-domains" specifier tells that it has a
parent domain.

I will post a patch that fixes this asap.

> +                       pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
>         }
>
>         return of_genpd_add_provider_onecell(dev->of_node, data);
> @@ -457,6 +460,8 @@ void gdsc_unregister(struct gdsc_desc *desc)
>                         continue;
>                 if (scs[i]->parent)
>                         pm_genpd_remove_subdomain(scs[i]->parent, &scs[i]->pd);
> +               else if (!IS_ERR_OR_NULL(dev->pm_domain))

Ditto.

> +                       pm_genpd_remove_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
>         }
>         of_genpd_del_provider(dev->of_node);
>  }
> --
> 2.30.2
>

Kind regards
Uffe
