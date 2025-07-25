Return-Path: <linux-clk+bounces-25140-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8D6B113BB
	for <lists+linux-clk@lfdr.de>; Fri, 25 Jul 2025 00:16:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BF515A3E5E
	for <lists+linux-clk@lfdr.de>; Thu, 24 Jul 2025 22:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BECD242D7B;
	Thu, 24 Jul 2025 22:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D3uBKUVK"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC76242D76;
	Thu, 24 Jul 2025 22:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753395349; cv=none; b=ob8FhuJNwuQdK0dCTW6OqtPKOTAW+YKL+Rvh3OSHAL4Wkzr61u02U5PxfSX4wOBDXmg2UT0Gymlb1NwjljRivoM1xMlc3Kj/ADX/2IwGqtA0ME0D1mZlbCMXl1eaivrbUx8gImzKgo8XXXUdVGzK2nSa73HHkbwt/wgseZwcNCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753395349; c=relaxed/simple;
	bh=vBoq1lCVVrgZnUYIVT028SW6vJYgBrQMeZRnAVi88F8=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=RBLazpC3hn0XVqMrEPOFAXPnDwwmSTTOpCg9LVfIb10JfzmFaIJ8BYjW9ySnhkLQah17DM4qnhxm+cndPDUYk6ivUPbK+FYzECYEiQPsHCU2pYb9EntQG4dqt1jyh1qHy9HwMbgQsJ3AWGC+qMEIkK+q7S52WXNU9fAy4JQe+Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D3uBKUVK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55CD4C4CEED;
	Thu, 24 Jul 2025 22:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753395348;
	bh=vBoq1lCVVrgZnUYIVT028SW6vJYgBrQMeZRnAVi88F8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=D3uBKUVKgjDOvAvwkm6d6u4TgcaK2Scvpxjp8XR8HlpsoXyWiNiVkcfwvYJcx3qXm
	 6cZWiAtBDMiovLSpG8FzdPlJo8Ze7hL+MG57WI1PMggtrRngAvjbCEQyYvOO9YlP1h
	 j/E/x9MnHx/vVI1FEDs3NcbcrEip4wOxKYUBVVxe+nq61q7zzCICUISjn3G08l1ToC
	 bYugXlmuW48N0TupBEewz2/SSQcb9qxwRYseq4QeF2aggJsJl7Ep3QVGBoHNBm/flu
	 Ba8BMjht7w37lAVYay78luh91qTLuY6cfozaMWtHfPsJp3eWWmz7oK1s5K/+48QnYx
	 ooVehLeJ+30NA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250710-clk-imx-round-rate-v1-8-5726f98e6d8d@redhat.com>
References: <20250710-clk-imx-round-rate-v1-0-5726f98e6d8d@redhat.com> <20250710-clk-imx-round-rate-v1-8-5726f98e6d8d@redhat.com>
Subject: Re: [PATCH 08/13] clk: imx: pfd: convert from round_rate() to determine_rate()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
To: Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney@redhat.com>, Fabio Estevam <festevam@gmail.com>, Maxime Ripard <mripard@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Date: Thu, 24 Jul 2025 15:15:47 -0700
Message-ID: <175339534771.3513.11159628872504238439@lazor>
User-Agent: alot/0.11

Quoting Brian Masney (2025-07-10 14:10:40)
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Applied to clk-next

