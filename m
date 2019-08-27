Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 508759DCA1
	for <lists+linux-clk@lfdr.de>; Tue, 27 Aug 2019 06:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729214AbfH0E3k (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 27 Aug 2019 00:29:40 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:41621 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729208AbfH0E3k (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Aug 2019 00:29:40 -0400
Received: by mail-pl1-f196.google.com with SMTP id m9so11103672pls.8
        for <linux-clk@vger.kernel.org>; Mon, 26 Aug 2019 21:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7lmFerACB7Z6QvTYKolUFXR5vC+xKCugzXKrGfIU7mY=;
        b=kT8GiffZSf53a/DI9bdAaYdzUPD1bjgnUX5/rTQA8ZUBkuYGXxeE5JQ3D5vEuD4LoA
         cds+yySpv9nTfnIcYB71WebWf9IAWjpXPT2t/ABvNnTHbF+XzgrEYvT8rBOlf37KXhkX
         mq6vwO/j+4jhQOBOQLViCmm03k/KUnxEDAFGFFyk7Nr3t/MwAr2asYVgq9w1ty5D0dLA
         L1XHGE+tZCbBA1dlKCT3RO7dOU7Rl2enNXTRHMstzTpTHH3S2NhzBQo9pKSWgxDD/m67
         lexXQRD4irGKk/xWpT2Ktn02LIrJcBQkbrP3nkJYxfiNIbCo+qjFoSN3kW30ihZBdOAa
         Nurw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7lmFerACB7Z6QvTYKolUFXR5vC+xKCugzXKrGfIU7mY=;
        b=pH7b5MFHNC6DM5JgL3bKSQ6WQaNsHnl7bFhEV7DAqWPp3NIUJojuVXXOnegFVTaSDX
         wWO/NZhHhLzsgwreWD4cdnkrZ5E1h5n2ank9JNBqy9tfSmSAFuKF2ArVlk+RII5wU+sw
         JiWVuUAzOOkd33FGUNnBcl96Ep080ggrH3CBC9TVLAf8LFDuxbRjzDuENTbXuRI/XyIe
         Izp9QWO0Q7oT87zKtiohzSWc90gXdRlncrCTBG2ubU62Tsm+zibs92gzK+HbzkZUotLa
         GPk70DBltuDYf3xrpK9h+NoHPJsR4y7uNNR+tTtvxBcvWC8NufS4bX4+WFfbW0iVoDOz
         p4oQ==
X-Gm-Message-State: APjAAAWXat4FO84wcD5XRe6DmgJTWm1V7qh4/VIgJKjw+duQVMsQqHQM
        SNreaAIXDHL+6JyS++WrIy9M0g==
X-Google-Smtp-Source: APXvYqykU9Iv3ReU8naBgaJ2xs2TesTPCnVvwbgNPtQhz7mPxdaOQfoSl6942Idr2I80B5d0YO55Cw==
X-Received: by 2002:a17:902:7c10:: with SMTP id x16mr8041902pll.181.1566880179166;
        Mon, 26 Aug 2019 21:29:39 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id g2sm15306925pfm.32.2019.08.26.21.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2019 21:29:38 -0700 (PDT)
Date:   Mon, 26 Aug 2019 21:31:29 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/4] clk: qcom: clk-rpmh: Convert to parent data scheme
Message-ID: <20190827043129.GB26807@tuxbook-pro>
References: <20190826173120.2971-1-vkoul@kernel.org>
 <20190826173120.2971-3-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190826173120.2971-3-vkoul@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon 26 Aug 10:31 PDT 2019, Vinod Koul wrote:

> Convert the rpmh clock driver to use the new parent data scheme by
> specifying the parent data for board clock.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/clk/qcom/clk-rpmh.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index c3fd632af119..35d55aee6a01 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -95,7 +95,10 @@ static DEFINE_MUTEX(rpmh_clk_lock);
>  		.hw.init = &(struct clk_init_data){			\
>  			.ops = &clk_rpmh_ops,				\
>  			.name = #_name,					\
> -			.parent_names = (const char *[]){ "xo_board" },	\
> +			.parent_data =  &(const struct clk_parent_data){ \
> +					.fw_name = "xo",		\
> +					.name = "xo_board",		\
> +			},						\
>  			.num_parents = 1,				\
>  		},							\
>  	};								\
> @@ -110,7 +113,10 @@ static DEFINE_MUTEX(rpmh_clk_lock);
>  		.hw.init = &(struct clk_init_data){			\
>  			.ops = &clk_rpmh_ops,				\
>  			.name = #_name_active,				\
> -			.parent_names = (const char *[]){ "xo_board" },	\
> +			.parent_data =  &(const struct clk_parent_data){ \
> +					.fw_name = "xo",		\
> +					.name = "xo_board",		\
> +			},						\
>  			.num_parents = 1,				\
>  		},							\
>  	}
> -- 
> 2.20.1
> 
