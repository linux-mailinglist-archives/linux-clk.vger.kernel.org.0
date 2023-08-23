Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D759A7854EA
	for <lists+linux-clk@lfdr.de>; Wed, 23 Aug 2023 12:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232202AbjHWKJU (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 23 Aug 2023 06:09:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235663AbjHWJdQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Aug 2023 05:33:16 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3046CCFE
        for <linux-clk@vger.kernel.org>; Wed, 23 Aug 2023 02:21:03 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-317f1c480eeso4774914f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 23 Aug 2023 02:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1692782461; x=1693387261;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=l6KedzxmPUcJpLPxOUMzsZaF7EVrY0oKwVLT9T5HLGo=;
        b=1+mkMHzSTnHjzOWx83zzVSrlxp8P8jvT0Sq3eW/t92L5CWuMyfd09uQGYAstuJC1nD
         nQubzvLRr3CGDQHrk4LPFrzusyEVJtFMlMw9x+7W+H+7V4dpME6WpenF0FKUjaGAjJ/v
         xC2bl5FctCtCEEXoLNUa92MkXArs7/vsMOsBI1SSuty4nJtfidxFCoSW71GzkCy1LVk/
         5qcuLttStlKdnMByHlZhEBco5/ThcDZIVMFpuBMtkiD2WgfVTVL7vKzaeoH+TmKFY75k
         AbtjJtn8nlI0ZEXPs8abjIBhmxufunhE8WUCwAunFUSzk+MUe5bC466R89vjmI036hum
         Cx5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692782461; x=1693387261;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6KedzxmPUcJpLPxOUMzsZaF7EVrY0oKwVLT9T5HLGo=;
        b=dOZjP/Edo//LQ9cwtPA9/CYmS34t87I47YUbxcSDt8XPdAqgJdjSBqPPaaWKGzeD+G
         yRUEDpKcFQobAo/MMteL63fSAYEFzicjU4oqwo42wtZwTCk/4XL/NhP7dQ6RMO0W4azM
         OzXXv28Z+473pAlnnt6pN6DBtjuVr+qeA3j04J2cbjKALUGIBd8HKfAlkLHZW+Rj2F8o
         o23rOMktIYHC36laAn/2Z99aBbMz9JCoomKBVpEevxmTYyG07v2tw9y6tVPHQIyTL7wF
         RxTo7Te6cEETGhEeRTUyFmGO8DC1KoWgGUo0e0lhrQo4B3tGfa6Dj/FJzLSI/YPQoc4s
         gszQ==
X-Gm-Message-State: AOJu0YwqCXzTxzaY9nqtz7Yergy+vq56DgjxdG48yBpaYlWgfFHNM2V6
        /PVDObKWIBWA1BuVm1xC9dD4Kw==
X-Google-Smtp-Source: AGHT+IEbFmmWrceL/znctMAoQN9/7mJ6yvA6RxxJS5smI872v2AOdHEkWmXqN86IRuvU6v5g+6dH2Q==
X-Received: by 2002:a5d:54c1:0:b0:31c:65aa:b15a with SMTP id x1-20020a5d54c1000000b0031c65aab15amr2537433wrv.65.1692782461608;
        Wed, 23 Aug 2023 02:21:01 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:c128:6cb5:cc63:7cbe])
        by smtp.gmail.com with ESMTPSA id r10-20020adfdc8a000000b003197c2316ecsm18214096wrj.112.2023.08.23.02.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 02:21:01 -0700 (PDT)
References: <20230822082750.27633-1-yu.tu@amlogic.com>
 <20230822082750.27633-3-yu.tu@amlogic.com>
 <1jbkey9obf.fsf@starbuckisacylon.baylibre.com>
 <3fa20b2f-c87f-1896-7d6d-a72b5e8aa6ba@amlogic.com>
User-agent: mu4e 1.8.13; emacs 28.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     kelvin.zhang@amlogic.com, qi.duan@amlogic.com
Subject: Re: [PATCH V10 2/4] dt-bindings: clock: document Amlogic S4 SoC
 peripherals clock controller
Date:   Wed, 23 Aug 2023 11:14:57 +0200
In-reply-to: <3fa20b2f-c87f-1896-7d6d-a72b5e8aa6ba@amlogic.com>
Message-ID: <1j350a9ksj.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Wed 23 Aug 2023 at 16:32, Yu Tu <yu.tu@amlogic.com> wrote:

