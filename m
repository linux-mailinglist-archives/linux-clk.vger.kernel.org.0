Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2D6927456B
	for <lists+linux-clk@lfdr.de>; Tue, 22 Sep 2020 17:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgIVPhR (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 22 Sep 2020 11:37:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726662AbgIVPhR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Sep 2020 11:37:17 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 447C8C0613D1
        for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2020 08:37:17 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id t10so17598950wrv.1
        for <linux-clk@vger.kernel.org>; Tue, 22 Sep 2020 08:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CzM3hFSlc57LMy+lcYYDd7pZclBDYKae5+bKuzU8WwI=;
        b=dIh0nroF3/wRP2TWUI6qr37XfuYtLLMxJTV8/ey1zo22LmN95NpDG3t8muTbymw0o4
         5TAg5GV+FhzG1mWw+vuU9SAgJZZGIK28M7l6NJCxCKfOLyiPr7kI8L++S9otLy5D+Zcl
         16A3yYIFXPQDCgyQlSQPHv6DwvJXYZY01ErvmAPHwUPRfmXJBbC0S2DDTS+YylhtJEBH
         eL+NhKheN99NSrXKHHX6QciHttKskLk71jC/Q5VfO2ALDe3zV5AWecFYpt/jJN6ol1n1
         YNzB96bh1vEaQpkUfasPb4MCCPtP0lMjbZhE0iDOFzbOyzHM/WEXBd0WVNkJ0CrJMovH
         w6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CzM3hFSlc57LMy+lcYYDd7pZclBDYKae5+bKuzU8WwI=;
        b=SB3js4+TI5lF3parMxxi78ilXPpGPPJ3hkdyTTQKEGmhX8A4Y5ALvM/XRgZBArbo3v
         fgT5OHT3FQ0UKxOqe5hMfvOA8mfUkB5l/h8JiMBhLtV3TpxP9BSR1/+xdk/eYtlR+9mC
         +35VHY6WbiEcuiFgoj6/z0/DMCUIL9DF9tkJM2sTpxa+UHrZMsuxBf9GiH0TcFugs6ug
         lS67HUIj1Z1L+NZrIw2bujM5cxzaOFKdDRz9x92U7UIcaiUFJfNymFdulGI9kocxKe4k
         TtatKlcXeqzxgQRTgAlA1XxMud/WyyFvdPVxJjY4TA1QX/8ygNvIWV9O0VPSGHTAXgM1
         +leQ==
X-Gm-Message-State: AOAM530elOEcT9DBD4taAfsPt2W56YWeaeIiDaWqGnLuApAGWntjGL1u
        aonsd2Auz5c8oqkrZ+nkO0B6fQ==
X-Google-Smtp-Source: ABdhPJxOFIFOpCipAn7oozquEWbZ4cj81W8Al9SKzvnUmPXQIryHsDCpaWD45WZg/FyuDx7DMQuL/g==
X-Received: by 2002:a5d:4081:: with SMTP id o1mr6254184wrp.338.1600789035640;
        Tue, 22 Sep 2020 08:37:15 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:2047:2ab9:c10c:f4f? ([2a01:e34:ed2f:f020:2047:2ab9:c10c:f4f])
        by smtp.googlemail.com with ESMTPSA id 70sm5628198wme.15.2020.09.22.08.37.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2020 08:37:14 -0700 (PDT)
Subject: Re: [PATCH v5 00/16] Allwinner A100 Initial support
To:     Frank Lee <frank@allwinnertech.com>, robh+dt@kernel.org,
        mripard@kernel.org, wens@csie.org, mturquette@baylibre.com,
        sboyd@kernel.org, gregory.clement@bootlin.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org,
        srinivas.kandagatla@linaro.org, linus.walleij@linaro.org,
        anarsoul@gmail.com, tiny.windzz@gmail.com, rui.zhang@intel.com,
        amit.kucheria@verdurent.com, lee.jones@linaro.org,
        p.zabel@pengutronix.de, icenowy@aosc.io, megous@megous.com,
        clabbe@baylibre.com, bage@linutronix.de, devicetree@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org
References: <cover.1595572867.git.frank@allwinnertech.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <3c8f14f8-893b-cc81-be72-741df772d730@linaro.org>
Date:   Tue, 22 Sep 2020 17:37:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cover.1595572867.git.frank@allwinnertech.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 24/07/2020 08:52, Frank Lee wrote:
> This patch set adds initial support for allwinner a100 soc,
> which is a 64-bit tablet chip.

Applied patches 7,8,9

Thanks

  -- Daniel

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
