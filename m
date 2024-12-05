Return-Path: <linux-clk+bounces-15410-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED6C9E5229
	for <lists+linux-clk@lfdr.de>; Thu,  5 Dec 2024 11:25:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A9B0162BC4
	for <lists+linux-clk@lfdr.de>; Thu,  5 Dec 2024 10:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 394951DA631;
	Thu,  5 Dec 2024 10:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s7f/dkLh"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082E31D90A7;
	Thu,  5 Dec 2024 10:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733394332; cv=none; b=WgJd+gcbkONrXzMP74I8BUrtCE3vjXZSr6rCxeQFV/fH/N3mdDbcjcgUMMmnlwowIcEws9SVVOVxEWlilFY6YU3MouR5LHalloXOn6qHp/7wyY0Ug0u923M+wFovVtjrTDEeUGDx6zZFn3Fr28sxuFqOuTkcboA9u7k0hCXlyOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733394332; c=relaxed/simple;
	bh=xc/AP1q5J7sVe4uDrqIu8OSigI0sdX0g5xbtoyVjNxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t1EXYYLpaLruVrtvC7C9k64hDZJNjMRRj2l+4m+WvWsB2ZXmwasu6TwIat+MgglR84YFplKY9Xr6nZzOSC3ZlPse4jQsXb06FzokGO9MusKAz4QQC0+EDYb/oeSwuAYeCutAWYQHCBKPNcSsAKt7XHQKDxF5mcY3/kts3uXO3aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s7f/dkLh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AEFEC4CED1;
	Thu,  5 Dec 2024 10:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733394331;
	bh=xc/AP1q5J7sVe4uDrqIu8OSigI0sdX0g5xbtoyVjNxE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s7f/dkLhhctWIeUhGLpjKXnajl+5VZbXesXWXsw3g9wn7qcKhle+r+8J9OmlTgPtP
	 4VziQdVRNp9frk6Gd3HgDsmJQ5yMp/ov/RMej/aIvR8Xt/wCVL5IdZXYLSX5/aFlsn
	 /87Q4MMfeo+q2fKouI/C2HTFxtkh1QrDsCFiZGE62cFHULm8HWpHzrMp+QWJChO7aH
	 WZVR5Rrder2DLmoTSi4Jcf4VMHrf06/SnzgMo3rTGpXSjSary79Wmj4hYZHfNLURpg
	 fKL2XVZMAOyCLw/Sk4yEDZ/gs5zbJfQiO16d1fmuulK8tUR/X2L5qUaf+0tT0M0TgV
	 9aUR7/WdcYNQw==
Date: Thu, 5 Dec 2024 11:25:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH] clk: rockchip: add clock ID for CIF0/1 on RK3066
Message-ID: <5kesytgbhfununu5li4ychaw4newkctx4wuhlshks2ertfkd2t@jauqcntehv2z>
References: <20241205055122.11613-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205055122.11613-1-val@packett.cool>

On Thu, Dec 05, 2024 at 02:50:46AM -0300, Val Packett wrote:
> RK3066 does have two "CIF" video capture interface blocks, add their
> corresponding clock IDs so that they could be used.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/clk/rockchip/clk-rk3188.c             | 4 ++--
>  include/dt-bindings/clock/rk3188-cru-common.h | 2 ++
>  2 files changed, 4 insertions(+), 2 deletions(-)

Please run scripts/checkpatch.pl and fix reported warnings. Then please
run 'scripts/checkpatch.pl --strict' and (probably) fix more warnings.
Some warnings can be ignored, especially from --strict run, but the code
here looks like it needs a fix. Feel free to get in touch if the warning
is not clear.

Best regards,
Krzysztof


