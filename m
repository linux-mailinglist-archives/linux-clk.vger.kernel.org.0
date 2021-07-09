Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2693C294B
	for <lists+linux-clk@lfdr.de>; Fri,  9 Jul 2021 20:55:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbhGIS5t (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 9 Jul 2021 14:57:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230159AbhGIS5s (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Jul 2021 14:57:48 -0400
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13AB1C0613E6
        for <linux-clk@vger.kernel.org>; Fri,  9 Jul 2021 11:55:04 -0700 (PDT)
Received: by mail-oo1-xc2a.google.com with SMTP id i2-20020a4a2b020000b0290259a8e94329so2510547ooa.4
        for <linux-clk@vger.kernel.org>; Fri, 09 Jul 2021 11:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1K+xoVz58iBdO39CQMNTtGPC/ZeVc5A45vqS5gYFJGM=;
        b=GuCzPokbgAdVTrYpnFAeUxfj8RcaczoXnUm0EMsnBXnp9RpFloJlGyNADVvguVXlhJ
         vSun0fqOzWq8X/fkSZXc/FJ2f1HbZ2PIWfE098I5YVEIdnF+7D3XSiT0S/IDkpHrpPjQ
         JRru2woepUh+aIjRMgZUDc2wVIdv0S0twIXewxTq5Td4aigguQcl2b8RcYwiATKqFC7d
         ZDb50X5bCDsxmuiZrn9lHvDXhr436wmidaTllqt7l3KR4OWfwb9Myc7HNMCSVOKUkPJs
         /HUDnwJOsExOul6KV/T14DYkhNbv/Rtevu0yzKhRXiBNLcb19sO76MlsKR3aomuiUaCx
         4gQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1K+xoVz58iBdO39CQMNTtGPC/ZeVc5A45vqS5gYFJGM=;
        b=HCjtDkfx4StzuCsGuwZKexa9A7eyjlIgTnJlJLOfgMWIbv/fGfxEzOc17JSmzHXTgd
         6Am06ucmeIz2YlXHXh4XELOEmiN+4mq9vEgCkrRIvJFAUZfRHBHONEMUcrPCakqNeTeE
         6Yd82UQKMtcE6kKTTkK0AGqjUZmIxLjieapOfUMj6cFxB8tTfJDjhXdtIELZ1tSxiv/K
         ebUlhWbmmaIda0lKNqzQ8WzKPa3uToSO1KTEbxpHlZR657rv9384V+/xNufA6W9O8ebE
         l6IcDI0NZO5oKHdV27w0MceIUNE/wS3LFbFnIUp6dmsU3ucVWooWyO9TYx8Xigbvd1HN
         JywA==
X-Gm-Message-State: AOAM532xKtgFOkcewQ/CeAf+40OEFANT2YmPQFn0DrbVLNnrYjApVnuJ
        AqZevjI5dCP4yBXQmDFZt+IQAw==
X-Google-Smtp-Source: ABdhPJw21+lm+HYE8ND1titJXCVsjMupTBPc1jmRtwNeiDwd14ZKhAmhhYAN3qIqENfMd1jZxYfqow==
X-Received: by 2002:a4a:ab07:: with SMTP id i7mr28303848oon.89.1625856903381;
        Fri, 09 Jul 2021 11:55:03 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z7sm1355314oih.31.2021.07.09.11.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 11:55:02 -0700 (PDT)
Date:   Fri, 9 Jul 2021 13:55:00 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/7] dt-bindings: clock: qcom,videocc: add mmcx power
 domain
Message-ID: <YOibhM9YIMIgft5N@yoga>
References: <20210709173202.667820-1-dmitry.baryshkov@linaro.org>
 <20210709173202.667820-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210709173202.667820-3-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri 09 Jul 12:31 CDT 2021, Dmitry Baryshkov wrote:

> On sm8250 videocc requires MMCX power domain to be powered up before
> clock controller's registers become available. For now sm8250 was using
> external regulator driven by the power domain to describe this
> relationship. Switch into specifying power-domain and required opp-state
> directly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  Documentation/devicetree/bindings/clock/qcom,videocc.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> index 567202942b88..db4ada6acf27 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> @@ -47,6 +47,11 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  power-domains:
> +    description:
> +      A phandle and PM domain specifier for the MMCX power domain.
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> @@ -61,6 +66,7 @@ additionalProperties: false
>  examples:
>    - |
>      #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
>      clock-controller@ab00000 {
>        compatible = "qcom,sdm845-videocc";
>        reg = <0x0ab00000 0x10000>;
> @@ -69,5 +75,6 @@ examples:
>        #clock-cells = <1>;
>        #reset-cells = <1>;
>        #power-domain-cells = <1>;
> +      power-domains = <&rpmhpd SM8250_MMCX>;
>      };
>  ...
> -- 
> 2.30.2
> 
