Return-Path: <linux-clk+bounces-8142-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4129390BC7C
	for <lists+linux-clk@lfdr.de>; Mon, 17 Jun 2024 22:57:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D861B28178A
	for <lists+linux-clk@lfdr.de>; Mon, 17 Jun 2024 20:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B3C198A02;
	Mon, 17 Jun 2024 20:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="gDQRIre0"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8327492;
	Mon, 17 Jun 2024 20:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718657823; cv=none; b=Hy9MT8tEaJbDilB9wnmcbzBkhlK73d7C47VaNn8teddYCjn2kWV6+fzvUCdvE6j9XdihBNz0cd1x8OvMLWK8crmXgGz1ugSfHlwzbtYNRNLtWg9/bytEY+GDyCUu5EkGHqLiHBx+c9QhBuaiWODfGc2/fnfl+fa0v2/r4R1tXHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718657823; c=relaxed/simple;
	bh=gxYwdYwNEIXTMjbnwc0x3JYFfswwDi3PbV6UxOnva0I=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=H8PYzEq7l9TdxdziiSbnTPwpPhp2/cYnnnRpUriP0N4d+R3/m7u2SJh07WiKikVm537en6xQ8f+kA9lNc6tNebg6+Wvn7OLeByV192aSjsmFmfQEY56KVnKjCw4tSXkKFDlEe2IlaoWOdOTsk5xyFl6kHu5Ze4bjzxi/OBmGyOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=gDQRIre0; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1718657818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B0b1pWrdGahjc5mnO1xKSRT8jsHp5loCfKfaw5bWIjA=;
	b=gDQRIre07RFJ9Xp9kBuZUFFbeI0LYbWhqlDGqneNFGAMGrNN4LGcvP+moA3SbkdvSl3HUX
	/MRz/oSChHsfy2VaLmaHZznZUN5ferXomuvLZDHJH7oZmisflT++kGT0MC64wGLrvHbKay
	TFOV8EKkjRjFBy0ULt3zQKAZN9IEEfjUaadRyqOaaiBTGOx8e61E5dg+fvc7k5VmLBD+1d
	CeR5cqgdnW69NqJlFoEbdO+ymYc5yUWjcy66G8GNzFU2nygQtWb73o2sbSbyVqKPcz6qzO
	nejY76uk20AGlEpI7pJndPsTpFf4MsMyJjQgeAJ9n+N5f3MlDQphjmIDuIRg0w==
Date: Mon, 17 Jun 2024 22:56:57 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 dri-devel@lists.freedesktop.org, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Yakir Yang
 <kuankuan.y@gmail.com>, Jeffy Chen <jeffy.chen@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 02/13] clk: rockchip: Set parent rate for DCLK_VOP clock
 on RK3228
In-Reply-To: <6a2293ec-1506-4fe7-a3cf-fcfc594c19cc@kwiboo.se>
References: <20240615170417.3134517-1-jonas@kwiboo.se>
 <20240615170417.3134517-3-jonas@kwiboo.se> <19757196.sIn9rWBj0N@diego>
 <6a2293ec-1506-4fe7-a3cf-fcfc594c19cc@kwiboo.se>
Message-ID: <32481efc439b66da6d109e1484255aaf@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

On 2024-06-17 22:50, Jonas Karlman wrote:
> On 2024-06-17 22:30, Heiko Stübner wrote:
>> Am Samstag, 15. Juni 2024, 19:03:53 CEST schrieb Jonas Karlman:
>>> Similar to DCLK_LCDC on RK3328, the DCLK_VOP on RK3228 is typically
>>> parented by the hdmiphy clk and it is expected that the DCLK_VOP and
>>> hdmiphy clk rate are kept in sync.
>>> 
>>> Use CLK_SET_RATE_PARENT and CLK_SET_RATE_NO_REPARENT flags, same as 
>>> used
>>> on RK3328, to make full use of all possible supported display modes.
>>> 
>>> Fixes: 0a9d4ac08ebc ("clk: rockchip: set the clock ids for RK3228 
>>> VOP")
>>> Fixes: 307a2e9ac524 ("clk: rockchip: add clock controller for 
>>> rk3228")
>>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>> 
>> did your mailer have a hickup? Somehow I got patch2 (only this one)
>> 2 times
> 
> Strange, not something I know about, each patch 1-13 are listed as 250
> Accepted (heiko@sntech.de) and patches arrived to the ML and patchwork:
> 
> https://lore.kernel.org/all/20240615170417.3134517-1-jonas@kwiboo.se/
> https://patchwork.freedesktop.org/series/134926/
> https://patchwork.kernel.org/cover/13699322/

It might be that something is wrong with the MX host for sntech.de, I 
got
one email rejected today with "invalid certificate" (or something like 
that)
as the error message.

