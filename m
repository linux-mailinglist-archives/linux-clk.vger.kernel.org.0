Return-Path: <linux-clk+bounces-5756-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A6A8A06E6
	for <lists+linux-clk@lfdr.de>; Thu, 11 Apr 2024 05:48:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1A051F22FF3
	for <lists+linux-clk@lfdr.de>; Thu, 11 Apr 2024 03:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F1C113BAE2;
	Thu, 11 Apr 2024 03:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R6E9HVvG"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99CE13BAC3;
	Thu, 11 Apr 2024 03:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712807278; cv=none; b=PY92MykUv/phaRriT/x0FI9s5hUGXacFMl6US8v6410Mx8MxJpRTZX/xhCWP4uUV7jDkFddbVuoB1Po3sR5+IOe5wh1lMc0emH+D+RlL5sHTWCskoh18FgICHV53Rn1BsFrJD4DyKLUPCNt6eYwgkCtRfxImcZ0kfWRPBfrSyvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712807278; c=relaxed/simple;
	bh=Dz15JYU5qz7M/9w39lPz3MiT118049k699KYS05P/7A=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:To:Date; b=KWo/DH1s30ZqNaKc+p75HeNhiCq4bIg8eQQZF5sdD8IBAk0TrD4wW2KzjnZggbO4HSWIh2VIV3OrW/TpXatsBPZLN5BTRuhosvRjUzgfuVN+kCWmPyqb4WCMDn0htxyZsJ2Dx3hFSLztzmUPT15ghYehTZwahSwXPGBv4YAAkqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R6E9HVvG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A9DAC433C7;
	Thu, 11 Apr 2024 03:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712807277;
	bh=Dz15JYU5qz7M/9w39lPz3MiT118049k699KYS05P/7A=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=R6E9HVvGHmKi3QW3d6Ls+B9zYQaDqO8zj006/N+H2YTdsBuDVYIk/hwGTTTR7njbL
	 2vNkFpgixTJ4ouUhCYsyh0tuMV1cjSdXaO3Pm0Pa5D5K826OVmmj/PNzs4ZjbxJraA
	 qr/WuwA+Qo6k/pAH3++69jsRfGHdG0nKyq3XuWe0tqOCjFf+MXnSO6F4QKWztgYTzP
	 hXN22QkhAzAvlb0YSxpQiCEKYMUuDYbKRfR2FHpWXHzb/2gnYQQdm8MiyoBrGIrCB4
	 2xjrkadu9G7GohDVo03CEDbQyxNQJHFTsIAJ4Ln4RHWPeHGVfiXlvnXj/qN7i1a1xw
	 jc1HZc+QtLKyg==
Message-ID: <279294c6bfb8af858c2d522dbe3b76b2.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1da2506a51f970706bf4ec9509dd04e0471065e5.1710367453.git.daniel@makrotopia.org>
References: <1da2506a51f970706bf4ec9509dd04e0471065e5.1710367453.git.daniel@makrotopia.org>
Subject: Re: [PATCH] clk: mediatek: mt7988-infracfg: fix clocks for 2nd PCIe port
From: Stephen Boyd <sboyd@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Daniel Golle <daniel@makrotopia.org>, Frank Wunderlich <frank-w@public-files.de>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Sam Shih <sam.shih@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Wed, 10 Apr 2024 20:47:55 -0700
User-Agent: alot/0.10

Quoting Daniel Golle (2024-03-13 15:05:37)
> Due to what seems to be an undocumented oddity in MediaTek's MT7988
> SoC design the CLK_INFRA_PCIE_PERI_26M_CK_P2 clock requires
> CLK_INFRA_PCIE_PERI_26M_CK_P3 to be enabled.
>=20
> This currently leads to PCIe port 2 not working in Linux.
>=20
> Reflect the apparent relationship in the clk driver to make sure PCIe
> port 2 of the MT7988 SoC works.
>=20
> Fixes: 4b4719437d85f ("clk: mediatek: add drivers for MT7988 SoC")
> Suggested-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---

Applied to clk-next

