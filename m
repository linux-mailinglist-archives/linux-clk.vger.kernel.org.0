Return-Path: <linux-clk+bounces-27384-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFD2B464DC
	for <lists+linux-clk@lfdr.de>; Fri,  5 Sep 2025 22:45:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 911CB3A6EFF
	for <lists+linux-clk@lfdr.de>; Fri,  5 Sep 2025 20:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3F932D8760;
	Fri,  5 Sep 2025 20:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K5kWqd+G"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33332D7DE9;
	Fri,  5 Sep 2025 20:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757105105; cv=none; b=SPiV6/BQKw8DjmEgtcVfXHI6qIb6lxeJoXfiUXprIu6osTC6MuTjlErU1lS9FXN/FS2Xyh8jpYJDYGlQvfWVhcViGMBHHKOd2yU2oJl7fEW2OHSpRHNekEbB0P1iYlwh45GdwkvfTsw7jtNBy48DiMV6TbvSF6qmsB96NB7T4Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757105105; c=relaxed/simple;
	bh=4ZLCyJt/jgAVLSyrVPrxlIa5FRBvIVjWg3S+LiVVSqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K+pBFDnCy4PgmcdMo4loPXZHVahLGOR5AZ0vi+hyGUwJFhJTwzfVnNmcUdyKfBWBfVeJGBRkMREFFgLy4iny0Q19MrDEk0YZseJFB0wCLD4eiPclgWnNR65FF5Hgu8O745IJXm08kT5Mh/olfKgdyNyyq2VdarpmJbC1WDYGjWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K5kWqd+G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 125DCC4CEF1;
	Fri,  5 Sep 2025 20:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757105105;
	bh=4ZLCyJt/jgAVLSyrVPrxlIa5FRBvIVjWg3S+LiVVSqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K5kWqd+GaUtF8PvSlPDq6g7W/bImMKVo7Znc7Omtj6NReEt9sFqffksrb8/6ON8/A
	 OohPm2WgU0IIIjVt3nKGRu5y8bZ5CzchNRmBvJRsyehZYVY2oGnOD0Flnsrp8gpeTk
	 H8NohGs6+j4Sh7rxGV0/vLelcCR4+wCIpdi40R0hRtINYRYzLbfsPBlKADWwEGQCnM
	 u9DI7uzOluK2UR6C7RQVadjopsK+N3XzzPeU0JCAf4Z1nmb01G8dbcbB/XM+ZkJNYq
	 VNsrKlfn2CE0pRqA6vH75ghtEbeGH24rNVOlQCNXm21iEG30wexijhTfSFX5YU/syp
	 8UQ2UueKpz1Tw==
Date: Fri, 5 Sep 2025 15:45:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: WeiHao Li <cn.liweihao@gmail.com>
Cc: andy.yan@rock-chips.com, conor+dt@kernel.org, heiko@sntech.de,
	krzk+dt@kernel.org, hjc@rock-chips.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 8/8] dt-bindings: display: rockchip,dw-mipi-dsi:
 Document RK3368 DSI
Message-ID: <175710510342.1351910.7954617435326405550.robh@kernel.org>
References: <20250905025632.222422-1-cn.liweihao@gmail.com>
 <20250905025632.222422-9-cn.liweihao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905025632.222422-9-cn.liweihao@gmail.com>


On Fri, 05 Sep 2025 10:56:32 +0800, WeiHao Li wrote:
> Document the MIPI DSI controller for Rockchip RK3368.
> 
> Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
> ---
>  .../bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


