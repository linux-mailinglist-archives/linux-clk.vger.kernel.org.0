Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4911324834
	for <lists+linux-clk@lfdr.de>; Tue, 21 May 2019 08:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbfEUGjL (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 21 May 2019 02:39:11 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:36366 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbfEUGjK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 May 2019 02:39:10 -0400
Received: by mail-ot1-f66.google.com with SMTP id c3so15353575otr.3
        for <linux-clk@vger.kernel.org>; Mon, 20 May 2019 23:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gBqYtocWWHik2IfGhWR+vlpOXtSgbuQgAgYwyKJnzz0=;
        b=vH3s2Jen3NIt0L0ETP2uQPLNLW4pl5U3URMArHcl1sw9LHDXa96LfkKDYnL50Y3spO
         GK0ipFX+TkHmCIZrFoVACa+wQy4W3zkavs5E6tF21EHtHkV72hubWTE77LmsxxqGotqQ
         rngoy9AKSPSiUmJuVQ7OqqIwo//LpGCpDo5Jinbyb8z1FdQoC6GcnHoRfTF0NUexXkwO
         u74Jr+am7cwtEqeD99VVZPR3r5Mmg6CQagWBfUo6kmbwoCTQ20oURWNwFMQOBnA4wXeV
         tTFzyeCFbZwWcu76HmnqLaiGHH6WgiMGofkq9aBgc31iXC9u83ezx7dvogalrcpN49vS
         f15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gBqYtocWWHik2IfGhWR+vlpOXtSgbuQgAgYwyKJnzz0=;
        b=TPxkYchPjc/4bJrPXPC+rnmYdQZ4KE0pykWOJhLt7kgbemJerAQPxi1GE4hyrPnnXJ
         XKhRgH6RIuKzGJ/Rf/0X22rGbvw0BF6AFRk3mtvp+RR0ngMUMRr3wn9ds4vHdKNviZp/
         Pcxd0LPqQu5qW7LkGzjfj0AUDCxQYpABYA1h3+bgrPNMvIzq6W0CIPTasQGEPOQQsfIh
         NZ3KmiDDWg2h4B3TQBfuIZmjEqNEg/vmS1vJT11lXa1qeqGZcTbQveg+GUuwVzsPw8fu
         7eFpY6aIa8nCEYc1AptMXjBlkgXsO3N/liEvXykqhVHWsOIA1p4+egZnWLViomjck22U
         qV1w==
X-Gm-Message-State: APjAAAU+JjWyyZTsqGiLOFMuo5ltYDPFW+xBCWUiqcTcYwYuI5OUdro5
        0BsXO+PyCGvTyF+oYW4nM4mZM5DGLybJ1El+/e/gug==
X-Google-Smtp-Source: APXvYqx1ioEUpaEmIvvjA84iUTXMIxECfj8YghcvKQaZHYdF/LFZHGwK805bblGLrNE4yJr+H8SGTyn/jjXqOMCfVZc=
X-Received: by 2002:a05:6830:1597:: with SMTP id i23mr435453otr.281.1558420750146;
 Mon, 20 May 2019 23:39:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190521060952.2949-1-zhang.chunyan@linaro.org> <20190521060952.2949-3-zhang.chunyan@linaro.org>
In-Reply-To: <20190521060952.2949-3-zhang.chunyan@linaro.org>
From:   Baolin Wang <baolin.wang@linaro.org>
Date:   Tue, 21 May 2019 14:38:59 +0800
Message-ID: <CAMz4ku+pJ8bR4Wt9k3sRFunmMCu9ujQOuN=YT+PEsBEhAZ8__w@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: sprd: Add check for return value of sprd_clk_regmap_init()
To:     Chunyan Zhang <zhang.chunyan@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 21 May 2019 at 14:15, Chunyan Zhang <zhang.chunyan@linaro.org> wrote:
>
> sprd_clk_regmap_init() doesn't always return success, adding check
> for its return value should make the code more strong.
>
> Signed-off-by: Chunyan Zhang <zhang.chunyan@linaro.org>

Reviewed-by: Baolin Wang <baolin.wang@linaro.org>

> ---
>  drivers/clk/sprd/sc9860-clk.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/sprd/sc9860-clk.c b/drivers/clk/sprd/sc9860-clk.c
> index 9980ab55271b..1ed45b4f2fe8 100644
> --- a/drivers/clk/sprd/sc9860-clk.c
> +++ b/drivers/clk/sprd/sc9860-clk.c
> @@ -2031,7 +2031,9 @@ static int sc9860_clk_probe(struct platform_device *pdev)
>         }
>
>         desc = match->data;
> -       sprd_clk_regmap_init(pdev, desc);
> +       ret = sprd_clk_regmap_init(pdev, desc);
> +       if (ret)
> +               return ret;
>
>         return sprd_clk_probe(&pdev->dev, desc->hw_clks);
>  }
> --
> 2.17.1
>


-- 
Baolin Wang
Best Regards
