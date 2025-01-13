Return-Path: <linux-clk+bounces-17012-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B2496A0C4DA
	for <lists+linux-clk@lfdr.de>; Mon, 13 Jan 2025 23:45:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B59A1884D40
	for <lists+linux-clk@lfdr.de>; Mon, 13 Jan 2025 22:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04F401F9F5B;
	Mon, 13 Jan 2025 22:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VDWWLNaJ"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28291F9F46;
	Mon, 13 Jan 2025 22:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736808323; cv=none; b=rtYucp5DQZc2oMDdHaUZv3OJdm4Ti3T9NcWmk8xNTfpkF/GaM13P3lKmy5DtlcyoUzLlIAHZI/vVrCDpDiNxC1Pi41NIrI1//bZt5rX1uADxaJLEWJ8mIGP/P/t3Ledl1dqzoOoNtQQuOK8ljDAV65dRQNXQ/YGyvFj4YQF0/nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736808323; c=relaxed/simple;
	bh=yAYV7mK6IK4Rg9ncDt+lVzAk3Pi0bSmxLYacuo3tFi0=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=YyS07lnTKsi7kUPGtzqlOjoYEcudFvxKwrAtw32MbvI3tmRyaSKVQloGVXStpyfdFmEWNbAV0JWp7JbhBGQcvoQFP8linALLZMVR3n5E0cEKqU1GuZb/7ejJo7pr9TRfBxLOpqveiBSdEjtVrdjo6M9ttnOf29xRw8DFRuf3Sao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VDWWLNaJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40F71C4CED6;
	Mon, 13 Jan 2025 22:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736808323;
	bh=yAYV7mK6IK4Rg9ncDt+lVzAk3Pi0bSmxLYacuo3tFi0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=VDWWLNaJ1SaHaCrxFZRd2YNiqe/q9C5iZr3TWChlunIKpa+2s79+ufLsrD8RXGP1r
	 fMI0mLq5IPzoMHF1zsN+MwCXO30l4dc63wlKrnz4PpA0noRUq4YHwcvR2Ms7ZcyaJP
	 6nHJnBpaWzKjU8sGuGo7eWNe8fHjimUWMoaJ7cCQnspXDaE6PM1uQFAmATizv73rB0
	 g87MtxMI/P52NOfhkcBTMig/M7KwhUI39d5x/Y+EQwKHgHcmR9lqbjJDGhY5+7hHB2
	 Gkyw24nqfVcEOEM9E65XK43ZdHGA5H01sKmsj3lLe89GmnDOhG0iEpwSQeGvNBH9bF
	 VZUKgl9YCPYqg==
Message-ID: <944dfd5c97e44d8cff3e576e0fa4a711.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <67859111.df0a0220.a316d.bad1@mx.google.com>
References: <20250112133953.10404-1-ansuelsmth@gmail.com> <20250112133953.10404-2-ansuelsmth@gmail.com> <15742b3ea7b5ee1cfdeb78657e9dc4c5.sboyd@kernel.org> <678587b6.050a0220.32320f.317d@mx.google.com> <3b60a7a7775b6bae58d231a52bd9ef10.sboyd@kernel.org> <67859111.df0a0220.a316d.bad1@mx.google.com>
Subject: Re: [PATCH v5 2/4] dt-bindings: clock: drop NUM_CLOCKS define for EN7581
From: Stephen Boyd <sboyd@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, upstream@airoha.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Date: Mon, 13 Jan 2025 14:45:21 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Christian Marangi (2025-01-13 14:17:49)
> On Mon, Jan 13, 2025 at 01:53:46PM -0800, Stephen Boyd wrote:
> >=20
> > Please resubmit the entire patchset. It doesn't compile.
>=20
> Hope I don't get annoying and sorry for this extra mail.

No worries.

>=20
> I can't repro the compile error, it seems patch 1 of this series wasn't
> applied and changes were tested only with patch 2?
>=20
> Patch 2 depends on patch 1 as we drop the define.
>=20

I applied the first patch, but on top of v6.13-rc1 like all other
patches that don't tell me their base.

What's the base of the patch series? Please resend with a cover letter
and use --base=3D<commitish> when formatting the patch series. When I
applied the first patch I got this diffstat

 drivers/clk/clk-en7523.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

so I suspect I'm missing something in clk-fixes for this patch series.
Please call out dependencies in the cover letter.

