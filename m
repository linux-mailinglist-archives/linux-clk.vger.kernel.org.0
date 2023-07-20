Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19C1C75A3AA
	for <lists+linux-clk@lfdr.de>; Thu, 20 Jul 2023 02:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbjGTAwr (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 19 Jul 2023 20:52:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbjGTAwr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Jul 2023 20:52:47 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC22A92
        for <linux-clk@vger.kernel.org>; Wed, 19 Jul 2023 17:52:45 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1b9c368f4b5so9677035ad.0
        for <linux-clk@vger.kernel.org>; Wed, 19 Jul 2023 17:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689814365; x=1692406365;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EjfJbiTBWLwjCWBASk0UmbTrmdJcbucBE9z0RzX0Ebg=;
        b=Bi2aDFsQ73w6a3Zo+IsjLw4XbkOH2rOQivGXG7Mh/2aA00CEGLJ7iJe3hkoTKiqllW
         KuGtzw1CM8J8gSqi1gnMoNMeJNVK+iGj7ztBzKQBSHmmgdxmkR5pij4GS9k1iKC+/PX3
         IhrPEVfZQg8NZSu+Eb/tZz/DYC0WuD8BQUjzBGDc0FOwASVg8dRL7T7VG55uTiA1Q02r
         GyaEk8ZvdoUpq/hM/8NcrJsUUs6p1w5V8/mhDFjDGDXxT8iGZqO0+fBGDpq5r0KVHAGn
         frpRfbLlbWqP60amm7SnuWXSYbSx64IBXu1E9UnEWoCTNMODhXQHCWRlDGSSgQLcQjBa
         BpxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689814365; x=1692406365;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EjfJbiTBWLwjCWBASk0UmbTrmdJcbucBE9z0RzX0Ebg=;
        b=OFNVoON2HVChe6lz6iMTkMcAhcFMU6lX/s1j443GiOO3vcblLqhLIagbghomHWDIdw
         m7Dy6WyiHNaf3KN8UJf/cGapRlSF1+5AvMKtv12reW0xN+Sjcy4E92D05Q5E4oMlXfL+
         dapU680D+rBDEMlHMHs6+TrkUhs6yABMHeYzQG6W6bkNt2iq7ZUbdjqQN1Nsxji69JHG
         yWyhv93jrNbAvn0/nRoHpSv2l8TIcjypPzQxz1uYPp0j21vc3Q08pzXkFgA+6S9GYSf+
         IieQ293ZAoMHVDEMIv6Q9VvGY8850sheezRCU/M0+k73cC6Z4BzZVHJiYRr0mJL+eyF8
         184A==
X-Gm-Message-State: ABy/qLaOlovgU12wYqRISQF43wNmCHqitRGAkb3RVXvvzp38wph3tmwk
        vYIVxOgiWeTJcdOmWeAlfHG81yck/VI=
X-Google-Smtp-Source: APBJJlFbO683DSjl7AltR/nyz5I1ZDMAUnrs0PEOuYdsWjXBTfe2mdvvye1HSf7PlO+XdIx7FqmeMw==
X-Received: by 2002:a17:902:da85:b0:1b4:5699:aac1 with SMTP id j5-20020a170902da8500b001b45699aac1mr4865748plx.12.1689814365210;
        Wed, 19 Jul 2023 17:52:45 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id ix19-20020a170902f81300b001b9d335223csm4621909plb.26.2023.07.19.17.52.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 17:52:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <bc762d5f-28bd-fb2d-e05f-7e7ee35c9c06@roeck-us.net>
Date:   Wed, 19 Jul 2023 17:52:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
References: <2b594e50-2bbf-4a2d-88e6-49fc39f3957a@roeck-us.net>
 <0a13bc5364ea3cde3724c1e7a1d700d4.sboyd@kernel.org>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: Backtraces with CONFIG_CLK_KUNIT_TEST=y+CONFIG_LOCKDEP=y
In-Reply-To: <0a13bc5364ea3cde3724c1e7a1d700d4.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 7/19/23 17:01, Stephen Boyd wrote:
> Quoting Guenter Roeck (2023-07-19 16:11:36)
>> Hi,
>>
>> when booting a kernel with both CONFIG_CLK_KUNIT_TEST and CONFIG_LOCKDEP
>> enabled, I get a lot of warning backtraces such as the following.
> 
> Is it the same as
> https://lore.kernel.org/r/202301310919.b9d56ee3-yujie.liu@intel.com or
> something different?
> 
>>
>> [   11.119313] ------------[ cut here ]------------
>> [   11.119797] WARNING: CPU: 0 PID: 155 at drivers/clk/clk.c:708 clk_core_get_boundaries+0xdc/0xec

The Intel report would be this one.

Guenter

>> [   11.121064] CPU: 0 PID: 155 Comm: kunit_try_catch Tainted: G                 N 6.5.0-rc2-00046-gccff6d117d8d #1
>> [   11.121580] Hardware name: Generic DT based system
>> [   11.122046]  unwind_backtrace from show_stack+0x18/0x1c
>> [   11.122429]  show_stack from dump_stack_lvl+0x38/0x5c
>> [   11.122712]  dump_stack_lvl from __warn+0x7c/0x134
>> [   11.122978]  __warn from warn_slowpath_fmt+0x7c/0xbc
>> [   11.123247]  warn_slowpath_fmt from clk_core_get_boundaries+0xdc/0xec
>> [   11.123569]  clk_core_get_boundaries from clk_core_init_rate_req+0x50/0x90
>> [   11.123899]  clk_core_init_rate_req from clk_leaf_mux_set_rate_parent_determine_rate+0x60/0x264
>> [   11.124287]  clk_leaf_mux_set_rate_parent_determine_rate from kunit_generic_run_threadfn_adapter+0x1c/0x28
>> [   11.124702]  kunit_generic_run_threadfn_adapter from kthread+0xf8/0x120
>> [   11.125017]  kthread from ret_from_fork+0x14/0x3c
>> [   11.125345] Exception stack(0x881a5fb0 to 0x881a5ff8)
>> [   11.125710] 5fa0:                                     00000000 00000000 00000000 00000000
>> [   11.126084] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
>> [   11.126531] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
>> [   11.127384] irq event stamp: 1047
>> [   11.127717] hardirqs last  enabled at (1057): [<80166cb4>] __up_console_sem+0x68/0x88
>> [   11.128177] hardirqs last disabled at (1066): [<80166ca0>] __up_console_sem+0x54/0x88
>> [   11.128553] softirqs last  enabled at (0): [<80110cc4>] copy_process+0x810/0x216c
>> [   11.128941] softirqs last disabled at (0): [<00000000>] 0x0
>> [   11.129327] ---[ end trace 0000000000000000 ]---
>> [   11.129704] ------------[ cut here ]------------
>> [   11.129991] WARNING: CPU: 0 PID: 155 at drivers/clk/clk.c:1595 clk_core_round_rate_nolock+0xec/0x214
>> [   11.130455] CPU: 0 PID: 155 Comm: kunit_try_catch Tainted: G        W        N 6.5.0-rc2-00046-gccff6d117d8d #1
>> [   11.130891] Hardware name: Generic DT based system
>> [   11.131160]  unwind_backtrace from show_stack+0x18/0x1c
>> [   11.131446]  show_stack from dump_stack_lvl+0x38/0x5c
>> [   11.131721]  dump_stack_lvl from __warn+0x7c/0x134
>> [   11.131987]  __warn from warn_slowpath_fmt+0x7c/0xbc
>> [   11.132266]  warn_slowpath_fmt from clk_core_round_rate_nolock+0xec/0x214
>> [   11.132594]  clk_core_round_rate_nolock from clk_leaf_mux_set_rate_parent_determine_rate+0x6c/0x264
>> [   11.133001]  clk_leaf_mux_set_rate_parent_determine_rate from kunit_generic_run_threadfn_adapter+0x1c/0x28
>> [   11.133397]  kunit_generic_run_threadfn_adapter from kthread+0xf8/0x120
>> [   11.133699]  kthread from ret_from_fork+0x14/0x3c
>> [   11.133962] Exception stack(0x881a5fb0 to 0x881a5ff8)
>> [   11.134238] 5fa0:                                     00000000 00000000 00000000 00000000
>> [   11.134592] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
>> [   11.134943] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
>> [   11.135244] irq event stamp: 1131
>> [   11.135473] hardirqs last  enabled at (1141): [<80166cb4>] __up_console_sem+0x68/0x88
>> [   11.135828] hardirqs last disabled at (1150): [<80166ca0>] __up_console_sem+0x54/0x88
>> [   11.136203] softirqs last  enabled at (0): [<80110cc4>] copy_process+0x810/0x216c
>> [   11.137215] softirqs last disabled at (1169): [<80118fb0>] __irq_exit_rcu+0x12c/0x164
>> [   11.137649] ---[ end trace 0000000000000000 ]---
>> [   11.137993] ------------[ cut here ]------------
>> [   11.138279] WARNING: CPU: 0 PID: 155 at drivers/clk/clk.c:1467 clk_core_determine_round_nolock+0xc0/0x134
>> [   11.138732] CPU: 0 PID: 155 Comm: kunit_try_catch Tainted: G        W        N 6.5.0-rc2-00046-gccff6d117d8d #1
>> [   11.139164] Hardware name: Generic DT based system
>> [   11.139423]  unwind_backtrace from show_stack+0x18/0x1c
>> [   11.139703]  show_stack from dump_stack_lvl+0x38/0x5c
>> [   11.139996]  dump_stack_lvl from __warn+0x7c/0x134
>> [   11.140273]  __warn from warn_slowpath_fmt+0x7c/0xbc
>> [   11.140563]  warn_slowpath_fmt from clk_core_determine_round_nolock+0xc0/0x134
>> [   11.140909]  clk_core_determine_round_nolock from clk_leaf_mux_set_rate_parent_determine_rate+0x6c/0x264
>> [   11.141323]  clk_leaf_mux_set_rate_parent_determine_rate from kunit_generic_run_threadfn_adapter+0x1c/0x28
>> [   11.141758]  kunit_generic_run_threadfn_adapter from kthread+0xf8/0x120
>> [   11.142112]  kthread from ret_from_fork+0x14/0x3c
>> [   11.142422] Exception stack(0x881a5fb0 to 0x881a5ff8)
>> [   11.142696] 5fa0:                                     00000000 00000000 00000000 00000000
>> [   11.143061] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
>> [   11.143386] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
>> [   11.143674] irq event stamp: 1223
>> [   11.143910] hardirqs last  enabled at (1233): [<80166cb4>] __up_console_sem+0x68/0x88
>> [   11.144277] hardirqs last disabled at (1242): [<80166ca0>] __up_console_sem+0x54/0x88
>> [   11.144645] softirqs last  enabled at (1174): [<80101494>] __do_softirq+0x224/0x3b0
>> [   11.145053] softirqs last disabled at (1169): [<80118fb0>] __irq_exit_rcu+0x12c/0x164
>> [   11.145398] ---[ end trace 0000000000000000 ]---
>>
>> It would be great if the problem can get fixed so I can enable
>> both options in my boot tests. I'd be happy to submit a patch
>> (or patch series) to fix it, but I have no idea what is actually
>> wrong.
> 
> The problem is that clk_leaf_mux_set_rate_parent_determine_rate() is
> calling __clk_determine_rate() without the prepare_lock held.
> __clk_determine_rate() is a clk provider API and the expectation is that
> it is called from clk providers with the prepare lock held. The simplest
> thing to do is probably make a kunit test API that can manually grab and
> release the prepare lock and then call it from the test.

