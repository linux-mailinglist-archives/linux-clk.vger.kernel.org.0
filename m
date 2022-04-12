Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FCE74FE01C
	for <lists+linux-clk@lfdr.de>; Tue, 12 Apr 2022 14:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352892AbiDLMaq (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 12 Apr 2022 08:30:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346287AbiDLMaJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Apr 2022 08:30:09 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E8212BF8
        for <linux-clk@vger.kernel.org>; Tue, 12 Apr 2022 04:47:15 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id t25so9341273edt.9
        for <linux-clk@vger.kernel.org>; Tue, 12 Apr 2022 04:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=3ZBe2UI/IslnMm4vNrYAyeJAKr/XzcUBDJoV5P5TXjU=;
        b=xkxq5K+M01SnEpi+OkJhINz4GSKGG/aUwqkC4DIdbkHMKJSDsNkfQ+mTXEm3JkkRNs
         ToP/S5th556ebhMJoQh89oOI99MBU5GenL/Ccl2Mf5tePNKjz7c7T8UJEagM+3BQkm7Q
         o9VwQQjoG3XDuR+tgiDlMhGGxheK9IJbbB/zdhrl5i5YbyIHlkiyN3eEOORUTG8jr8c+
         fQyqCxi7q9Smombr50+qnFomVnveH32fO0fhGrFLCxmP8b87yrhB2WR/UUgjzJ15e2Y1
         upE1/C3EkwqwFm/qf+uvr5wY14I84kJ/GuBEF3srrHQIbPsyHuX78oBs/KyI9SnPN2fY
         eG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3ZBe2UI/IslnMm4vNrYAyeJAKr/XzcUBDJoV5P5TXjU=;
        b=U+tWUY7P+En9o8oTnjSJDrsBN2p9z6Em+0mQGoCb4KqD9quy4n3uBxU8escTYcI+C8
         KMNWpXeaV5ENRjL/LF0EqTTCo1EewT6TmVk/Zf944ikblBIQS759ciBppgv8eslLToZI
         fnhddwVXWrYNZdiDijfoYyL5rO1JqB87rz8WIKs6VpedRxtl/ACeplsS9DdaQyPLNX0L
         ngfQeeADgITjlArpynIciqvMPS9qfXrYdyiNIdf4/NB6CMTTZqgNUK3/QpkM1k/POYak
         9ZuSH97J+cbbPCK8ik2W2PA+9cWliBS05ORD3EucF4ogQjIGGIxMasxlLN3hrGaVQWUJ
         D1+g==
X-Gm-Message-State: AOAM530fxfKVZgWHru0DYFTvDqQFynmj7qOYr0+HhqVJEn+kPFYUik0W
        rEMF2aSezbP0K/rGU+TTlxuxlQ==
X-Google-Smtp-Source: ABdhPJyuM+yTwaajJ+f4BiBiRxF6twYTWCzCNDEU3R6vTPvPXkK55R8XhnK/ZwOuefqSsHqlU2ULJg==
X-Received: by 2002:a05:6402:42d4:b0:416:5cac:a9a0 with SMTP id i20-20020a05640242d400b004165caca9a0mr39147459edc.86.1649764033740;
        Tue, 12 Apr 2022 04:47:13 -0700 (PDT)
Received: from [192.168.0.195] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id lb4-20020a170907784400b006e0d13f65e5sm13067104ejc.167.2022.04.12.04.47.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 04:47:13 -0700 (PDT)
Message-ID: <d49f38e7-5fd9-4e9a-cc20-2c839eb53712@linaro.org>
Date:   Tue, 12 Apr 2022 13:47:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 5/9] dt-bindings: clk: mpfs: add defines for two new
 clocks
Content-Language: en-US
To:     Conor Dooley <conor.dooley@microchip.com>, mturquette@baylibre.com,
        sboyd@kernel.org, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
        palmer@rivosinc.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        krzk+dt@kernel.org
Cc:     daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-riscv@lists.infradead.org
References: <20220411085916.941433-1-conor.dooley@microchip.com>
 <20220411085916.941433-6-conor.dooley@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220411085916.941433-6-conor.dooley@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 11/04/2022 10:59, Conor Dooley wrote:
> The RTC reference and MSSPLL were previously not documented or defined,
> as they were unused. Add their defines to the PolarFire SoC header.
> 
> Fixes: 2145bb687e3f ("dt-bindings: clk: microchip: Add Microchip PolarFire host binding")
> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  include/dt-bindings/clock/microchip,mpfs-clock.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/clock/microchip,mpfs-clock.h b/include/dt-bindings/clock/microchip,mpfs-clock.h
> index 73f2a9324857..3cba46b9191f 100644
> --- a/include/dt-bindings/clock/microchip,mpfs-clock.h
> +++ b/include/dt-bindings/clock/microchip,mpfs-clock.h
> @@ -1,15 +1,18 @@
>  /* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>  /*
>   * Daire McNamara,<daire.mcnamara@microchip.com>
> - * Copyright (C) 2020 Microchip Technology Inc.  All rights reserved.
> + * Copyright (C) 2020-2022 Microchip Technology Inc.  All rights reserved.
>   */
>  
>  #ifndef _DT_BINDINGS_CLK_MICROCHIP_MPFS_H_
>  #define _DT_BINDINGS_CLK_MICROCHIP_MPFS_H_
>  
> +#define CLK_MSSPLL	34

You have some weird order here. Shouldn't it be under CLK_RTCREF?

> +
>  #define CLK_CPU		0
>  #define CLK_AXI		1
>  #define CLK_AHB		2
> +#define CLK_RTCREF	33
>  
>  #define CLK_ENVM	3
>  #define CLK_MAC0	4


Best regards,
Krzysztof
