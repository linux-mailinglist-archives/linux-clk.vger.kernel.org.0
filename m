Return-Path: <linux-clk+bounces-29512-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 74514BF4C5F
	for <lists+linux-clk@lfdr.de>; Tue, 21 Oct 2025 08:56:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7BF694F0D09
	for <lists+linux-clk@lfdr.de>; Tue, 21 Oct 2025 06:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2DE726B760;
	Tue, 21 Oct 2025 06:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="VL0LgpC7"
X-Original-To: linux-clk@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81164257AEC;
	Tue, 21 Oct 2025 06:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761029751; cv=none; b=nqD+dX51Wjl6bkxUFutPxSA2EHKi+8cIVAnpf0wpCHNfaqe7je++MjkGym7ca8D8uQNwIyeawfPPfKBkbnpDV1bWUq5Bt3uHxaGHyMv3aMkDiT6DG7fa+zHUCpfP3U9M9/Hjl879KvkjLiLmLSXwn+YYL1Bn7akWO+9JjNwHoYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761029751; c=relaxed/simple;
	bh=DFANFfBDNfwmZS1bR1NCqrK1UHkNYLSanN2dGOSuM3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y6HBY1qv82gelhW0y1lBKcRYmq/AFDMXCFY8LMD9dIftjoVNdLrGKydKfuVDQCMC0SloXLEC0Nw+fkDfVmgPz9JaPG4I+DyPZ6KONWDM+tMLulV8bG8VsnhjYdqfrx93oXU+SXUgzLvhZi2sGhZwNa6TFogRzsELgh6F6MpgTzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=VL0LgpC7; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=DFANFfBDNfwmZS1bR1NCqrK1UHkNYLSanN2dGOSuM3A=; b=VL0LgpC7cBFIhouCJRLnPx2gJ1
	TuanLtezDC53PVxzz/0H1xG5Bjg6zI/yEOpKAS39hAb2vtIeo5/ZD3FZ+TNJkdUkih4m93OAdQPZO
	NHmq18Z0P8/7lT5o4VjtXHncTsNScDaB7kNM/UQqG4hNuZrwLW3Gf2kBD54E1wxz/YavdY3VjgI4A
	uMM8iUa357mODJGIBHI6E3HRi7KFPeeyB0fSZX1Wq4zihRuWySYd7D/6KXmUL4/dooI6jIl5nBOne
	VF9vhQqFqSZ/UOY/yvD9VoB/2Cy+wgBywkALZlMPwxGi7p5u+cq5ubGBZ/eC4dnX9hO3/tGpLulE8
	y5JLkD9w==;
Received: from [212.111.240.218] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vB6HO-0000XV-AT; Tue, 21 Oct 2025 08:55:34 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com, sboyd@kernel.org, sugar.zhang@rock-chips.com,
 zhangqing@rock-chips.com, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, Elaine Zhang <zhangqing@rock-chips.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, huangtao@rock-chips.com,
 finley.xiao@rock-chips.com
Subject:
 Re: [Resend PATCH v4 0/7] clk: rockchip: Add clock controller for the RV1126B
 and RK3506
Date: Tue, 21 Oct 2025 08:55:33 +0200
Message-ID: <8637519.NyiUUSuA9g@phil>
In-Reply-To: <20251021065232.2201500-1-zhangqing@rock-chips.com>
References: <20251021065232.2201500-1-zhangqing@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Elaine,

Am Dienstag, 21. Oktober 2025, 08:52:25 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Elaine Zhang:
> Add yaml and dt-bindings for the RV1126B and RK3506.
> RK3506 depend on patches 1/7 and 5/7, so it is merged and submitted.

thanks a lot for also including the rk3506 :-) .

I was about to start looking at the rk3506 clock controller,
but can now focus on the other parts of the soc.


Heiko



