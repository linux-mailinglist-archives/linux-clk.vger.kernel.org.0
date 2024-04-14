Return-Path: <linux-clk+bounces-5601-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DA789B601
	for <lists+linux-clk@lfdr.de>; Mon,  8 Apr 2024 04:35:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D649D1C20FB9
	for <lists+linux-clk@lfdr.de>; Mon,  8 Apr 2024 02:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C3D380;
	Mon,  8 Apr 2024 02:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vL/D+LCF"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E004184D;
	Mon,  8 Apr 2024 02:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712543743; cv=none; b=PLWdCQMzpiQdTkIS9zIAqcmG9Us3uQLo81HF9Elgg6CvBgVyJqLfWuCW2fk+fpk9wWltDIANynn8QzJE9C/NKSH2cW64AqV3IfkRz07QNy1K4i0MrUTJRdIRjvP0zyMAfjFc4jlwW16tcAelE9kPtjPkGzvBrW2WyBHW4NhykTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712543743; c=relaxed/simple;
	bh=CYcF3xviOioTw0bSRBXtITDLMhC0u3sV5C5DSixd4p0=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=c77M4cU6FA7vVcgwhEBP3gVMZIpA7tUJEhH3s+QtJzq00Xzwn9qJeq8m/phYnP39+aSn3uw6y0FJ1xiwPXlHjySTlhvpI7hTqVlrmUYEcuoi+1Cq8/eQOGzuhY5vv4mUZb0iFQmmfQQrDayuclZlkDYcabi9BVMxPyszzCJJYQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vL/D+LCF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA97EC433F1;
	Mon,  8 Apr 2024 02:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712543743;
	bh=CYcF3xviOioTw0bSRBXtITDLMhC0u3sV5C5DSixd4p0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=vL/D+LCFPI5gREdEQ/yKUOesLuqnXbdKoWGFiLaFBW3ZKPFzaRihMJCLedYvaVKKa
	 Rasct69JPHDevWVLJLhw6YPj5adHXfRkZXbQQtwsOrvRywvfEYk30jljjIWO/BHpRo
	 WO0hfG4I2jEBy5REK43t5efdRGgBHW53S1yLpM3yi7PoMQvf5A2k82dM7J5oKURjBT
	 LmKYLuq/5+WYTy1xX6U0tbBtz4/TiPRB4hMR+X5/8xQzIobtAJZqdq5kz6pmcMTACU
	 KRswV8C88ZqXPCB5WkefZG3/kygGTsXQWVtV2VUuJl1rbx9EbvSX68nF5jGzswPJJ6
	 hKjNcUWDjRkqQ==
Message-ID: <07ff4ebb70e7b9edfa20e394fdba9244.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240325184204.745706-2-sboyd@kernel.org>
References: <20240325184204.745706-1-sboyd@kernel.org> <20240325184204.745706-2-sboyd@kernel.org>
Subject: Re: [PATCH v2 1/5] clk: Remove prepare_lock hold assertion in __clk_release()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, patches@lists.linux.dev, linux-arm-msm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Douglas Anderson <dianders@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Date: Sun, 07 Apr 2024 19:35:40 -0700
User-Agent: alot/0.10

Quoting Stephen Boyd (2024-03-25 11:41:55)
> Removing this assertion lets us move the kref_put() call outside the
> prepare_lock section. We don't need to hold the prepare_lock here to
> free memory and destroy the clk_core structure. We've already unlinked
> the clk from the clk tree and by the time the release function runs
> nothing holds a reference to the clk_core anymore so anything with the
> pointer can't access the memory that's being freed anyway. Way back in
> commit 496eadf821c2 ("clk: Use lockdep asserts to find missing hold of
> prepare_lock") we didn't need to have this assertion either.
>=20
> Fixes: 496eadf821c2 ("clk: Use lockdep asserts to find missing hold of pr=
epare_lock")
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---

Applied to clk-fixes

