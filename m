Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 338265FD603
	for <lists+linux-clk@lfdr.de>; Thu, 13 Oct 2022 10:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbiJMINV (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 13 Oct 2022 04:13:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229818AbiJMINS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Oct 2022 04:13:18 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE2B014BB47;
        Thu, 13 Oct 2022 01:13:09 -0700 (PDT)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id EBA306600371;
        Thu, 13 Oct 2022 09:13:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1665648787;
        bh=smD0/NhMQR4/etaWt6dKTglcSl1DRPkD2tFvA7nwi4E=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=GQ9Qn6MXk7YNLSujoEkZNGSK9Txvl2SWKyQcAl97YPy7vSagvqeiZuv+5W8QvputM
         D7No38TmHGuw7V8PcczYj+4OXxgMYyA8ZNhhP8I05O0ziKzxF5BkPrKnBfedsqsCEC
         Jmx/x0PVf5GK8NQrF57GkjATbQQ6IHaWI/frSqB0T060i3Cqvn3J3jG8AtibID+nL9
         bwhEY9Uaj1gKVSJ3d7lXgmx/FOkxIUFBCe8nbw0EmsvG8qCmJb4JeZaGaDqdw6XFAQ
         Ax41Ty3EmiyoxJEQgQ/WcHrxKaIyY5fOHPtf0IMkr7lCU1MxRuvM/YnNb6V2brnlND
         i4Ztcnx1E2inQ==
Message-ID: <3cba4b83-98e7-0351-71f0-1aaa67f97797@collabora.com>
Date:   Thu, 13 Oct 2022 10:13:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2] clk: mediatek: clk-mux: Add .determine_rate() callback
Content-Language: en-US
To:     Maxime Ripard <maxime@cerno.tech>, Chen-Yu Tsai <wens@kernel.org>
Cc:     sboyd@kernel.org, mturquette@baylibre.com, matthias.bgg@gmail.com,
        chun-jie.chen@mediatek.com, miles.chen@mediatek.com,
        wenst@chromium.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221011135548.318323-1-angelogioacchino.delregno@collabora.com>
 <20221012085555.3nls7ja56vlnaz2w@houat>
 <c4a1eb9f-016d-c184-e494-c869038b87ff@collabora.com>
 <20221012094004.jgiyvmbgomiyedik@houat>
 <6e76f90f-3b6a-330d-6902-b31bf3d33ad4@collabora.com>
 <20221012114813.6d6adro746w5bd7c@houat>
 <decfd5e5-a48b-b2d1-f21b-1a4d52e05538@collabora.com>
 <20221012135619.wxyzuqheolhypoec@houat>
 <20221012164204.oulzmj67hxrojrb6@houat>
 <CAGb2v67A5u99mgNTdDfp4161OKKKjib5kM_EuWHJXBwUvxXU+g@mail.gmail.com>
 <20221013071921.ny6qskjubweiyq6q@houat>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221013071921.ny6qskjubweiyq6q@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Il 13/10/22 09:19, Maxime Ripard ha scritto:
