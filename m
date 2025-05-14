Return-Path: <linux-clk+bounces-21867-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C08CAB6A5B
	for <lists+linux-clk@lfdr.de>; Wed, 14 May 2025 13:43:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CC224C1A62
	for <lists+linux-clk@lfdr.de>; Wed, 14 May 2025 11:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD932777F7;
	Wed, 14 May 2025 11:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="LyE2LB9E"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4080276049
	for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 11:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747222876; cv=none; b=iirC9OMW8VyHG7j2OIBF7m+RkquQ4oKrJoimQaHdbvpu4YBt9RPs2GhSyICmqe59RJxZwRzoa2pymAaI1AowznQLseVKdv5BH2MURFaPRjK6WPtWc/0kiSmD8C/xs7l3alYmtlmSOkvyRRrAsz8pGpP/nW9PdBVjoDjG/zJFMwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747222876; c=relaxed/simple;
	bh=7JkTC5mLx9u4BimVTeAQi6DGPhg7Opww3j1Bu0kfoWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HOYZVWOt3LNy4KRWJ5WM57U0mqVBDYk4H61MR1CGmZWDKEtNCAoC0INt7fd3JlSn9I9q7016I0Scb+KOeLBp1UMTFVSU2GYHByV/IYxuDgBwyCW+/CUOB3Z8xv+sYrMV7UkGBcH0HOdVvjeyeWpqMIO8vJGyE4WaXKnBnnnjjeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=LyE2LB9E; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a0bdcd7357so4762968f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 04:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747222872; x=1747827672; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1iaWgi2+6QGoD6Bh6MAYJTWH0TqBtpBBy9hMdUN0b9I=;
        b=LyE2LB9EWey131iU5nV94RgjWBZKnmJV0FNFC6RW8e0LVClQ6L0sU2qFOPQXrHwxGU
         e6VZuimb85awUW8bsm7nzIdRoQ4dATJstSAZneMU21yY1ZoiJSdELXuqy+y8Cw7vH8R+
         /eyxR9ngJJfI6STayDqFHoZWVaQdgIBCx16lLhdDvjp+UNH3yyP2qyoIdIboPgNnCgvU
         buBqynTieGow6Kkv+WMT3JcY9kpQIorkDebV3WNxgDttmGqs91g5KWYF+0eQrPQr5ayz
         GqYymkFhYXI1QXuCxDnytLqoDK/9cduJV/v3ezPqjpjOKkb183CevRY0biPgnmr7lAKX
         9hNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747222872; x=1747827672;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1iaWgi2+6QGoD6Bh6MAYJTWH0TqBtpBBy9hMdUN0b9I=;
        b=PhircqwKbEftR6TCK6RvEiEgcX93V2zrPRaCu4pBe9LeI0xU3sR/bUeJg1lJogMN9E
         LoowMhb5ZPa63AHZTq1He7Tevwf/jvOUYs4z5wfb1xE1Fy5w7bf18HOyIU0CNaULoReB
         P6hNyrlniHNb6u9Uz3XyK48ZwegxZDmr5A9FGjI4fmVolDQelc4BoX+gzD50BiBoHmni
         vrm6xRB5vnwPb1ewfxINb/u3bpsRgjrLjYgsd8bIeO+iBSfcIpIVhCWi0ZUDax/9cbvH
         aSwo0pkhrck8v9ohaNqdarVLwXbtxBdQzbVBJ+oHQtZPSoPJynx7+XRXeP6ikL/pTfEt
         0emg==
X-Forwarded-Encrypted: i=1; AJvYcCWH3U9GXFldm+yKl/NPIpLy+/40UQbpwyxN8OGMNRVqcKq+E7QToZUUAadQAdQBC0Bmkjwh+nYLADE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHbx7zlH0Rj1YC8dvoUVnOhpoRti5+cx1pTkAb0BW4y2LzsgXx
	3jm2puq+oPxTaktSldMCIR849wFlJmoowRcWaJYOx06LzB/7j1A6DQQH3YU32Yc=
X-Gm-Gg: ASbGnct5vy/GEMNCQFsoNvEwEaF3HLjWNXixApGJ4X87IVmhBd4Gyh/nVGhbFJVvyiS
	RQIAxg6uBAUC85riX4H/5AmfbszQDNR7yHAt0VneyvDYHnJc6xkekZSz35hnTPASuAAvkIb/GDv
	fh1c2ZzeUWNbp2/EsWJ8Suctm/XeI/4cXtNfKACCe2+N/y0LiC32M6/9yYt4QFPea5xe2IRJSfv
	0Jl60KUm8/vXrbZTIqn6zgkGIy6oDz2Vnn1XDiJK4Qc7VsTQq/gZO1Kwfo08gFXSSYI+an93XsS
	w6Tmr4f+Uwut4AIU4/QlMS31M1P13rAct2vAEPuPg32iBbY/Rk2pjaxzvYo=
