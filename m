Return-Path: <linux-clk+bounces-28196-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F973B8E0CA
	for <lists+linux-clk@lfdr.de>; Sun, 21 Sep 2025 18:57:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C2B5164D3B
	for <lists+linux-clk@lfdr.de>; Sun, 21 Sep 2025 16:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 441652868BD;
	Sun, 21 Sep 2025 16:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F4IpIsQr"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FE7259CA0;
	Sun, 21 Sep 2025 16:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758473666; cv=none; b=twoj6GJrmjrAmZyX5RwPzN/rl+tXVZrFDGPWrhciVkzxQFr969gEAlvt5YkcDU7l95b4I3TYGaUzrT5un3+KwcVxwhaSs+jHHvKX7TDRZNN8njNpE/Pca5WY6yABHwMJrKOtfjYHRfB5St9XRjf4xuJEb8B8rS0j6FnFRy+RujQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758473666; c=relaxed/simple;
	bh=2Pse7f0gUNEI7SroetOgvPuzb3r02krs3TW6vqAGbSE=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=bmzn2FGnZznSHWQHNuAeIH1eIVgpZSZ237Jm2uL4NzcHkN7BzWUVUZk6arVn5qnT3TUzWtXP/WbvmyRnNwaOIfesK5BwVGNeDpaeg8o/LecBIWFqNaSza1eQiZaqn3/UYfoYJ4svGrLehztEdZll8jzP3J//oLnUm2sU5fAhq70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F4IpIsQr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C99FBC116B1;
	Sun, 21 Sep 2025 16:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758473666;
	bh=2Pse7f0gUNEI7SroetOgvPuzb3r02krs3TW6vqAGbSE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=F4IpIsQr+snIta5nLELxG6NGq/xRlWM5zKLl7ujRNK1PI0/AfM7pBRdfEI9mVhsRm
	 FX+sMeTFeG/RP/MV86LfqbV6q7CG/an4ggNO9MXaZTUeypjnOd64OyLIJ8Frt3xIZF
	 hHkll89j+uP3ENi6ibWr+icEHF7ebwjPNHfSv9zOmZJejiR6pgsWZ16jl/wEwDB5LM
	 Vwtr4q/bQ6FaIZ0DDH9EvdXkD+MyuyWTZ1Lz/S8gQhNRUFFpj00OO3O2WCKToBstVW
	 SzT3GzS7iu0voOOC22ZxqA2X/MFjtOmZorTVuerwh1/d9CRG1EbVVatGBaSUS/Cb6X
	 uLYCIyvlTYwPg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250915151947.277983-17-laura.nao@collabora.com>
References: <20250915151947.277983-1-laura.nao@collabora.com> <20250915151947.277983-17-laura.nao@collabora.com>
Subject: Re: [PATCH v6 16/27] clk: mediatek: Add MT8196 pextpsys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: guangjie.song@mediatek.com, wenst@chromium.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, kernel@collabora.com, Laura Nao <laura.nao@collabora.com>
To: Laura Nao <laura.nao@collabora.com>, angelogioacchino.delregno@collabora.com, conor+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, richardcochran@gmail.com, robh@kernel.org
Date: Sun, 21 Sep 2025 09:54:24 -0700
Message-ID: <175847366445.4354.18417827380096504636@lazor>
User-Agent: alot/0.11

Quoting Laura Nao (2025-09-15 08:19:36)
> Add support for the MT8196 pextpsys clock controller, which provides
> clock gate control for PCIe.
>=20
> Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org> # CLK_OPS_PARENT_ENABLE re=
moval
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---

Applied to clk-next

