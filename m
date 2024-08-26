Return-Path: <linux-clk+bounces-11184-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 800C595F36E
	for <lists+linux-clk@lfdr.de>; Mon, 26 Aug 2024 16:00:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34F88282EE4
	for <lists+linux-clk@lfdr.de>; Mon, 26 Aug 2024 14:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D72F22AD15;
	Mon, 26 Aug 2024 14:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a/xs8b/C"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DAE372;
	Mon, 26 Aug 2024 14:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724680847; cv=none; b=gjhYNaeBPR8GpYp/4Zrwyq2VYhQPRbvgV2kkFwQ+kMZaJocDdcsn+SdtW78MY+nOdU/TG9KLojEovUywelTwgE1lCMNwc5KLNgI/z6d7sdhkR1rkGi8kpG8s6OFC3MZw+/YI5vpo3zMRFumBrO2bOyvEFDsF6jdU54P0Ok2U1Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724680847; c=relaxed/simple;
	bh=N6QZc8YM8klksq0nE1lKt6yDYzsUUOHjIINFLCMZQUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TIEtdvYbuh088afgR95p8UkBeTC6/lhkYl00ugURodQ4VLV7zfoWAi5YYoveZpSz0Z4zv08yZdm1uhk/+hEqzQMAXBJOzJm+B6puAfHTi21gTNaw7cJQBpytdyof0+H7bWaWJPcizBepOrQmSUXs3w6oK3bORU2Vo18miizXNgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a/xs8b/C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED2E0C52FC3;
	Mon, 26 Aug 2024 14:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724680846;
	bh=N6QZc8YM8klksq0nE1lKt6yDYzsUUOHjIINFLCMZQUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a/xs8b/C1L9CHIrb9yc9EtcYI9Qixbr/BvDfyXHjXTL8woZUoYFLY+1J0vU267ATI
	 BH1AKAPNDDgC/lqiI/dC20ap9LZTKo9eWGQLiKLDBzZbNECqv0Jo2SykjK8KHp95se
	 J6AcxKncn/4aQo2+dOo5PqKlhgHyjfbv+RLWWABzQKRD2vAmHGY0uom0Fbw9rsvOXp
	 aoo/FbIHBSvMrker4TZ/btb64fn3Jju67Y14TR9uwrRZGmt7P72ubDB6M4qKhYqvP4
	 xCgi1RmrklIMnGp/G50pmlbJuUwckoPtIWoZsmRaGEw5ppxnWEFl0vCionzWvixwf+
	 Sr0fnsf4GRoZA==
Date: Mon, 26 Aug 2024 09:00:44 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Sugar Zhang <sugar.zhang@rock-chips.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v6 1/3] dt-bindings: clock, reset: Add support for rk3576
Message-ID: <172468084271.72163.10961446550304422485.robh@kernel.org>
References: <20240822194956.918527-1-detlev.casanova@collabora.com>
 <20240822194956.918527-2-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822194956.918527-2-detlev.casanova@collabora.com>


On Thu, 22 Aug 2024 15:49:32 -0400, Detlev Casanova wrote:
> Add clock and reset ID defines for rk3576.
> 
> Compared to the downstream bindings written by Elaine, this uses
> continous gapless IDs starting at 0. Thus all numbers are
> different between downstream and upstream, but names are kept
> exactly the same.
> 
> Also add documentation for the rk3576 CRU core.
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  .../bindings/clock/rockchip,rk3576-cru.yaml   |  56 ++
>  .../dt-bindings/clock/rockchip,rk3576-cru.h   | 592 ++++++++++++++++++
>  .../dt-bindings/reset/rockchip,rk3576-cru.h   | 564 +++++++++++++++++
>  3 files changed, 1212 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3576-cru.yaml
>  create mode 100644 include/dt-bindings/clock/rockchip,rk3576-cru.h
>  create mode 100644 include/dt-bindings/reset/rockchip,rk3576-cru.h
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


