Return-Path: <linux-clk+bounces-9279-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C8492AA76
	for <lists+linux-clk@lfdr.de>; Mon,  8 Jul 2024 22:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CC881F21CEC
	for <lists+linux-clk@lfdr.de>; Mon,  8 Jul 2024 20:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43FCE146A98;
	Mon,  8 Jul 2024 20:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j3SrveUP"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E7C22EE5;
	Mon,  8 Jul 2024 20:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720470100; cv=none; b=s74XETxxbekN1918Osi/aCG00p266L4Cp9sF/mF5YQRlWMIolJabDQfWAN8jsAAgoTvyKCJ/CsGNBfrftop/ZUkp1cvg6WwQJ7pbv+GwfoK0ldtZ/fz94ObBiJEyI9f1Lxndpcg3ADSM1TcsyBr3RMpdj3TcRDZ1QeFTC+L6Ezo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720470100; c=relaxed/simple;
	bh=OJJiQQmVx3deo6KRfVLsTN1Ct2dHSiveuWBWL2HT4Iw=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=GlV2LG3kPYefbTPbSbyCfBXLvu9lMdnH1cqwHIc/GudUQCjTMUw2YQvIu6KeK8a6l1EaYX9PpSUGf8uGGKZF6ITZJyq90ji2wlAsawnIoZhOoob9UDjzDRLiikqND9KXYq7OH6mUrwUNhb3im7cxp4d8Ddk8Arb2aocGvkEl/YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j3SrveUP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85AA7C116B1;
	Mon,  8 Jul 2024 20:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720470099;
	bh=OJJiQQmVx3deo6KRfVLsTN1Ct2dHSiveuWBWL2HT4Iw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=j3SrveUP9Y2b7eYHsUk2sexm16LQ/h4NflwZIlb0EaU7u+FTtc3Hk7n+EEbeUm2On
	 MRFPML7l0xZA4/Y2DEu5LysWA5XYkskQ5N822h5UG6XWsBnAjehcjOOre+2MZd8k49
	 ra53mbhbhMUlczw+5ueibMwMXPOUFzbBucGh1jDBrT4xDXKGzXglYHk4bts3cdOCNE
	 0R43XV9iJrqau1OHtQXYeI2rwZbd1E/+kVU6Cmwc/6Ifa8eP4iLzZOchqKB6ApHITo
	 P/Z8w4O+R9mwCJ2/GkjgqB8JNoGuBl9x6bD1JyRNUwREytldlJJcMszNUfr/C5gDTV
	 5e2waDdduZrTQ==
Message-ID: <e05febe3c76441e67a7406f39a27b4d4.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4f735d17e549ea53769bf5a3f50406debb879a44.1719485847.git.lorenzo@kernel.org>
References: <cover.1719485847.git.lorenzo@kernel.org> <4f735d17e549ea53769bf5a3f50406debb879a44.1719485847.git.lorenzo@kernel.org>
Subject: Re: [PATCH v4 2/4] clk: en7523: Add reset-controller support for EN7581 SoC
From: Stephen Boyd <sboyd@kernel.org>
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, lorenzo.bianconi83@gmail.com, conor@kernel.org, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org, nbd@nbd.name, john@phrozen.org, dd@embedd.com, catalin.marinas@arm.com, will@kernel.org, upstream@airoha.com, angelogioacchino.delregno@collabora.com
To: Lorenzo Bianconi <lorenzo@kernel.org>, linux-clk@vger.kernel.org
Date: Mon, 08 Jul 2024 13:21:37 -0700
User-Agent: alot/0.10

Quoting Lorenzo Bianconi (2024-06-27 04:04:23)
> Introduce reset API support to EN7581 clock driver.
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---

Applied to clk-next

