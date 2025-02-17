Return-Path: <linux-clk+bounces-18032-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B803CA35C4C
	for <lists+linux-clk@lfdr.de>; Fri, 14 Feb 2025 12:16:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6399716F68F
	for <lists+linux-clk@lfdr.de>; Fri, 14 Feb 2025 11:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88C20261587;
	Fri, 14 Feb 2025 11:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OI2otWP4"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9BA25A62E
	for <linux-clk@vger.kernel.org>; Fri, 14 Feb 2025 11:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739531797; cv=none; b=mLdoFcVCqqfQArhiX4rSmlkRjNcmT8aUA6V3NBF/ApDhHHNS4YN/WAIOS2PZuzgS4u6XDzGikO9nPHgcF/0aGl78btemSaVS1W++CMaZGHKJumzoIdOKNjrEeLX9yakOLSvdpjsfqM1wkp973j9NCIq1FyrXMvySIKdtgiBPY5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739531797; c=relaxed/simple;
	bh=Nv+6Ycy+r/YLOTrYHkPYwU3kd5MfJvihnaHXExKMBQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ty8G69hN4osNcoG0pQ4sFRhkYA6fC83OCx1qPvr5vCA3tRy+KUvqXc2DCkcIErksg0YSm1Ajru3Uw41V9WpYpDPO7+isAESDrh4zenplj12VHOEg57pLJI3FL21KfKR5d0OkjZUF3aaZkWjc5iJKEsm0AJRlVg/cd9rQvTZpW2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OI2otWP4; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e4930eca0d4so1451879276.3
        for <linux-clk@vger.kernel.org>; Fri, 14 Feb 2025 03:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739531794; x=1740136594; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9jM48aKf/sbl9H/oOIzSS3d/8y4m7nkDsYlbYDKZEDc=;
        b=OI2otWP44QmJsoWW6RJiWch/jCTDIewr6cfpbcKwj/F7m36rqzqlUgKidAe42S+0S4
         Z7sl3GyDZudsFFofQHZvvXpLyBBeIxAlhSPSmFD2b9fQ8MrDh8lYn64YjwcrstwGrPph
         UcOOQIc6sq3RMSX77WwLDimMAqZosz21ge6REELimIcopeiS/RZF2FNLUhbWcGDpUgbu
         0PACkJqPTYGriSinpNaJtPZooZGLlY1F1SA2cVH4oMNuYPeCktrvhZSCMCgYqCRidG9r
         WD/sauw0CRoqsGpFsTrR1EpxCRtFdzkud54FGFRQCIJlNQzwkGVPWnAEZz9jH/S/AUCV
         PVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739531794; x=1740136594;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9jM48aKf/sbl9H/oOIzSS3d/8y4m7nkDsYlbYDKZEDc=;
        b=nwPH5v4LCvhKTerVDvcX2zCv+Ogp0Rb9abMuWYL2FIqGAKM1OcYd6/USeRCXvlghC7
         s4vCh5BtwS/ZzRO2SbWnIq7gngNFDYlmFiBEhZAV+glKXgXCLm7fX5LHpj5w98qN3A6g
         qNWVCY+nHmSJAVEHiyrzcwMTf2x4paEBEDAMSkgj0BdGOZwA3ChGyMTCv0WM4MXpQscY
         eupTVOGhNw/xhIweZahZt9k+mJ1YrMAsbWp3Btpv+kpi7lg9LWxblwkDAg9Ln437oqbo
         7+gZYi7BZXl0DJCnNmxbIQdmCGNBELbS9pz+Y56jJevZGIGYC1GZKdc4jGTeRW3/ITwR
         0/Mw==
X-Forwarded-Encrypted: i=1; AJvYcCVaFzbaftGcy5a7OJd7WjK829QOw4pke23PN2T7xX1B3frbl8kuid08qlJj/WrqwKGOtDi2OgHF+bk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxS6OXL3gpgEo/e1inuXR0fzeT3gXGgc45yENMJBJ0VKfT3mo3C
	PvhFAptUDio7YO3a6Rq7JBuiBIRKyK9Eo85WTe3RKz3onu5uqvGdfIxmIc6NBUbLxnVh16gicEK
	n6kdfYqQO0FBrZSV8kEtuxn3EmdBInySxxCglkQ==
X-Gm-Gg: ASbGncu9TlEARN4iBCb1/UOY1zEXelM8BCtk8KOWqsE4kRk8IqPyBr0tXlFAVJrbfhD
	sN5zqxbR48hD/mzsnKRVp9ZvwftqQg6wO79w+UTB+VQmv4weyx/h645YUqk8nZ6Q4w3yPdRvnrA
	==
