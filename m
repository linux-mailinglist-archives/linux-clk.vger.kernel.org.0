Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D01F660B6AB
	for <lists+linux-clk@lfdr.de>; Mon, 24 Oct 2022 21:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232208AbiJXTHO (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 24 Oct 2022 15:07:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231504AbiJXTGu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Oct 2022 15:06:50 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A03716339D
        for <linux-clk@vger.kernel.org>; Mon, 24 Oct 2022 10:45:55 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id be13so17936661lfb.4
        for <linux-clk@vger.kernel.org>; Mon, 24 Oct 2022 10:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7+eHtyI1rSX9YnLKY0I0rogiG/gUcE1cQwN8V9LfHVw=;
        b=gdnPlvQhV9Pppra45PdIsAR/ZQHd84+idlO+3NrBwt1aimu7wqQVWe/Qc2fwCON3XN
         /8jwMbX44Nl4Cn+Xn68fypvgrGEBg+gOgq8QF9hcLF1KBlFrjoQgdSOwOZcHA8mUnUgS
         pg5mTfWfr5MwVAUMapLtEno43/TJBJSHK6BLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7+eHtyI1rSX9YnLKY0I0rogiG/gUcE1cQwN8V9LfHVw=;
        b=i3yK3uizLSUGv5Z3cSDjtx8I4EOEMP8p+Hdwqri2VjKUkhTgko2CjmIeVWFrymhWyH
         I63I/qNp4ytH/cTiej43syG4dg/pE4saU22H8CfqYfMEfsAeGy3c5VXx0m6+ArkrVF2N
         4vjw1KfVNGS/p1xCQg24wx0A1+sbK/qMgs86iKTW1jkGqnRfEkfoaDyJFCu0KJU62r5y
         mLweViFB46UYIVpByYtixKECzDxeD7hfyz/hN3uBaMEpo/yjfXJCVhXQYrJGaaCC0A0n
         KJYiI53/rX8NqckjYVlnRGwrsASxY3oD4nAgCbbiRjpRZqO9hRXfMFq2Vw8pEcvp1KP5
         8JHg==
X-Gm-Message-State: ACrzQf3fY4E6P+sZAaBymV4xsipy3r8XDQSswk/g6cg/+5UD6rJIL+42
        hJPNnFCKYqgEFGZz4O+BD6mbdXg64ECKuRSC+qc=
X-Google-Smtp-Source: AMsMyM4IxozLn2pU0Vju5g9AW8JZRuqtK2Wugua0nPk45LOWOHw0hmRaTnZDHovGoE5Fw4gGY2Vtgg==
X-Received: by 2002:a05:651c:98f:b0:26d:ff18:97c6 with SMTP id b15-20020a05651c098f00b0026dff1897c6mr12785233ljq.375.1666621869801;
        Mon, 24 Oct 2022 07:31:09 -0700 (PDT)
Received: from [172.16.11.74] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id o3-20020ac25e23000000b004a9c6f7a776sm1032357lfg.49.2022.10.24.07.31.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 07:31:09 -0700 (PDT)
Message-ID: <7e52bb17-cbd4-eec2-092a-65c4a01d41ba@rasmusvillemoes.dk>
Date:   Mon, 24 Oct 2022 16:31:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] clk: imx8mp: register driver at arch_initcall time
Content-Language: en-US
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Abel Vesa <abelvesa@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20220928124108.500369-1-linux@rasmusvillemoes.dk>
 <814496ae-4007-9a4e-0466-a0386aec6316@rasmusvillemoes.dk>
 <ed50cdff-8fd2-6714-9b0b-1ce47a5c9d37@pengutronix.de>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
In-Reply-To: <ed50cdff-8fd2-6714-9b0b-1ce47a5c9d37@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 24/10/2022 16.00, Ahmad Fatoum wrote:
> Hello Rasmus,
> 
> On 24.10.22 15:48, Rasmus Villemoes wrote:
>> On 28/09/2022 14.41, Rasmus Villemoes wrote:
>>> We have an imx8mp-based board with an external gpio-triggered
>>> watchdog. Currently, we don't get to handle that in time before it
>>> resets the board.
>>>
>>> The probe of the watchdog device gets deferred because the SOC's GPIO
>>> controller is not yet ready, and the probe of that in turn gets deferred
>>> because its clock provider (namely, this driver) is not yet
>>> ready. Altogether, the watchdog does not get handled until the late
>>> initcall deferred_probe_initcall has made sure all leftover devices
>>> have been probed, and that's way too late.
>>>
>>> Aside from being necessary for our board, this also reduces total boot
>>> time because fewer device probes get deferred.
>>
>> ping
> 
> Module build is unaffected, because arch_initcall expands to module_init
> if it's built as a module, right?

Yes.

 Noting that in the commit message would
> be good I think.
> 
> Also, did you try booting with fw_devlink=on? This should have resolved
> your issue too. Not sure what other issues it may cause on i.MX8MP.

AFAICT, that's the default behaviour:

drivers/base/core.c:static u32 fw_devlink_flags = FW_DEVLINK_FLAGS_ON;
drivers/base/core.c-static int __init fw_devlink_setup(char *arg)
drivers/base/core.c-{
drivers/base/core.c-    if (!arg)
drivers/base/core.c-            return -EINVAL;
drivers/base/core.c-
drivers/base/core.c-    if (strcmp(arg, "off") == 0) {
drivers/base/core.c:            fw_devlink_flags = 0;
drivers/base/core.c-    } else if (strcmp(arg, "permissive") == 0) {
drivers/base/core.c:            fw_devlink_flags =
FW_DEVLINK_FLAGS_PERMISSIVE;
drivers/base/core.c-    } else if (strcmp(arg, "on") == 0) {
drivers/base/core.c:            fw_devlink_flags = FW_DEVLINK_FLAGS_ON;
drivers/base/core.c-    } else if (strcmp(arg, "rpm") == 0) {
drivers/base/core.c:            fw_devlink_flags = FW_DEVLINK_FLAGS_RPM;
drivers/base/core.c-    }
drivers/base/core.c-    return 0;
drivers/base/core.c-}
drivers/base/core.c-early_param("fw_devlink", fw_devlink_setup);

But I don't think the problem is that the driver core has inferred the
dependency chain upfront from parsing DT; the problem is simply that we
end up probing the clock controller, and hence all dependencies too late.

Rasmus
