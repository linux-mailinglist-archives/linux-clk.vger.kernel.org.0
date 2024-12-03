Return-Path: <linux-clk+bounces-15320-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B07E09E2DD2
	for <lists+linux-clk@lfdr.de>; Tue,  3 Dec 2024 22:08:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74199B62475
	for <lists+linux-clk@lfdr.de>; Tue,  3 Dec 2024 20:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37623207A2D;
	Tue,  3 Dec 2024 20:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A7WGIX/n"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D7218B463;
	Tue,  3 Dec 2024 20:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733256089; cv=none; b=D1aAyeevn6q9txa5tPbmvkmhZIeJJs+jakeiPGLYKzek9Wukjw8+n4ykckLOwJ1E7HNNfdka/waNF8JZcGlC5uAbtvWqDy52mlOETdrzV2hpT5L52cplELzRbNeBRysyIVUhWuanwHvJjAMHHmhxLejrhTu/XQFmhi+5bOZOljk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733256089; c=relaxed/simple;
	bh=CqBcec4clUB3I390AHgG8GmJXShlQhvwgA2jlWGLdhs=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=Io2da6VP18GOsxf4MudzDdH3VlWZHDEIrRzloCFOr0oabPyShYtTbLyfDr7XLS/qboLG9Ms8NqZg3RreYWiktYIf21RRXHP2vaahDY8N5Y4mCt8HT8E4Q6WCQeVSNKtBJOo/7Sgvs3+bqpcP/SDkrlA0L0RzkFQozqmZudrlWI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A7WGIX/n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6629C4CECF;
	Tue,  3 Dec 2024 20:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733256088;
	bh=CqBcec4clUB3I390AHgG8GmJXShlQhvwgA2jlWGLdhs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=A7WGIX/nYTlbMHIZerrnQTUlB8wRA1L5sB52fF+GQvkm5xIfbgmtNtwglPZF48lWR
	 bsmmEfYpMnd1AlCY5ejoVmpi3cg6A9Vu5RVc5EXW7/RACLPr4mmHd6RfSxXWE8bU0g
	 AP6IyqycSaEgkxEjw8HHqmsijh8aWu8EleNFD8OBzPJwGy9Mfp3PuhDCZpK9T8al4X
	 JS9rBiuHziQJPJy6dN1aFINbtWtUqbB669solAxwi6nJ+YOFg+XFxHvldynuwqTyjf
	 NGVSZ2pyWKtGV6pHojdWLcQQkCigrxy62LoRmsCFNhoO4JA+RochnwtRMQHrXR5RXZ
	 lCYUeenJUUnlw==
Message-ID: <1f183372e51ffb790c630ef31ae4e7a4.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5b3b963d-ecae-4819-be47-d82e8a58e64b@stanley.mountain>
References: <5b3b963d-ecae-4819-be47-d82e8a58e64b@stanley.mountain>
Subject: Re: [PATCH next] clk: mmp: pxa1908-mpmu: Fix a NULL vs IS_ERR() check in probe()
From: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
To: Dan Carpenter <dan.carpenter@linaro.org>, Duje =?utf-8?q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Date: Tue, 03 Dec 2024 12:01:26 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Dan Carpenter (2024-11-20 09:18:50)
> The devm_kzalloc() function returns NULL on error, not error pointers.
> Update the check to match.
>=20
> Fixes: ebac87cdd230 ("clk: mmp: Add Marvell PXA1908 MPMU driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Applied to clk-next

