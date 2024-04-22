Return-Path: <linux-clk+bounces-6227-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C0D8ACAC5
	for <lists+linux-clk@lfdr.de>; Mon, 22 Apr 2024 12:34:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9BBE9B22471
	for <lists+linux-clk@lfdr.de>; Mon, 22 Apr 2024 10:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98D3814A09C;
	Mon, 22 Apr 2024 10:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="d4Aq3BUT"
X-Original-To: linux-clk@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF132149E0F;
	Mon, 22 Apr 2024 10:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713781902; cv=none; b=PS5yVIPcK8uVf7wAa/TTFZ7jv8ZMH+01TpllDqBgm93AZgoAu1g70j8ubqL73imsJH/bE3Vvyju7kWYT5bTZH+JOZBFUKjcja97TEb3D64VfTlPfRn39iXSSg8tazT+UWlxV7MGz/3nAYPcZnIzPzmVgfKWpmMgpNpE+T/UsHEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713781902; c=relaxed/simple;
	bh=+j2bNi8k/alLWVzZXt5+/z70HAC4NEQb/EVIcPMzr/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eYR+tPhf5AFNL/kd4FsSI2iwxG4jbr9or/qMklIq6TbpnvlrCvsssn3c3TSkx09nmYma8jYvMv6kbFoL6uX+VgJL+gPNnbz5T6gjGdbb4mlGkPgXopepVcL7dov1nNMEjxG42iW+4gLDgyn4SzMqqW+kcjLott2hd6rFeLDZUSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=d4Aq3BUT; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:Reply-To:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=s/c3dJrF+9TupMEh+95zrLT8ysApMrEChVLOaNR1tJE=;
	t=1713781900; x=1714213900; b=d4Aq3BUTX8hDvY1K/1zvbRMEcd+wHaGzKq+7eDBwh345V/o
	sSd+nHHu7M469tR5oS4ejLE12f6eu5DYDMkPuLryGb92TkzbM17xIto61JbO58QHqINlAYWALAIN5
	hhWKYeSodu0eLHwfze0DPZ5/KpL5jrGO3ae3eCnXWk8NNPTPTAoOEAAwr08Lk7SldykiYW4Jz8Pc/
	PrbZNLpPMiNxZ3+MZdYE7NHmeA1skurkKzKbIajMRcFg1R1YDtaIVYmp04JbunfBoSWyL1Tk6TqfK
	Zu6iBpc6lbYd+/P7bIRxogFTgMiDUYS1gsLDOZwFmGprd/AdNRw9xowv1uQfKqlw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ryqxW-0003dJ-62; Mon, 22 Apr 2024 12:31:38 +0200
Message-ID: <59372e42-2eab-4efd-b7d8-d0ef6f8c2300@leemhuis.info>
Date: Mon, 22 Apr 2024 12:31:37 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: [PATCH] clk: qcom: gdsc: treat optional supplies as optional
To: Bjorn Andersson <andersson@kernel.org>,
 Johan Hovold <johan+linaro@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20240325085835.26158-1-johan+linaro@kernel.org>
 <171226578689.615813.4474720130637817355.b4-ty@kernel.org>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <171226578689.615813.4474720130637817355.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1713781900;2106b9ec;
X-HE-SMSGID: 1ryqxW-0003dJ-62

On 04.04.24 23:22, Bjorn Andersson wrote:
> 
> On Mon, 25 Mar 2024 09:58:35 +0100, Johan Hovold wrote:
>> Since commit deebc79b28d6 ("clk: qcom: gpucc-sc8280xp: Add external
>> supply for GX gdsc") the GDSC supply must be treated as optional to
>> avoid warnings like:
>>
>> 	gpu_cc-sc8280xp 3d90000.clock-controller: supply vdd-gfx not found, using dummy regulator
>>
>> on SC8280XP.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/1] clk: qcom: gdsc: treat optional supplies as optional
>       commit: 6677196fb1932e60b88ad0794a7ae532df178654

Bjorn, quick question: this regression fix after more than two and a
half weeks is not yet mainlined. Is there a reason? Or am I missing
something here?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke

