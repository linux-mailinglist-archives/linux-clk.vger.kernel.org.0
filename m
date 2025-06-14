Return-Path: <linux-clk+bounces-23025-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C33AD987D
	for <lists+linux-clk@lfdr.de>; Sat, 14 Jun 2025 01:09:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 371187AB088
	for <lists+linux-clk@lfdr.de>; Fri, 13 Jun 2025 23:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D5428DB64;
	Fri, 13 Jun 2025 23:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aQ1pcHAc"
X-Original-To: linux-clk@vger.kernel.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8994D28ECE5
	for <linux-clk@vger.kernel.org>; Fri, 13 Jun 2025 23:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749856147; cv=none; b=ul5HORJOIQ4CsQQ59C7HlQQoiFzT5JLvHRHr2y/Q7w23b4NRJIh664VHjWqTQIOqGs1NTnprRa3msWLHfFEIOYtc9bhRzcTm9Vc61heAo+FCJmN8fRe8XpT4tTld0t3L8WfvtBMZ2T6YhZmSRwJN9iXwB+0A9aWtK40et/O1KrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749856147; c=relaxed/simple;
	bh=r27H9F1hEUtupyvfgSfrvSGbuCAXF2LgasX0jrzicYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rQ0f/67TuMJf3RQygIf7BLW0krRA/nmPSr848J2VKj4YXZhhvttLVsNKAUd+RXe9BneZCGMHV6zBrrIkOsDGSYtutiAQIXf/gecT0xgHdu200oUO2Wna7rPH8qjEdimNuFJ1VKgRWTRuG1tqhXjmcQe9YrdYK/elzTDSx+ZMyYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aQ1pcHAc; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <d81310a9-13e8-47b4-8ad7-0f831b5aa9e8@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749856132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hJbziJaWkSfc7eJvEsy2hlaI0p2HI21DTada3PKoxUM=;
	b=aQ1pcHAcIgb+M7oyofZrcUYV81nmfElqYYBX1DAhtW9V54Yr88+Yhs7YcUiry1UklyWuqQ
	+taC5FOziFa5Nx4TfwAw/I3w2tfc4PTs/ZSHAv1Z99DqUH/W1Pr+uCbTjuMl9okwVnfz8V
	AP9OFxZRVrSK850RcsZtk0peexbIXTE=
Date: Fri, 13 Jun 2025 16:08:32 -0700
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 15/23] ACPI: scan: Update honor list for RPMI System
 MSI
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
References: <20250611062238.636753-1-apatel@ventanamicro.com>
 <20250611062238.636753-16-apatel@ventanamicro.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250611062238.636753-16-apatel@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 6/10/25 11:22 PM, Anup Patel wrote:
> From: Sunil V L <sunilvl@ventanamicro.com>
>
> The RPMI System MSI interrupt controller (just like PLIC and APLIC)
> needs to probed prior to devices like GED which use interrupts provided
> by it. Also, it has dependency on the SBI MPXY mailbox device.
>
> Add HIDs of RPMI System MSI and SBI MPXY mailbox devices to the honor
> list so that those dependencies are handled.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>   drivers/acpi/scan.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index fb1fe9f3b1a3..54181b03b345 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -858,6 +858,8 @@ static const char * const acpi_honor_dep_ids[] = {
>   	"INTC10CF", /* IVSC (MTL) driver must be loaded to allow i2c access to camera sensors */
>   	"RSCV0001", /* RISC-V PLIC */
>   	"RSCV0002", /* RISC-V APLIC */
> +	"RSCV0005", /* RISC-V SBI MPXY MBOX */
> +	"RSCV0006", /* RISC-V RPMI SYSMSI */
>   	"PNP0C0F",  /* PCI Link Device */
>   	NULL
>   };
Reviewed-by: Atish Patra <atishp@rivosinc.com>

