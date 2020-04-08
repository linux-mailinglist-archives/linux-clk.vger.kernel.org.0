Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F8011A28F7
	for <lists+linux-clk@lfdr.de>; Wed,  8 Apr 2020 20:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728674AbgDHS64 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 8 Apr 2020 14:58:56 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:13573 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726730AbgDHS64 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Apr 2020 14:58:56 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e8e1eba0001>; Wed, 08 Apr 2020 11:58:02 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 08 Apr 2020 11:58:55 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 08 Apr 2020 11:58:55 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 8 Apr
 2020 18:58:55 +0000
Received: from [10.2.171.241] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 8 Apr 2020
 18:58:53 +0000
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <e3712e7b-b335-b35b-a94f-24eb85122dca@nvidia.com>
 <b1726d33-0d35-9323-a747-407148d0104e@gmail.com>
 <eb80178f-30f4-8f46-51cd-ea3f4914b81d@nvidia.com>
 <dd16c560-ba8f-e7df-5dc4-5227e0043196@nvidia.com>
 <fea4f0a1-4a20-34d4-9eda-e4a599eeeffc@nvidia.com>
 <760d071e-0cbc-b3eb-9231-fb9f9ecb44a6@nvidia.com>
 <9e317f65-8a02-3b15-cfec-8e0d8374130e@gmail.com>
 <97b35910-4c93-123a-43a0-eb14476ed0f3@nvidia.com>
 <84ad4e2d-6ac1-e1f4-1c55-5edaae850631@nvidia.com>
 <15a879b3-8fb9-6821-3cdc-104ba583ac12@gmail.com>
 <0c425505-347f-7418-af7e-d121fe0d06dc@nvidia.com>
 <db7c7051-5674-cdb9-0aa4-ee94125b3024@gmail.com>
 <1a31cd60-739f-0660-1c45-31487d2f2128@nvidia.com>
 <603084a5-249a-4fe2-3646-e9335ef9ab43@nvidia.com>
 <7895b9c6-f27d-8939-73d7-67d785e1a8b7@nvidia.com>
 <ea60b489-990e-4b15-e215-d93381a1371e@nvidia.com>
 <b2405c2a-73c0-ad69-ccea-0388caf8045c@gmail.com>
 <15d8b525-67b5-b437-f7fd-89f80cd0d9f6@nvidia.com>
Message-ID: <a638bb8e-bb50-7aa5-05a0-8de1c6207ba7@nvidia.com>
Date:   Wed, 8 Apr 2020 11:58:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <15d8b525-67b5-b437-f7fd-89f80cd0d9f6@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1586372282; bh=WiXwOMB6IdZZe61YJiuIGQp9xJN94uE559/iv1nBzAs=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=fFyW9LaIcFrNndkItDjS2qGndrz4UgUFDjPq4tudYfhTi00UY4WZy0FIKk49HhNOE
         NiJdPomwPyEIz+VIalXMiDC6qJU6BPFqDxGZkq6UXKcKW/u60DaHkWo/v0iWh7x/a+
         5QqsZHrpmgPppeExol8f4P9/lJZhWP+kVoCGIjmk1UrjVbG8I11ox652XWtQPtzHHl
         ++wD38kDFinJCbzgj7lt3tLLMnk1oizZVxNhvsHi27rFlAszVe82VkBAjKFBvTtvQe
         mMCA4jKF/OsWzOWNHE7Ef3fmHjDZbau4v+XZUdGoNrVAFrwqPdkXsQxlgdqZtOjLAK
         6F9w/AXFhy1CQ==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 4/8/20 10:45 AM, Sowjanya Komatineni wrote:
>
> On 4/8/20 7:21 AM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 08.04.2020 03:00, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> ...
>>>>>>> I suppose that taking a shot takes at least few milliseconds, which
>>>>>>> should be unacceptable to waste.
>>>>>> As long as buffers are in queue we have to keep processing each
>>>>>> buffer and between buffers obviously we have to wait for previous
>>>>>> frames to finish and this why we have separate thread for frame
>>>>>> finish where we can have next buffer capture ready and issue while
>>>>>> previous frame memory write happens
>>>> Also we specified numbers buffers as 3 to vb2 queue. So this is rare
>>>> case but to prevent issuing more than 2 at a time as VI HW is only
>>>> double buffered and syncpt fifo max depth is 2 added this to be safer.
>>> To be more clear, when more buffers are enqueued from userspace always
>>> capture list will be full and thread will be busy in capture till=20
>>> either
>>> error or stop stream request happens.
>>>
>> If kthreads take more than 1% of CPU time during capture (video) with
>> more than 2 buffers in queue, then it's not good and I think you should
>> do something about it. If kthreads stay at ~0%, then it should be okay
>> as-is.
>
> VI outstanding requests max can only be 2=C2=A0 as syncpt fifo depth is 2=
=C2=A0=20
> and waiting to issue next capture when already 2 captures are inflight=20
> happens only during beginning of streaming where buffers allocated go=20
> thru capture for first time after queuing.
>
> same buffers are returned to userspace after capture and same=20
> allocated buffers will be queued back for subsequent captures.
>
> So this case of holding to issue single shot when already single shot=20
> is issue for 2 frames simultaneous happens only during beginning of=20
> start stream and also we set num_buffers to allocate for queue as 3=20
> although 2 is good enough where we will not hit this case even during=20
> streaming start with 2 buffers
>
As 2 buffers are good enough to be clear will update in v7 to use 2=20
buffers so we don't need to check for more than 2 outstanding buffers.
