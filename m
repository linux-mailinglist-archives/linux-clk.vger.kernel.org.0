Return-Path: <linux-clk+bounces-18571-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62394A4194E
	for <lists+linux-clk@lfdr.de>; Mon, 24 Feb 2025 10:39:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAD8C18857CD
	for <lists+linux-clk@lfdr.de>; Mon, 24 Feb 2025 09:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 303D523CEF8;
	Mon, 24 Feb 2025 09:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u6uMHcNF"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026E378F2E;
	Mon, 24 Feb 2025 09:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740389962; cv=none; b=g1XUeDCbyIgmfkpPYRGljCNGCf6JjODCFsfYLn4kU6OdQsgC/SCqBYsiTHq0PbFys1NsMQSDkznxEYzpQeHwlCxIX8/Fjeg4Iqz1qjqcSB/eVCGkddLkWviCxHaiX6tz6MJP+w0aDhjUvHNR53RwBWIwztH1duFh2s5+RDCfXXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740389962; c=relaxed/simple;
	bh=3PKhhqDl4PavsonkGg8Yx9ObgvEzeG4jz8Tmf0mpBko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HkezuFliDvkm2T7FZ8ePqEmAF7KSfeueAxoLfRsJUmx5WyQUXQa2O4+E+7qT05ESnuJfWd1NSRuU9uhj6XuYX/XMyojtQlM60IrvPPTzq0peVn4aD4Uya7PGpjun2XaCnpCFDWXGGBV89Bny7/CzhY6UYWE6ak6xLva4FSgvgHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u6uMHcNF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73131C4CEDD;
	Mon, 24 Feb 2025 09:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740389961;
	bh=3PKhhqDl4PavsonkGg8Yx9ObgvEzeG4jz8Tmf0mpBko=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=u6uMHcNFouGfid1zt39RmM5n/d/QvxqWMP6UjEwnVFHVnd3OIbt8vvkwNIA1OEd+C
	 ok1+0bImlugkG6eFWSnf9e9TVWoHLVgzzrmmGho1/VvnXjOY/rtS9KUrVtYozgmAS4
	 QGEoHlzy6QWkHj6fqXky/sEEfU+Nv0ZU3GqHZlJEvv1MGCS6un2Gxt8vZYW5bSWGtU
	 kf0RFfuOdIoXDwW8krT9nrJchhwbcdQVsK6mKXu9Ja/eO15iW7tjYlq6Wpdy4q61fx
	 AfLXqBLBFqgNUYXknclqQRIxgEXkVLVRMCr5zU8uk1KzBcR1/GNfkun6iV4kCQBf/r
	 nECuGAbkRVSrg==
Message-ID: <5e740543-9bd6-483a-9722-f5d8307b6915@kernel.org>
Date: Mon, 24 Feb 2025 10:39:15 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: clock, reset: rockchip: Add support
 for rk3562
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org,
 Finley Xiao <finley.xiao@rock-chips.com>, Liang Chen <cl@rock-chips.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241224092310.3814460-1-kever.yang@rock-chips.com>
 <z7jb32foci6bamqqddkkp34hazi2itp6uclarsoi5pkrgso2go@bxflagkaciq6>
 <28dcac28-9060-4f65-8167-64f6a0e4532d@rock-chips.com>
 <2920539.yaVYbkx8dN@diego>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <2920539.yaVYbkx8dN@diego>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/02/2025 10:14, Heiko Stübner wrote:
> Am Montag, 24. Februar 2025, 09:47:40 MEZ schrieb Kever Yang:
>> Hi Krzysztof,
>>
>> On 2024/12/27 16:28, Krzysztof Kozlowski wrote:
>>> On Tue, Dec 24, 2024 at 05:23:09PM +0800, Kever Yang wrote:
>>>> From: Finley Xiao <finley.xiao@rock-chips.com>
>>>>
>>>> Add the dt-bindings header for the rk3562, that gets shared between
>>>> the clock controller and the clock references in the dts.
>>>> Add softreset ID for rk3562.
>>>>
>>>> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
>>>> Signed-off-by: Liang Chen <cl@rock-chips.com>
>>>> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
>>>> ---
>>>>
>>>> Changes in v2:
>>>> - rename the file to rockchip,rk3562-cru.h
>>>> - remove CLK_NR_CLKS
>>>> - add new file for reset ID
>>>> - update to use dual license
>>>>
>>>>   .../dt-bindings/clock/rockchip,rk3562-cru.h   | 377 ++++++++++++++++++
>>>>   .../dt-bindings/reset/rockchip,rk3562-cru.h   | 360 +++++++++++++++++
>>>
>>> No, that's not a separate patch. Headers *ALWAYS* go with the bindings
>>> patch.
>> Will fix.
>>>>   2 files changed, 737 insertions(+)
>>>>   create mode 100644 include/dt-bindings/clock/rockchip,rk3562-cru.h
>>>>   create mode 100644 include/dt-bindings/reset/rockchip,rk3562-cru.h
>>>>
>>>> diff --git a/include/dt-bindings/clock/rockchip,rk3562-cru.h b/include/dt-bindings/clock/rockchip,rk3562-cru.h
>>>> new file mode 100644
>>>> index 000000000000..ad07ad3a12ad
>>>> --- /dev/null
>>>> +++ b/include/dt-bindings/clock/rockchip,rk3562-cru.h
>>>> @@ -0,0 +1,377 @@
>>>> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
>>> Why not using license requested by checkpatch?
>>
>> The checkpatch does not report error/warning for this license, and this 
>> is the same as many other SoCs.
>>
>> Which license is recommend in the header file?
> 
> I suppose
> 
> /* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> 
> According to [0] "GPL-2.0" and "GPL-2.0-only" are equivalent, but I guess
> "GPL-2.0-only" simply makes the "only" part more visible.

No, rather use the one expressed in checkpatch.

Best regards,
Krzysztof

