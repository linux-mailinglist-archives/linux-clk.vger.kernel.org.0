Return-Path: <linux-clk+bounces-25149-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D0DB113E9
	for <lists+linux-clk@lfdr.de>; Fri, 25 Jul 2025 00:31:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28424AC8317
	for <lists+linux-clk@lfdr.de>; Thu, 24 Jul 2025 22:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4236A230BD9;
	Thu, 24 Jul 2025 22:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VntacsAY"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161513F9D2;
	Thu, 24 Jul 2025 22:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753396289; cv=none; b=WG3aXRcqWrkOuNjPB/MM2ummGcmHl1oXup5uU+pmd8iBw9XwBzmRm6wY3L29ouiyFkOKOQeslQfbqObB8HPG5NzHAQMyVg1Pna4kOrReqll/0ct3u/4ieBl1QYo2FuZzQzrcI+tMdwkDG8ydfs+LOy/3/3x7znLDaHPt/m73S/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753396289; c=relaxed/simple;
	bh=VVACMuBvq0JENf3nl07BTHXv1QuaR3BdDF1ITi20M1M=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=EANjR6Dm8vRWB4WxqKIa9am+0xXK1YJZPdlOgAzqXyO6GNAbyU6j7+lCpQa/dI/WPw4M/6ie50GME8TpcYD08vjJbD2q7+MoJCxJKHn7xNtExPMpDVqjbQYQBxkMJJM86ePiBhSngWSAMq8c85kkEZnQctDS2nG07aJ50vOnrDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VntacsAY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2FE1C4CEED;
	Thu, 24 Jul 2025 22:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753396288;
	bh=VVACMuBvq0JENf3nl07BTHXv1QuaR3BdDF1ITi20M1M=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=VntacsAY4MPc/J/xcHdAo6N7b8MSeKn8h+Tc81XnXO/16ZfhY3XsevVyPKwYTjmQG
	 msxThQkJW9whWmien90U64FdwwIDrlGrVF8XxfCqywgU9EYsbTd+Hoa2K8UELZb0zY
	 kJ2HZ8XRAVjhqIcH2ecznDyNcqN5ZT8CLtiDmEElwLkKgPa2FlmizbadZiP2/uhIQ9
	 jxvtDEhvLEcXMoXP/6ZnuJqGS5zTkg5t7T726qPkOmQ28LPtSbjmaJkYeoS7cXagTC
	 4w57GKpDZYfSbR6YZMkPTjES/pEDQYxKgj13rN4xdJtyqksgcLFqiLfHSBXH6lK5bg
	 OtXqOvI59mgjg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <79c7f01e29876c612e90d6d0157fb1572ca8b3fb.1752046270.git.xiaopei01@kylinos.cn>
References: <cover.1752046270.git.xiaopei01@kylinos.cn> <79c7f01e29876c612e90d6d0157fb1572ca8b3fb.1752046270.git.xiaopei01@kylinos.cn>
Subject: Re: [PATCH 1/2] clk: tegra: periph: Fix error handling and resolve unsigned compare warning
From: Stephen Boyd <sboyd@kernel.org>
Cc: Pei Xiao <xiaopei01@kylinos.cn>
To: Pei Xiao <xiaopei01@kylinos.cn>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, mturquette@baylibre.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com
Date: Thu, 24 Jul 2025 15:31:27 -0700
Message-ID: <175339628791.3513.14767621631435473302@lazor>
User-Agent: alot/0.11

Quoting Pei Xiao (2025-07-09 00:37:13)
> ./drivers/clk/tegra/clk-periph.c:59:5-9: WARNING:
>         Unsigned expression compared with zero: rate < 0
>=20
> The unsigned long 'rate' variable caused:
> - Incorrect handling of negative errors
> - Compile warning: "Unsigned expression compared with zero"
>=20
> Fix by changing to long type and adding req->rate cast.
>=20
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---

Applied to clk-next

