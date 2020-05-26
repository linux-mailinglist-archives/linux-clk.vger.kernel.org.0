Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A0D81D7F61
	for <lists+linux-clk@lfdr.de>; Mon, 18 May 2020 18:58:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727938AbgERQ6g (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 18 May 2020 12:58:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728297AbgERQ6e (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 18 May 2020 12:58:34 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD63CC05BD0B
        for <linux-clk@vger.kernel.org>; Mon, 18 May 2020 09:58:32 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id k13so10635104wrx.3
        for <linux-clk@vger.kernel.org>; Mon, 18 May 2020 09:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7UrsBklbWEQlXSIzoleVC5S+OEDveOLRjfhFBfKj/1U=;
        b=NwBu0r7wl1gpM7daM6EL/QGiMubgwQrMS7DCx8+Wm8Lyg+2vJddtUQcJeERAwQZJL5
         fPsxNVWNDou4B0PGdUAVuryOhMY0JAn5H7lujgsQObRDL1W/aBlkfInsKn6+u8uvDosc
         qozNeuLAP3u48HfASCRiEDkctG8WgFnHziKs14NtB8EJyIfB9hPN8qYfBhk5ijnxF764
         W0k7+ogDFppnKzURVA2wi86cCUAs2twWBridx7yCjgdykjs8UuHNecYybeC2X0kHut/Z
         p+J/s8zIvyXlFlnM5w4aqPbHCk/waq1N9OgYU74c8WHzHYe28XBAi3kpKL/8WQYf2EWM
         JpnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7UrsBklbWEQlXSIzoleVC5S+OEDveOLRjfhFBfKj/1U=;
        b=Lk+mipuD6DlCLOWW/ZuTj8TMC7uN0jWJXgnu61a1b95qqSyKRF5Jm3XEsDkd4nPlqv
         spNKSdZ0VC6HFXI1ZgvHqYktcUvXUbSzzG0aZ2i5DcVss2TB1EHJFJ89qx2tQsnNX7is
         YVC6Ga5SQ+n3uIKMmTOb8dVlPzVO9mocy3Us/7tgPZDRFMCZsETz+7bieq1uYfKhjmi1
         2boyDaU7Kj8+187c4NYCXfJLag4UoO4wOXe7W1xli0KlxnDnh8SE0gejjie8hioSCexI
         qo+exSnY8fzZ/zC1TJfweL44wAYXSujL0+wUFKJ232/ibxcIqTSqOXlaD6kycT9JiaOQ
         y46Q==
X-Gm-Message-State: AOAM5309SdFeqE4bmTFzDEelvP5zqpwsjDpXt0pR1Npg2gop06Jnb8e4
        RjC2C0r9x+tqBnS9FT2D9+TIctDd1xc=
X-Google-Smtp-Source: ABdhPJyz8YyWk+tq57qcErRl35YmZbUh3jm8IYRNJPP4QVZjm2zuQSf2e2RY9yuWYPSrTDhi0GW0MQ==
X-Received: by 2002:adf:e985:: with SMTP id h5mr21630490wrm.239.1589821111188;
        Mon, 18 May 2020 09:58:31 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:9e7:3ac5:a930:2cd8? ([2a01:e34:ed2f:f020:9e7:3ac5:a930:2cd8])
        by smtp.googlemail.com with ESMTPSA id j190sm193855wmb.33.2020.05.18.09.58.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2020 09:58:30 -0700 (PDT)
Subject: Re: [PATCHv3 00/14] Update omaps to use drivers/clocksource timers
To:     Tony Lindgren <tony@atomide.com>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <aford173@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Brian Hutchinson <b.hutchman@gmail.com>,
        Graeme Smecher <gsmecher@threespeedlogic.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <t-kristo@ti.com>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20200507172330.18679-1-tony@atomide.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <340cdd4a-d996-073f-127d-89ce6c05f221@linaro.org>
Date:   Mon, 18 May 2020 18:58:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200507172330.18679-1-tony@atomide.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


Hi Tony,

On 07/05/2020 19:23, Tony Lindgren wrote:
> Hi all,
> 
> Here's v3 series to udpate omaps to use drivers/clocksource timers for
> the 32k counter and dmtimer, and to remove the old legacy platform code.
> Please review and test.
> 
> I've updated the timer-ti-dm-systimer.c patch based on the comments from
> Daniel and Rob, and added support for selecting the preferred timers to
> use.
> 
> Then for merging when folks are happy with this series, Daniel if you
> can please apply the first three patches into an immutable branch it
> would be great.

so the clk patch also ?

[ ... ]


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
