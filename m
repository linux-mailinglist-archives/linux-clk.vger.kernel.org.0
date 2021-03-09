Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F095332030
	for <lists+linux-clk@lfdr.de>; Tue,  9 Mar 2021 09:04:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbhCIIDo (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 9 Mar 2021 03:03:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbhCIIDT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 Mar 2021 03:03:19 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8D7DC06174A
        for <linux-clk@vger.kernel.org>; Tue,  9 Mar 2021 00:03:16 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id mm21so25539935ejb.12
        for <linux-clk@vger.kernel.org>; Tue, 09 Mar 2021 00:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=udOIV3/WvDp0nzbMwuYgMl5LLp2FN++oa8di3G9XQEw=;
        b=IY77QXZpWBqTyAzyxxzHcCzPOfK6br4b3Wadu7+YGZ/WYmXY1AWZa2/axW1Eh1278Y
         rVyqPk6lKzsQ2jXPYhSlnfHwgyTM63GQNDcrLeWxRu+T4CJaZ72H5ImHe6CsWR+Jmezg
         KqsjDC37iWbmHpG3QJ2tvh0DkxZPKQ/CJ1PUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=udOIV3/WvDp0nzbMwuYgMl5LLp2FN++oa8di3G9XQEw=;
        b=t0kuGOCQQqsL5tBNsARkzs+YY0V8XCp7WVm3gPQ7hlxh/cF6M6om5nLuQ1gMYFuP28
         PMQPEi7KyHJ0KUIGExB1ZxUJ6DRPCFyVnurCAoUI01MSqhrDaWoi7bCYmisJfvL7+Cl6
         igCCll6HzK+6fb0+JPQrq52hCVOgnddjnU1+C9wu2S+hkFyeimpREfmwW/XJPjiBEI15
         TkSfOSZh0CqzRrdA7lYmPVakg2ti8EK01d5K3F7mLz2nvm87ycj0joaSsP1TDADFoIZc
         WcQnU8zKUz6lq5Tpnb4eIRBwcwSWAWpaq6EqL7ZFvy4yNwCdCoi30Anz718IBd39use0
         BaWw==
X-Gm-Message-State: AOAM531e5vjB8fc993ahu5vnUEY5KSzoDKAYMQjo/LTyaKFc5EumujWs
        fYBnkM2ClladDs+0CZ2gtZrvRA==
X-Google-Smtp-Source: ABdhPJxoUFl88Ctn8k0pxFuoa8CiNSs7QiMzGjincJXLXCSHmzzVj96H6MRFN/B8m+uiLxWd95/60w==
X-Received: by 2002:a17:907:788e:: with SMTP id ku14mr19524149ejc.17.1615276995639;
        Tue, 09 Mar 2021 00:03:15 -0800 (PST)
Received: from [192.168.1.149] ([80.208.71.141])
        by smtp.gmail.com with ESMTPSA id d3sm8439884edp.43.2021.03.09.00.03.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Mar 2021 00:03:15 -0800 (PST)
Subject: Re: [PATCH RESEND 0/2] Common protected-clocks implementation
To:     Samuel Holland <samuel@sholland.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maxime Ripard <mripard@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
References: <20200903040015.5627-1-samuel@sholland.org>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <9363f63f-8584-2d84-71fd-baca13e16164@rasmusvillemoes.dk>
Date:   Tue, 9 Mar 2021 09:03:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20200903040015.5627-1-samuel@sholland.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 03/09/2020 06.00, Samuel Holland wrote:
> Stephen, Maxime,
> 
> You previously asked me to implement the protected-clocks property in a
> driver-independent way:
> 
> https://www.spinics.net/lists/arm-kernel/msg753832.html
> 
> I provided an implementation 6 months ago, which I am resending now:
> 
> https://patchwork.kernel.org/patch/11398629/
> 
> Do you have any comments on it?

I'm also interested [1] in getting something like this supported in a
generic fashion - i.e., being able to mark a clock as
protected/critical/whatnot by just adding an appropriate property in the
clock provider's DT node, but without modifying the driver to opt-in to
handling it.

Now, as to this implementation, the commit 48d7f160b1 which added the
common protected-clocks binding says

  For example, on some Qualcomm firmwares reading or writing certain clk
  registers causes the entire system to reboot,

so I'm not sure handling protected-clocks by translating it to
CLK_CRITICAL and thus calling prepare/enable on it is the right thing to
do - clks that behave like above are truly "hands off, kernel", so the
current driver-specific implementation of simply not registering those
clocks seems to be the right thing to do - or at least the clk framework
would need to be taught to not actually call any methods on such
protected clocks.

For my use case, either "hands off kernel" or "make sure this clock is
enabled" would work since the bootloader anyway enables the clock.

Rasmus

[1]
https://lore.kernel.org/lkml/20210226141411.2517368-1-linux@rasmusvillemoes.dk/

