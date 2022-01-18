Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C403D492B02
	for <lists+linux-clk@lfdr.de>; Tue, 18 Jan 2022 17:19:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244129AbiARQTB (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 18 Jan 2022 11:19:01 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:37398
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243669AbiARQSc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Jan 2022 11:18:32 -0500
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C22323F203
        for <linux-clk@vger.kernel.org>; Tue, 18 Jan 2022 16:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642522710;
        bh=/saHFgfod+VllDCyIGCao3k0CHQX0T4IuTyB9aTiQuw=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=QbF0PpBFlWTBtU/NQd5O5Y7B06dyG/AChQoqvqn2HxWIfKC1aKaXKG0rjxMjKiB5h
         B+ZQ5fp8Gb3Q20FJjk2lRu01SyeHWbz3ASF+4sAaQjEf3W9yaQnQGez9Fo5+zaMHz+
         KvAYr7zF0uOw+AIWlM+EQDyTdqgu1s6HlKvh4FiPkVm/29xxutZSq5GPjNwJu9U/VM
         S2e6LOwBWWXeCQCjmUlUVZwKaEh6GTWvL7Tllp2+7OTRI7J6uMxUF1+CoXxrt0b7rc
         hxlavzjQHSoW6Vyi6raBK4+Wi0771fh3UPOkU39odaSKf7AqV0okNmpwAb4Gl8OFjN
         4YKj/i+oCltLQ==
Received: by mail-ed1-f72.google.com with SMTP id a8-20020a056402168800b004022fcdeb25so6748160edv.21
        for <linux-clk@vger.kernel.org>; Tue, 18 Jan 2022 08:18:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/saHFgfod+VllDCyIGCao3k0CHQX0T4IuTyB9aTiQuw=;
        b=EOMC3YAvYfbAmEgZT/YIr9cWKh1fEkJ2X2hrozA2aqsXZTMnKuKT++ibB9SmaclsZI
         z9hXCJH+3jssG1IKGXLfItz2JGxAhNWUUYPu0GTgumIFLYaQjlASGY5VgqMSE2nl2DnN
         isBcg5dMvrAbeVRXXG0gg4w6VijLcoq7nH1dqZIEomUL/CNS6td16nM6AOkj5CJ/nM+V
         9kOOMFSH40B+Yz4/QN0H6uhwcWUz11xDr96NILGECn8D7AZpAjnofWHjhPGtoDXQHZB0
         +HPKd/erfPOdZdi3L91P1+hBLblEAWMcIDqepNmCvyMNL1DJRXvHPGJnehm9bhM3I48m
         /RFA==
X-Gm-Message-State: AOAM532I3Ylzys+2KdClGfYREvC/yj0vxBwGMLlDnhL3p76dnEk/jsfV
        maQO6nOjRfhF7lPXn2YX4pAP6JI+Q+c+CWySlyxYcBalLoDdISyV8CJnh0D9Pnfde84sM0WA7mN
        a2NPzeLfWaFKe+WASG/HcLwvYHo8CbosVVRUB0g==
X-Received: by 2002:a17:907:9622:: with SMTP id gb34mr20839793ejc.355.1642522710371;
        Tue, 18 Jan 2022 08:18:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxfIifqQ4AVPmYgf7XBd2Pu5uw++MPB2xe5GXOSCfqiesyMFJpl04gNL7IFKznqIxQO1lmdgg==
X-Received: by 2002:a17:907:9622:: with SMTP id gb34mr20839776ejc.355.1642522710089;
        Tue, 18 Jan 2022 08:18:30 -0800 (PST)
Received: from [192.168.0.42] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id qa35sm5431720ejc.67.2022.01.18.08.18.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 08:18:29 -0800 (PST)
Message-ID: <a7677638-8108-0bd7-19ca-0cfff5fcf534@canonical.com>
Date:   Tue, 18 Jan 2022 17:18:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 02/16] dt-bindings: clock: Add bindings definitions for
 FSD CMU blocks
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net, arnd@arndb.de,
        linus.walleij@linaro.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, s.nawrocki@samsung.com,
        linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
        linux-fsd@tesla.com
References: <20220118144851.69537-1-alim.akhtar@samsung.com>
 <CGME20220118150018epcas5p32642af7af63869d08a861d00d97e3b68@epcas5p3.samsung.com>
 <20220118144851.69537-3-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220118144851.69537-3-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/01/2022 15:48, Alim Akhtar wrote:
