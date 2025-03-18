Return-Path: <linux-clk+bounces-19535-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC99A6697F
	for <lists+linux-clk@lfdr.de>; Tue, 18 Mar 2025 06:37:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7098D19A07C4
	for <lists+linux-clk@lfdr.de>; Tue, 18 Mar 2025 05:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5D01D6DBC;
	Tue, 18 Mar 2025 05:37:43 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADAA1A5BAD;
	Tue, 18 Mar 2025 05:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742276263; cv=none; b=b2fm2zxMIAMp+iDYfC4GN6953Ir6RPCqkh02OUfORnCxzMFL28iY6IyYvlSGcwnTWjQJrD99D3bvC416dr2RqVFcTYU/DKBnj/rkTCBW9WJeGE4Z3BNjlIiBEDjaF49NVyvC7mXbGXTIV3sRePJtyu4mxYx/y5uERyBu2EzWxDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742276263; c=relaxed/simple;
	bh=JTmHdxsNNUIH9RV/Wyqp6pcODy1rC6YQQYJmkliAxmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gzDE2033xS/exjUCI41EV9en7X448lygPxpoOSlh2SmSdYneqTqL3Kp4HpefQ7sQo5zHfHEczRsD1rxpzLHykqI9EQux8PSVFb+ymhuNtg7guOBlLAwEBgkaJUt6QZCzv9CmRNGPkzOvOFFIrH46IUUSxDepPdB9BLHBqcRIvS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 07985343249;
	Tue, 18 Mar 2025 05:37:40 +0000 (UTC)
Date: Tue, 18 Mar 2025 05:37:36 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Haylen Chu <heylenay@4d2.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v5 3/5] clk: spacemit: Add clock support for Spacemit K1
 SoC
Message-ID: <20250318053736-GYA2516@gentoo>
References: <20250306175750.22480-2-heylenay@4d2.org>
 <20250306175750.22480-5-heylenay@4d2.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306175750.22480-5-heylenay@4d2.org>

Hi Haylen Chu:

On 17:57 Thu 06 Mar     , Haylen Chu wrote:
> The clock tree of K1 SoC contains three main types of clock hardware
> (PLL/DDN/MIX) and has control registers split into several multifunction
> devices: APBS (PLLs), MPMU, APBC and APMU.
> 
> All register operations are done through regmap to ensure atomiciy
> between concurrent operations of clock driver and reset,
> power-domain driver that will be introduced in the future.
> 
> Signed-off-by: Haylen Chu <heylenay@4d2.org>
> ---
>  drivers/clk/Kconfig               |    1 +
>  drivers/clk/Makefile              |    1 +
>  drivers/clk/spacemit/Kconfig      |   20 +
>  drivers/clk/spacemit/Makefile     |    5 +
>  drivers/clk/spacemit/ccu-k1.c     | 1714 +++++++++++++++++++++++++++++
>  drivers/clk/spacemit/ccu_common.h |   47 +
>  drivers/clk/spacemit/ccu_ddn.c    |   80 ++
>  drivers/clk/spacemit/ccu_ddn.h    |   48 +
>  drivers/clk/spacemit/ccu_mix.c    |  284 +++++
>  drivers/clk/spacemit/ccu_mix.h    |  246 +++++
>  drivers/clk/spacemit/ccu_pll.c    |  146 +++
>  drivers/clk/spacemit/ccu_pll.h    |   76 ++
>  12 files changed, 2668 insertions(+)
>  create mode 100644 drivers/clk/spacemit/Kconfig
>  create mode 100644 drivers/clk/spacemit/Makefile
>  create mode 100644 drivers/clk/spacemit/ccu-k1.c
>  create mode 100644 drivers/clk/spacemit/ccu_common.h
>  create mode 100644 drivers/clk/spacemit/ccu_ddn.c
>  create mode 100644 drivers/clk/spacemit/ccu_ddn.h
>  create mode 100644 drivers/clk/spacemit/ccu_mix.c
>  create mode 100644 drivers/clk/spacemit/ccu_mix.h
>  create mode 100644 drivers/clk/spacemit/ccu_pll.c
>  create mode 100644 drivers/clk/spacemit/ccu_pll.h
> 
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 713573b6c86c..19c1ed280fd7 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -517,6 +517,7 @@ source "drivers/clk/samsung/Kconfig"
>  source "drivers/clk/sifive/Kconfig"
>  source "drivers/clk/socfpga/Kconfig"
>  source "drivers/clk/sophgo/Kconfig"
> +source "drivers/clk/spacemit/Kconfig"
>  source "drivers/clk/sprd/Kconfig"
>  source "drivers/clk/starfive/Kconfig"
>  source "drivers/clk/sunxi/Kconfig"
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index bf4bd45adc3a..42867cd37c33 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -145,6 +145,7 @@ obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
>  obj-$(CONFIG_CLK_SIFIVE)		+= sifive/
>  obj-y					+= socfpga/
>  obj-y					+= sophgo/
> +obj-y					+= spacemit/
>  obj-$(CONFIG_PLAT_SPEAR)		+= spear/
>  obj-y					+= sprd/
>  obj-$(CONFIG_ARCH_STI)			+= st/
> diff --git a/drivers/clk/spacemit/Kconfig b/drivers/clk/spacemit/Kconfig
> new file mode 100644
> index 000000000000..76090cd85668
> --- /dev/null
> +++ b/drivers/clk/spacemit/Kconfig
> @@ -0,0 +1,20 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config SPACEMIT_CCU
> +	tristate "Clock support for Spacemit SoCs"
> +	default y
similar reason to pinctrl with these patches [1], [2]
I'd suggest switch to "bool + default ARCH_SPACEMIT" 

Link: https://lore.kernel.org/all/20250218-k1-pinctrl-option-v3-1-36e031e0da1b@gentoo.org [1]
Link: https://lore.kernel.org/all/6881b8d1ad74ac780af8a974e604b5ef3f5d4aad.1742198691.git.geert+renesas@glider.be [2]

> +	depends on ARCH_SPACEMIT || COMPILE_TEST
> +	select MFD_SYSCON
> +	help
> +	  Say Y to enable clock controller unit support for Spacemit SoCs.
> +
> +if SPACEMIT_CCU
> +
> +config SPACEMIT_K1_CCU
> +	tristate "Support for Spacemit K1 SoC"
> +	default y
ditto
> +	depends on ARCH_SPACEMIT || COMPILE_TEST
> +	help
> +	  Support for clock controller unit in Spacemit K1 SoC.
> +
> +endif

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

