Return-Path: <linux-clk+bounces-19445-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FB5A60251
	for <lists+linux-clk@lfdr.de>; Thu, 13 Mar 2025 21:19:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33BF83A682D
	for <lists+linux-clk@lfdr.de>; Thu, 13 Mar 2025 20:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EC381F4617;
	Thu, 13 Mar 2025 20:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ajUIWuLk"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167A2157E88;
	Thu, 13 Mar 2025 20:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741897132; cv=none; b=CVTwFu/Hi6n0H4QtN5cOyLczEdrtU3J0L3dI6OSn4szDLIjT1I+Rq0MhWxe6M1MXuM80kkkQW/EbhwQCPocaJ4KNgVYR6lxNS2OFugB+lJTf5UfobIB8p2QWQT9gPTdhs2o0v7tmF7WWffaIETC/hj//CIGiMYV+scdSyYgcrZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741897132; c=relaxed/simple;
	bh=CyQCiUlVRxKRabGRBG1oGXq8j8zbrLOWvqmEr1uQdOk=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=A9cmNvJbi4PHsQLpRfBRobNr5XPNPzLNRuMvm8mLIxjEO+9G8MmudqpgyCRAdUbInAcza43Zn8/elgQGtH8o5BvLCqu8k//8uhFGUT+daHdGH3p6wYi4hNK2eR8OLv5dkrWxxXb+0Z/JR4QHr1HEC++scgUKit0gb+lUHKdpiys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ajUIWuLk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80697C4CEDD;
	Thu, 13 Mar 2025 20:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741897131;
	bh=CyQCiUlVRxKRabGRBG1oGXq8j8zbrLOWvqmEr1uQdOk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ajUIWuLkMvear16wZe/tTht16PW/72ThSdd9bPAhydg/5eTmtahMrwNOIxJWUe96c
	 XlWmxL3oNNcpu6RH9yVElNpKBTzejsXvpLrabzDehZLM+IaNj3y2bV+fb4nsVuEr7W
	 dfasTMh/RRhWyRpT8F0uKzqgOgMVQP9BPyDPlEXRzdbk45T3NUX3dYq6U85d+2EPpF
	 IuZOpFftLH+4ZB6l37PlL9ZNdre5PUDKNsCGYfd+Yqr97mK9M/OJ+AtPLo4eENFDnP
	 yJEmcgn/oEcfJ6Z+QbFlEJFBZgZKgPSRyYfSx3uTONWsupsaXKy2Gb354AJX5SjlVC
	 d5aX38HXRIPsA==
Message-ID: <8a701f5bbc3cd3ef2fcd29137e33112c.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250304133423.100884-1-brgl@bgdev.pl>
References: <20250304133423.100884-1-brgl@bgdev.pl>
Subject: Re: [PATCH] clk: davinci: remove support for da830
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, David Lechner <david@lechnology.com>, Michael Turquette <mturquette@baylibre.com>
Date: Thu, 13 Mar 2025 13:18:49 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Bartosz Golaszewski (2025-03-04 05:34:23)
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> This SoC has some leftover code all over the kernel but no boards are
> supported anymore. Remove support for da830 from the davinci clock
> driver. With it: remove the ifdefs around the data structures as the
> da850 remains the only davinci SoC supported and the only user of this
> driver.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Applied to clk-next

