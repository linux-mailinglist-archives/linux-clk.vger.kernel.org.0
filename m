Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D3D3433ED2
	for <lists+linux-clk@lfdr.de>; Tue, 19 Oct 2021 20:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234722AbhJSSzj (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 19 Oct 2021 14:55:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232913AbhJSSzj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Oct 2021 14:55:39 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B47F4C06161C
        for <linux-clk@vger.kernel.org>; Tue, 19 Oct 2021 11:53:25 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id x27so9647681lfu.5
        for <linux-clk@vger.kernel.org>; Tue, 19 Oct 2021 11:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=r2rrts++NxgImf0a82glzOmEBUZi84j06zH7Tkh8a8M=;
        b=UCfOxF5aleDe9ZpwZmCWIP9VsQAb4vMBWEfUnp+qQcgTZjP8QmmJb3ku5lBKiuNK+3
         aGqchluX/vJ+TMf9yoXaEbIkDsQEB0GpDtBpZeo5Nf2yiOF7Ai4tOhdh92kZvRNqvrlK
         JXMeme5yEDlqC9tBBaHPoB/xKQ7lJQwX6isLQSMJinQtqDsDicpA40jAHPfaG/liUwzR
         tzdzvk4BfDFjrXRnRmP3f/utMjATXwQtRPVDYyGBI7ab+loFYldRFmJi1szd/WKOg9dj
         e0wUezSGyCjoTZ82q5SXaJa+9sXigedgHqOE0Z0p5YnZwAx8VrpXbDgohbNBm0GVbEJJ
         K/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=r2rrts++NxgImf0a82glzOmEBUZi84j06zH7Tkh8a8M=;
        b=Ok61PeCyVKmYNWuq8Cnb8pN+ZHypgzYlDt6BA6Z5W4rl/cma+M7izAj402zoOD69tB
         J8PaBKm3sCVjsMf2sPBfUVznD/St6dSkM3wqJ6oyQZAYLpqO4AKRr1OXKMOvjmo7rs0A
         XxhP6rCoOOHMzq6Xg0h9a6OWek3UNbP3x4GVdgsgwnBDdMVTI0Wy7NC/++2h0cOUdl+s
         uhb6bLtHKvT5anss6B0DBoeQhUES+WdO1DSkKwMDAJnf43FG+FPOm0tK3ldabZnoqfF0
         UY0CdksFWeQOKvU7y1AqK9cSyN7SFv4NtgZDN/zkUYapBoPQ7B8h/WRLt+TeobLq8J10
         wGIw==
X-Gm-Message-State: AOAM532XedMldFT7d5u1gKwDTMtRonM69roddrWejA0oOfMHPz797hI2
        sDVQlc0AvF6xhAxgo4CcZmIlGg==
X-Google-Smtp-Source: ABdhPJwG39+FkLXNePl3OVv2tcHg9caTiE1j1aHd+NogGFk6PsF6gGSl2z6yWbUydEr42eFxSBLuWA==
X-Received: by 2002:ac2:4bc2:: with SMTP id o2mr7615405lfq.501.1634669604111;
        Tue, 19 Oct 2021 11:53:24 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id o22sm709865lfr.250.2021.10.19.11.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 11:53:23 -0700 (PDT)
Date:   Tue, 19 Oct 2021 20:53:22 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: rzg2l: Add missing kerneldoc for resets
Message-ID: <YW8UIj+JVxidg0Gi@oden.dyn.berto.se>
References: <39c2c5fd4232b6620a4a56dba4e2b0d61476ee36.1634646869.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <39c2c5fd4232b6620a4a56dba4e2b0d61476ee36.1634646869.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2021-10-19 14:35:36 +0200, Geert Uytterhoeven wrote:
> make W=1:
> 
>     drivers/clk/renesas/rzg2l-cpg.c:95: warning: Function parameter or member 'num_resets' not described in 'rzg2l_cpg_priv'
> 
> Add the missing kerneldoc for fields in struct rzg2l_cpg_priv and struct
> rzg2l_cpg_info related to Module Resets.
> 
> Fixes: c3e67ad6f5a2c698 ("dt-bindings: clock: r9a07g044-cpg: Update clock/reset definitions")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in renesas-clk for v5.17.
> ---
>  drivers/clk/renesas/rzg2l-cpg.c | 1 +
>  drivers/clk/renesas/rzg2l-cpg.h | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
> index 4021f6cabda4b3bc..a77cb47b75e7c253 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -74,6 +74,7 @@ struct sd_hw_data {
>   * @clks: Array containing all Core and Module Clocks
>   * @num_core_clks: Number of Core Clocks in clks[]
>   * @num_mod_clks: Number of Module Clocks in clks[]
> + * @num_resets: Number of Module Resets in info->resets[]
>   * @last_dt_core_clk: ID of the last Core Clock exported to DT
>   * @notifiers: Notifier chain to save/restore clock state for system resume
>   * @info: Pointer to platform data
> diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
> index 7fb6b4030f72e237..484c7cee2629366f 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.h
> +++ b/drivers/clk/renesas/rzg2l-cpg.h
> @@ -168,6 +168,9 @@ struct rzg2l_reset {
>   * @num_mod_clks: Number of entries in mod_clks[]
>   * @num_hw_mod_clks: Number of Module Clocks supported by the hardware
>   *
> + * @resets: Array of Module Reset definitions
> + * @num_resets: Number of entries in resets[]
> + *
>   * @crit_mod_clks: Array with Module Clock IDs of critical clocks that
>   *                 should not be disabled without a knowledgeable driver
>   * @num_crit_mod_clks: Number of entries in crit_mod_clks[]
> -- 
> 2.25.1
> 

-- 
Regards,
Niklas S�derlund