> On Thu, Oct 13, 2022 at 12:52:41AM +0800, Chen-Yu Tsai wrote:
>> On Thu, Oct 13, 2022 at 12:42 AM Maxime Ripard <maxime@cerno.tech> wrote:
>>>
>>> On Wed, Oct 12, 2022 at 03:56:19PM +0200, Maxime Ripard wrote:
>>>> On Wed, Oct 12, 2022 at 02:14:39PM +0200, AngeloGioacchino Del Regno wrote:
>>>>> Il 12/10/22 13:48, Maxime Ripard ha scritto:
>>>>>> On Wed, Oct 12, 2022 at 11:57:15AM +0200, AngeloGioacchino Del Regno wrote:
>>>>>>> Il 12/10/22 11:40, Maxime Ripard ha scritto:
>>>>>>>> On Wed, Oct 12, 2022 at 11:09:59AM +0200, AngeloGioacchino Del Regno wrote:
>>>>>>>>> Il 12/10/22 10:55, Maxime Ripard ha scritto:
>>>>>>>>>> Hi,
>>>>>>>>>>
>>>>>>>>>> On Tue, Oct 11, 2022 at 03:55:48PM +0200, AngeloGioacchino Del Regno wrote:
>>>>>>>>>>> Since commit 262ca38f4b6e ("clk: Stop forwarding clk_rate_requests
>>>>>>>>>>> to the parent"), the clk_rate_request is .. as the title says, not
>>>>>>>>>>> forwarded anymore to the parent:
>>>>>>>>>>
>>>>>>>>>> It's not entirely true, the rate request should still be forwarded, but
>>>>>>>>>> we don't pass the same instance of clk_rate_request anymore.
>>>>>>>>>>
>>>>>>>>>>> this produces an issue with the MediaTek clock MUX driver during GPU
>>>>>>>>>>> DVFS on MT8195, but not on MT8192 or others.
>>>>>>>>>>>
>>>>>>>>>>> This is because, differently from others, like MT8192 where all of
>>>>>>>>>>> the clocks in the MFG parents tree are of mtk_mux type, but in the
>>>>>>>>>>> parent tree of MT8195's MFG clock, we have one mtk_mux clock and
>>>>>>>>>>> one (clk framework generic) mux clock, like so:
>>>>>>>>>>>
>>>>>>>>>>> names: mfg_bg3d -> mfg_ck_fast_ref -> top_mfg_core_tmp (or) mfgpll
>>>>>>>>>>> types: mtk_gate ->      mux        ->     mtk_mux      (or) mtk_pll
>>>>>>>>>>>
>>>>>>>>>>> To solve this issue and also keep the GPU DVFS clocks code working
>>>>>>>>>>> as expected, wire up a .determine_rate() callback for the mtk_mux
>>>>>>>>>>> ops; for that, the standard clk_mux_determine_rate_flags() was used
>>>>>>>>>>> as it was possible to.
>>>>>>>>>>
>>>>>>>>>> It probably fixes things indeed, but I'm a bit worried that it just
>>>>>>>>>> works around the actual issue instead of fixing the actual bug...
>>>>>>>>>>
>>>>>>>>>>> This commit was successfully tested on MT6795 Xperia M5, MT8173 Elm,
>>>>>>>>>>> MT8192 Spherion and MT8195 Tomato; no regressions were seen.
>>>>>>>>>>>
>>>>>>>>>>> For the sake of some more documentation about this issue here's the
>>>>>>>>>>> trace of it:
>>>>>>>>>>>
>>>>>>>>>>> [   12.211587] ------------[ cut here ]------------
>>>>>>>>>>> [   12.211589] WARNING: CPU: 6 PID: 78 at drivers/clk/clk.c:1462 clk_core_init_rate_req+0x84/0x90
>>>>>>>>>>> [   12.211593] Modules linked in: stp crct10dif_ce mtk_adsp_common llc rfkill snd_sof_xtensa_dsp
>>>>>>>>>>>                    panfrost(+) sbs_battery cros_ec_lid_angle cros_ec_sensors snd_sof_of
>>>>>>>>>>>                    cros_ec_sensors_core hid_multitouch cros_usbpd_logger snd_sof gpu_sched
>>>>>>>>>>>                    snd_sof_utils fuse ipv6
>>>>>>>>>>> [   12.211614] CPU: 6 PID: 78 Comm: kworker/u16:2 Tainted: G        W          6.0.0-next-20221011+ #58
>>>>>>>>>>> [   12.211616] Hardware name: Acer Tomato (rev2) board (DT)
>>>>>>>>>>> [   12.211617] Workqueue: devfreq_wq devfreq_monitor
>>>>>>>>>>> [   12.211620] pstate: 40400009 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>>>>>>>>>> [   12.211622] pc : clk_core_init_rate_req+0x84/0x90
>>>>>>>>>>> [   12.211625] lr : clk_core_forward_rate_req+0xa4/0xe4
>>>>>>>>>>> [   12.211627] sp : ffff80000893b8e0
>>>>>>>>>>> [   12.211628] x29: ffff80000893b8e0 x28: ffffdddf92f9b000 x27: ffff46a2c0e8bc05
>>>>>>>>>>> [   12.211632] x26: ffff46a2c1041200 x25: 0000000000000000 x24: 00000000173eed80
>>>>>>>>>>> [   12.211636] x23: ffff80000893b9c0 x22: ffff80000893b940 x21: 0000000000000000
>>>>>>>>>>> [   12.211641] x20: ffff46a2c1039f00 x19: ffff46a2c1039f00 x18: 0000000000000000
>>>>>>>>>>> [   12.211645] x17: 0000000000000038 x16: 000000000000d904 x15: 0000000000000003
>>>>>>>>>>> [   12.211649] x14: ffffdddf9357ce48 x13: ffffdddf935e71c8 x12: 000000000004803c
>>>>>>>>>>> [   12.211653] x11: 00000000a867d7ad x10: 00000000a867d7ad x9 : ffffdddf90c28df4
>>>>>>>>>>> [   12.211657] x8 : ffffdddf9357a980 x7 : 0000000000000000 x6 : 0000000000000004
>>>>>>>>>>> [   12.211661] x5 : ffffffffffffffc8 x4 : 00000000173eed80 x3 : ffff80000893b940
>>>>>>>>>>> [   12.211665] x2 : 00000000173eed80 x1 : ffff80000893b940 x0 : 0000000000000000
>>>>>>>>>>> [   12.211669] Call trace:
>>>>>>>>>>> [   12.211670]  clk_core_init_rate_req+0x84/0x90
>>>>>>>>>>> [   12.211673]  clk_core_round_rate_nolock+0xe8/0x10c
>>>>>>>>>>> [   12.211675]  clk_mux_determine_rate_flags+0x174/0x1f0
>>>>>>>>>>> [   12.211677]  clk_mux_determine_rate+0x1c/0x30
>>>>>>>>>>> [   12.211680]  clk_core_determine_round_nolock+0x74/0x130
>>>>>>>>>>> [   12.211682]  clk_core_round_rate_nolock+0x58/0x10c
>>>>>>>>>>> [   12.211684]  clk_core_round_rate_nolock+0xf4/0x10c
>>>>>>>>>>> [   12.211686]  clk_core_set_rate_nolock+0x194/0x2ac
>>>>>>>>>>> [   12.211688]  clk_set_rate+0x40/0x94
>>>>>>>>>>> [   12.211691]  _opp_config_clk_single+0x38/0xa0
>>>>>>>>>>> [   12.211693]  _set_opp+0x1b0/0x500
>>>>>>>>>>> [   12.211695]  dev_pm_opp_set_rate+0x120/0x290
>>>>>>>>>>> [   12.211697]  panfrost_devfreq_target+0x3c/0x50 [panfrost]
>>>>>>>>>>> [   12.211705]  devfreq_set_target+0x8c/0x2d0
>>>>>>>>>>> [   12.211707]  devfreq_update_target+0xcc/0xf4
>>>>>>>>>>> [   12.211708]  devfreq_monitor+0x40/0x1d0
>>>>>>>>>>> [   12.211710]  process_one_work+0x294/0x664
>>>>>>>>>>> [   12.211712]  worker_thread+0x7c/0x45c
>>>>>>>>>>> [   12.211713]  kthread+0x104/0x110
>>>>>>>>>>> [   12.211716]  ret_from_fork+0x10/0x20
>>>>>>>>>>> [   12.211718] irq event stamp: 7102
>>>>>>>>>>> [   12.211719] hardirqs last  enabled at (7101): [<ffffdddf904ea5a0>] finish_task_switch.isra.0+0xec/0x2f0
>>>>>>>>>>> [   12.211723] hardirqs last disabled at (7102): [<ffffdddf91794b74>] el1_dbg+0x24/0x90
>>>>>>>>>>> [   12.211726] softirqs last  enabled at (6716): [<ffffdddf90410be4>] __do_softirq+0x414/0x588
>>>>>>>>>>> [   12.211728] softirqs last disabled at (6507): [<ffffdddf904171d8>] ____do_softirq+0x18/0x24
>>>>>>>>>>> [   12.211730] ---[ end trace 0000000000000000 ]---
>>>>>>>>>>
>>>>>>>>>> ... Indeed, you shouldn't hit that warning at all. It happens in
>>>>>>>>>> clk_core_round_rate_nolock, which takes (before your patch) the
>>>>>>>>>> CLK_SET_RATE_PARENT branch. This indeed has been changed by the patch
>>>>>>>>>> you mentioned, and will call clk_core_forward_rate_req() now, that in
>>>>>>>>>> turn calls clk_core_init_rate_nolock().
>>>>>>>>>>
>>>>>>>>>> I think the warning you hit is because core->parent is NULL, which is
>>>>>>>>>> passed to clk_core_forward_rate_req() as the parent argument, and we'll
>>>>>>>>>> call clk_core_init_rate_req() with parent set as the core argument.
>>>>>>>>>>
>>>>>>>>>> In clk_core_init_rate_req(), the first thing we do is a WARN_ON(!core),
>>>>>>>>>> which is what you hit here I think.
>>>>>>>>>>
>>>>>>>>>> This is different to the previous behavior that was calling
>>>>>>>>>> clk_core_round_rate_nolock() with core->parent directly, and
>>>>>>>>>> clk_core_round_rate_nolock() if its core argument is NULL will set
>>>>>>>>>> req->rate to 0 and bail out without returning an error.
>>>>>>>>>>
>>>>>>>>>> Now, your patch probably works because now that you provide a
>>>>>>>>>> determine_rate implementation, clk_core_can_round() returns true and
>>>>>>>>>> you'll take a different branch in clk_core_round_rate_nolock(), avoiding
>>>>>>>>>> that issue entirely.
>>>>>>>>>>
>>>>>>>>>> Does that patch work better (on top of next-20221012)?
>>>>>>>>>
>>>>>>>>> I admit I didn't go too deep in the research, as my brain processed that as
>>>>>>>>> "this is a mux clock, not really different from a standard mux, this callback
>>>>>>>>> is missing, that's not optimal"... then that fixed it and called it a day.
>>>>>>>>>
>>>>>>>>> I should've prolonged my research for a better understanding of what was
>>>>>>>>> actually going on.
>>>>>>>>
>>>>>>>> No worries :)
>>>>>>>>
>>>>>>>>> What you said actually opened my mind and, with little surprise, your patch
>>>>>>>>> works as good as mine - no warnings and the clock scales as expected!
>>>>>>>>
>>>>>>>> I'm actually wondering if you didn't encounter two issues. What kernel
>>>>>>>> were you testing before? If it's older than today's next
>>>>>>>> (next-20221012), you're likely missing
>>>>>>>>
>>>>>>>
>>>>>>> I was testing next-20221011.
>>>>>>>
>>>>>>>> https://lore.kernel.org/linux-clk/20221010-rpi-clk-fixes-again-v1-0-d87ba82ac404@cerno.tech/
>>>>>>>>
>>>>>>>> Which is likely to be what fixed the clock scaling. And my patch only
>>>>>>>> fixed the warning. Could you test next-20221012? If I'm right, you
>>>>>>>> should only get the warning.
>>>>>>>>
>>>>>>>
>>>>>>> No, I am getting the same situation even after rebasing over next-20221012, without
>>>>>>> any of the two patches (determine_rate() for mtk mux, nor the one you shared for
>>>>>>> clk.c), when the warning happens, I get very slow GPU operation and the same "nice"
>>>>>>> timeout:
>>>>>>>
>>>>>>> [   27.785514] panfrost 13000000.gpu: gpu sched timeout, js=1,
>>>>>>> config=0x7b00, status=0x0, head=0xa1cb180, tail=0xa1cb180,
>>>>>>> sched_job=00000000f07d39e3
>>>>>>>
>>>>>>> ...so I'm not encountering the same issue that you've fixed with the patches that
>>>>>>> got merged in next-20221012.
>>>>>>>
>>>>>>> Of course, as you were expecting, the warning is also still there and still
>>>>>>> the same:
>>>>>>>
>>>>>>> [   27.750504] WARNING: CPU: 4 PID: 164 at drivers/clk/clk.c:1462
>>>>>>> clk_core_init_rate_req+0x84/0x90
>>>>>>
>>>>>> Ok. I'm still a bit unsure why it actually fixes anything.
>>>>>>
>>>>>> In the current next, clk_core_init_rate_req (through
>>>>>> clk_core_forward_rate_req) will bail out right away, but the patch will
>>>>>> clear the request and set the requested rate.
>>>>>>
>>>>>> I don't think the req->rate assignment changes anything because our next
>>>>>> call will be to clk_core_round_rate_nolock that will clear it in the
>>>>>> !core path, but it might just be that we don't initialize the request
>>>>>> and end up with some garbage data in it?
>>>>>>
>>>>>> Could you test, on top of next-20221012,
>>>>>
>>>>> No that's not the case, this patch has no effect at all (yes I've tested it).
>>>>
>>>> Ok. Too bad. I've tried to build a test case that was reproducing what
>>>> you experience, but I don't seem to be able to build one for now.
>>>>
>>>> If we go back to your previous explanation on the clock tree, and what
>>>> we discussed then, there's still something a bit puzzling.
>>>>
>>>> You were saying that are calling clk_set_rate on mfg_bg3d, which is a
>>>> mtk_gate, registered with mtk_clk_register_gate(), and with the
>>>> mtk_clk_gate_ops_setclr clk_ops. There's no determine_rate / round_rate
>>>> implementation which makes sense for a gate, and CLK_SET_RATE_PARENT is
>>>> set by mtk_clk_register_gate(). Everything's good.
>>>>
>>>> The clk_set_rate call will thus be forwarded to its parent,
>>>> mfg_ck_fast_ref, which is a mux, registered with
>>>> devm_clk_hw_register_mux(), with CLK_SET_RATE_PARENT as well. Makes
>>>> sense too, any clk_set_rate() call will thus evaluate all of the
>>>> mfg_ck_fast_ref parents and will either adjust the rate of a parent, or
>>>> reparent.
>>>>
>>>> mfg_ck_fast_ref then has two parents, top_mfg_core_tmp and mfgpll.
>>>> Judging from your patch, top_mfg_core_tmp is being used.
>>>> top_mfg_core_tmp is a mtk_mux, registered by mtk_clk_register_mux()
>>>> (through mtk_clk_register_muxes()), and using
>>>> mtk_mux_gate_clr_set_upd_ops. CLK_SET_RATE_PARENT is set by
>>>> mtk_clk_register_mux(). That flag still makes sense for a mux. However,
>>>> it's really not clear to me how a mux operates without a determine_rate
>>>> implementation to forward the rates to each of its parents.
>>>>
>>>> It looks like we were relying before on the fact that the request was
>>>> indeed forwarded as is to the current parent. It looks like the parent
>>>> was not registered at all (core->parent being NULL), and then it was
>>>> working because of $REASON, possibly one of the muxes preferred to
>>>> switch to some other clock source.
>>>>
>>>> I think we need to address this in multiple ways:
>>>>
>>>> - If you have ftrace enabled on that platform, running with "tp_printk
>>>>    trace_event=clk:*" in the kernel command line on a failing kernel would
>>>>    be great, so that we can figure out what is happening exactly.
>>>
>>> I spent more time trying to create a setup similar to yours but couldn't
>>> find anything obviously wrong. In addition to the above, could you start
>>> a faulty kernel with that patch:
>>>
>>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>>> index 884a58a98b6b..774953901a35 100644
>>> --- a/drivers/clk/clk.c
>>> +++ b/drivers/clk/clk.c
>>> @@ -262,6 +262,9 @@ EXPORT_SYMBOL_GPL(__clk_get_name);
>>>
>>>   const char *clk_hw_get_name(const struct clk_hw *hw)
>>>   {
>>> +       if (!hw || !hw->core)
>>> +               return "(null)";
>>> +
>>>          return hw->core->name;
>>>   }
>>>   EXPORT_SYMBOL_GPL(clk_hw_get_name);
>>> @@ -1471,6 +1474,17 @@ static bool clk_core_can_round(struct clk_core * const core)
>>>          return core->ops->determine_rate || core->ops->round_rate;
>>>   }
>>>
>>> +static void clk_core_request_dump(const struct clk_core *core,
>>> +                                 const struct clk_rate_request *req)
>>> +{
>>> +       pr_crit("%s\n", core ? core->name : "(null)");
>>> +       pr_crit("\trate %lu\n", req->rate);
>>> +       pr_crit("\tmin %lu, max %lu\n", req->min_rate, req->max_rate);
>>> +       pr_crit("\tbest parent %s, rate %lu\n",
>>> +               clk_hw_get_name(req->best_parent_hw),
>>> +               req->best_parent_rate);
>>> +}
>>> +
>>>   static int clk_core_round_rate_nolock(struct clk_core *core,
>>>                                        struct clk_rate_request *req)
>>>   {
>>> @@ -2254,8 +2268,12 @@ static unsigned long clk_core_req_round_rate_nolock(struct clk_core *core,
>>>
>>>          clk_core_init_rate_req(core, &req, req_rate);
>>>
>>> +       clk_core_request_dump(core, &req);
>>> +
>>>          ret = clk_core_round_rate_nolock(core, &req);
>>>
>>> +       clk_core_request_dump(core, &req);
>>> +
>>>          /* restore the protection */
>>>          clk_core_rate_restore_protect(core, cnt);
>>>
>>>
>>> Alternatively, can I easily get a MT8195 device to test more easily?
>>
>> The Acer Spin Chromebook 513, specifically CP513-2H, should be available
>> on Amazon in both the US and UK. No idea about France though. And it's
>> quite pricey.
> 
> Thanks, but I was more expecting some kind of SBC, and it's a bit too
> expensive for me indeed :/
> 

Yeah that's the one - and it's exactly the device that I'm using here.

Btw, I will avoid pasting the same trace over and over again and skip to
the output that you added with the patch.

[   11.447922] panfrost 13000000.gpu: clock rate = 699999695
[   11.453402] panfrost 13000000.gpu: Looking up mali-supply from device tree
[   11.461842] mfg_bg3d
[   11.471067] 	rate 700000000
[   11.473857] 	min 0, max 18446744073709551615
[   11.478123] 	best parent mfg_ck_fast_ref, rate 699999695

...

[   11.826631] mfg_bg3d
[   11.829249] 	rate 699999695
[   11.832472] 	min 0, max 18446744073709551615
[   11.837159] 	best parent mfg_ck_fast_ref, rate 699999695

...

[   12.190365] mfg_bg3d
[   12.198676] 	rate 390000000
[   12.206494] 	min 0, max 18446744073709551615
[   12.236155] 	best parent mfg_ck_fast_ref, rate 699999695

...

[   12.592687] mfg_bg3d
[   12.592693] 	rate 390000000
[   12.592698] 	min 0, max 18446744073709551615
[   12.592702] 	best parent mfg_ck_fast_ref, rate 390000000


Cheers
