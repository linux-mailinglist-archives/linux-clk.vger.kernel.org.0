Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 721F641EB99
	for <lists+linux-clk@lfdr.de>; Fri,  1 Oct 2021 13:18:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353288AbhJALUU (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 1 Oct 2021 07:20:20 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:36898
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230216AbhJALUP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Oct 2021 07:20:15 -0400
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8335640600
        for <linux-clk@vger.kernel.org>; Fri,  1 Oct 2021 11:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633087110;
        bh=c6v/4qeCiawCEQ51bX3tsw9TJ7/8T8+FzX0Gq/a0zdo=;
        h=Subject:To:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=GXw0A/246X7qoa4WwfI7DmznycylOn11AnhCTrQNr/Wsy0Huv1ACpNbjc35XSpPY2
         2G0elpw7VGF7KUCeu4BuXqQ/Wjozpz2OaG+HGkHW/0sG5wHeeTsySp6uH9OXG5ym9D
         rFxu3EVtIL1+kWwMizv2J42FjHGE9oDQZqkbrZO7ezuy3yeweXe05BU8azrAVNyO6H
         Wh3SbfBXQItigGu85CG/4cJ3TRdoDEEpP90hQXeytJrNfkufOqPlisIufDxXg0wFea
         g5jtX05PFhddD0CxDkVQft9HosCGf8NrdlnL/40TV5oFGYnhROj3A5H3c2aHv3zKJl
         ITGOPyf8y25Gg==
Received: by mail-lf1-f71.google.com with SMTP id d22-20020a0565123d1600b003fd0097d747so8672665lfv.2
        for <linux-clk@vger.kernel.org>; Fri, 01 Oct 2021 04:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=c6v/4qeCiawCEQ51bX3tsw9TJ7/8T8+FzX0Gq/a0zdo=;
        b=uo0Cg6KSWCJphS3itjJlODjJ7lcARMNpOU+eUg6e+xCIMbKSjMzu/FKa99DP8dLcxQ
         GcXevTCL4OHTKyJmyxeNJmF5Jyw5fpTmynLD9HvlRvp/YLJLYq1qSl3VHg6d3Y/RWAxL
         IjnFH97PVM1rusBVal36oNet5a6FVOd9AKwedaZmOJVhoXd2s2EhvqGIMIJo5NHffdz9
         EwOqiAcnCFMuaxpFWzQaiO81HEN4sXm0c/RjxFwxGNxp8iUfznvC6Vv20RWsPOH9afvK
         0un3BsUqnMIj/DS4rJ/Nl+46T/pZBr3/hbmbQVd1ZyAa4oV8l/Nz8d0jfyZEcIjp6L+S
         ts9Q==
X-Gm-Message-State: AOAM530xwPH+PR8RVp39wN1Hu0QQzrZy7ZheFRUvb5VwrI6sE08+DOUY
        +7pjKGh3saqdnoRLLS95XvxQ26+Nqq1kpZznx1LZddg15aGqx2E4xuhsvAYqAFNUv8CoV6O2LkG
        8lgzYlSLGEPRILj4HoY+2kS91b1e+UZwdsIOnOQ==
X-Received: by 2002:a2e:bf1c:: with SMTP id c28mr11444053ljr.345.1633087109837;
        Fri, 01 Oct 2021 04:18:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuYT/ZjdN+eSAIczNq1zrKmj2TkagpSajT6fyogi+QsoqXKhasYq3k534Q6T34GSICI/U27w==
X-Received: by 2002:a2e:bf1c:: with SMTP id c28mr11444032ljr.345.1633087109622;
        Fri, 01 Oct 2021 04:18:29 -0700 (PDT)
Received: from [192.168.0.197] ([193.178.187.25])
        by smtp.gmail.com with ESMTPSA id b9sm629490ljq.87.2021.10.01.04.18.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Oct 2021 04:18:28 -0700 (PDT)
Subject: Re: [PATCH v2 09/10] dt-bindings: mfd: samsung,s5m8767: convert to
 dtschema
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20211001094106.52412-1-krzysztof.kozlowski@canonical.com>
 <20211001094106.52412-10-krzysztof.kozlowski@canonical.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <bf26dd28-cf5e-bc09-0b99-6666f9d73d69@canonical.com>
Date:   Fri, 1 Oct 2021 13:18:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211001094106.52412-10-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 01/10/2021 11:41, Krzysztof Kozlowski wrote:
> Convert the MFD part of Samsung S5M8767 PMIC to DT schema format.
> Previously the bindings were mostly in mfd/samsung,sec-core.txt.
> 
> Since all of bindings for Samsung S2M and S5M family of PMICs were
> converted from mfd/samsung,sec-core.txt to respective dtschema file,
> remove the former one.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../bindings/mfd/samsung,s5m8767.yaml         | 269 ++++++++++++++++++
>  .../bindings/mfd/samsung,sec-core.txt         |  86 ------
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 270 insertions(+), 87 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mfd/samsung,sec-core.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml b/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
> new file mode 100644
> index 000000000000..b2529a48c890
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
> @@ -0,0 +1,269 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/samsung,s5m8767.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung S5M8767 Power Management IC
> +
> +maintainers:
> +  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> +
> +description: |
> +  This is a part of device tree bindings for S2M and S5M family of Power
> +  Management IC (PMIC).
> +
> +  The Samsung S5M8767 is a Power Management IC which includes voltage
> +  and current regulators, RTC, clock outputs and other sub-blocks.
> +
> +properties:
> +  compatible:
> +    const: samsung,s5m8767-pmic
> +
> +  clocks:
> +    $ref: ../clock/samsung,s2mps11.yaml
> +    description:
> +      Child node describing clock provider.
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  regulators:
> +    $ref: ../regulator/samsung,s5m8767.yaml
> +    description:
> +      List of child nodes that specify the regulators.
> +
> +  s5m8767,pmic-buck2-dvs-voltage:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 8
> +    maxItems: 8
> +    description: |
> +      A set of 8 voltage values in micro-volt (uV) units for buck2 when
> +      changing voltage using gpio dvs.
> +
> +  s5m8767,pmic-buck3-dvs-voltage:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 8
> +    maxItems: 8
> +    description: |
> +      A set of 8 voltage values in micro-volt (uV) units for buck3 when
> +      changing voltage using gpio dvs.
> +
> +  s5m8767,pmic-buck4-dvs-voltage:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 8
> +    maxItems: 8
> +    description: |
> +      A set of 8 voltage values in micro-volt (uV) units for buck4 when
> +      changing voltage using gpio dvs.
> +
> +  s5m8767,pmic-buck-ds-gpios:
> +    minItems: 3
> +    maxItems: 3
> +    description: |
> +      GPIO specifiers for three host gpio's used for selecting GPIO DVS lines.
> +      It is one-to-one mapped to dvs gpio lines.
> +
> +  s5m8767,pmic-buck2-uses-gpio-dvs:
> +    type: boolean
> +    description: buck2 can be controlled by gpio dvs.
> +
> +  s5m8767,pmic-buck3-uses-gpio-dvs:
> +    type: boolean
> +    description: buck3 can be controlled by gpio dvs.
> +
> +  s5m8767,pmic-buck4-uses-gpio-dvs:
> +    type: boolean
> +    description: buck4 can be controlled by gpio dvs.
> +
> +  s5m8767,pmic-buck-default-dvs-idx:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array

There is a bug here - it's just uint32.

I will send a v3 later (feel free to review earlier, so I can accumulate
tags/comments).

> +    minimum: 0
> +    maximum: 7
> +    default: 0
> +    description: |
> +      Default voltage setting selected from the possible 8 options selectable
> +      by the dvs gpios. The value of this property should be between 0 and 7.
> +      If not specified or if out of range, the default value of this property
> +      is set to 0.
> +
Best regards,
Krzysztof
