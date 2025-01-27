Return-Path: <linux-clk+bounces-17422-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC31DA1D150
	for <lists+linux-clk@lfdr.de>; Mon, 27 Jan 2025 08:25:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5837816589B
	for <lists+linux-clk@lfdr.de>; Mon, 27 Jan 2025 07:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3733B1FC0F7;
	Mon, 27 Jan 2025 07:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M4mdS01s"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F1B1ADC7C;
	Mon, 27 Jan 2025 07:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737962736; cv=none; b=j/0lYboclk0c5YAdTQ80VysVkMV0dhSRm9nCENq63C8TaMwH2QmP5GcU0OVWoPVfe5KkF97xDp/O6gu4GKmDSscvZEljrScAeGZloDcW/pok5XdRPPNR1y6rGYFxc5gto5j6kTOQMtIco/bhfRgemQ/01wI4fYsx4byx24OSelE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737962736; c=relaxed/simple;
	bh=ZjgQ3qeHM2z/Ryyrb7fr2iGllM4QBTeFfxajtk2G45k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fr+AgJ/D3v830S7/RomyEG/XAG93Ru60DTT7jhiHLLkgNx/FAAI75rY+s4yIRtZPREPvtcz41H3yKN7pwofCUsin0h9iC+g6p6cRLTUwjvoesCMZiAq0Xo8Amv8ZFDN0zWlYxLNbmq/L73QgXKPAC92cGfP4qhI+jBxYoFDwZIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M4mdS01s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3ADBC4CED2;
	Mon, 27 Jan 2025 07:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737962735;
	bh=ZjgQ3qeHM2z/Ryyrb7fr2iGllM4QBTeFfxajtk2G45k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M4mdS01srY4/igeWBs9e923oldIzjViRSOifehofOQGNMGlpCfPJ40NLdCrgHWEda
	 s5bqcGWVZKLNiksTa60hd3vGFKtEEENjMgeSYlC68GkE4YEj0zw7Ao5cJ0rUUvfX2m
	 x6InKVIUCKSkbhKXp4cZnQtXC0H5cF68AriO5cYBdYIDKVjidcZtuDmfFF2OiifNNG
	 pp1r9TWS0u80lmiatq1R1oW/OV4CuBYtMS3+Yn9LISZAPr+97thXMg57LHmSgwy+JD
	 O4PY9wbTVKex8xH5LaR1OGLkdQWoY+WcYamMaUZ1w7lqR7aVhLOnnDZp6XS41WOCOO
	 jwEU2t9ErewtA==
Date: Mon, 27 Jan 2025 08:25:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lpieralisi@kernel.org, 
	kw@linux.com, manivannan.sadhasivam@linaro.org, bhelgaas@google.com, 
	konradybcio@kernel.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	quic_srichara@quicinc.com, quic_varada@quicinc.com
Subject: Re: [PATCH v3 1/4] dt-bindings: PCI: qcom: add global interrupt for
 ipq5424
Message-ID: <20250127-convivial-wolf-of-eternity-cc1957@krzk-bin>
References: <20250125035920.2651972-1-quic_mmanikan@quicinc.com>
 <20250125035920.2651972-2-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250125035920.2651972-2-quic_mmanikan@quicinc.com>

On Sat, Jan 25, 2025 at 09:29:17AM +0530, Manikanta Mylavarapu wrote:
> Document the global interrupt found on IPQ5424 platform.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
>  Documentation/devicetree/bindings/pci/qcom,pcie.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> index 7235d6554cfb..1fd6aea08bf0 100644
> --- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> @@ -49,11 +49,11 @@ properties:
>  
>    interrupts:
>      minItems: 1
> -    maxItems: 8
> +    maxItems: 9
>  
>    interrupt-names:
>      minItems: 1
> -    maxItems: 8
> +    maxItems: 9

You just added it for few other devices as well, like sdm845. If you
raise one part of constrain, then you need to correct each block where
old constrain was implied.

Best regards,
Krzysztof


