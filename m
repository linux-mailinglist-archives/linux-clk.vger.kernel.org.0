Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D36E1C26CA
	for <lists+linux-clk@lfdr.de>; Sat,  2 May 2020 18:14:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728336AbgEBQO6 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 2 May 2020 12:14:58 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:16945 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728325AbgEBQO6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 2 May 2020 12:14:58 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ead9c750000>; Sat, 02 May 2020 09:14:45 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Sat, 02 May 2020 09:14:57 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Sat, 02 May 2020 09:14:57 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 2 May
 2020 16:14:57 +0000
Received: from [10.2.165.119] (172.20.13.39) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 2 May 2020
 16:14:56 +0000
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
 <9c942bc9-703e-3bbb-eeab-f37e69dc1ded@nvidia.com>
 <b72b9d5c-7d02-1b58-20f7-30f94e230d58@gmail.com>
 <668d9b65-9590-cc97-41c3-2c1a5cfbbe61@nvidia.com>
 <289d9c92-383f-3257-de7b-46179724285a@nvidia.com>
 <9aa64f21-7b23-7228-b5eb-d2ff092682ad@nvidia.com>
 <668cc4a0-2c81-0d87-b801-9fbf64e19137@nvidia.com>
 <bf3f654e-b8f8-d560-fc5e-03d73cb7eab0@nvidia.com>
 <525e481b-9137-6fdd-bbf9-3779a5704e6b@nvidia.com>
 <fe7ebad6-0368-b1f0-4f58-648baa5e3f79@nvidia.com>
 <4f095181-2338-3b71-316c-f8bbfc7865cc@nvidia.com>
 <50e872bb-913a-7b47-3264-af6b1cedb0e2@nvidia.com>
 <e17a8a49-be53-465d-f64c-3f4c77391d98@nvidia.com>
 <da5154b4-85f9-3e56-a440-f75debaec3a8@nvidia.com>
 <cbb047ae-97dc-8b9a-a5ba-8e2a5dab3771@nvidia.com>
 <6ae2d00d-7955-d12b-5b56-955ef72ece26@nvidia.com>
 <f9073b28-f1f1-636c-be53-764fb0a531a1@gmail.com>
 <1767e50f-efb7-5e89-22f6-0917821b660d@nvidia.com>
 <235a4cd4-4d4a-04b8-6c65-43a4dba48a0b@nvidia.com>
Message-ID: <f8103170-7879-8597-3e3c-da9a3b6a40b3@nvidia.com>
Date:   Sat, 2 May 2020 09:14:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <235a4cd4-4d4a-04b8-6c65-43a4dba48a0b@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588436085; bh=OiDqyr/JazfyrNaV3JMZnmdkFchj7uL7aCaOoPT7eTM=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=C7tRvf/nmvVHeR91VscQFb04J8zZjd/KVLgtpdsFah0LqQ6hYEKacQFB3u47l91DH
         LDXEP6EEyl46pGtogiqNGKNZUyl0SbwvHF8winrTC7IlTMC6d9H46twAL4lBW/TwYY
         VPNgTkQOywPeBBKcSnaUI8sWMBgEetqA5jImPj/s1g2r0XUNg94x01/UPBkfHntfb8
         XuLkUW/Mto+5cwp5N2crKhSZea6xq9fV+j6SW9+7q7wDKJEXXDjcdiptHRLK6v8n2F
         mmDZbgYDSqqfCA1b6oy+m8pRbr93Leh7B4oXrN4/Svgu2Jv3vm1z+c13eT+T5d2GHR
         Hc5oP/fmbqoRQ==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 5/2/20 9:03 AM, Sowjanya Komatineni wrote:
