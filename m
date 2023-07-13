Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96D6375213F
	for <lists+linux-clk@lfdr.de>; Thu, 13 Jul 2023 14:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234372AbjGMM1I (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 13 Jul 2023 08:27:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234358AbjGMM1H (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Jul 2023 08:27:07 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B1EF139
        for <linux-clk@vger.kernel.org>; Thu, 13 Jul 2023 05:27:06 -0700 (PDT)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BD1763F18F
        for <linux-clk@vger.kernel.org>; Thu, 13 Jul 2023 12:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1689251221;
        bh=MsO02jH+ViDHvNLshcafKBuW3XX0NRCU1Az8N0nWX44=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=MI8819JTf4cvauEwJYdoMRYHhkUDTtMBjj2hzDPO4mTxdM+inLKp71PK4yN8D8S2S
         DgIxTDpxp5eJq4WZ7Fz7xu9CdJe/lsunYNc9dqIhs/JB07sQ3Ko9l9ywUauYRlSPDd
         aYdVgUcDE2vcu+GW8E83qiyL6AWT/jK5pR4mtmY+DQQxNtIzKh33wj4ZwtgfYx+8yu
         tFvdCNOJvjqt3AC4mwIzJK/x72Ppri9nYsyC89Sxzohp52ZS+PFBMp5MSCujKU+NCZ
         gUcKOaIVQZNoiYs3x+/Y5N5IXOqrBUorkwKwoT9bTlGTxHk960vcYVf7rzAR82DGkz
         UbCdRX5rc9D4A==
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-40349e4eb27so6250941cf.1
        for <linux-clk@vger.kernel.org>; Thu, 13 Jul 2023 05:27:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689251219; x=1691843219;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MsO02jH+ViDHvNLshcafKBuW3XX0NRCU1Az8N0nWX44=;
        b=gxWp9TW5byW382pMvxJ/JGo44ebWh3Xi54CcgaZ9nZSbzDe27nDYnmetBZFMgL8pX0
         S5lExhSGKflnOKWeG9oHP2FVsDEhyPip2QhHax5XEoilxjZyTMzbwW36u3Lu9/WoyF8d
         pPA7vWc/RqMUUq3pnISzaGKMXEzPW3f7UCVVB/omY/GO8ucZ7GH4C/16tEPyAuvAOfXp
         2PSlHxtzLXr+7XV2n52o618y6ln3BqphqFnIcavX3Us3hTZemSnUrt79vW+LPPLStUfb
         o3qH/o6xiTANvKQrlM+7DKvkkCfDv0q7D53uutpzK8Lu87srACMrPv8LlIDG8Ev0kJ2n
         7sBA==
X-Gm-Message-State: ABy/qLbEmQpDlj22zPz+jnwx2vSzobheI6sjrJKD36SQMy9nZCX9b9VB
        CUAEEsrEDHOfp4UfWtFn0T0DKVGlODFcAjz5bdamYH75RBHrkovb39+Wvc7p80/MseERj6ajHFP
        8C91TO9NCVmLZluNKes7qI7csuRyIn5mfRqHb1JzMpy/y2upB0iNPdg==
X-Received: by 2002:a05:622a:1003:b0:403:a927:1947 with SMTP id d3-20020a05622a100300b00403a9271947mr1557742qte.23.1689251218757;
        Thu, 13 Jul 2023 05:26:58 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHiJAYN6Pa6kcyaVBR/pEfPZkiEZPz1qi+73jGLWtlr2nXCVmtaDK8lr5QdSWsD1G3HyAJnAeHte89dSxxB+Rw=
X-Received: by 2002:a05:622a:1003:b0:403:a927:1947 with SMTP id
 d3-20020a05622a100300b00403a9271947mr1557722qte.23.1689251218536; Thu, 13 Jul
 2023 05:26:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230704064610.292603-1-xingyu.wu@starfivetech.com> <20230704064610.292603-2-xingyu.wu@starfivetech.com>
In-Reply-To: <20230704064610.292603-2-xingyu.wu@starfivetech.com>
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date:   Thu, 13 Jul 2023 14:26:42 +0200
Message-ID: <CAJM55Z8vj6KvpKZxRVh0+G_LCXrpnXzOR+oBad-igkHVTD_J=Q@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 1/7] dt-bindings: clock: Add StarFive JH7110 PLL
 clock generator
To:     Xingyu Wu <xingyu.wu@starfivetech.com>
Cc:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Conor Dooley <conor@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        William Qiu <william.qiu@starfivetech.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 4 Jul 2023 at 08:49, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
>
> Add bindings for the PLL clock generator on the JH7110 RISC-V SoC.
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../bindings/clock/starfive,jh7110-pll.yaml   | 46 +++++++++++++++++++
>  .../dt-bindings/clock/starfive,jh7110-crg.h   |  6 +++
>  2 files changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml
>
> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml
> new file mode 100644
> index 000000000000..beb78add5a8d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-pll.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/starfive,jh7110-pll.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 PLL Clock Generator
> +
> +description:
> +  These PLLs are high speed, low jitter frequency synthesizers in JH7110.

..synthesizers in the JH7110.

> +  Each PLL works in integer mode or fraction mode, with configuration
> +  registers in the sys syscon. So the PLLs node should be a child of
> +  SYS-SYSCON node.
> +  The formula for calculating frequency is
> +  Fvco = Fref * (NI + NF) / M / Q1
> +
> +maintainers:
> +  - Xingyu Wu <xingyu.wu@starfivetech.com>
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-pll
> +
> +  clocks:
> +    maxItems: 1
> +    description: Main Oscillator (24 MHz)
> +
> +  '#clock-cells':
> +    const: 1
> +    description:
> +      See <dt-bindings/clock/starfive,jh7110-crg.h> for valid indices.
> +
> +required:
> +  - compatible
> +  - clocks
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller {
> +      compatible = "starfive,jh7110-pll";
> +      clocks = <&osc>;
> +      #clock-cells = <1>;
> +    };
> diff --git a/include/dt-bindings/clock/starfive,jh7110-crg.h b/include/dt-bindings/clock/starfive,jh7110-crg.h
> index 06257bfd9ac1..086a6ddcf380 100644
> --- a/include/dt-bindings/clock/starfive,jh7110-crg.h
> +++ b/include/dt-bindings/clock/starfive,jh7110-crg.h
> @@ -6,6 +6,12 @@
>  #ifndef __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
>  #define __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
>
> +/* PLL clocks */
> +#define JH7110_CLK_PLL0_OUT                    0
> +#define JH7110_CLK_PLL1_OUT                    1
> +#define JH7110_CLK_PLL2_OUT                    2
> +#define JH7110_PLLCLK_END                      3

It would be nice if these names followed the same pattern as the
clocks below. Eg. something like JH7110_PLLCLK_PLL?_OUT and
JH7110_PLLCLK_END.

But maybe these defines are not even needed, since you just do <&pll
0>, <&pll 1> and it's obvious what that means.

>  /* SYSCRG clocks */
>  #define JH7110_SYSCLK_CPU_ROOT                 0
>  #define JH7110_SYSCLK_CPU_CORE                 1
> --
> 2.25.1
>
