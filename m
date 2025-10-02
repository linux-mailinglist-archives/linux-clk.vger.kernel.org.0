Return-Path: <linux-clk+bounces-28698-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA96BB2405
	for <lists+linux-clk@lfdr.de>; Thu, 02 Oct 2025 03:18:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D286D3B77F1
	for <lists+linux-clk@lfdr.de>; Thu,  2 Oct 2025 01:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C2BD86250;
	Thu,  2 Oct 2025 01:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CVHLQJt6"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218932746A;
	Thu,  2 Oct 2025 01:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759367762; cv=none; b=fEPvpYwwQQXKYE0F5WNuxuHVdL9O1InOz0MpLe/OdNHq+vIhQvcGzYoDtA4Nm/C+AzGSmQy4rYjgpHVqpI3PEMEZ9kPrAItdY5iynnjoukpGVFWD3LvNi4FJl9R6VGeCYoGYvEbf4hgXBG6gf6IJQqMAtQ125847dic2bIaibZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759367762; c=relaxed/simple;
	bh=N+IBo+cFLuUB2dPL/xezIvU81xhMiJVOYHb+D0G1mBo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=h8vn+ISXRexb3DjjRKzpiHLnWOQvhc8uMTQqMDgIrQTSzQQh4S1Gdpq/22w3fWLCZL7qXvoz81l5e/WoyAP54jVQ9Nb9lDlxjLHiFaOGPFj1LN3PhtwTPDZrzrSbwxG1muGJeqt1/9cIee4afI2O1sQsLVEFHubshxsWXgPXpVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CVHLQJt6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C730BC4CEF1;
	Thu,  2 Oct 2025 01:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759367761;
	bh=N+IBo+cFLuUB2dPL/xezIvU81xhMiJVOYHb+D0G1mBo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CVHLQJt6/U8JVWBmh/0TqGImN2GEOkvWc3wmV6zZHdNnG5hJhRHZN1Iy9Pb6CpUuy
	 fcvQSFWM7XIi3+nbl3B+C+UPrCBw2mnJNzLdv78a31essSprgiAKwx/zwzh+bbyBGL
	 BfcSOuKeZyp7fkWQyyi/kp1WFSjGqik/1n6AYcOIU40n+qN18rjvq+rClZ1dZSHBV2
	 vWqk1ieXvlaLS2mt+xkKEh4Cb9X+IdQkyiezlMXKIukQesTo7zzRw2TjwRGGhE+CAb
	 z9tNmwjsCWzJ+o5OqAcnhL4r7pehD1hbjIynLpZDdRIzg+rHmdSsETbf4UVnolxBEH
	 XzIijTzu+n2AQ==
Date: Wed, 1 Oct 2025 19:15:56 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
cc: Michael Turquette <mturquette@baylibre.com>, 
    Stephen Boyd <sboyd@kernel.org>, Rahul Pathak <rpathak@ventanamicro.com>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Anup Patel <apatel@ventanamicro.com>, Paul Walmsley <pjw@kernel.org>, 
    linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: COMMON_CLK_RPMI should depend on RISCV
In-Reply-To: <ed37635b59b0765ed3dbed6ea33c562a40b9e287.1759243789.git.geert+renesas@glider.be>
Message-ID: <6555b47f-919b-b56c-4a76-352c904343c2@kernel.org>
References: <ed37635b59b0765ed3dbed6ea33c562a40b9e287.1759243789.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 30 Sep 2025, Geert Uytterhoeven wrote:

> The RISC-V platform management interface (RPMI) is only available on
> RISC-V platforms.  Hence add a dependency on RISCV, to prevent asking
> the user about this driver when configuring a kernel for a different
> architecture.
> 
> Fixes: 5ba9f520f41a33c9 ("clk: Add clock driver for the RISC-V RPMI clock service group")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks Geert for catching this.

This patch is against unmerged patches in -next.  So I'll plan to add this 
to the PR that I plan to send to Linus tomorrow -- unless any of the 
drivers/clk maintainers would prefer that I not.

> And perhaps the "default RISCV" should be dropped, too?

Probably.  I guess we should just add this to the arch/riscv defconfig 
instead.  Let's wait on this one for a few days to see if anyone has any 
comments, and consider that change for v6.18-rc fixes.


thanks again,

- Paul

