Return-Path: <linux-clk+bounces-1551-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6AE815CFD
	for <lists+linux-clk@lfdr.de>; Sun, 17 Dec 2023 02:21:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDCDB283D1D
	for <lists+linux-clk@lfdr.de>; Sun, 17 Dec 2023 01:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F20B81D;
	Sun, 17 Dec 2023 01:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HToztort"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61194ED8;
	Sun, 17 Dec 2023 01:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2D7BC433C7;
	Sun, 17 Dec 2023 01:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702776070;
	bh=etWxz2zwOohIp8lCBQjCR+Z3R2MiheW16an0RvlPaXM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=HToztortDnReukjRgT8BXAjrdLCdbCWtyXEuxftUFwsID6B60lZapPkfTzPa7PGHD
	 2CZwFXcIUHBiCb7GNsl1iI1G2rJdi3Et1ziJHM685LAmBdZBQdj3ztAgq3tO8aMdua
	 hgNfkMtPpukMlbYgYTxzw6IrIlQeC7bteeOE99W2oARjBCQyCPO74HXoUP5slwOkuR
	 /j4kcmSBLh86D/RuQaj8sUOl0oRIzOrv/cco4E049xGkfNDH4WSXTfx6OSM8OH/jXc
	 tTY+77U7T4VgJFHj1NwoVcJzwcyK0LaVe6axA3lCFriYFv09mTDwXWEZmvyv/RsRIS
	 FkYA2m7qplm8w==
Message-ID: <752b98e31a2b9e4cf0aec860f158c53c.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231129112916.23125-3-jay.buddhabhatti@amd.com>
References: <20231129112916.23125-1-jay.buddhabhatti@amd.com> <20231129112916.23125-3-jay.buddhabhatti@amd.com>
Subject: Re: [PATCH RESEND v2 2/2] drivers: clk: zynqmp: update divider round rate logic
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jay Buddhabhatti <jay.buddhabhatti@amd.com>
To: Jay Buddhabhatti <jay.buddhabhatti@amd.com>, michal.simek@amd.com, mturquette@baylibre.com, shubhrajyoti.datta@xilinx.com
Date: Sat, 16 Dec 2023 17:21:08 -0800
User-Agent: alot/0.10

Quoting Jay Buddhabhatti (2023-11-29 03:29:16)
> Currently zynqmp divider round rate is considering single parent and
> calculating rate and parent rate accordingly. But if divider clock flag
> is set to SET_RATE_PARENT then its not trying to traverse through all
> parent rate and not selecting best parent rate from that. So use common
> divider_round_rate() which is traversing through all clock parents and
> its rate and calculating proper parent rate.
>=20
> Fixes: 3fde0e16d016 ("drivers: clk: Add ZynqMP clock driver")
> Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
> ---

Applied to clk-next