> On 2023/8/23 16:01, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>> On Tue 22 Aug 2023 at 16:27, Yu Tu <yu.tu@amlogic.com> wrote:
>> 
>>> Add the S4 peripherals clock controller dt-bindings in the S4 SoC
>>> family.
>>>
>>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>>> ---
>>>   .../clock/amlogic,s4-peripherals-clkc.yaml    |  96 +++++++
>>>   .../clock/amlogic,s4-peripherals-clkc.h       | 236 ++++++++++++++++++
>>>   2 files changed, 332 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-peripherals-clkc.yaml
>>>   create mode 100644 include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/amlogic,s4-peripherals-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,s4-peripherals-clkc.yaml
>>> new file mode 100644
>>> index 000000000000..e166563e7b14
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/amlogic,s4-peripherals-clkc.yaml
>>> @@ -0,0 +1,96 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +# Copyright (C) 2022-2023 Amlogic, Inc. All rights reserved
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/clock/amlogic,s4-peripherals-clkc.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Amlogic S4 Peripherals Clock Controller
>>> +
>>> +maintainers:
>>> +  - Yu Tu <yu.tu@amlogic.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: amlogic,s4-peripherals-clkc
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: input fixed pll div2
>>> +      - description: input fixed pll div2p5
>>> +      - description: input fixed pll div3
>>> +      - description: input fixed pll div4
>>> +      - description: input fixed pll div5
>>> +      - description: input fixed pll div7
>>> +      - description: input hifi pll
>>> +      - description: input gp0 pll
>>> +      - description: input mpll0
>>> +      - description: input mpll1
>>> +      - description: input mpll2
>>> +      - description: input mpll3
>>> +      - description: input hdmi pll
>>> +      - description: input oscillator (usually at 24MHz)
>>> +      - description: input external 32kHz reference (optional)
>> The bindings described here does not make this last clock optional, but
>> requires it. This is going to be a problem since most platforms won't
>> have this clock.
>
> Hi Jerome,
> 	Do you mean that we can delete the description of "external 32kHz",
> 	because we hardly use it?

Absolutely not.
Optional ressources need description too.

>
>> You are missing minItems.
>> Same below
>
> I will add it in next version.
>

I'm saying that because you did not provide minItems here, it gets
implicitly set to the number of clocks you have declared, making the
external 32k a required clock, not an optional one.

You need to set minItems so the clocks is actually optional.
Try removing the 32k in your example below and check how it goes with
'make dt_binding_check'

