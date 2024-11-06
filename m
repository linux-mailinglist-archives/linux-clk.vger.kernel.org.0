Return-Path: <linux-clk+bounces-14337-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D17A39BF896
	for <lists+linux-clk@lfdr.de>; Wed,  6 Nov 2024 22:39:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9343C283984
	for <lists+linux-clk@lfdr.de>; Wed,  6 Nov 2024 21:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 378EA20CCE6;
	Wed,  6 Nov 2024 21:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WBV/XQBK"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B5D204958;
	Wed,  6 Nov 2024 21:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730929173; cv=none; b=aqZta/AWg7v+chbxdrYbt6XHoq7iNUmuKL0mrDFxw3oq3QokcvE0ype8eNkU4Z61M3QcXgODqYCyaEx9gO7LA6YVGkCVB1yiBFyy+gxkvfzLaF3N/Zg1maXUvmw1zvTDh3mBamsLKn2m3/MfzTZ6KKmNTKzWa+RxlHvPnLQkmb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730929173; c=relaxed/simple;
	bh=NGW1ecxSoS73bY+vq9NmlmEgNYsxyuIfOZmQbR/lG4s=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=tOS4YkUnCUroNLtewqEp5HDUASCnp9hkKu+bY2v1boS/XBfYiU4pzICm+ws5RjgwrZKPtk2Rl82h1UpmVPCht+fBpBS86Z2xDQdUHXWp2JDc5JNNycO1e9qJAy+15dgNOkl02p+fErNSCzrF/toDIlhLPnHFbDV619wAsDoO3xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WBV/XQBK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8407DC4CEC6;
	Wed,  6 Nov 2024 21:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730929172;
	bh=NGW1ecxSoS73bY+vq9NmlmEgNYsxyuIfOZmQbR/lG4s=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=WBV/XQBKHqPkLcfHSdFncPwLoCaoOEyqs1P9R1yWL1KMc2mQfYLxOXIuZ3WxNDA+o
	 sCFlEytnsfGrFL5X4nqK7830q85JYk1DebjwMvCkmwPLpvpqJUJCKMrWbvTMtgtOub
	 tHvKU3ktYksUXh/sASBHQU2TUlumR5M1u7J9gvWWslu6nXajYD3uNVgBaG7jCULwWD
	 WPfbIlEuzeVDlbsrkZ5USTbw9ZRWexlVsO9P96RKTmfW2k5cIizWSOzrpmWGUfObaB
	 CFo5BKemji1YZ5cyZiOar5lZL+yf8UrpI1lpJKFvIEOIhky2CKTALwkbYx+GX000FH
	 MWcfNFR78MOFw==
Message-ID: <d2d2bac3e583872ef80f86621a1e44cc.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241106142154.622141-1-abel.vesa@linaro.org>
References: <20241106142154.622141-1-abel.vesa@linaro.org>
Subject: Re: [GIT PULL] clk: imx: Updates for v6.13
From: Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev, NXP Linux Team <linux-imx@nxp.com>, linux-clk@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>, Mike Turquette <mturquette@baylibre.com>
Date: Wed, 06 Nov 2024 13:39:30 -0800
User-Agent: alot/0.10

Quoting Abel Vesa (2024-11-06 06:21:54)
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758e=
dc:
>=20
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/=
clk-imx-6.13
>=20
> for you to fetch changes up to 81a206d736c19139d3863b79e7174f9e98b45499:
>=20
>   clk: imx: imx8-acm: Fix return value check in clk_imx_acm_attach_pm_dom=
ains() (2024-11-05 12:07:59 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

