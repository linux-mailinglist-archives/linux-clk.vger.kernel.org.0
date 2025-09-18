Return-Path: <linux-clk+bounces-25955-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0224B21E49
	for <lists+linux-clk@lfdr.de>; Tue, 12 Aug 2025 08:27:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8839350441F
	for <lists+linux-clk@lfdr.de>; Tue, 12 Aug 2025 06:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 869D12D781B;
	Tue, 12 Aug 2025 06:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d9IVLmyT"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6D92D6E59;
	Tue, 12 Aug 2025 06:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754980000; cv=none; b=ExjFh5hX1Z2WrA8Dj7b+YFT3GCyPASSK2RiKJ7hIBlZPAYE2H71qXCcLv/GJkfYUOyhB9pl7Sy7N+FpZjDjRdumTV5/T8hn+LWvfGDuVJ46/GT6zSz5FufyVyBcHspY6ElikWmqqVpYynkPG1tPhYstQfzqKmc1V5bWY1HXHVV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754980000; c=relaxed/simple;
	bh=DW4caqAaUAFiJnppjj7GSSRY5w1nJcdZe58Eqb/GHPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YIWbxFxcsOFAk2wKhMnQb8RohrgwTFqCGS0Vyu/Wu9BSNYhQyFgO+r86vSNsOHWMXDDMMYsrrxqWVq+Vl+9DQu8eB8UbdEjRruYrbbJ1LgLJjKfUOmjRhixOfJdjgiAWxNBzUtvcxLqii/WTUuGJ7fASCznCJCde91/egpB7g2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d9IVLmyT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F5DC4CEF0;
	Tue, 12 Aug 2025 06:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754980000;
	bh=DW4caqAaUAFiJnppjj7GSSRY5w1nJcdZe58Eqb/GHPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d9IVLmyTqRl/js9PJE7kEmyGdv2/ri+Q6qzrTzHrcv9aTuZ80RmQwDtmovA4g9Ogt
	 nJG2XqL+Vb9m/FJk1+GzFtKK1kVKKl5OdsxsM2V8j/4TJ1TR/5SavbGHACdrJws4FC
	 sz3yI46Gxu50x3LiYtj0KutJin3umWc4fiAIDv6e7nXI2DLNpHrDUaBMQbYIfP/sUt
	 idLp7MyLjFlhLXRGvHqW2XEFVHoAkKPRIXlZqqfeyu+xqtTUE8JkO2nLcgrWdH3ZzL
	 fPsNI7UcO8a1r6MLTEYgaACXuWBPbW63CAMpJiRTme1mU4r1uWd0xHN40ejoaEcpdA
	 IGN8Gw8eEzzWQ==
Date: Mon, 11 Aug 2025 23:26:38 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4 FIXED] clk: thead: th1520-ap: set all AXI clocks to
 CLK_IS_CRITICAL
Message-ID: <aJrenvdlWd2mxzGB@x1>
References: <20250812054258.1968351-4-uwu@icenowy.me>
 <20250812060408.1979487-1-uwu@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812060408.1979487-1-uwu@icenowy.me>

On Tue, Aug 12, 2025 at 02:04:08PM +0800, Icenowy Zheng wrote:
> The AXI crossbar of TH1520 has no proper timeout handling, which means
> gating AXI clocks can easily lead to bus timeout and thus system hang.
> 
> Set all AXI clock gates to CLK_IS_CRITICAL. All these clock gates are
> ungated by default on system reset.
> 
> In addition, convert all current CLK_IGNORE_UNUSED usage to
> CLK_IS_CRITICAL to prevent unwanted clock gating.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
> This is for fixing my unfortunate rebasing error when tweaking the
> sequence of the patchset.
> 
> Please ignore the original 3/4, which created a build failure because of
> forgetting to remove extra definition of npu-axi and cpu2vp.

Thanks for fixing. I'll review the rest.

-Drew

