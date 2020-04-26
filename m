Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A7411B8B13
	for <lists+linux-clk@lfdr.de>; Sun, 26 Apr 2020 04:19:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726108AbgDZCTk (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 25 Apr 2020 22:19:40 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:6440 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726087AbgDZCTj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 25 Apr 2020 22:19:39 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea4efae0000>; Sat, 25 Apr 2020 19:19:26 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sat, 25 Apr 2020 19:19:39 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sat, 25 Apr 2020 19:19:39 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 26 Apr
 2020 02:19:39 +0000
Received: from [10.2.165.152] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 26 Apr
 2020 02:19:36 +0000
Subject: Re: [RFC PATCH v10 6/9] media: tegra: Add Tegra210 Video input driver
To:     Dmitry Osipenko <digetx@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <sakari.ailus@iki.fi>,
        <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1587700513-28449-1-git-send-email-skomatineni@nvidia.com>
 <1587700513-28449-7-git-send-email-skomatineni@nvidia.com>
 <6ca93ff9-ca59-544f-767c-4355d01a5c20@gmail.com>
 <62546d1f-eca5-06be-2bc2-e45ccd53830a@xs4all.nl>
 <50fd1016-ca8b-ec5d-e5a8-f257138b152e@gmail.com>
 <658c4232-94d9-3051-8c93-bff7046cf5f2@nvidia.com>
 <03426915-25ea-69b4-bc64-f87f3046d33f@nvidia.com>
 <aabaecc4-3494-0137-7d2b-853304bfa68b@gmail.com>
 <09f20441-fec6-7496-2edc-c69db535e441@nvidia.com>
 <61799fab-858c-8b0d-ba7d-846cd041e044@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <3a9707b5-b260-6137-f475-fc88d271010f@nvidia.com>
Date:   Sat, 25 Apr 2020 19:19:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <61799fab-858c-8b0d-ba7d-846cd041e044@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587867566; bh=1MfBi+G+LzJwO7xglD1bMaMrBMfEyvyC00SZ3J576ts=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=fY2iSJMCEw10PSKDcovUub9kfACa3tIE/BFOdRshAJIAOLC8dWOAPfb2HoqdKbclv
         Gr0zglJtPtla6eqepenN4yZG9oiYZVvRpifH8AElavOEXAfdKkFxHVVHei7Upo8PU4
         1F4cZlfWmP8HD1vEcstmkjW+Nj9GnQnsY+xvVzyCOh74XU/YY0Ak4rPzhMzwD0Kpss
         Q8bFK9m32OZ8jMPh36lnLRpZVPAi1vectuPSlADVbFW72UyMNG3xb2ZDmtU93613oC
         BRDeSfKxWsLsgaIOYp2WWjTzyo/0tQFEPCMV67hfkoZdRXnU6lq/mywqeOFc/nTgDT
         UDV7WJ7r/GjYg==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 4/25/20 7:10 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 26.04.2020 04:43, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>>> It looks to me that at least all those hardcoded HW format IDs do not
>>> match the older SoCs.
>> TPG hard coded formats are supported on prior Tegra.
>>
>> Other supported formats are SoC dependent and  part of soc data in the
>> driver already.
> But I don't see where that SoC-dependent definition is made in
> terga210.c. That tegra_image_format enum looks T210-specific, isn't it?
>
> ...

Video formats which are SoC variants are made soc specific in driver=20
already tegra_vi_soc structure member video_formats

tegra_image_format enum is same for T210 and T186

For T194, enums will be diff and will have diff TEGRA194_VIDEO_FORMAT=20
using corresponding Tegra194 video format enums

>>> The driver will need to have a bit better separation if it's supposed t=
o
>>> have a common core for all SoCs. Each incompatible VI/CSI hardware
>>> version should have its own kernel module.
>> currently other Tegra host1x driver (drm) also does similar. Single
>> module for all Tegra SoCs.
> DRM driver has a proper separation of the sub-drivers where sub-driver
> won't load on unsupported hardware. The tegra-video driver should do the
> same, i.e. VI and CSI should be individual drivers (and not OPS). There
> could be a some common core, but for now it's not obvious to me what
> that core should be, maybe just the video.c.
>
>> With current tegra-video, all the v4l2 related common part of
>> implementation is same for all tegra's and only
>> tegra210.c/tegra186.c/tegra194.c will have corresponding tegra soc
>> specific vi/csi programming sequence.
> This code shouldn't be shared within the same driver module, IMO.
>
>
>>> The tegra-video should be okay, although the "video" part sounds a bit
>>> too broad since video could mean a lot of things. I think downstream
>>> kernel uses (or at least used) the tegra-camera name for the driver,
>>> perhaps it could be a reasonable variant as well.
>> prior feedback suggests not to use camera variant instead to use video
> Alright, then the tegra-video should be fine.
