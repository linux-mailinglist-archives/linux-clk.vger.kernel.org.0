Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68A4521CA75
	for <lists+linux-clk@lfdr.de>; Sun, 12 Jul 2020 18:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729101AbgGLQ4d (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 12 Jul 2020 12:56:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728882AbgGLQ4d (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 12 Jul 2020 12:56:33 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D073C08C5DD
        for <linux-clk@vger.kernel.org>; Sun, 12 Jul 2020 09:56:32 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id 1so4906975pfn.9
        for <linux-clk@vger.kernel.org>; Sun, 12 Jul 2020 09:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RoZLVftkUKnaYcMruWWsZbHBr7e1w4vlSaetUKLXTFc=;
        b=kAilNj0pa5MHzUf5mqnUrQ7Io4OPdEm3+GWctUqGgbEAqrKEONdzOgLEtnLUtC55G+
         TJtYT+cGSILGH69JxTvlt3yKTcXz6qHtcsydg5XT4UvB5YOx/f/sRub3Ay25mlOjAF/3
         Q7SsWrN/t2t/YSI2c956Kn0tOeQESIl/aBX/WxWsX5JBA8dwEW/V+tBePyy9k5DcPfvL
         iOxFXXiqwHcff6QE2/z7w3vFkUXjNvBfC7seQGaFda29Cd9pd0C+OBv/tEpAlByl9WYw
         TpJC2ksfwfQt93SyRngRVRgQXvhNBnLMoBNkmhoNSK8GbAez6vmaq7TDtGGx61hd60q4
         EvzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RoZLVftkUKnaYcMruWWsZbHBr7e1w4vlSaetUKLXTFc=;
        b=Nq36xCTr+6LpkAQZOARCIvhd6pKm77eHW+6eIlYBZTUr2MCICYxKU2CpwEEhAcE8NB
         u33goSI8md4aeovuGDyXQIEFJFYmh1Z469BMQKoWbIDvUvFqnViF6EQXlG8RGWSXGC60
         9tHgRbAT4ReNu1cliEFKHpGR0Gsoc49V54EjUuoyrGgxQdyEDY/uXIH4z5WWXgHqFAn6
         fM48RdOODOC6qaNI+zllY3oKQDn7JwdCZVGbOd6oeJyZ/gmhPmUIu2+HDlAkWR/HXQ8p
         SSfAxEj1MyLiVIaajlz0rX507oEpFaoyxGE9NMq9siyR54FbEIVJzKVygJm4aXOXBnP3
         5rlg==
X-Gm-Message-State: AOAM531uwbaw/yZR15CfS/c3rqt/wEENjvfz+I6SUuVRzwuMTDTW0QKj
        3FKslsclyJsTZAvmKez682G0fD1z4Q==
X-Google-Smtp-Source: ABdhPJzJFvcF/99ggPqX5iRKTo/N7UTdplTTfJ9WJ7cg6cZfaX40TZSERHNl3+HJgCvx/2u+fP6row==
X-Received: by 2002:a62:3583:: with SMTP id c125mr23840742pfa.158.1594572992302;
        Sun, 12 Jul 2020 09:56:32 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6c81:c187:70f5:3123:b5de:e77f])
        by smtp.gmail.com with ESMTPSA id p30sm12971935pfq.153.2020.07.12.09.56.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Jul 2020 09:56:31 -0700 (PDT)
Date:   Sun, 12 Jul 2020 22:26:25 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-actions@lists.infradead.org
Subject: Re: [PATCH v3 2/6] dt-bindings: clock: Add APB, DMAC, GPIO bindings
 for Actions S500 SoC
Message-ID: <20200712165625.GA6110@Mani-XPS-13-9360>
References: <cover.1593788312.git.cristian.ciocaltea@gmail.com>
 <67112af4f5bc0cc5e70ce8410feb369cc72972b8.1593788312.git.cristian.ciocaltea@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67112af4f5bc0cc5e70ce8410feb369cc72972b8.1593788312.git.cristian.ciocaltea@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Jul 03, 2020 at 08:05:08PM +0300, Cristian Ciocaltea wrote:
> Add the missing APB, DMAC and GPIO clock bindings constants for
> Actions Semi S500 SoC.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
> Changes in v3:
>  - Preserved the original values of the existing bindings and moved
>    the newly added constants bellow, as indicated by Stephen
> 
> Changes in v2:
>  - None
> 
>  include/dt-bindings/clock/actions,s500-cmu.h | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/clock/actions,s500-cmu.h b/include/dt-bindings/clock/actions,s500-cmu.h
> index 030981cd2d56..a250a52a6192 100644
> --- a/include/dt-bindings/clock/actions,s500-cmu.h
> +++ b/include/dt-bindings/clock/actions,s500-cmu.h
> @@ -72,7 +72,12 @@
>  #define CLK_NAND		52
>  #define CLK_ECC			53
>  #define CLK_RMII_REF		54
> +#define CLK_GPIO		55
>  
> -#define CLK_NR_CLKS	       (CLK_RMII_REF + 1)
> +/* system clock (part 2) */
> +#define CLK_APB			56
> +#define CLK_DMAC		57
> +
> +#define CLK_NR_CLKS		(CLK_DMAC + 1)
>  
>  #endif /* __DT_BINDINGS_CLOCK_S500_CMU_H */
> -- 
> 2.27.0
> 
