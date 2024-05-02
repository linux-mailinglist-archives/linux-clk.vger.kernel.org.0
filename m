Return-Path: <linux-clk+bounces-6594-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A33F8B92FD
	for <lists+linux-clk@lfdr.de>; Thu,  2 May 2024 02:59:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C00D01F222EA
	for <lists+linux-clk@lfdr.de>; Thu,  2 May 2024 00:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A2A1101D5;
	Thu,  2 May 2024 00:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="npTV4eTK"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B53611E;
	Thu,  2 May 2024 00:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714611559; cv=none; b=FcGXAlBpmOfhwsMKjc2yBstbG/0yDzyFTpOHLlY/FNaU2Tj2B879TdIXD9LXGzMNc5+1hoGtTN0Sl0GoV63OQJLCqIv3inr+u/44MndaCUIUyOelVVseGdNiqDBIsXxZOxnwnjhIzUwLZU68lvBalWW1LelvT8oOoBxufNVGgWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714611559; c=relaxed/simple;
	bh=6ULR7/aKKck3oti7bK77wM96VZEwl/g2WBCutz1hb58=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=PR+bhxInkkye84c1ZOdFBgtt7qcSTZ4Kq0fOkuk3OjUQOWoWmRqBgLtu6a5jaIwki3AH6s3+PqbTMhgmfR3IWvx/aumfSRz89zHX7Fp3A0NmPhP277zoI1sQViqu8EXvjf+j0RLuHWzD1RAVXst2wu7DgWbGQlEc0wt1lw95U64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=npTV4eTK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69F7BC072AA;
	Thu,  2 May 2024 00:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714611558;
	bh=6ULR7/aKKck3oti7bK77wM96VZEwl/g2WBCutz1hb58=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=npTV4eTKB8tvctTHdjorqOIsEI2gHXZi86P1oXpso//GFtvWABBSYG8WkgXjIsnND
	 BHnrI8ATWxGQZT8oDy+qvWKIin4mLMnNeNDz+lyy0OgfQY3OVLxDbu2YBuoMo3g+L9
	 mcNjOlDeaBlngrOIIiJ/szGk7ALbqZwyS9Lq7j9bnL5ybNYFU+VVtLzxAqsMm0QVAP
	 uH/nr1MOX/9Y/GZngH4sUf54/f8K22EhxazAbdtvlH28Pzw56V6PsgWPtZ1ce2595S
	 Qi03vUJlPL2ZPS5Zop6eu/P6QhVSuPfL6w5/pSz5QiWS2Hyp+YVkoKgvfOe84iAMNP
	 XQtIbmPaDT+JA==
Message-ID: <e15b8a1165a5437ab1fa868ccd0b629c.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <E1rl62V-004UFh-Te@rmk-PC.armlinux.org.uk>
References: <E1rl62V-004UFh-Te@rmk-PC.armlinux.org.uk>
Subject: Re: [PATCH] clkdev: report over-sized strings when creating clkdev entries
From: Stephen Boyd <sboyd@kernel.org>
Cc: Duanqiang Wen <duanqiangwen@net-swift.com>, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
Date: Wed, 01 May 2024 17:59:16 -0700
User-Agent: alot/0.10

Quoting Russell King (Oracle) (2024-03-15 04:47:55)
> Report an error when an attempt to register a clkdev entry results in a
> truncated string so the problem can be easily spotted.
>=20
> Reported by: Duanqiang Wen <duanqiangwen@net-swift.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Applied to clk-next

