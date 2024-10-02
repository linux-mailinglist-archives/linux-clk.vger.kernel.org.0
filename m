Return-Path: <linux-clk+bounces-12631-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A080B98CD34
	for <lists+linux-clk@lfdr.de>; Wed,  2 Oct 2024 08:32:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 631AE2876E3
	for <lists+linux-clk@lfdr.de>; Wed,  2 Oct 2024 06:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D57EA126C0C;
	Wed,  2 Oct 2024 06:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kcS2/lAL"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FD9374CB;
	Wed,  2 Oct 2024 06:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727850769; cv=none; b=PpRF7h25fRdD9XCOWggE3/OUPsvBdw+hhcn9ZVerEK/smz9NNVf+nMwxvAadxeVa5PAa6OY/HIrI3Een+jwtt6bWbupJLfvoNpc5OW1HTW6FI6Dyts3ma66Dge45uSFHOT+ibVDppynUwf0eH4r4W3HH9GuwIKJ8ALEIERXft74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727850769; c=relaxed/simple;
	bh=ANwIj+ZUzR6i/VHBj0MdBJN4I3sPD9eZBxis5eVt93s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FCq8Vg3JpJUBy3qFliwzIXrejl8VjQRUMrm4gLwcy7+xjpoBNs4SKjBuNRSDS3r7ACzW8ZYgZBXFG1BTeYChdl6nuLN5Bq8q/KkOK4tzq9s45N4ZDqXkxIjSs+E3+OeLGicDjA+O2XiBeOH2El4dXtx2aVn49qHSDLE4VOAV4I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kcS2/lAL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA61FC4CEC5;
	Wed,  2 Oct 2024 06:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727850769;
	bh=ANwIj+ZUzR6i/VHBj0MdBJN4I3sPD9eZBxis5eVt93s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kcS2/lALqEJvzuBK5e+XNOKIbO2E+NykVYLi0GRmt6Ncz1EA6spi35sOOVZZR31EA
	 kfmJotnzJKp/06z+gmwapFuqWsOHDCUypL9sedYn9IHU97liGfYW0vsAn1dPIMATjQ
	 yMMEXeV4UGaoDrF6ZKIxa+UTsWDW3bq3E85Sr/mIcjYa6v+L1GOKYq8jRNkC7QCLYr
	 aCGVoCJfKnL/XrToiIxBepFqsp486iHjh/W/HvGS5fykHGNxa8LsJAN6WfQMphdwmN
	 JWzEBocNjxv/Q//msKsJjg0vxUhkidijSi/cZEkY5hhckF9eX29KMvJnj+bKZNI8BA
	 7fQYZYozXn+vw==
Date: Wed, 2 Oct 2024 08:32:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Celeste Liu <CoelacanthusHex@gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: clock: Add clock ID definition for
 Rockchip RK3528
Message-ID: <gb2g7wj3nzc3euhmz7s5szms22qkuhm5yqpnyheq3zm6xf5gmr@tljctg6fpzqu>
References: <20241001042401.31903-2-ziyao@disroot.org>
 <20241001042401.31903-3-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241001042401.31903-3-ziyao@disroot.org>

On Tue, Oct 01, 2024 at 04:23:55AM +0000, Yao Zi wrote:
> There are two types of clocks in RK3528 SoC, CRU-managed and
> SCMI-managed. They are assigned independent clock IDs.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  .../dt-bindings/clock/rockchip,rk3528-cru.h   | 453 ++++++++++++++++++
>  1 file changed, 453 insertions(+)
>  create mode 100644 include/dt-bindings/clock/rockchip,rk3528-cru.h
> 
> diff --git a/include/dt-bindings/clock/rockchip,rk3528-cru.h b/include/dt-bindings/clock/rockchip,rk3528-cru.h
> new file mode 100644
> index 000000000000..c90b25f57973
> --- /dev/null
> +++ b/include/dt-bindings/clock/rockchip,rk3528-cru.h
> @@ -0,0 +1,453 @@
> +/* SPDX-License-Identifier: (GPL-2.0-or-later OR MIT) */

Wrong license.

> +/*
> + * Copyright (c) 2022 Rockchip Electronics Co. Ltd.
> + * Copyright (c) 2024 Yao Zi <ziyao@disroot.org>
> + * Author: Joseph Chen <chenjh@rock-chips.com>
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_ROCKCHIP_RK3528_H
> +#define _DT_BINDINGS_CLK_ROCKCHIP_RK3528_H
> +
> +/* cru-clocks indices */
> +#define PLL_APLL                       1

Start from 0. Just like your other - SCMI - list.

Best regards,
Krzysztof


