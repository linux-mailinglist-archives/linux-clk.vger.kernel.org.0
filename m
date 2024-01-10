Return-Path: <linux-clk+bounces-2039-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B64822614
	for <lists+linux-clk@lfdr.de>; Wed,  3 Jan 2024 01:51:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97C9C1C21B26
	for <lists+linux-clk@lfdr.de>; Wed,  3 Jan 2024 00:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40BCC808;
	Wed,  3 Jan 2024 00:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ixnmex/I"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22384A56;
	Wed,  3 Jan 2024 00:51:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6563C433C7;
	Wed,  3 Jan 2024 00:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704243103;
	bh=k9n78YdF+0o39NnDck1txg5213yk2YnfbSg31If7lfM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Ixnmex/I2/V9aSGETjWrbJ2IR2/EPlYoNULE96nHZCmWjLRG2RGSGS0eCBvnTsblu
	 HzUF8Mv6uyqx6kIKd7+NzC6Sm96Myz/m8KEEWWOhOZcCTsoHJjFzVPatCYwrNks+K1
	 jJoPfBUanOuD2FeymRj8w/F9M3xwSlMVCOcf2WrNaITxyO7TPld5+at3CyNTCTMazE
	 JUok9I5M5tjc5pQfpA1+1Er4p9dTW93QDvjzrk90ucJvIfrpA8hI24VP40vRMKVKSC
	 t6LQDRZZsl82133Z/sJwRqwx6ZvB3wnP0d7MzD2Nx2ukeZ/vKQoAwg0bFMDsUwzgsx
	 P9u+nbl35D8GQ==
Message-ID: <65e4793fc4aaeadbda9b422e1ac8cc0c.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231103102533.69280-4-angelogioacchino.delregno@collabora.com>
References: <20231103102533.69280-1-angelogioacchino.delregno@collabora.com> <20231103102533.69280-4-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 3/3] clk: mediatek: mt8188-topckgen: Refactor parents for top_dp/edp muxes
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, wenst@chromium.org, msp@baylibre.com, amergnat@baylibre.com, yangyingliang@huawei.com, u.kleine-koenig@pengutronix.de, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, kernel@collabora.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Tue, 02 Jan 2024 16:51:40 -0800
User-Agent: alot/0.10

Quoting AngeloGioacchino Del Regno (2023-11-03 03:25:33)
> The top_dp and top_edp muxes can be both parented to either TVDPLL1
> or TVDPLL2, two identically specced PLLs for the specific purpose of
> giving out pixel clock: this becomes a problem when the MediaTek
> DisplayPort Interface (DPI) driver tries to set the pixel clock rate.
>=20
> In the usecase of two simultaneous outputs (using two controllers),
> it was seen that one of the displays would sometimes display garbled
> output (if any at all) and this was because:
>  - top_edp was set to TVDPLL1, outputting X GHz
>  - top_dp was set to TVDPLL2, outputting Y GHz
>    - mtk_dpi calls clk_set_rate(top_edp, Z GHz)
>  - top_dp is switched to TVDPLL1
>  - TVDPLL1 changes its rate, top_edp outputs the wrong rate.
>  - eDP display is garbled
>=20
> To solve this issue, remove all TVDPLL1 parents from `top_dp` and
> all TVDPLL2 parents from `top_edp`, plus, necessarily switch both
> clocks to use the new MUX_GATE_CLR_SET_UPD_INDEXED() macro to be
> able to use the right bit index for the new parents list.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---

Applied to clk-next

