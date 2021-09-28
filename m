Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4A7541AEDA
	for <lists+linux-clk@lfdr.de>; Tue, 28 Sep 2021 14:21:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240615AbhI1MX0 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 28 Sep 2021 08:23:26 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:33306
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240535AbhI1MX0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Sep 2021 08:23:26 -0400
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C8429402FE
        for <linux-clk@vger.kernel.org>; Tue, 28 Sep 2021 12:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632831705;
        bh=OfxwTguAAwbeZQgJ80ueoQgTshBZ+S7XY57UrX7LQSQ=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=Rd0aVshdaryBtD77hiwU9t33H9sijF1oaX1t90jyDSp8LBnWoEPnsdIspUPEEqrbK
         WpV41NfVZupTGJp95ctnL0P2iJttlZlQbxhTiaxZN8YcitIq5ItrxCU5Iw5z7C/wE8
         GcWTyw6fqJI1NZVG/QI2KuF+GsLvhYYCGBbCph6qWnnhURjKqO71UODTJfr3qos6hC
         iFlfSrgJO7gsCJZ60Xklk0QVaKT2jinswL+P1aZpefHxdXXdC3rdkPqzCd9bkeeWKR
         HIUdLvaZXIgKH3loeAWn8XSMsQD7dotDgpRqvvtoc/CZDU1loKahY/irfQjMHSuOPl
         bxSFR4jLv/rYA==
Received: by mail-lf1-f72.google.com with SMTP id c6-20020a05651200c600b003fc6d39efa4so19153585lfp.12
        for <linux-clk@vger.kernel.org>; Tue, 28 Sep 2021 05:21:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OfxwTguAAwbeZQgJ80ueoQgTshBZ+S7XY57UrX7LQSQ=;
        b=s4oJ/OyhOJE+ALcacUj2/p4YisVDswpOh7iE/y5QWg3JftarS9u+h2Si9jbgoQZtda
         q93ihXgZOPc8uNvMNThFOFurj/bd+N2zqYKaV6JbfhiV5Mdl1p2D2pEvefCIeFEUo5sg
         rQp/tcuIASXRFN2U+U3xMzmTXzSPczp1d0XozYKMQAe4fqCCk2XX7MObfWLPJDamm1Tg
         1+OLM6l02SLSf80VRxuveOPdCq0VtAUbNoHdh8TrkAEGIVnJbC6puND1hrdSgIP+LXXu
         wF8cWwfw47wb0eWIJTKov0rJ3CKZsHdHR1uZi4HqDbyjQH4b6b2iUJE0YLKh9IdHROTj
         bPlA==
X-Gm-Message-State: AOAM533t0/z9a0U7Bt/7r3Y+NvSXp9+fd8LWOnhqrtVIjMJXr7pPzIHT
        T2n1T38vBC32JU8gPU4B3K76vsBbWnOPrlq5/QSSVHIoYbNGwiXVsaZHl+Al9+HW1VUBHBPfBPq
        Soj9EQZKTRpMZJxSKwAHXQins/LeRCykM4Hb7+w==
X-Received: by 2002:a05:6512:114d:: with SMTP id m13mr5424618lfg.303.1632831705080;
        Tue, 28 Sep 2021 05:21:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0vy5vZrqnYYaMKL16pGzHUs9IX7TEGREv9QsV/r46W3ZYpEP3iSl0+DfWN2eepyhKMjjDmg==
X-Received: by 2002:a05:6512:114d:: with SMTP id m13mr5424585lfg.303.1632831704789;
        Tue, 28 Sep 2021 05:21:44 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v138sm2097090lfa.120.2021.09.28.05.21.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Sep 2021 05:21:44 -0700 (PDT)
Subject: Re: [PATCH 06/12] regulator: dt-bindings: samsung,s5m8767: convert to
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
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
References: <20210928084949.27939-1-krzysztof.kozlowski@canonical.com>
 <20210928084949.27939-7-krzysztof.kozlowski@canonical.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <48ec9ee9-0fc6-4c25-3e3a-1395286ee89d@canonical.com>
Date:   Tue, 28 Sep 2021 14:21:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210928084949.27939-7-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28/09/2021 10:49, Krzysztof Kozlowski wrote:
> Convert the regulators of Samsung S5M8767 PMIC to DT schema format.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../bindings/regulator/samsung,s5m8767.txt    | 23 +----
>  .../bindings/regulator/samsung,s5m8767.yaml   | 83 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 85 insertions(+), 23 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml
> 
> diff --git a/Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt b/Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt
> index 6cd83d920155..a1c6eb6f07c8 100644
> --- a/Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt
> +++ b/Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt
> @@ -48,28 +48,7 @@ Additional properties required if either of the optional properties are used:
>     for dvs. The format of the gpio specifier depends in the gpio controller.
>  
>  
> -Names of regulators supported by S5M8767 device:
> -	- LDOn
> -		  - valid values for n are 1 to 28
> -		  - Example: LDO1, LDO2, LDO28
> -	- BUCKn
> -		  - valid values for n are 1 to 9.
> -		  - Example: BUCK1, BUCK2, BUCK9
> -Note: The 'n' in LDOn and BUCKn represents the LDO or BUCK number
> -as per the datasheet of device.
> -
> -
> -Optional properties of the nodes under "regulators" sub-node:
> - - op_mode: describes the different operating modes of the LDO's with
> -            power mode change in SOC. The different possible values are,
> -             0 - always off mode
> -             1 - on in normal mode
> -             2 - low power mode
> -             3 - suspend mode
> - - s5m8767,pmic-ext-control-gpios: (optional) GPIO specifier for one
> -                                   GPIO controlling this regulator
> -                                   (enable/disable); This is valid only
> -                                   for buck9.
> +

That's obviously not sufficient - I will remove full file in v2.

Best regards,
Krzysztof
