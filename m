Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9ECF1B9F72
	for <lists+linux-clk@lfdr.de>; Mon, 27 Apr 2020 11:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbgD0JLy (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 27 Apr 2020 05:11:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726815AbgD0JLx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Apr 2020 05:11:53 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 977B1C0610D6
        for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2020 02:11:53 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id x23so13188599lfq.1
        for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2020 02:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yBDkRvrTx74S5+gZjwEZ9iACmQsB1T2mQm+OV8dNjho=;
        b=raiJTN/HRYGaHVksUpfYX1wyYGDzcsdeCn7DrhKbOfDdjw/MLRxJJ8twCfPbR+Hi+d
         m8bbSAERhc78/7BNmN1M53+RrtZEJ6gtB3M4L/MvDLvZWeuPCjfITc/mc+iiDbRI3jjR
         G56jqF9qTkDPlKs5mhLYIS5vYGfrbcvcZP6AW/yU1q9cczrf8qBd6r6oWB5XL28M/Frw
         orziZWnsTcshI8t2j3gcbvEYPcMnUScLotRV1QDBsU66EKXEGD/B5hQGFC8FNcH0EZn5
         2nZz6AH/d9ZmaJHEkzCchnk/7O80CEbGvOIVKmb/R/WB+M2sfP/FfJQ89qshWJydfTWv
         l8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yBDkRvrTx74S5+gZjwEZ9iACmQsB1T2mQm+OV8dNjho=;
        b=pvxKZ2nm540N/rs1XhNBoypJjG2NfPYLru1vs24zE7wMmDQTnQGwNsQkG6SGMRBOYo
         ZFfZn1mJXgxzpJK0CIbLiXy6y8MbzquiauObE54RkvPIMOdQD4Ck1+4a7SJFzsGjtHNa
         igDeHJ+0egt7BQbrgMiRkQ1AsjVPqIXH62GtHpmM3vvQw6MvMP0iBokwH/2QBw/3fZrO
         YMQH63Y5lGoPU+27AUun0Duc0DVaXq94iOCzm8B4uK5FnHYc1nLUyE71h4lHwLY59UUV
         NCP4F9T+iycpH5H9/OJrd1QPXPfAVgC1EvCi2/lj0ueq+j7H+Wcb1oJZcZ0mzKGAOd6G
         klwg==
X-Gm-Message-State: AGi0PuYjCbFaBdhSA7V2WkojmO2tN5zeMsqGzf4l+sMKrbO7ST76GtB8
        Qa/KoLrgB+Kef/jm1Glj1HDM5Q==
X-Google-Smtp-Source: APiQypJyVX/9wGU9KkPKAbdOn5EfnQbiZMB1wIjiO7M9xszAG/gddAjg0bucMZClaTTySjGPgz8dTA==
X-Received: by 2002:ac2:5930:: with SMTP id v16mr14736464lfi.103.1587978712022;
        Mon, 27 Apr 2020 02:11:52 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:468e:1152:9c79:cdeb:725:5fa4? ([2a00:1fa0:468e:1152:9c79:cdeb:725:5fa4])
        by smtp.gmail.com with ESMTPSA id h6sm9088671ljj.29.2020.04.27.02.11.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2020 02:11:51 -0700 (PDT)
Subject: Re: [PATCH 2/8] dt-bindings: intc: Convert ingenic,intc.txt to YAML
To:     Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     od@zcrc.me, =?UTF-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-mips@vger.kernel.org
References: <20200426185856.38826-1-paul@crapouillou.net>
 <20200426185856.38826-2-paul@crapouillou.net>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <f865b39a-3e8d-a367-45b2-aa5e7412e81a@cogentembedded.com>
Date:   Mon, 27 Apr 2020 12:11:46 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200426185856.38826-2-paul@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello!

On 26.04.2020 21:58, Paul Cercueil wrote:

> Convert the ingenic,intc.txt doc file to ingenic,intc.yaml.
> 
> Some compatible strings now require a fallback, as the controller
> generally works the same across the SoCs families.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
[...]
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.yaml
> new file mode 100644
> index 000000000000..28b27e1a6e9d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/ingenic,intc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ingenic SoCs interrupt controller devicetree bindings
> +
> +maintainers:
> +  - Paul Cercueil <paul@crapouillou.net>
> +
> +properties:
> +  $nodename:
> +    pattern: "^interrupt-controller@[0-9a-f]+$"
> +
> +  compatible:
> +    oneOf:
> +      - enum:
> +        - ingenic,jz4740-intc
> +        - ingenic,jz4760-intc
> +        - ingenic,jz4780-intc
> +      - items:
> +        - enum:
> +          - ingenic,jz4775-intc
> +          - ingenic,jz4770-intc
> +        - const: ingenic,jz4760-intc
> +      - items:
> +        - const: ingenic,x1000-intc
> +        - const: ingenic,jz4780-intc
> +      - items:
> +        - const: ingenic,jz4725b-intc
> +        - const: ingenic,jz4740-intc
> +
> +  "#interrupt-cells":
> +    const: 1

    Do double quotes work the same as the single ones?

[...]

MBR, Sergei