>> 
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: fclk_div2
>>> +      - const: fclk_div2p5
>>> +      - const: fclk_div3
>>> +      - const: fclk_div4
>>> +      - const: fclk_div5
>>> +      - const: fclk_div7
>>> +      - const: hifi_pll
>>> +      - const: gp0_pll
>>> +      - const: mpll0
>>> +      - const: mpll1
>>> +      - const: mpll2
>>> +      - const: mpll3
>>> +      - const: hdmi_pll
>>> +      - const: xtal
>>> +      - const: ext_32k
>>> +
>>> +  "#clock-cells":
>>> +    const: 1
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - clocks
>>> +  - clock-names
>>> +  - "#clock-cells"
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
>>> +
>>> +    clkc_periphs: clock-controller@fe000000 {
>>> +      compatible = "amlogic,s4-peripherals-clkc";
>>> +      reg = <0xfe000000 0x49c>;
>>> +      clocks = <&clkc_pll 3>,
>>> +              <&clkc_pll 13>,
>>> +              <&clkc_pll 5>,
>>> +              <&clkc_pll 7>,
>>> +              <&clkc_pll 9>,
>>> +              <&clkc_pll 11>,
>>> +              <&clkc_pll 17>,
>>> +              <&clkc_pll 15>,
>>> +              <&clkc_pll 25>,
>>> +              <&clkc_pll 27>,
>>> +              <&clkc_pll 29>,
>>> +              <&clkc_pll 31>,
>>> +              <&clkc_pll 20>,
>>> +              <&xtal>,
>>> +              <&ext_32k>;
>>> +      clock-names = "fclk_div2", "fclk_div2p5", "fclk_div3", "fclk_div4",
>>> +                    "fclk_div5", "fclk_div7", "hifi_pll", "gp0_pll",
>>> +                    "mpll0", "mpll1", "mpll2", "mpll3", "hdmi_pll", "xtal",
>>> +                    "ext_32k";
>>> +      #clock-cells = <1>;
>>> +    };
>>> +...
>>> diff --git a/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h b/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
>>> new file mode 100644
>>> index 000000000000..861a331963ac
>>> --- /dev/null
>>> +++ b/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
>>> @@ -0,0 +1,236 @@
>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
>>> +/*
>>> + * Copyright (c) 2022-2023 Amlogic, Inc. All rights reserved.
>>> + * Author: Yu Tu <yu.tu@amlogic.com>
>>> + */
>>> +
>>> +#ifndef _DT_BINDINGS_CLOCK_AMLOGIC_S4_PERIPHERALS_CLKC_H
>>> +#define _DT_BINDINGS_CLOCK_AMLOGIC_S4_PERIPHERALS_CLKC_H
>>> +
>>> +#define CLKID_RTC_32K_CLKIN          0
>>> +#define CLKID_RTC_32K_DIV            1
>>> +#define CLKID_RTC_32K_SEL            2
>>> +#define CLKID_RTC_32K_XATL           3
>>> +#define CLKID_RTC                    4
>>> +#define CLKID_SYS_CLK_B_SEL          5
>>> +#define CLKID_SYS_CLK_B_DIV          6
>>> +#define CLKID_SYS_CLK_B                      7
>>> +#define CLKID_SYS_CLK_A_SEL          8
>>> +#define CLKID_SYS_CLK_A_DIV          9
>>> +#define CLKID_SYS_CLK_A                      10
>>> +#define CLKID_SYS                    11
>>> +#define CLKID_CECA_32K_CLKIN         12
>>> +#define CLKID_CECA_32K_DIV           13
>>> +#define CLKID_CECA_32K_SEL_PRE               14
>>> +#define CLKID_CECA_32K_SEL           15
>>> +#define CLKID_CECA_32K_CLKOUT                16
>>> +#define CLKID_CECB_32K_CLKIN         17
>>> +#define CLKID_CECB_32K_DIV           18
>>> +#define CLKID_CECB_32K_SEL_PRE               19
>>> +#define CLKID_CECB_32K_SEL           20
>>> +#define CLKID_CECB_32K_CLKOUT                21
>>> +#define CLKID_SC_CLK_SEL             22
>>> +#define CLKID_SC_CLK_DIV             23
>>> +#define CLKID_SC                     24
>>> +#define CLKID_12_24M                 25
>>> +#define CLKID_12M_CLK_DIV            26
>>> +#define CLKID_12_24M_CLK_SEL         27
>>> +#define CLKID_VID_PLL_DIV            28
>>> +#define CLKID_VID_PLL_SEL            29
>>> +#define CLKID_VID_PLL                        30
>>> +#define CLKID_VCLK_SEL                       31
>>> +#define CLKID_VCLK2_SEL                      32
>>> +#define CLKID_VCLK_INPUT             33
>>> +#define CLKID_VCLK2_INPUT            34
>>> +#define CLKID_VCLK_DIV                       35
>>> +#define CLKID_VCLK2_DIV                      36
>>> +#define CLKID_VCLK                   37
>>> +#define CLKID_VCLK2                  38
>>> +#define CLKID_VCLK_DIV1                      39
>>> +#define CLKID_VCLK_DIV2_EN           40
>>> +#define CLKID_VCLK_DIV4_EN           41
>>> +#define CLKID_VCLK_DIV6_EN           42
>>> +#define CLKID_VCLK_DIV12_EN          43
>>> +#define CLKID_VCLK2_DIV1             44
>>> +#define CLKID_VCLK2_DIV2_EN          45
>>> +#define CLKID_VCLK2_DIV4_EN          46
>>> +#define CLKID_VCLK2_DIV6_EN          47
>>> +#define CLKID_VCLK2_DIV12_EN         48
>>> +#define CLKID_VCLK_DIV2                      49
>>> +#define CLKID_VCLK_DIV4                      50
>>> +#define CLKID_VCLK_DIV6                      51
>>> +#define CLKID_VCLK_DIV12             52
>>> +#define CLKID_VCLK2_DIV2             53
>>> +#define CLKID_VCLK2_DIV4             54
>>> +#define CLKID_VCLK2_DIV6             55
>>> +#define CLKID_VCLK2_DIV12            56
>>> +#define CLKID_CTS_ENCI_SEL           57
>>> +#define CLKID_CTS_ENCP_SEL           58
>>> +#define CLKID_CTS_VDAC_SEL           59
>>> +#define CLKID_HDMI_TX_SEL            60
>>> +#define CLKID_CTS_ENCI                       61
>>> +#define CLKID_CTS_ENCP                       62
>>> +#define CLKID_CTS_VDAC                       63
>>> +#define CLKID_HDMI_TX                        64
>>> +#define CLKID_HDMI_SEL                       65
>>> +#define CLKID_HDMI_DIV                       66
>>> +#define CLKID_HDMI                   67
>>> +#define CLKID_TS_CLK_DIV             68
>>> +#define CLKID_TS                     69
>>> +#define CLKID_MALI_0_SEL             70
>>> +#define CLKID_MALI_0_DIV             71
>>> +#define CLKID_MALI_0                 72
>>> +#define CLKID_MALI_1_SEL             73
>>> +#define CLKID_MALI_1_DIV             74
>>> +#define CLKID_MALI_1                 75
>>> +#define CLKID_MALI_SEL                       76
>>> +#define CLKID_VDEC_P0_SEL            77
>>> +#define CLKID_VDEC_P0_DIV            78
>>> +#define CLKID_VDEC_P0                        79
>>> +#define CLKID_VDEC_P1_SEL            80
>>> +#define CLKID_VDEC_P1_DIV            81
>>> +#define CLKID_VDEC_P1                        82
>>> +#define CLKID_VDEC_SEL                       83
>>> +#define CLKID_HEVCF_P0_SEL           84
>>> +#define CLKID_HEVCF_P0_DIV           85
>>> +#define CLKID_HEVCF_P0                       86
>>> +#define CLKID_HEVCF_P1_SEL           87
>>> +#define CLKID_HEVCF_P1_DIV           88
>>> +#define CLKID_HEVCF_P1                       89
>>> +#define CLKID_HEVCF_SEL                      90
>>> +#define CLKID_VPU_0_SEL                      91
>>> +#define CLKID_VPU_0_DIV                      92
>>> +#define CLKID_VPU_0                  93
>>> +#define CLKID_VPU_1_SEL                      94
>>> +#define CLKID_VPU_1_DIV                      95
>>> +#define CLKID_VPU_1                  96
>>> +#define CLKID_VPU                    97
>>> +#define CLKID_VPU_CLKB_TMP_SEL               98
>>> +#define CLKID_VPU_CLKB_TMP_DIV               99
>>> +#define CLKID_VPU_CLKB_TMP           100
>>> +#define CLKID_VPU_CLKB_DIV           101
>>> +#define CLKID_VPU_CLKB                       102
>>> +#define CLKID_VPU_CLKC_P0_SEL                103
>>> +#define CLKID_VPU_CLKC_P0_DIV                104
>>> +#define CLKID_VPU_CLKC_P0            105
>>> +#define CLKID_VPU_CLKC_P1_SEL                106
>>> +#define CLKID_VPU_CLKC_P1_DIV                107
>>> +#define CLKID_VPU_CLKC_P1            108
>>> +#define CLKID_VPU_CLKC_SEL           109
>>> +#define CLKID_VAPB_0_SEL             110
>>> +#define CLKID_VAPB_0_DIV             111
>>> +#define CLKID_VAPB_0                 112
>>> +#define CLKID_VAPB_1_SEL             113
>>> +#define CLKID_VAPB_1_DIV             114
>>> +#define CLKID_VAPB_1                 115
>>> +#define CLKID_VAPB                   116
>>> +#define CLKID_GE2D                   117
>>> +#define CLKID_VDIN_MEAS_SEL          118
>>> +#define CLKID_VDIN_MEAS_DIV          119
>>> +#define CLKID_VDIN_MEAS                      120
>>> +#define CLKID_SD_EMMC_C_CLK_SEL              121
>>> +#define CLKID_SD_EMMC_C_CLK_DIV              122
>>> +#define CLKID_SD_EMMC_C                      123
>>> +#define CLKID_SD_EMMC_A_CLK_SEL              124
>>> +#define CLKID_SD_EMMC_A_CLK_DIV              125
>>> +#define CLKID_SD_EMMC_A                      126
>>> +#define CLKID_SD_EMMC_B_CLK_SEL              127
>>> +#define CLKID_SD_EMMC_B_CLK_DIV              128
>>> +#define CLKID_SD_EMMC_B                      129
>>> +#define CLKID_SPICC0_SEL             130
>>> +#define CLKID_SPICC0_DIV             131
>>> +#define CLKID_SPICC0_EN                      132
>>> +#define CLKID_PWM_A_SEL                      133
>>> +#define CLKID_PWM_A_DIV                      134
>>> +#define CLKID_PWM_A                  135
>>> +#define CLKID_PWM_B_SEL                      136
>>> +#define CLKID_PWM_B_DIV                      137
>>> +#define CLKID_PWM_B                  138
>>> +#define CLKID_PWM_C_SEL                      139
>>> +#define CLKID_PWM_C_DIV                      140
>>> +#define CLKID_PWM_C                  141
>>> +#define CLKID_PWM_D_SEL                      142
>>> +#define CLKID_PWM_D_DIV                      143
>>> +#define CLKID_PWM_D                  144
>>> +#define CLKID_PWM_E_SEL                      145
>>> +#define CLKID_PWM_E_DIV                      146
>>> +#define CLKID_PWM_E                  147
>>> +#define CLKID_PWM_F_SEL                      148
>>> +#define CLKID_PWM_F_DIV                      149
>>> +#define CLKID_PWM_F                  150
>>> +#define CLKID_PWM_G_SEL                      151
>>> +#define CLKID_PWM_G_DIV                      152
>>> +#define CLKID_PWM_G                  153
>>> +#define CLKID_PWM_H_SEL                      154
>>> +#define CLKID_PWM_H_DIV                      155
>>> +#define CLKID_PWM_H                  156
>>> +#define CLKID_PWM_I_SEL                      157
>>> +#define CLKID_PWM_I_DIV                      158
>>> +#define CLKID_PWM_I                  159
>>> +#define CLKID_PWM_J_SEL                      160
>>> +#define CLKID_PWM_J_DIV                      161
>>> +#define CLKID_PWM_J                  162
>>> +#define CLKID_SARADC_SEL             163
>>> +#define CLKID_SARADC_DIV             164
>>> +#define CLKID_SARADC                 165
>>> +#define CLKID_GEN_SEL                        166
>>> +#define CLKID_GEN_DIV                        167
>>> +#define CLKID_GEN                    168
>>> +#define CLKID_DDR                    169
>>> +#define CLKID_DOS                    170
>>> +#define CLKID_ETHPHY                 171
>>> +#define CLKID_MALI                   172
>>> +#define CLKID_AOCPU                  173
>>> +#define CLKID_AUCPU                  174
>>> +#define CLKID_CEC                    175
>>> +#define CLKID_SDEMMC_A                       176
>>> +#define CLKID_SDEMMC_B                       177
>>> +#define CLKID_NAND                   178
>>> +#define CLKID_SMARTCARD                      179
>>> +#define CLKID_ACODEC                 180
>>> +#define CLKID_SPIFC                  181
>>> +#define CLKID_MSR                    182
>>> +#define CLKID_IR_CTRL                        183
>>> +#define CLKID_AUDIO                  184
>>> +#define CLKID_ETH                    185
>>> +#define CLKID_UART_A                 186
>>> +#define CLKID_UART_B                 187
>>> +#define CLKID_UART_C                 188
>>> +#define CLKID_UART_D                 189
>>> +#define CLKID_UART_E                 190
>>> +#define CLKID_AIFIFO                 191
>>> +#define CLKID_TS_DDR                 192
>>> +#define CLKID_TS_PLL                 193
>>> +#define CLKID_G2D                    194
>>> +#define CLKID_SPICC0                 195
>>> +#define CLKID_SPICC1                 196
>>> +#define CLKID_USB                    197
>>> +#define CLKID_I2C_M_A                        198
>>> +#define CLKID_I2C_M_B                        199
>>> +#define CLKID_I2C_M_C                        200
>>> +#define CLKID_I2C_M_D                        201
>>> +#define CLKID_I2C_M_E                        202
>>> +#define CLKID_HDMITX_APB             203
>>> +#define CLKID_I2C_S_A                        204
>>> +#define CLKID_USB1_TO_DDR            205
>>> +#define CLKID_HDCP22                 206
>>> +#define CLKID_MMC_APB                        207
>>> +#define CLKID_RSA                    208
>>> +#define CLKID_CPU_DEBUG                      209
>>> +#define CLKID_VPU_INTR                       210
>>> +#define CLKID_DEMOD                  211
>>> +#define CLKID_SAR_ADC                        212
>>> +#define CLKID_GIC                    213
>>> +#define CLKID_PWM_AB                 214
>>> +#define CLKID_PWM_CD                 215
>>> +#define CLKID_PWM_EF                 216
>>> +#define CLKID_PWM_GH                 217
>>> +#define CLKID_PWM_IJ                 218
>>> +#define CLKID_HDCP22_ESMCLK_SEL              219
>>> +#define CLKID_HDCP22_ESMCLK_DIV              220
>>> +#define CLKID_HDCP22_ESMCLK          221
>>> +#define CLKID_HDCP22_SKPCLK_SEL              222
>>> +#define CLKID_HDCP22_SKPCLK_DIV              223
>>> +#define CLKID_HDCP22_SKPCLK          224
>>> +
>>> +#endif /* _DT_BINDINGS_CLOCK_AMLOGIC_S4_PERIPHERALS_CLKC_H */
>> 

