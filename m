Return-Path: <linux-clk+bounces-22634-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D538EAD0A17
	for <lists+linux-clk@lfdr.de>; Sat,  7 Jun 2025 00:59:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F4351896A63
	for <lists+linux-clk@lfdr.de>; Fri,  6 Jun 2025 22:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B74F023C8D3;
	Fri,  6 Jun 2025 22:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="crxR5hkS"
X-Original-To: linux-clk@vger.kernel.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050921FC0EA
	for <linux-clk@vger.kernel.org>; Fri,  6 Jun 2025 22:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749250774; cv=none; b=WE0dnMtiET3uNTEpywitt2Dx0uNcfyFJawKlEW+IxXk2b88np8w64JePz8CFnZOvtno6lfzNbejvMCQ/5gcPLSuQ8y0dabYil7HW33Ep6JwcSoX15kxltX19SIw9L0uBBUE4ClK43Q+RzcNlo1zPAFxr9tPfDuM0qINiRBtvDi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749250774; c=relaxed/simple;
	bh=Cw+crYerPWYJW2N2ikNlghBYSqfPUoxfZKZ2b2TgZ9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cQ8UNHuYz0iH0ccLc1d6ZJorHoYM6mcdVMNkamlR4yqxbufUXqN7NgFBfWzxa4j3QhdArxQkscLZJdYg2GUNhdIUVVZTVrZKdEoyW2ZTZOwYt/3l6+7XTm1Fza1LUh93ftuPRR1zWqGz3hinFyA6hr6nSgPePPBFT2rx4NUG+CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=crxR5hkS; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <b355406d-c79f-4d81-bc36-a8889b54aa03@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749250768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9RomQS92hBA9eqkdzWe6rSqjDgfbgT2iRuNEC7vRw7I=;
	b=crxR5hkSHPAgjkpSnkO2hc8eEWkclBTknO2F7yBROybPqI5nKCjHgKwa0V02tyc5LGBXzL
	atH+6hcgCQr7eVoQgYmiOj60nzwcJVjzGOYkkdTdz0l3tJ3Nv1pJ+BkxoQQAAdDK2rriO0
	3s00piolPkq0+wq/zV8s6TI/FqnwTLM=
Date: Fri, 6 Jun 2025 15:59:19 -0700
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 11/23] dt-bindings: Add RPMI system MSI message proxy
 bindings
To: Anup Patel <apatel@ventanamicro.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Len Brown <lenb@kernel.org>,
 Sunil V L <sunilvl@ventanamicro.com>, Rahul Pathak
 <rpathak@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Samuel Holland <samuel.holland@sifive.com>, Anup Patel
 <anup@brainfault.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-12-apatel@ventanamicro.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250525084710.1665648-12-apatel@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 5/25/25 1:46 AM, Anup Patel wrote:
> Add device tree bindings for the RPMI system MSI service group
> based message proxy implemented by the SBI implementation (machine
> mode firmware or hypervisor).
>
> The RPMI system MSI service group is defined by the RISC-V
> platform management interface (RPMI) specification.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>   .../riscv,rpmi-mpxy-system-msi.yaml           | 67 +++++++++++++++++++
>   1 file changed, 67 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml
> new file mode 100644
> index 000000000000..26dd13731350
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V RPMI system MSI service group based message proxy
> +
> +maintainers:
> +  - Anup Patel <anup@brainfault.org>
> +
> +description: |
> +  The RISC-V Platform Management Interface (RPMI) [1] defines a
> +  messaging protocol which is modular and extensible. The supervisor
> +  software can send/receive RPMI messages via SBI MPXY extension [2]
> +  or some dedicated supervisor-mode RPMI transport.
> +
> +  The RPMI specification [1] defines system MSI service group which
> +  allow application processors to receive MSIs upon system events
> +  such as P2A doorbell, graceful shutdown/reboot request, CPU hotplug
> +  event, memory hotplug event, etc from the platform microcontroller.
> +  The SBI implementation machine mode firmware or hypervisor) can
nit:
The SBI implementation in machine mode
> +  implement an SBI MPXY channel to allow RPMI system MSI service
> +  group access to the supervisor software.
> +
> +  ===========================================
> +  References
> +  ===========================================
> +
> +  [1] RISC-V Platform Management Interface (RPMI)
> +      https://github.com/riscv-non-isa/riscv-rpmi/releases
> +
> +  [2] RISC-V Supervisor Binary Interface (SBI)
> +      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
> +
nit: Refer the latest frozen version of the spec ?
> +properties:
> +  compatible:
> +    description:
> +      Intended for use by the SBI implementation.
> +    const: riscv,rpmi-mpxy-system-msi
> +
> +  mboxes:
> +    maxItems: 1
> +    description:
> +      Mailbox channel of the underlying RPMI transport.
> +
> +  riscv,sbi-mpxy-channel-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The SBI MPXY channel id to be used for providing RPMI access to
> +      the supervisor software.
> +
> +required:
> +  - compatible
> +  - mboxes
> +  - riscv,sbi-mpxy-channel-id
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    interrupt-controller {
> +        compatible = "riscv,rpmi-mpxy-system-msi";
> +        mboxes = <&rpmi_shmem_mbox 0x2>;
> +        riscv,sbi-mpxy-channel-id = <0x2000>;
> +    };
> +...

Otherwise, lgtm.

Reviewed-by: Atish Patra <atishp@rivosinc.com>


