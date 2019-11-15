Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C7E6FE382
	for <lists+linux-clk@lfdr.de>; Fri, 15 Nov 2019 18:00:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727543AbfKORA3 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 15 Nov 2019 12:00:29 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41859 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727540AbfKORA3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Nov 2019 12:00:29 -0500
Received: by mail-pl1-f195.google.com with SMTP id d29so5045441plj.8
        for <linux-clk@vger.kernel.org>; Fri, 15 Nov 2019 09:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6KJTXmV3nRW8gUbGqQ4GcrDPQULApXAqF7C+3pqi6RM=;
        b=lea72v0aKBO/HzkW9xRW0+gmfuKWuweJm8ZuZhTIE6ZspE9e3DdbgdeOqryeh2WpHs
         69VCzsotxdw11qrFs2/xzVdgNpKaC8lZYDeHIj6pnZlDX4VWEl4FWcoKYqGnAas8lUU4
         1dbEIwD9NKRURLHoHwSslyp2NZXgzpz91sk68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6KJTXmV3nRW8gUbGqQ4GcrDPQULApXAqF7C+3pqi6RM=;
        b=WIo2/gw6/wafP2pQVgsyo0jdVXOdm/YDdkAez/73mCpnb/8ofyknli9fIf6OpmiJXJ
         CR7wEtlbXIrq7m58/k9oLlrOdCE8tuy0OIZFrb47UZ56nl4MGMGceBHO8NYxJzFOip6g
         kwk/X9H2LCI/TilV5PmPagCIAVi3x1+T+UZOg1rGI7+J8t6wZwFcFKmY2cE5NwcVKP1E
         lU8K2+NrEoKEpHcvCAmaEEbnSIf06NoTPUsng6zWOREyHJsYESevzwea6aDtEuscmL6f
         rL4LnY8+4sL288zT6Eby2fFU4yxapldKY2XcsuCru6TzD7jBdt/ghRZjp3vUzBdIck8p
         cUYw==
X-Gm-Message-State: APjAAAWTVyLSHClWonr4abMn4k0ZSyFkpKiDJM/xM8o3mSHyRVAzGdh8
        AMUZp9PfvMijLVYGrCc+Yrng4w==
X-Google-Smtp-Source: APXvYqy13tvuu58lwI0ZashXZBglnAc01GHqKKGLWlQ1kA0mCtTgoAkAcwI/Gc3rB016Is7SqriZWA==
X-Received: by 2002:a17:90a:b393:: with SMTP id e19mr21641421pjr.115.1573837228497;
        Fri, 15 Nov 2019 09:00:28 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id i22sm8907804pjx.1.2019.11.15.09.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 09:00:27 -0800 (PST)
Date:   Fri, 15 Nov 2019 09:00:26 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     "sboyd@kernel.org" <sboyd@kernel.org>,
        "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alice Guo <alice.guo@nxp.com>
Subject: Re: [PATCH] clk: clkdev: Replace strlcpy with strscpy
Message-ID: <201911150900.817CDE33@keescook>
References: <1573812819-5030-1-git-send-email-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573812819-5030-1-git-send-email-peng.fan@nxp.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Nov 15, 2019 at 10:17:53AM +0000, Peng Fan wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The implementation of strscpy() is more robust and safer.
> 
> The strscpy was introduced to fix some API problems around strlcpy.
> strscpy is preferred to strlcpy() since the API doesn't require
> reading memory from the src string beyond the specified "count" bytes,
> and since the return value is easier to error-check than strlcpy()'s.
> In addition, the implementation is robust to the string changing out
> from underneath it, unlike the current strlcpy() implementation.
> 
> Cc: Kees Cook <keescook@chromium.org>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  drivers/clk/clkdev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clkdev.c b/drivers/clk/clkdev.c
> index 0f2e3fcf0f19..ee56109bc0b4 100644
> --- a/drivers/clk/clkdev.c
> +++ b/drivers/clk/clkdev.c
> @@ -165,7 +165,7 @@ vclkdev_alloc(struct clk_hw *hw, const char *con_id, const char *dev_fmt,
>  
>  	cla->cl.clk_hw = hw;
>  	if (con_id) {
> -		strlcpy(cla->con_id, con_id, sizeof(cla->con_id));
> +		strscpy(cla->con_id, con_id, sizeof(cla->con_id));
>  		cla->cl.con_id = cla->con_id;
>  	}
>  
> -- 
> 2.16.4
> 

-- 
Kees Cook
