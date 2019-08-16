Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A90DF900AA
	for <lists+linux-clk@lfdr.de>; Fri, 16 Aug 2019 13:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbfHPLW3 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 16 Aug 2019 07:22:29 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:36301 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbfHPLW3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 16 Aug 2019 07:22:29 -0400
Received: by mail-pl1-f194.google.com with SMTP id g4so2350077plo.3
        for <linux-clk@vger.kernel.org>; Fri, 16 Aug 2019 04:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0q0Ad7FJUc5G6KGE6mqpIyMbRI+ItC5oZxqe4cglbIk=;
        b=AN6gN6oTYl5wNAYz5mVoQPpGa147CxFxA81isHGIEHx1eKOm37ltBtEpHyPU0Yx5eE
         aurdX3oSnHjrRXjdWWtY8jUA9AZ5vnb39ZTdrkfpW0d9geQ99ES0L6rxQpTuhaWDXzfi
         GREetGVy64Ty53lFBjuCqS0DKWJVO0HWnvvMzo7hFpyo53C1L8dwzZq0Y8hQA/LztXK4
         1ch+EGL+hTu5WR3mPGm/0KVY/R60SAyJbunKv25CjFp5WMkR7tIiQGJrz2eLi+klNSCw
         Bbj7G2yw8iIA3mHspeMLhnGqbeB848Xbgb7Nqy3zURFX5yZi0SV5n5ECSCQMDwCJC2wI
         bqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0q0Ad7FJUc5G6KGE6mqpIyMbRI+ItC5oZxqe4cglbIk=;
        b=PIabVHIyvuYIXV6WAEdoj4ZUWkptAMEqF7WJUu6jrwBdc56oJ0dSdJClchibTTaT6t
         8fHyAW5UC1h0dDJAv3mLmbjouyQ7jd0gNvMZB2829S+t7VgFA9tO1trimFGObymVTdRi
         J2rgNK+WbzULvQPHldsnxWJM7QWs6BbjevugDFUwDcCjueg6H1JnwIE6xV8ZjFC1FjuS
         kecH+5ytjcDLE+/BrcvOKbBDMlorJZVpIHoCNqy02vtqGUhuRAsW08glUlQHMRbNsqs3
         TFlrPyFeKH4fKkaKHH8K/NfPO0t70o6oM7R0NfjEtVdS9AXGEuYubwEwMw12cvSW0yVj
         eFDg==
X-Gm-Message-State: APjAAAXy4wov/QSZ7I/2yCJ6mQZvDgbdICa4L2jRtL8nw6dbr5xBO2Ky
        ua7Sq9HIFjwkfp7TbIxarSBf
X-Google-Smtp-Source: APXvYqyJLmgQMiFoRnIGMLMSlMn8oCRd6AjiddKEiYMvJBRSKTds5rIfzjyRzSZYp8S3OEMzsVWUCg==
X-Received: by 2002:a17:902:ab8e:: with SMTP id f14mr8950178plr.6.1565954548200;
        Fri, 16 Aug 2019 04:22:28 -0700 (PDT)
Received: from mani ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id m9sm9759918pgr.24.2019.08.16.04.22.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Aug 2019 04:22:27 -0700 (PDT)
Date:   Fri, 16 Aug 2019 16:52:10 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/9] clk: actions: Don't reference clk_init_data after
 registration
Message-ID: <20190816112210.GA27094@mani>
References: <20190731193517.237136-1-sboyd@kernel.org>
 <20190731193517.237136-2-sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190731193517.237136-2-sboyd@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jul 31, 2019 at 12:35:09PM -0700, Stephen Boyd wrote:
> A future patch is going to change semantics of clk_register() so that
> clk_hw::init is guaranteed to be NULL after a clk is registered. Avoid
> referencing this member here so that we don't run into NULL pointer
> exceptions.
> 
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---
> 
> Please ack so I can take this through clk tree
> 
>  drivers/clk/actions/owl-common.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/actions/owl-common.c b/drivers/clk/actions/owl-common.c
> index 32dd29e0a37e..71b683c4e643 100644
> --- a/drivers/clk/actions/owl-common.c
> +++ b/drivers/clk/actions/owl-common.c
> @@ -68,6 +68,7 @@ int owl_clk_probe(struct device *dev, struct clk_hw_onecell_data *hw_clks)
>  	struct clk_hw *hw;
>  
>  	for (i = 0; i < hw_clks->num; i++) {
> +		const char *name = hw->init->name;
>  

This should come after below statement and hence the warning is generated
in linux-next. Sorry for missing!

Thanks,
Mani

>  		hw = hw_clks->hws[i];
>  
> @@ -77,7 +78,7 @@ int owl_clk_probe(struct device *dev, struct clk_hw_onecell_data *hw_clks)
>  		ret = devm_clk_hw_register(dev, hw);
>  		if (ret) {
>  			dev_err(dev, "Couldn't register clock %d - %s\n",
> -				i, hw->init->name);
> +				i, name);
>  			return ret;
>  		}
>  	}
> -- 
> Sent by a computer through tubes
> 
