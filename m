Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A46034AF9D5
	for <lists+linux-clk@lfdr.de>; Wed,  9 Feb 2022 19:22:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239233AbiBISUJ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 9 Feb 2022 13:20:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238848AbiBIST6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 9 Feb 2022 13:19:58 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC2B0C05CB9B
        for <linux-clk@vger.kernel.org>; Wed,  9 Feb 2022 10:19:42 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id g19-20020a9d6213000000b005ab7489371aso2111791otj.6
        for <linux-clk@vger.kernel.org>; Wed, 09 Feb 2022 10:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pU0dqn8lnFCTNLGf/LH82EvPqHzjw/3SXlQybd6OXMg=;
        b=bgOvEokEIgRc/1F8RRAecOt3Dak+BR1J3f1O0/qQkELU7LCKZWzTk+UwchF5ihpMWK
         BMI7D4VxOsNfW4EOZyJ0HxKLy93u+eL86RcJ5g5+qK5TL3RjxqhabCR6VHCvyKBT4k1s
         o98e8kKfprxof12SNhGhWourxwmHQtkPVL9o1IIw5JOQgsX8FTMrfg7hKWe/SiUe9765
         RIYATVIKX6pvnnAt8WucRowPDtqqcaqtCyzmeXOAx27WtZ52mWRPf353ik1fp7L6DU/V
         P/3gAwUg52p2cdnqnuyQRG83Wbx77NrsGjiAoUjertMG5NVjlffpmTG+wjQkzbi5GfWX
         8Tug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pU0dqn8lnFCTNLGf/LH82EvPqHzjw/3SXlQybd6OXMg=;
        b=XwOEVrxNN0pAV9IOk5LwyfQjdZOJ8RXIAri2j63Upqy3n2/exoXB7a3h0202XK5pfA
         4tuxy6afQ8cyyXiKfxrwRTrc33Rn89fZScaWcgFU0r0M6bz8hGPjWvlt+V+qMviV/1Jl
         tw2SiARoipXzS60XeUv/1jckVSf21hChZEJ10LmlwoA1PAnyqx2gp0LjqVHMA046vMrC
         00I40yrpPzvdg3Ws/UKChfO5+s+0rkFY2VivBPgu5TP/gcyXzuc877VwyJvocqJBMjNs
         HSNdfEQqEai4uG1+seiqwz0VhDalscFCd2OjQagEd238gI9XXgQA+ZwS06G0ukaRuNHQ
         A/HQ==
X-Gm-Message-State: AOAM5326rzYJeGKkTQVZ08SBk6vBRkug5SqgYPJ9mR2Fmnef/einP68Y
        jPOFJp9UC4inpRkqBuFUMk0P8w==
X-Google-Smtp-Source: ABdhPJwBnwtWw3FzLlnwKnUqlADNBECdwZMQa9xRDt51B9Sn+3bP3c0oyp8I1OXZFPGcdzON9ZLN3g==
X-Received: by 2002:a9d:628a:: with SMTP id x10mr1422718otk.264.1644430782236;
        Wed, 09 Feb 2022 10:19:42 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id q11sm6959373oti.3.2022.02.09.10.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 10:19:41 -0800 (PST)
Date:   Wed, 9 Feb 2022 12:19:39 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette ? <mturquette@baylibre.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [v1 1/2] clk: qcom: gdsc: Use the default transition delay for
 GDSCs
Message-ID: <YgQFu2CkBjx3O2i5@builder.lan>
References: <20220209172513.17873-1-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220209172513.17873-1-tdas@codeaurora.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed 09 Feb 11:25 CST 2022, Taniya Das wrote:

> Do not update the transition delay and use the default reset values.
> 

Can you help me understand what "the transition delay" is? In particular
I would like to know which other platforms, past, present and future
should have this flag set - or not set.

> Fixes: 45dd0e55317cc ("clk: qcom: Add support for GDSCs)
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  drivers/clk/qcom/gdsc.c | 6 +++++-
>  drivers/clk/qcom/gdsc.h | 1 +
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index 7e1dd8ccfa38..e7b213450640 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -380,7 +380,11 @@ static int gdsc_init(struct gdsc *sc)
>  	 */
>  	mask = HW_CONTROL_MASK | SW_OVERRIDE_MASK |
>  	       EN_REST_WAIT_MASK | EN_FEW_WAIT_MASK | CLK_DIS_WAIT_MASK;
> -	val = EN_REST_WAIT_VAL | EN_FEW_WAIT_VAL | CLK_DIS_WAIT_VAL;
> +
> +	regmap_read(sc->regmap, sc->gdscr, &val);
> +
> +	if (!(sc->flags & DEFAULT_TRANSITION_DELAY))

Why is it a good idea to not have a transition delay other than the
default one on all the other gdscs?

Regards,
Bjorn

> +		val |= EN_REST_WAIT_VAL | EN_FEW_WAIT_VAL | CLK_DIS_WAIT_VAL;
>  	ret = regmap_update_bits(sc->regmap, sc->gdscr, mask, val);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
> index d7cc4c21a9d4..1bd3ecdd0b0a 100644
> --- a/drivers/clk/qcom/gdsc.h
> +++ b/drivers/clk/qcom/gdsc.h
> @@ -53,6 +53,7 @@ struct gdsc {
>  #define ALWAYS_ON	BIT(6)
>  #define RETAIN_FF_ENABLE	BIT(7)
>  #define NO_RET_PERIPH	BIT(8)
> +#define DEFAULT_TRANSITION_DELAY	BIT(9)
>  	struct reset_controller_dev	*rcdev;
>  	unsigned int			*resets;
>  	unsigned int			reset_count;
> --
> Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
> of the Code Aurora Forum, hosted by the  Linux Foundation.
> 
