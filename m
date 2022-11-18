Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F032462FA33
	for <lists+linux-clk@lfdr.de>; Fri, 18 Nov 2022 17:27:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241762AbiKRQ1B (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 18 Nov 2022 11:27:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241981AbiKRQ0x (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 Nov 2022 11:26:53 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 374DC93713
        for <linux-clk@vger.kernel.org>; Fri, 18 Nov 2022 08:26:49 -0800 (PST)
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4C2A73F12E
        for <linux-clk@vger.kernel.org>; Fri, 18 Nov 2022 16:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1668788806;
        bh=WO4tBuSWjjoWRPSNI7lpKyXM7w9H5SjWWDHcK58XOjI=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=hgnmexVszDGVb2Sqy5p556xgnII+APx0lIgPLIu5pNI/SConm1kx3gH3BkZdCV2/L
         t/VzfVGIq/whk/QmYj/xHQNlFy7TmRBOwNyd9ORMOurtweEaADoDJhlchFl54kdoTy
         /f1nrkBDG0fyEo5QSfFUo/QAiE3khIPcyuflZV7U5/Fb5h/Gv/KWBGhmEoHx2NrANq
         m4NrtPDZYzGGOFajVXExxr1cS86Yo/fUmWfyTHjUvc6sxE5uRlO3hZUj3HasIFM5SX
         oox31TU/Mg97N9eb35aZoQke6V/w/mzYGkR/P7JQbM7/4mYJI75rfKU5PjmUTtF56+
         BvPnL4DvaMpwQ==
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-3985077640fso6305737b3.4
        for <linux-clk@vger.kernel.org>; Fri, 18 Nov 2022 08:26:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WO4tBuSWjjoWRPSNI7lpKyXM7w9H5SjWWDHcK58XOjI=;
        b=aBexk5Burk6kEBv1Fq3Fk/hAJoMEWyoZE8GIW1COmjdMBVp2tnt+NpSFvY9igaDFzf
         Ab1W0QgiVipCv0LJ8LTyfkkb+JujDug4y48NgOf//vIPNhFMugfKHPG/17rqFUa0X+jH
         J8zk9L2mwbRzItP5PWhoIEoKJyVQKrQEPIkY1TtbeFTOEwT82oIRJOXrOZ6cOti+Bfcm
         s4/qF8sa24rjHPCAzNqWAaAwGbDgx2Y738+WyFiWxLnsAW14KOQ9k6MJ+7NfXiXryOwt
         OGDOX4cWzxPb/+5py9gXFam7F2f/raNE9vxhFt/oEvRcRBLQPBUdhIJ+yzxOiyyEk9IT
         mOgQ==
X-Gm-Message-State: ANoB5plBvlTOOEQPQjxtNqXDrSkSXnr62GXYNxYM1+tvKeJN161TDatf
        ibJkaQmDxfcwszebErK0PbZWM784fzMcW2k3QnVVn4PXc1bwPVVLan+PwH2gP0oPivJepueXm1E
        b6elyKFdpgPp/ifGOk0dyOrtMTpvZKg0IVEXzz/dqkwJj33sTlzeU4w==
X-Received: by 2002:a81:9a0b:0:b0:370:2d3:c361 with SMTP id r11-20020a819a0b000000b0037002d3c361mr7078150ywg.251.1668788804415;
        Fri, 18 Nov 2022 08:26:44 -0800 (PST)
X-Google-Smtp-Source: AA0mqf46sEPTE3iDDmTm5TWZX5h018ZnItVUQEHNKmVHA9Jd30B+OoCrl6T+qpowaMeL2OHL2u23G07vjtKinEkzbI0=
X-Received: by 2002:a81:9a0b:0:b0:370:2d3:c361 with SMTP id
 r11-20020a819a0b000000b0037002d3c361mr7078102ywg.251.1668788803703; Fri, 18
 Nov 2022 08:26:43 -0800 (PST)
MIME-Version: 1.0
References: <20221118010627.70576-1-hal.feng@starfivetech.com> <20221118010627.70576-3-hal.feng@starfivetech.com>
In-Reply-To: <20221118010627.70576-3-hal.feng@starfivetech.com>
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date:   Fri, 18 Nov 2022 17:26:27 +0100
Message-ID: <CAJM55Z-Zftr29oGzeBFzOKuGixABSJEzPF-R2c0U9Pg5qDcRCQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/14] clk: starfive: Rename "jh7100" to "jh71x0" for
 the common code
To:     Hal Feng <hal.feng@starfivetech.com>
Cc:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, Conor Dooley <conor@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75 autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 18 Nov 2022 at 02:06, Hal Feng <hal.feng@starfivetech.com> wrote:
>
> Rename "clk-starfive-jh7100.h" to "clk-starfive-jh71x0.h" and rename
> some variables from "jh7100" or "JH7100" to "jh71x0" or "JH71X0".
>
> Co-developed-by: Emil Renner Berthing <kernel@esmil.dk>

The patch is fine, but I'm a little unsure about this Co-developed-by.
This patch is taken directly from my jh7110 branch so does Hal sending
it count as co-developed-by?

> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../clk/starfive/clk-starfive-jh7100-audio.c  |  74 ++--
>  drivers/clk/starfive/clk-starfive-jh7100.c    | 388 +++++++++---------
>  drivers/clk/starfive/clk-starfive-jh7100.h    | 114 -----
>  drivers/clk/starfive/clk-starfive-jh71x0.c    | 284 ++++++-------
>  drivers/clk/starfive/clk-starfive-jh71x0.h    | 114 +++++
>  5 files changed, 487 insertions(+), 487 deletions(-)
>  delete mode 100644 drivers/clk/starfive/clk-starfive-jh7100.h
>  create mode 100644 drivers/clk/starfive/clk-starfive-jh71x0.h
>
> diff --git a/drivers/clk/starfive/clk-starfive-jh7100-audio.c b/drivers/clk/starfive/clk-starfive-jh7100-audio.c
> index 8473a65e219b..02aefb7264f8 100644
> --- a/drivers/clk/starfive/clk-starfive-jh7100-audio.c
> +++ b/drivers/clk/starfive/clk-starfive-jh7100-audio.c
> @@ -16,7 +16,7 @@
>
>  #include <dt-bindings/clock/starfive-jh7100-audio.h>
>
> -#include "clk-starfive-jh7100.h"
> +#include "clk-starfive-jh71x0.h"
>
>  /* external clocks */
>  #define JH7100_AUDCLK_AUDIO_SRC                        (JH7100_AUDCLK_END + 0)
> @@ -28,66 +28,66 @@
>  #define JH7100_AUDCLK_I2SDAC_LRCLK_IOPAD       (JH7100_AUDCLK_END + 6)
>  #define JH7100_AUDCLK_VAD_INTMEM                (JH7100_AUDCLK_END + 7)
>
> -static const struct jh7100_clk_data jh7100_audclk_data[] = {
> -       JH7100__GMD(JH7100_AUDCLK_ADC_MCLK, "adc_mclk", 0, 15, 2,
> +static const struct jh71x0_clk_data jh7100_audclk_data[] = {
> +       JH71X0__GMD(JH7100_AUDCLK_ADC_MCLK, "adc_mclk", 0, 15, 2,
>                     JH7100_AUDCLK_AUDIO_SRC,
>                     JH7100_AUDCLK_AUDIO_12288),
> -       JH7100__GMD(JH7100_AUDCLK_I2S1_MCLK, "i2s1_mclk", 0, 15, 2,
> +       JH71X0__GMD(JH7100_AUDCLK_I2S1_MCLK, "i2s1_mclk", 0, 15, 2,
>                     JH7100_AUDCLK_AUDIO_SRC,
>                     JH7100_AUDCLK_AUDIO_12288),
> -       JH7100_GATE(JH7100_AUDCLK_I2SADC_APB, "i2sadc_apb", 0, JH7100_AUDCLK_APB0_BUS),
> -       JH7100_MDIV(JH7100_AUDCLK_I2SADC_BCLK, "i2sadc_bclk", 31, 2,
> +       JH71X0_GATE(JH7100_AUDCLK_I2SADC_APB, "i2sadc_apb", 0, JH7100_AUDCLK_APB0_BUS),
> +       JH71X0_MDIV(JH7100_AUDCLK_I2SADC_BCLK, "i2sadc_bclk", 31, 2,
>                     JH7100_AUDCLK_ADC_MCLK,
>                     JH7100_AUDCLK_I2SADC_BCLK_IOPAD),
> -       JH7100__INV(JH7100_AUDCLK_I2SADC_BCLK_N, "i2sadc_bclk_n", JH7100_AUDCLK_I2SADC_BCLK),
> -       JH7100_MDIV(JH7100_AUDCLK_I2SADC_LRCLK, "i2sadc_lrclk", 63, 3,
> +       JH71X0__INV(JH7100_AUDCLK_I2SADC_BCLK_N, "i2sadc_bclk_n", JH7100_AUDCLK_I2SADC_BCLK),
> +       JH71X0_MDIV(JH7100_AUDCLK_I2SADC_LRCLK, "i2sadc_lrclk", 63, 3,
>                     JH7100_AUDCLK_I2SADC_BCLK_N,
>                     JH7100_AUDCLK_I2SADC_LRCLK_IOPAD,
>                     JH7100_AUDCLK_I2SADC_BCLK),
> -       JH7100_GATE(JH7100_AUDCLK_PDM_APB, "pdm_apb", 0, JH7100_AUDCLK_APB0_BUS),
> -       JH7100__GMD(JH7100_AUDCLK_PDM_MCLK, "pdm_mclk", 0, 15, 2,
> +       JH71X0_GATE(JH7100_AUDCLK_PDM_APB, "pdm_apb", 0, JH7100_AUDCLK_APB0_BUS),
> +       JH71X0__GMD(JH7100_AUDCLK_PDM_MCLK, "pdm_mclk", 0, 15, 2,
>                     JH7100_AUDCLK_AUDIO_SRC,
>                     JH7100_AUDCLK_AUDIO_12288),
> -       JH7100_GATE(JH7100_AUDCLK_I2SVAD_APB, "i2svad_apb", 0, JH7100_AUDCLK_APB0_BUS),
> -       JH7100__GMD(JH7100_AUDCLK_SPDIF, "spdif", 0, 15, 2,
> +       JH71X0_GATE(JH7100_AUDCLK_I2SVAD_APB, "i2svad_apb", 0, JH7100_AUDCLK_APB0_BUS),
> +       JH71X0__GMD(JH7100_AUDCLK_SPDIF, "spdif", 0, 15, 2,
>                     JH7100_AUDCLK_AUDIO_SRC,
>                     JH7100_AUDCLK_AUDIO_12288),
> -       JH7100_GATE(JH7100_AUDCLK_SPDIF_APB, "spdif_apb", 0, JH7100_AUDCLK_APB0_BUS),
> -       JH7100_GATE(JH7100_AUDCLK_PWMDAC_APB, "pwmdac_apb", 0, JH7100_AUDCLK_APB0_BUS),
> -       JH7100__GMD(JH7100_AUDCLK_DAC_MCLK, "dac_mclk", 0, 15, 2,
> +       JH71X0_GATE(JH7100_AUDCLK_SPDIF_APB, "spdif_apb", 0, JH7100_AUDCLK_APB0_BUS),
> +       JH71X0_GATE(JH7100_AUDCLK_PWMDAC_APB, "pwmdac_apb", 0, JH7100_AUDCLK_APB0_BUS),
> +       JH71X0__GMD(JH7100_AUDCLK_DAC_MCLK, "dac_mclk", 0, 15, 2,
>                     JH7100_AUDCLK_AUDIO_SRC,
>                     JH7100_AUDCLK_AUDIO_12288),
> -       JH7100_GATE(JH7100_AUDCLK_I2SDAC_APB, "i2sdac_apb", 0, JH7100_AUDCLK_APB0_BUS),
> -       JH7100_MDIV(JH7100_AUDCLK_I2SDAC_BCLK, "i2sdac_bclk", 31, 2,
> +       JH71X0_GATE(JH7100_AUDCLK_I2SDAC_APB, "i2sdac_apb", 0, JH7100_AUDCLK_APB0_BUS),
> +       JH71X0_MDIV(JH7100_AUDCLK_I2SDAC_BCLK, "i2sdac_bclk", 31, 2,
>                     JH7100_AUDCLK_DAC_MCLK,
>                     JH7100_AUDCLK_I2SDAC_BCLK_IOPAD),
> -       JH7100__INV(JH7100_AUDCLK_I2SDAC_BCLK_N, "i2sdac_bclk_n", JH7100_AUDCLK_I2SDAC_BCLK),
> -       JH7100_MDIV(JH7100_AUDCLK_I2SDAC_LRCLK, "i2sdac_lrclk", 31, 2,
> +       JH71X0__INV(JH7100_AUDCLK_I2SDAC_BCLK_N, "i2sdac_bclk_n", JH7100_AUDCLK_I2SDAC_BCLK),
> +       JH71X0_MDIV(JH7100_AUDCLK_I2SDAC_LRCLK, "i2sdac_lrclk", 31, 2,
>                     JH7100_AUDCLK_I2S1_MCLK,
>                     JH7100_AUDCLK_I2SDAC_BCLK_IOPAD),
> -       JH7100_GATE(JH7100_AUDCLK_I2S1_APB, "i2s1_apb", 0, JH7100_AUDCLK_APB0_BUS),
> -       JH7100_MDIV(JH7100_AUDCLK_I2S1_BCLK, "i2s1_bclk", 31, 2,
> +       JH71X0_GATE(JH7100_AUDCLK_I2S1_APB, "i2s1_apb", 0, JH7100_AUDCLK_APB0_BUS),
> +       JH71X0_MDIV(JH7100_AUDCLK_I2S1_BCLK, "i2s1_bclk", 31, 2,
>                     JH7100_AUDCLK_I2S1_MCLK,
>                     JH7100_AUDCLK_I2SDAC_BCLK_IOPAD),
> -       JH7100__INV(JH7100_AUDCLK_I2S1_BCLK_N, "i2s1_bclk_n", JH7100_AUDCLK_I2S1_BCLK),
> -       JH7100_MDIV(JH7100_AUDCLK_I2S1_LRCLK, "i2s1_lrclk", 63, 3,
> +       JH71X0__INV(JH7100_AUDCLK_I2S1_BCLK_N, "i2s1_bclk_n", JH7100_AUDCLK_I2S1_BCLK),
> +       JH71X0_MDIV(JH7100_AUDCLK_I2S1_LRCLK, "i2s1_lrclk", 63, 3,
>                     JH7100_AUDCLK_I2S1_BCLK_N,
>                     JH7100_AUDCLK_I2SDAC_LRCLK_IOPAD),
> -       JH7100_GATE(JH7100_AUDCLK_I2SDAC16K_APB, "i2s1dac16k_apb", 0, JH7100_AUDCLK_APB0_BUS),
> -       JH7100__DIV(JH7100_AUDCLK_APB0_BUS, "apb0_bus", 8, JH7100_AUDCLK_DOM7AHB_BUS),
> -       JH7100_GATE(JH7100_AUDCLK_DMA1P_AHB, "dma1p_ahb", 0, JH7100_AUDCLK_DOM7AHB_BUS),
> -       JH7100_GATE(JH7100_AUDCLK_USB_APB, "usb_apb", CLK_IGNORE_UNUSED, JH7100_AUDCLK_APB_EN),
> -       JH7100_GDIV(JH7100_AUDCLK_USB_LPM, "usb_lpm", CLK_IGNORE_UNUSED, 4, JH7100_AUDCLK_USB_APB),
> -       JH7100_GDIV(JH7100_AUDCLK_USB_STB, "usb_stb", CLK_IGNORE_UNUSED, 3, JH7100_AUDCLK_USB_APB),
> -       JH7100__DIV(JH7100_AUDCLK_APB_EN, "apb_en", 8, JH7100_AUDCLK_DOM7AHB_BUS),
> -       JH7100__MUX(JH7100_AUDCLK_VAD_MEM, "vad_mem", 2,
> +       JH71X0_GATE(JH7100_AUDCLK_I2SDAC16K_APB, "i2s1dac16k_apb", 0, JH7100_AUDCLK_APB0_BUS),
> +       JH71X0__DIV(JH7100_AUDCLK_APB0_BUS, "apb0_bus", 8, JH7100_AUDCLK_DOM7AHB_BUS),
> +       JH71X0_GATE(JH7100_AUDCLK_DMA1P_AHB, "dma1p_ahb", 0, JH7100_AUDCLK_DOM7AHB_BUS),
> +       JH71X0_GATE(JH7100_AUDCLK_USB_APB, "usb_apb", CLK_IGNORE_UNUSED, JH7100_AUDCLK_APB_EN),
> +       JH71X0_GDIV(JH7100_AUDCLK_USB_LPM, "usb_lpm", CLK_IGNORE_UNUSED, 4, JH7100_AUDCLK_USB_APB),
> +       JH71X0_GDIV(JH7100_AUDCLK_USB_STB, "usb_stb", CLK_IGNORE_UNUSED, 3, JH7100_AUDCLK_USB_APB),
> +       JH71X0__DIV(JH7100_AUDCLK_APB_EN, "apb_en", 8, JH7100_AUDCLK_DOM7AHB_BUS),
> +       JH71X0__MUX(JH7100_AUDCLK_VAD_MEM, "vad_mem", 2,
>                     JH7100_AUDCLK_VAD_INTMEM,
>                     JH7100_AUDCLK_AUDIO_12288),
>  };
>
>  static struct clk_hw *jh7100_audclk_get(struct of_phandle_args *clkspec, void *data)
>  {
> -       struct jh7100_clk_priv *priv = data;
> +       struct jh71x0_clk_priv *priv = data;
>         unsigned int idx = clkspec->args[0];
>
>         if (idx < JH7100_AUDCLK_END)
> @@ -98,7 +98,7 @@ static struct clk_hw *jh7100_audclk_get(struct of_phandle_args *clkspec, void *d
>
>  static int jh7100_audclk_probe(struct platform_device *pdev)
>  {
> -       struct jh7100_clk_priv *priv;
> +       struct jh71x0_clk_priv *priv;
>         unsigned int idx;
>         int ret;
>
> @@ -117,12 +117,12 @@ static int jh7100_audclk_probe(struct platform_device *pdev)
>                 struct clk_parent_data parents[4] = {};
>                 struct clk_init_data init = {
>                         .name = jh7100_audclk_data[idx].name,
> -                       .ops = starfive_jh7100_clk_ops(max),
> +                       .ops = starfive_jh71x0_clk_ops(max),
>                         .parent_data = parents,
> -                       .num_parents = ((max & JH7100_CLK_MUX_MASK) >> JH7100_CLK_MUX_SHIFT) + 1,
> +                       .num_parents = ((max & JH71X0_CLK_MUX_MASK) >> JH71X0_CLK_MUX_SHIFT) + 1,
>                         .flags = jh7100_audclk_data[idx].flags,
>                 };
> -               struct jh7100_clk *clk = &priv->reg[idx];
> +               struct jh71x0_clk *clk = &priv->reg[idx];
>                 unsigned int i;
>
>                 for (i = 0; i < init.num_parents; i++) {
> @@ -140,7 +140,7 @@ static int jh7100_audclk_probe(struct platform_device *pdev)
>
>                 clk->hw.init = &init;
>                 clk->idx = idx;
> -               clk->max_div = max & JH7100_CLK_DIV_MASK;
> +               clk->max_div = max & JH71X0_CLK_DIV_MASK;
>
>                 ret = devm_clk_hw_register(priv->dev, &clk->hw);
>                 if (ret)
> diff --git a/drivers/clk/starfive/clk-starfive-jh7100.c b/drivers/clk/starfive/clk-starfive-jh7100.c
> index eea52f16af0d..bcc9acdd5936 100644
> --- a/drivers/clk/starfive/clk-starfive-jh7100.c
> +++ b/drivers/clk/starfive/clk-starfive-jh7100.c
> @@ -15,7 +15,7 @@
>
>  #include <dt-bindings/clock/starfive-jh7100.h>
>
> -#include "clk-starfive-jh7100.h"
> +#include "clk-starfive-jh71x0.h"
>
>  /* external clocks */
>  #define JH7100_CLK_OSC_SYS             (JH7100_CLK_END + 0)
> @@ -23,250 +23,250 @@
>  #define JH7100_CLK_GMAC_RMII_REF       (JH7100_CLK_END + 2)
>  #define JH7100_CLK_GMAC_GR_MII_RX      (JH7100_CLK_END + 3)
>
> -static const struct jh7100_clk_data jh7100_clk_data[] __initconst = {
> -       JH7100__MUX(JH7100_CLK_CPUNDBUS_ROOT, "cpundbus_root", 4,
> +static const struct jh71x0_clk_data jh7100_clk_data[] __initconst = {
> +       JH71X0__MUX(JH7100_CLK_CPUNDBUS_ROOT, "cpundbus_root", 4,
>                     JH7100_CLK_OSC_SYS,
>                     JH7100_CLK_PLL0_OUT,
>                     JH7100_CLK_PLL1_OUT,
>                     JH7100_CLK_PLL2_OUT),
> -       JH7100__MUX(JH7100_CLK_DLA_ROOT, "dla_root", 3,
> +       JH71X0__MUX(JH7100_CLK_DLA_ROOT, "dla_root", 3,
>                     JH7100_CLK_OSC_SYS,
>                     JH7100_CLK_PLL1_OUT,
>                     JH7100_CLK_PLL2_OUT),
> -       JH7100__MUX(JH7100_CLK_DSP_ROOT, "dsp_root", 4,
> +       JH71X0__MUX(JH7100_CLK_DSP_ROOT, "dsp_root", 4,
>                     JH7100_CLK_OSC_SYS,
>                     JH7100_CLK_PLL0_OUT,
>                     JH7100_CLK_PLL1_OUT,
>                     JH7100_CLK_PLL2_OUT),
> -       JH7100__MUX(JH7100_CLK_GMACUSB_ROOT, "gmacusb_root", 3,
> +       JH71X0__MUX(JH7100_CLK_GMACUSB_ROOT, "gmacusb_root", 3,
>                     JH7100_CLK_OSC_SYS,
>                     JH7100_CLK_PLL0_OUT,
>                     JH7100_CLK_PLL2_OUT),
> -       JH7100__MUX(JH7100_CLK_PERH0_ROOT, "perh0_root", 2,
> +       JH71X0__MUX(JH7100_CLK_PERH0_ROOT, "perh0_root", 2,
>                     JH7100_CLK_OSC_SYS,
>                     JH7100_CLK_PLL0_OUT),
> -       JH7100__MUX(JH7100_CLK_PERH1_ROOT, "perh1_root", 2,
> +       JH71X0__MUX(JH7100_CLK_PERH1_ROOT, "perh1_root", 2,
>                     JH7100_CLK_OSC_SYS,
>                     JH7100_CLK_PLL2_OUT),
> -       JH7100__MUX(JH7100_CLK_VIN_ROOT, "vin_root", 3,
> +       JH71X0__MUX(JH7100_CLK_VIN_ROOT, "vin_root", 3,
>                     JH7100_CLK_OSC_SYS,
>                     JH7100_CLK_PLL1_OUT,
>                     JH7100_CLK_PLL2_OUT),
> -       JH7100__MUX(JH7100_CLK_VOUT_ROOT, "vout_root", 3,
> +       JH71X0__MUX(JH7100_CLK_VOUT_ROOT, "vout_root", 3,
>                     JH7100_CLK_OSC_AUD,
>                     JH7100_CLK_PLL0_OUT,
>                     JH7100_CLK_PLL2_OUT),
> -       JH7100_GDIV(JH7100_CLK_AUDIO_ROOT, "audio_root", 0, 8, JH7100_CLK_PLL0_OUT),
> -       JH7100__MUX(JH7100_CLK_CDECHIFI4_ROOT, "cdechifi4_root", 3,
> +       JH71X0_GDIV(JH7100_CLK_AUDIO_ROOT, "audio_root", 0, 8, JH7100_CLK_PLL0_OUT),
> +       JH71X0__MUX(JH7100_CLK_CDECHIFI4_ROOT, "cdechifi4_root", 3,
>                     JH7100_CLK_OSC_SYS,
>                     JH7100_CLK_PLL1_OUT,
>                     JH7100_CLK_PLL2_OUT),
> -       JH7100__MUX(JH7100_CLK_CDEC_ROOT, "cdec_root", 3,
> +       JH71X0__MUX(JH7100_CLK_CDEC_ROOT, "cdec_root", 3,
>                     JH7100_CLK_OSC_SYS,
>                     JH7100_CLK_PLL0_OUT,
>                     JH7100_CLK_PLL1_OUT),
> -       JH7100__MUX(JH7100_CLK_VOUTBUS_ROOT, "voutbus_root", 3,
> +       JH71X0__MUX(JH7100_CLK_VOUTBUS_ROOT, "voutbus_root", 3,
>                     JH7100_CLK_OSC_AUD,
>                     JH7100_CLK_PLL0_OUT,
>                     JH7100_CLK_PLL2_OUT),
> -       JH7100__DIV(JH7100_CLK_CPUNBUS_ROOT_DIV, "cpunbus_root_div", 2, JH7100_CLK_CPUNDBUS_ROOT),
> -       JH7100__DIV(JH7100_CLK_DSP_ROOT_DIV, "dsp_root_div", 4, JH7100_CLK_DSP_ROOT),
> -       JH7100__DIV(JH7100_CLK_PERH0_SRC, "perh0_src", 4, JH7100_CLK_PERH0_ROOT),
> -       JH7100__DIV(JH7100_CLK_PERH1_SRC, "perh1_src", 4, JH7100_CLK_PERH1_ROOT),
> -       JH7100_GDIV(JH7100_CLK_PLL0_TESTOUT, "pll0_testout", 0, 31, JH7100_CLK_PERH0_SRC),
> -       JH7100_GDIV(JH7100_CLK_PLL1_TESTOUT, "pll1_testout", 0, 31, JH7100_CLK_DLA_ROOT),
> -       JH7100_GDIV(JH7100_CLK_PLL2_TESTOUT, "pll2_testout", 0, 31, JH7100_CLK_PERH1_SRC),
> -       JH7100__MUX(JH7100_CLK_PLL2_REF, "pll2_refclk", 2,
> +       JH71X0__DIV(JH7100_CLK_CPUNBUS_ROOT_DIV, "cpunbus_root_div", 2, JH7100_CLK_CPUNDBUS_ROOT),
> +       JH71X0__DIV(JH7100_CLK_DSP_ROOT_DIV, "dsp_root_div", 4, JH7100_CLK_DSP_ROOT),
> +       JH71X0__DIV(JH7100_CLK_PERH0_SRC, "perh0_src", 4, JH7100_CLK_PERH0_ROOT),
> +       JH71X0__DIV(JH7100_CLK_PERH1_SRC, "perh1_src", 4, JH7100_CLK_PERH1_ROOT),
> +       JH71X0_GDIV(JH7100_CLK_PLL0_TESTOUT, "pll0_testout", 0, 31, JH7100_CLK_PERH0_SRC),
> +       JH71X0_GDIV(JH7100_CLK_PLL1_TESTOUT, "pll1_testout", 0, 31, JH7100_CLK_DLA_ROOT),
> +       JH71X0_GDIV(JH7100_CLK_PLL2_TESTOUT, "pll2_testout", 0, 31, JH7100_CLK_PERH1_SRC),
> +       JH71X0__MUX(JH7100_CLK_PLL2_REF, "pll2_refclk", 2,
>                     JH7100_CLK_OSC_SYS,
>                     JH7100_CLK_OSC_AUD),
> -       JH7100__DIV(JH7100_CLK_CPU_CORE, "cpu_core", 8, JH7100_CLK_CPUNBUS_ROOT_DIV),
> -       JH7100__DIV(JH7100_CLK_CPU_AXI, "cpu_axi", 8, JH7100_CLK_CPU_CORE),
> -       JH7100__DIV(JH7100_CLK_AHB_BUS, "ahb_bus", 8, JH7100_CLK_CPUNBUS_ROOT_DIV),
> -       JH7100__DIV(JH7100_CLK_APB1_BUS, "apb1_bus", 8, JH7100_CLK_AHB_BUS),
> -       JH7100__DIV(JH7100_CLK_APB2_BUS, "apb2_bus", 8, JH7100_CLK_AHB_BUS),
> -       JH7100_GATE(JH7100_CLK_DOM3AHB_BUS, "dom3ahb_bus", CLK_IS_CRITICAL, JH7100_CLK_AHB_BUS),
> -       JH7100_GATE(JH7100_CLK_DOM7AHB_BUS, "dom7ahb_bus", CLK_IS_CRITICAL, JH7100_CLK_AHB_BUS),
> -       JH7100_GATE(JH7100_CLK_U74_CORE0, "u74_core0", CLK_IS_CRITICAL, JH7100_CLK_CPU_CORE),
> -       JH7100_GDIV(JH7100_CLK_U74_CORE1, "u74_core1", CLK_IS_CRITICAL, 8, JH7100_CLK_CPU_CORE),
> -       JH7100_GATE(JH7100_CLK_U74_AXI, "u74_axi", CLK_IS_CRITICAL, JH7100_CLK_CPU_AXI),
> -       JH7100_GATE(JH7100_CLK_U74RTC_TOGGLE, "u74rtc_toggle", CLK_IS_CRITICAL, JH7100_CLK_OSC_SYS),
> -       JH7100_GATE(JH7100_CLK_SGDMA2P_AXI, "sgdma2p_axi", 0, JH7100_CLK_CPU_AXI),
> -       JH7100_GATE(JH7100_CLK_DMA2PNOC_AXI, "dma2pnoc_axi", 0, JH7100_CLK_CPU_AXI),
> -       JH7100_GATE(JH7100_CLK_SGDMA2P_AHB, "sgdma2p_ahb", 0, JH7100_CLK_AHB_BUS),
> -       JH7100__DIV(JH7100_CLK_DLA_BUS, "dla_bus", 4, JH7100_CLK_DLA_ROOT),
> -       JH7100_GATE(JH7100_CLK_DLA_AXI, "dla_axi", 0, JH7100_CLK_DLA_BUS),
> -       JH7100_GATE(JH7100_CLK_DLANOC_AXI, "dlanoc_axi", 0, JH7100_CLK_DLA_BUS),
> -       JH7100_GATE(JH7100_CLK_DLA_APB, "dla_apb", 0, JH7100_CLK_APB1_BUS),
> -       JH7100_GDIV(JH7100_CLK_VP6_CORE, "vp6_core", 0, 4, JH7100_CLK_DSP_ROOT_DIV),
> -       JH7100__DIV(JH7100_CLK_VP6BUS_SRC, "vp6bus_src", 4, JH7100_CLK_DSP_ROOT),
> -       JH7100_GDIV(JH7100_CLK_VP6_AXI, "vp6_axi", 0, 4, JH7100_CLK_VP6BUS_SRC),
> -       JH7100__DIV(JH7100_CLK_VCDECBUS_SRC, "vcdecbus_src", 4, JH7100_CLK_CDECHIFI4_ROOT),
> -       JH7100__DIV(JH7100_CLK_VDEC_BUS, "vdec_bus", 8, JH7100_CLK_VCDECBUS_SRC),
> -       JH7100_GATE(JH7100_CLK_VDEC_AXI, "vdec_axi", 0, JH7100_CLK_VDEC_BUS),
> -       JH7100_GATE(JH7100_CLK_VDECBRG_MAIN, "vdecbrg_mainclk", 0, JH7100_CLK_VDEC_BUS),
> -       JH7100_GDIV(JH7100_CLK_VDEC_BCLK, "vdec_bclk", 0, 8, JH7100_CLK_VCDECBUS_SRC),
> -       JH7100_GDIV(JH7100_CLK_VDEC_CCLK, "vdec_cclk", 0, 8, JH7100_CLK_CDEC_ROOT),
> -       JH7100_GATE(JH7100_CLK_VDEC_APB, "vdec_apb", 0, JH7100_CLK_APB1_BUS),
> -       JH7100_GDIV(JH7100_CLK_JPEG_AXI, "jpeg_axi", 0, 8, JH7100_CLK_CPUNBUS_ROOT_DIV),
> -       JH7100_GDIV(JH7100_CLK_JPEG_CCLK, "jpeg_cclk", 0, 8, JH7100_CLK_CPUNBUS_ROOT_DIV),
> -       JH7100_GATE(JH7100_CLK_JPEG_APB, "jpeg_apb", 0, JH7100_CLK_APB1_BUS),
> -       JH7100_GDIV(JH7100_CLK_GC300_2X, "gc300_2x", 0, 8, JH7100_CLK_CDECHIFI4_ROOT),
> -       JH7100_GATE(JH7100_CLK_GC300_AHB, "gc300_ahb", 0, JH7100_CLK_AHB_BUS),
> -       JH7100__DIV(JH7100_CLK_JPCGC300_AXIBUS, "jpcgc300_axibus", 8, JH7100_CLK_VCDECBUS_SRC),
> -       JH7100_GATE(JH7100_CLK_GC300_AXI, "gc300_axi", 0, JH7100_CLK_JPCGC300_AXIBUS),
> -       JH7100_GATE(JH7100_CLK_JPCGC300_MAIN, "jpcgc300_mainclk", 0, JH7100_CLK_JPCGC300_AXIBUS),
> -       JH7100__DIV(JH7100_CLK_VENC_BUS, "venc_bus", 8, JH7100_CLK_VCDECBUS_SRC),
> -       JH7100_GATE(JH7100_CLK_VENC_AXI, "venc_axi", 0, JH7100_CLK_VENC_BUS),
> -       JH7100_GATE(JH7100_CLK_VENCBRG_MAIN, "vencbrg_mainclk", 0, JH7100_CLK_VENC_BUS),
> -       JH7100_GDIV(JH7100_CLK_VENC_BCLK, "venc_bclk", 0, 8, JH7100_CLK_VCDECBUS_SRC),
> -       JH7100_GDIV(JH7100_CLK_VENC_CCLK, "venc_cclk", 0, 8, JH7100_CLK_CDEC_ROOT),
> -       JH7100_GATE(JH7100_CLK_VENC_APB, "venc_apb", 0, JH7100_CLK_APB1_BUS),
> -       JH7100_GDIV(JH7100_CLK_DDRPLL_DIV2, "ddrpll_div2", CLK_IS_CRITICAL, 2, JH7100_CLK_PLL1_OUT),
> -       JH7100_GDIV(JH7100_CLK_DDRPLL_DIV4, "ddrpll_div4", CLK_IS_CRITICAL, 2, JH7100_CLK_DDRPLL_DIV2),
> -       JH7100_GDIV(JH7100_CLK_DDRPLL_DIV8, "ddrpll_div8", CLK_IS_CRITICAL, 2, JH7100_CLK_DDRPLL_DIV4),
> -       JH7100_GDIV(JH7100_CLK_DDROSC_DIV2, "ddrosc_div2", CLK_IS_CRITICAL, 2, JH7100_CLK_OSC_SYS),
> -       JH7100_GMUX(JH7100_CLK_DDRC0, "ddrc0", CLK_IS_CRITICAL, 4,
> +       JH71X0__DIV(JH7100_CLK_CPU_CORE, "cpu_core", 8, JH7100_CLK_CPUNBUS_ROOT_DIV),
> +       JH71X0__DIV(JH7100_CLK_CPU_AXI, "cpu_axi", 8, JH7100_CLK_CPU_CORE),
> +       JH71X0__DIV(JH7100_CLK_AHB_BUS, "ahb_bus", 8, JH7100_CLK_CPUNBUS_ROOT_DIV),
> +       JH71X0__DIV(JH7100_CLK_APB1_BUS, "apb1_bus", 8, JH7100_CLK_AHB_BUS),
> +       JH71X0__DIV(JH7100_CLK_APB2_BUS, "apb2_bus", 8, JH7100_CLK_AHB_BUS),
> +       JH71X0_GATE(JH7100_CLK_DOM3AHB_BUS, "dom3ahb_bus", CLK_IS_CRITICAL, JH7100_CLK_AHB_BUS),
> +       JH71X0_GATE(JH7100_CLK_DOM7AHB_BUS, "dom7ahb_bus", CLK_IS_CRITICAL, JH7100_CLK_AHB_BUS),
> +       JH71X0_GATE(JH7100_CLK_U74_CORE0, "u74_core0", CLK_IS_CRITICAL, JH7100_CLK_CPU_CORE),
> +       JH71X0_GDIV(JH7100_CLK_U74_CORE1, "u74_core1", CLK_IS_CRITICAL, 8, JH7100_CLK_CPU_CORE),
> +       JH71X0_GATE(JH7100_CLK_U74_AXI, "u74_axi", CLK_IS_CRITICAL, JH7100_CLK_CPU_AXI),
> +       JH71X0_GATE(JH7100_CLK_U74RTC_TOGGLE, "u74rtc_toggle", CLK_IS_CRITICAL, JH7100_CLK_OSC_SYS),
> +       JH71X0_GATE(JH7100_CLK_SGDMA2P_AXI, "sgdma2p_axi", 0, JH7100_CLK_CPU_AXI),
> +       JH71X0_GATE(JH7100_CLK_DMA2PNOC_AXI, "dma2pnoc_axi", 0, JH7100_CLK_CPU_AXI),
> +       JH71X0_GATE(JH7100_CLK_SGDMA2P_AHB, "sgdma2p_ahb", 0, JH7100_CLK_AHB_BUS),
> +       JH71X0__DIV(JH7100_CLK_DLA_BUS, "dla_bus", 4, JH7100_CLK_DLA_ROOT),
> +       JH71X0_GATE(JH7100_CLK_DLA_AXI, "dla_axi", 0, JH7100_CLK_DLA_BUS),
> +       JH71X0_GATE(JH7100_CLK_DLANOC_AXI, "dlanoc_axi", 0, JH7100_CLK_DLA_BUS),
> +       JH71X0_GATE(JH7100_CLK_DLA_APB, "dla_apb", 0, JH7100_CLK_APB1_BUS),
> +       JH71X0_GDIV(JH7100_CLK_VP6_CORE, "vp6_core", 0, 4, JH7100_CLK_DSP_ROOT_DIV),
> +       JH71X0__DIV(JH7100_CLK_VP6BUS_SRC, "vp6bus_src", 4, JH7100_CLK_DSP_ROOT),
> +       JH71X0_GDIV(JH7100_CLK_VP6_AXI, "vp6_axi", 0, 4, JH7100_CLK_VP6BUS_SRC),
> +       JH71X0__DIV(JH7100_CLK_VCDECBUS_SRC, "vcdecbus_src", 4, JH7100_CLK_CDECHIFI4_ROOT),
> +       JH71X0__DIV(JH7100_CLK_VDEC_BUS, "vdec_bus", 8, JH7100_CLK_VCDECBUS_SRC),
> +       JH71X0_GATE(JH7100_CLK_VDEC_AXI, "vdec_axi", 0, JH7100_CLK_VDEC_BUS),
> +       JH71X0_GATE(JH7100_CLK_VDECBRG_MAIN, "vdecbrg_mainclk", 0, JH7100_CLK_VDEC_BUS),
> +       JH71X0_GDIV(JH7100_CLK_VDEC_BCLK, "vdec_bclk", 0, 8, JH7100_CLK_VCDECBUS_SRC),
> +       JH71X0_GDIV(JH7100_CLK_VDEC_CCLK, "vdec_cclk", 0, 8, JH7100_CLK_CDEC_ROOT),
> +       JH71X0_GATE(JH7100_CLK_VDEC_APB, "vdec_apb", 0, JH7100_CLK_APB1_BUS),
> +       JH71X0_GDIV(JH7100_CLK_JPEG_AXI, "jpeg_axi", 0, 8, JH7100_CLK_CPUNBUS_ROOT_DIV),
> +       JH71X0_GDIV(JH7100_CLK_JPEG_CCLK, "jpeg_cclk", 0, 8, JH7100_CLK_CPUNBUS_ROOT_DIV),
> +       JH71X0_GATE(JH7100_CLK_JPEG_APB, "jpeg_apb", 0, JH7100_CLK_APB1_BUS),
> +       JH71X0_GDIV(JH7100_CLK_GC300_2X, "gc300_2x", 0, 8, JH7100_CLK_CDECHIFI4_ROOT),
> +       JH71X0_GATE(JH7100_CLK_GC300_AHB, "gc300_ahb", 0, JH7100_CLK_AHB_BUS),
> +       JH71X0__DIV(JH7100_CLK_JPCGC300_AXIBUS, "jpcgc300_axibus", 8, JH7100_CLK_VCDECBUS_SRC),
> +       JH71X0_GATE(JH7100_CLK_GC300_AXI, "gc300_axi", 0, JH7100_CLK_JPCGC300_AXIBUS),
> +       JH71X0_GATE(JH7100_CLK_JPCGC300_MAIN, "jpcgc300_mainclk", 0, JH7100_CLK_JPCGC300_AXIBUS),
> +       JH71X0__DIV(JH7100_CLK_VENC_BUS, "venc_bus", 8, JH7100_CLK_VCDECBUS_SRC),
> +       JH71X0_GATE(JH7100_CLK_VENC_AXI, "venc_axi", 0, JH7100_CLK_VENC_BUS),
> +       JH71X0_GATE(JH7100_CLK_VENCBRG_MAIN, "vencbrg_mainclk", 0, JH7100_CLK_VENC_BUS),
> +       JH71X0_GDIV(JH7100_CLK_VENC_BCLK, "venc_bclk", 0, 8, JH7100_CLK_VCDECBUS_SRC),
> +       JH71X0_GDIV(JH7100_CLK_VENC_CCLK, "venc_cclk", 0, 8, JH7100_CLK_CDEC_ROOT),
> +       JH71X0_GATE(JH7100_CLK_VENC_APB, "venc_apb", 0, JH7100_CLK_APB1_BUS),
> +       JH71X0_GDIV(JH7100_CLK_DDRPLL_DIV2, "ddrpll_div2", CLK_IS_CRITICAL, 2, JH7100_CLK_PLL1_OUT),
> +       JH71X0_GDIV(JH7100_CLK_DDRPLL_DIV4, "ddrpll_div4", CLK_IS_CRITICAL, 2, JH7100_CLK_DDRPLL_DIV2),
> +       JH71X0_GDIV(JH7100_CLK_DDRPLL_DIV8, "ddrpll_div8", CLK_IS_CRITICAL, 2, JH7100_CLK_DDRPLL_DIV4),
> +       JH71X0_GDIV(JH7100_CLK_DDROSC_DIV2, "ddrosc_div2", CLK_IS_CRITICAL, 2, JH7100_CLK_OSC_SYS),
> +       JH71X0_GMUX(JH7100_CLK_DDRC0, "ddrc0", CLK_IS_CRITICAL, 4,
>                     JH7100_CLK_DDROSC_DIV2,
>                     JH7100_CLK_DDRPLL_DIV2,
>                     JH7100_CLK_DDRPLL_DIV4,
>                     JH7100_CLK_DDRPLL_DIV8),
> -       JH7100_GMUX(JH7100_CLK_DDRC1, "ddrc1", CLK_IS_CRITICAL, 4,
> +       JH71X0_GMUX(JH7100_CLK_DDRC1, "ddrc1", CLK_IS_CRITICAL, 4,
>                     JH7100_CLK_DDROSC_DIV2,
>                     JH7100_CLK_DDRPLL_DIV2,
>                     JH7100_CLK_DDRPLL_DIV4,
>                     JH7100_CLK_DDRPLL_DIV8),
> -       JH7100_GATE(JH7100_CLK_DDRPHY_APB, "ddrphy_apb", 0, JH7100_CLK_APB1_BUS),
> -       JH7100__DIV(JH7100_CLK_NOC_ROB, "noc_rob", 8, JH7100_CLK_CPUNBUS_ROOT_DIV),
> -       JH7100__DIV(JH7100_CLK_NOC_COG, "noc_cog", 8, JH7100_CLK_DLA_ROOT),
> -       JH7100_GATE(JH7100_CLK_NNE_AHB, "nne_ahb", 0, JH7100_CLK_AHB_BUS),
> -       JH7100__DIV(JH7100_CLK_NNEBUS_SRC1, "nnebus_src1", 4, JH7100_CLK_DSP_ROOT),
> -       JH7100__MUX(JH7100_CLK_NNE_BUS, "nne_bus", 2,
> +       JH71X0_GATE(JH7100_CLK_DDRPHY_APB, "ddrphy_apb", 0, JH7100_CLK_APB1_BUS),
> +       JH71X0__DIV(JH7100_CLK_NOC_ROB, "noc_rob", 8, JH7100_CLK_CPUNBUS_ROOT_DIV),
> +       JH71X0__DIV(JH7100_CLK_NOC_COG, "noc_cog", 8, JH7100_CLK_DLA_ROOT),
> +       JH71X0_GATE(JH7100_CLK_NNE_AHB, "nne_ahb", 0, JH7100_CLK_AHB_BUS),
> +       JH71X0__DIV(JH7100_CLK_NNEBUS_SRC1, "nnebus_src1", 4, JH7100_CLK_DSP_ROOT),
> +       JH71X0__MUX(JH7100_CLK_NNE_BUS, "nne_bus", 2,
>                     JH7100_CLK_CPU_AXI,
>                     JH7100_CLK_NNEBUS_SRC1),
> -       JH7100_GATE(JH7100_CLK_NNE_AXI, "nne_axi", 0, JH7100_CLK_NNE_BUS),
> -       JH7100_GATE(JH7100_CLK_NNENOC_AXI, "nnenoc_axi", 0, JH7100_CLK_NNE_BUS),
> -       JH7100_GATE(JH7100_CLK_DLASLV_AXI, "dlaslv_axi", 0, JH7100_CLK_NNE_BUS),
> -       JH7100_GATE(JH7100_CLK_DSPX2C_AXI, "dspx2c_axi", CLK_IS_CRITICAL, JH7100_CLK_NNE_BUS),
> -       JH7100__DIV(JH7100_CLK_HIFI4_SRC, "hifi4_src", 4, JH7100_CLK_CDECHIFI4_ROOT),
> -       JH7100__DIV(JH7100_CLK_HIFI4_COREFREE, "hifi4_corefree", 8, JH7100_CLK_HIFI4_SRC),
> -       JH7100_GATE(JH7100_CLK_HIFI4_CORE, "hifi4_core", 0, JH7100_CLK_HIFI4_COREFREE),
> -       JH7100__DIV(JH7100_CLK_HIFI4_BUS, "hifi4_bus", 8, JH7100_CLK_HIFI4_COREFREE),
> -       JH7100_GATE(JH7100_CLK_HIFI4_AXI, "hifi4_axi", 0, JH7100_CLK_HIFI4_BUS),
> -       JH7100_GATE(JH7100_CLK_HIFI4NOC_AXI, "hifi4noc_axi", 0, JH7100_CLK_HIFI4_BUS),
> -       JH7100__DIV(JH7100_CLK_SGDMA1P_BUS, "sgdma1p_bus", 8, JH7100_CLK_CPUNBUS_ROOT_DIV),
> -       JH7100_GATE(JH7100_CLK_SGDMA1P_AXI, "sgdma1p_axi", 0, JH7100_CLK_SGDMA1P_BUS),
> -       JH7100_GATE(JH7100_CLK_DMA1P_AXI, "dma1p_axi", 0, JH7100_CLK_SGDMA1P_BUS),
> -       JH7100_GDIV(JH7100_CLK_X2C_AXI, "x2c_axi", CLK_IS_CRITICAL, 8, JH7100_CLK_CPUNBUS_ROOT_DIV),
> -       JH7100__DIV(JH7100_CLK_USB_BUS, "usb_bus", 8, JH7100_CLK_CPUNBUS_ROOT_DIV),
> -       JH7100_GATE(JH7100_CLK_USB_AXI, "usb_axi", 0, JH7100_CLK_USB_BUS),
> -       JH7100_GATE(JH7100_CLK_USBNOC_AXI, "usbnoc_axi", 0, JH7100_CLK_USB_BUS),
> -       JH7100__DIV(JH7100_CLK_USBPHY_ROOTDIV, "usbphy_rootdiv", 4, JH7100_CLK_GMACUSB_ROOT),
> -       JH7100_GDIV(JH7100_CLK_USBPHY_125M, "usbphy_125m", 0, 8, JH7100_CLK_USBPHY_ROOTDIV),
> -       JH7100_GDIV(JH7100_CLK_USBPHY_PLLDIV25M, "usbphy_plldiv25m", 0, 32, JH7100_CLK_USBPHY_ROOTDIV),
> -       JH7100__MUX(JH7100_CLK_USBPHY_25M, "usbphy_25m", 2,
> +       JH71X0_GATE(JH7100_CLK_NNE_AXI, "nne_axi", 0, JH7100_CLK_NNE_BUS),
> +       JH71X0_GATE(JH7100_CLK_NNENOC_AXI, "nnenoc_axi", 0, JH7100_CLK_NNE_BUS),
> +       JH71X0_GATE(JH7100_CLK_DLASLV_AXI, "dlaslv_axi", 0, JH7100_CLK_NNE_BUS),
> +       JH71X0_GATE(JH7100_CLK_DSPX2C_AXI, "dspx2c_axi", CLK_IS_CRITICAL, JH7100_CLK_NNE_BUS),
> +       JH71X0__DIV(JH7100_CLK_HIFI4_SRC, "hifi4_src", 4, JH7100_CLK_CDECHIFI4_ROOT),
> +       JH71X0__DIV(JH7100_CLK_HIFI4_COREFREE, "hifi4_corefree", 8, JH7100_CLK_HIFI4_SRC),
> +       JH71X0_GATE(JH7100_CLK_HIFI4_CORE, "hifi4_core", 0, JH7100_CLK_HIFI4_COREFREE),
> +       JH71X0__DIV(JH7100_CLK_HIFI4_BUS, "hifi4_bus", 8, JH7100_CLK_HIFI4_COREFREE),
> +       JH71X0_GATE(JH7100_CLK_HIFI4_AXI, "hifi4_axi", 0, JH7100_CLK_HIFI4_BUS),
> +       JH71X0_GATE(JH7100_CLK_HIFI4NOC_AXI, "hifi4noc_axi", 0, JH7100_CLK_HIFI4_BUS),
> +       JH71X0__DIV(JH7100_CLK_SGDMA1P_BUS, "sgdma1p_bus", 8, JH7100_CLK_CPUNBUS_ROOT_DIV),
> +       JH71X0_GATE(JH7100_CLK_SGDMA1P_AXI, "sgdma1p_axi", 0, JH7100_CLK_SGDMA1P_BUS),
> +       JH71X0_GATE(JH7100_CLK_DMA1P_AXI, "dma1p_axi", 0, JH7100_CLK_SGDMA1P_BUS),
> +       JH71X0_GDIV(JH7100_CLK_X2C_AXI, "x2c_axi", CLK_IS_CRITICAL, 8, JH7100_CLK_CPUNBUS_ROOT_DIV),
> +       JH71X0__DIV(JH7100_CLK_USB_BUS, "usb_bus", 8, JH7100_CLK_CPUNBUS_ROOT_DIV),
> +       JH71X0_GATE(JH7100_CLK_USB_AXI, "usb_axi", 0, JH7100_CLK_USB_BUS),
> +       JH71X0_GATE(JH7100_CLK_USBNOC_AXI, "usbnoc_axi", 0, JH7100_CLK_USB_BUS),
> +       JH71X0__DIV(JH7100_CLK_USBPHY_ROOTDIV, "usbphy_rootdiv", 4, JH7100_CLK_GMACUSB_ROOT),
> +       JH71X0_GDIV(JH7100_CLK_USBPHY_125M, "usbphy_125m", 0, 8, JH7100_CLK_USBPHY_ROOTDIV),
> +       JH71X0_GDIV(JH7100_CLK_USBPHY_PLLDIV25M, "usbphy_plldiv25m", 0, 32, JH7100_CLK_USBPHY_ROOTDIV),
> +       JH71X0__MUX(JH7100_CLK_USBPHY_25M, "usbphy_25m", 2,
>                     JH7100_CLK_OSC_SYS,
>                     JH7100_CLK_USBPHY_PLLDIV25M),
> -       JH7100_FDIV(JH7100_CLK_AUDIO_DIV, "audio_div", JH7100_CLK_AUDIO_ROOT),
> -       JH7100_GATE(JH7100_CLK_AUDIO_SRC, "audio_src", 0, JH7100_CLK_AUDIO_DIV),
> -       JH7100_GATE(JH7100_CLK_AUDIO_12288, "audio_12288", 0, JH7100_CLK_OSC_AUD),
> -       JH7100_GDIV(JH7100_CLK_VIN_SRC, "vin_src", 0, 4, JH7100_CLK_VIN_ROOT),
> -       JH7100__DIV(JH7100_CLK_ISP0_BUS, "isp0_bus", 8, JH7100_CLK_VIN_SRC),
> -       JH7100_GATE(JH7100_CLK_ISP0_AXI, "isp0_axi", 0, JH7100_CLK_ISP0_BUS),
> -       JH7100_GATE(JH7100_CLK_ISP0NOC_AXI, "isp0noc_axi", 0, JH7100_CLK_ISP0_BUS),
> -       JH7100_GATE(JH7100_CLK_ISPSLV_AXI, "ispslv_axi", 0, JH7100_CLK_ISP0_BUS),
> -       JH7100__DIV(JH7100_CLK_ISP1_BUS, "isp1_bus", 8, JH7100_CLK_VIN_SRC),
> -       JH7100_GATE(JH7100_CLK_ISP1_AXI, "isp1_axi", 0, JH7100_CLK_ISP1_BUS),
> -       JH7100_GATE(JH7100_CLK_ISP1NOC_AXI, "isp1noc_axi", 0, JH7100_CLK_ISP1_BUS),
> -       JH7100__DIV(JH7100_CLK_VIN_BUS, "vin_bus", 8, JH7100_CLK_VIN_SRC),
> -       JH7100_GATE(JH7100_CLK_VIN_AXI, "vin_axi", 0, JH7100_CLK_VIN_BUS),
> -       JH7100_GATE(JH7100_CLK_VINNOC_AXI, "vinnoc_axi", 0, JH7100_CLK_VIN_BUS),
> -       JH7100_GDIV(JH7100_CLK_VOUT_SRC, "vout_src", 0, 4, JH7100_CLK_VOUT_ROOT),
> -       JH7100__DIV(JH7100_CLK_DISPBUS_SRC, "dispbus_src", 4, JH7100_CLK_VOUTBUS_ROOT),
> -       JH7100__DIV(JH7100_CLK_DISP_BUS, "disp_bus", 4, JH7100_CLK_DISPBUS_SRC),
> -       JH7100_GATE(JH7100_CLK_DISP_AXI, "disp_axi", 0, JH7100_CLK_DISP_BUS),
> -       JH7100_GATE(JH7100_CLK_DISPNOC_AXI, "dispnoc_axi", 0, JH7100_CLK_DISP_BUS),
> -       JH7100_GATE(JH7100_CLK_SDIO0_AHB, "sdio0_ahb", 0, JH7100_CLK_AHB_BUS),
> -       JH7100_GDIV(JH7100_CLK_SDIO0_CCLKINT, "sdio0_cclkint", 0, 24, JH7100_CLK_PERH0_SRC),
> -       JH7100__INV(JH7100_CLK_SDIO0_CCLKINT_INV, "sdio0_cclkint_inv", JH7100_CLK_SDIO0_CCLKINT),
> -       JH7100_GATE(JH7100_CLK_SDIO1_AHB, "sdio1_ahb", 0, JH7100_CLK_AHB_BUS),
> -       JH7100_GDIV(JH7100_CLK_SDIO1_CCLKINT, "sdio1_cclkint", 0, 24, JH7100_CLK_PERH1_SRC),
> -       JH7100__INV(JH7100_CLK_SDIO1_CCLKINT_INV, "sdio1_cclkint_inv", JH7100_CLK_SDIO1_CCLKINT),
> -       JH7100_GATE(JH7100_CLK_GMAC_AHB, "gmac_ahb", 0, JH7100_CLK_AHB_BUS),
> -       JH7100__DIV(JH7100_CLK_GMAC_ROOT_DIV, "gmac_root_div", 8, JH7100_CLK_GMACUSB_ROOT),
> -       JH7100_GDIV(JH7100_CLK_GMAC_PTP_REF, "gmac_ptp_refclk", 0, 31, JH7100_CLK_GMAC_ROOT_DIV),
> -       JH7100_GDIV(JH7100_CLK_GMAC_GTX, "gmac_gtxclk", 0, 255, JH7100_CLK_GMAC_ROOT_DIV),
> -       JH7100_GDIV(JH7100_CLK_GMAC_RMII_TX, "gmac_rmii_txclk", 0, 8, JH7100_CLK_GMAC_RMII_REF),
> -       JH7100_GDIV(JH7100_CLK_GMAC_RMII_RX, "gmac_rmii_rxclk", 0, 8, JH7100_CLK_GMAC_RMII_REF),
> -       JH7100__MUX(JH7100_CLK_GMAC_TX, "gmac_tx", 3,
> +       JH71X0_FDIV(JH7100_CLK_AUDIO_DIV, "audio_div", JH7100_CLK_AUDIO_ROOT),
> +       JH71X0_GATE(JH7100_CLK_AUDIO_SRC, "audio_src", 0, JH7100_CLK_AUDIO_DIV),
> +       JH71X0_GATE(JH7100_CLK_AUDIO_12288, "audio_12288", 0, JH7100_CLK_OSC_AUD),
> +       JH71X0_GDIV(JH7100_CLK_VIN_SRC, "vin_src", 0, 4, JH7100_CLK_VIN_ROOT),
> +       JH71X0__DIV(JH7100_CLK_ISP0_BUS, "isp0_bus", 8, JH7100_CLK_VIN_SRC),
> +       JH71X0_GATE(JH7100_CLK_ISP0_AXI, "isp0_axi", 0, JH7100_CLK_ISP0_BUS),
> +       JH71X0_GATE(JH7100_CLK_ISP0NOC_AXI, "isp0noc_axi", 0, JH7100_CLK_ISP0_BUS),
> +       JH71X0_GATE(JH7100_CLK_ISPSLV_AXI, "ispslv_axi", 0, JH7100_CLK_ISP0_BUS),
> +       JH71X0__DIV(JH7100_CLK_ISP1_BUS, "isp1_bus", 8, JH7100_CLK_VIN_SRC),
> +       JH71X0_GATE(JH7100_CLK_ISP1_AXI, "isp1_axi", 0, JH7100_CLK_ISP1_BUS),
> +       JH71X0_GATE(JH7100_CLK_ISP1NOC_AXI, "isp1noc_axi", 0, JH7100_CLK_ISP1_BUS),
> +       JH71X0__DIV(JH7100_CLK_VIN_BUS, "vin_bus", 8, JH7100_CLK_VIN_SRC),
> +       JH71X0_GATE(JH7100_CLK_VIN_AXI, "vin_axi", 0, JH7100_CLK_VIN_BUS),
> +       JH71X0_GATE(JH7100_CLK_VINNOC_AXI, "vinnoc_axi", 0, JH7100_CLK_VIN_BUS),
> +       JH71X0_GDIV(JH7100_CLK_VOUT_SRC, "vout_src", 0, 4, JH7100_CLK_VOUT_ROOT),
> +       JH71X0__DIV(JH7100_CLK_DISPBUS_SRC, "dispbus_src", 4, JH7100_CLK_VOUTBUS_ROOT),
> +       JH71X0__DIV(JH7100_CLK_DISP_BUS, "disp_bus", 4, JH7100_CLK_DISPBUS_SRC),
> +       JH71X0_GATE(JH7100_CLK_DISP_AXI, "disp_axi", 0, JH7100_CLK_DISP_BUS),
> +       JH71X0_GATE(JH7100_CLK_DISPNOC_AXI, "dispnoc_axi", 0, JH7100_CLK_DISP_BUS),
> +       JH71X0_GATE(JH7100_CLK_SDIO0_AHB, "sdio0_ahb", 0, JH7100_CLK_AHB_BUS),
> +       JH71X0_GDIV(JH7100_CLK_SDIO0_CCLKINT, "sdio0_cclkint", 0, 24, JH7100_CLK_PERH0_SRC),
> +       JH71X0__INV(JH7100_CLK_SDIO0_CCLKINT_INV, "sdio0_cclkint_inv", JH7100_CLK_SDIO0_CCLKINT),
> +       JH71X0_GATE(JH7100_CLK_SDIO1_AHB, "sdio1_ahb", 0, JH7100_CLK_AHB_BUS),
> +       JH71X0_GDIV(JH7100_CLK_SDIO1_CCLKINT, "sdio1_cclkint", 0, 24, JH7100_CLK_PERH1_SRC),
> +       JH71X0__INV(JH7100_CLK_SDIO1_CCLKINT_INV, "sdio1_cclkint_inv", JH7100_CLK_SDIO1_CCLKINT),
> +       JH71X0_GATE(JH7100_CLK_GMAC_AHB, "gmac_ahb", 0, JH7100_CLK_AHB_BUS),
> +       JH71X0__DIV(JH7100_CLK_GMAC_ROOT_DIV, "gmac_root_div", 8, JH7100_CLK_GMACUSB_ROOT),
> +       JH71X0_GDIV(JH7100_CLK_GMAC_PTP_REF, "gmac_ptp_refclk", 0, 31, JH7100_CLK_GMAC_ROOT_DIV),
> +       JH71X0_GDIV(JH7100_CLK_GMAC_GTX, "gmac_gtxclk", 0, 255, JH7100_CLK_GMAC_ROOT_DIV),
> +       JH71X0_GDIV(JH7100_CLK_GMAC_RMII_TX, "gmac_rmii_txclk", 0, 8, JH7100_CLK_GMAC_RMII_REF),
> +       JH71X0_GDIV(JH7100_CLK_GMAC_RMII_RX, "gmac_rmii_rxclk", 0, 8, JH7100_CLK_GMAC_RMII_REF),
> +       JH71X0__MUX(JH7100_CLK_GMAC_TX, "gmac_tx", 3,
>                     JH7100_CLK_GMAC_GTX,
>                     JH7100_CLK_GMAC_TX_INV,
>                     JH7100_CLK_GMAC_RMII_TX),
> -       JH7100__INV(JH7100_CLK_GMAC_TX_INV, "gmac_tx_inv", JH7100_CLK_GMAC_TX),
> -       JH7100__MUX(JH7100_CLK_GMAC_RX_PRE, "gmac_rx_pre", 2,
> +       JH71X0__INV(JH7100_CLK_GMAC_TX_INV, "gmac_tx_inv", JH7100_CLK_GMAC_TX),
> +       JH71X0__MUX(JH7100_CLK_GMAC_RX_PRE, "gmac_rx_pre", 2,
>                     JH7100_CLK_GMAC_GR_MII_RX,
>                     JH7100_CLK_GMAC_RMII_RX),
> -       JH7100__INV(JH7100_CLK_GMAC_RX_INV, "gmac_rx_inv", JH7100_CLK_GMAC_RX_PRE),
> -       JH7100_GATE(JH7100_CLK_GMAC_RMII, "gmac_rmii", 0, JH7100_CLK_GMAC_RMII_REF),
> -       JH7100_GDIV(JH7100_CLK_GMAC_TOPHYREF, "gmac_tophyref", 0, 127, JH7100_CLK_GMAC_ROOT_DIV),
> -       JH7100_GATE(JH7100_CLK_SPI2AHB_AHB, "spi2ahb_ahb", 0, JH7100_CLK_AHB_BUS),
> -       JH7100_GDIV(JH7100_CLK_SPI2AHB_CORE, "spi2ahb_core", 0, 31, JH7100_CLK_PERH0_SRC),
> -       JH7100_GATE(JH7100_CLK_EZMASTER_AHB, "ezmaster_ahb", 0, JH7100_CLK_AHB_BUS),
> -       JH7100_GATE(JH7100_CLK_E24_AHB, "e24_ahb", 0, JH7100_CLK_AHB_BUS),
> -       JH7100_GATE(JH7100_CLK_E24RTC_TOGGLE, "e24rtc_toggle", 0, JH7100_CLK_OSC_SYS),
> -       JH7100_GATE(JH7100_CLK_QSPI_AHB, "qspi_ahb", 0, JH7100_CLK_AHB_BUS),
> -       JH7100_GATE(JH7100_CLK_QSPI_APB, "qspi_apb", 0, JH7100_CLK_APB1_BUS),
> -       JH7100_GDIV(JH7100_CLK_QSPI_REF, "qspi_refclk", 0, 31, JH7100_CLK_PERH0_SRC),
> -       JH7100_GATE(JH7100_CLK_SEC_AHB, "sec_ahb", 0, JH7100_CLK_AHB_BUS),
> -       JH7100_GATE(JH7100_CLK_AES, "aes_clk", 0, JH7100_CLK_SEC_AHB),
> -       JH7100_GATE(JH7100_CLK_SHA, "sha_clk", 0, JH7100_CLK_SEC_AHB),
> -       JH7100_GATE(JH7100_CLK_PKA, "pka_clk", 0, JH7100_CLK_SEC_AHB),
> -       JH7100_GATE(JH7100_CLK_TRNG_APB, "trng_apb", 0, JH7100_CLK_APB1_BUS),
> -       JH7100_GATE(JH7100_CLK_OTP_APB, "otp_apb", 0, JH7100_CLK_APB1_BUS),
> -       JH7100_GATE(JH7100_CLK_UART0_APB, "uart0_apb", 0, JH7100_CLK_APB1_BUS),
> -       JH7100_GDIV(JH7100_CLK_UART0_CORE, "uart0_core", 0, 63, JH7100_CLK_PERH1_SRC),
> -       JH7100_GATE(JH7100_CLK_UART1_APB, "uart1_apb", 0, JH7100_CLK_APB1_BUS),
> -       JH7100_GDIV(JH7100_CLK_UART1_CORE, "uart1_core", 0, 63, JH7100_CLK_PERH1_SRC),
> -       JH7100_GATE(JH7100_CLK_SPI0_APB, "spi0_apb", 0, JH7100_CLK_APB1_BUS),
> -       JH7100_GDIV(JH7100_CLK_SPI0_CORE, "spi0_core", 0, 63, JH7100_CLK_PERH1_SRC),
> -       JH7100_GATE(JH7100_CLK_SPI1_APB, "spi1_apb", 0, JH7100_CLK_APB1_BUS),
> -       JH7100_GDIV(JH7100_CLK_SPI1_CORE, "spi1_core", 0, 63, JH7100_CLK_PERH1_SRC),
> -       JH7100_GATE(JH7100_CLK_I2C0_APB, "i2c0_apb", 0, JH7100_CLK_APB1_BUS),
> -       JH7100_GDIV(JH7100_CLK_I2C0_CORE, "i2c0_core", 0, 63, JH7100_CLK_PERH1_SRC),
> -       JH7100_GATE(JH7100_CLK_I2C1_APB, "i2c1_apb", 0, JH7100_CLK_APB1_BUS),
> -       JH7100_GDIV(JH7100_CLK_I2C1_CORE, "i2c1_core", 0, 63, JH7100_CLK_PERH1_SRC),
> -       JH7100_GATE(JH7100_CLK_GPIO_APB, "gpio_apb", 0, JH7100_CLK_APB1_BUS),
> -       JH7100_GATE(JH7100_CLK_UART2_APB, "uart2_apb", 0, JH7100_CLK_APB2_BUS),
> -       JH7100_GDIV(JH7100_CLK_UART2_CORE, "uart2_core", 0, 63, JH7100_CLK_PERH0_SRC),
> -       JH7100_GATE(JH7100_CLK_UART3_APB, "uart3_apb", 0, JH7100_CLK_APB2_BUS),
> -       JH7100_GDIV(JH7100_CLK_UART3_CORE, "uart3_core", 0, 63, JH7100_CLK_PERH0_SRC),
> -       JH7100_GATE(JH7100_CLK_SPI2_APB, "spi2_apb", 0, JH7100_CLK_APB2_BUS),
> -       JH7100_GDIV(JH7100_CLK_SPI2_CORE, "spi2_core", 0, 63, JH7100_CLK_PERH0_SRC),
> -       JH7100_GATE(JH7100_CLK_SPI3_APB, "spi3_apb", 0, JH7100_CLK_APB2_BUS),
> -       JH7100_GDIV(JH7100_CLK_SPI3_CORE, "spi3_core", 0, 63, JH7100_CLK_PERH0_SRC),
> -       JH7100_GATE(JH7100_CLK_I2C2_APB, "i2c2_apb", 0, JH7100_CLK_APB2_BUS),
> -       JH7100_GDIV(JH7100_CLK_I2C2_CORE, "i2c2_core", 0, 63, JH7100_CLK_PERH0_SRC),
> -       JH7100_GATE(JH7100_CLK_I2C3_APB, "i2c3_apb", 0, JH7100_CLK_APB2_BUS),
> -       JH7100_GDIV(JH7100_CLK_I2C3_CORE, "i2c3_core", 0, 63, JH7100_CLK_PERH0_SRC),
> -       JH7100_GATE(JH7100_CLK_WDTIMER_APB, "wdtimer_apb", 0, JH7100_CLK_APB2_BUS),
> -       JH7100_GDIV(JH7100_CLK_WDT_CORE, "wdt_coreclk", 0, 63, JH7100_CLK_PERH0_SRC),
> -       JH7100_GDIV(JH7100_CLK_TIMER0_CORE, "timer0_coreclk", 0, 63, JH7100_CLK_PERH0_SRC),
> -       JH7100_GDIV(JH7100_CLK_TIMER1_CORE, "timer1_coreclk", 0, 63, JH7100_CLK_PERH0_SRC),
> -       JH7100_GDIV(JH7100_CLK_TIMER2_CORE, "timer2_coreclk", 0, 63, JH7100_CLK_PERH0_SRC),
> -       JH7100_GDIV(JH7100_CLK_TIMER3_CORE, "timer3_coreclk", 0, 63, JH7100_CLK_PERH0_SRC),
> -       JH7100_GDIV(JH7100_CLK_TIMER4_CORE, "timer4_coreclk", 0, 63, JH7100_CLK_PERH0_SRC),
> -       JH7100_GDIV(JH7100_CLK_TIMER5_CORE, "timer5_coreclk", 0, 63, JH7100_CLK_PERH0_SRC),
> -       JH7100_GDIV(JH7100_CLK_TIMER6_CORE, "timer6_coreclk", 0, 63, JH7100_CLK_PERH0_SRC),
> -       JH7100_GATE(JH7100_CLK_VP6INTC_APB, "vp6intc_apb", 0, JH7100_CLK_APB2_BUS),
> -       JH7100_GATE(JH7100_CLK_PWM_APB, "pwm_apb", 0, JH7100_CLK_APB2_BUS),
> -       JH7100_GATE(JH7100_CLK_MSI_APB, "msi_apb", 0, JH7100_CLK_APB2_BUS),
> -       JH7100_GATE(JH7100_CLK_TEMP_APB, "temp_apb", 0, JH7100_CLK_APB2_BUS),
> -       JH7100_GDIV(JH7100_CLK_TEMP_SENSE, "temp_sense", 0, 31, JH7100_CLK_OSC_SYS),
> -       JH7100_GATE(JH7100_CLK_SYSERR_APB, "syserr_apb", 0, JH7100_CLK_APB2_BUS),
> +       JH71X0__INV(JH7100_CLK_GMAC_RX_INV, "gmac_rx_inv", JH7100_CLK_GMAC_RX_PRE),
> +       JH71X0_GATE(JH7100_CLK_GMAC_RMII, "gmac_rmii", 0, JH7100_CLK_GMAC_RMII_REF),
> +       JH71X0_GDIV(JH7100_CLK_GMAC_TOPHYREF, "gmac_tophyref", 0, 127, JH7100_CLK_GMAC_ROOT_DIV),
> +       JH71X0_GATE(JH7100_CLK_SPI2AHB_AHB, "spi2ahb_ahb", 0, JH7100_CLK_AHB_BUS),
> +       JH71X0_GDIV(JH7100_CLK_SPI2AHB_CORE, "spi2ahb_core", 0, 31, JH7100_CLK_PERH0_SRC),
> +       JH71X0_GATE(JH7100_CLK_EZMASTER_AHB, "ezmaster_ahb", 0, JH7100_CLK_AHB_BUS),
> +       JH71X0_GATE(JH7100_CLK_E24_AHB, "e24_ahb", 0, JH7100_CLK_AHB_BUS),
> +       JH71X0_GATE(JH7100_CLK_E24RTC_TOGGLE, "e24rtc_toggle", 0, JH7100_CLK_OSC_SYS),
> +       JH71X0_GATE(JH7100_CLK_QSPI_AHB, "qspi_ahb", 0, JH7100_CLK_AHB_BUS),
> +       JH71X0_GATE(JH7100_CLK_QSPI_APB, "qspi_apb", 0, JH7100_CLK_APB1_BUS),
> +       JH71X0_GDIV(JH7100_CLK_QSPI_REF, "qspi_refclk", 0, 31, JH7100_CLK_PERH0_SRC),
> +       JH71X0_GATE(JH7100_CLK_SEC_AHB, "sec_ahb", 0, JH7100_CLK_AHB_BUS),
> +       JH71X0_GATE(JH7100_CLK_AES, "aes_clk", 0, JH7100_CLK_SEC_AHB),
> +       JH71X0_GATE(JH7100_CLK_SHA, "sha_clk", 0, JH7100_CLK_SEC_AHB),
> +       JH71X0_GATE(JH7100_CLK_PKA, "pka_clk", 0, JH7100_CLK_SEC_AHB),
> +       JH71X0_GATE(JH7100_CLK_TRNG_APB, "trng_apb", 0, JH7100_CLK_APB1_BUS),
> +       JH71X0_GATE(JH7100_CLK_OTP_APB, "otp_apb", 0, JH7100_CLK_APB1_BUS),
> +       JH71X0_GATE(JH7100_CLK_UART0_APB, "uart0_apb", 0, JH7100_CLK_APB1_BUS),
> +       JH71X0_GDIV(JH7100_CLK_UART0_CORE, "uart0_core", 0, 63, JH7100_CLK_PERH1_SRC),
> +       JH71X0_GATE(JH7100_CLK_UART1_APB, "uart1_apb", 0, JH7100_CLK_APB1_BUS),
> +       JH71X0_GDIV(JH7100_CLK_UART1_CORE, "uart1_core", 0, 63, JH7100_CLK_PERH1_SRC),
> +       JH71X0_GATE(JH7100_CLK_SPI0_APB, "spi0_apb", 0, JH7100_CLK_APB1_BUS),
> +       JH71X0_GDIV(JH7100_CLK_SPI0_CORE, "spi0_core", 0, 63, JH7100_CLK_PERH1_SRC),
> +       JH71X0_GATE(JH7100_CLK_SPI1_APB, "spi1_apb", 0, JH7100_CLK_APB1_BUS),
> +       JH71X0_GDIV(JH7100_CLK_SPI1_CORE, "spi1_core", 0, 63, JH7100_CLK_PERH1_SRC),
> +       JH71X0_GATE(JH7100_CLK_I2C0_APB, "i2c0_apb", 0, JH7100_CLK_APB1_BUS),
> +       JH71X0_GDIV(JH7100_CLK_I2C0_CORE, "i2c0_core", 0, 63, JH7100_CLK_PERH1_SRC),
> +       JH71X0_GATE(JH7100_CLK_I2C1_APB, "i2c1_apb", 0, JH7100_CLK_APB1_BUS),
> +       JH71X0_GDIV(JH7100_CLK_I2C1_CORE, "i2c1_core", 0, 63, JH7100_CLK_PERH1_SRC),
> +       JH71X0_GATE(JH7100_CLK_GPIO_APB, "gpio_apb", 0, JH7100_CLK_APB1_BUS),
> +       JH71X0_GATE(JH7100_CLK_UART2_APB, "uart2_apb", 0, JH7100_CLK_APB2_BUS),
> +       JH71X0_GDIV(JH7100_CLK_UART2_CORE, "uart2_core", 0, 63, JH7100_CLK_PERH0_SRC),
> +       JH71X0_GATE(JH7100_CLK_UART3_APB, "uart3_apb", 0, JH7100_CLK_APB2_BUS),
> +       JH71X0_GDIV(JH7100_CLK_UART3_CORE, "uart3_core", 0, 63, JH7100_CLK_PERH0_SRC),
> +       JH71X0_GATE(JH7100_CLK_SPI2_APB, "spi2_apb", 0, JH7100_CLK_APB2_BUS),
> +       JH71X0_GDIV(JH7100_CLK_SPI2_CORE, "spi2_core", 0, 63, JH7100_CLK_PERH0_SRC),
> +       JH71X0_GATE(JH7100_CLK_SPI3_APB, "spi3_apb", 0, JH7100_CLK_APB2_BUS),
> +       JH71X0_GDIV(JH7100_CLK_SPI3_CORE, "spi3_core", 0, 63, JH7100_CLK_PERH0_SRC),
> +       JH71X0_GATE(JH7100_CLK_I2C2_APB, "i2c2_apb", 0, JH7100_CLK_APB2_BUS),
> +       JH71X0_GDIV(JH7100_CLK_I2C2_CORE, "i2c2_core", 0, 63, JH7100_CLK_PERH0_SRC),
> +       JH71X0_GATE(JH7100_CLK_I2C3_APB, "i2c3_apb", 0, JH7100_CLK_APB2_BUS),
> +       JH71X0_GDIV(JH7100_CLK_I2C3_CORE, "i2c3_core", 0, 63, JH7100_CLK_PERH0_SRC),
> +       JH71X0_GATE(JH7100_CLK_WDTIMER_APB, "wdtimer_apb", 0, JH7100_CLK_APB2_BUS),
> +       JH71X0_GDIV(JH7100_CLK_WDT_CORE, "wdt_coreclk", 0, 63, JH7100_CLK_PERH0_SRC),
> +       JH71X0_GDIV(JH7100_CLK_TIMER0_CORE, "timer0_coreclk", 0, 63, JH7100_CLK_PERH0_SRC),
> +       JH71X0_GDIV(JH7100_CLK_TIMER1_CORE, "timer1_coreclk", 0, 63, JH7100_CLK_PERH0_SRC),
> +       JH71X0_GDIV(JH7100_CLK_TIMER2_CORE, "timer2_coreclk", 0, 63, JH7100_CLK_PERH0_SRC),
> +       JH71X0_GDIV(JH7100_CLK_TIMER3_CORE, "timer3_coreclk", 0, 63, JH7100_CLK_PERH0_SRC),
> +       JH71X0_GDIV(JH7100_CLK_TIMER4_CORE, "timer4_coreclk", 0, 63, JH7100_CLK_PERH0_SRC),
> +       JH71X0_GDIV(JH7100_CLK_TIMER5_CORE, "timer5_coreclk", 0, 63, JH7100_CLK_PERH0_SRC),
> +       JH71X0_GDIV(JH7100_CLK_TIMER6_CORE, "timer6_coreclk", 0, 63, JH7100_CLK_PERH0_SRC),
> +       JH71X0_GATE(JH7100_CLK_VP6INTC_APB, "vp6intc_apb", 0, JH7100_CLK_APB2_BUS),
> +       JH71X0_GATE(JH7100_CLK_PWM_APB, "pwm_apb", 0, JH7100_CLK_APB2_BUS),
> +       JH71X0_GATE(JH7100_CLK_MSI_APB, "msi_apb", 0, JH7100_CLK_APB2_BUS),
> +       JH71X0_GATE(JH7100_CLK_TEMP_APB, "temp_apb", 0, JH7100_CLK_APB2_BUS),
> +       JH71X0_GDIV(JH7100_CLK_TEMP_SENSE, "temp_sense", 0, 31, JH7100_CLK_OSC_SYS),
> +       JH71X0_GATE(JH7100_CLK_SYSERR_APB, "syserr_apb", 0, JH7100_CLK_APB2_BUS),
>  };
>
>  static struct clk_hw *jh7100_clk_get(struct of_phandle_args *clkspec, void *data)
>  {
> -       struct jh7100_clk_priv *priv = data;
> +       struct jh71x0_clk_priv *priv = data;
>         unsigned int idx = clkspec->args[0];
>
>         if (idx < JH7100_CLK_PLL0_OUT)
> @@ -280,7 +280,7 @@ static struct clk_hw *jh7100_clk_get(struct of_phandle_args *clkspec, void *data
>
>  static int __init clk_starfive_jh7100_probe(struct platform_device *pdev)
>  {
> -       struct jh7100_clk_priv *priv;
> +       struct jh71x0_clk_priv *priv;
>         unsigned int idx;
>         int ret;
>
> @@ -314,12 +314,12 @@ static int __init clk_starfive_jh7100_probe(struct platform_device *pdev)
>                 struct clk_parent_data parents[4] = {};
>                 struct clk_init_data init = {
>                         .name = jh7100_clk_data[idx].name,
> -                       .ops = starfive_jh7100_clk_ops(max),
> +                       .ops = starfive_jh71x0_clk_ops(max),
>                         .parent_data = parents,
> -                       .num_parents = ((max & JH7100_CLK_MUX_MASK) >> JH7100_CLK_MUX_SHIFT) + 1,
> +                       .num_parents = ((max & JH71X0_CLK_MUX_MASK) >> JH71X0_CLK_MUX_SHIFT) + 1,
>                         .flags = jh7100_clk_data[idx].flags,
>                 };
> -               struct jh7100_clk *clk = &priv->reg[idx];
> +               struct jh71x0_clk *clk = &priv->reg[idx];
>                 unsigned int i;
>
>                 for (i = 0; i < init.num_parents; i++) {
> @@ -341,7 +341,7 @@ static int __init clk_starfive_jh7100_probe(struct platform_device *pdev)
>
>                 clk->hw.init = &init;
>                 clk->idx = idx;
> -               clk->max_div = max & JH7100_CLK_DIV_MASK;
> +               clk->max_div = max & JH71X0_CLK_DIV_MASK;
>
>                 ret = devm_clk_hw_register(priv->dev, &clk->hw);
>                 if (ret)
> diff --git a/drivers/clk/starfive/clk-starfive-jh7100.h b/drivers/clk/starfive/clk-starfive-jh7100.h
> deleted file mode 100644
> index a8ba6e25b5ce..000000000000
> --- a/drivers/clk/starfive/clk-starfive-jh7100.h
> +++ /dev/null
> @@ -1,114 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef __CLK_STARFIVE_JH7100_H
> -#define __CLK_STARFIVE_JH7100_H
> -
> -#include <linux/bits.h>
> -#include <linux/clk-provider.h>
> -#include <linux/device.h>
> -#include <linux/spinlock.h>
> -
> -/* register fields */
> -#define JH7100_CLK_ENABLE      BIT(31)
> -#define JH7100_CLK_INVERT      BIT(30)
> -#define JH7100_CLK_MUX_MASK    GENMASK(27, 24)
> -#define JH7100_CLK_MUX_SHIFT   24
> -#define JH7100_CLK_DIV_MASK    GENMASK(23, 0)
> -#define JH7100_CLK_FRAC_MASK   GENMASK(15, 8)
> -#define JH7100_CLK_FRAC_SHIFT  8
> -#define JH7100_CLK_INT_MASK    GENMASK(7, 0)
> -
> -/* fractional divider min/max */
> -#define JH7100_CLK_FRAC_MIN    100UL
> -#define JH7100_CLK_FRAC_MAX    25599UL
> -
> -/* clock data */
> -struct jh7100_clk_data {
> -       const char *name;
> -       unsigned long flags;
> -       u32 max;
> -       u8 parents[4];
> -};
> -
> -#define JH7100_GATE(_idx, _name, _flags, _parent) [_idx] = {                   \
> -       .name = _name,                                                          \
> -       .flags = CLK_SET_RATE_PARENT | (_flags),                                \
> -       .max = JH7100_CLK_ENABLE,                                               \
> -       .parents = { [0] = _parent },                                           \
> -}
> -
> -#define JH7100__DIV(_idx, _name, _max, _parent) [_idx] = {                     \
> -       .name = _name,                                                          \
> -       .flags = 0,                                                             \
> -       .max = _max,                                                            \
> -       .parents = { [0] = _parent },                                           \
> -}
> -
> -#define JH7100_GDIV(_idx, _name, _flags, _max, _parent) [_idx] = {             \
> -       .name = _name,                                                          \
> -       .flags = _flags,                                                        \
> -       .max = JH7100_CLK_ENABLE | (_max),                                      \
> -       .parents = { [0] = _parent },                                           \
> -}
> -
> -#define JH7100_FDIV(_idx, _name, _parent) [_idx] = {                           \
> -       .name = _name,                                                          \
> -       .flags = 0,                                                             \
> -       .max = JH7100_CLK_FRAC_MAX,                                             \
> -       .parents = { [0] = _parent },                                           \
> -}
> -
> -#define JH7100__MUX(_idx, _name, _nparents, ...) [_idx] = {                    \
> -       .name = _name,                                                          \
> -       .flags = 0,                                                             \
> -       .max = ((_nparents) - 1) << JH7100_CLK_MUX_SHIFT,                       \
> -       .parents = { __VA_ARGS__ },                                             \
> -}
> -
> -#define JH7100_GMUX(_idx, _name, _flags, _nparents, ...) [_idx] = {            \
> -       .name = _name,                                                          \
> -       .flags = _flags,                                                        \
> -       .max = JH7100_CLK_ENABLE |                                              \
> -               (((_nparents) - 1) << JH7100_CLK_MUX_SHIFT),                    \
> -       .parents = { __VA_ARGS__ },                                             \
> -}
> -
> -#define JH7100_MDIV(_idx, _name, _max, _nparents, ...) [_idx] = {              \
> -       .name = _name,                                                          \
> -       .flags = 0,                                                             \
> -       .max = (((_nparents) - 1) << JH7100_CLK_MUX_SHIFT) | (_max),            \
> -       .parents = { __VA_ARGS__ },                                             \
> -}
> -
> -#define JH7100__GMD(_idx, _name, _flags, _max, _nparents, ...) [_idx] = {      \
> -       .name = _name,                                                          \
> -       .flags = _flags,                                                        \
> -       .max = JH7100_CLK_ENABLE |                                              \
> -               (((_nparents) - 1) << JH7100_CLK_MUX_SHIFT) | (_max),           \
> -       .parents = { __VA_ARGS__ },                                             \
> -}
> -
> -#define JH7100__INV(_idx, _name, _parent) [_idx] = {                           \
> -       .name = _name,                                                          \
> -       .flags = CLK_SET_RATE_PARENT,                                           \
> -       .max = JH7100_CLK_INVERT,                                               \
> -       .parents = { [0] = _parent },                                           \
> -}
> -
> -struct jh7100_clk {
> -       struct clk_hw hw;
> -       unsigned int idx;
> -       unsigned int max_div;
> -};
> -
> -struct jh7100_clk_priv {
> -       /* protect clk enable and set rate/parent from happening at the same time */
> -       spinlock_t rmw_lock;
> -       struct device *dev;
> -       void __iomem *base;
> -       struct clk_hw *pll[3];
> -       struct jh7100_clk reg[];
> -};
> -
> -const struct clk_ops *starfive_jh7100_clk_ops(u32 max);
> -
> -#endif
> diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.c b/drivers/clk/starfive/clk-starfive-jh71x0.c
> index 6c07b61b4a32..b372083d11c3 100644
> --- a/drivers/clk/starfive/clk-starfive-jh71x0.c
> +++ b/drivers/clk/starfive/clk-starfive-jh71x0.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * StarFive JH7100 Clock Generator Driver
> + * StarFive JH71X0 Clock Generator Driver
>   *
>   * Copyright (C) 2021-2022 Emil Renner Berthing <kernel@esmil.dk>
>   */
> @@ -10,29 +10,29 @@
>  #include <linux/device.h>
>  #include <linux/io.h>
>
> -#include "clk-starfive-jh7100.h"
> +#include "clk-starfive-jh71x0.h"
>
> -static struct jh7100_clk *jh7100_clk_from(struct clk_hw *hw)
> +static struct jh71x0_clk *jh71x0_clk_from(struct clk_hw *hw)
>  {
> -       return container_of(hw, struct jh7100_clk, hw);
> +       return container_of(hw, struct jh71x0_clk, hw);
>  }
>
> -static struct jh7100_clk_priv *jh7100_priv_from(struct jh7100_clk *clk)
> +static struct jh71x0_clk_priv *jh71x0_priv_from(struct jh71x0_clk *clk)
>  {
> -       return container_of(clk, struct jh7100_clk_priv, reg[clk->idx]);
> +       return container_of(clk, struct jh71x0_clk_priv, reg[clk->idx]);
>  }
>
> -static u32 jh7100_clk_reg_get(struct jh7100_clk *clk)
> +static u32 jh71x0_clk_reg_get(struct jh71x0_clk *clk)
>  {
> -       struct jh7100_clk_priv *priv = jh7100_priv_from(clk);
> +       struct jh71x0_clk_priv *priv = jh71x0_priv_from(clk);
>         void __iomem *reg = priv->base + 4 * clk->idx;
>
>         return readl_relaxed(reg);
>  }
>
> -static void jh7100_clk_reg_rmw(struct jh7100_clk *clk, u32 mask, u32 value)
> +static void jh71x0_clk_reg_rmw(struct jh71x0_clk *clk, u32 mask, u32 value)
>  {
> -       struct jh7100_clk_priv *priv = jh7100_priv_from(clk);
> +       struct jh71x0_clk_priv *priv = jh71x0_priv_from(clk);
>         void __iomem *reg = priv->base + 4 * clk->idx;
>         unsigned long flags;
>
> @@ -42,41 +42,41 @@ static void jh7100_clk_reg_rmw(struct jh7100_clk *clk, u32 mask, u32 value)
>         spin_unlock_irqrestore(&priv->rmw_lock, flags);
>  }
>
> -static int jh7100_clk_enable(struct clk_hw *hw)
> +static int jh71x0_clk_enable(struct clk_hw *hw)
>  {
> -       struct jh7100_clk *clk = jh7100_clk_from(hw);
> +       struct jh71x0_clk *clk = jh71x0_clk_from(hw);
>
> -       jh7100_clk_reg_rmw(clk, JH7100_CLK_ENABLE, JH7100_CLK_ENABLE);
> +       jh71x0_clk_reg_rmw(clk, JH71X0_CLK_ENABLE, JH71X0_CLK_ENABLE);
>         return 0;
>  }
>
> -static void jh7100_clk_disable(struct clk_hw *hw)
> +static void jh71x0_clk_disable(struct clk_hw *hw)
>  {
> -       struct jh7100_clk *clk = jh7100_clk_from(hw);
> +       struct jh71x0_clk *clk = jh71x0_clk_from(hw);
>
> -       jh7100_clk_reg_rmw(clk, JH7100_CLK_ENABLE, 0);
> +       jh71x0_clk_reg_rmw(clk, JH71X0_CLK_ENABLE, 0);
>  }
>
> -static int jh7100_clk_is_enabled(struct clk_hw *hw)
> +static int jh71x0_clk_is_enabled(struct clk_hw *hw)
>  {
> -       struct jh7100_clk *clk = jh7100_clk_from(hw);
> +       struct jh71x0_clk *clk = jh71x0_clk_from(hw);
>
> -       return !!(jh7100_clk_reg_get(clk) & JH7100_CLK_ENABLE);
> +       return !!(jh71x0_clk_reg_get(clk) & JH71X0_CLK_ENABLE);
>  }
>
> -static unsigned long jh7100_clk_recalc_rate(struct clk_hw *hw,
> +static unsigned long jh71x0_clk_recalc_rate(struct clk_hw *hw,
>                                             unsigned long parent_rate)
>  {
> -       struct jh7100_clk *clk = jh7100_clk_from(hw);
> -       u32 div = jh7100_clk_reg_get(clk) & JH7100_CLK_DIV_MASK;
> +       struct jh71x0_clk *clk = jh71x0_clk_from(hw);
> +       u32 div = jh71x0_clk_reg_get(clk) & JH71X0_CLK_DIV_MASK;
>
>         return div ? parent_rate / div : 0;
>  }
>
> -static int jh7100_clk_determine_rate(struct clk_hw *hw,
> +static int jh71x0_clk_determine_rate(struct clk_hw *hw,
>                                      struct clk_rate_request *req)
>  {
> -       struct jh7100_clk *clk = jh7100_clk_from(hw);
> +       struct jh71x0_clk *clk = jh71x0_clk_from(hw);
>         unsigned long parent = req->best_parent_rate;
>         unsigned long rate = clamp(req->rate, req->min_rate, req->max_rate);
>         unsigned long div = min_t(unsigned long, DIV_ROUND_UP(parent, rate), clk->max_div);
> @@ -102,232 +102,232 @@ static int jh7100_clk_determine_rate(struct clk_hw *hw,
>         return 0;
>  }
>
> -static int jh7100_clk_set_rate(struct clk_hw *hw,
> +static int jh71x0_clk_set_rate(struct clk_hw *hw,
>                                unsigned long rate,
>                                unsigned long parent_rate)
>  {
> -       struct jh7100_clk *clk = jh7100_clk_from(hw);
> +       struct jh71x0_clk *clk = jh71x0_clk_from(hw);
>         unsigned long div = clamp(DIV_ROUND_CLOSEST(parent_rate, rate),
>                                   1UL, (unsigned long)clk->max_div);
>
> -       jh7100_clk_reg_rmw(clk, JH7100_CLK_DIV_MASK, div);
> +       jh71x0_clk_reg_rmw(clk, JH71X0_CLK_DIV_MASK, div);
>         return 0;
>  }
>
> -static unsigned long jh7100_clk_frac_recalc_rate(struct clk_hw *hw,
> +static unsigned long jh71x0_clk_frac_recalc_rate(struct clk_hw *hw,
>                                                  unsigned long parent_rate)
>  {
> -       struct jh7100_clk *clk = jh7100_clk_from(hw);
> -       u32 reg = jh7100_clk_reg_get(clk);
> -       unsigned long div100 = 100 * (reg & JH7100_CLK_INT_MASK) +
> -                              ((reg & JH7100_CLK_FRAC_MASK) >> JH7100_CLK_FRAC_SHIFT);
> +       struct jh71x0_clk *clk = jh71x0_clk_from(hw);
> +       u32 reg = jh71x0_clk_reg_get(clk);
> +       unsigned long div100 = 100 * (reg & JH71X0_CLK_INT_MASK) +
> +                              ((reg & JH71X0_CLK_FRAC_MASK) >> JH71X0_CLK_FRAC_SHIFT);
>
> -       return (div100 >= JH7100_CLK_FRAC_MIN) ? 100 * parent_rate / div100 : 0;
> +       return (div100 >= JH71X0_CLK_FRAC_MIN) ? 100 * parent_rate / div100 : 0;
>  }
>
> -static int jh7100_clk_frac_determine_rate(struct clk_hw *hw,
> +static int jh71x0_clk_frac_determine_rate(struct clk_hw *hw,
>                                           struct clk_rate_request *req)
>  {
>         unsigned long parent100 = 100 * req->best_parent_rate;
>         unsigned long rate = clamp(req->rate, req->min_rate, req->max_rate);
>         unsigned long div100 = clamp(DIV_ROUND_CLOSEST(parent100, rate),
> -                                    JH7100_CLK_FRAC_MIN, JH7100_CLK_FRAC_MAX);
> +                                    JH71X0_CLK_FRAC_MIN, JH71X0_CLK_FRAC_MAX);
>         unsigned long result = parent100 / div100;
>
> -       /* clamp the result as in jh7100_clk_determine_rate() above */
> -       if (result > req->max_rate && div100 < JH7100_CLK_FRAC_MAX)
> +       /* clamp the result as in jh71x0_clk_determine_rate() above */
> +       if (result > req->max_rate && div100 < JH71X0_CLK_FRAC_MAX)
>                 result = parent100 / (div100 + 1);
> -       if (result < req->min_rate && div100 > JH7100_CLK_FRAC_MIN)
> +       if (result < req->min_rate && div100 > JH71X0_CLK_FRAC_MIN)
>                 result = parent100 / (div100 - 1);
>
>         req->rate = result;
>         return 0;
>  }
>
> -static int jh7100_clk_frac_set_rate(struct clk_hw *hw,
> +static int jh71x0_clk_frac_set_rate(struct clk_hw *hw,
>                                     unsigned long rate,
>                                     unsigned long parent_rate)
>  {
> -       struct jh7100_clk *clk = jh7100_clk_from(hw);
> +       struct jh71x0_clk *clk = jh71x0_clk_from(hw);
>         unsigned long div100 = clamp(DIV_ROUND_CLOSEST(100 * parent_rate, rate),
> -                                    JH7100_CLK_FRAC_MIN, JH7100_CLK_FRAC_MAX);
> -       u32 value = ((div100 % 100) << JH7100_CLK_FRAC_SHIFT) | (div100 / 100);
> +                                    JH71X0_CLK_FRAC_MIN, JH71X0_CLK_FRAC_MAX);
> +       u32 value = ((div100 % 100) << JH71X0_CLK_FRAC_SHIFT) | (div100 / 100);
>
> -       jh7100_clk_reg_rmw(clk, JH7100_CLK_DIV_MASK, value);
> +       jh71x0_clk_reg_rmw(clk, JH71X0_CLK_DIV_MASK, value);
>         return 0;
>  }
>
> -static u8 jh7100_clk_get_parent(struct clk_hw *hw)
> +static u8 jh71x0_clk_get_parent(struct clk_hw *hw)
>  {
> -       struct jh7100_clk *clk = jh7100_clk_from(hw);
> -       u32 value = jh7100_clk_reg_get(clk);
> +       struct jh71x0_clk *clk = jh71x0_clk_from(hw);
> +       u32 value = jh71x0_clk_reg_get(clk);
>
> -       return (value & JH7100_CLK_MUX_MASK) >> JH7100_CLK_MUX_SHIFT;
> +       return (value & JH71X0_CLK_MUX_MASK) >> JH71X0_CLK_MUX_SHIFT;
>  }
>
> -static int jh7100_clk_set_parent(struct clk_hw *hw, u8 index)
> +static int jh71x0_clk_set_parent(struct clk_hw *hw, u8 index)
>  {
> -       struct jh7100_clk *clk = jh7100_clk_from(hw);
> -       u32 value = (u32)index << JH7100_CLK_MUX_SHIFT;
> +       struct jh71x0_clk *clk = jh71x0_clk_from(hw);
> +       u32 value = (u32)index << JH71X0_CLK_MUX_SHIFT;
>
> -       jh7100_clk_reg_rmw(clk, JH7100_CLK_MUX_MASK, value);
> +       jh71x0_clk_reg_rmw(clk, JH71X0_CLK_MUX_MASK, value);
>         return 0;
>  }
>
> -static int jh7100_clk_mux_determine_rate(struct clk_hw *hw,
> +static int jh71x0_clk_mux_determine_rate(struct clk_hw *hw,
>                                          struct clk_rate_request *req)
>  {
>         return clk_mux_determine_rate_flags(hw, req, 0);
>  }
>
> -static int jh7100_clk_get_phase(struct clk_hw *hw)
> +static int jh71x0_clk_get_phase(struct clk_hw *hw)
>  {
> -       struct jh7100_clk *clk = jh7100_clk_from(hw);
> -       u32 value = jh7100_clk_reg_get(clk);
> +       struct jh71x0_clk *clk = jh71x0_clk_from(hw);
> +       u32 value = jh71x0_clk_reg_get(clk);
>
> -       return (value & JH7100_CLK_INVERT) ? 180 : 0;
> +       return (value & JH71X0_CLK_INVERT) ? 180 : 0;
>  }
>
> -static int jh7100_clk_set_phase(struct clk_hw *hw, int degrees)
> +static int jh71x0_clk_set_phase(struct clk_hw *hw, int degrees)
>  {
> -       struct jh7100_clk *clk = jh7100_clk_from(hw);
> +       struct jh71x0_clk *clk = jh71x0_clk_from(hw);
>         u32 value;
>
>         if (degrees == 0)
>                 value = 0;
>         else if (degrees == 180)
> -               value = JH7100_CLK_INVERT;
> +               value = JH71X0_CLK_INVERT;
>         else
>                 return -EINVAL;
>
> -       jh7100_clk_reg_rmw(clk, JH7100_CLK_INVERT, value);
> +       jh71x0_clk_reg_rmw(clk, JH71X0_CLK_INVERT, value);
>         return 0;
>  }
>
>  #ifdef CONFIG_DEBUG_FS
> -static void jh7100_clk_debug_init(struct clk_hw *hw, struct dentry *dentry)
> +static void jh71x0_clk_debug_init(struct clk_hw *hw, struct dentry *dentry)
>  {
> -       static const struct debugfs_reg32 jh7100_clk_reg = {
> +       static const struct debugfs_reg32 jh71x0_clk_reg = {
>                 .name = "CTRL",
>                 .offset = 0,
>         };
> -       struct jh7100_clk *clk = jh7100_clk_from(hw);
> -       struct jh7100_clk_priv *priv = jh7100_priv_from(clk);
> +       struct jh71x0_clk *clk = jh71x0_clk_from(hw);
> +       struct jh71x0_clk_priv *priv = jh71x0_priv_from(clk);
>         struct debugfs_regset32 *regset;
>
>         regset = devm_kzalloc(priv->dev, sizeof(*regset), GFP_KERNEL);
>         if (!regset)
>                 return;
>
> -       regset->regs = &jh7100_clk_reg;
> +       regset->regs = &jh71x0_clk_reg;
>         regset->nregs = 1;
>         regset->base = priv->base + 4 * clk->idx;
>
>         debugfs_create_regset32("registers", 0400, dentry, regset);
>  }
>  #else
> -#define jh7100_clk_debug_init NULL
> +#define jh71x0_clk_debug_init NULL
>  #endif
>
> -static const struct clk_ops jh7100_clk_gate_ops = {
> -       .enable = jh7100_clk_enable,
> -       .disable = jh7100_clk_disable,
> -       .is_enabled = jh7100_clk_is_enabled,
> -       .debug_init = jh7100_clk_debug_init,
> +static const struct clk_ops jh71x0_clk_gate_ops = {
> +       .enable = jh71x0_clk_enable,
> +       .disable = jh71x0_clk_disable,
> +       .is_enabled = jh71x0_clk_is_enabled,
> +       .debug_init = jh71x0_clk_debug_init,
>  };
>
> -static const struct clk_ops jh7100_clk_div_ops = {
> -       .recalc_rate = jh7100_clk_recalc_rate,
> -       .determine_rate = jh7100_clk_determine_rate,
> -       .set_rate = jh7100_clk_set_rate,
> -       .debug_init = jh7100_clk_debug_init,
> +static const struct clk_ops jh71x0_clk_div_ops = {
> +       .recalc_rate = jh71x0_clk_recalc_rate,
> +       .determine_rate = jh71x0_clk_determine_rate,
> +       .set_rate = jh71x0_clk_set_rate,
> +       .debug_init = jh71x0_clk_debug_init,
>  };
>
> -static const struct clk_ops jh7100_clk_fdiv_ops = {
> -       .recalc_rate = jh7100_clk_frac_recalc_rate,
> -       .determine_rate = jh7100_clk_frac_determine_rate,
> -       .set_rate = jh7100_clk_frac_set_rate,
> -       .debug_init = jh7100_clk_debug_init,
> +static const struct clk_ops jh71x0_clk_fdiv_ops = {
> +       .recalc_rate = jh71x0_clk_frac_recalc_rate,
> +       .determine_rate = jh71x0_clk_frac_determine_rate,
> +       .set_rate = jh71x0_clk_frac_set_rate,
> +       .debug_init = jh71x0_clk_debug_init,
>  };
>
> -static const struct clk_ops jh7100_clk_gdiv_ops = {
> -       .enable = jh7100_clk_enable,
> -       .disable = jh7100_clk_disable,
> -       .is_enabled = jh7100_clk_is_enabled,
> -       .recalc_rate = jh7100_clk_recalc_rate,
> -       .determine_rate = jh7100_clk_determine_rate,
> -       .set_rate = jh7100_clk_set_rate,
> -       .debug_init = jh7100_clk_debug_init,
> +static const struct clk_ops jh71x0_clk_gdiv_ops = {
> +       .enable = jh71x0_clk_enable,
> +       .disable = jh71x0_clk_disable,
> +       .is_enabled = jh71x0_clk_is_enabled,
> +       .recalc_rate = jh71x0_clk_recalc_rate,
> +       .determine_rate = jh71x0_clk_determine_rate,
> +       .set_rate = jh71x0_clk_set_rate,
> +       .debug_init = jh71x0_clk_debug_init,
>  };
>
> -static const struct clk_ops jh7100_clk_mux_ops = {
> -       .determine_rate = jh7100_clk_mux_determine_rate,
> -       .set_parent = jh7100_clk_set_parent,
> -       .get_parent = jh7100_clk_get_parent,
> -       .debug_init = jh7100_clk_debug_init,
> +static const struct clk_ops jh71x0_clk_mux_ops = {
> +       .determine_rate = jh71x0_clk_mux_determine_rate,
> +       .set_parent = jh71x0_clk_set_parent,
> +       .get_parent = jh71x0_clk_get_parent,
> +       .debug_init = jh71x0_clk_debug_init,
>  };
>
> -static const struct clk_ops jh7100_clk_gmux_ops = {
> -       .enable = jh7100_clk_enable,
> -       .disable = jh7100_clk_disable,
> -       .is_enabled = jh7100_clk_is_enabled,
> -       .determine_rate = jh7100_clk_mux_determine_rate,
> -       .set_parent = jh7100_clk_set_parent,
> -       .get_parent = jh7100_clk_get_parent,
> -       .debug_init = jh7100_clk_debug_init,
> +static const struct clk_ops jh71x0_clk_gmux_ops = {
> +       .enable = jh71x0_clk_enable,
> +       .disable = jh71x0_clk_disable,
> +       .is_enabled = jh71x0_clk_is_enabled,
> +       .determine_rate = jh71x0_clk_mux_determine_rate,
> +       .set_parent = jh71x0_clk_set_parent,
> +       .get_parent = jh71x0_clk_get_parent,
> +       .debug_init = jh71x0_clk_debug_init,
>  };
>
> -static const struct clk_ops jh7100_clk_mdiv_ops = {
> -       .recalc_rate = jh7100_clk_recalc_rate,
> -       .determine_rate = jh7100_clk_determine_rate,
> -       .get_parent = jh7100_clk_get_parent,
> -       .set_parent = jh7100_clk_set_parent,
> -       .set_rate = jh7100_clk_set_rate,
> -       .debug_init = jh7100_clk_debug_init,
> +static const struct clk_ops jh71x0_clk_mdiv_ops = {
> +       .recalc_rate = jh71x0_clk_recalc_rate,
> +       .determine_rate = jh71x0_clk_determine_rate,
> +       .get_parent = jh71x0_clk_get_parent,
> +       .set_parent = jh71x0_clk_set_parent,
> +       .set_rate = jh71x0_clk_set_rate,
> +       .debug_init = jh71x0_clk_debug_init,
>  };
>
> -static const struct clk_ops jh7100_clk_gmd_ops = {
> -       .enable = jh7100_clk_enable,
> -       .disable = jh7100_clk_disable,
> -       .is_enabled = jh7100_clk_is_enabled,
> -       .recalc_rate = jh7100_clk_recalc_rate,
> -       .determine_rate = jh7100_clk_determine_rate,
> -       .get_parent = jh7100_clk_get_parent,
> -       .set_parent = jh7100_clk_set_parent,
> -       .set_rate = jh7100_clk_set_rate,
> -       .debug_init = jh7100_clk_debug_init,
> +static const struct clk_ops jh71x0_clk_gmd_ops = {
> +       .enable = jh71x0_clk_enable,
> +       .disable = jh71x0_clk_disable,
> +       .is_enabled = jh71x0_clk_is_enabled,
> +       .recalc_rate = jh71x0_clk_recalc_rate,
> +       .determine_rate = jh71x0_clk_determine_rate,
> +       .get_parent = jh71x0_clk_get_parent,
> +       .set_parent = jh71x0_clk_set_parent,
> +       .set_rate = jh71x0_clk_set_rate,
> +       .debug_init = jh71x0_clk_debug_init,
>  };
>
> -static const struct clk_ops jh7100_clk_inv_ops = {
> -       .get_phase = jh7100_clk_get_phase,
> -       .set_phase = jh7100_clk_set_phase,
> -       .debug_init = jh7100_clk_debug_init,
> +static const struct clk_ops jh71x0_clk_inv_ops = {
> +       .get_phase = jh71x0_clk_get_phase,
> +       .set_phase = jh71x0_clk_set_phase,
> +       .debug_init = jh71x0_clk_debug_init,
>  };
>
> -const struct clk_ops *starfive_jh7100_clk_ops(u32 max)
> +const struct clk_ops *starfive_jh71x0_clk_ops(u32 max)
>  {
> -       if (max & JH7100_CLK_DIV_MASK) {
> -               if (max & JH7100_CLK_MUX_MASK) {
> -                       if (max & JH7100_CLK_ENABLE)
> -                               return &jh7100_clk_gmd_ops;
> -                       return &jh7100_clk_mdiv_ops;
> +       if (max & JH71X0_CLK_DIV_MASK) {
> +               if (max & JH71X0_CLK_MUX_MASK) {
> +                       if (max & JH71X0_CLK_ENABLE)
> +                               return &jh71x0_clk_gmd_ops;
> +                       return &jh71x0_clk_mdiv_ops;
>                 }
> -               if (max & JH7100_CLK_ENABLE)
> -                       return &jh7100_clk_gdiv_ops;
> -               if (max == JH7100_CLK_FRAC_MAX)
> -                       return &jh7100_clk_fdiv_ops;
> -               return &jh7100_clk_div_ops;
> +               if (max & JH71X0_CLK_ENABLE)
> +                       return &jh71x0_clk_gdiv_ops;
> +               if (max == JH71X0_CLK_FRAC_MAX)
> +                       return &jh71x0_clk_fdiv_ops;
> +               return &jh71x0_clk_div_ops;
>         }
>
> -       if (max & JH7100_CLK_MUX_MASK) {
> -               if (max & JH7100_CLK_ENABLE)
> -                       return &jh7100_clk_gmux_ops;
> -               return &jh7100_clk_mux_ops;
> +       if (max & JH71X0_CLK_MUX_MASK) {
> +               if (max & JH71X0_CLK_ENABLE)
> +                       return &jh71x0_clk_gmux_ops;
> +               return &jh71x0_clk_mux_ops;
>         }
>
> -       if (max & JH7100_CLK_ENABLE)
> -               return &jh7100_clk_gate_ops;
> +       if (max & JH71X0_CLK_ENABLE)
> +               return &jh71x0_clk_gate_ops;
>
> -       return &jh7100_clk_inv_ops;
> +       return &jh71x0_clk_inv_ops;
>  }
> -EXPORT_SYMBOL_GPL(starfive_jh7100_clk_ops);
> +EXPORT_SYMBOL_GPL(starfive_jh71x0_clk_ops);
> diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.h b/drivers/clk/starfive/clk-starfive-jh71x0.h
> new file mode 100644
> index 000000000000..baf4b5cb4b8a
> --- /dev/null
> +++ b/drivers/clk/starfive/clk-starfive-jh71x0.h
> @@ -0,0 +1,114 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __CLK_STARFIVE_JH71X0_H
> +#define __CLK_STARFIVE_JH71X0_H
> +
> +#include <linux/bits.h>
> +#include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/spinlock.h>
> +
> +/* register fields */
> +#define JH71X0_CLK_ENABLE      BIT(31)
> +#define JH71X0_CLK_INVERT      BIT(30)
> +#define JH71X0_CLK_MUX_MASK    GENMASK(27, 24)
> +#define JH71X0_CLK_MUX_SHIFT   24
> +#define JH71X0_CLK_DIV_MASK    GENMASK(23, 0)
> +#define JH71X0_CLK_FRAC_MASK   GENMASK(15, 8)
> +#define JH71X0_CLK_FRAC_SHIFT  8
> +#define JH71X0_CLK_INT_MASK    GENMASK(7, 0)
> +
> +/* fractional divider min/max */
> +#define JH71X0_CLK_FRAC_MIN    100UL
> +#define JH71X0_CLK_FRAC_MAX    25599UL
> +
> +/* clock data */
> +struct jh71x0_clk_data {
> +       const char *name;
> +       unsigned long flags;
> +       u32 max;
> +       u8 parents[4];
> +};
> +
> +#define JH71X0_GATE(_idx, _name, _flags, _parent) [_idx] = {                   \
> +       .name = _name,                                                          \
> +       .flags = CLK_SET_RATE_PARENT | (_flags),                                \
> +       .max = JH71X0_CLK_ENABLE,                                               \
> +       .parents = { [0] = _parent },                                           \
> +}
> +
> +#define JH71X0__DIV(_idx, _name, _max, _parent) [_idx] = {                     \
> +       .name = _name,                                                          \
> +       .flags = 0,                                                             \
> +       .max = _max,                                                            \
> +       .parents = { [0] = _parent },                                           \
> +}
> +
> +#define JH71X0_GDIV(_idx, _name, _flags, _max, _parent) [_idx] = {             \
> +       .name = _name,                                                          \
> +       .flags = _flags,                                                        \
> +       .max = JH71X0_CLK_ENABLE | (_max),                                      \
> +       .parents = { [0] = _parent },                                           \
> +}
> +
> +#define JH71X0_FDIV(_idx, _name, _parent) [_idx] = {                           \
> +       .name = _name,                                                          \
> +       .flags = 0,                                                             \
> +       .max = JH71X0_CLK_FRAC_MAX,                                             \
> +       .parents = { [0] = _parent },                                           \
> +}
> +
> +#define JH71X0__MUX(_idx, _name, _nparents, ...) [_idx] = {                    \
> +       .name = _name,                                                          \
> +       .flags = 0,                                                             \
> +       .max = ((_nparents) - 1) << JH71X0_CLK_MUX_SHIFT,                       \
> +       .parents = { __VA_ARGS__ },                                             \
> +}
> +
> +#define JH71X0_GMUX(_idx, _name, _flags, _nparents, ...) [_idx] = {            \
> +       .name = _name,                                                          \
> +       .flags = _flags,                                                        \
> +       .max = JH71X0_CLK_ENABLE |                                              \
> +               (((_nparents) - 1) << JH71X0_CLK_MUX_SHIFT),                    \
> +       .parents = { __VA_ARGS__ },                                             \
> +}
> +
> +#define JH71X0_MDIV(_idx, _name, _max, _nparents, ...) [_idx] = {              \
> +       .name = _name,                                                          \
> +       .flags = 0,                                                             \
> +       .max = (((_nparents) - 1) << JH71X0_CLK_MUX_SHIFT) | (_max),            \
> +       .parents = { __VA_ARGS__ },                                             \
> +}
> +
> +#define JH71X0__GMD(_idx, _name, _flags, _max, _nparents, ...) [_idx] = {      \
> +       .name = _name,                                                          \
> +       .flags = _flags,                                                        \
> +       .max = JH71X0_CLK_ENABLE |                                              \
> +               (((_nparents) - 1) << JH71X0_CLK_MUX_SHIFT) | (_max),           \
> +       .parents = { __VA_ARGS__ },                                             \
> +}
> +
> +#define JH71X0__INV(_idx, _name, _parent) [_idx] = {                           \
> +       .name = _name,                                                          \
> +       .flags = CLK_SET_RATE_PARENT,                                           \
> +       .max = JH71X0_CLK_INVERT,                                               \
> +       .parents = { [0] = _parent },                                           \
> +}
> +
> +struct jh71x0_clk {
> +       struct clk_hw hw;
> +       unsigned int idx;
> +       unsigned int max_div;
> +};
> +
> +struct jh71x0_clk_priv {
> +       /* protect clk enable and set rate/parent from happening at the same time */
> +       spinlock_t rmw_lock;
> +       struct device *dev;
> +       void __iomem *base;
> +       struct clk_hw *pll[3];
> +       struct jh71x0_clk reg[];
> +};
> +
> +const struct clk_ops *starfive_jh71x0_clk_ops(u32 max);
> +
> +#endif
> --
> 2.38.1
>
