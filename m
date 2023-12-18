Return-Path: <linux-clk+bounces-1594-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E9281668E
	for <lists+linux-clk@lfdr.de>; Mon, 18 Dec 2023 07:32:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FAE81F21316
	for <lists+linux-clk@lfdr.de>; Mon, 18 Dec 2023 06:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F09F26FBE;
	Mon, 18 Dec 2023 06:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="scKc9MuR"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5026FBB;
	Mon, 18 Dec 2023 06:32:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C5B1C433C7;
	Mon, 18 Dec 2023 06:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702881153;
	bh=pGeY3qI7TWbvS+2VRixyHQn2l43C+1mLMoyI6GNnCPQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=scKc9MuR4bM8I8EfEHSDwLm8MbCbgWGq+FjXjFKNmpU3gTqqH6IJPT/r6TYhknvjW
	 p5Y2bR2RSmLYj62EJcPjCY2HEBLv/tSpN3vvKfUGl4uYf/SFTChwm5DGDflShPoJe0
	 aWLaWNGHfGyq2n2SSQXJyVBjZ4Yn7rga+/0el25EPlV5wKLU8B7APY5WUp8KH46bm3
	 7Zp74lQHrAmjlihKKsGlMkSB2ySPl0xlCCz1+Zup3NUG86QVHmInlGfRTI533I1KfQ
	 spgmiFCgqZGm9TkBAsjQRGgFob5kwfFdwySsOIoXdJUIdYE1vGmVmImzsTfGIO5Eue
	 lcj/89QLKEndw==
Message-ID: <92471e65e1879f22caaaaa9c706c491b.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231124-alvin-clk-si5351-no-pll-reset-v6-2-69b82311cb90@bang-olufsen.dk>
References: <20231124-alvin-clk-si5351-no-pll-reset-v6-0-69b82311cb90@bang-olufsen.dk> <20231124-alvin-clk-si5351-no-pll-reset-v6-2-69b82311cb90@bang-olufsen.dk>
Subject: Re: [PATCH v6 2/3] dt-bindings: clock: si5351: add PLL reset mode property
From: Stephen Boyd <sboyd@kernel.org>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rabeeh Khoury <rabeeh@solid-run.com>, Jacob Siverskog <jacob@teenage.engineering>, Sergej Sawazki <sergej@taudac.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
To: Alvin =?utf-8?q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>, Alvin =?utf-8?q?=C5=A0ipraga?= <alvin@pqrs.dk>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>
Date: Sun, 17 Dec 2023 22:32:30 -0800
User-Agent: alot/0.10

Quoting Alvin =C5=A0ipraga (2023-11-24 05:17:43)
> From: Alvin =C5=A0ipraga <alsi@bang-olufsen.dk>
>=20
> For applications where the PLL must be adjusted without glitches in the
> clock output(s), a new silabs,pll-reset-mode property is added. It
> can be used to specify whether or not the PLL should be reset after
> adjustment. Resetting is known to cause glitches.
>=20
> For compatibility with older device trees, it must be assumed that the
> default PLL reset mode is to unconditionally reset after adjustment.
>=20
> Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Cc: Rabeeh Khoury <rabeeh@solid-run.com>
> Cc: Jacob Siverskog <jacob@teenage.engineering>
> Cc: Sergej Sawazki <sergej@taudac.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Alvin =C5=A0ipraga <alsi@bang-olufsen.dk>
> ---

Applied to clk-next

