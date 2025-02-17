Return-Path: <linux-clk+bounces-17920-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8E4A321D6
	for <lists+linux-clk@lfdr.de>; Wed, 12 Feb 2025 10:13:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00EDA1884098
	for <lists+linux-clk@lfdr.de>; Wed, 12 Feb 2025 09:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C368205E01;
	Wed, 12 Feb 2025 09:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k0wH+HtM"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2F0205AD9;
	Wed, 12 Feb 2025 09:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739351631; cv=none; b=LglHuw1N6DcIlQi0teIIKiD6p9RDD9fd6a9BI9ir+3WikBPFrI26tBZKnDYVkwViPcJqtH4nzmJyTpRK40HTBAWBy26BpiwUhtv9HILeXtIvdKkxVjFSiYNoC5LqJI07FyywKZGFlEUVYxPcN7aqFISy3Tq9gj/g3kILejtkx+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739351631; c=relaxed/simple;
	bh=m8hs1EQzDriUMRQFfLQbZLGjCLK5Tchyqt6Tq25FBmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZN4rTM2udLvPoigschafvYM8p5xVerHzbBqN9rwV+GaT4CYJ6M5yyUJVe08zCGDDVZutxFrVmtWRjDK9fSXQVX2cKz3+pyQUpTzMrd7ZTXMfiBOB25/tz/gTnz2bobO2Xouukib2Eu3pj1rDbzeduDjdsJftxz6AORJ8XyClW/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k0wH+HtM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26F4DC4CEE2;
	Wed, 12 Feb 2025 09:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739351630;
	bh=m8hs1EQzDriUMRQFfLQbZLGjCLK5Tchyqt6Tq25FBmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k0wH+HtMMeLv2bILij2hae73ypCmOGu6XB7618BrDg9dA+OXCvw4Wlw1L/n5489ag
	 CF+3vjW3/31gmpwDOiGtnIgoiDn62rFTOwpj/aVPvEkcHemS4EMll1e3AGMyirKK3H
	 UQJRL4ZSZy4uYqSk1RG3oOrIST75/wfQ2fXJ41BPDwuVjKompYR6GRVkkHHvPF/2Vq
	 26jK0XQN5uUR0o9csMhpi10+Uu6AeHBIimADArQR5M7W9jthxnfjyhm8cqLyuNmYnJ
	 Rnux+8jarjQ9JV7l/90CQqTPNDghBK10FxQXMzgnYRxeFSBzqTsLLtND78IISepghV
	 4HhX1M3CXC9tw==
Date: Wed, 12 Feb 2025 10:13:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Dahl <ada@thorsis.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Ryan Wanner <ryan.wanner@microchip.com>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 07/16] dt-bindings: nvmem: microchip-otpc: Add
 compatible for SAM9X60
Message-ID: <20250212-space-junglefowl-of-teaching-53f57c@krzk-bin>
References: <20250210164506.495747-1-ada@thorsis.com>
 <20250210164506.495747-8-ada@thorsis.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210164506.495747-8-ada@thorsis.com>

On Mon, Feb 10, 2025 at 05:44:57PM +0100, Alexander Dahl wrote:
> The SAM9X60 SoC family has a similar, but slightly different OTPC to the
> SAMA7G5 family.
> 
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


