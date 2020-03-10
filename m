Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A877E18039C
	for <lists+linux-clk@lfdr.de>; Tue, 10 Mar 2020 17:35:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbgCJQfF (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 10 Mar 2020 12:35:05 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34121 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbgCJQfF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 Mar 2020 12:35:05 -0400
Received: by mail-lj1-f196.google.com with SMTP id s13so5673740ljm.1;
        Tue, 10 Mar 2020 09:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PkvP9z4GUbrVZ+Tfo0OweyqTQfLrEzalHTdsi1faLQw=;
        b=YAqaHsxHZ7QEiP/RfzMh3wckjR70ykAPh05l2kvNDWqYE5p/ZxIXbaL2xmAeo2lW+a
         K32K5ISWWM0HdagOxCudNz+f8586xOz9nDF4cpULQtA5i/cnyzdfVCjzlC+nvwBxoTVi
         1JWvxhWgG6xDs02+afbKPbijZj1I0DjuvxhscAn51605ljPbPPpMsADAVS8uyMVXw7ey
         X8kDfLEJ5wTWBkuUg15ekNno9Nt4mOx3tvHM6crY/1pl6aZAVL5mLqvOT58elYmYddl8
         T3glE7ptcGLQmpI0sLPZT6GHNWqAHSsY93/pGS98eGG6R1tOySUBt9FCDNV03DmDwMvP
         VLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PkvP9z4GUbrVZ+Tfo0OweyqTQfLrEzalHTdsi1faLQw=;
        b=F6dpAPydcU6bkTMPp9MVTwjUOu7qoN2kJGu+qZ56A1f0teb9iRoliWu2iEdEbcIQ7l
         bLKKTNJCbVF336bg+9zI/z9F4S0pQucl11K3iI+5VphwVJnPObcMBFkAgqqMrWFOxbBF
         Gsz58v0r56A/H9yXGa6/ukb+dN6iufvqXLB3LrAeYesKAeR3DhaoiFIvsZGbLYYoIR85
         /1ruoFlQN0/Q4eA5M8wEklHYFg0AxbfMJQfZdrmiWqZwzmCBBihcfMwlA6pnNyluFySg
         RmAIyZcJT9xCuYewDe5TQaptST51I4nsDZSymmmFaW7HvzniPr4nzqIHkp9ZjxIejJXN
         IvZg==
X-Gm-Message-State: ANhLgQ0JQ87qkjTjZMf6mEpQ7o9RSBhKD3alItYyMOuIWD6LkT+GVWFn
        iMXh8izhd50rDJIDfhZO5as=
X-Google-Smtp-Source: ADFU+vtOmqlz7i+eUMH7qZq9/leMubPKixzxvFNQR0VR0HogobgrjeXrBnGYpsTS6kGBKrP3xs99jg==
X-Received: by 2002:a2e:5ce:: with SMTP id 197mr4655291ljf.234.1583858103263;
        Tue, 10 Mar 2020 09:35:03 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.googlemail.com with ESMTPSA id a5sm23666109lfl.4.2020.03.10.09.35.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2020 09:35:02 -0700 (PDT)
Subject: Re: [PATCH v5 4/8] dt-bindings: memory: tegra: Add external memory
 controller binding for Tegra210
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
 <20200310152003.2945170-5-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <67295862-0898-87d1-ddb2-660713501bca@gmail.com>
Date:   Tue, 10 Mar 2020 19:35:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200310152003.2945170-5-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

10.03.2020 18:19, Thierry Reding пишет:
> From: Joseph Lo <josephl@nvidia.com>
> 
> Add the binding document for the external memory controller (EMC) which
> communicates with external LPDDR4 devices. It includes the bindings of
> the EMC node and a sub-node of EMC table which under the reserved memory
> node. The EMC table contains the data of the rates that EMC supported.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v5:
> - convert to dt-schema

...

> +  memory-region:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to a reserved memory region describing the table of EMC
> +      frequencies trained by the firmware

Shouldn't the table's format be documented?
