Return-Path: <linux-clk+bounces-13106-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C695F99A664
	for <lists+linux-clk@lfdr.de>; Fri, 11 Oct 2024 16:34:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54300B24472
	for <lists+linux-clk@lfdr.de>; Fri, 11 Oct 2024 14:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800A62576F;
	Fri, 11 Oct 2024 14:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N9+fB3D9"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B051624;
	Fri, 11 Oct 2024 14:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728657242; cv=none; b=qW8Klgc+6bnxJv6QrGTuwly/0+5wx5EH1MvbFElMwaCxUsOIqT/9HQ+bLY21x9VQ0nIr82W4oPE9f9mUR1zaUeNCY+vC0w1fKrCfmpVOSfcXERQuArLPDIerzaiZQRRJrwj1nElGyChpzHpDkYKnvo91kQvSvfnZMroJu0MzgWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728657242; c=relaxed/simple;
	bh=WPP/cksWSY6sZJvpmvmFHWLmcM1V/s10fU0P9R11wbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k7HQdjsIgzE3NewKlmoU8C5SFdUB4Zu8cvqlvtvFP9GNH5e8ZmmvrKRhy10oxULCdY35+DT06IJafuTqKDDual4WSiwt9TqGYDtgcgTblUQJ7rXuFATlZksIG3XYYlAmlntxj1qR0ClEQo1BPrMntG9fxFaQ7JZsmUGOUFhEMsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N9+fB3D9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FDC9C4CEC3;
	Fri, 11 Oct 2024 14:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728657241;
	bh=WPP/cksWSY6sZJvpmvmFHWLmcM1V/s10fU0P9R11wbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N9+fB3D91ueFo0rcVbNGGeCY53sSPiqiTZHwpMI9y6jrVisKiZq/RG6RdBYSGdRSH
	 pozVZXC+Ud2N1R+ytURHEXJ6gFW89uDhDzCbWYG4uU+NdlnkZCXU2kRki0IaCd1s1W
	 DovK66my0/K7NBkYnslOQM+ilcJ4J1o8lPPF2LGpRu7jgNdVY9KpxPSM2S/FxU04Ts
	 OGYOVld079NgpX2CZLZ+7e9gAJtQzp0KHQHdHxp7f5Q4Odybzy00NPjGhX+utkFMQk
	 k5KKKUS9w9cVgyDq0v9QbZn+yWTPDA7QVHv8nHqG0oGLOIdsZoYOFv0xBCd8jOfTjS
	 VG+mdfSCtfXKQ==
Date: Fri, 11 Oct 2024 16:33:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: manivannan.sadhasivam@linaro.org, vkoul@kernel.org, kishon@kernel.org, 
	robh@kernel.org, andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, abel.vesa@linaro.org, 
	quic_msarkar@quicinc.com, quic_devipriy@quicinc.com, dmitry.baryshkov@linaro.org, 
	kw@linux.com, lpieralisi@kernel.org, neil.armstrong@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 3/8] dt-bindings: PCI: qcom,pcie-x1e80100: Add
 'global' interrupt
Message-ID: <eyxkgcmgv5mejjifzsevkzm2yqdknilizrvhwryd745pkfalgk@kau4lq4cd7g3>
References: <20241011104142.1181773-1-quic_qianyu@quicinc.com>
 <20241011104142.1181773-4-quic_qianyu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241011104142.1181773-4-quic_qianyu@quicinc.com>

On Fri, Oct 11, 2024 at 03:41:37AM -0700, Qiang Yu wrote:
> Document 'global' SPI interrupt along with the existing MSI interrupts so
> that QCOM PCIe RC driver can make use of it to get events such as PCIe
> link specific events, safety events, etc.

Describe the hardware, not what the driver will do.

> 
> Though adding a new interrupt will break the ABI, it is required to
> accurately describe the hardware.

That's poor reason. Hardware was described and missing optional piece
(because according to your description above everything was working
fine) is not needed to break ABI.

Sorry, if your driver changes the ABI for this poor reason.

NAK.

Best regards,
Krzysztof


