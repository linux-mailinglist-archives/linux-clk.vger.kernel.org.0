Return-Path: <linux-clk+bounces-14693-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F4E9C9346
	for <lists+linux-clk@lfdr.de>; Thu, 14 Nov 2024 21:33:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6B95283927
	for <lists+linux-clk@lfdr.de>; Thu, 14 Nov 2024 20:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C2F1A2658;
	Thu, 14 Nov 2024 20:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VelODjWB"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681B0136327;
	Thu, 14 Nov 2024 20:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731616401; cv=none; b=ewIUKpKHRcFSa/PKh3C+Yphht3COoc6dKu3v9cKdiRUpSo7glSrqMX699BBmOwCVz7TNiZcWZeY/JLDI8iOxHwefKjn9u5/3vkFhCbx6WtTZqksMHNaJpLnFdDb0cGSUt7VWYYu5r58DAGmwrs52B5FVJD5qlKh/39bvr2P5PdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731616401; c=relaxed/simple;
	bh=+CDkKWnuIWE7Qdr1ZvsvyfLP2c+eEHLfxf+YncF80ho=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=aLqlybtN90KMLLBHkw8xnCp3Oh3XzrtXTFkAIM8CrIGUplYiqJ1wHnyb1wG+LrwH7Y43pYidw74dEqSejjwiAapc3rhY2ga9UPoxxQPhNophVq/Wv4C98CiufG8rDdSFiSs+wGdEY/w0fYmrCTZXB5dXzJrsZWqRuBxLY24MLzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VelODjWB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F65BC4CECD;
	Thu, 14 Nov 2024 20:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731616401;
	bh=+CDkKWnuIWE7Qdr1ZvsvyfLP2c+eEHLfxf+YncF80ho=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=VelODjWB+adbMJUXY/GTYKQEnsvUt4j+gZlgfx5ZdX6f6VAEY4F7q7mnYzrk9Tify
	 vhrc2rdpYl3YrubN6lMMvikrWRWHLXVmNcnN3Re0kB5nu2/uc6w6rCBcwkGMBQaDxj
	 ZLV2MuJBEfS8rIcOs5XwpkGtr1JXzOmaUOP++YkzqES4yEDBk7H0lr43VpZ7WBrtAc
	 Dq+pnrl06ns4SoIaPaiNGsZGf/rKSxgZNug7uZCRefpH6emO6j8Sqm3K0yOOuF3cEt
	 N++Qgi98eoAat791ChTWEaM8fjqtV8erYyib8sqJE5u12Sgfub1ZjebZSRynRZly6g
	 FEERvrZt6yleA==
Message-ID: <9efa4e83bb57b9121a03f53755d1f9f3.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241111102932.3209861-1-arnd@kernel.org>
References: <20241111102932.3209861-1-arnd@kernel.org>
Subject: Re: [PATCH] clk: amlogic: axg-audio: fix Kconfig dependency on RESET_MESON_AUX
From: Stephen Boyd <sboyd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chuan Liu <chuan.liu@amlogic.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Arnd Bergmann <arnd@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 14 Nov 2024 12:33:19 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Arnd Bergmann (2024-11-11 02:29:21)
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> As in most cases, using 'imply' is wrong here and does not prevent
> build failures since that code may not be visible to a built-in
> clk driver:
>=20
> axg-audio.c:(.text+0x15c): undefined reference to `devm_meson_rst_aux_reg=
ister'
>=20
> Replace the incorrt 'imply' with the necessary 'depends on'.
>=20
> Fixes: 664988eb47dd ("clk: amlogic: axg-audio: use the auxiliary reset dr=
iver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Applied to clk-next

