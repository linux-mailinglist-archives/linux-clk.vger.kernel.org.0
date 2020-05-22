Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 337101DEDC0
	for <lists+linux-clk@lfdr.de>; Fri, 22 May 2020 18:57:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730544AbgEVQ5X (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 22 May 2020 12:57:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730306AbgEVQ5W (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 22 May 2020 12:57:22 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9586C061A0E
        for <linux-clk@vger.kernel.org>; Fri, 22 May 2020 09:57:21 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id u13so528965wml.1
        for <linux-clk@vger.kernel.org>; Fri, 22 May 2020 09:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=H0fk+YgnvJQdHJy1RoTIxISz+5f4dnnX1kWqMJdIiTs=;
        b=mJgRhNZUV8CHq1RmFWq7pxbyvsO0FpeEolI6sdLDMYOWVj7bN0R5fgJTzTQh2UAcMf
         W7g3g4Oi45lMempvhGJgtWGWviaNUQedF2O0PzS+CbjwXpt7q5HpHU5Fb9W/uVFkPd67
         X9f5FjJczWK80YgE51DwsqlAaMmapRlzlt2jZ2eBvFNCPZS7ouR+YOyc4YAIpS8xk318
         EXFub2WKjTNwwryAYe6wi8LYvaMb8CpMJgdNc7g3yKPqicUOJACJNLkUDgqS3tUY87PX
         kM3KUiwSsBRtX4d2YfXKdTZ63ZdlrExIimJuo8wxEGasLH5lrVq9ZoYGyBjjNAmPOCzF
         czvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=H0fk+YgnvJQdHJy1RoTIxISz+5f4dnnX1kWqMJdIiTs=;
        b=s420+gYamSoucyH+F8+ef4yfgBExP0nz0PYuW7CW/SQ9Gg03esv5XgleXadE2QNWUB
         epmb2x3RyLwyD6loFrZg4t5lrwj9yHWI4Z+9kbZzxjVq2+zFaBw3rT+NKmUdXMG1hWoC
         cHR6KJcJIpD41Uw7N2Lr6Dw+OLzyZKNQQJzAygucfPd6ku7Bs/sBU1zrINvMnVnTszJ+
         xGsNvUgTjSSsAjxeQzzevyCPj1nVsNCUIk2awnQDN4PFLwObF/6tdDtN6iMriu57vlhi
         oKjxjZ19fJ9kEKXhE7DpwXTmOkcbheHqUoZ/+isPjJ2gL1SPVavKWWpgGdZ9DIhezc9b
         7qqw==
X-Gm-Message-State: AOAM532jELJB8467zL+ju9OYsuHXs30issI207OguQx3PdAFMgPR1VVf
        hCbpRyX9QzrcjI3c5DMVKn3vog==
X-Google-Smtp-Source: ABdhPJzc7gjWBkYuh9qSlhxc3eMgYPGZvCjw95agKu8mdcnuOAzuJsZb0eW/lo8vLU77CVVsDE60BQ==
X-Received: by 2002:a1c:5685:: with SMTP id k127mr14863903wmb.50.1590166640540;
        Fri, 22 May 2020 09:57:20 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:a82f:eaec:3c49:875a? ([2a01:e34:ed2f:f020:a82f:eaec:3c49:875a])
        by smtp.googlemail.com with ESMTPSA id t14sm9673168wrb.56.2020.05.22.09.57.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2020 09:57:19 -0700 (PDT)
Subject: Re: [PATCH 4/4] thermal: qoriq: Add platform dependencies
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Jens Axboe <axboe@kernel.dk>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     Amit Kucheria <amit.kucheria@verdurent.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-ide@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20200507112955.23520-1-geert+renesas@glider.be>
 <20200507112955.23520-5-geert+renesas@glider.be>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <e4a72b09-52e5-d145-2b64-50e5d636527a@linaro.org>
Date:   Fri, 22 May 2020 18:57:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200507112955.23520-5-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 07/05/2020 13:29, Geert Uytterhoeven wrote:
> The QorIQ Thermal Monitoring Unit is only present on Freescale E500MC
> and Layerscape SoCs, and on NXP i.MX8 SoCs.  Add platform dependencies
> to the QORIQ_THERMAL config symbol, to avoid asking the user about it
> when configuring a kernel without support for any of the aforementioned
> SoCs.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied, thanks



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
