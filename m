Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE6AC4C7D5C
	for <lists+linux-clk@lfdr.de>; Mon, 28 Feb 2022 23:29:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231477AbiB1W3v (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 28 Feb 2022 17:29:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229741AbiB1W3u (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Feb 2022 17:29:50 -0500
X-Greylist: delayed 925 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 28 Feb 2022 14:29:09 PST
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net [89.40.174.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D30D9EDF1A
        for <linux-clk@vger.kernel.org>; Mon, 28 Feb 2022 14:29:08 -0800 (PST)
Received: from [77.244.183.192] (port=62650 helo=[192.168.178.41])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1nOoGy-000Fab-VO; Mon, 28 Feb 2022 23:13:41 +0100
Message-ID: <b15f993b-d67b-b96a-904c-53025eda3aa3@lucaceresoli.net>
Date:   Mon, 28 Feb 2022 23:13:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Questions regarding regarding idt/renesas versaclock5 driver
Content-Language: it-IT
To:     Adam Ford <aford173@gmail.com>,
        Sean Anderson <sean.anderson@seco.com>
Cc:     "Fillion, Claude" <Claude.Fillion@mksinst.com>,
        linux-clk <linux-clk@vger.kernel.org>
References: <MN2PR03MB5008EB5F50B680C2A2E271D893019@MN2PR03MB5008.namprd03.prod.outlook.com>
 <9e4e542f-6f73-164e-581e-17369aada2f3@seco.com>
 <CAHCN7xKVMCC_Sgqp_Dgpwyi4X4rq4qKi2MheA_CK1vcrm3JjyA@mail.gmail.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <CAHCN7xKVMCC_Sgqp_Dgpwyi4X4rq4qKi2MheA_CK1vcrm3JjyA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On 28/02/22 18:06, Adam Ford wrote:
> On Mon, Feb 28, 2022 at 10:04 AM Sean Anderson <sean.anderson@seco.com> wrote:
>>
>>
>>
>> On 2/28/22 7:35 AM, Fillion, Claude wrote:
>>>
>>> You don't often get email from claude.fillion@mksinst.com. Learn why this is important <http://aka.ms/LearnAboutSenderIdentification>
>>>
>>>
>>> Hello  Sean,
>>>
>>>
> 
> + Luca Ceresoli
> 
>>>
>>> I have a design that is looking to use the Renesas 5P49V6965 or 5P49V690 clock chip and am looking to use the versaclock 5 driver (https://github.com/Xilinx/linux-xlnx/blob/master/drivers/clk/clk-versaclock5.c).
>>>
>>>
>>>
>>> I am new to writing drivers and have two questions I am hoping you can help me with:
>>>
>>> 1) In the driver I see the following code:
>>>
>>> static const struct vc5_chip_info idt_5p49v6901_info = {
>>>
>>>             .model = IDT_VC6_5P49V6901,
>>>
>>>             .clk_fod_cnt = 4,
>>>
>>>             .clk_out_cnt = 5,
>>>
>>>             .flags = VC5_HAS_PFD_FREQ_DBL,
>>>
>>> };
>>>
>>>
>>>
>>> static const struct vc5_chip_info idt_5p49v6965_info = {
>>>
>>>             .model = IDT_VC6_5P49V6965,
>>>
>>>             .clk_fod_cnt = 4,
>>>
>>>             .clk_out_cnt = 5,
>>>
>>>             .flags =  VC5_HAS_BYPASS_SYNC_BIT,
>>>
>>> };
>>>
>>>
>>>
>>> However, the 6965 part also has the same frequency doubling bit as the 6901.  Would it be better to set the flags for the 6965 to something like this?
>>>
>>>
>>>
>>> static const struct vc5_chip_info idt_5p49v6965_info = {
>>>
>>>             .model = IDT_VC6_5P49V6965,
>>>
>>>             .clk_fod_cnt = 4,
>>>
>>>             .clk_out_cnt = 5,
>>>
>>>             .flags = VC5_HAS_PFD_FREQ_DBL | VC5_HAS_BYPASS_SYNC_BIT,
>>>
>>> };
>>
>> I think Adam will have a better idea about this.
>>
>>> 2) I am unclear how to set the output frequencies for the device. For my application I would like to set output clock 1 to 250MHz and output clock 2 to 46.8MHz but I am unclear how to do so.  I have looked at the documentation at https://mjmwired.net/kernel/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml but remain unclear how to set the output frequencies.  Any insight you could provide would be greatly appreciated.
>>
>> Use assigned-clock-frequencies as described in
>> Documentation/devicetree/bindings/clock/clock-bindings.txt
>>
> 
> I agree that the clock-bindings have the instructions on how to set
> them.  If you check
> arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi, there are some
> examples of how to set the frequency.
> In my instance,  the chip wasn't enabling the output by default, so I
> needed to submit some patches upstream to make sure the device that
> was being clocked by this device had get and enable functions to make
> sure the clock chip would turn on the clock when requested.

Indeed assigned-clocks is the way to enable a clock when the downstream
driver does not request it. Not that it is easy to find: it took me a
while to find it the first time I needed it.

>>> I saw your name mentioned so I am emailing  you directly.  If there is a better place to ask these questions can you please direct me there?  Thanks you so much.
>>
>> Adam (CC'd) wrote the original driver, so he's probably a
>> better person to start with. You should also CC the linux-clk
>> mailing list for questions about clock drivers.
> 
> I've reviewed the datasheet for the 6965, and it doesn't explicitly
> show the multiplier, but the programmer's guide does appear to show
> the existence of bit that when set, it will "double the reference
> frequency for the Phase frequency detector" but on the programmer's
> guide for the 6901, the same bit reads "Enables frequency doubler when
> set to 1" so it's not clear to me that these functions are exactly the
> same, but implies that it might be.  I'll need some time to test this,
> but if I find it works, I can push a patch to this driver.  I added
> Luca, as he is the maintainer for this driver as well.

Thanks Adam. I'm afraid I have no detailed answer as I never tried this
bit, but according to the docs indeed it looks like there is a doubler
as you noticed, that it is disabled by default. It would be nice to test
it and submit a patch, thanks!

-- 
Luca