X-Google-Smtp-Source: AGHT+IH2CN5E5d5IiEul9fORo75uv9zJHPufVjipSowLqASUDKgEkIqOTizOIqaf2tZjC9ZhGWR8Tg==
X-Received: by 2002:a05:6000:1868:b0:3a0:7aa3:cc74 with SMTP id ffacd0b85a97d-3a34969a54dmr2881005f8f.6.1747222872006;
        Wed, 14 May 2025 04:41:12 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2d2f4sm19387956f8f.78.2025.05.14.04.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 04:41:11 -0700 (PDT)
Message-ID: <2b2efbf8-a5df-4f2b-8660-67fc13168f58@tuxon.dev>
Date: Wed, 14 May 2025 14:41:08 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Add
 documentation for the PCIe IP on Renesas RZ/G3S
To: Rob Herring <robh@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
 manivannan.sadhasivam@linaro.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org, saravanak@google.com, p.zabel@pengutronix.de,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
 <20250430103236.3511989-5-claudiu.beznea.uj@bp.renesas.com>
 <20250509210800.GB4080349-robh@kernel.org>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250509210800.GB4080349-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Rob,

On 10.05.2025 00:08, Rob Herring wrote:
> On Wed, Apr 30, 2025 at 01:32:32PM +0300, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The PCIe IP available on the Renesas RZ/G3S complies with the PCI Express
>> Base Specification 4.0. It is designed for root complex applications and
>> features a single-lane (x1) implementation. Add documentation for it.
>> The interrupts, interrupt-names, resets, reset-names, clocks, clock-names
>> description were obtained from the hardware manual.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>  .../pci/renesas,r9a08g045s33-pcie.yaml        | 242 ++++++++++++++++++
>>  1 file changed, 242 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml b/Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml
>> new file mode 100644
>> index 000000000000..354f9c3be139
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045s33-pcie.yaml
>> @@ -0,0 +1,242 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pci/renesas,r9a08g045s33-pcie.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Renesas RZ/G3S PCIe host controller
>> +
>> +maintainers:
>> +  - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> +
>> +description:
>> +  Renesas RZ/G3S PCIe host controller complies with PCIe Base Specification
>> +  4.0 and supports up to 5 GT/s (Gen2).
>> +
>> +properties:
>> +  compatible:
>> +    const: renesas,r9a08g045s33-pcie # RZ/G3S
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    items:
>> +      - description: System error interrupt
>> +      - description: System error on correctable error interrupt
>> +      - description: System error on non-fatal error interrupt
>> +      - description: System error on fatal error interrupt
>> +      - description: AXI error interrupt
>> +      - description: INTA interrupt
>> +      - description: INTB interrupt
>> +      - description: INTC interrupt
>> +      - description: INTD interrupt
>> +      - description: MSI interrupt
>> +      - description: Link bandwidth interrupt
>> +      - description: PME interrupt
>> +      - description: DMA interrupt
>> +      - description: PCIe event interrupt
>> +      - description: Message interrupt
>> +      - description: All interrupts
>> +
>> +  interrupt-names:
>> +    items:
>> +      - description: int_serr
>> +      - description: int_ser_cor
>> +      - description: int_serr_nonfatal
>> +      - description: int_serr_fatal
>> +      - description: axi_err_int
>> +      - description: inta_rc
>> +      - description: intb_rc
>> +      - description: intc_rc
>> +      - description: intd_rc
>> +      - description: intmsi_rc
> 
> Isn't every interrupt for the root complex?

It is! I just used the names that were available in the hardware manual.
I'll drop the "_rc" it in the next version.

> 
>> +      - description: int_link_bandwidth
>> +      - description: int_pm_pme
>> +      - description: dma_int
>> +      - description: pcie_evt_int
>> +      - description: msg_int
>> +      - description: int_all
> 
> 'int_' or '_int' is redundant (and inconsistent). Drop.

OK

> 
>> +
>> +  clocks:
>> +    items:
>> +      - description: System clock
>> +      - description: PM control clock
>> +
>> +  clock-names:
>> +    items:
>> +      - description: aclk
>> +      - description: clkl1pm
> 
> 'l1pm' or 'pm'

OK

