Return-Path: <linux-clk+bounces-29813-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FB2C0A1A8
	for <lists+linux-clk@lfdr.de>; Sun, 26 Oct 2025 02:25:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 34C4E34AE0B
	for <lists+linux-clk@lfdr.de>; Sun, 26 Oct 2025 01:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D071229B2E;
	Sun, 26 Oct 2025 01:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i41rtwFW"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83E71F8723;
	Sun, 26 Oct 2025 01:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761441945; cv=none; b=cFK8rB2+TgvbTo+qSSVkc6fgRS9D4SVFOofSyUa2cag0++FGZoNnV4hv3vgXq0ppgsQB/1mUTwVZ0jfZt4okQ7l663u/hWv5epeXxx6+RUfIC5NizcAvX4syDcOHx0gLW4iILW+AOP7rq5H5s2KGMxsYYRDXu1bNi4PbeycXYu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761441945; c=relaxed/simple;
	bh=70P8xlYI642awQAB/EnR8mAGXnx+RlbtYNmpsU6er98=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=MYk48R0jIK9x/w2qCrEWgXkjn+mM0z9qM9ESiSOpASiXTaeL1g02uIGpqdQ5Jv/M0NJS7lUfTSSy99rDCrH0uh5OtxEJaqVtlGW8u1BOjiY9TQZaC4EW+hjpQTNeJNPZew2MWolceCEEBeziHEUIZOjlhLeI5wiJre5aStssCao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i41rtwFW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6190FC4CEF5;
	Sun, 26 Oct 2025 01:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761441945;
	bh=70P8xlYI642awQAB/EnR8mAGXnx+RlbtYNmpsU6er98=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=i41rtwFWYrS9j3p7cGKkbv3/UooN0UNjRUbgnJlkAl7Bd/Mhb3mBjn6w9IXIyJDXj
	 tDU+gytiFp5hsjUcvrITOKlGafH9XZLa9zuHB5xeUp8KeWvTQHukuWx/AKHBoBO4hR
	 j5K6S1FLCWJDC2RGlHtjK5zfd03SEAqYJOa7GFvQFddPea3Ld8vQQ7djh438IrUQD7
	 ND3i6NJ84oR9AiDXoBtkN7sxx9XNXVq/ny7FOua/ZwYHvSNQlJO4wpOywmM92x1a7D
	 pKRqAFfQSDs6BsLc+WQXVB3DVUUVOtxm8wkOeTeDuAoG4RgYCgyKprT+ZfgUSdoCjF
	 Znnuyf44Q/HYg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251021-improve_efficiency_of_clk_divider-v1-2-e2bf7f625af6@amlogic.com>
References: <20251021-improve_efficiency_of_clk_divider-v1-0-e2bf7f625af6@amlogic.com> <20251021-improve_efficiency_of_clk_divider-v1-2-e2bf7f625af6@amlogic.com>
Subject: Re: [PATCH 2/2] clk: divider: improve the execution efficiency of determine_rate()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Chuan Liu <chuan.liu@amlogic.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>, Michael Turquette <mturquette@baylibre.com>, chuan.liu@amlogic.com
Date: Sat, 25 Oct 2025 18:25:44 -0700
Message-ID: <176144194442.3953.13998249458455926261@lazor>
User-Agent: alot/0.11

Quoting Chuan Liu via B4 Relay (2025-10-21 03:12:31)
> From: Chuan Liu <chuan.liu@amlogic.com>
>=20
> There is no need to evaluate further divider values once _is_best_div()
> finds one that matches the target rate.
>=20
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  drivers/clk/clk-divider.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
> index 2601b6155afb..b92c4f800fa9 100644
> --- a/drivers/clk/clk-divider.c
> +++ b/drivers/clk/clk-divider.c
> @@ -339,6 +339,9 @@ static int clk_divider_bestdiv(struct clk_hw *hw, str=
uct clk_hw *parent,
>                         best =3D now;
>                         *best_parent_rate =3D parent_rate;
>                 }
> +
> +               if (best =3D=3D rate)
> +                       break;

This needs a comment. I'm not even sure if it is correct either, because
the other exit from this loop happens if the parent rate can be
unchanged. I don't think we have any KUnit tests for this file, so
please add some tests that deal with this case explicitly (the parent
rate being unchanged as the desirable part).

A general comment: these patches have no benefit described in the commit
text. Do you see any performance improvement with this patch? I sorta
doubt this really matters because the number of dividers are typically
small. A single sentence commit text that only says there is no need
doesn't convince me that any work has been put in to research why the
code was written this way or even prove that making this change improves
anything.

