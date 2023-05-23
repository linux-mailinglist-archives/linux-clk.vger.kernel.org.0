Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 700F470D177
	for <lists+linux-clk@lfdr.de>; Tue, 23 May 2023 04:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234148AbjEWCmL (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 22 May 2023 22:42:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229874AbjEWCmK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 May 2023 22:42:10 -0400
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0F84E9;
        Mon, 22 May 2023 19:42:08 -0700 (PDT)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
        by ex01.ufhost.com (Postfix) with ESMTP id 585DE24E03C;
        Tue, 23 May 2023 10:41:56 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 23 May
 2023 10:41:56 +0800
Received: from [192.168.125.131] (183.27.98.143) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 23 May
 2023 10:41:55 +0800
Message-ID: <1d24b4bf-67c9-ef84-b92d-eb0f651125a2@starfivetech.com>
Date:   Tue, 23 May 2023 10:40:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 1/7] dt-bindings: clock: Add StarFive JH7110 PLL clock
 generator
Content-Language: en-US
To:     Conor Dooley <conor.dooley@microchip.com>,
        Torsten Duwe <duwe@lst.de>
CC:     <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <yanhong.wang@starfivetech.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Conor Dooley <conor@kernel.org>,
        Emil Renner Berthing <kernel@esmil.dk>,
        "Rob Herring" <robh+dt@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "Hal Feng" <hal.feng@starfivetech.com>,
        William Qiu <william.qiu@starfivetech.com>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20230512022036.97987-1-xingyu.wu@starfivetech.com>
 <20230512022036.97987-2-xingyu.wu@starfivetech.com>
 <20230519135733.GA10188@lst.de>
 <20230519-smokeless-guileless-2a71cae06509@wendy>
From:   Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <20230519-smokeless-guileless-2a71cae06509@wendy>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [183.27.98.143]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2023/5/19 22:16, Conor Dooley wrote:
> On Fri, May 19, 2023 at 03:57:33PM +0200, Torsten Duwe wrote:
>> On Fri, May 12, 2023 at 10:20:30AM +0800, Xingyu Wu wrote:
>> [...]
>> >  #ifndef __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
>> >  #define __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
>> >  
>> > +/* PLL clocks */
>> > +#define JH7110_CLK_PLL0_OUT			0
>> > +#define JH7110_CLK_PLL1_OUT			1
>> > +#define JH7110_CLK_PLL2_OUT			2
>> 
>> In U-Boot commit 58c9c60b Yanhong Wang added:
>> 
>> +
>> +#define JH7110_SYSCLK_PLL0_OUT                       190
>> +#define JH7110_SYSCLK_PLL1_OUT                       191
>> +#define JH7110_SYSCLK_PLL2_OUT                       192
>> +
>> +#define JH7110_SYSCLK_END                    193
>> 
>> in that respective file.
>> 
>> > +#define JH7110_PLLCLK_END			3
>> > +
>> >  /* SYSCRG clocks */
>> >  #define JH7110_SYSCLK_CPU_ROOT			0
>> 
>> If the symbolic names referred to the same items, would it be possible
>> to keep the two files in sync somehow?
> 
> Ohh, that's not good.. If you pass the U-Boot dtb to Linux it won't
> understand the numbering. The headers are part of the dt-binding :/

Because in Linux, the PLL driver is separate from SYSCRG driver and the
numbering starts from 0. But in Uboot, the PLL driver is included in
the SYSCRG driver and the numbering follows the SYSCRG.

Best regards,
Xingyu Wu
