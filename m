Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F3E52F3265
	for <lists+linux-clk@lfdr.de>; Tue, 12 Jan 2021 15:00:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388067AbhALN7c (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 12 Jan 2021 08:59:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388054AbhALN7a (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Jan 2021 08:59:30 -0500
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5C01C0617A3
        for <linux-clk@vger.kernel.org>; Tue, 12 Jan 2021 05:58:18 -0800 (PST)
Received: by mail-vk1-xa35.google.com with SMTP id k9so621385vke.4
        for <linux-clk@vger.kernel.org>; Tue, 12 Jan 2021 05:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NXadZdz8Ctiv1n9eDAHyiJm1Q2gQ3cn9xSsA8PIpIy8=;
        b=X6eafdEk/mhZKGkplAkeZlHtw5MHYiPGzuLqaU/8QIJNUYdB77gAnLlDUNAiD4hMNh
         xtLhe6wxwEiVq1lSHcSdByEjddJcVv0v0t0oPEFeAc9L27R7dcQSR2snp4mzm54uhMOV
         QKMmK332VJC9oTr7isDNxdOmzA+cqgmtgUlK1ECND3GRn5P+0A4DXM4oMIsVo0M63aHu
         tz/gPl2J8bw3GAsqZAj7v5VCFpg1TO+MjzWZoFbxAP5iVZXNmoKqZLzr4y4p5HBfjEPW
         z4ZdM03MFp9BUDCj2gplHxCyRyXtyF1F2XMD9c4mZY1sgSAu7ecGDfwd89/tv+VfhSp4
         YzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NXadZdz8Ctiv1n9eDAHyiJm1Q2gQ3cn9xSsA8PIpIy8=;
        b=eKNp6A68g1ya3AjtNLcB4w/jvpdr/Cr5/NQereG6WstJELzmgS876h7MwD72+9Y9FJ
         UsUptFY0s/mPW0AvUErIt86+SrSNF/u09BwZXepOemyTefHdzAULwoVBb3+HodkGBzXO
         com31ZKPOKUnT2S7OSSkm+sQUh9rhcZlew4uULJMfRF+aUzg+S5SIe7q8voLAXzIT7td
         l1XvfoeK9SfZyZ/nsx6YJnMIr/oTxP3zuuh7tyAINDXCjoVIlZdm4Mf0GECgnZMf0wlc
         0joeX2B1wABfIrvkuji3sE+XvM54cYSiGwNOPm5FmCm2GV0lb4iIOygU+5jI3hB393iZ
         A14Q==
X-Gm-Message-State: AOAM533/EzFiQ5E+KYKfCDL9c3xlgJc/hiHNMJcB1xWEzYD6Enp4Pv7p
        6dQjzxLvfQZl61Faxg3wJl+/SDa8AOZMF814zI4FVQ==
X-Google-Smtp-Source: ABdhPJy+B3y/eESbyu3OC6gky5khJjR8g/IPWLuj2VIXLHRwiMv4vqF7OT9LeQIvE4BHFVFqSxmsFb+5AO9DEtsQ0nY=
X-Received: by 2002:a1f:8f08:: with SMTP id r8mr3665187vkd.15.1610459897870;
 Tue, 12 Jan 2021 05:58:17 -0800 (PST)
MIME-Version: 1.0
References: <20201217180638.22748-1-digetx@gmail.com> <20201217180638.22748-32-digetx@gmail.com>
In-Reply-To: <20201217180638.22748-32-digetx@gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 12 Jan 2021 14:57:41 +0100
Message-ID: <CAPDyKFrRKbQS1+t_nGH9RRKf0WGcAf-Pjzo1rJt=Sz=SMWOa7Q@mail.gmail.com>
Subject: Re: [PATCH v2 31/48] soc/tegra: regulators: Support Core domain state syncing
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        driverdevel <devel@driverdev.osuosl.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 17 Dec 2020 at 19:07, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> The core voltage shall not drop until state of Core domain is synced,
> i.e. all device drivers that use Core domain are loaded and ready.
>
> Support Core domain state syncing. The Core domain driver invokes the
> core-regulator voltage syncing once the state of domain is synced, at
> this point the Core voltage is allowed to go lower.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

This looks reasonable to me, feel free to add:

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe


> ---
>  drivers/soc/tegra/regulators-tegra20.c | 19 ++++++++++++++++++-
>  drivers/soc/tegra/regulators-tegra30.c | 18 +++++++++++++++++-
>  2 files changed, 35 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/tegra/regulators-tegra20.c b/drivers/soc/tegra/regulators-tegra20.c
> index 367a71a3cd10..e2c11d442591 100644
> --- a/drivers/soc/tegra/regulators-tegra20.c
> +++ b/drivers/soc/tegra/regulators-tegra20.c
> @@ -16,6 +16,8 @@
>  #include <linux/regulator/driver.h>
>  #include <linux/regulator/machine.h>
>
> +#include <soc/tegra/common.h>
> +
>  struct tegra_regulator_coupler {
>         struct regulator_coupler coupler;
>         struct regulator_dev *core_rdev;
> @@ -38,6 +40,21 @@ static int tegra20_core_limit(struct tegra_regulator_coupler *tegra,
>         int core_cur_uV;
>         int err;
>
> +       /*
> +        * Tegra20 SoC has critical DVFS-capable devices that are
> +        * permanently-active or active at a boot time, like EMC
> +        * (DRAM controller) or Display controller for example.
> +        *
> +        * The voltage of a CORE SoC power domain shall not be dropped below
> +        * a minimum level, which is determined by device's clock rate.
> +        * This means that we can't fully allow CORE voltage scaling until
> +        * the state of all DVFS-critical CORE devices is synced.
> +        */
> +       if (tegra_soc_core_domain_state_synced()) {
> +               pr_info_once("voltage state synced\n");
> +               return 0;
> +       }
> +
>         if (tegra->core_min_uV > 0)
>                 return tegra->core_min_uV;
>
> @@ -58,7 +75,7 @@ static int tegra20_core_limit(struct tegra_regulator_coupler *tegra,
>          */
>         tegra->core_min_uV = core_max_uV;
>
> -       pr_info("core minimum voltage limited to %duV\n", tegra->core_min_uV);
> +       pr_info("core voltage initialized to %duV\n", tegra->core_min_uV);
>
>         return tegra->core_min_uV;
>  }
> diff --git a/drivers/soc/tegra/regulators-tegra30.c b/drivers/soc/tegra/regulators-tegra30.c
> index 0e776b20f625..42d675b79fa3 100644
> --- a/drivers/soc/tegra/regulators-tegra30.c
> +++ b/drivers/soc/tegra/regulators-tegra30.c
> @@ -16,6 +16,7 @@
>  #include <linux/regulator/driver.h>
>  #include <linux/regulator/machine.h>
>
> +#include <soc/tegra/common.h>
>  #include <soc/tegra/fuse.h>
>
>  struct tegra_regulator_coupler {
> @@ -39,6 +40,21 @@ static int tegra30_core_limit(struct tegra_regulator_coupler *tegra,
>         int core_cur_uV;
>         int err;
>
> +       /*
> +        * Tegra30 SoC has critical DVFS-capable devices that are
> +        * permanently-active or active at a boot time, like EMC
> +        * (DRAM controller) or Display controller for example.
> +        *
> +        * The voltage of a CORE SoC power domain shall not be dropped below
> +        * a minimum level, which is determined by device's clock rate.
> +        * This means that we can't fully allow CORE voltage scaling until
> +        * the state of all DVFS-critical CORE devices is synced.
> +        */
> +       if (tegra_soc_core_domain_state_synced()) {
> +               pr_info_once("voltage state synced\n");
> +               return 0;
> +       }
> +
>         if (tegra->core_min_uV > 0)
>                 return tegra->core_min_uV;
>
> @@ -59,7 +75,7 @@ static int tegra30_core_limit(struct tegra_regulator_coupler *tegra,
>          */
>         tegra->core_min_uV = core_max_uV;
>
> -       pr_info("core minimum voltage limited to %duV\n", tegra->core_min_uV);
> +       pr_info("core voltage initialized to %duV\n", tegra->core_min_uV);
>
>         return tegra->core_min_uV;
>  }
> --
> 2.29.2
>
