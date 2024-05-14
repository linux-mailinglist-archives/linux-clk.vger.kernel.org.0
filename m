Return-Path: <linux-clk+bounces-7014-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A74F18C4D32
	for <lists+linux-clk@lfdr.de>; Tue, 14 May 2024 09:40:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 09D70B22CD5
	for <lists+linux-clk@lfdr.de>; Tue, 14 May 2024 07:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7AE818E20;
	Tue, 14 May 2024 07:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HzsEGhmS"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BC7171D2
	for <linux-clk@vger.kernel.org>; Tue, 14 May 2024 07:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715672388; cv=none; b=rrmwhbRgNNYa6XfWHC2zX4iZ2krkm0j4JB1slqMCudGNFgBC8Nb+t9vzKTAudc6B8R8slYpe0dT3GAOpYiu4JjCRFqbdwaPID0eELd7QQnDIVhjg3dThI8OC3mUmX70ghtx6VUTRqsjtdjIty3wrZ2V81lhsaEh1oORkJ0nudS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715672388; c=relaxed/simple;
	bh=BBXqtS3wza4QUm5avAstdSHbXwq4rAP5fYUeIZvK6z8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AprcLY/+lZO3CEQtKD6nl/pV1W1fqNOVJKsSxtd5W3c7/6UgHkRE5fRQeSO2PfA4Xj4q2HISg//ynz4Q8yxaD8M/xK40irgWrveafl85iZDYqfrtLvRWytFoWuOCgZCMWsmicPLdEyPM0pYsPg6ynAOdfok65i1hKnfQppnbP9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HzsEGhmS; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a5a1054cf61so1403382466b.1
        for <linux-clk@vger.kernel.org>; Tue, 14 May 2024 00:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715672385; x=1716277185; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fesw46FZQhpdD0Hum6AHiEjagvfShSZGibZKbsl5F+w=;
        b=HzsEGhmSImymZwrXp1ADG/I5YcAIGBoWy9Q4WX7olLT8b/9JftGvURgcxniefCcb/j
         q+9XShClClJb4oCIZdzrSA1JYMAQD9O8Ht5I1FLxyNisur6hOR1hs0mELwDuGtAbZHqW
         8VuThr00dCWrROwaI8Rp2A0yHgtvELrLuroW+M22qoEeHWPbm8HdVhQm0H/rZDjwKrJp
         k0j1s30mpBu5iWaJbe30vc/DLqJKR31Vo8nd4fEoNfOIdBVQmeyizly+sQSMFM6Basan
         DYFl7cu6W3jCtLCGQbQd0WqNiAk8UrAh+BLalxgTUj+Lq0i62jylCz4uUkD/DPK+Rs0m
         Od+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715672385; x=1716277185;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fesw46FZQhpdD0Hum6AHiEjagvfShSZGibZKbsl5F+w=;
        b=rDxSjrUOzdzKdIABtWXfUl40Hmb6TTQEiwwjgkm3THkhH2SK68B96qyptI831rmoi5
         nVsS3qHxv8GqZFjbCmO0vWxn4cnm1RAoaRnzuwI2ebzbH9VZrWBabBbpxuw1L7c4FsZN
         s2U32mCekXpbZ+c9JJfv6DetABBaDsuoEXjW5VjLalNm7u78G3fCQohB6No+XdH5sW83
         QKdSm62DxTOZvepw1iWxXelyXpiZFuC4q8wMJS51qre2RJfunpJ3ciweCJQhxlVkIZHg
         rC1jIu4rvApLOWCrupKlIPrOkomtECi1jb6NYQEAm40Hl1B2JbpIHzCYrpKO9H7/nE/b
         8cig==
X-Forwarded-Encrypted: i=1; AJvYcCWQtxRhof3ERfw5+CTx2hNRI5rWtolqpZDQUaoTzIPFpyIASifuSRtoe/d7kt382/aJn7XcQAN5JbQYvOc75eFjgJrAG/sUO9hh
X-Gm-Message-State: AOJu0Yx5E9zmsI+BOku8oUMJDcshkBOPs8q2sgEp7KbnE1kTn7aLsbWq
	p17O2yBLzE7UNhqJjRhyzaLX1doDkPpuFiQl6w67sLiVt1UE2XIICzq17KNqsg==
X-Google-Smtp-Source: AGHT+IFk54xjT9Zc4sowK6oPt/4PJk/GJXaYzAOXTacsXhp+JubATr03CVlRBs4xsou0q/WcQcEAFw==
X-Received: by 2002:a17:907:785a:b0:a59:a033:3e2 with SMTP id a640c23a62f3a-a5a2d676511mr1158264566b.74.1715672385102;
        Tue, 14 May 2024 00:39:45 -0700 (PDT)
