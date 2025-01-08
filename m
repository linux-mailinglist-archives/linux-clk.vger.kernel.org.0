Return-Path: <linux-clk+bounces-16820-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA07A05ACD
	for <lists+linux-clk@lfdr.de>; Wed,  8 Jan 2025 12:58:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5075B166BE8
	for <lists+linux-clk@lfdr.de>; Wed,  8 Jan 2025 11:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D31521F8F17;
	Wed,  8 Jan 2025 11:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="dS67wEdo"
X-Original-To: linux-clk@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1EF1F8ADB;
	Wed,  8 Jan 2025 11:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736337421; cv=none; b=qiDWS656u+Itr+Ik3diXH+LTl/SJKpW1N7C1QNJqfc/D1H3LqGnxwWkrQeWS5Q3Qt5GpPC4f2aUY8n5cSbrE1e003UcLqhiFzT4gbBKwFY70CtcEGOIxNiisgEqlBwOGMS3lTXicTEW38P2VbCiAWy+DbVEvlQu7UfFbqnqMTaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736337421; c=relaxed/simple;
	bh=5tK6T5BnxOGB8HNkuG5gnenqtrDCvmYdb2Y6OFf9yXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IC5eEt9kM24tLvvwnVb4rBL29YLNCmGm6BqW48rkhaOxSopNWWhpn+BT1nHwa7CZRmXnqiIE+iceR1Use7Nj40AzNkbm34+cB2I6+oH6xPJ5pWhFWdmW4LOz++NjT7cCVkBJWYvXSwv+ejBSy89ezB3LuaT7Zpzm/4Ff8pIZveA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=dS67wEdo; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id AF3D625C32;
	Wed,  8 Jan 2025 12:56:58 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7STX7QO0Ro6w; Wed,  8 Jan 2025 12:56:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1736337417; bh=5tK6T5BnxOGB8HNkuG5gnenqtrDCvmYdb2Y6OFf9yXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dS67wEdo9Xd9+EPbZHqPmuiPPKjnsk/abCj9X6pJGxK0aY4Ewgh5bpApkWMPK/sHz
	 lPDdsm2UDA6m0MugYuWB/o33inUlCLstXAiS4ZH6Zpi2bFFNLWpSMD7CpUFsalC2IW
	 PaVjXcIPNs9fXSWtSt0E+Kpfb4MSiUJUtxozAu1N0SNmuxMHprefb0zCv0Y9zj+mTG
	 WkuzW1qIVJCYgnaPig+0TOMSe4NRwIJsbRAKIrYKNyB82HxGWhL6+myYIAATOhG0Xl
	 QVPy52GK984Qh8aNroXOEx4MhQd861Lq/wJfyG54BL/Mjc46+qHlTCxTb+8jFz8dis
	 4aVXjh5G5Wdrg==
Date: Wed, 8 Jan 2025 11:56:45 +0000
From: Yao Zi <ziyao@disroot.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Support clock and reset unit of Rockchip RK3528
Message-ID: <Z35n_YBSAxWN-4DV@pie>
References: <20250108114605.1960-2-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108114605.1960-2-ziyao@disroot.org>

On Wed, Jan 08, 2025 at 11:46:01AM +0000, Yao Zi wrote:
> Similar to previous Rockchip SoCs, reset controller on RK3528 shares
> MMIO region with clock controller, combined as CRU. They're represented
> as a single node in dt.
> 
> For the reset controller, only bindings are included in this series
> because it's hard to test the reset controller without support for some
> peripherals (e.g. pinctrl). I'd like to first make dt and basic
> peripherals available, then submit the driver.
> 
> This is tested on Radxa E20C board. With some out-of-tree drivers, I've
> successfully brouhgt up UART, pinctrl/gpio and I2C. A clock dump could
> be obtained from [1].
> 
> [1]: https://gist.github.com/ziyao233/032961d1eebeecb9a41fea2d690e8351

Oops, I forgot to attach the changelog. Sorry for the inconvenience and
please refer to this,

- dt-binding changes
  - relicense binding headers as GPL-2.0-only OR MIT
  - use gapless integers starting from 0 for binding IDs
  - make input clocks essential, add corresponding description
  - rename the input clock that is generated by phy module as "gmac0"
  - style fixes
- driver changes
  - format in the common Rockchip driver style
  - drop initializing code of the reset controller, as it'll not be
    supported in this series

> 
> Yao Zi (5):
>   dt-bindings: clock: Document clock and reset unit of RK3528
>   clk: rockchip: Add PLL flag ROCKCHIP_PLL_FIXED_MODE
>   clk: rockchip: Add clock controller driver for RK3528 SoC
>   arm64: dts: rockchip: Add clock generators for RK3528 SoC
>   arm64: dts: rockchip: Add UART clocks for RK3528 SoC
> 
>  .../bindings/clock/rockchip,rk3528-cru.yaml   |   67 +
>  arch/arm64/boot/dts/rockchip/rk3528.dtsi      |   68 +-
>  drivers/clk/rockchip/Kconfig                  |    7 +
>  drivers/clk/rockchip/Makefile                 |    1 +
>  drivers/clk/rockchip/clk-pll.c                |   10 +-
>  drivers/clk/rockchip/clk-rk3528.c             | 1114 +++++++++++++++++
>  drivers/clk/rockchip/clk.h                    |   22 +
>  .../dt-bindings/clock/rockchip,rk3528-cru.h   |  453 +++++++
>  .../dt-bindings/reset/rockchip,rk3528-cru.h   |  241 ++++
>  9 files changed, 1978 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3528-cru.yaml
>  create mode 100644 drivers/clk/rockchip/clk-rk3528.c
>  create mode 100644 include/dt-bindings/clock/rockchip,rk3528-cru.h
>  create mode 100644 include/dt-bindings/reset/rockchip,rk3528-cru.h
> 
> -- 
> 2.47.1
> 

