Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D84344968B3
	for <lists+linux-clk@lfdr.de>; Sat, 22 Jan 2022 01:27:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbiAVA12 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 21 Jan 2022 19:27:28 -0500
Received: from mail-oi1-f171.google.com ([209.85.167.171]:34481 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230268AbiAVA12 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Jan 2022 19:27:28 -0500
Received: by mail-oi1-f171.google.com with SMTP id bb37so15951795oib.1;
        Fri, 21 Jan 2022 16:27:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NOFl+T1/9xvjyCr9xnWl31qQWlYfZRvQb/QJB9Kt3bY=;
        b=PZ691DRFfZtoSMHcbnqmD+GKw9nWlrSKPqUDwXiiWZ/oAETRgAuYhnYr9012tCPojt
         4IAZUunLU+iazDzIxY+pIq737Arw2p+xZoWD7e9whyUrjuQ9dtlCa6PNcjMgwWQJm9/m
         z8ciibFcx4wBwn0Jyaps1+YjGPmbVGVmUOHGu1PXkfFcHlz/6eRWOfQEAcSU051Z6nTO
         sVBDGKDIH4Od26MLVbRMvWheRImByjscdOSszyk3sSrpkqXTYIj0zi88KYXQdpk0z1Er
         dJa2M5F3vbmessDpiCnCcelY2C27dhru5RGtjEJmAvMtse40CNRO9P/jTFQ6pcceKGgM
         sOMQ==
X-Gm-Message-State: AOAM533v2e31pgPXLtd5qBiVSJqySCRgH3eQTNLgsP8l3+MeLhlR5D1G
        /IiAjMWhHxwoAWYr5QZ4fQ==
X-Google-Smtp-Source: ABdhPJyxkUS5ZMZVz3OvJpEVTlgA/m3JCKNg0+OpuNboaQzEMgKiemNF7cXsrRqHpwVPyPa6oFYvlQ==
X-Received: by 2002:a05:6808:290:: with SMTP id z16mr2658904oic.128.1642811247425;
        Fri, 21 Jan 2022 16:27:27 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id bo13sm1679577oib.43.2022.01.21.16.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 16:27:26 -0800 (PST)
Received: (nullmailer pid 1907151 invoked by uid 1000);
        Sat, 22 Jan 2022 00:27:25 -0000
Date:   Fri, 21 Jan 2022 18:27:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [v1 02/16] clk: mediatek: Add dt-bindings of MT8186 clocks
Message-ID: <YetPbU52JT6A8CKW@robh.at.kernel.org>
References: <20220110134416.5191-1-chun-jie.chen@mediatek.com>
 <20220110134416.5191-3-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220110134416.5191-3-chun-jie.chen@mediatek.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Jan 10, 2022 at 09:44:02PM +0800, Chun-Jie Chen wrote:
> Add MT8186 clock dt-bindings, includes topckgen, apmixedsys,
> infracfg_ao, mcusys and subsystem clocks.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  include/dt-bindings/clock/mt8186-clk.h | 445 +++++++++++++++++++++++++
>  1 file changed, 445 insertions(+)
>  create mode 100644 include/dt-bindings/clock/mt8186-clk.h

As mentioned, squash with patch 1.

> 
> diff --git a/include/dt-bindings/clock/mt8186-clk.h b/include/dt-bindings/clock/mt8186-clk.h
> new file mode 100644
> index 000000000000..6a291750cea4
> --- /dev/null
> +++ b/include/dt-bindings/clock/mt8186-clk.h
> @@ -0,0 +1,445 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */

Dual license please.

> +/*
> + * Copyright (c) 2022 MediaTek Inc.
> + * Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_MT8186_H
> +#define _DT_BINDINGS_CLK_MT8186_H
> +
> +/* MCUSYS */
> +
> +#define CLK_MCU_ARMPLL_LL_SEL		0
> +#define CLK_MCU_ARMPLL_BL_SEL		1
> +#define CLK_MCU_ARMPLL_BUS_SEL		2
> +#define CLK_MCU_NR_CLK			3
> +
> +/* TOPCKGEN */
> +
> +#define CLK_TOP_AXI			0
> +#define CLK_TOP_SCP			1
> +#define CLK_TOP_MFG			2
> +#define CLK_TOP_CAMTG			3
> +#define CLK_TOP_CAMTG1			4
> +#define CLK_TOP_CAMTG2			5
> +#define CLK_TOP_CAMTG3			6
> +#define CLK_TOP_CAMTG4			7
> +#define CLK_TOP_CAMTG5			8
> +#define CLK_TOP_CAMTG6			9
> +#define CLK_TOP_UART			10
> +#define CLK_TOP_SPI			11
> +#define CLK_TOP_MSDC50_0_HCLK		12
> +#define CLK_TOP_MSDC50_0		13
> +#define CLK_TOP_MSDC30_1		14
> +#define CLK_TOP_AUDIO			15
> +#define CLK_TOP_AUD_INTBUS		16
> +#define CLK_TOP_AUD_1			17
> +#define CLK_TOP_AUD_2			18
> +#define CLK_TOP_AUD_ENGEN1		19
> +#define CLK_TOP_AUD_ENGEN2		20
> +#define CLK_TOP_DISP_PWM		21
> +#define CLK_TOP_SSPM			22
> +#define CLK_TOP_DXCC			23
> +#define CLK_TOP_USB_TOP			24
> +#define CLK_TOP_SRCK			25
> +#define CLK_TOP_SPM			26
> +#define CLK_TOP_I2C			27
> +#define CLK_TOP_PWM			28
> +#define CLK_TOP_SENINF			29
> +#define CLK_TOP_SENINF1			30
> +#define CLK_TOP_SENINF2			31
> +#define CLK_TOP_SENINF3			32
> +#define CLK_TOP_AES_MSDCFDE		33
> +#define CLK_TOP_PWRAP_ULPOSC		34
> +#define CLK_TOP_CAMTM			35
> +#define CLK_TOP_VENC			36
> +#define CLK_TOP_CAM			37
> +#define CLK_TOP_IMG1			38
> +#define CLK_TOP_IPE			39
> +#define CLK_TOP_DPMAIF			40
> +#define CLK_TOP_VDEC			41
> +#define CLK_TOP_DISP			42
> +#define CLK_TOP_MDP			43
> +#define CLK_TOP_AUDIO_H			44
> +#define CLK_TOP_UFS			45
> +#define CLK_TOP_AES_FDE			46
> +#define CLK_TOP_AUDIODSP		47
> +#define CLK_TOP_DVFSRC			48
> +#define CLK_TOP_DSI_OCC			49
> +#define CLK_TOP_SPMI_MST		50
> +#define CLK_TOP_SPINOR			51
> +#define CLK_TOP_NNA			52
> +#define CLK_TOP_NNA1			53
> +#define CLK_TOP_NNA2			54
> +#define CLK_TOP_SSUSB_XHCI		55
> +#define CLK_TOP_SSUSB_TOP_1P		56
> +#define CLK_TOP_SSUSB_XHCI_1P		57
> +#define CLK_TOP_WPE			58
> +#define CLK_TOP_DPI			59
> +#define CLK_TOP_U3_OCC_250M		60
> +#define CLK_TOP_U3_OCC_500M		61
> +#define CLK_TOP_ADSP_BUS		62
> +#define CLK_TOP_APLL_I2S0_MCK_SEL	63
> +#define CLK_TOP_APLL_I2S1_MCK_SEL	64
> +#define CLK_TOP_APLL_I2S2_MCK_SEL	65
> +#define CLK_TOP_APLL_I2S4_MCK_SEL	66
> +#define CLK_TOP_APLL_TDMOUT_MCK_SEL	67
> +#define CLK_TOP_MAINPLL_D2		68
> +#define CLK_TOP_MAINPLL_D2_D2		69
> +#define CLK_TOP_MAINPLL_D2_D4		70
> +#define CLK_TOP_MAINPLL_D2_D16		71
> +#define CLK_TOP_MAINPLL_D3		72
> +#define CLK_TOP_MAINPLL_D3_D2		73
> +#define CLK_TOP_MAINPLL_D3_D4		74
> +#define CLK_TOP_MAINPLL_D5		75
> +#define CLK_TOP_MAINPLL_D5_D2		76
> +#define CLK_TOP_MAINPLL_D5_D4		77
> +#define CLK_TOP_MAINPLL_D7		78
> +#define CLK_TOP_MAINPLL_D7_D2		79
> +#define CLK_TOP_MAINPLL_D7_D4		80
> +#define CLK_TOP_UNIVPLL			81
> +#define CLK_TOP_UNIVPLL_D2		82
> +#define CLK_TOP_UNIVPLL_D2_D2		83
> +#define CLK_TOP_UNIVPLL_D2_D4		84
> +#define CLK_TOP_UNIVPLL_D3		85
> +#define CLK_TOP_UNIVPLL_D3_D2		86
> +#define CLK_TOP_UNIVPLL_D3_D4		87
> +#define CLK_TOP_UNIVPLL_D3_D8		88
> +#define CLK_TOP_UNIVPLL_D3_D32		89
> +#define CLK_TOP_UNIVPLL_D5		90
> +#define CLK_TOP_UNIVPLL_D5_D2		91
> +#define CLK_TOP_UNIVPLL_D5_D4		92
> +#define CLK_TOP_UNIVPLL_D7		93
> +#define CLK_TOP_UNIVPLL_192M		94
> +#define CLK_TOP_UNIVPLL_192M_D4		95
> +#define CLK_TOP_UNIVPLL_192M_D8		96
> +#define CLK_TOP_UNIVPLL_192M_D16	97
> +#define CLK_TOP_UNIVPLL_192M_D32	98
> +#define CLK_TOP_APLL1_D2		99
> +#define CLK_TOP_APLL1_D4		100
> +#define CLK_TOP_APLL1_D8		101
> +#define CLK_TOP_APLL2_D2		102
> +#define CLK_TOP_APLL2_D4		103
> +#define CLK_TOP_APLL2_D8		104
> +#define CLK_TOP_MMPLL_D2		105
> +#define CLK_TOP_TVDPLL_D2		106
> +#define CLK_TOP_TVDPLL_D4		107
> +#define CLK_TOP_TVDPLL_D8		108
> +#define CLK_TOP_TVDPLL_D16		109
> +#define CLK_TOP_TVDPLL_D32		110
> +#define CLK_TOP_MSDCPLL_D2		111
> +#define CLK_TOP_ULPOSC1			112
> +#define CLK_TOP_ULPOSC1_D2		113
> +#define CLK_TOP_ULPOSC1_D4		114
> +#define CLK_TOP_ULPOSC1_D8		115
> +#define CLK_TOP_ULPOSC1_D10		116
> +#define CLK_TOP_ULPOSC1_D16		117
> +#define CLK_TOP_ULPOSC1_D32		118
> +#define CLK_TOP_ADSPPLL_D2		119
> +#define CLK_TOP_ADSPPLL_D4		120
> +#define CLK_TOP_ADSPPLL_D8		121
> +#define CLK_TOP_NNAPLL_D2		122
> +#define CLK_TOP_NNAPLL_D4		123
> +#define CLK_TOP_NNAPLL_D8		124
> +#define CLK_TOP_NNA2PLL_D2		125
> +#define CLK_TOP_NNA2PLL_D4		126
> +#define CLK_TOP_NNA2PLL_D8		127
> +#define CLK_TOP_F_BIST2FPC		128
> +#define CLK_TOP_466M_FMEM		129
> +#define CLK_TOP_MPLL			130
> +#define CLK_TOP_APLL12_CK_DIV0		131
> +#define CLK_TOP_APLL12_CK_DIV1		132
> +#define CLK_TOP_APLL12_CK_DIV2		133
> +#define CLK_TOP_APLL12_CK_DIV4		134
> +#define CLK_TOP_APLL12_CK_DIV_TDMOUT_M	135
> +#define CLK_TOP_NR_CLK			136
> +
> +/* INFRACFG_AO */
> +
> +#define CLK_INFRA_AO_PMIC_TMR		0
> +#define CLK_INFRA_AO_PMIC_AP		1
> +#define CLK_INFRA_AO_PMIC_MD		2
> +#define CLK_INFRA_AO_PMIC_CONN		3
> +#define CLK_INFRA_AO_SCP_CORE		4
> +#define CLK_INFRA_AO_SEJ		5
> +#define CLK_INFRA_AO_APXGPT		6
> +#define CLK_INFRA_AO_ICUSB		7
> +#define CLK_INFRA_AO_GCE		8
> +#define CLK_INFRA_AO_THERM		9
> +#define CLK_INFRA_AO_I2C_AP		10
> +#define CLK_INFRA_AO_I2C_CCU		11
> +#define CLK_INFRA_AO_I2C_SSPM		12
> +#define CLK_INFRA_AO_I2C_RSV		13
> +#define CLK_INFRA_AO_PWM_HCLK		14
> +#define CLK_INFRA_AO_PWM1		15
> +#define CLK_INFRA_AO_PWM2		16
> +#define CLK_INFRA_AO_PWM3		17
> +#define CLK_INFRA_AO_PWM4		18
> +#define CLK_INFRA_AO_PWM5		19
> +#define CLK_INFRA_AO_PWM		20
> +#define CLK_INFRA_AO_UART0		21
> +#define CLK_INFRA_AO_UART1		22
> +#define CLK_INFRA_AO_UART2		23
> +#define CLK_INFRA_AO_GCE_26M		24
> +#define CLK_INFRA_AO_CQ_DMA_FPC		25
> +#define CLK_INFRA_AO_BTIF		26
> +#define CLK_INFRA_AO_SPI0		27
> +#define CLK_INFRA_AO_MSDC0		28
> +#define CLK_INFRA_AO_MSDCFDE		29
> +#define CLK_INFRA_AO_MSDC1		30
> +#define CLK_INFRA_AO_DVFSRC		31
> +#define CLK_INFRA_AO_GCPU		32
> +#define CLK_INFRA_AO_TRNG		33
> +#define CLK_INFRA_AO_AUXADC		34
> +#define CLK_INFRA_AO_CPUM		35
> +#define CLK_INFRA_AO_CCIF1_AP		36
> +#define CLK_INFRA_AO_CCIF1_MD		37
> +#define CLK_INFRA_AO_AUXADC_MD		38
> +#define CLK_INFRA_AO_AP_DMA		39
> +#define CLK_INFRA_AO_XIU		40
> +#define CLK_INFRA_AO_DEVICE_APC		41
> +#define CLK_INFRA_AO_CCIF_AP		42
> +#define CLK_INFRA_AO_DEBUGTOP		43
> +#define CLK_INFRA_AO_AUDIO		44
> +#define CLK_INFRA_AO_CCIF_MD		45
> +#define CLK_INFRA_AO_DXCC_SEC_CORE	46
> +#define CLK_INFRA_AO_DXCC_AO		47
> +#define CLK_INFRA_AO_IMP_IIC		48
> +#define CLK_INFRA_AO_DRAMC_F26M		49
> +#define CLK_INFRA_AO_RG_PWM_FBCLK6	50
> +#define CLK_INFRA_AO_SSUSB_TOP_HCLK	51
> +#define CLK_INFRA_AO_DISP_PWM		52
> +#define CLK_INFRA_AO_CLDMA_BCLK		53
> +#define CLK_INFRA_AO_AUDIO_26M_BCLK	54
> +#define CLK_INFRA_AO_SSUSB_TOP_P1_HCLK	55
> +#define CLK_INFRA_AO_SPI1		56
> +#define CLK_INFRA_AO_I2C4		57
> +#define CLK_INFRA_AO_MODEM_TEMP_SHARE	58
> +#define CLK_INFRA_AO_SPI2		59
> +#define CLK_INFRA_AO_SPI3		60
> +#define CLK_INFRA_AO_SSUSB_TOP_REF	61
> +#define CLK_INFRA_AO_SSUSB_TOP_XHCI	62
> +#define CLK_INFRA_AO_SSUSB_TOP_P1_REF	63
> +#define CLK_INFRA_AO_SSUSB_TOP_P1_XHCI	64
> +#define CLK_INFRA_AO_SSPM		65
> +#define CLK_INFRA_AO_SSUSB_TOP_P1_SYS	66
> +#define CLK_INFRA_AO_I2C5		67
> +#define CLK_INFRA_AO_I2C5_ARBITER	68
> +#define CLK_INFRA_AO_I2C5_IMM		69
> +#define CLK_INFRA_AO_I2C1_ARBITER	70
> +#define CLK_INFRA_AO_I2C1_IMM		71
> +#define CLK_INFRA_AO_I2C2_ARBITER	72
> +#define CLK_INFRA_AO_I2C2_IMM		73
> +#define CLK_INFRA_AO_SPI4		74
> +#define CLK_INFRA_AO_SPI5		75
> +#define CLK_INFRA_AO_CQ_DMA		76
> +#define CLK_INFRA_AO_BIST2FPC		77
> +#define CLK_INFRA_AO_MSDC0_SELF		78
> +#define CLK_INFRA_AO_SPINOR		79
> +#define CLK_INFRA_AO_SSPM_26M_SELF	80
> +#define CLK_INFRA_AO_SSPM_32K_SELF	81
> +#define CLK_INFRA_AO_I2C6		82
> +#define CLK_INFRA_AO_AP_MSDC0		83
> +#define CLK_INFRA_AO_MD_MSDC0		84
> +#define CLK_INFRA_AO_MSDC0_SRC		85
> +#define CLK_INFRA_AO_MSDC1_SRC		86
> +#define CLK_INFRA_AO_SEJ_F13M		87
> +#define CLK_INFRA_AO_AES_TOP0_BCLK	88
> +#define CLK_INFRA_AO_MCU_PM_BCLK	89
> +#define CLK_INFRA_AO_CCIF2_AP		90
> +#define CLK_INFRA_AO_CCIF2_MD		91
> +#define CLK_INFRA_AO_CCIF3_AP		92
> +#define CLK_INFRA_AO_CCIF3_MD		93
> +#define CLK_INFRA_AO_FADSP_26M		94
> +#define CLK_INFRA_AO_FADSP_32K		95
> +#define CLK_INFRA_AO_CCIF4_AP		96
> +#define CLK_INFRA_AO_CCIF4_MD		97
> +#define CLK_INFRA_AO_FADSP		98
> +#define CLK_INFRA_AO_FLASHIF_133M	99
> +#define CLK_INFRA_AO_FLASHIF_66M	100
> +#define CLK_INFRA_AO_NR_CLK		101
> +
> +/* APMIXEDSYS */
> +
> +#define CLK_APMIXED_ARMPLL_LL		0
> +#define CLK_APMIXED_ARMPLL_BL		1
> +#define CLK_APMIXED_CCIPLL		2
> +#define CLK_APMIXED_MAINPLL		3
> +#define CLK_APMIXED_UNIV2PLL		4
> +#define CLK_APMIXED_MSDCPLL		5
> +#define CLK_APMIXED_MMPLL		6
> +#define CLK_APMIXED_NNAPLL		7
> +#define CLK_APMIXED_NNA2PLL		8
> +#define CLK_APMIXED_ADSPPLL		9
> +#define CLK_APMIXED_MFGPLL		10
> +#define CLK_APMIXED_TVDPLL		11
> +#define CLK_APMIXED_APLL1		12
> +#define CLK_APMIXED_APLL2		13
> +#define CLK_APMIXED_NR_CLK		14
> +
> +/* IMP_IIC_WRAP */
> +
> +#define CLK_IMP_IIC_WRAP_AP_CLOCK_I2C0	0
> +#define CLK_IMP_IIC_WRAP_AP_CLOCK_I2C1	1
> +#define CLK_IMP_IIC_WRAP_AP_CLOCK_I2C2	2
> +#define CLK_IMP_IIC_WRAP_AP_CLOCK_I2C3	3
> +#define CLK_IMP_IIC_WRAP_AP_CLOCK_I2C4	4
> +#define CLK_IMP_IIC_WRAP_AP_CLOCK_I2C5	5
> +#define CLK_IMP_IIC_WRAP_AP_CLOCK_I2C6	6
> +#define CLK_IMP_IIC_WRAP_AP_CLOCK_I2C7	7
> +#define CLK_IMP_IIC_WRAP_AP_CLOCK_I2C8	8
> +#define CLK_IMP_IIC_WRAP_AP_CLOCK_I2C9	9
> +#define CLK_IMP_IIC_WRAP_NR_CLK		10
> +
> +/* MFGCFG */
> +
> +#define CLK_MFG_BG3D			0
> +#define CLK_MFG_NR_CLK			1
> +
> +/* MMSYS */
> +
> +#define CLK_MM_DISP_MUTEX0		0
> +#define CLK_MM_APB_MM_BUS		1
> +#define CLK_MM_DISP_OVL0		2
> +#define CLK_MM_DISP_RDMA0		3
> +#define CLK_MM_DISP_OVL0_2L		4
> +#define CLK_MM_DISP_WDMA0		5
> +#define CLK_MM_DISP_RSZ0		6
> +#define CLK_MM_DISP_AAL0		7
> +#define CLK_MM_DISP_CCORR0		8
> +#define CLK_MM_DISP_COLOR0		9
> +#define CLK_MM_SMI_INFRA		10
> +#define CLK_MM_DISP_DSC_WRAP0		11
> +#define CLK_MM_DISP_GAMMA0		12
> +#define CLK_MM_DISP_POSTMASK0		13
> +#define CLK_MM_DISP_DITHER0		14
> +#define CLK_MM_SMI_COMMON		15
> +#define CLK_MM_DSI0			16
> +#define CLK_MM_DISP_FAKE_ENG0		17
> +#define CLK_MM_DISP_FAKE_ENG1		18
> +#define CLK_MM_SMI_GALS			19
> +#define CLK_MM_SMI_IOMMU		20
> +#define CLK_MM_DISP_RDMA1		21
> +#define CLK_MM_DISP_DPI			22
> +#define CLK_MM_DSI0_DSI_CK_DOMAIN	23
> +#define CLK_MM_DISP_26M			24
> +#define CLK_MM_NR_CLK			25
> +
> +/* WPESYS */
> +
> +#define CLK_WPE_CK_EN			0
> +#define CLK_WPE_SMI_LARB8_CK_EN		1
> +#define CLK_WPE_SYS_EVENT_TX_CK_EN	2
> +#define CLK_WPE_SMI_LARB8_PCLK_EN	3
> +#define CLK_WPE_NR_CLK			4
> +
> +/* IMGSYS1 */
> +
> +#define CLK_IMG1_LARB9_IMG1		0
> +#define CLK_IMG1_LARB10_IMG1		1
> +#define CLK_IMG1_DIP			2
> +#define CLK_IMG1_GALS_IMG1		3
> +#define CLK_IMG1_NR_CLK			4
> +
> +/* IMGSYS2 */
> +
> +#define CLK_IMG2_LARB9_IMG2		0
> +#define CLK_IMG2_LARB10_IMG2		1
> +#define CLK_IMG2_MFB			2
> +#define CLK_IMG2_WPE			3
> +#define CLK_IMG2_MSS			4
> +#define CLK_IMG2_GALS_IMG2		5
> +#define CLK_IMG2_NR_CLK			6
> +
> +/* VDECSYS */
> +
> +#define CLK_VDEC_LARB1_CKEN		0
> +#define CLK_VDEC_LAT_CKEN		1
> +#define CLK_VDEC_LAT_ACTIVE		2
> +#define CLK_VDEC_LAT_CKEN_ENG		3
> +#define CLK_VDEC_MINI_MDP_CKEN_CFG_RG	4
> +#define CLK_VDEC_CKEN			5
> +#define CLK_VDEC_ACTIVE			6
> +#define CLK_VDEC_CKEN_ENG		7
> +#define CLK_VDEC_NR_CLK			8
> +
> +/* VENCSYS */
> +
> +#define CLK_VENC_CKE0_LARB		0
> +#define CLK_VENC_CKE1_VENC		1
> +#define CLK_VENC_CKE2_JPGENC		2
> +#define CLK_VENC_CKE5_GALS		3
> +#define CLK_VENC_NR_CLK			4
> +
> +/* CAMSYS */
> +
> +#define CLK_CAM_LARB13			0
> +#define CLK_CAM_DFP_VAD			1
> +#define CLK_CAM_LARB14			2
> +#define CLK_CAM				3
> +#define CLK_CAMTG			4
> +#define CLK_CAM_SENINF			5
> +#define CLK_CAMSV1			6
> +#define CLK_CAMSV2			7
> +#define CLK_CAMSV3			8
> +#define CLK_CAM_CCU0			9
> +#define CLK_CAM_CCU1			10
> +#define CLK_CAM_MRAW0			11
> +#define CLK_CAM_FAKE_ENG		12
> +#define CLK_CAM_CCU_GALS		13
> +#define CLK_CAM2MM_GALS			14
> +#define CLK_CAM_NR_CLK			15
> +
> +/* CAMSYS_RAWA */
> +
> +#define CLK_CAM_RAWA_LARBX_RAWA		0
> +#define CLK_CAM_RAWA			1
> +#define CLK_CAM_RAWA_CAMTG_RAWA		2
> +#define CLK_CAM_RAWA_NR_CLK		3
> +
> +/* CAMSYS_RAWB */
> +
> +#define CLK_CAM_RAWB_LARBX_RAWB		0
> +#define CLK_CAM_RAWB			1
> +#define CLK_CAM_RAWB_CAMTG_RAWB		2
> +#define CLK_CAM_RAWB_NR_CLK		3
> +
> +/* MDPSYS */
> +
> +#define CLK_MDP_RDMA0			0
> +#define CLK_MDP_TDSHP0			1
> +#define CLK_MDP_IMG_DL_ASYNC0		2
> +#define CLK_MDP_IMG_DL_ASYNC1		3
> +#define CLK_MDP_DISP_RDMA		4
> +#define CLK_MDP_HMS			5
> +#define CLK_MDP_SMI0			6
> +#define CLK_MDP_APB_BUS			7
> +#define CLK_MDP_WROT0			8
> +#define CLK_MDP_RSZ0			9
> +#define CLK_MDP_HDR0			10
> +#define CLK_MDP_MUTEX0			11
> +#define CLK_MDP_WROT1			12
> +#define CLK_MDP_RSZ1			13
> +#define CLK_MDP_FAKE_ENG0		14
> +#define CLK_MDP_AAL0			15
> +#define CLK_MDP_DISP_WDMA		16
> +#define CLK_MDP_COLOR			17
> +#define CLK_MDP_IMG_DL_ASYNC2		18
> +#define CLK_MDP_IMG_DL_RELAY0_ASYNC0	19
> +#define CLK_MDP_IMG_DL_RELAY1_ASYNC1	20
> +#define CLK_MDP_IMG_DL_RELAY2_ASYNC2	21
> +#define CLK_MDP_NR_CLK			22
> +
> +/* IPESYS */
> +
> +#define CLK_IPE_LARB19			0
> +#define CLK_IPE_LARB20			1
> +#define CLK_IPE_SMI_SUBCOM		2
> +#define CLK_IPE_FD			3
> +#define CLK_IPE_FE			4
> +#define CLK_IPE_RSC			5
> +#define CLK_IPE_DPE			6
> +#define CLK_IPE_GALS_IPE		7
> +#define CLK_IPE_NR_CLK			8
> +
> +#endif /* _DT_BINDINGS_CLK_MT8186_H */
> -- 
> 2.18.0
> 
> 
