Return-Path: <linux-clk+bounces-19785-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E6FA6EB26
	for <lists+linux-clk@lfdr.de>; Tue, 25 Mar 2025 09:11:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98C3C3ADAB7
	for <lists+linux-clk@lfdr.de>; Tue, 25 Mar 2025 08:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 759E9254867;
	Tue, 25 Mar 2025 08:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PMAY3ru9"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AEA1D7E37;
	Tue, 25 Mar 2025 08:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742890278; cv=none; b=XNJpnjYOIQIrA+/tb7RXG2snmE/wvkMgg8TwYpBIojibXSsN50OPrgMoO8VZFtS/28rM9+2VNKVEJbj+syN7LGLjC/PdDqUOB83hN5VYrao5ynefxR3yVI7nfE3W85ZUUQPXZ4MX/jv1QDNNIbBy8dirL1+VFtepFdQuEv0OUTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742890278; c=relaxed/simple;
	bh=sqdqt6cZvQDX0oVFnEsMmomrp/59fMvqIHre9ETCDls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rQUMpR9nY3kN8HybncffTN0na42KPN2dfVJDDHUEGSQHpJ48IrFT4FoLweSv7wA2YU/ZuPoy37qqm1p5YTLK9kH9EHiOW67zpVtIICcOPOpr4lP9Sx7k4i6YR3vKn/woyVbNmWHFBqLzP2V98AI35kDduPzYZRpLtxMIKszPrkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PMAY3ru9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E849C4CEED;
	Tue, 25 Mar 2025 08:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742890276;
	bh=sqdqt6cZvQDX0oVFnEsMmomrp/59fMvqIHre9ETCDls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PMAY3ru9tqbAtQHP+Mmh0vHI9ITvVoixjATT8q9BGmYBsUbdiuyw5Hx/u0kdIZspb
	 U27ZCeYIB2w5HMp6W+6gkT79t/2g2nIxcQqN028eqrj29zXDfVu61sGpa6aHVSWe4Y
	 flDNs8AMn7f7tmMYkzsjJSqdKPR2vZNhoJESVKcJeAEQ7rg0/jT+h8KXT89mTu5e8Q
	 p1/VI/ALO8ukV0nhSKs42FfLUUQEn3LL8Umu8U5uIJnhIrQAKUoQ5zhqVTGoGYcSQD
	 cXqGW983DM3/cNO5YhMxxWQxAbDdgCU4QOIJnWbP5ZtLbJ1gO5a4QaWPp7SVkrW+Ua
	 7iGQ0CbFBtpBw==
Date: Tue, 25 Mar 2025 09:11:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	pierre-henry.moussay@microchip.com, valentina.fernandezalanis@microchip.com, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Lee Jones <lee@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 1/9] dt-bindings: mfd: syscon document the
 control-scb syscon on PolarFire SoC
Message-ID: <20250325-analytic-axolotl-of-prestige-e82aff@krzk-bin>
References: <20250321-cuddly-hazily-d0ab1e1747b5@spud>
 <20250321-idiom-remedial-daeddab1dcd8@spud>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250321-idiom-remedial-daeddab1dcd8@spud>

On Fri, Mar 21, 2025 at 05:22:34PM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The "control-scb" region, contains the "tvs" temperature and voltage
> sensors and the control/status registers for the system controller's
> mailbox. The mailbox has a dedicated node, so there's no need for a
> child node describing it, looking the syscon up by compatible is
> sufficient.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> v2:
> add the control-scb syscon here too, since it doesn't have any children.
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


