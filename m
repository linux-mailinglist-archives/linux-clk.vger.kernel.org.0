Return-Path: <linux-clk+bounces-12093-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 810DE979C0B
	for <lists+linux-clk@lfdr.de>; Mon, 16 Sep 2024 09:32:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 460C8283E35
	for <lists+linux-clk@lfdr.de>; Mon, 16 Sep 2024 07:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 121B584D34;
	Mon, 16 Sep 2024 07:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="IetheAX8"
X-Original-To: linux-clk@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCE2200A3;
	Mon, 16 Sep 2024 07:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726471928; cv=none; b=O+rSVkWlY7C58ZkMCuiHVBQOcOEoGkP2+3gfGUV2pdS6I+3tYJqzH7QIMDdeN2bhTkQYPX+Eb6dDbylpdvKZhqKKMVFI6+0ydYXhvBVU9VguUUk1C5l7+eV0kbILtA1TGysZEiykKQL500CB2FP5WZwPFWcTFCQQTOEHkmOef5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726471928; c=relaxed/simple;
	bh=2bTZu7joD1ImKzjNsHvEHaAk+oEt0DZuYQsH7FNuClA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OI5d6V3H7k220V6ytKLQnDqUt4577qEPchyz2bn0xX24dagNaXWjnfO3/tmmAoMul0NqB65ZLcfRApY6CxIAppNgfy16+Ogtx4MNUxqoMe1jkHG0FZg7X6W/XYoqgqKK1jjbGbNUjjK0iRcNZzZsHcm9/0NOWdPDiqbU3YtEFwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=IetheAX8; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 2184123C92;
	Mon, 16 Sep 2024 09:31:55 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ra5D3m98mpsN; Mon, 16 Sep 2024 09:31:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1726471914; bh=2bTZu7joD1ImKzjNsHvEHaAk+oEt0DZuYQsH7FNuClA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IetheAX8+p3M6gP7pLTOWuWhvl9kGjnfZOauuxwVXDSJ2zICGrOQMVR3BaMxODbaY
	 u+xU3gOx5GNQnZ3b+bhIswcJb230xPFXAqgtbj838ED5OHo/0pXoCUrPt4HxVRXCtX
	 J0hQFjPBnoFqAmNgDur4NAd3w3NZkEh4d5LJJjW8ShKjrYj1uqdXg006qk5Sktk6o6
	 KsdtTCTaZ+kXmch5EqHSpyb7kcUY8VQ+K+ueZkkLnBsROFMcYo3ZL5Dfh+HLa+b/Zj
	 IYVQ80HlUWPFcyWo8507eVn6FV5ynA8L2vmfrLCP85QRRfwfFJAIh+48qO9dXuF9db
	 0FfYZ5BOeL9iw==
Date: Mon, 16 Sep 2024 07:31:25 +0000
From: Yao Zi <ziyao@disroot.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: rockchip: fix finding of maximum clock ID
Message-ID: <Zufezf_lr7GlYm6u@pineapple>
References: <20240912133204.29089-2-ziyao@disroot.org>
 <fmfvorsje7fjto3c4bwyqxsa6xrs234xlse4whcsu3ebm3lrvs@oyppckftaeok>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fmfvorsje7fjto3c4bwyqxsa6xrs234xlse4whcsu3ebm3lrvs@oyppckftaeok>

On Sat, Sep 14, 2024 at 08:48:53AM +0200, Sebastian Reichel wrote:
> Hi,
> 
> On Thu, Sep 12, 2024 at 01:32:05PM GMT, Yao Zi wrote:
> > If an ID of a branch's child is greater than current maximum, we should
> > set new maximum to the child's ID, instead of its parent's.
> > 
> > Fixes: 2dc66a5ab2c6 ("clk: rockchip: rk3588: fix CLK_NR_CLKS usage")
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > ---
> 
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> oops, good catch. Note, that the function returns the correct value
> for RK3588, since the clocks with the highest IDs are of GATE_LINK
> type and do not have their child field set.

yes, but it does hit me when working for rk3528 clock controller unit.

> I have not checked all
> the Rockchip SoCs converted for 6.12, so I suggest sending this as
> fixes material for 6.12.

I have done a rough check and think no code in 6.11 release is affected.

> 
> Greetings,
> 
> -- Sebastian

Cheers,
Yao Zi

