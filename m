Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3B247C5F5B
	for <lists+linux-clk@lfdr.de>; Wed, 11 Oct 2023 23:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233451AbjJKVuE (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 11 Oct 2023 17:50:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233476AbjJKVuD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Oct 2023 17:50:03 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4A23AF
        for <linux-clk@vger.kernel.org>; Wed, 11 Oct 2023 14:50:00 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1c9b70b9671so26405ad.1
        for <linux-clk@vger.kernel.org>; Wed, 11 Oct 2023 14:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697061000; x=1697665800; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q+FQ1PxZIQRp4/KHDCbz/0g2JaoZfFRjVNf3hF2mjkQ=;
        b=ul1WWaWOJ+gnTXtvAkY5RLmrblUI8YFTMS2GmJksSwA/uyBmmoqbrafWq7vKHStIrb
         SY6rmHShMLSUqgpL0+53rbxOGRaLYnf8zdMZi4VIpYXz4mEmQ5qi4XpGtHtoqMtgErBp
         qM3TWMUtMkbpeWOz8kWSKKyP9j3XPzl7r5L5nF3XFL5eZpy6i6qIRuiNren0IQSbrNj2
         qnfYf7Gwcz+usKOiAMgDrbBK0wSEjPUGQd6nDJpq306sdzx7gyMUAvjqcKtWqwcgV2QT
         tiQ18mhBmpLjYw+CwxE65QjklwBuNpKCZGdMkba4qK9SkCIdiqzT9u7zvYfz6oXjOs4O
         S4YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697061000; x=1697665800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+FQ1PxZIQRp4/KHDCbz/0g2JaoZfFRjVNf3hF2mjkQ=;
        b=Uh9t1KLXwwqlcAXAoODEb+KRJVICIxeHJs8cE/6rnhQg7KskoGrNRCEDSslCNFYhZP
         qAcY4LHP6TOD2B9q1qd4zkUrgvx9XbXjQ/0C9rz9JWyCTB47Zn2BzTOnekNni3cP4zWO
         li1EbMtDwxE33VOh6m68y1OWDwNlIzM3/oQPEqIs1cWZHVo9xuKv7LD1yl5fHIpSCPVu
         WTy/Rykt2e+yGVVf3/I8Xk3k4zEeP/mZcTF/ju3YMlzlyNVS2ftV4XnkwTRtZErxfq6U
         44berqDisHCGYrLhvOHOLYGl6jeKW5rTE9kxRFPLcXhdxcy3cwnuzzjYDcS3dRXSr4bI
         rJqQ==
X-Gm-Message-State: AOJu0YwdXQyjdrck7CK57oE8IsBxtlcuyNmcc5A0yCmQy0TYV/MTvKtg
        VEoOORovOspoZ9oG306gbRbuPQ==
X-Google-Smtp-Source: AGHT+IGinPY/tFf+0f9GFuGm3RTh5SBeTN/3JrvMbT+Y6qmoNqGKpXr39lWagJzgXj1qx6Vq8mefbw==
X-Received: by 2002:a17:902:654f:b0:1c9:b5cf:6a78 with SMTP id d15-20020a170902654f00b001c9b5cf6a78mr307222pln.27.1697060999931;
        Wed, 11 Oct 2023 14:49:59 -0700 (PDT)
Received: from google.com (13.65.82.34.bc.googleusercontent.com. [34.82.65.13])
        by smtp.gmail.com with ESMTPSA id m6-20020a170902db0600b001c5fe217fb9sm302800plx.267.2023.10.11.14.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 14:49:59 -0700 (PDT)
Date:   Wed, 11 Oct 2023 14:49:56 -0700
From:   William McVicker <willmcvicker@google.com>
To:     Peter Griffin <peter.griffin@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 09/20] clk: samsung: clk-pll: Add support for
 pll_{0516,0517,518}
Message-ID: <ZScYhAUn76ceCRJb@google.com>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-10-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011184823.443959-10-peter.griffin@linaro.org>
X-Spam-Status: No, score=-15.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 10/11/2023, Peter Griffin wrote:
> These plls are found in the Tensor gs101 SoC found in the Pixel 6.
> 
> pll0516x: Integer PLL with high frequency
> pll0517x: Integer PLL with middle frequency
> pll0518x: Integer PLL with low frequency
> 
> PLL0516x
> FOUT = (MDIV * 2 * FIN)/PDIV * 2^SDIV)
> 
> PLL0517x and PLL0518x
> FOUT = (MDIV * FIN)/PDIV*2^SDIV)
> 
> The PLLs are similar enough to pll_0822x that the same code can handle
> both. The main difference is the change in the fout formula for the
> high frequency 0516 pll.
> 
> Locktime for 516,517 & 518 is 150 the same as the pll_0822x lock factor.
> MDIV, SDIV PDIV masks and bit shifts are also the same as 0822x.
> 
> When defining the PLL the "con" parameter should be set to CON3
> register, like this
> 
> PLL(pll_0517x, CLK_FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
>     PLL_LOCKTIME_PLL_SHARED0, PLL_CON3_PLL_SHARED0,
>     NULL),
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Tested-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

> ---
>  drivers/clk/samsung/clk-pll.c | 9 ++++++++-
>  drivers/clk/samsung/clk-pll.h | 3 +++
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
> index 74934c6182ce..4ef9fea2a425 100644
> --- a/drivers/clk/samsung/clk-pll.c
> +++ b/drivers/clk/samsung/clk-pll.c
> @@ -442,7 +442,11 @@ static unsigned long samsung_pll0822x_recalc_rate(struct clk_hw *hw,
>  	pdiv = (pll_con3 >> PLL0822X_PDIV_SHIFT) & PLL0822X_PDIV_MASK;
>  	sdiv = (pll_con3 >> PLL0822X_SDIV_SHIFT) & PLL0822X_SDIV_MASK;
>  
> -	fvco *= mdiv;
> +	if (pll->type == pll_0516x)
> +		fvco = fvco * 2 * mdiv;
> +	else
> +		fvco *= mdiv;
> +
>  	do_div(fvco, (pdiv << sdiv));
>  
>  	return (unsigned long)fvco;
> @@ -1316,6 +1320,9 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
>  	case pll_1417x:
>  	case pll_0818x:
>  	case pll_0822x:
> +	case pll_0516x:
> +	case pll_0517x:
> +	case pll_0518x:
>  		pll->enable_offs = PLL0822X_ENABLE_SHIFT;
>  		pll->lock_offs = PLL0822X_LOCK_STAT_SHIFT;
>  		if (!pll->rate_table)
> diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
> index 0725d485c6ee..ffd3d52c0dec 100644
> --- a/drivers/clk/samsung/clk-pll.h
> +++ b/drivers/clk/samsung/clk-pll.h
> @@ -38,6 +38,9 @@ enum samsung_pll_type {
>  	pll_0822x,
>  	pll_0831x,
>  	pll_142xx,
> +	pll_0516x,
> +	pll_0517x,
> +	pll_0518x,
>  };
>  
>  #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
> -- 
> 2.42.0.655.g421f12c284-goog
> 
