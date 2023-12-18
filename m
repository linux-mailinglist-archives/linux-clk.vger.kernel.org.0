Return-Path: <linux-clk+bounces-1595-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 48681816691
	for <lists+linux-clk@lfdr.de>; Mon, 18 Dec 2023 07:32:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53236B211C1
	for <lists+linux-clk@lfdr.de>; Mon, 18 Dec 2023 06:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E7786FBF;
	Mon, 18 Dec 2023 06:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jLFpJnfe"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A456FA5;
	Mon, 18 Dec 2023 06:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF350C433C7;
	Mon, 18 Dec 2023 06:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702881171;
	bh=P+FpMjf2mykyFNclosXhXZPRX1VsrQekgOEK3L9QqY0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=jLFpJnfeluZNkdrcEvIArVja7yW1RA5z4DELGrRNmRUmceW90bJr5VXBUPF1jkZ9a
	 fLEhfoCfr6mhZmhRagX12JOoQv8PVxRVj+W81QOwIw+LysPDoa+RSzUjYoNGTAsBev
	 PeXPGAfzmsj754Pcel6qPSJx1DRiDHxufST2zv/iIJSmwSMazER26DXrWl/yd2iD5V
	 S6pWel0GmDomrzVn0s99VcakbmLtriKgyPMssIAdkwA/fAYmMndvRqBWuR32qxkkCW
	 B481tkcDwToqwBBy2f3dE2PPCpNrV+0uC7+O5LJkZqJ538btMyWJZUN2uEEY6VHWDz
	 e34sRTdSfmHCg==
Message-ID: <ed6a16e092feb62366d3ddbeb3cbbe64.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231124-alvin-clk-si5351-no-pll-reset-v6-3-69b82311cb90@bang-olufsen.dk>
References: <20231124-alvin-clk-si5351-no-pll-reset-v6-0-69b82311cb90@bang-olufsen.dk> <20231124-alvin-clk-si5351-no-pll-reset-v6-3-69b82311cb90@bang-olufsen.dk>
Subject: Re: [PATCH v6 3/3] clk: si5351: allow PLLs to be adjusted without reset
From: Stephen Boyd <sboyd@kernel.org>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rabeeh Khoury <rabeeh@solid-run.com>, Jacob Siverskog <jacob@teenage.engineering>, Sergej Sawazki <sergej@taudac.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Alvin =?utf-8?q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>, Alvin =?utf-8?q?=C5=A0ipraga?= <alvin@pqrs.dk>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>
Date: Sun, 17 Dec 2023 22:32:49 -0800
User-Agent: alot/0.10

Quoting Alvin =C5=A0ipraga (2023-11-24 05:17:44)
> From: Alvin =C5=A0ipraga <alsi@bang-olufsen.dk>
>=20
> Introduce a new PLL reset mode flag which controls whether or not to
> reset a PLL after adjusting its rate. The mode can be configured through
> platform data or device tree.
>=20
> Since commit 6dc669a22c77 ("clk: si5351: Add PLL soft reset"), the
> driver unconditionally resets a PLL whenever its rate is adjusted.
> The rationale was that a PLL reset was required to get three outputs
> working at the same time. Before this change, the driver never reset the
> PLLs.
>=20
> Commit b26ff127c52c ("clk: si5351: Apply PLL soft reset before enabling
> the outputs") subsequently introduced an option to reset the PLL when
> enabling a clock output that sourced it. Here, the rationale was that
> this is required to get a deterministic phase relationship between
> multiple output clocks.
>=20
> This clearly shows that it is useful to reset the PLLs in applications
> where multiple clock outputs are used. However, the Si5351 also allows
> for glitch-free rate adjustment of its PLLs if one avoids resetting the
> PLL. In our audio application where a single Si5351 clock output is used
> to supply a runtime adjustable bit clock, this unconditional PLL reset
> behaviour introduces unwanted glitches in the clock output.
>=20
> It would appear that the problem being solved in the former commit
> may be solved by using the optional device tree property introduced in
> the latter commit, obviating the need for an unconditional PLL reset
> after rate adjustment. But it's not OK to break the default behaviour of
> the driver, and it cannot be assumed that all device trees are using the
> property introduced in the latter commit. Hence, the new behaviour is
> made opt-in.
>=20
> Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Cc: Rabeeh Khoury <rabeeh@solid-run.com>
> Cc: Jacob Siverskog <jacob@teenage.engineering>
> Cc: Sergej Sawazki <sergej@taudac.com>
> Signed-off-by: Alvin =C5=A0ipraga <alsi@bang-olufsen.dk>
> Acked-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> ---

Applied to clk-next