> 
>> +
>> +  resets:
>> +    items:
>> +      - description: AXI2PCIe Bridge reset
>> +      - description: Data link layer/transaction layer reset
>> +      - description: Transaction layer (ACLK domain) reset
>> +      - description: Transaction layer (PCLK domain) reset
>> +      - description: Physical layer reset
>> +      - description: Configuration register reset
>> +      - description: Configuration register reset
>> +
>> +  reset-names:
>> +    items:
>> +      - description: aresetn
>> +      - description: rst_b
>> +      - description: rst_gp_b
>> +      - description: rst_ps_b
>> +      - description: rst_rsm_b
>> +      - description: rst_cfg_b
>> +      - description: rst_load_b
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  dma-ranges:
>> +    description:
>> +      A single range for the inbound memory region.
>> +    maxItems: 1
>> +
>> +  renesas,sysc:
>> +    description: System controller phandle
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +
>> +  vendor-id:
>> +    const: 0x1912
>> +
>> +  device-id:
>> +    const: 0x0033
>> +
>> +  legacy-interrupt-controller:
>> +    description: Interrupt controller node for handling legacy PCI interrupts
>> +    type: object
>> +
>> +    properties:
>> +      "#address-cells":
>> +        const: 0
>> +
>> +      "#interrupt-cells":
>> +        const: 1
>> +
>> +      interrupt-controller: true
>> +
>> +      interrupts:
>> +        items:
>> +          - description: INTA interrupt
>> +          - description: INTB interrupt
>> +          - description: INTC interrupt
>> +          - description: INTD interrupt
>> +
>> +    required:
>> +      - "#address-cells"
>> +      - "#interrupt-cells"
>> +      - interrupt-controller
>> +      - interrupts
>> +
>> +    additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - resets
>> +  - reset-names
>> +  - interrupts
>> +  - interrupt-names
>> +  - interrupt-map
>> +  - interrupt-map-mask
>> +  - power-domains
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +  - "#interrupt-cells"
>> +  - renesas,sysc
>> +  - vendor-id
>> +  - device-id
>> +
>> +allOf:
>> +  - $ref: /schemas/pci/pci-host-bridge.yaml#
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/r9a08g045-cpg.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    bus {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        gic: interrupt-controller {
>> +            interrupt-controller;
>> +            #interrupt-cells = <3>;
>> +        };
> 
> Drop. Don't need to show provider nodes for the example.

This was needed for the schema to compile with the intx node.

> 
>> +
>> +        pcie@11e40000 {
>> +            compatible = "renesas,r9a08g045s33-pcie";
>> +            reg = <0 0x11e40000 0 0x10000>;
>> +            ranges = <0x03000000 0 0x30000000 0 0x30000000 0 0x8000000>;
>> +            dma-ranges = <0x42000000 0 0x48000000 0 0x48000000 0 0x8000000>;
>> +            bus-range = <0x0 0xff>;
>> +            clocks = <&cpg CPG_MOD R9A08G045_PCI_ACLK>,
>> +                     <&cpg CPG_MOD R9A08G045_PCI_CLKL1PM>;
>> +            clock-names = "aclk", "clkl1pm";
>> +            resets = <&cpg R9A08G045_PCI_ARESETN>,
>> +                     <&cpg R9A08G045_PCI_RST_B>,
>> +                     <&cpg R9A08G045_PCI_RST_GP_B>,
>> +                     <&cpg R9A08G045_PCI_RST_PS_B>,
>> +                     <&cpg R9A08G045_PCI_RST_RSM_B>,
>> +                     <&cpg R9A08G045_PCI_RST_CFG_B>,
>> +                     <&cpg R9A08G045_PCI_RST_LOAD_B>;
>> +            reset-names = "aresetn", "rst_b", "rst_gp_b", "rst_ps_b",
>> +                          "rst_rsm_b", "rst_cfg_b", "rst_load_b";
>> +            interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
> 
> It is very odd that you have the INTx interrupts here and below.
> 
> As I mentioned in the driver, you don't need the legacy node any more. 
> Just add 'interrupt-controller' to this node and point interrupt-map to 
> this node.
Will try it like this.

Thank you for your review,
Claudiu

> 
>> +                         <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>;
>> +            interrupt-names = "int_serr", "int_serr_cor", "int_serr_nonfatal",
>> +                              "int_serr_fatal", "axi_err_int", "inta_rc",
>> +                              "intb_rc", "intc_rc", "intd_rc",
>> +                              "intmsi_rc", "int_link_bandwidth", "int_pm_pme",
>> +                              "dma_int", "pcie_evt_int", "msg_int",
>> +                              "int_all";
>> +            #interrupt-cells = <1>;
>> +            interrupt-map-mask = <0 0 0 7>;
>> +            interrupt-map = <0 0 0 1 &pcie_intx 0>, /* INT A */
>> +                            <0 0 0 2 &pcie_intx 1>, /* INT B */
>> +                            <0 0 0 3 &pcie_intx 2>, /* INT C */
>> +                            <0 0 0 4 &pcie_intx 3>; /* INT D */
>> +            device_type = "pci";
>> +            num-lanes = <1>;
>> +            #address-cells = <3>;
>> +            #size-cells = <2>;
>> +            power-domains = <&cpg>;
>> +            renesas,sysc = <&sysc>;
>> +            vendor-id = <0x1912>;
>> +            device-id = <0x0033>;
>> +
>> +            pcie_intx: legacy-interrupt-controller {
>> +                interrupt-controller;
>> +                #interrupt-cells = <1>;
>> +                #address-cells = <0>;
>> +                interrupt-parent = <&gic>;
>> +                interrupts = <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
>> +                             <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
>> +                             <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
>> +                             <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>;
>> +            };
>> +        };
>> +    };
>> +
>> +...
>> -- 
>> 2.43.0
>>