Received: from thinkpad ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b177fcsm687002966b.202.2024.05.14.00.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 00:39:44 -0700 (PDT)
Date: Tue, 14 May 2024 09:39:43 +0200
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: devi priya <quic_devipriy@quicinc.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andersson@kernel.org, konrad.dybcio@linaro.org,
	mturquette@baylibre.com, sboyd@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH V5 4/6] arm64: dts: qcom: ipq9574: Add PCIe PHYs and
 controller nodes
Message-ID: <20240514073943.GB2463@thinkpad>
References: <20240512082858.1806694-1-quic_devipriy@quicinc.com>
 <20240512082858.1806694-5-quic_devipriy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240512082858.1806694-5-quic_devipriy@quicinc.com>

On Sun, May 12, 2024 at 01:58:56PM +0530, devi priya wrote:
> Add PCIe0, PCIe1, PCIe2, PCIe3 (and corresponding PHY) devices
> found on IPQ9574 platform. The PCIe0 & PCIe1 are 1-lane Gen3
> host whereas PCIe2 & PCIe3 are 2-lane Gen3 host.
> 
> Signed-off-by: devi priya <quic_devipriy@quicinc.com>
> ---
>  Changes in V5:
> 	- Dropped anoc and snoc lane clocks from Phy nodes and enabled them
> 	  via interconnect.
> 	- Dropped msi-parent as it is handled via msi IRQ
> 
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi | 365 +++++++++++++++++++++++++-
>  1 file changed, 361 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> index 5b3e69379b1f..da6418c9d52b 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi

[...]

> +		pcie1: pci@10000000 {

'pcie@' since this is a PCIe controller.

> +			compatible = "qcom,pcie-ipq9574";
> +			reg =  <0x10000000 0xf1d>,
> +			       <0x10000F20 0xa8>,

Please use lower case for hex everywhere.

> +			       <0x10001000 0x1000>,
> +			       <0x000F8000 0x4000>,
> +			       <0x10100000 0x1000>;
> +			reg-names = "dbi", "elbi", "atu", "parf", "config";
> +			device_type = "pci";
> +			linux,pci-domain = <2>;
> +			bus-range = <0x00 0xff>;
> +			num-lanes = <1>;
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +
> +			ranges = <0x01000000 0x0 0x00000000 0x10200000 0x0 0x100000>,  /* I/O */
> +				 <0x02000000 0x0 0x10300000 0x10300000 0x0 0x7d00000>; /* MEM */
> +
> +			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "msi";

Are you sure that this platform only has single MSI SPI IRQ?

> +			#interrupt-cells = <1>;
> +			interrupt-map-mask = <0 0 0 0x7>;
> +			interrupt-map = <0 0 0 1 &intc 0 0 35 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
> +					<0 0 0 2 &intc 0 0 49 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
> +					<0 0 0 3 &intc 0 0 84 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
> +					<0 0 0 4 &intc 0 0 85 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
> +
> +			/* clocks and clock-names are used to enable the clock in CBCR */

This comment is redundant.

> +			clocks = <&gcc GCC_PCIE1_AHB_CLK>,
> +				 <&gcc GCC_PCIE1_AUX_CLK>,
> +				 <&gcc GCC_PCIE1_AXI_M_CLK>,
> +				 <&gcc GCC_PCIE1_AXI_S_CLK>,
> +				 <&gcc GCC_PCIE1_AXI_S_BRIDGE_CLK>,
> +				 <&gcc GCC_PCIE1_RCHNG_CLK>;
> +			clock-names = "ahb",
> +				      "aux",
> +				      "axi_m",
> +				      "axi_s",
> +				      "axi_bridge",
> +				      "rchng";
> +
> +			resets = <&gcc GCC_PCIE1_PIPE_ARES>,
> +				 <&gcc GCC_PCIE1_CORE_STICKY_ARES>,
> +				 <&gcc GCC_PCIE1_AXI_S_STICKY_ARES>,
> +				 <&gcc GCC_PCIE1_AXI_S_ARES>,
> +				 <&gcc GCC_PCIE1_AXI_M_STICKY_ARES>,
> +				 <&gcc GCC_PCIE1_AXI_M_ARES>,
> +				 <&gcc GCC_PCIE1_AUX_ARES>,
> +				 <&gcc GCC_PCIE1_AHB_ARES>;
> +			reset-names = "pipe",
> +				      "sticky",
> +				      "axi_s_sticky",
> +				      "axi_s",
> +				      "axi_m_sticky",
> +				      "axi_m",
> +				      "aux",
> +				      "ahb";
> +
> +			phys = <&pcie1_phy>;
> +			phy-names = "pciephy";
> +			interconnects = <&gcc MASTER_ANOC_PCIE1 &gcc SLAVE_ANOC_PCIE1>,
> +					<&gcc MASTER_SNOC_PCIE1 &gcc SLAVE_SNOC_PCIE1>;

Is this really the interconnect paths between PCIe-DDR and PCIe-CPU? I doubt...

- Mani

-- 
மணிவண்ணன் சதாசிவம்

