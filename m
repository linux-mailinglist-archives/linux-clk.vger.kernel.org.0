Return-Path: <linux-clk+bounces-3944-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2656A85F11D
	for <lists+linux-clk@lfdr.de>; Thu, 22 Feb 2024 06:48:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D22E41F22445
	for <lists+linux-clk@lfdr.de>; Thu, 22 Feb 2024 05:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CC6C10A12;
	Thu, 22 Feb 2024 05:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pFpxj/tU"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779011774E;
	Thu, 22 Feb 2024 05:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708580875; cv=none; b=J4XQV+VEqGJ56V1+uXXNBmbtpMAapNJZO/8Q1WtR4bhOFKIumhi637qcJs7sXON2xYr/fGqKolajSH5wXHi1EpUj4v0NpNq+mA27jyrqIYRrw1EAkZ58GsPSC2NCchdiaRhrsuji/reuFGRzd6H8W65cExDQdLnaWnBFmxFumiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708580875; c=relaxed/simple;
	bh=CZBQusAEPZzirySR4HRSFLmNExR4Ta2IwqTYf1J6PxA=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=g+SkfXJhc8sLZVocQ69X0hjpA9ulYY0hGD2pRw6zbq0DyoG/wM5dBJ7+hcIugHML7h7moklFRUieaX0pT1ZZYVCEXgdXwTdwQiA3WW2pxMOurOd6reBz2nOdvm9/X4j++r+Q23xDvRGahbElkneGEMsondFg7DBTjMV7S9YYUZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pFpxj/tU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1EFEC433F1;
	Thu, 22 Feb 2024 05:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708580875;
	bh=CZBQusAEPZzirySR4HRSFLmNExR4Ta2IwqTYf1J6PxA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=pFpxj/tUONUnhsbXgbJmQ28rgdo3Z0bVFV2Jyhm93zG5QYIqnHnKLjkjzBkmajlRq
	 D1FLpX4zHRGuiMmNlKblFqovKu7e8iQSjH/S7e0DOyK8hBo875B/s1pLw2k04kGig2
	 s27zWFXdcQhVkATwD+LQKB6PHHZvWeVWpm6J3KR0wF4tQSk286xYMAq1oFsrsxSiM8
	 BrZ/F+jhEn5Vkd/aBK9fcezs6W1MoUVuUzZ6sym+gF9wZUShGSe0n2lvVeyIqXtwip
	 GYvC1QlNTEr4d/Y4uoaPe57BmlNVPZGYYLby8d8dIMyLJuDvlT1vINux5kA9ZKYNth
	 3miqqaASnjttA==
Message-ID: <fec39068daedde34528aa987ded5d2d8.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240115001255.4124-1-rdunlap@infradead.org>
References: <20240115001255.4124-1-rdunlap@infradead.org>
Subject: Re: [PATCH] clk: keystone: sci-clk: match func name comment to actual
From: Stephen Boyd <sboyd@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, linux-arm-kernel@lists.infradead.org, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Date: Wed, 21 Feb 2024 21:47:52 -0800
User-Agent: alot/0.10

Quoting Randy Dunlap (2024-01-14 16:12:55)
> Correct the function name in the kernel-doc comment to match the
> actual function name to avoid a kernel-doc warning:
>=20
> drivers/clk/keystone/sci-clk.c:287: warning: expecting prototype for _sci=
_clk_get(). Prototype was for _sci_clk_build() instead
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Tero Kristo <kristo@kernel.org>
> Cc: Santosh Shilimkar <ssantosh@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> ---

Applied to clk-next

