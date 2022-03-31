Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 142FD4ED3F0
	for <lists+linux-clk@lfdr.de>; Thu, 31 Mar 2022 08:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbiCaGbN (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 31 Mar 2022 02:31:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231183AbiCaGbM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 31 Mar 2022 02:31:12 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A24017057
        for <linux-clk@vger.kernel.org>; Wed, 30 Mar 2022 23:29:22 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id yy13so45961318ejb.2
        for <linux-clk@vger.kernel.org>; Wed, 30 Mar 2022 23:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=M7HnRXS8ki9auACx5m4t264mmjUE2bAJ8U4PZKnd4Ho=;
        b=gIutq7OiCYAR4J7scRouIcS85qZpcD3wP3KFhISUJKkMRweNyECinL3s6VWksrnTPL
         McNk7ELEplAZFydI9Ihx3pXyvb2DWGk669kxevLxwlmn7Itszsub3kmsr1cFU2okLvK/
         tv6ymHuwfrgJORnpLyy1FQpXtfMDoa5qM60AvIGx/hoggt7US2Mubbc/+W31tXakeU6g
         5n7+yzG6ejb4dx1G9rEFiYJHnBvgx7fz55gw1kgyHYAkG1CY5GvKoSpig5UDSoKLVWSS
         PsPgh8kkls9K1tDvYfgZfJ1Ww2smKOB1Jiik2u3F67WCpgjy14UJrgeFBlGQJzCzHDww
         b9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=M7HnRXS8ki9auACx5m4t264mmjUE2bAJ8U4PZKnd4Ho=;
        b=5rHzHWo1Somp7pPGAMU3iCP2UCrDN6gvP2rqSvpup9KatCqeQHeSVHLRf/1N6jiR8+
         DXbdknIODbAai4KuRob2V3ud3Vs29ahDEHRXYWRM5eodAxRkLNxzRtK1Y3Zewb7rnVM/
         FXMhMHSGSvEARQqLk5S2p9RTkXG4iUgFRaVb/w5kw43dfvDu1eYmI6GlbXdsui+5+vci
         T0SnwXyPbQFimwbkeMlg1bUAL8+OaE/gLCr4ibNqTi5bgQn32pxpSkeoDBiM6L/CrCuP
         7GflS5Lq03WnqWwn99oSXzCF6Uy6o3sJPBC4ohXOh5V73Z/k0/BlElIRVn9dmjePSg+Y
         HoGA==
X-Gm-Message-State: AOAM532i3olg8CwmJtXcUvB+UnygC3+7P7G/vqlyhGooemAl/8ysSnCK
        5fIKVdA6Ji+I+rAjmmJjwISgmg==
X-Google-Smtp-Source: ABdhPJwevveOArflEso+HTdUotyheR45XpywF2kU6sgy5+5pNxmXLHHbHCqLA7sF9nDwnvz7C0JDEg==
X-Received: by 2002:a17:907:7ea6:b0:6db:ca53:9b0a with SMTP id qb38-20020a1709077ea600b006dbca539b0amr3506829ejc.763.1648708160890;
        Wed, 30 Mar 2022 23:29:20 -0700 (PDT)
Received: from [192.168.0.165] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id ep16-20020a1709069b5000b006daa26de2fbsm8894521ejc.153.2022.03.30.23.29.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Mar 2022 23:29:20 -0700 (PDT)
Message-ID: <866c6b42-434d-e7db-5319-2256cd7003d7@linaro.org>
Date:   Thu, 31 Mar 2022 08:29:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] dt-bindings: clock: add binding for MA35D1 clock
 controller
Content-Language: en-US
To:     Jacky Huang <ychuang3@nuvoton.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     robh+dt@kernel.org, sboyd@kernel.org, krzk+dt@kernel.org,
        arnd@arndb.de, olof@lixom.net, soc@kernel.org, cfli0@nuvoton.com
References: <20220331024256.14762-1-ychuang3@nuvoton.com>
 <20220331024256.14762-2-ychuang3@nuvoton.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220331024256.14762-2-ychuang3@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 31/03/2022 04:42, Jacky Huang wrote:
> Add the dt-bindings header for Nuvoton MA35D1, that gets shared
> between the clock controller and clock references in the dts.
> 
> Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
> ---
>  .../dt-bindings/clock/nuvoton,ma35d1-clk.h    | 262 ++++++++++++++++++
>  1 file changed, 262 insertions(+)
>  create mode 100644 include/dt-bindings/clock/nuvoton,ma35d1-clk.h
> 
> diff --git a/include/dt-bindings/clock/nuvoton,ma35d1-clk.h b/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
> new file mode 100644
> index 000000000000..3634e5edcac5
> --- /dev/null
> +++ b/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
> @@ -0,0 +1,262 @@
> +/* SPDX-License-Identifier: GPL-2.0+ OR MIT */

Can you make it the same license as bindings?

> +/*
> + * Copyright (c) 2022 Nuvoton Technology Corporation.
> + */
> +
> +#ifndef __DT_BINDINGS_MA35D1_CLK_H
> +#define __DT_BINDINGS_MA35D1_CLK_H
> +
> +/* Clock Sources */
> +/* External and Internal oscillator clocks */
> +#define	HXT		0

One space after '#define'. Please do not introduce some non-Linux coding
style.


Best regards,
Krzysztof
