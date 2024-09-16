Return-Path: <linux-clk+bounces-12123-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D719F97A461
	for <lists+linux-clk@lfdr.de>; Mon, 16 Sep 2024 16:47:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15D971C21C86
	for <lists+linux-clk@lfdr.de>; Mon, 16 Sep 2024 14:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 412D2157A72;
	Mon, 16 Sep 2024 14:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jojvh/dI"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1254F155336;
	Mon, 16 Sep 2024 14:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726498035; cv=none; b=Gv2Zsj57Y5qeoo5gA9+0dWL2O2D134uLHdTY+faNEy6NiJUP9hFw7cMlEr+kOZ2hbLhHDTMI1u7+ino5W/TvGZNweL2OSsQ26z73Z01coecoqkIJIS/ybwPrjoeqBwuUBxZj/Edy81Dca/FrKsiOT9vvRDv+Xyij7hYwgZHAc1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726498035; c=relaxed/simple;
	bh=viFxBNafyARwAl0FfQrShBY6t3IX0oa4er8jBzriwpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U+q1vb+SeR14vMWUatvi0Qs1m+UWBHjM2f4M6HQ6LcUmbywX1Gi6Cp/DZviVOx4E3l9j6mOU5RPMP2Dbdbv0fQfFShrYXL35nUwPThWtaXkurCcR3Eyfje01yCZBWlhGdYgIwBXx99bBfJK/2mSrqHlwi0jrhEPrdM2obO38VD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jojvh/dI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FC62C4CEC4;
	Mon, 16 Sep 2024 14:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726498034;
	bh=viFxBNafyARwAl0FfQrShBY6t3IX0oa4er8jBzriwpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jojvh/dIoCzRiqDsVf8SWmNsWB5OCxSH2ENrfdoqC5JxV8Cvpd77rNrgQZ83aNjv8
	 bRs6N7sR4IzNCqTxnQGWEMuYCw+lCzv/wrsU6gOmHyaW5n3n1FINaAKSEPky/OkcEw
	 bu+5uQSU8QMr7Spy9Ilb4baA3tFTvoXnMjVOweCScPfLPmIJWxDBzchZFBAZvVarRs
	 iKI2NWhhKVgbl+ZP0ArDJ+4+DaV6/7KT1sWFc6hQnt7C9Hqx+H/WSlDWtCPFabHwEA
	 udIdY7vBt++2Kg4TNMnGW+VQyBreIjtXax4tbOO0IgHjW03gKESbpwOIr8OEb5rBB5
	 YlI8YmzIL/xpw==
Date: Mon, 16 Sep 2024 09:47:13 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Harry Austen <hpausten@protonmail.com>
Cc: Michal Simek <michal.simek@amd.com>, Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] dt-bindings: clock: xilinx: describe whether
 dynamic reconfig is enabled
Message-ID: <172649803240.390306.18107448041621061846.robh@kernel.org>
References: <20240913191037.2690-1-hpausten@protonmail.com>
 <20240913191037.2690-6-hpausten@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913191037.2690-6-hpausten@protonmail.com>


On Fri, 13 Sep 2024 19:11:37 +0000, Harry Austen wrote:
> Xilinx clocking wizard IP core's dynamic reconfiguration support is
> optionally enabled at build time. Add a devicetree boolean property to
> describe whether the hardware supports this feature or not.
> 
> Since dynamic reconfiguration support was previously assumed enabled,
> introduce a property to indicate the inverse, in order to maintain
> devicetree backwards compatibility. Hence, this new xlnx,static-config
> property should be specified when dynamic reconfiguration support is
> disabled in the IP core configuration.
> 
> Signed-off-by: Harry Austen <hpausten@protonmail.com>
> ---
> v1 -> v2:
> - Invert meaning of the new DT property
> - Renamed from xlnx,dynamic-reconfig to xlnx,static-config
> 
>  .../devicetree/bindings/clock/xlnx,clocking-wizard.yaml     | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


