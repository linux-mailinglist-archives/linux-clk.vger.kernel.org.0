Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C79606A041D
	for <lists+linux-clk@lfdr.de>; Thu, 23 Feb 2023 09:46:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232867AbjBWIqs (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 23 Feb 2023 03:46:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229745AbjBWIqr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Feb 2023 03:46:47 -0500
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 312752A6EA;
        Thu, 23 Feb 2023 00:46:46 -0800 (PST)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
        by ex01.ufhost.com (Postfix) with ESMTP id A482D24E282;
        Thu, 23 Feb 2023 16:46:44 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 23 Feb
 2023 16:46:44 +0800
Received: from [192.168.125.128] (113.72.147.165) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 23 Feb
 2023 16:46:43 +0800
Message-ID: <842e5825-07ad-1806-d969-f54d9a9eed5a@starfivetech.com>
Date:   Thu, 23 Feb 2023 16:47:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 3/3] riscv: dts: starfive: jh7110: Add PLL clock node
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC:     <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        "Michael Turquette" <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20230221141147.303642-1-xingyu.wu@starfivetech.com>
 <20230221141147.303642-4-xingyu.wu@starfivetech.com>
 <a799e064-b0ac-7300-b706-0c33e2d3610a@linaro.org>
From:   Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <a799e064-b0ac-7300-b706-0c33e2d3610a@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [113.72.147.165]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2023/2/22 17:09, Krzysztof Kozlowski wrote:
> On 21/02/2023 15:11, Xingyu Wu wrote:
>> Add the PLL clock node for the Starfive JH7110 SoC and
>> modify the SYSCRG node to add PLL clocks.
>> 
>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>> ---
>>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 15 +++++++++++++--
>>  1 file changed, 13 insertions(+), 2 deletions(-)
>> 
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> index b6612c53d0d2..0cb8d86ebce5 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> @@ -461,12 +461,16 @@ syscrg: clock-controller@13020000 {
>>  				 <&gmac1_rgmii_rxin>,
>>  				 <&i2stx_bclk_ext>, <&i2stx_lrck_ext>,
>>  				 <&i2srx_bclk_ext>, <&i2srx_lrck_ext>,
>> -				 <&tdm_ext>, <&mclk_ext>;
>> +				 <&tdm_ext>, <&mclk_ext>,
>> +				 <&pllclk JH7110_CLK_PLL0_OUT>,
>> +				 <&pllclk JH7110_CLK_PLL1_OUT>,
>> +				 <&pllclk JH7110_CLK_PLL2_OUT>;
>>  			clock-names = "osc", "gmac1_rmii_refin",
>>  				      "gmac1_rgmii_rxin",
>>  				      "i2stx_bclk_ext", "i2stx_lrck_ext",
>>  				      "i2srx_bclk_ext", "i2srx_lrck_ext",
>> -				      "tdm_ext", "mclk_ext";
>> +				      "tdm_ext", "mclk_ext",
>> +				      "pll0_out", "pll1_out", "pll2_out";
>>  			#clock-cells = <1>;
>>  			#reset-cells = <1>;
>>  		};
>> @@ -476,6 +480,13 @@ sys_syscon: syscon@13030000 {
>>  			reg = <0x0 0x13030000 0x0 0x1000>;
>>  		};
>>  
>> +		pllclk: pll-clock-controller {
> 
> Does not look like you tested the DTS against bindings. Please run `make
> dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
> for instructions). You should see here warnings of mixing non-MMIO nodes
> in MMIO-bus.
> 

Oh I cherry-pick the commit of syscon node and it also include the MMC node.
I will remove the MMC node. 
I used dtbs_check and get the error 'should not be valid under {'type': 'object'}',
If I move this node out of the 'soc' node, the dtbs_check will be pass.
Is it OK to move the PLL node out of the 'soc' node? Thanks.

Best regards,
Xingyu Wu