X-Google-Smtp-Source: AGHT+IE6woj8oPDle191tVLCdn9IrSTd52LbGDiCC/HBR/zbujT5GVfsySFK4K0WQQyEViMhqMK63WlGFClc8+pjkbk=
X-Received: by 2002:a05:6902:841:b0:e5b:323b:a1a4 with SMTP id
 3f1490d57ef6-e5d9f180dc6mr10461212276.41.1739531793901; Fri, 14 Feb 2025
 03:16:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250128194832eucas1p15db9ed3575703812ecc0374ffc5b2861@eucas1p1.samsung.com>
 <20250128194816.2185326-1-m.wilczynski@samsung.com> <20250128194816.2185326-7-m.wilczynski@samsung.com>
In-Reply-To: <20250128194816.2185326-7-m.wilczynski@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 14 Feb 2025 12:15:58 +0100
X-Gm-Features: AWEUYZmWRXn0bzCrMyNA_HXGOtxuTTirzpyDWms-8p0mq8f1JPxvJIR_18CPMCg
Message-ID: <CAPDyKFrcs5Hc-X6qExEA992MoQcakCuKRjw7cek3KpYZihsLFw@mail.gmail.com>
Subject: Re: [PATCH v4 06/18] pmdomain: thead: Add power-domain driver for TH1520
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org, 
	wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com, 
	matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, jszhang@kernel.org, 
	p.zabel@pengutronix.de, m.szyprowski@samsung.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Jan 2025 at 20:48, Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
> The T-Head TH1520 SoC contains multiple power islands that can be
> programmatically turned on and off using the AON (Always-On) protocol
> and a hardware mailbox [1]. The relevant mailbox driver has already been
> merged into the mainline kernel in commit 5d4d263e1c6b ("mailbox:
> Introduce support for T-head TH1520 Mailbox driver");
>
> Introduce a power-domain driver for the TH1520 SoC, which is using AON
> firmware protocol to communicate with E902 core through the hardware
> mailbox. This way it can send power on/off commands to the E902 core.
>
> The interaction with AUDIO power island e.g trying to turn it OFF proved
> to crash the firmware running on the E902 core. Introduce the workaround
> to disable interacting with the power island.
>
> Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf [1]
>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---

[...]

> +
> +static int th1520_pd_probe(struct platform_device *pdev)
> +{
> +       struct generic_pm_domain **domains;
> +       struct genpd_onecell_data *pd_data;
> +       struct th1520_aon_chan *aon_chan;
> +       struct device *dev = &pdev->dev;
> +       int i;
> +
> +       aon_chan = dev_get_drvdata(dev->parent);
> +       if (!aon_chan) {
> +               dev_err(dev, "Failed to get AON channel from parent\n");
> +               return -EINVAL;
> +       }

As pointed out on patch4. Rather than receiving the aon_chang from the
parent device like this, it seems better to receive it from a call to
a library function provided by the FW library.

> +
> +       domains = devm_kcalloc(dev, ARRAY_SIZE(th1520_pd_ranges),
> +                              sizeof(*domains), GFP_KERNEL);
> +       if (!domains)
> +               return -ENOMEM;
> +
> +       pd_data = devm_kzalloc(dev, sizeof(*pd_data), GFP_KERNEL);
> +       if (!pd_data)
> +               return -ENOMEM;
> +
> +       for (i = 0; i < ARRAY_SIZE(th1520_pd_ranges); i++) {
> +               struct th1520_power_domain *pd;
> +
> +               if (th1520_pd_ranges[i].disabled)
> +                       continue;
> +
> +               pd = th1520_add_pm_domain(dev, &th1520_pd_ranges[i]);
> +               if (IS_ERR(pd))
> +                       return PTR_ERR(pd);
> +
> +               pd->aon_chan = aon_chan;
> +               domains[i] = &pd->genpd;
> +               dev_dbg(dev, "added power domain %s\n", pd->genpd.name);
> +       }
> +
> +       pd_data->domains = domains;
> +       pd_data->num_domains = ARRAY_SIZE(th1520_pd_ranges);
> +       pd_data->xlate = th1520_pd_xlate;
> +
> +       /*
> +        * Initialize all power domains to off to ensure they start in a
> +        * low-power state. This allows device drivers to manage power
> +        * domains by turning them on or off as needed.
> +        */
> +       th1520_pd_init_all_off(domains, dev);
> +
> +       return of_genpd_add_provider_onecell(dev->parent->of_node, pd_data);
> +}
> +
> +static struct platform_driver th1520_pd_driver = {
> +       .driver = {
> +               .name = "th1520-pd",
> +       },
> +       .probe = th1520_pd_probe,
> +};
> +module_platform_driver(th1520_pd_driver);

There is no ->remove() callback.

Either add one or make this a builtin_platform_driver() with
"suppress_bind_attrs = true".

> +
> +MODULE_AUTHOR("Michal Wilczynski <m.wilczynski@samsung.com>");
> +MODULE_DESCRIPTION("T-HEAD TH1520 SoC power domain controller");
> +MODULE_LICENSE("GPL");
> --
> 2.34.1
>

Besides the minor thing above, this looks good to me!

Kind regards
Uffe

