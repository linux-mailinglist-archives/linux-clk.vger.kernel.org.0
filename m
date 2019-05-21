Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F0D3253C3
	for <lists+linux-clk@lfdr.de>; Tue, 21 May 2019 17:21:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728244AbfEUPVX (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 21 May 2019 11:21:23 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37407 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728099AbfEUPVW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 May 2019 11:21:22 -0400
Received: by mail-wm1-f65.google.com with SMTP id 7so3325205wmo.2
        for <linux-clk@vger.kernel.org>; Tue, 21 May 2019 08:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:cc:references:to:from:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=psODiRPIry9TFvhYlBsrcuLdv/RwGulasFFSBQnu2NU=;
        b=YdirzbDFRunUSp4QZI1bN/5FfGpbvG3c66qOjjhY53wh4yrRFy4zeOl96jxeSNTrIU
         Lf69ZF+uV3o2Vvx3UlCnWok3Evnppx9SRzB7sxZYYHgzrX6S6wdFtR4ggR4kaJchvZDb
         cAh0LG+kDmKCkEYEC5g3uG+7nUaKg8h27jiInGxmX/ow4Lbyjpg9VPNlN6ln0rqHPJQY
         9bqw+NFxeUj48KtVPxmHhh1pz5mYDqONC8YhVg1C8AO8GNtO7cateG0lPZkJUCDBJ6MK
         xgWtF5MJscDnb1PA2hX3H4NWQgjFRtvAIXm7EQvDFLlES/q+0ZHvJMV5T4gJlms8v87b
         /sLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:cc:references:to:from:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=psODiRPIry9TFvhYlBsrcuLdv/RwGulasFFSBQnu2NU=;
        b=gIV6pKNSlJaJr3E/uQ0iGSAd9iNiizgdyXJY3hi5ow1N8aO22bg49mX+VmCqxArXlE
         K+xlUilpjDKrrF/KK09P3qiEvYARDPknNHrKsHtsUo6Ozw2ujcZn6VxiREEagetdiAZP
         WShsEmzIQ7RtLA2OBONzDncHNL/XbQ0QUDhRo2kZvVUqKA2bTbaSgq8Xi9B0cqt29IOy
         O4Omziht8C/mTtATi/queLGARLJ20eqWF02JkXEAQp0cp99rjTdqzRrdm0W4sVX/pgAg
         fUtznCBmVondVH0ZGSYFCxBB6oZ8tENkgdlSGXMljOaCD8Cl1mjliqq/xnFR1scEeWRT
         k76Q==
X-Gm-Message-State: APjAAAUuFE9pIrdwUpjw9Ru3TpZWlXCvaHOTYFlcifE/PKAqpf+FBbf6
        OJzMrUTjoMePG4i7hg9sB/bMwg==
X-Google-Smtp-Source: APXvYqyDwmjzU/LyCH+BqYUmXknqeq+bhBz+HMmXMkNpV3WhUj+twpNnOMI+GxfqsBeFKTq8zgQ4IQ==
X-Received: by 2002:a1c:dc46:: with SMTP id t67mr4025021wmg.140.1558452079765;
        Tue, 21 May 2019 08:21:19 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id y132sm5417493wmd.35.2019.05.21.08.21.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 08:21:19 -0700 (PDT)
Subject: Re: [PATCH 0/3] clk: meson: add support for Amlogic G12A
Cc:     jbrunet@baylibre.com, linux-clk@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20190521150130.31684-1-narmstrong@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <2fd7816a-de5e-c42f-a825-9552d8e79d34@baylibre.com>
Date:   Tue, 21 May 2019 17:21:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190521150130.31684-1-narmstrong@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21/05/2019 17:01, Neil Armstrong wrote:
> The Amlogic G12B SoC is very similar with the G12A SoC, sharing
> most of the features and architecture.
> G12B clock tree is very close, the main differences are :
> - SYS_PLL is used for the second cluster (otherwise used fir the first on G12a)
> - SYS_PLL1 is used for the first cluster (instead of SYS_PLL on G12a)
> - A duplicate CPU tree is added for the second cluster
> - G12A has additional clocks like for CSI an other components, not handled yet
> 
> Dependencies :
> - Patch 1, 3 : None
> - Patch 2 : Depends on Guillaume's Temperature sensor Clock patches at [1]
> 
> This patchset is a spinoff of the v2 Odroid-N2 megapatchset at [2]
> 
> Changes since original pathset :
> - Added missing sys1_pll div16, cpub div16 and cpub atb/axi/ahb/trace clocks
> - Rewrote "This patch .." in commit messages
> 
> [1] https://lkml.kernel.org/r/20190412100221.26740-1-glaroque@baylibre.com
> [2] https://lkml.kernel.org/r/20190423091503.10847-1-narmstrong@baylibre.com
> 
> Neil Armstrong (3):
>   dt-bindings: clk: meson: add g12b periph clock controller bindings
>   clk: meson: g12a: Add support for G12B CPUB clocks
>   clk: meson: g12a: mark fclk_div3 as critical
> 
>  .../bindings/clock/amlogic,gxbb-clkc.txt      |   1 +
>  drivers/clk/meson/g12a.c                      | 659 ++++++++++++++++++
>  drivers/clk/meson/g12a.h                      |  33 +-
>  3 files changed, 692 insertions(+), 1 deletion(-)
> 

And I forgot Martins reviews...
It should still apply to patch 1, patch 2 has changed with new clocks.

Neil