>
> On 5/2/20 8:38 AM, Sowjanya Komatineni wrote:
>>
>> On 5/2/20 8:16 AM, Dmitry Osipenko wrote:
>>> 02.05.2020 06:55, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> On 5/1/20 8:39 PM, Sowjanya Komatineni wrote:
>>>>>
>>>>> On 5/1/20 2:05 PM, Sowjanya Komatineni wrote:
>>>>>>
>>>>>> On 5/1/20 1:58 PM, Sowjanya Komatineni wrote:
>>>>>>>
>>>>>>> On 5/1/20 1:44 PM, Sowjanya Komatineni wrote:
>>>>>>>>
>>>>>>>> On 5/1/20 11:03 AM, Sowjanya Komatineni wrote:
>>>>>>>>>
>>>>>>>>> On 4/30/20 4:33 PM, Sowjanya Komatineni wrote:
>>>>>>>>>>
>>>>>>>>>> On 4/30/20 4:14 PM, Sowjanya Komatineni wrote:
>>>>>>>>>>>>>>>>> And in this case synchronization between start/finish
>>>>>>>>>>>>>>>>> threads should be
>>>>>>>>>>>>>>>>> needed in regards to freezing.
>>>>>>>>>>>>>>>> Was thinking to have counter to track outstanding frame
>>>>>>>>>>>>>>>> w.r.t single shot issue b/w start and finish and allow to
>>>>>>>>>>>>>>>> freeze only when no outstanding frames in process.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> This will make sure freeze will not happen when any=20
>>>>>>>>>>>>>>>> buffers
>>>>>>>>>>>>>>>> are in progress
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> Note that this could be a wrong assumption, I'm not
>>>>>>>>>>>>>>>>> closely familiar
>>>>>>>>>>>>>>>>> with how freezer works.
>>>>>>>>>>>>>>> kthread_start can unconditionally allow try_to_freeze=20
>>>>>>>>>>>>>>> before
>>>>>>>>>>>>>>> start of frame capture
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> We can compute captures inflight w.r.t single shot issued
>>>>>>>>>>>>>>> during capture start and finished frames by kthread_finish
>>>>>>>>>>>>>>> and allow kthread_finish to freeze only when captures
>>>>>>>>>>>>>>> inflight is 0.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> This allows freeze to happen b/w frames but not in=20
>>>>>>>>>>>>>>> middle of
>>>>>>>>>>>>>>> frame
>>>>>>>>>>>> will have caps inflight check in v12 to allow freeze finish
>>>>>>>>>>>> thread only when no captures are in progress
>>>>>>>>>>>
>>>>>>>>>>> try_to_freeze() returns thread frozen state and looks like we
>>>>>>>>>>> can use this in kthread finish to allow finish thread to freeze
>>>>>>>>>>> only when kthread_start is already frozen and no buffers in
>>>>>>>>>>> progress/initiated for capture.
>>>>>>>>>>>
>>>>>>>>>> chan->capture_frozen holds frozen state returned from
>>>>>>>>>> try_to_freeze() in start kthread
>>>>>>>>>>
>>>>>>>>>> chan->capture_reqs increments after every single shot issued.
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> static int chan_capture_kthread_finish(void *data)
>>>>>>>>>>
>>>>>>>>>> {
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_vi_channel *chan =3D data;
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_channel_buffer *buf;
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 int caps_inflight;
>>>>>>>>>>
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 set_freezable();
>>>>>>>>>>
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 while (1) {
>>>>>>>>>> wait_event_interruptible(chan->done_wait,
>>>>>>>>>> =C2=A0!list_empty(&chan->done) ||
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0kthread_should_stop());
>>>>>>>>>>
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* dequeue buffers a=
nd finish capture */
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 buf =3D dequeue_buf_=
done(chan);
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 while (buf) {
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 t=
egra_channel_capture_done(chan, buf);
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 b=
uf =3D dequeue_buf_done(chan);
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 }
>>>>>>>>>>
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (kthread_should_s=
top())
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 b=
reak;
>>>>>>>>>>
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 caps_inflight =3D ch=
an->capture_reqs - chan->sequence;
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (chan->capture_fr=
ozen && !caps_inflight)
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 t=
ry_to_freeze();
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>>>>>
>>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>>>>>>>> }
>>>>>>>>>
>>>>>>>>> Freezing happens prior to suspend() during suspend entry and when
>>>>>>>>> we implement suspend/resume during suspend we stop streaming=20
>>>>>>>>> where
>>>>>>>>> we stop threads anyway.
>>>>>>>>>
>>>>>>>>> So, was thinking why we need these threads freezable here?
>>>>>>>>>
>>>>>>>>>
>>>>>>>> Hi Dmitry,
>>>>>>>>
>>>>>>>> Did some testing and below are latest observation and fix I=20
>>>>>>>> tested.
>>>>>>>>
>>>>>>>> wait_event_interruptible() uses schedule() which blocks the=20
>>>>>>>> freezer.
>>>>>>>> When I do suspend while keeping streaming active in background, I
>>>>>>>> see freezing of these threads fail and call trace shows __schedule
>>>>>>>> -> __switch_to from these kthreads.
>>>>>>>>
>>>>>>>> wait_event_freezable() uses freezable_schedule() which should not
>>>>>>>> block the freezer but we can't use this here as we need=20
>>>>>>>> conditional
>>>>>>>> try_to_freeze().
>>>>>>>>
>>>>>>>>
>>>>>>>> So, doing below sequence works where we set PF_FREEZER_SKIP flag
>>>>>>>> thru freezer_not_count() before wait_event which calls schedule()
>>>>>>>> and remove PF_FREEZER_SKIP after schedule allows try_to_freeze to
>>>>>>>> work and also conditional try_to_freeze below prevents freezing
>>>>>>>> thread in middle of capture.
>>>>>>>>
>>>>>>>> while (1) {
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 freezer_not_count()
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 wait_event_interruptible()
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 freezer_count()
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 ...
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 ...
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 if (chan->capture_frozen && !caps_infligh=
t)
>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 try_to_freeze()
>>>>>>>> }
>>>>>>>>
>>>>>>>> Please comment if you agree with above sequence. Will include this
>>>>>>>> in v12.
>>>>>>>>
>>>>>> sorry, freezer_count() does try_to_freeze after clearing skip flag.
>>>>>> So, dont think we can use this as we need conditional try_to_freeze.
>>>>>> Please ignore above sequence.
>>>>>>> Or probably we can take closer look on this later when we add
>>>>>>> suspend/resume support as it need more testing as well.
>>>>>>>
>>>>>>> As this is initial series which has TPG only I think we shouldn't
>>>>>>> get blocked on this now. Series-2 and 3 will be for sensor support
>>>>>>> and on next series when we add suspend/resume will look into this.
>>>>>>>
>>>>>>>
>>>>> When freeze activity starts and in case if finish thread freezes=20
>>>>> prior
>>>>> to start thread issuing capture, its the VI hardware writes data to
>>>>> the allocated buffer address.
>>>>>
>>>>> finish thread just checks for the event from the hardware and we=20
>>>>> don't
>>>>> handle/process directly on memory in this driver.
>>>>>
>>>>> So even we freeze done thread when single shot is issued frame buffer
>>>>> gets updated.
>>>>>
>>>>> In case if capture thread is frozen there will not buffers queued to
>>>>> process by finish thread. So, this will not be an issue.
>>>>>
>>>>> So, probably we don't need to do conditional try_to_freeze and=20
>>>>> what we
>>>>> have should work good in this corner case.
>>>>>
>>>> I still need to change wait_event_interruptible() to
>>>> wait_event_freezable() but no need to synchronize finish thread freeze
>>>> with start thread as even on issuing capture start its vi hardware=20
>>>> that
>>>> does frame buffer update and finish thread just checks for mw_ack=20
>>>> event
>>>> and returns buffer to application.
>>> The problem we are primarily trying to avoid is to have suspending=20
>>> being
>>> done in the middle of IO.
>>>
>>> IIUC, even if system will be suspended in the middle of VI IO, it won't
>>> be fatal. In worst case the buffer capture should fail on resume from
>>> suspend. Could you please try to simulate this potential issue and see
>>> what result will be on suspending in the middle of VI IO?
>>>
>>> We don't want to suspend system / stop streaming in the middle of=20
>>> IO, so
>>> this problem of a proper threads tear-down still exists. It should
>>> become easier to resolve the problem in a case of a proper suspending
>>> callback because the "start" thread could be turned down at any=20
>>> time, so
>>> it should be easier to maintain a proper tear-down order when threads
>>> are fully controlled by the driver, i.e. the "start" thread goes down
>>> first and the "finish" is second, blocking until the capture is=20
>>> completed.
>
> I don't see issue of tear-down threads in case of suspend as we do=20
> stop streaming where thread stop happens on both threads and are=20
> stopped only after processing all outstanding buffers.
>
> Regarding freezing activity during suspend, If done thread freezes=20
> prior to processing buffers for finish, vi hardware is still active by=20
> this time which will update the frame buffer for initiated capture.=20
> Driver is not directly involved in this frame buffer update.
>
> Finish thread only checks for completion to return buffers back to the=20
> application when done.

when done thread freeze happens after start thread initiated capture, vi=20
hardware continues to update frame buffer for ongoing capture till it=20
hits driver suspend callback. Yes worst case this frame data may not be=20
valid data if invoking of this driver suspend happens immediate after=20
this thread freeze during system suspend.

But driver will still hold buffers to return which will be returned back=20
on resume when threads are out from frozen state.

>
>
>>> I think yours suggestion about dropping the freezing from the threads
>>> for now and returning back to it later on (once a proper suspend/resume
>>> support will be added) sounds reasonable.
>>>
>>> But if you'd want to keep the freezing, then the easy solution could be
>>> like that:
>>>
>>> =C2=A0=C2=A0 1. "start" thread could freeze at any time
>>> =C2=A0=C2=A0 2. "finish" thread could freeze only when the "start" thre=
ad is=20
>>> frozen
>>> and capture isn't in-progress. Use frozen(kthread_start_capture) to
>>> check the freezing state.
>>>
>>> https://elixir.bootlin.com/linux/v5.7-rc3/source/include/linux/freezer.=
h#L25=20
>>>
>>
>> That's exactly what I tried, below is the snippet.
>>
>> But as mentioned I am seeing freezing fail when I=20
>> wait_event_interruptible() in either of the threads.
>>
>> =C2=A0=C2=A0 60.368709] Call trace:
>> [=C2=A0=C2=A0 60.371216] __switch_to+0xec/0x140
>> [=C2=A0=C2=A0 60.374768] __schedule+0x32c/0x668
>> [=C2=A0=C2=A0 60.378315] schedule+0x78/0x118
>> [=C2=A0=C2=A0 60.381606]=C2=A0 chan_capture_kthread_finish+0x244/0x2a0 [=
tegra_video]
>> [=C2=A0=C2=A0 60.387865] kthread+0x124/0x150
>> [=C2=A0=C2=A0 60.391150] ret_from_fork+0x10/0x1c
>>
>> wait_event_interruptible() API uses schedule() which blocks freezer=20
>> while wait_event_freezable APIs uses freezable_schedule() which=20
>> allows to skip freezer during schedule and then clears skip and calls=20
>> try_to_freeze()
>>
>> But we can't use wait_event_freezable() here as we need conditional=20
>> freeze.
>>
>>
>> =C2=A0=C2=A0=C2=A0 while (1) {
>> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 caps_inflight =3D chan->capture_re=
qs - chan->sequence;
>> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (frozen(chan->kthread_start_cap=
ture) && !caps_inflight)
>> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 wait_event_free=
zable(chan->done_wait,
>> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 !list_empty(&chan->done) ||
>> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 kthread_should_stop());
>> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 else
>> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 wait_event_inte=
rruptible(chan->done_wait,
>> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0!list_empty(&chan->done) ||
>> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0kthread_should_stop());
>>
>> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* dequeue buffers and finish capt=
ure */
>>
>> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ...
>>
>> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ...
>>
>>
>> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (kthread_should_stop())
>> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 break;
>> =C2=A0=C2=A0=C2=A0 }
>>
