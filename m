Return-Path: <linux-clk+bounces-29155-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7223DBDDEE1
	for <lists+linux-clk@lfdr.de>; Wed, 15 Oct 2025 12:12:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 322E53AEE05
	for <lists+linux-clk@lfdr.de>; Wed, 15 Oct 2025 10:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C83E931BC82;
	Wed, 15 Oct 2025 10:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="eug41aCq"
X-Original-To: linux-clk@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1945430BF4B;
	Wed, 15 Oct 2025 10:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760523170; cv=none; b=X2MNPxux/dMmQC+P9jJupIoFE6fIZgi2jor7MC4b06tRwl3yWIT2xEWbDHZ7XsteFXSbwYwaf7R5F2MveB1sPn+6k6ucTMKBZu5f+5JJHT4UsiRcrQxiLIv5AMm2Z5BjwNOm6dyi0Lw6Geshy+bEE1rFEpfOBivXlEMH1ySZr9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760523170; c=relaxed/simple;
	bh=4/TJbkbNcIP+34h6WKZ3j067D2LMEqHDkJ6A2IJsxBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FFvW9jThaoY/kBpGd+SiR2yGfmTiYYo8RwARiQIppXPJvHmoItssPAlkbiJdNK3qpMuQMiK4C+6T/R9+D9deEYoNtyZx7qM7WDv+oDEWi3A4D/JKGM3ICodO+rK7827VrIvRciyAEFUhivvwKVH+UiH9c0BDP1yriz4TIgRmDbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=eug41aCq; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=4/TJbkbNcIP+34h6WKZ3j067D2LMEqHDkJ6A2IJsxBc=; b=eug41aCqDldzaScKOKUV7/Rg7w
	0jrGwAyMIwFTW+Pp5kT0s6W8hF+GGtIt90EQet9buCCBjTxxFXSlsjINvcNxi3p6xjlMZHXn032X7
	BVuXphfzbqNfasqNrYKg0R2s6amdN2HFT3HFzqsSGgdnnBLhGz4gR+3lfVSizOL0mpoUliiX62otZ
	VUw8JJGsBAmBVlWsMMBSqG0JOeriBCB4hIntoSja8AWu9XzpC5ZbhhLkLF3AQOWWwvZLvfi7hfUjO
	Q6jEAxUjpSCgQ8gbVQXf5OLOljoQVZ800r1IVjSIKekoRgSrDyIXKiQph84jhlQl489vMdzZrQ/q0
	1jQi9Wpw==;
Received: from i53875a40.versanet.de ([83.135.90.64] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1v8yUt-0006Sa-Uf; Wed, 15 Oct 2025 12:12:43 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: mturquette@baylibre.com, sboyd@kernel.org, sugar.zhang@rock-chips.com,
 zhangqing@rock-chips.com, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, Elaine Zhang <zhangqing@rock-chips.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, huangtao@rock-chips.com
Subject:
 Re: [PATCH v1 4/5] dt-bindings: clock: Add support for rockchip pvtpll
Date: Wed, 15 Oct 2025 12:12:42 +0200
Message-ID: <15582760.tv2OnDr8pf@diego>
In-Reply-To: <20251015091325.71333-5-zhangqing@rock-chips.com>
References:
 <20251015091325.71333-1-zhangqing@rock-chips.com>
 <20251015091325.71333-5-zhangqing@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Elaine,

Am Mittwoch, 15. Oktober 2025, 11:13:24 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Elaine Zhang:
> Add pvtpll documentation for rockchip.

as in patch1, please provide more information, especially when introducing
new concepts (the pvtpll here)

> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>


Thanks
Heiko



