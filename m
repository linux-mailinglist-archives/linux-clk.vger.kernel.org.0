Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F4AE72DE53
	for <lists+linux-clk@lfdr.de>; Tue, 13 Jun 2023 11:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239745AbjFMJzg (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 13 Jun 2023 05:55:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241857AbjFMJzR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Jun 2023 05:55:17 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E49BC1AC
        for <linux-clk@vger.kernel.org>; Tue, 13 Jun 2023 02:55:15 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-30fc90f359fso923898f8f.3
        for <linux-clk@vger.kernel.org>; Tue, 13 Jun 2023 02:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1686650114; x=1689242114;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RqNvggRPyNB9Hehd7xfWxJNAOn1bnmQJXJE17DkVdBU=;
        b=g/gQ2/z9jaLvDVlTUHmih1Mf6W7SQX7wJSQ+I8XBYvpmmlpFWCMKBmAtIqbdA9HJWB
         iWJ8265l0uWUBs0Kg2xf88IK1ASsgY7HBMkicdvyoLSF2ZFw96kmx8hlZ4inRvc6mfw6
         usW+eWfcjxc7P7c5wlWofL6a/6amUVvrMqWmVbcEPl/2nvlor4GEZMJYDGvrBQ2ES0Kz
         MIm+Gt3o5Al8+xgJHIvN+k83T0tslOCriSPQAfvlsubkAEA+EPvZDMa6sTwznVHhsGT7
         9tQ5f+N1kjiEiCDElzEW318WS8K22rXW/SvG9B0QnKg+Y4mmXmNqLX7TKuwjrx3J05kI
         izbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686650114; x=1689242114;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RqNvggRPyNB9Hehd7xfWxJNAOn1bnmQJXJE17DkVdBU=;
        b=K4Cmw1lk2+zDt9HW6YUMap61gCisTVRGDdXLLh2IawR2wY62haQJGdPXKBjMpDlD2f
         pLWJfktPYeGImym12Mz1D0QZIaX/M2wP+bRTjNKY+8AUeBr1K9KGYva/xk5XoeESLy9J
         lRBfL2j9MZ+rSHprwQzFodWodNPhvHSpmYx4RxAFSevrtywrxnpczaXoFmXucg0szLXM
         X+sSYBFcpntzVkAzxND3+mogtGGY9sYVguYK8ls2TaaQgaewYH5GmuyWQX5iyGXTVUo8
         BKphTq+zU/JlKCnE4yFRTr+UE22N/2CiBkmp3yCWsuXRqBm9adF+8bdh4q/5AXE1/jPU
         kgZA==
X-Gm-Message-State: AC+VfDx9IIUdvLjzXTKxD9u240WP6l8c2yp8X/7mKLRgCDj0yX7hxm1D
        +1bwAxzLUnogbjgOX6ynhyCNLA==
X-Google-Smtp-Source: ACHHUZ5ZrdfyYh5y1tk49fFKsi3ApIfFMGD+jwFkSrpureaIeIWoGT4Ghm/fdObK/np4YyjXHk7Jyg==
X-Received: by 2002:adf:e252:0:b0:307:7f38:37f with SMTP id bl18-20020adfe252000000b003077f38037fmr6934139wrb.66.1686650114217;
        Tue, 13 Jun 2023 02:55:14 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id e4-20020adfdbc4000000b0030ada01ca78sm14844845wrj.10.2023.06.13.02.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 02:55:13 -0700 (PDT)
Date:   Tue, 13 Jun 2023 11:55:11 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        vadfed@meta.com, jonathan.lemon@gmail.com, pabeni@redhat.com,
        corbet@lwn.net, davem@davemloft.net, edumazet@google.com,
        vadfed@fb.com, jesse.brandeburg@intel.com,
        anthony.l.nguyen@intel.com, saeedm@nvidia.com, leon@kernel.org,
        richardcochran@gmail.com, sj@kernel.org, javierm@redhat.com,
        ricardo.canuelo@collabora.com, mst@redhat.com, tzimmermann@suse.de,
        michal.michalik@intel.com, gregkh@linuxfoundation.org,
        jacek.lawrynowicz@linux.intel.com, airlied@redhat.com,
        ogabbay@kernel.org, arnd@arndb.de, nipun.gupta@amd.com,
        axboe@kernel.dk, linux@zary.sk, masahiroy@kernel.org,
        benjamin.tissoires@redhat.com, geert+renesas@glider.be,
        milena.olech@intel.com, kuniyu@amazon.com, liuhangbin@gmail.com,
        hkallweit1@gmail.com, andy.ren@getcruise.com, razor@blackwall.org,
        idosch@nvidia.com, lucien.xin@gmail.com, nicolas.dichtel@6wind.com,
        phil@nwl.cc, claudiajkang@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        intel-wired-lan@lists.osuosl.org, linux-rdma@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, poros@redhat.com,
        mschmidt@redhat.com, linux-clk@vger.kernel.org,
        vadim.fedorenko@linux.dev
Subject: Re: [RFC PATCH v8 01/10] dpll: documentation on DPLL subsystem
 interface
Message-ID: <ZIg8/0UJB9Lbyx2D@nanopsycho>
References: <20230609121853.3607724-1-arkadiusz.kubalewski@intel.com>
 <20230609121853.3607724-2-arkadiusz.kubalewski@intel.com>
 <20230612154329.7bd2d52f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612154329.7bd2d52f@kernel.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Tue, Jun 13, 2023 at 12:43:29AM CEST, kuba@kernel.org wrote:
>On Fri,  9 Jun 2023 14:18:44 +0200 Arkadiusz Kubalewski wrote:
>> From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
>> 
>> Add documentation explaining common netlink interface to configure DPLL
>> devices and monitoring events. Common way to implement DPLL device in
>> a driver is also covered.
>
>> +``'pin': [{
>> + {'clock-id': 282574471561216,
>> +  'module-name': 'ice',
>> +  'pin-dpll-caps': 4,
>> +  'pin-id': 13,
>> +  'pin-parent': [{'pin-id': 2, 'pin-state': 'connected'},
>> +                 {'pin-id': 3, 'pin-state': 'disconnected'},
>> +                 {'id': 0, 'pin-direction': 'input'},
>> +                 {'id': 1, 'pin-direction': 'input'}],
>> +  'pin-type': 'synce-eth-port'}
>> +}]``
>
>It seems like pin-parent is overloaded, can we split it into two
>different nests?

Yeah, we had it as two and converged to this one. The thing is, the rest
of the attrs are the same for both parent pin and parent device. I link
it this way a bit better. No strong feeling.


>
>> +SET commands format
>> +===================
>> +
>> +``DPLL_CMD_DEVICE_SET`` - to target a dpll device, the user provides
>> +``DPLL_A_ID``, which is unique identifier of dpll device in the system,
>> +as well as parameter being configured (``DPLL_A_MODE``).
>> +
>> +``DPLL_CMD_PIN_SET`` - to target a pin user has to provide a
>> +``DPLL_A_PIN_ID``, which is unique identifier of a pin in the system.
>> +Also configured pin parameters must be added.
>> +If ``DPLL_A_PIN_DIRECTION`` or ``DPLL_A_PIN_FREQUENCY`` are configured,
>> +this affects all the dpll device they are connected, that is why those
>> +attributes shall not be enclosed in ``DPLL_A_PIN_PARENT``.
>> +Other attributes:
>> +``DPLL_A_PIN_PRIO`` or ``DPLL_A_PIN_STATE`` must be enclosed in
>> +``DPLL_A_PIN_PARENT`` as their configuration relates to only one
>> +parent dpll or parent pin.
>
>Also sounds like setting pin attrs and pin-parent attrs should be
>different commands.

Could be, but what't the benefit? Also, you are not configuring
pin-parent. You are configuring pin:pin-parent tuple. Basically the pin
configuration as a child. So this is mainly config of the pin itsest
Therefore does not really make sense to me to split to two comments.
