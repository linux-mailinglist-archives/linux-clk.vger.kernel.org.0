Return-Path: <linux-clk+bounces-18292-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29379A3B343
	for <lists+linux-clk@lfdr.de>; Wed, 19 Feb 2025 09:09:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0516316DD94
	for <lists+linux-clk@lfdr.de>; Wed, 19 Feb 2025 08:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C85EF1C54A5;
	Wed, 19 Feb 2025 08:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XOXkBjOu"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975EA192B66;
	Wed, 19 Feb 2025 08:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739952569; cv=none; b=B5y75UOyv8BMtADo3M6XlHcYgMHmGfTrwswKmTHyVfLNHbVKNxayGtEtr8W4IrQvyvYsj4wuO8w/fwhOyG6gpvUc6BSTPoseZ8Kx+RQOaITrE3sWmq9fusgjqEC+krRRr2TOrwU2lMIVsauwK03sL7PMhL5//920jp8/qfkLqJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739952569; c=relaxed/simple;
	bh=M7Q2P6Nbyqxbqn82NDOiFMTGHBZa2DrnxUtGtE5Yto8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ek3QlesswK8WlZ0sg+ovocwyXKWGEAypgXB7q7bqXdVxh6WKPReJ5UtFsJzzfqeMik+5FLL6lWVV5ldQZHSy5QVkSj8AjHj1jtcuMJqGQJlm3eabAcwwS3RqbDX1NCtYdD2XPv7eUXmeIn3h3H5OUmgj4iWmUR0fChkJrW19/PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XOXkBjOu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59152C4CED1;
	Wed, 19 Feb 2025 08:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739952569;
	bh=M7Q2P6Nbyqxbqn82NDOiFMTGHBZa2DrnxUtGtE5Yto8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XOXkBjOuRvzrlVQU1kpv4rPNC2Vcpz+CkX5vI9Locy7zX59WHDb+L1wef4GiF4lcG
	 IYvLZsHO8fuly+6YD84mOvNaZsnj4nNXSVje9LVFWMDvmweWGiut9DG0ntkQmjhNqJ
	 +ThpiI4CA+fKti9esaiLQ2xpHVUSbrjLFPwAzFXm+SItLTEwty5QX6In2sRfdslgBE
	 0jQkWoYsFTSmp7bZ2TLEGDIuEjbs77Ll1meQxG1+ymLhnxK1rN/rX3tMeC4SphhMj7
	 062Qd1KMSGWpsPA4PQbhGwmmIYZgN90UeFX0l2Z3S+OtzLLi3fte90A8xs4p139HNW
	 Prd4RnqClPtaw==
Date: Wed, 19 Feb 2025 09:09:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/5] dt-bindings: soc: samsung: exynos-pmu: add
 exynos7870-pmu compatible
Message-ID: <20250219-functional-brown-fennec-8d55ea@krzk-bin>
References: <20250219-exynos7870-pmu-clocks-v3-0-0d1e415e9e3a@disroot.org>
 <20250219-exynos7870-pmu-clocks-v3-3-0d1e415e9e3a@disroot.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250219-exynos7870-pmu-clocks-v3-3-0d1e415e9e3a@disroot.org>

On Wed, Feb 19, 2025 at 12:20:30AM +0530, Kaustabh Chakraborty wrote:
> Document the compatible string for the Exynos7870 PMU. It's compatible
> with the Exynos7 PMU design. It handles syscon reboot, syscon reboot mode,
> as well as other system control registers (i.e registers for the USB PHY).
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
>  1 file changed, 1 insertion(+)

I don't understand why did you send SoC patch to clock. I asked to split
by subsystem.

Best regards,
Krzysztof


