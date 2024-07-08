Return-Path: <linux-clk+bounces-9274-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 766CD92A962
	for <lists+linux-clk@lfdr.de>; Mon,  8 Jul 2024 20:59:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ECEB6B21AE7
	for <lists+linux-clk@lfdr.de>; Mon,  8 Jul 2024 18:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD4CA14B973;
	Mon,  8 Jul 2024 18:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KI0cxyY4"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817EA14B95B;
	Mon,  8 Jul 2024 18:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720465169; cv=none; b=ElMILqqzCB+9tadTSgOt/A2Z7p5QOEhY4QVHWpDHEsbMiwm92zzPEhK1rSULrpDgkr/U65UNfwkozHah3b8K3Wbi5qDgeGafPZtOEOcneKK5vf22cKndHdBrm4SeJjccmgklikPv6fGz2q7xMH6mjOU99/dQyE9FBqHnhuQNsYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720465169; c=relaxed/simple;
	bh=sJzSE8UYwx+xboaLVPiHjNU7mUoRzdDujz4yLfcsBRk=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=PfA1jcsJbZfE6GGtQUzoVBLh1er5GkJ9FXvcRlEIHpVOelGxII3AL82lZ/x/7WJ1UCo5X2IfBgr16XIOw4R1290FPuM4n7FnSB2I1rEu5rE6FtTblFPrbDR3pN/AQMSzU3gq8CJ4pRA1bUIpASfJ7QzUM44cbf5/Eefvxh+vERo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KI0cxyY4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF047C116B1;
	Mon,  8 Jul 2024 18:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720465169;
	bh=sJzSE8UYwx+xboaLVPiHjNU7mUoRzdDujz4yLfcsBRk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=KI0cxyY4DlNOn9IlVLb16B2D4HdBRobsyqRn7ZUNueTTcr4ipiS/yoxdc4J1a1lTb
	 3KLSpmjJUG2gIv5wuePqSjyNjxidgpwir8l2cz95mXNFgZz2zHiTFIKwe7WEtGpBHh
	 Xa0IWE69MQRurNOOu8Nf4PGRinr+gPSFncSaltSoIDJBxcmIFgi5eiJjGxhRi3Z+Rd
	 yyLngqsAhkSCVNP41cBqa19KHw8DYb9ZBiyQwNGD33Y0ao1lI0aHMoz7+SA+8hK94Q
	 ENc/U3AqasNRpkb6TuaCiLHsqQ+m9O1M2bxoPye+guWEmbPZxQQo8ZDkFDj63K0Oj+
	 xtFoHaXssdMZA==
Message-ID: <9bd992dcdd7e1531e71af60de5e58eea.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ZobghvwZAyMjl4eB@standask-GA-A55M-S2HP>
References: <ZobghvwZAyMjl4eB@standask-GA-A55M-S2HP>
Subject: Re: [PATCH v3] dt-bindings: clock: sprd,sc9860-clk: convert to YAML
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Baolin Wang <baolin.wang7@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Orson Zhai <orsonzhai@gmail.com>, Rob Herring <robh@kernel.org>, Stanislav Jakubek <stano.jakubek@gmail.com>
Date: Mon, 08 Jul 2024 11:59:24 -0700
User-Agent: alot/0.10

Quoting Stanislav Jakubek (2024-07-04 10:48:54)
> Convert the Spreadtrum SC9860 clock bindings to DT schema.
>=20
> Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
> ---

Applied to clk-next

