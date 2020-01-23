Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52A241464EB
	for <lists+linux-clk@lfdr.de>; Thu, 23 Jan 2020 10:51:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728928AbgAWJv2 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 23 Jan 2020 04:51:28 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44733 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728853AbgAWJvY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Jan 2020 04:51:24 -0500
Received: by mail-wr1-f66.google.com with SMTP id q10so2291466wrm.11
        for <linux-clk@vger.kernel.org>; Thu, 23 Jan 2020 01:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:autocrypt:organization:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uxE1eKYRkdvxpLu5grE2VJ3z+xonNHTTUbjRbMxNIE4=;
        b=GE1kTU0tE8MS9pE2LFKyFpd3Ilc2iRcnHOxQiFhosBeuHrbaRaRAUXvwaJ+vnjRQ68
         RdBT2ovN/t4dYqAeHaPb46l2zlCkIYOTZNfUxNJMkHitJxpvK/XH3NwuoAOTtQm0TDrM
         gJqn+6y9BTErkMPhWaazsTuWq38aVYCWczXGe9Zo2MH4fCPJsr7icpyUeJPaMknp6DuS
         R7/xJFcW7PSnMIn+jHceK8VAKhwoEwGh5K4P4VROo1p/vuT+HdXdsNEjfrKFOMvzUk4V
         Pyjss6UWjfY+CQx052ctZUGXZXlSQ1iY48X21L8wwnA8KnetUEOKGxjUrI19WzWHMHkP
         vb2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=uxE1eKYRkdvxpLu5grE2VJ3z+xonNHTTUbjRbMxNIE4=;
        b=HAqecxzzNCxmKP9gXjnSUbUZHXeH+D6tcQA8NYbLMAmXyOv/ubYO7B/HEeBv+OO/c+
         v0/bfyGx/le42MMxxh31DZOKhrdFb6xXZxZ4kPqW9MXQuUINbMEG3r2eybhClRks38VV
         piYNEchbPXacGt0EmI7HXeoJRhwzSV19t1Gv/ai/vGVdn3jHa3InNXRfLd2KYJewXIs3
         x403zPmcM5zlGhS/1FDw+xnP6R7NC0xdSCEPuHHp/nKLiZSqAgVmsMndGywvvvOD/MP8
         5LJES9hAdvd2UCDQplxc6KX+PUOEN0hLdDdTo3qAy3AHWfxw6yJQfAMsCFmzVYaIRSUJ
         v1+w==
X-Gm-Message-State: APjAAAXkFyjBAvqLHlGWWa070kEdHa/RGUY8HIHHH+PNEptq9SbRX6xy
        /Iy9dSkT7SmZg6/PsrjA1NaStA==
X-Google-Smtp-Source: APXvYqyRwZhO+AExqxSjysdrISPo/0d7qkwJWrY7LG8xT8DB6q27Aj3GhmmNcbcKNWMAXHehszFNQA==
X-Received: by 2002:adf:dd46:: with SMTP id u6mr16009615wrm.13.1579773081740;
        Thu, 23 Jan 2020 01:51:21 -0800 (PST)
Received: from [10.1.2.12] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o2sm1427161wmh.46.2020.01.23.01.51.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2020 01:51:21 -0800 (PST)
Subject: Re: [PATCH 3/3] clk: meson: gxbb: set audio output clock hierarchy
To:     Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org
Cc:     Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200122100451.2443153-1-jbrunet@baylibre.com>
 <20200122100451.2443153-4-jbrunet@baylibre.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <e5410775-aa5b-1aa7-7952-9c635512c0ba@baylibre.com>
Date:   Thu, 23 Jan 2020 10:51:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200122100451.2443153-4-jbrunet@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22/01/2020 11:04, Jerome Brunet wrote:
> The aiu devices peripheral clocks needs the aiu and aiu_glue clocks to
> operate. Reflect this hierarchy in the gxbb clock tree.
> 
> Fixes: 738f66d3211d ("clk: gxbb: add AmLogic GXBB clk controller driver")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/meson/gxbb.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
> index 47916c4f1700..5fd6a574f8c3 100644
> --- a/drivers/clk/meson/gxbb.c
> +++ b/drivers/clk/meson/gxbb.c
> @@ -2619,14 +2619,6 @@ static MESON_GATE(gxbb_spi, HHI_GCLK_MPEG0, 30);
>  static MESON_GATE(gxbb_i2s_spdif, HHI_GCLK_MPEG1, 2);
>  static MESON_GATE(gxbb_eth, HHI_GCLK_MPEG1, 3);
>  static MESON_GATE(gxbb_demux, HHI_GCLK_MPEG1, 4);
> -static MESON_GATE(gxbb_aiu_glue, HHI_GCLK_MPEG1, 6);
> -static MESON_GATE(gxbb_iec958, HHI_GCLK_MPEG1, 7);
> -static MESON_GATE(gxbb_i2s_out, HHI_GCLK_MPEG1, 8);
> -static MESON_GATE(gxbb_amclk, HHI_GCLK_MPEG1, 9);
> -static MESON_GATE(gxbb_aififo2, HHI_GCLK_MPEG1, 10);
> -static MESON_GATE(gxbb_mixer, HHI_GCLK_MPEG1, 11);
> -static MESON_GATE(gxbb_mixer_iface, HHI_GCLK_MPEG1, 12);
> -static MESON_GATE(gxbb_adc, HHI_GCLK_MPEG1, 13);
>  static MESON_GATE(gxbb_blkmv, HHI_GCLK_MPEG1, 14);
>  static MESON_GATE(gxbb_aiu, HHI_GCLK_MPEG1, 15);
>  static MESON_GATE(gxbb_uart1, HHI_GCLK_MPEG1, 16);
> @@ -2681,6 +2673,16 @@ static MESON_GATE(gxbb_ao_ahb_bus, HHI_GCLK_AO, 2);
>  static MESON_GATE(gxbb_ao_iface, HHI_GCLK_AO, 3);
>  static MESON_GATE(gxbb_ao_i2c, HHI_GCLK_AO, 4);
>  
> +/* AIU gates */
> +static MESON_PCLK(gxbb_aiu_glue, HHI_GCLK_MPEG1, 6, &gxbb_aiu.hw);
> +static MESON_PCLK(gxbb_iec958, HHI_GCLK_MPEG1, 7, &gxbb_aiu_glue.hw);
> +static MESON_PCLK(gxbb_i2s_out, HHI_GCLK_MPEG1, 8, &gxbb_aiu_glue.hw);
> +static MESON_PCLK(gxbb_amclk, HHI_GCLK_MPEG1, 9, &gxbb_aiu_glue.hw);
> +static MESON_PCLK(gxbb_aififo2, HHI_GCLK_MPEG1, 10, &gxbb_aiu_glue.hw);
> +static MESON_PCLK(gxbb_mixer, HHI_GCLK_MPEG1, 11, &gxbb_aiu_glue.hw);
> +static MESON_PCLK(gxbb_mixer_iface, HHI_GCLK_MPEG1, 12, &gxbb_aiu_glue.hw);
> +static MESON_PCLK(gxbb_adc, HHI_GCLK_MPEG1, 13, &gxbb_aiu_glue.hw);
> +
>  /* Array of all clocks provided by this provider */
>  
>  static struct clk_hw_onecell_data gxbb_hw_onecell_data = {
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
