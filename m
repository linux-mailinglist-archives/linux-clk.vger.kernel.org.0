Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6628FAC105
	for <lists+linux-clk@lfdr.de>; Fri,  6 Sep 2019 21:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387948AbfIFTzd (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 6 Sep 2019 15:55:33 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37077 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727604AbfIFTzd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 6 Sep 2019 15:55:33 -0400
Received: by mail-pg1-f196.google.com with SMTP id d1so4093839pgp.4
        for <linux-clk@vger.kernel.org>; Fri, 06 Sep 2019 12:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SILWfPQITEzQzHWNNLecuPsDRy5q9AdLY606J6oClnY=;
        b=wBUgozjV2S8FwyBnHvJQ+1gJgURTKSDVqB7Nk18Pu+Ns0WCRaD5Qz1xqHLWOA7FhJY
         fuhfd+VqgDA9NJMzWrVNSDcverxN0exAISZIA2jQ+IDUnkodcEsxfHk+eBva5PEoYy7I
         QFfnkstGkvjKIHGhF2+l1OeiFHLRf9r4pO81AgT8/5heWSnAEEHijMGKAxO7V4motirf
         uUC8jFvNwLk8ijC4AjbV3ioYI9MPgORudTVCZ9aQX4bTsPwh44INcr3mxGyghgfJ34fM
         2ozpSGNpCQH73XIgc4g1Q539+Y7x8bT9fc7jZVbPubLLyx1xNfYHiggH0ttniMxsfOJY
         unbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SILWfPQITEzQzHWNNLecuPsDRy5q9AdLY606J6oClnY=;
        b=GfsWUR8NKSVMTiYpseExfebblEE+pxmd6FmRFsDUVNRUgtKTlBBnyB1woG9/A59wxv
         oEC6aCEX5LWTuNTeMI5VJYa2vdioIjtdta1p4hEF0Mt0P/MHKXj+7EL8caiATi6IAxyx
         F0X9T9peKAEt5C7iREveZUh1RUmAtLVVl3tTl6XpbTp42z90Yva6KHPiU19PJX3sO6rz
         zSH1QOT/iwhERDkVFr2cOazEYXeIBiJRLrHutlXGgxRCrnLCt/HS9RUG9UkQUlsX4O7d
         CHzBHM88m30YQFOpELLjEa894v6MoIBiKiLLzkRiX7oNqz+NkCl8mE6lTZSmwfM6VbA5
         eZsA==
X-Gm-Message-State: APjAAAUN07fRIEz6yZDAdPaOgAl8F9BD7wSWXKUUhs2NEqvPEreuL3pN
        d+2D4xZ62BxH56JgDefQuDVH9xIzMqs=
X-Google-Smtp-Source: APXvYqwpEiMWv0H5jMTp38VaSKOOXBrv+k5VQce5ea6KjMiUXukVdvL3FUJXnkCRsGi8KsTeJve2hw==
X-Received: by 2002:a17:90a:fc8d:: with SMTP id ci13mr11340584pjb.32.1567799732669;
        Fri, 06 Sep 2019 12:55:32 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v66sm7480460pfv.79.2019.09.06.12.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2019 12:55:32 -0700 (PDT)
Date:   Fri, 6 Sep 2019 12:55:29 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-qcs404: Use floor ops for sdcc clks
Message-ID: <20190906195529.GF11938@tuxbook-pro>
References: <20190906045659.20621-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190906045659.20621-1-vkoul@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu 05 Sep 21:56 PDT 2019, Vinod Koul wrote:

> Update the gcc qcs404 clock driver to use floor ops for sdcc clocks. As
> disuccsed in [1] it is good idea to use floor ops for sdcc clocks as we
> dont want the clock rates to do round up.
> 
> [1]: https://lore.kernel.org/linux-arm-msm/20190830195142.103564-1-swboyd@chromium.org/
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/clk/qcom/gcc-qcs404.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
> index e12c04c09a6a..bd32212f37e6 100644
> --- a/drivers/clk/qcom/gcc-qcs404.c
> +++ b/drivers/clk/qcom/gcc-qcs404.c
> @@ -1057,7 +1057,7 @@ static struct clk_rcg2 sdcc1_apps_clk_src = {
>  		.name = "sdcc1_apps_clk_src",
>  		.parent_names = gcc_parent_names_13,
>  		.num_parents = 5,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_floor_ops,
>  	},
>  };
>  
> @@ -1103,7 +1103,7 @@ static struct clk_rcg2 sdcc2_apps_clk_src = {
>  		.name = "sdcc2_apps_clk_src",
>  		.parent_names = gcc_parent_names_14,
>  		.num_parents = 4,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_floor_ops,
>  	},
>  };
>  
> -- 
> 2.20.1
> 
