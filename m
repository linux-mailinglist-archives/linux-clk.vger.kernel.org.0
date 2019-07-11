Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3268065937
	for <lists+linux-clk@lfdr.de>; Thu, 11 Jul 2019 16:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728695AbfGKOnP (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 11 Jul 2019 10:43:15 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:41384 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728629AbfGKOnP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Jul 2019 10:43:15 -0400
Received: by mail-pf1-f194.google.com with SMTP id m30so2863808pff.8
        for <linux-clk@vger.kernel.org>; Thu, 11 Jul 2019 07:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bVnXpkhdRXKYktl+iS83oNTlUAhPFObnKhn5LwokMJw=;
        b=PZ5eH3m7RNSLXRKexjamxhZJZMNP9oQiQvVuxRDtw+D/ARroDOjKRysZHlb3hjgV7H
         +OHnQYpdLV/spoUrGR/xtUx3I42+R02Ro/1dS5X7wPoWi23Yfi0V6MqtVZPC4xMheGaL
         pwUxFBL8lcHM4TvvDyfanulX+9K44w0WOpODtrdkRXKU+fO+XNgquQYjDohnPTKhHFyn
         8qyQF4IrY8XCVyxdrUuqcZGRJ4/aWbGCHKue63IF9WPU68/9IxfE3tfCeJi9t1UMeV5Q
         ukde9mAMmG8sz4B9tBM4TMd3G74FeEtSRQcNTlFiRHq/tKBkPuvEMCuWLtlvq8Vb5rkp
         /6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bVnXpkhdRXKYktl+iS83oNTlUAhPFObnKhn5LwokMJw=;
        b=QKSBkr5v0x82/QVYfo0Jw/VyY7C+n176PcrzWZdJWbXWbkvg06XvGhSeYVfC55LhMQ
         2tjzjCB6Y+0zywRbcV1oe5EsB/qn4jt8zsRYDegXbAPv0a+QifGGt/1gtz3OvrXc3Pdf
         Wi6PE+6NFN7onQ0ibi9FnokTn22ER3kwpgsFmOOHi4XrFFnuun694amX94n1Tjmh14Xj
         irzAxpL5f7te3vO0DYcsP54BpOAz90PglMwRLka34Jd6AKGsPzNu4d12vvuXGqJiYh/O
         QpN61FilYdhl/EN8ugq97B+EpS/jVamuGyYd1ZnXR7ObGQ8q05tP7rvAbpoDDGJjtq0o
         qJWw==
X-Gm-Message-State: APjAAAWAGMDxyEUQQmF8CLksNyXRltlWCLRgFFim2zl6g2yh1437P8fy
        HhdbKIdJKClwzkRLow91ton+Cw==
X-Google-Smtp-Source: APXvYqxu5aCDxjj3fkcv7rULRhrqZhb+7XDdmM9S1aURNZVTU+dFXJ+uf4wJfqTHgfPQXF/t8LDwGA==
X-Received: by 2002:a17:90a:bf02:: with SMTP id c2mr5310288pjs.73.1562856194457;
        Thu, 11 Jul 2019 07:43:14 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id g14sm6276112pgn.8.2019.07.11.07.43.12
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 11 Jul 2019 07:43:13 -0700 (PDT)
Date:   Thu, 11 Jul 2019 07:44:24 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc:     sboyd@kernel.org, david.brown@linaro.org, jassisinghbrar@gmail.com,
        mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org,
        will.deacon@arm.com, arnd@arndb.de, horms+renesas@verge.net.au,
        heiko@sntech.de, sibis@codeaurora.org,
        enric.balletbo@collabora.com, jagan@amarulasolutions.com,
        olof@lixom.net, vkoul@kernel.org, niklas.cassel@linaro.org,
        georgi.djakov@linaro.org, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
Subject: Re: [PATCH v3 02/14] mbox: qcom: add APCS child device for QCS404
Message-ID: <20190711144424.GD7234@tuxbook-pro>
References: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
 <20190625164733.11091-3-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190625164733.11091-3-jorge.ramirez-ortiz@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue 25 Jun 09:47 PDT 2019, Jorge Ramirez-Ortiz wrote:

> There is clock controller functionality in the APCS hardware block of
> qcs404 devices similar to msm8916.
> 
> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> ---
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> index 705e17a5479c..a05dc3aabac7 100644
> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> @@ -89,16 +89,18 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	if (of_device_is_compatible(np, "qcom,msm8916-apcs-kpss-global")) {
> -		apcs->clk = platform_device_register_data(&pdev->dev,
> -							  "qcom-apcs-msm8916-clk",
> -							  -1, NULL, 0);
> -		if (IS_ERR(apcs->clk))
> -			dev_err(&pdev->dev, "failed to register APCS clk\n");
> -	}
> -
>  	platform_set_drvdata(pdev, apcs);
>  
> +	if (!of_device_is_compatible(np, "qcom,msm8916-apcs-kpss-global") &&
> +	    !of_device_is_compatible(np, "qcom,qcs404-apcs-apps-global"))

If the remainder of the function was a long snippet I think this would
motivate the somewhat unusual early return. But I think it would be
cleaner to just add to the existing conditional.

Regards,
Bjorn

> +		return 0;
> +
> +	apcs->clk = platform_device_register_data(&pdev->dev,
> +						  "qcom-apcs-msm8916-clk",
> +						  -1, NULL, 0);
> +	if (IS_ERR(apcs->clk))
> +		dev_err(&pdev->dev, "failed to register APCS clk\n");
> +
>  	return 0;
>  }
>  
> -- 
> 2.21.0
> 
