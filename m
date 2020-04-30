Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 055961C0981
	for <lists+linux-clk@lfdr.de>; Thu, 30 Apr 2020 23:38:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726449AbgD3Vid (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 30 Apr 2020 17:38:33 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:17084 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgD3Vic (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Apr 2020 17:38:32 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5eab45140003>; Thu, 30 Apr 2020 14:37:24 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 30 Apr 2020 14:38:31 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 30 Apr 2020 14:38:31 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Apr
 2020 21:38:31 +0000
Received: from [10.2.165.152] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Apr
 2020 21:38:29 +0000
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
 <1588197606-32124-7-git-send-email-skomatineni@nvidia.com>
 <bacc4308-4b95-f566-b80e-096ff96407b5@gmail.com>
 <4da289e6-036f-853b-beb4-379d6462adb0@gmail.com>
 <c6d54885-6f23-f60c-a17b-3481fc4d6adf@gmail.com>
 <b14b9dc5-7ac9-7735-d98d-eebc7e151cba@nvidia.com>
 <7d31d24f-f353-7e82-3ff9-cdba8b773d1e@nvidia.com>
 <06a4a067-8d54-4322-b2a6-14e82eaeda29@nvidia.com>
 <47873bbd-cf90-4595-5a99-7e9113327ecc@nvidia.com>
 <f6088e0f-4ac7-a6be-3ede-0233dc88ef2c@nvidia.com>
 <71532440-f455-cc24-74f7-9ccad5947099@gmail.com>
 <b3238987-5e8a-32f2-7ce7-924e86bc6e9e@nvidia.com>
 <298187f6-2425-4813-1ae1-f256c179623e@nvidia.com>
 <9c942bc9-703e-3bbb-eeab-f37e69dc1ded@nvidia.com>
 <b72b9d5c-7d02-1b58-20f7-30f94e230d58@gmail.com>
 <668d9b65-9590-cc97-41c3-2c1a5cfbbe61@nvidia.com>
Message-ID: <289d9c92-383f-3257-de7b-46179724285a@nvidia.com>
Date:   Thu, 30 Apr 2020 14:37:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <668d9b65-9590-cc97-41c3-2c1a5cfbbe61@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588282644; bh=hookx+pyYqTHGImeQX3FFZEfY65VPxDRIYlWFYqHMWQ=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=nMUJp0KKq8J5b8+r2/CpGELtyX2yHzwoh6c1qPomTI4DmZyYuo77qa2Qftz2UW4un
         y377YQRZOcI0Mp1m2rly/d66pEhLNLujMuNHw4SmYx/HT2oJWT/3hN6Q0W3dhLwT2V
         IvEMH8xWkhITS1r42gd0p9c5IWQdo26ZW1Pdg6WVBc91f2u8uNnQ9dkESLwdMzM6AA
         D2GQV1Yoi1APmrzvcO4jjfkNgaLSRnYPB2NMrdTE1cDT+Jj64Az3mPi9DmMbche+RI
         hiCGuLffsbTFtxRZHllXBnl2AREHxvYg9gIs1NOpV18lD8Im+1CDX45kWFzm0VpnQc
         dUVF1JdoefQtg==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 4/30/20 2:26 PM, Sowjanya Komatineni wrote:
>
> On 4/30/20 2:17 PM, Dmitry Osipenko wrote:
>> 30.04.2020 23:02, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> On 4/30/20 12:53 PM, Sowjanya Komatineni wrote:
>>>> On 4/30/20 12:46 PM, Sowjanya Komatineni wrote:
>>>>> On 4/30/20 12:33 PM, Dmitry Osipenko wrote:
>>>>>> 30.04.2020 22:09, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82=
:
>>>>>>> On 4/30/20 11:18 AM, Sowjanya Komatineni wrote:
>>>>>>>> On 4/30/20 10:06 AM, Sowjanya Komatineni wrote:
>>>>>>>>> On 4/30/20 9:29 AM, Sowjanya Komatineni wrote:
>>>>>>>>>> On 4/30/20 9:04 AM, Sowjanya Komatineni wrote:
>>>>>>>>>>> On 4/30/20 7:13 AM, Dmitry Osipenko wrote:
>>>>>>>>>>>> 30.04.2020 17:02, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=
=82:
>>>>>>>>>>>>> 30.04.2020 16:56, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=
=82:
>>>>>>>>>>>>>> 30.04.2020 01:00, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=
=B5=D1=82:
>>>>>>>>>>>>>>> +static int chan_capture_kthread_finish(void *data)
>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_vi_channel *chan =3D data;
>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 struct tegra_channel_buffer *buf;
>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 set_freezable();
>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0 while (1) {
>>>>>>>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 try_to_freeze()=
;
>>>>>>>>>>>>>> I guess it won't be great to freeze in the middle of a=20
>>>>>>>>>>>>>> capture
>>>>>>>>>>>>>> process, so:
>>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (l=
ist_empty(&chan->done))
>>>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 try_to_freeze();
>>>>>>>>>>>>> And here should be some locking protection in order not race
>>>>>>>>>>>>> with
>>>>>>>>>>>>> the
>>>>>>>>>>>>> chan_capture_kthread_start because kthread_finish could=20
>>>>>>>>>>>>> freeze
>>>>>>>>>>>>> before
>>>>>>>>>>>>> kthread_start.
>>>>>>>>>>>> Or maybe both start / finish threads should simply be=20
>>>>>>>>>>>> allowed to
>>>>>>>>>>>> freeze
>>>>>>>>>>>> only when both capture and done lists are empty.
>>>>>>>>>>>>
>>>>>>>>>>>> if (list_empty(&chan->capture) &&
>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 list_empty(&chan->done))
>>>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0try_to_freeze();
>>>>>>>>>>> good to freeze when not in middle of the frame capture but why
>>>>>>>>>>> should we not allow freeze in between captures?
>>>>>>>>>>>
>>>>>>>>>>> Other drivers do allow freeze in between frame captures.
>>>>>>>>>>>
>>>>>>>>>>> I guess we can freeze before dequeue for capture and in finish
>>>>>>>>>>> thread we can freeze after capture done. This also don't=20
>>>>>>>>>>> need to
>>>>>>>>>>> check for list_empty with freeze to allow between frame=20
>>>>>>>>>>> captures.
>>>>>>>>>>>
>>>>>>>>>> Also if we add check for both lists empty, freeze is not=20
>>>>>>>>>> allowed as
>>>>>>>>>> long as streaming is going on and in case of continuous=20
>>>>>>>>>> streaming
>>>>>>>>>> freeze will never happen.
>>>>>>>> To allow freeze b/w frames (but not in middle of a frame),
>>>>>>>>
>>>>>>>> for capture_start thread, probably we can do unconditional
>>>>>>>> try_to_freeze()
>>>>>> Is it possible to use wait_event_freezable()?
>>>>>>
>>>>>> https://www.kernel.org/doc/Documentation/power/freezing-of-tasks.txt
>>>>>>
>>>>>> Will the wait_event_interruptible() be woken up when system freezes?
>>>>> Based on wait_event_freezable implementation, looks like it similar
>>>>> to wait_event_interruptible + try_to_free() as it does
>>>>> freezable_schedule unlike schedule with wait_event_interruptible.
>>>>>
>>>>> So using this for capture_start may be ok to allow freeze before
>>>>> start of frame. But can't use for capture_finish as this is same as
>>>>> wait_event_interruptible followed by unconditional try_to_freeze.
>>>>>
>>>>>>>> for capture_finish thread, at end of capture done we can do
>>>>>>>> try_to_freeze() only when done list is empty
>>>>>> This doesn't prevent situation where the done-list is empty and the
>>>>>> "finish" thread freezes, in the same time the "start" thread=20
>>>>>> issues new
>>>>>> capture and then freezes too.
>>>>>>
>>>>>> 1. "start" thread issues capture
>>>>>>
>>>>>> 2. "finish" thread wakes and waits for the capture to complete
>>>>>>
>>>>>> 3. "start" thread begins another capture, waits for FRAME_START
>>>>>>
>>>>>> 4. system freezing activates
>>>>>>
>>>>>> 5. "finish" thread completes the capture and freezes because=20
>>>>>> done-list
>>>>>> is empty
>>>>>>
>>>>>> 6. "start" thread gets FRAME_START, issues another capture and=20
>>>>>> freezes
>>>>> This will not happen as we allow double buffering done list will not
>>>>> be empty till stream stop happens
>>>>>
>>>>> There will always be 1 outstanding frame in done list
>>>> Correction, there will always be 1 outstanding buffer except beginning
>>>> during beginning of stream.
>>>>
>>>> Except during beginning frames, done list will not be empty for all
>>>> subsequent streaming process
>>> Also to be clear, hardware sees next frame start event prior to=20
>>> previous
>>> frame mw_ack event as mw_ack event happens after frame end. So once
>>> initial buffer got queued to done list to finish processes, while
>>> waiting for mw_ack next frame start happens and pushes next buffer to
>>> done list.
>> What about this variant:
>>
>> 1. "start" thread wakes up to start capture
>>
>> 2. system freezing activates
>>
>> 3. "finish" thread wakes up and freezes
>
> finish thread will wake up only when done list is not=20
> empty/kthread_stop/wake even from capture start thread.
>
> Also when I said will allow try_to_free when done list is empty I=20
> meant to have this at end of capture_done() in finish thread
>
>>
>> 4. "start" thread issues capture and freezes
>>
>> And again, I assume that system's freezing should wake
>> wait_event_interruptible(), otherwise it won't be possible to freeze
>> idling threads at all and freezing should fail (IIUC).
>
> Based on kernel doc on freezing, looks like when we mark thread as=20
> freezable, freeze state happens when we explicitly call try_to_freeze.
>
> I don't think its other way where freeze causes=20
> wait_event_interruptible to wake up.
>
>> And in this case synchronization between start/finish threads should be
>> needed in regards to freezing.
>
> Was thinking to have counter to track outstanding frame w.r.t single=20
> shot issue b/w start and finish and allow to freeze only when no=20
> outstanding frames in process.
>
> This will make sure freeze will not happen when any buffers are in=20
> progress
>
>> Note that this could be a wrong assumption, I'm not closely familiar
>> with how freezer works.

kthread_start can unconditionally allow try_to_freeze before start of=20
frame capture

We can compute captures inflight w.r.t single shot issued during capture=20
start and finished frames by kthread_finish and allow kthread_finish to=20
freeze only when captures inflight is 0.

This allows freeze to happen b/w frames but not in middle of frame


