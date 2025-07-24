Return-Path: <linux-clk+bounces-25112-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E79EB1118B
	for <lists+linux-clk@lfdr.de>; Thu, 24 Jul 2025 21:22:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46CB916DCFF
	for <lists+linux-clk@lfdr.de>; Thu, 24 Jul 2025 19:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04CFF2D63F1;
	Thu, 24 Jul 2025 19:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JP4DpbEG"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC7A221555;
	Thu, 24 Jul 2025 19:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753384954; cv=none; b=G6VBi3Qxr+ESq0bcSf28TaJDOqXlntPst7ccBR/P6Wj8Vs1HQSSG3XKogQC7We7wjVhtFSheArShFqX/njm36HQl//48wlOFevNJyXZnAmlTOocnvxKs9YxKHuSUaTUABTMIkS2oUa9n0g/CL97ndtUe/zv5LWwFWmGwm2vjE/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753384954; c=relaxed/simple;
	bh=jj8pVnFNMiNYDteUIsSWX/VH+9PwWP61n4vluNJvB1c=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=mWyw/nY9r6B3GOHtqZIazCBbU+WYQql3PgXdu3sZHtcypXN2BFaLq9VrB2le0BQlPm9SJNOFrGvAR09OLABAh5Fb2fLcZwV//kNZBn0N6fPF8hG3JGw2APqIRWS4x1HmnfnSe00DI9/CX6gJe5IXw1ovssJgkh/B7s/I3J+Cd34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JP4DpbEG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08B95C4CEED;
	Thu, 24 Jul 2025 19:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753384953;
	bh=jj8pVnFNMiNYDteUIsSWX/VH+9PwWP61n4vluNJvB1c=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=JP4DpbEGnXNG4pxomPNbh7wyNqtl3p3tfk15it7SvuC5EU/AUK3xCl7GiZCTR9Lps
	 P59KCtoHcZY8Kt3fuwDaCdEofCsZ+O2kcnm4Xxht0ovB9C7hKY89bPrUgsCHdb41ux
	 nI/85YlCXU1VGf6pGGFMF/noWuTYyfJyRELul2jqgZeaItu1lPcu8zqWjz+qE0cQ2m
	 2/aPWVuDUStJZUVVNbGnVvUm3ObEtWkKeSGOnW4F+vaW1/N/Z2R9sSwnKz4jA2u5aq
	 HE33+aVk+euD9a4eFRH6nSAvvAaKTV3TVaQEWHp/RefkzCzeLNPCuI03aGSkFFS1k+
	 mBCB3/TTC0snA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250723103844.1641282-1-abel.vesa@linaro.org>
References: <20250723103844.1641282-1-abel.vesa@linaro.org>
Subject: Re: [GIT PULL] clk: imx: Updates for v6.17
From: Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev, NXP Linux Team <linux-imx@nxp.com>, linux-clk@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>, Mike Turquette <mturquette@baylibre.com>
Date: Thu, 24 Jul 2025 12:22:32 -0700
Message-ID: <175338495202.3513.695095414806833302@lazor>
User-Agent: alot/0.11

Quoting Abel Vesa (2025-07-23 03:38:44)
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd13544=
94:
>=20
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/=
clk-imx-6.17
>=20
> for you to fetch changes up to c78865241ecffaff7ce5db00ed5b71c1a70c0ff1:
>=20
>   MAINTAINERS: Update i.MX Clock Entry (2025-07-21 10:33:57 +0300)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into to clk-next

