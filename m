Return-Path: <linux-clk+bounces-1575-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AD7816368
	for <lists+linux-clk@lfdr.de>; Mon, 18 Dec 2023 00:29:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 965951F23338
	for <lists+linux-clk@lfdr.de>; Sun, 17 Dec 2023 23:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34424AF98;
	Sun, 17 Dec 2023 23:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q9OJMMnN"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13924B123;
	Sun, 17 Dec 2023 23:29:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AD83C433C7;
	Sun, 17 Dec 2023 23:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702855746;
	bh=CaGezhpsTcEtRivjENI7Yo1JotkcNCzKjfpr4V3I9Bs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Q9OJMMnNJ7a1uti0u6qP2czVMjbccQm41FfS25uEHXU9b6DRty0GrWix9IUjdmR8e
	 NhugBMWqSdrKHs3RA3YFDfXKhJQFxRYB5COBppXFhNLLpTW+ySvHyVFTEr3ktvMxgW
	 0bHnMzr/sAgsr2DY6bd4A9gUFA0ewmwiKjGeG+keeNPCUjSceYbpx2V5IT2uqn5LVE
	 HmoBegTVhkKV/ZdYHRdZ5QVJDiycICYaBgBIGa1Q00ZkXvrlsAxYSab2ZR9YBh8REh
	 YvDuQgnYA8jyB8he8G3zDzHqE5az/zmpjaUxPdCKuiOLKd60TI0z9RG4BjY/kuuSLT
	 96gITfIjsAsyA==
Message-ID: <56e85ea5916d58720bedfb1f0dd1df39.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231113221949.111964-4-marek.vasut+renesas@mailbox.org>
References: <20231113221949.111964-1-marek.vasut+renesas@mailbox.org> <20231113221949.111964-4-marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH v3 4/4] clk: rs9: Add support for 9FGV0841
From: Stephen Boyd <sboyd@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, Biju Das <biju.das.jz@bp.renesas.com>, Alexander Stein <alexander.stein@ew.tq-group.com>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
To: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-clk@vger.kernel.org
Date: Sun, 17 Dec 2023 15:29:03 -0800
User-Agent: alot/0.10

Quoting Marek Vasut (2023-11-13 14:18:54)
> This model is similar to 9FGV0441, the DIFx bits start at bit 0 again,
> except this chip has 8 outputs.
>=20
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---

Applied to clk-next

