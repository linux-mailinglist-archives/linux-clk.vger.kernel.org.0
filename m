Return-Path: <linux-clk+bounces-6807-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FB58BEF43
	for <lists+linux-clk@lfdr.de>; Tue,  7 May 2024 23:58:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71A59B22D21
	for <lists+linux-clk@lfdr.de>; Tue,  7 May 2024 21:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C30613C3D9;
	Tue,  7 May 2024 21:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JEO6xxj0"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626EA78C6D;
	Tue,  7 May 2024 21:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715119084; cv=none; b=I1MnVJCMIlD1CnKPrMeVHbGNjN/oTSJijuvJK4jSCBYgaCj7V9N8WCsRKLEsMHBTlwLDzNoo/Et7wG01xwQyNpMGaTTKSjwHW6k05+frPYYKcrgFbaRkx8TSvQ+kGF4njAxlEILDlH1Q45hKfIUtOU/ADquw2s2LOoWGqg+EGaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715119084; c=relaxed/simple;
	bh=RW4OSGaRnGj+c4JPG8WuylRGEfAh4Mm1J5a84ybOX+k=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=UDACcnV3eYsxU8i6aOolB32InvsszUBfncKMmXJCkKl9crtppVaH/PscxjyOUQ5A9NfutrCZwj/qdT72X3oJ78f1k86+QNmJpja2mN3KOAL7sNJ/2hBpQTaLnNhkohbXyiTGzO/t/FZCcWo1Q0fWdiDaZeqtmHkVgi+qyXT9vlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JEO6xxj0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C277EC2BBFC;
	Tue,  7 May 2024 21:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715119083;
	bh=RW4OSGaRnGj+c4JPG8WuylRGEfAh4Mm1J5a84ybOX+k=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=JEO6xxj0J94kY8g51lzZAzuoLnV1f9e5TfwrdScRznipN9Nc97Rt3N4UJseM4jqZg
	 vEyA/WAfciJ+wmejNaHW9Ak89+glhZI1T7agC6Y8SsrwUcuHJwMb/eEuEYLrnMwzny
	 jmnNlqpU//J0Max3RqSnNawijbVVaW1fRt4LQK/9q0g63slMbh1V7sOk8PX3VVqf+8
	 t1Wl0ELTyhcbBqcgnG0KpCgJr1fu7QFhlF/aFV9aaadbUnUaCd7du392/OFdwsPbDu
	 ER6DanocQf2kzV/pgOFJ/fHmfYViymaymV/s9dmhQ59VQorhGU2AWXyHMQo/GPwcUr
	 tg7TvVCp5vn4g==
Message-ID: <3581e567f37fea1b67107d65f38d74ca.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240424-strangle-sharpener-34755c5e6e3e@spud>
References: <20240424-strangle-sharpener-34755c5e6e3e@spud>
Subject: Re: [PATCH v2] clock, reset: microchip: move all mpfs reset code to the reset subsystem
From: Stephen Boyd <sboyd@kernel.org>
Cc: conor@kernel.org, Conor Dooley <conor.dooley@microchip.com>, Philipp Zabel <p.zabel@pengutronix.de>, Daire McNamara <daire.mcnamara@microchip.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Date: Tue, 07 May 2024 14:58:01 -0700
User-Agent: alot/0.10

Quoting Conor Dooley (2024-04-24 01:42:08)
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> Stephen and Philipp, while reviewing patches, said that all of the aux
> device creation and the register read/write code could be moved to the
> reset subsystem, leaving the clock driver with no implementations of
> reset_* functions at all. Move them.
>=20
> Suggested-by: Philipp Zabel <p.zabel@pengutronix.de>
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Applied to clk-next

