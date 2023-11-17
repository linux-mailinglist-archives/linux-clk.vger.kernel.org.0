Return-Path: <linux-clk+bounces-271-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3BB7EED60
	for <lists+linux-clk@lfdr.de>; Fri, 17 Nov 2023 09:13:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3419D1F2613B
	for <lists+linux-clk@lfdr.de>; Fri, 17 Nov 2023 08:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5CF2F4EE;
	Fri, 17 Nov 2023 08:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hKR2r491"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8EDFBEB;
	Fri, 17 Nov 2023 08:13:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B6AC433C7;
	Fri, 17 Nov 2023 08:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700208800;
	bh=RPcbB+jdW8SosobxciCWR/egl8ZrKh5jeQWqAfD2+vU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hKR2r491krdpa74I19bkbkY1tFTT5yyVBwSe81sMme0lcZKOwrlp9p5wQsHPX6JCs
	 OfCvtlHvt91nBQHPPsu16TdT4me5IELzYagjdEhjyirOohQnO18EMcmwakimhiyyB/
	 zQEcXEUE39SIfrEuALskJDZp+8Rqn7D1+r6Sw94vMSlkky/qX5UiZm6XOSqQMfXVN9
	 gppN60qQqdoDO3g31P7UAhYZjf27W1auinHQvnTXGp6azipSTK2DQt1rBhNhRtKxEu
	 qVeNd6EJ9n5RtP5wiDmF7j+23q861zIS2K47YgfUX2O9qBIDmwIFsC0HfOviCaavR5
	 luomQ9p5tHNiA==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r3tyb-000629-16;
	Fri, 17 Nov 2023 09:13:22 +0100
Date: Fri, 17 Nov 2023 09:13:21 +0100
From: Johan Hovold <johan@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, andersson@kernel.org,
	konrad.dybcio@linaro.org, mturquette@baylibre.com, sboyd@kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	agross@kernel.org, conor+dt@kernel.org, quic_tdas@quicinc.com,
	quic_rjendra@quicinc.com, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, neil.armstrong@linaro.org,
	abel.vesa@linaro.org, quic_tsoni@quicinc.com
Subject: Re: [PATCH 2/4] clk: qcom: Add Global Clock controller (GCC) driver
 for SC8380XP
Message-ID: <ZVcgoX56q0lYWKyw@hovoldconsulting.com>
References: <20231025133320.4720-1-quic_sibis@quicinc.com>
 <20231025133320.4720-3-quic_sibis@quicinc.com>
 <483c4de3-951c-4ba4-89fb-36fcd44fa99f@linaro.org>
 <e857c853-51ef-8314-2a21-fa6fd25162ca@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e857c853-51ef-8314-2a21-fa6fd25162ca@quicinc.com>

On Fri, Nov 17, 2023 at 09:26:18AM +0530, Sibi Sankar wrote:
> On 10/25/23 22:10, Bryan O'Donoghue wrote:
> > On 25/10/2023 14:33, Sibi Sankar wrote:

> >> +static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
> >> +    .cmd_rcgr = 0x14018,
> >> +    .mnd_width = 8,
> >> +    .hid_width = 5,
> >> +    .parent_map = gcc_parent_map_9,
> >> +    .freq_tbl = ftbl_gcc_sdcc2_apps_clk_src,
> >> +    .clkr.hw.init = &(const struct clk_init_data) {
> >> +        .name = "gcc_sdcc2_apps_clk_src",
> >> +        .parent_data = gcc_parent_data_9,
> >> +        .num_parents = ARRAY_SIZE(gcc_parent_data_9),
> >> +        .flags = CLK_SET_RATE_PARENT,
> >> +        .ops = &clk_rcg2_floor_ops,
> > 
> > diff sc8280xp..sc8380xp
> > 
> > Here you've used floor instead of shared ops, why is that ?
> 
> We seem to use floor ops for sdcc clks on all other QC SoCs and
> sc8280xp seems to be the exception here. So I'll continue to use floor
> ops for sdcc.

> >> +static struct clk_rcg2 gcc_usb30_mp_mock_utmi_clk_src = {
> >> +    .cmd_rcgr = 0x17158,
> >> +    .mnd_width = 0,
> >> +    .hid_width = 5,
> >> +    .parent_map = gcc_parent_map_0,
> >> +    .freq_tbl = ftbl_gcc_pcie_0_aux_clk_src,
> >> +    .clkr.hw.init = &(const struct clk_init_data) {
> >> +        .name = "gcc_usb30_mp_mock_utmi_clk_src",
> >> +        .parent_data = gcc_parent_data_0,
> >> +        .num_parents = ARRAY_SIZE(gcc_parent_data_0),
> >> +        .flags = CLK_SET_RATE_PARENT,
> >> +        .ops = &clk_rcg2_ops,
> > 
> > This is another discontinuinty with sc8280xp.
> > 
> > Could you have a look through the sc8280xp gcc and do an aduit for 
> > clk_rcg2_shared_ops as against sc8380xp ?
> 
> ack, will do a quick audit before the re-spin.

Please trim unnecessary context from your replies. You quoted some 1400
lines of irrelevant clock structs when all you needed was something like
the above.

Not trimming replies makes it a pain to read your mails and to revisit
threads like this one, for example, in the lore web archives.

Johan

