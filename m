Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1AF382E17
	for <lists+linux-clk@lfdr.de>; Tue,  6 Aug 2019 10:49:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732330AbfHFItv (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 6 Aug 2019 04:49:51 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38009 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732206AbfHFItv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Aug 2019 04:49:51 -0400
Received: by mail-wm1-f67.google.com with SMTP id s15so54254581wmj.3
        for <linux-clk@vger.kernel.org>; Tue, 06 Aug 2019 01:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=e/5FlaB9m3gEnKe48majyR+7xFOfFfXfyiygau9Wh2Q=;
        b=I8CviA6xn+lteqKb2DklgcnuqBxGyR27LIonjjd1h6SlJ7vCnVT73BukBTDQpMD/QN
         U2y4909fk17Tj5+3DdR7UNyfYIEf0X01AupJp7sjyy+38+tOjJs0Uf+JrTykxS5yDnwl
         wpOTes3fxdYyL63v1gnEB0C5Yv8qgoEypMDTFHQyFrFNwkr3OnK1em/jY5s6AmTUf0bq
         Ru/EEqxoGZ1zYjLzFWFmPK8ebIGnhYIBm77pE5A4FxWigCCjJ7LHtKmhzsCkqNbHyIPQ
         vHE+9pliBkDd0CMU9qbuKNEbEw1dETq0tYpY6S4ziSkyt3NVkefhqW5/l6FiivltiBZ4
         qeOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=e/5FlaB9m3gEnKe48majyR+7xFOfFfXfyiygau9Wh2Q=;
        b=ItPU73JgRcGmT8kJ1xcOXtmCwDXHf11I7qYoUSuJlaVckFCFQp1k1fHpK6Y9Y8DpAQ
         j22T9ZasOx8BswdA71rllpGQCU+kJDhrObdovuEDrrgYsgbJQ7RxmAGSlXYLzpA3mMOi
         JZ2SidsCa0NoyPI1nfzW6mBYMPIlAQcl6ydTepN4l6KkWSMwOPP6ou1CCXilGffNxmwy
         /u7pnvvEjltWRjJq0sWOthMuLXzG50/50lvd9Yftf3NrF7fG//AXQq4y8iY+3NLU963+
         cDoE/y5mlyFq/hqiAISgcTncmE3IjFQUIpj4Zghuwdu0mjZs1Ee7PV7WruOsMnwK/MVs
         CAYg==
X-Gm-Message-State: APjAAAWlcaXKHotvsOZlEWqHXOOpvHk7RpyuBMUEJ83gCwl+vxKkQv6O
        nU1KADTH37yzSiAGORIPJ9pUSQ==
X-Google-Smtp-Source: APXvYqydrWSyKv/Z8aE0wnm5mBDuLQIs85p2Q4UZiFE76n+eAsC040k+pd2/Q6j5qysjYrVv9GE9ZA==
X-Received: by 2002:a1c:720e:: with SMTP id n14mr3443503wmc.53.1565081389300;
        Tue, 06 Aug 2019 01:49:49 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id x8sm74356883wmc.5.2019.08.06.01.49.48
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 06 Aug 2019 01:49:48 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 3/9] clk: meson: axg-audio: Don't reference clk_init_data after registration
In-Reply-To: <20190731193517.237136-4-sboyd@kernel.org>
References: <20190731193517.237136-1-sboyd@kernel.org> <20190731193517.237136-4-sboyd@kernel.org>
Date:   Tue, 06 Aug 2019 10:49:47 +0200
Message-ID: <1jwofqvftg.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed 31 Jul 2019 at 12:35, Stephen Boyd <sboyd@kernel.org> wrote:

> A future patch is going to change semantics of clk_register() so that
> clk_hw::init is guaranteed to be NULL after a clk is registered. Avoid
> referencing this member here so that we don't run into NULL pointer
> exceptions.

Hi Stephen,

What to do you indend to do with this one ? Will you apply directly or
should we take it ?

We have several changes for the controller which may conflict with this
one. It is nothing major but the sooner I know how this changes goes in,
the sooner I can rebase the rest.

Also, We were (re)using the init_data only on register failures.
I understand that you want to guarantee .init is NULL when the clock is
registered, but it this particular case, the registeration failed so the
clock is not registered.

IMO, it would be better if devm_clk_hw_register() left the init_data
untouched if the registration fails.

>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---
>
> Please ack so I can take this through clk tree
>
>  drivers/clk/meson/axg-audio.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
> index 8028ff6f6610..db0b73d53551 100644
> --- a/drivers/clk/meson/axg-audio.c
> +++ b/drivers/clk/meson/axg-audio.c
> @@ -992,15 +992,18 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
>  
>  	/* Take care to skip the registered input clocks */
>  	for (i = AUD_CLKID_DDR_ARB; i < data->hw_onecell_data->num; i++) {
> +		const char *name;
> +
>  		hw = data->hw_onecell_data->hws[i];
>  		/* array might be sparse */
>  		if (!hw)
>  			continue;
>  
> +		name = hw->init->name;
> +
>  		ret = devm_clk_hw_register(dev, hw);
>  		if (ret) {
> -			dev_err(dev, "failed to register clock %s\n",
> -				hw->init->name);
> +			dev_err(dev, "failed to register clock %s\n", name);
>  			return ret;
>  		}
>  	}
> -- 
> Sent by a computer through tubes
