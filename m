Return-Path: <linux-clk+bounces-8927-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1C7924BE9
	for <lists+linux-clk@lfdr.de>; Wed,  3 Jul 2024 00:57:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49F3E1C224F5
	for <lists+linux-clk@lfdr.de>; Tue,  2 Jul 2024 22:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99CA7155A55;
	Tue,  2 Jul 2024 22:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i/fY6sgV"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656EF55C08;
	Tue,  2 Jul 2024 22:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719961024; cv=none; b=PzVPXiMhuQWozELIm8XnRS6VuMRqi5hjpQSOKoHpyeZqZMN/ZmucXqylkxyIhuON5GspIhMKAIIlEXgGcP5UaaB8tUtfXK91EiMuUeu3Q6vXNzQ4lFps44h42CZyPVGUowqF8amHQEoP0P4vlCuBbTXAXygD+5NQl8zXGbn/E4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719961024; c=relaxed/simple;
	bh=9eLaRUJTytdJBsS6cjn1nKuveI+Cjm1ZYcQflF414qg=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=M5FjxPHQEiSeSqvp3spMqEa9A2fi+kRb+YqjszfEtmPu0w5v1JiygAhsdtRHGoSjqaTfYOQ3H+On8fvhQQNZbnTEty+mBMs86ej+wnVxitsROBoXriyC2gC7wqh/Ic4b/hXkkJly26A4FuDCGQgitWEKpIfTv4dXu7uaaNuTX7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i/fY6sgV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFC1EC116B1;
	Tue,  2 Jul 2024 22:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719961023;
	bh=9eLaRUJTytdJBsS6cjn1nKuveI+Cjm1ZYcQflF414qg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=i/fY6sgVL/8B09EFtm9TkqipL9U/TBoR1cCJ+PZPJo9PYVHezr3i8IJA7RRHl783R
	 FpmyzcMaYb3EX6+qpVYzFbuE3MBwmBTQw+FXAbwqw6pb1DXV8awv5TtHXm0hDn8xwd
	 5AAqDJzSaxkvC3xhM8NbBeosxLF7s8Vt8IJl8VIdffbZqsM+wxIaSFY6BWk0QUbwHD
	 w8Ik0mqYRK/IamDZZ4YedJEO8V+GZAkhEtV4x23abc599l9JDSJ3EZo5TCaJlxIV9z
	 M1s+4zIj4Gp/9foU1jQmuna0fg5XhfM/Qy5hYypqYneVOWHESAL7sfXy2YMtqEfxdT
	 knrSP/Z9qUeiA==
Message-ID: <567ef66c0a508bedd98e65cbfbd2d76e.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240613-md-arm64-drivers-clk-versatile-v1-1-6b8a5e5e00ef@quicinc.com>
References: <20240613-md-arm64-drivers-clk-versatile-v1-1-6b8a5e5e00ef@quicinc.com>
Subject: Re: [PATCH] clk: vexpress-osc: add missing MODULE_DESCRIPTION() macro
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Jeff Johnson <quic_jjohnson@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Sudeep Holla <sudeep.holla@arm.com>
Date: Tue, 02 Jul 2024 15:57:01 -0700
User-Agent: alot/0.10

Quoting Jeff Johnson (2024-06-13 14:55:17)
> With ARCH=3Darm64, make allmodconfig && make W=3D1 C=3D1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/versatile/c=
lk-vexpress-osc.o
>=20
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
>=20
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---

Applied to clk-next

