Return-Path: <linux-clk+bounces-25290-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E0EB1455B
	for <lists+linux-clk@lfdr.de>; Tue, 29 Jul 2025 02:31:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C26C17CA7B
	for <lists+linux-clk@lfdr.de>; Tue, 29 Jul 2025 00:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5188B146A72;
	Tue, 29 Jul 2025 00:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Dw+9cwbt"
X-Original-To: linux-clk@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51D79461
	for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 00:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753749060; cv=none; b=YhQQSLO7XQojtGWBVUnHC3KhK5yDNIXenZwgYu6TS2/f6Dhy0DWqnH+J7cXPWJC/xhX3MItzhmiW3xWfDlpJQPgpvk4y7LJBdjVzTdKoWYJArtbbEoeiGvnL5RytzlLcCOPL8Nvwg6Z4sqS3pMgmOWe1GfHIQ6DLKc6RoNEMWCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753749060; c=relaxed/simple;
	bh=NhLnX6y5v/kLuHbpWdqEM5yt9KgJBErJRcM2uoTY6yI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UuUbHsz2IssfhXF5QvbR7BlbDhPUIjyuKtHsmBgkrTpsrzBDiW0A3xnATJ/74qQkFNe1xJol1e/sgQtz0Q1Ow972Iy9+0VWH1Q/tcnuVr69zGKH1JQd6Y4nJmzPMnI20uZAOsVfmyhPr+45gBCx+ike7tVoq7Rpx0XPJMjmdZ6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Dw+9cwbt; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pRk2fyCDyZx5gPYPB0wJzgS/Jl89GG2lzFDMkwucWZQ=; b=Dw+9cwbtwkgP4be0O3Z3sv/AFn
	HN+FWJpjJZfL9SNJ38SYnQjtJNlOB56SVZHz0w0ASooDsprr7l3K0brn3rQZY2OBxZ+0LACz1STEU
	HllkwmgZ8cmutXHOo+ekh8JTgXmwmCEL0npfXG4wJFbK7FvbxresHG2ltFR3A8BRmIlhAET36yDw/
	+wAKCZty68kE021wK6PYkoVUvIZxQ7fixnAMd5Tki4Qf+G1Re45y6r5LzMfc/W8khFFi1JZMu7rHB
	khu8MH8GNp2etaG6n3s4d4cywGTtL6md6ERfa4RR5Cj+czaUugNpRaOw9Co9IBv/1gtCWy/g9pqEf
	NiYZWgKg==;
Received: from [189.7.87.79] (helo=[192.168.0.7])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1ugYEs-005AkZ-Sx; Tue, 29 Jul 2025 02:30:43 +0200
Message-ID: <9b3c2cb3-736c-46a0-a734-f17ed4bc0170@igalia.com>
Date: Mon, 28 Jul 2025 21:30:35 -0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Power Management for Raspberry Pi V3D GPU
To: Stefan Wahren <wahrenst@gmx.net>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>, Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
References: <20250728-v3d-power-management-v1-0-780f922b1048@igalia.com>
 <e18ed574-e84e-4812-86c0-5cfd14860030@gmx.net>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <e18ed574-e84e-4812-86c0-5cfd14860030@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefan,

On 28/07/25 18:00, Stefan Wahren wrote:
> Hi,
> 
> Am 28.07.25 um 14:35 schrieb Maíra Canal:
>> This series introduces Runtime PM for Raspberry Pi's GPU, V3D.
>> Currently, the GPU clock stays up during the whole operation, even if
>> the GPU is idle. By introducing Runtime PM, we can now turn off the
>> clock completely during idle. For example, with this series, when
>> checking `vcgencmd measure_clock v3d` in the Raspberry Pi 5, we get:
>>
>> (idle)
>>
>> $ vcgencmd measure_clock v3d
>> frequency(0)=0
>>
>> (running glmark2)
>>
>> $ vcgencmd measure_clock v3d
>> frequency(0)=960016128
>>
>> To implement PM for V3D, it was needed to add a prepare and unprepare
>> hook to RPi's firmware clocks. Currently, they don't turn on and off,
>> nor lower the clock rate. Therefore, PATCH 1/3 addresses this issue in
>> clk/bcm/clk-raspberrypi.c.
>>
>> The other two patches are related to PM enablement in the V3D driver.
> Maybe you want to cherry-pick this older patch and integrate it into 
> your series? [2]

Yeah, sure! I'll add your patch to v2.

Best Regards,
- Maíra

> 
> [2] - https://github.com/lategoodbye/linux-dev/ 
> commit/2ee5e1205922b06100206e760ed8aefe0b6d322f
>>
>> To ease testing in Raspberry Pi 4 and 5, I prepared a downstream branch
>> backporting this series to rpi-6.12.y [1].
>>
>> [1] https://github.com/mairacanal/linux-rpi/tree/v3d/downstream/power- 
>> management-v2
>>
>> Best Regards,
>> - Maíra
>>
>> ---
>> Maíra Canal (3):
>>        clk: bcm: rpi: Turn firmware clock on/off when preparing/ 
>> unpreparing
>>        drm/v3d: Allocate all resources before enabling the clock
>>        drm/v3d: Introduce Runtime Power Management
>>
>>   drivers/clk/bcm/clk-raspberrypi.c |  41 ++++++++-
>>   drivers/gpu/drm/v3d/Makefile      |   3 +-
>>   drivers/gpu/drm/v3d/v3d_debugfs.c |  23 ++++-
>>   drivers/gpu/drm/v3d/v3d_drv.c     | 171 ++++++++++++++++++ 
>> +-------------------
>>   drivers/gpu/drm/v3d/v3d_drv.h     |  21 ++++-
>>   drivers/gpu/drm/v3d/v3d_gem.c     |  18 +++-
>>   drivers/gpu/drm/v3d/v3d_irq.c     |  15 ++--
>>   drivers/gpu/drm/v3d/v3d_mmu.c     |  12 ++-
>>   drivers/gpu/drm/v3d/v3d_power.c   |  79 ++++++++++++++++++
>>   drivers/gpu/drm/v3d/v3d_submit.c  |  19 ++++-
>>   10 files changed, 291 insertions(+), 111 deletions(-)
>> ---
>> base-commit: a7352c849492a30b5d8491fcb9314ab376a3942f
>> change-id: 20250728-v3d-power-management-eebb2024dc96
>>
> 


