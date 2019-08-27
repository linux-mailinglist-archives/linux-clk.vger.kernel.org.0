Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E76A9DABD
	for <lists+linux-clk@lfdr.de>; Tue, 27 Aug 2019 02:38:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727646AbfH0AiZ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 26 Aug 2019 20:38:25 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:34379 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727227AbfH0AiZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Aug 2019 20:38:25 -0400
Received: by mail-pf1-f196.google.com with SMTP id b24so12936742pfp.1
        for <linux-clk@vger.kernel.org>; Mon, 26 Aug 2019 17:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CzJ4L/ndy3TmvMzhc3lAYgIRX3iQZIHJfLoJy4FPyOo=;
        b=nv3JPgoD/qTSnxeEOXknD51aWQjDcbr9AW9jwKCFqtUBoS2TevqfKmchyAm7BSRQ4O
         tyFdft4fk96lQUJQjLGWRk8gqS1yYNUFw10qfpqxTVt2ZSNhdPCC+t1nrkI7F45P0KG7
         cczO71SHVoSV4NXTdmgJL8ayA9dXWwqY6e9VrbOYHYqLyAL+zA7R5sQFdIcDkhYfYPpx
         E/a9/2Qs1k0SUZcfS0cW4IaLmz1zonx6AthpxMnb+xykVvqM/mtoDHAOcEHxu2DNOh+J
         b7TVdSuoCr4cw5I2vJGijjDaXCNiRURx19LBmaFI9ncZagxgF16+E/l+yQ07sk6AAfkc
         5Ncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CzJ4L/ndy3TmvMzhc3lAYgIRX3iQZIHJfLoJy4FPyOo=;
        b=dsST46gLJDNBIoi+51w9gd02mg38Dd1X9qaYhqUiMqJsdzAOGkKXG41qVy7o6r1Eol
         aq+XQoS8XXanAc48L3nwQ8JqiHzfW68fdAiFMaOvmgxZhxuRQdj1oHmeJLj2o3XHQsNg
         Xk/XoI5kwLCMs9vlwQ3Kx05EP8Ed+4K90uh1IXWM0BaLwkS5kT/beMdIwym2CaG9UVxE
         1Zg4xbYfz1m2VLio95hq2O4QKsYav23UR/E+sqGVdFzPHbPEPDSEL5KfRivY+BuVVL/O
         weW5yLhEjW59MQCNaMBDVaVu0ddXkjHu0KHZTb0f90D+H91ds3BBSqKr3dSqRqvSTxvN
         sM9A==
X-Gm-Message-State: APjAAAVPAn+szLXcJQj+R8jV+7AgYbaH338pmfjB7o3QcvwUnZZ8+MKO
        Iz2pTacSAfLDp88mgfzOwpA2lg==
X-Google-Smtp-Source: APXvYqyjPwSyOmWAUWNl7BdiwhUe9MPVY5a44iaTMCz8MH8pBwqliT2FJ3xcoyhkNLlnBO1mO7g7qQ==
X-Received: by 2002:a62:6489:: with SMTP id y131mr14055419pfb.124.1566866304601;
        Mon, 26 Aug 2019 17:38:24 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z68sm14631861pgz.88.2019.08.26.17.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2019 17:38:23 -0700 (PDT)
Date:   Mon, 26 Aug 2019 17:40:14 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH] clk: Evict unregistered clks from parent caches
Message-ID: <20190827004014.GA26807@tuxbook-pro>
References: <20190826234311.138147-1-sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190826234311.138147-1-sboyd@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon 26 Aug 16:43 PDT 2019, Stephen Boyd wrote:

> We leave a dangling pointer in each clk_core::parents array that has an
> unregistered clk as a potential parent when that clk_core pointer is
> freed by clk{_hw}_unregister(). It is impossible for the true parent of
> a clk to be set with clk_set_parent() once the dangling pointer is left
> in the cache because we compare parent pointers in
> clk_fetch_parent_index() instead of checking for a matching clk name or
> clk_hw pointer.
> 
> Before commit ede77858473a ("clk: Remove global clk traversal on fetch
> parent index"), we would check clk_hw pointers, which has a higher
> chance of being the same between registration and unregistration, but it
> can still be allocated and freed by the clk provider. In fact, this has
> been a long standing problem since commit da0f0b2c3ad2 ("clk: Correct
> lookup logic in clk_fetch_parent_index()") where we stopped trying to
> compare clk names and skipped over entries in the cache that weren't
> NULL.
> 
> There are good (performance) reasons to not do the global tree lookup in
> cases where the cache holds dangling pointers to parents that have been
> unregistered. Let's take the performance hit on the uncommon
> registration path instead. Loop through all the clk_core::parents arrays
> when a clk is unregistered and set the entry to NULL when the parent
> cache entry and clk being unregistered are the same pointer. This will
> fix this problem and avoid the overhead for the "normal" case.
> 
> Based on a patch by Bjorn Andersson.
> 
> Fixes: da0f0b2c3ad2 ("clk: Correct lookup logic in clk_fetch_parent_index()")
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks for writing this up.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---
>  drivers/clk/clk.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index c0990703ce54..f3982bfa39d6 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -3737,6 +3737,34 @@ static const struct clk_ops clk_nodrv_ops = {
>  	.set_parent	= clk_nodrv_set_parent,
>  };
>  
> +static void clk_core_evict_parent_cache_subtree(struct clk_core *root,
> +						struct clk_core *target)
> +{
> +	int i;
> +	struct clk_core *child;
> +
> +	for (i = 0; i < root->num_parents; i++)
> +		if (root->parents[i].core == target)
> +			root->parents[i].core = NULL;
> +
> +	hlist_for_each_entry(child, &root->children, child_node)
> +		clk_core_evict_parent_cache_subtree(child, target);
> +}
> +
> +/* Remove this clk from all parent caches */
> +static void clk_core_evict_parent_cache(struct clk_core *core)
> +{
> +	struct hlist_head **lists;
> +	struct clk_core *root;
> +
> +	lockdep_assert_held(&prepare_lock);
> +
> +	for (lists = all_lists; *lists; lists++)
> +		hlist_for_each_entry(root, *lists, child_node)
> +			clk_core_evict_parent_cache_subtree(root, core);
> +
> +}
> +
>  /**
>   * clk_unregister - unregister a currently registered clock
>   * @clk: clock to unregister
> @@ -3775,6 +3803,8 @@ void clk_unregister(struct clk *clk)
>  			clk_core_set_parent_nolock(child, NULL);
>  	}
>  
> +	clk_core_evict_parent_cache(clk->core);
> +
>  	hlist_del_init(&clk->core->child_node);
>  
>  	if (clk->core->prepare_count)
> -- 
> Sent by a computer through tubes
> 
