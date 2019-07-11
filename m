Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E439A65A74
	for <lists+linux-clk@lfdr.de>; Thu, 11 Jul 2019 17:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728702AbfGKP3F (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 11 Jul 2019 11:29:05 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:47085 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728102AbfGKP3F (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Jul 2019 11:29:05 -0400
Received: by mail-pg1-f196.google.com with SMTP id i8so3093558pgm.13
        for <linux-clk@vger.kernel.org>; Thu, 11 Jul 2019 08:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PcMRy6X0HHSU2uwIcDv40X8gHtVe1fCLvC/RPbbBFw4=;
        b=VogL/o35kuGo3WvcW/9vQ/CmCcSo9r2owGFVwrFu27xYKAGlDQM88VY38U9w9AmJgW
         boamIRHIiQBG4PAGALOc7K0FtqCU6KXpqWIz5/1lWvFPzEwNc1dBocfNLQDezt80rcX+
         MvmAf8ekPVs3LZ9Xjk7hNP8oCmKd5RLpPng6wA/LDapUxGTXvc/Y4mRWQtX/XfRSu8++
         +kOWZhY+F/SPRPnHjaFeqWkVXDajd8OVccJUa+tk9zJN48IIUVIDt60ZxcCV2UXMlo3S
         cSW/pXxClE7zM0CdthbPUlJPlX57aUZLdnGWY2532RkdiYBRuXOwcKe0SxY6nsJREwIV
         T/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PcMRy6X0HHSU2uwIcDv40X8gHtVe1fCLvC/RPbbBFw4=;
        b=lxKWC50FGUqj3L0O2MtiJWfWHi+h9GZZ+6QhnCMdPTYt4XvBcBIktC02PTZP8HTLgy
         lHUxFOmVdDBf82Bt0SqQ2DXlEDMRquNVGRVkkojxjIy3qKHoXq+HSasKbKRIQ0lnT81V
         ALm5UIHz0k6Xd7qL/YA6gQmuHtCqKRUuYa3PfcdhN0wBpBubowSoeeYbGePOsRP5DTlP
         rumbyyE6e4NTTRrYfsuThfj6CxwJuefPdFWfWecAjMh5whzEoQe6CbnMra0HT5NLPrYp
         bStGWIcBrT+8sxqMRUTVegtY5+6zX5dwZrS0O47PozH8G9Ex9QK5ysTxH94eSN5b8jEu
         fXjQ==
X-Gm-Message-State: APjAAAVoBKr/HmP/vp0R/IpM0WmhCkdhY+VXfPPh4ib6kONXtw4F5pbP
        mcbivyHwvJZ/i+JB/Bhvh6UfMQ==
X-Google-Smtp-Source: APXvYqye77G4dqCcEDk9TrwQUc54J1XQtP5On/iH7qLF9Xse0wzIzE59xj0a6xO3SOJ4Hb76Q4idjA==
X-Received: by 2002:a65:62c4:: with SMTP id m4mr4876927pgv.243.1562858944051;
        Thu, 11 Jul 2019 08:29:04 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id s43sm8776852pjb.10.2019.07.11.08.29.01
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 11 Jul 2019 08:29:03 -0700 (PDT)
Date:   Thu, 11 Jul 2019 08:30:13 -0700
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
Subject: Re: [PATCH v3 01/14] clk: qcom: gcc: limit GPLL0_AO_OUT operating
 frequency
Message-ID: <20190711153013.GP7234@tuxbook-pro>
References: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
 <20190625164733.11091-2-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190625164733.11091-2-jorge.ramirez-ortiz@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue 25 Jun 09:47 PDT 2019, Jorge Ramirez-Ortiz wrote:

> Limit the GPLL0_AO_OUT_MAIN operating frequency as per its hardware
> specifications.
> 
> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Acked-by: Stephen Boyd <sboyd@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 8 ++++++++
>  drivers/clk/qcom/clk-alpha-pll.h | 1 +
>  drivers/clk/qcom/gcc-qcs404.c    | 2 +-
>  3 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index 0ced4a5a9a17..ef51f302bdf0 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -730,6 +730,14 @@ static long alpha_pll_huayra_round_rate(struct clk_hw *hw, unsigned long rate,
>  	return alpha_huayra_pll_round_rate(rate, *prate, &l, &a);
>  }
>  
> +const struct clk_ops clk_alpha_pll_fixed_ops = {
> +	.enable = clk_alpha_pll_enable,
> +	.disable = clk_alpha_pll_disable,
> +	.is_enabled = clk_alpha_pll_is_enabled,
> +	.recalc_rate = clk_alpha_pll_recalc_rate,
> +};
> +EXPORT_SYMBOL_GPL(clk_alpha_pll_fixed_ops);
> +
>  const struct clk_ops clk_alpha_pll_ops = {
>  	.enable = clk_alpha_pll_enable,
>  	.disable = clk_alpha_pll_disable,
> diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
> index 66755f0f84fc..6b4eb74706b4 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.h
> +++ b/drivers/clk/qcom/clk-alpha-pll.h
> @@ -104,6 +104,7 @@ struct alpha_pll_config {
>  };
>  
>  extern const struct clk_ops clk_alpha_pll_ops;
> +extern const struct clk_ops clk_alpha_pll_fixed_ops;
>  extern const struct clk_ops clk_alpha_pll_hwfsm_ops;
>  extern const struct clk_ops clk_alpha_pll_postdiv_ops;
>  extern const struct clk_ops clk_alpha_pll_huayra_ops;
> diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
> index 29cf464dd2c8..18c6563889f3 100644
> --- a/drivers/clk/qcom/gcc-qcs404.c
> +++ b/drivers/clk/qcom/gcc-qcs404.c
> @@ -330,7 +330,7 @@ static struct clk_alpha_pll gpll0_ao_out_main = {
>  			.parent_names = (const char *[]){ "cxo" },
>  			.num_parents = 1,
>  			.flags = CLK_IS_CRITICAL,
> -			.ops = &clk_alpha_pll_ops,
> +			.ops = &clk_alpha_pll_fixed_ops,
>  		},
>  	},
>  };
> -- 
> 2.21.0
> 
