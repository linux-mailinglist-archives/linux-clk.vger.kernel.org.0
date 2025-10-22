Return-Path: <linux-clk+bounces-29631-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71833BFB1C8
	for <lists+linux-clk@lfdr.de>; Wed, 22 Oct 2025 11:16:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3782919A03CE
	for <lists+linux-clk@lfdr.de>; Wed, 22 Oct 2025 09:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EB3C2517AF;
	Wed, 22 Oct 2025 09:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ne90qj4f"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEC330E0FD;
	Wed, 22 Oct 2025 09:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761124597; cv=none; b=d9DenquPVyqSlr2BCdGmXAX5JM4W5kF5MGA1rg/Po7mFM364KAHBJ8UEFABdupg8SizucRzQLuXzwZHazhAztMhOYFzenqKxR5M2+0Rg8ziCzPhyIpO1PyqVgUAc/0cpDEKBA3CckBzHWEEfonPPFbPx+TLzZY5IDFHLvPS5MuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761124597; c=relaxed/simple;
	bh=wmmldwLoTJHtOEgE1XNdbjbC1bd45qF3U1o6+g38EIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CXVCwGJSWCJ8q6mHESKvqscWIdHmLED+IyFLHzHa59oVRs2Ypi5Tc4UUwr1IJJv2tKOXAetZAbiW3N5DKJMwW6bsKdbrd5SI+Av+WIHSRWLEFIaJ5O/lXtetOO3RHKvQKh7EaRxs73qXygz/zW8qspqF8bBoJ//LLBUyuAJhtzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ne90qj4f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BEE3C4CEE7;
	Wed, 22 Oct 2025 09:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761124596;
	bh=wmmldwLoTJHtOEgE1XNdbjbC1bd45qF3U1o6+g38EIg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ne90qj4fRGCwJ3cK8LvrRGZVxUgo0LLbTofmKSNDZxnbKTFxGjuIIf+ixeIQS2gqR
	 CgPtZWONuLcWCwqbw7EXajXuc7wRSEhmh3gU4L1sQD4zB6hazg/G43ys8/kTte7uOg
	 nGBCMR7TkZF2FfZlciFJpD7+YO/5/7h7vJgVSc5+n1QCu/dizXQze3oSK5ap4SMj3W
	 lH3SLUXciya3FejHLDvXDk9s+JJoiXtKH2vI0dPkK7lX1O/5iUiiIStOClF75jJntm
	 cdlgsQX1MEAOL4TAsnePBXycAuuGsQaeZtCipVnZuODtlWtZb8IFeBhslIJEeDlMyS
	 UKIlxr5ZHbjeA==
Message-ID: <ad4973cb-c4a8-41d5-a646-7744692e52bb@kernel.org>
Date: Wed, 22 Oct 2025 11:16:32 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] tyr: remove impl Send/Sync for TyrData
To: Alice Ryhl <aliceryhl@google.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>, linux-clk@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251020-clk-send-sync-v2-0-44ab533ae084@google.com>
 <20251020-clk-send-sync-v2-2-44ab533ae084@google.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20251020-clk-send-sync-v2-2-44ab533ae084@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/20/25 11:35 AM, Alice Ryhl wrote:
> Now that clk implements Send and Sync, we no longer need to manually
> implement these traits for TyrData. Thus remove the implementations.
> 
> The comment also mentions the regulator. However, the regulator had the
> traits added in commit 9a200cbdb543 ("rust: regulator: implement Send
> and Sync for Regulator<T>"), which is already in mainline.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Danilo Krummrich <dakr@kernel.org>

