Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B38D1F93D1
	for <lists+linux-clk@lfdr.de>; Mon, 15 Jun 2020 11:46:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729008AbgFOJqO (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 15 Jun 2020 05:46:14 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:7406 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728626AbgFOJqO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Jun 2020 05:46:14 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 05F9YmAg015035;
        Mon, 15 Jun 2020 11:45:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=HzRMy6iVCZcLIfFdNcJlFmRB2z9fKYZjPMelH03qdYY=;
 b=nOlzI78SZ3BXZsTxqFqoExmXdRONkXi5UKuqpvBc92FLtDOUT9oj+HyLeFTjarNKmxwH
 yO/6GjTPHN7RMfwgh0/kv5U1rUzXgEF2o3ZEJ68+kTo7R+HkRAqEGRAGvOT/p44c7azE
 8ZGDzljkTLZb8dokG1oa27eTNcQCzjEL9LCX9FjHPQMYBhPa0PdxQkYXyvYgzkUrVGI4
 CXDJPCMmEMMQsah697bvJDTc1OsChq0OhJn4cAf/iMsje5syLv6nRGy8cd1SdFTBhA1Y
 Vl6vgqwoLU1Aw8xGzNpiRgQn1uVKdFOCKIZIODsOkx94i2/l8/9eUFykiSzy6m3273J7 tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31mmjvrwjd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 15 Jun 2020 11:45:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1B0C710002A;
        Mon, 15 Jun 2020 11:45:38 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E456E2C298D;
        Mon, 15 Jun 2020 11:45:37 +0200 (CEST)
Received: from lmecxl0912.tpe.st.com (10.75.127.48) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 15 Jun
 2020 11:45:36 +0200
Subject: Re: [PATCH v6 2/9] ARM: dts: stm32: Add pin map for ltdc & spi5 on
 stm32f429-disco board
To:     <dillon.minfei@gmail.com>, <robh+dt@kernel.org>,
        <p.zabel@pengutronix.de>, <mcoquelin.stm32@gmail.com>,
        <thierry.reding@gmail.com>, <sam@ravnborg.org>, <airlied@linux.ie>,
        <daniel@ffwll.ch>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <andy.shevchenko@gmail.com>, <noralf@tronnes.org>,
        <linus.walleij@linaro.org>, <broonie@kernel.org>
CC:     <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <dri-devel@lists.freedesktop.org>, <linux-clk@vger.kernel.org>,
        <dillonhua@gmail.com>
References: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
 <1590564453-24499-3-git-send-email-dillon.minfei@gmail.com>
From:   Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <2273a168-7b14-9e28-5904-b9d2c2e2d9d3@st.com>
Date:   Mon, 15 Jun 2020 11:45:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1590564453-24499-3-git-send-email-dillon.minfei@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-15_01:2020-06-15,2020-06-15 signatures=0
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Dillon

On 5/27/20 9:27 AM, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>
> 
> This patch adds the pin configuration for ltdc and spi5 controller
> on stm32f429-disco board.
> 
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---
>   arch/arm/boot/dts/stm32f4-pinctrl.dtsi | 67 ++++++++++++++++++++++++++++++++++
>   1 file changed, 67 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
> index 392fa143ce07..0eb107f968cd 100644
> --- a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
> @@ -316,6 +316,73 @@
>   				};
>   			};
>   
> +			ltdc_pins_f429_disco: ltdc-1 {

Sorry I missed this issue during review. I changed ltdc_pins_f429_disco 
by ltdc_pins_b when I applied your patch.


Regards
alex

> +				pins {
> +					pinmux = <STM32_PINMUX('C', 6,  AF14)>,
> +						/* LCD_HSYNC */
> +						 <STM32_PINMUX('A', 4,  AF14)>,
> +						 /* LCD_VSYNC */
> +						 <STM32_PINMUX('G', 7,  AF14)>,
> +						 /* LCD_CLK */
> +						 <STM32_PINMUX('C', 10, AF14)>,
> +						 /* LCD_R2 */
> +						 <STM32_PINMUX('B', 0,  AF9)>,
> +						 /* LCD_R3 */
> +						 <STM32_PINMUX('A', 11, AF14)>,
> +						 /* LCD_R4 */
> +						 <STM32_PINMUX('A', 12, AF14)>,
> +						 /* LCD_R5 */
> +						 <STM32_PINMUX('B', 1,  AF9)>,
> +						 /* LCD_R6*/
> +						 <STM32_PINMUX('G', 6,  AF14)>,
> +						 /* LCD_R7 */
> +						 <STM32_PINMUX('A', 6,  AF14)>,
> +						 /* LCD_G2 */
> +						 <STM32_PINMUX('G', 10, AF9)>,
> +						 /* LCD_G3 */
> +						 <STM32_PINMUX('B', 10, AF14)>,
> +						 /* LCD_G4 */
> +						 <STM32_PINMUX('D', 6,  AF14)>,
> +						 /* LCD_B2 */
> +						 <STM32_PINMUX('G', 11, AF14)>,
> +						 /* LCD_B3*/
> +						 <STM32_PINMUX('B', 11, AF14)>,
> +						 /* LCD_G5 */
> +						 <STM32_PINMUX('C', 7,  AF14)>,
> +						 /* LCD_G6 */
> +						 <STM32_PINMUX('D', 3,  AF14)>,
> +						 /* LCD_G7 */
> +						 <STM32_PINMUX('G', 12, AF9)>,
> +						 /* LCD_B4 */
> +						 <STM32_PINMUX('A', 3,  AF14)>,
> +						 /* LCD_B5 */
> +						 <STM32_PINMUX('B', 8,  AF14)>,
> +						 /* LCD_B6 */
> +						 <STM32_PINMUX('B', 9,  AF14)>,
> +						 /* LCD_B7 */
> +						 <STM32_PINMUX('F', 10, AF14)>;
> +						 /* LCD_DE */
> +					slew-rate = <2>;
> +				};
> +			};
> +
> +			spi5_pins: spi5-0 {
> +				pins1 {
> +					pinmux = <STM32_PINMUX('F', 7, AF5)>,
> +						/* SPI5_CLK */
> +						 <STM32_PINMUX('F', 9, AF5)>;
> +						/* SPI5_MOSI */
> +					bias-disable;
> +					drive-push-pull;
> +					slew-rate = <0>;
> +				};
> +				pins2 {
> +					pinmux = <STM32_PINMUX('F', 8, AF5)>;
> +						/* SPI5_MISO */
> +					bias-disable;
> +				};
> +			};
> +
>   			dcmi_pins: dcmi-0 {
>   				pins {
>   					pinmux = <STM32_PINMUX('A', 4, AF13)>, /* DCMI_HSYNC */
> 