> Clock controller driver of FSD platform is designed to have separate
> instances for each particular CMU. So clock IDs in this bindings header
> also start from 1 for each CMU block.
> 
> Cc: linux-fsd@tesla.com
> Reported-by: kernel test robot <lkp@intel.com>
> [robot: reported missing #endif]
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  include/dt-bindings/clock/fsd-clk.h | 149 ++++++++++++++++++++++++++++
>  1 file changed, 149 insertions(+)
>  create mode 100644 include/dt-bindings/clock/fsd-clk.h
> 
> diff --git a/include/dt-bindings/clock/fsd-clk.h b/include/dt-bindings/clock/fsd-clk.h
> new file mode 100644
> index 000000000000..8cf45d2430b0
> --- /dev/null
> +++ b/include/dt-bindings/clock/fsd-clk.h
> @@ -0,0 +1,149 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2017 - 2022: Samsung Electronics Co., Ltd.
> + *             https://www.samsung.com
> + * Copyright (c) 2017-2022 Tesla, Inc.
> + *             https://www.tesla.com
> + *
> + * The constants defined in this header are being used in dts
> + * and fsd platform driver.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_FSD_H
> +#define _DT_BINDINGS_CLOCK_FSD_H
> +
> +/* CMU */
> +#define DOUT_CMU_PLL_SHARED0_DIV4		1
> +#define DOUT_CMU_PERIC_SHARED1DIV36		2
> +#define DOUT_CMU_PERIC_SHARED0DIV3_TBUCLK	3
> +#define DOUT_CMU_PERIC_SHARED0DIV20		4
> +#define DOUT_CMU_PERIC_SHARED1DIV4_DMACLK	5
> +#define DOUT_CMU_PLL_SHARED0_DIV6		6
> +#define DOUT_CMU_FSYS0_SHARED1DIV4		7
> +#define DOUT_CMU_FSYS0_SHARED0DIV4		8
> +#define DOUT_CMU_FSYS1_SHARED0DIV8		9
> +#define DOUT_CMU_FSYS1_SHARED0DIV4		10
> +#define CMU_CPUCL_SWITCH_GATE			11
> +#define DOUT_CMU_IMEM_TCUCLK			12
> +#define DOUT_CMU_IMEM_ACLK			13
> +#define DOUT_CMU_IMEM_DMACLK			14
> +#define GAT_CMU_FSYS0_SHARED0DIV4		15
> +#define CMU_NR_CLK				16
> +
> +/* PERIC */
> +#define PERIC_SCLK_UART0			1
> +#define PERIC_PCLK_UART0			2
> +#define PERIC_SCLK_UART1			3
> +#define PERIC_PCLK_UART1			4
> +#define PERIC_DMA0_IPCLKPORT_ACLK		5
> +#define PERIC_DMA1_IPCLKPORT_ACLK		6
> +#define PERIC_PWM0_IPCLKPORT_I_PCLK_S0		7
> +#define PERIC_PWM1_IPCLKPORT_I_PCLK_S0		8
> +#define PERIC_PCLK_SPI0                         9
> +#define PERIC_SCLK_SPI0                         10
> +#define PERIC_PCLK_SPI1                         11
> +#define PERIC_SCLK_SPI1                         12
> +#define PERIC_PCLK_SPI2                         13
> +#define PERIC_SCLK_SPI2                         14
> +#define PERIC_PCLK_TDM0                         15
> +#define PERIC_PCLK_HSI2C0			16
> +#define PERIC_PCLK_HSI2C1			17
> +#define PERIC_PCLK_HSI2C2			18
> +#define PERIC_PCLK_HSI2C3			19
> +#define PERIC_PCLK_HSI2C4			20
> +#define PERIC_PCLK_HSI2C5			21
> +#define PERIC_PCLK_HSI2C6			22
> +#define PERIC_PCLK_HSI2C7			23
> +#define PERIC_MCAN0_IPCLKPORT_CCLK		24
> +#define PERIC_MCAN0_IPCLKPORT_PCLK		25
> +#define PERIC_MCAN1_IPCLKPORT_CCLK		26
> +#define PERIC_MCAN1_IPCLKPORT_PCLK		27
> +#define PERIC_MCAN2_IPCLKPORT_CCLK		28
> +#define PERIC_MCAN2_IPCLKPORT_PCLK		29
> +#define PERIC_MCAN3_IPCLKPORT_CCLK		30
> +#define PERIC_MCAN3_IPCLKPORT_PCLK		31
> +#define PERIC_PCLK_ADCIF			32
> +#define PERIC_EQOS_TOP_IPCLKPORT_CLK_PTP_REF_I  33
> +#define PERIC_EQOS_TOP_IPCLKPORT_ACLK_I		34
> +#define PERIC_EQOS_TOP_IPCLKPORT_HCLK_I		35
> +#define PERIC_EQOS_TOP_IPCLKPORT_RGMII_CLK_I	36
> +#define PERIC_EQOS_TOP_IPCLKPORT_CLK_RX_I	37
> +#define PERIC_BUS_D_PERIC_IPCLKPORT_EQOSCLK	38
> +#define PERIC_BUS_P_PERIC_IPCLKPORT_EQOSCLK	39
> +#define PERIC_HCLK_TDM0				40
> +#define PERIC_PCLK_TDM1				41
> +#define PERIC_HCLK_TDM1				42
> +#define PERIC_EQOS_PHYRXCLK_MUX			43
> +#define PERIC_EQOS_PHYRXCLK			44
> +#define PERIC_DOUT_RGMII_CLK			45
> +#define PERIC_NR_CLK				46
> +
> +/* FSYS0 */
> +#define UFS0_MPHY_REFCLK_IXTAL24		1
> +#define UFS0_MPHY_REFCLK_IXTAL26		2
> +#define UFS1_MPHY_REFCLK_IXTAL24		3
> +#define UFS1_MPHY_REFCLK_IXTAL26		4
> +#define UFS0_TOP0_HCLK_BUS			5
> +#define UFS0_TOP0_ACLK				6
> +#define UFS0_TOP0_CLK_UNIPRO			7
> +#define UFS0_TOP0_FMP_CLK			8
> +#define UFS1_TOP1_HCLK_BUS			9
> +#define UFS1_TOP1_ACLK				10
> +#define UFS1_TOP1_CLK_UNIPRO			11
> +#define UFS1_TOP1_FMP_CLK			12
> +#define PCIE_SUBCTRL_INST0_DBI_ACLK_SOC		13
> +#define PCIE_SUBCTRL_INST0_AUX_CLK_SOC		14
> +#define PCIE_SUBCTRL_INST0_MSTR_ACLK_SOC	15
> +#define PCIE_SUBCTRL_INST0_SLV_ACLK_SOC		16
> +#define FSYS0_EQOS_TOP0_IPCLKPORT_CLK_PTP_REF_I 17
> +#define FSYS0_EQOS_TOP0_IPCLKPORT_ACLK_I	18
> +#define FSYS0_EQOS_TOP0_IPCLKPORT_HCLK_I	19
> +#define FSYS0_EQOS_TOP0_IPCLKPORT_RGMII_CLK_I	20
> +#define FSYS0_EQOS_TOP0_IPCLKPORT_CLK_RX_I	21
> +#define FSYS0_DOUT_FSYS0_PERIBUS_GRP		22
> +#define FSYS0_NR_CLK				23
> +
> +/* FSYS1 */
> +#define PCIE_LINK0_IPCLKPORT_DBI_ACLK		1
> +#define PCIE_LINK0_IPCLKPORT_AUX_ACLK		2
> +#define PCIE_LINK0_IPCLKPORT_MSTR_ACLK		3
> +#define PCIE_LINK0_IPCLKPORT_SLV_ACLK		4
> +#define PCIE_LINK1_IPCLKPORT_DBI_ACLK		5
> +#define PCIE_LINK1_IPCLKPORT_AUX_ACLK		6
> +#define PCIE_LINK1_IPCLKPORT_MSTR_ACLK		7
> +#define PCIE_LINK1_IPCLKPORT_SLV_ACLK		8
> +#define FSYS1_NR_CLK				9
> +
> +/* IMEM */
> +#define IMEM_DMA0_IPCLKPORT_ACLK		1
> +#define IMEM_DMA1_IPCLKPORT_ACLK		2
> +#define IMEM_WDT0_IPCLKPORT_PCLK		3
> +#define IMEM_WDT1_IPCLKPORT_PCLK		4
> +#define IMEM_WDT2_IPCLKPORT_PCLK		5
> +#define IMEM_MCT_PCLK				6
> +#define IMEM_TMU_CPU0_IPCLKPORT_I_CLK_TS	7
> +#define IMEM_TMU_CPU2_IPCLKPORT_I_CLK_TS	8
> +#define IMEM_TMU_TOP_IPCLKPORT_I_CLK_TS		9
> +#define IMEM_TMU_GPU_IPCLKPORT_I_CLK_TS		10
> +#define IMEM_TMU_GT_IPCLKPORT_I_CLK_TS		11
> +#define IMEM_NR_CLK				12
> +
> +/* MFC */
> +#define MFC_MFC_IPCLKPORT_ACLK			1
> +#define MFC_NR_CLK				2
> +
> +/* CAM_CSI */
> +#define CAM_CSI0_0_IPCLKPORT_I_ACLK		1
> +#define CAM_CSI0_1_IPCLKPORT_I_ACLK		2
> +#define CAM_CSI0_2_IPCLKPORT_I_ACLK		3
> +#define CAM_CSI0_3_IPCLKPORT_I_ACLK		4
> +#define CAM_CSI1_0_IPCLKPORT_I_ACLK		5
> +#define CAM_CSI1_1_IPCLKPORT_I_ACLK		6
> +#define CAM_CSI1_2_IPCLKPORT_I_ACLK		7
> +#define CAM_CSI1_3_IPCLKPORT_I_ACLK		8
> +#define CAM_CSI2_0_IPCLKPORT_I_ACLK		9
> +#define CAM_CSI2_1_IPCLKPORT_I_ACLK		10
> +#define CAM_CSI2_2_IPCLKPORT_I_ACLK		11
> +#define CAM_CSI2_3_IPCLKPORT_I_ACLK		12
> +#define CAM_CSI_NR_CLK				13

One empty line would be nice here.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

> +#endif /*_DT_BINDINGS_CLOCK_FSD_H */
> 


Best regards,
Krzysztof
