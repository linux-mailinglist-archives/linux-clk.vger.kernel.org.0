Return-Path: <linux-clk+bounces-28152-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DF6B8C027
	for <lists+linux-clk@lfdr.de>; Sat, 20 Sep 2025 07:55:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC6B93B6E8D
	for <lists+linux-clk@lfdr.de>; Sat, 20 Sep 2025 05:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5808723D7D4;
	Sat, 20 Sep 2025 05:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jAD+kF/v"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD8B239E65;
	Sat, 20 Sep 2025 05:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758347730; cv=none; b=nW5xuzNq/FWP7IFkjzlCfPJkyh9VJQDOajNMyl8Dk1HkG00SD7HDtCXRiPKyxuAE/q4WJ0ZmasjoVHKqlYzPHFQIhb/Vtbavk3IUQMhw0/IG8osENRoSv25vTDJ4M+yS/ks+Rp/ZJWluJ/qf6IYSM46k3zQcDaKL7YAanmnQmVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758347730; c=relaxed/simple;
	bh=0fZkG319TCKEqELzv7fC5eTm3rE9Hyx3FHG91aaL7DM=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=XeQUR3jU80ncHan3SjOyVI2MOQRuLbY5qSsN5VkFm7CuExTq7euIs8e0fxn0lBpoMmsEeBt4sWyusmCeBNuL9mAIbEAyxIXwbP/8/c+6pV5gkzEy7kmPmufDFp/oVJan6QUNN2x/oPRlGyrTSu/rN88KHOh5d6IHuxsmy25WaLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jAD+kF/v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3127C4CEFC;
	Sat, 20 Sep 2025 05:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758347729;
	bh=0fZkG319TCKEqELzv7fC5eTm3rE9Hyx3FHG91aaL7DM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=jAD+kF/v3QIXS9CCkBOC5gafGCuNukWhRtLxZJ0jI1+eSIfMYxMFIU+FwNsOOsSI5
	 JofldBL9F6BwuFcd8NY/18FURr0J1YFAzcRMQAmoc71mUi8DEr4QriKWw4sNZmoCVo
	 473WIt7Pf9aUeSXIZ9xcCLrnOk7Is0DP1S1LiSoQdMtdKRlVx/HhHn7Ay1EO7wlsbk
	 u1JWX4AKOsHxmoY8IEjlF1tbQxYqiDTdktgI1yuqzkBTw6WBzBqnSH+/DcHaI7cqh8
	 V5wv1NnQ7m/Y03/gtEmCue8TV7MGCpEpGmpeNNQxs35ZhH2cvFFiOf67NkHwHVgLdw
	 n5HLhvXFM/JvQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250911-k1-clk-i2s-generation-v4-3-cba204a50d48@linux.spacemit.com>
References: <20250911-k1-clk-i2s-generation-v4-0-cba204a50d48@linux.spacemit.com> <20250911-k1-clk-i2s-generation-v4-3-cba204a50d48@linux.spacemit.com>
Subject: Re: [PATCH RESEND v4 3/3] clk: spacemit: fix i2s clock
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, Jinmei Wei <weijinmei@linux.spacemit.com>, Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Alex Elder <elder@riscstar.com>, Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@4d2.org>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, Yixun Lan <dlan@gentoo.org>
Date: Fri, 19 Sep 2025 22:55:28 -0700
Message-ID: <175834772899.4354.17970704155310133154@lazor>
User-Agent: alot/0.11

Quoting Troy Mitchell (2025-09-10 20:34:05)
> Defining i2s_bclk and i2s_sysclk as fixed-rate clocks is insufficient
> for real I2S use cases.
>=20
> Moreover, the current I2S clock configuration does not work as expected
> due to missing parent clocks.
>=20
> This patch adds the missing parent clocks, defines i2s_sysclk as
> a DDN clock, and i2s_bclk as a DIV clock.
>=20
> A special note for i2s_bclk:
>=20
> From the register definition, the i2s_bclk divider always implies
> an additional 1/2 factor.
>=20
> The following table shows the correspondence between index
> and frequency division coefficients:
>=20
> | index |  div  |
> |-------|-------|

Applied to clk-next

