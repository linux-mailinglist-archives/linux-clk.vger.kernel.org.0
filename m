Return-Path: <linux-clk+bounces-1421-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AED44812DF2
	for <lists+linux-clk@lfdr.de>; Thu, 14 Dec 2023 12:00:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21C28282B45
	for <lists+linux-clk@lfdr.de>; Thu, 14 Dec 2023 11:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 431AC3E462;
	Thu, 14 Dec 2023 11:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ogYv/BY8"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CE03D978;
	Thu, 14 Dec 2023 11:00:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73183C433C8;
	Thu, 14 Dec 2023 11:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702551644;
	bh=7yvbMVFBoOU0OI0FWqy3sbSDeL+03VBIkmMdqGb8y1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ogYv/BY8KjwpLoUv98i4AbfwNhxdm/I1XuoOWIHLNEC150LI+SNaUFxa4qcv+Bbxh
	 jlgbSpDlMjyxdJ4oEXAN3tUK4QwUFNaeO7TESAV9D6TJM9G+V6dkgWcUtV2kxjND7Z
	 kJ9U9fFg73ioIRp5DluSNU5ZAvrkl+cXa9y/hOPLnP8BtW2bUUREmNKgsAtcxDxIwh
	 iPHjAcFdb8ObYptpIXvqLplA6ESG6Yoh+sDC0FG7sK4l602q9jnzREssYsYS8iZF9M
	 +tm1nSztqlo/fq43/CQsuoh1RK+R07teCawbnDvm+6NOnk0NUIWEbdnnhsXbXzA2IP
	 a2RirpniqQ6RA==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rDjSK-00088x-0r;
	Thu, 14 Dec 2023 12:00:40 +0100
Date: Thu, 14 Dec 2023 12:00:40 +0100
From: Johan Hovold <johan@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
	sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Shazad Hussain <quic_shazhuss@quicinc.com>
Subject: Re: [PATCH 00/16] Fix Qcom UFS PHY clocks
Message-ID: <ZXrgWK5wZz6dAkKP@hovoldconsulting.com>
References: <20231214091101.45713-1-manivannan.sadhasivam@linaro.org>
 <ZXrVxmxY6wZprbBa@hovoldconsulting.com>
 <20231214103907.GL2938@thinkpad>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231214103907.GL2938@thinkpad>

[ +CC: Shazad ]

On Thu, Dec 14, 2023 at 04:09:07PM +0530, Manivannan Sadhasivam wrote:
> On Thu, Dec 14, 2023 at 11:15:34AM +0100, Johan Hovold wrote:
> > On Thu, Dec 14, 2023 at 02:40:45PM +0530, Manivannan Sadhasivam wrote:
> > 
> > > This series fixes the clocks supplied to QMP PHY IPs in the Qcom SoCs. All
> > > of the Qcom SoCs except MSM8996 require 3 clocks for QMP UFS:
> > > 
> > > * ref - 19.2MHz reference clock from RPM/RPMh
> > > * ref_aux - Auxiliary reference clock from GCC
> > > * qref - QREF clock from GCC or TCSR (TCSR since SM8550)
> > > 
> > > MSM8996 only requires 'ref' and 'qref' clocks.
> > > 
> > > Hence, this series fixes the binding, DT and GCC driver to reflect the
> > > actual clock topology.
> > 
> > Is this based on documentation for all the SoCs or on inference from the
> > current (upstream and downstream) devicetrees?
> 
> It is based on the internal documentation. Even downstream devicetrees are
> wrong. I should've mentioned it in the cover letter.
> 
> > Are you sure that you should not just describe that some of these UFS
> > reference clocks are sourced from CXO in the clock driver instead?
> 
> I don't get your comment fully. Could you please elaborate?

Unless the PHY consumes CXO directly, it should not be included in the
binding as you are suggesting here.

We discussed this at some length at the time with Bjorn and Shazad who
had access to the documentation and the conclusion was that, at least on
sc8280xp, the PHY does not use CXO directly and instead it should be
described as a parent to the UFS refclocks in the clock driver:

	https://lore.kernel.org/lkml/Y2OEjNAPXg5BfOxH@hovoldconsulting.com/

The downstream devicetrees have a bad habit of including parent clocks
directly in the consumer node instead of modelling this in clock driver
also for other peripherals.
 
> > Take a look at commits
> > 
> > 	f446022b932a ("arm64: dts: qcom: sc8280xp: fix UFS reference clocks")
> > 	f6abcc21d943 ("clk: qcom: gcc-sc8280xp: add cxo as parent for three ufs ref clks")
> 
> Btw, these commits are not accurate. In all the SoCs before SM8550, reference
> clock for the UFS device comes from the UFS controller. There is a dedicated
> register in UFSHC memory map that is being toggled by the driver to
> enable/disable reference clock for the UFS device.
>
> Since SM8550, reference clock is directly sourced from RPMh. I'm preparing a
> series to fix it.

What exactly is wrong with those commits? We know that the controller
does not consume GCC_UFS_REF_CLKREF_CLK directly, but describing that as
such for now was a deliberate choice:

	GCC_UFS_REF_CLKREF_CLK is the clock to the devices, but as we
	don't represent the memory device explicitly it seems suitable
	to use as "ref_clk" in the ufshc nodes - which would then match
	the special handling of the "link clock" in the UFS driver.
 
> Unfortunately, this information is not depicted correctly in the downstream
> devicetrees.

I was hoping the information that those commits are based on would be
correct as it came from Qualcomm and Bjorn. I have no illusions about
the downstream devicetrees being correct. :)

Johan

