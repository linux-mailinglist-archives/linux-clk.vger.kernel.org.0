Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 804833DDCD5
	for <lists+linux-clk@lfdr.de>; Mon,  2 Aug 2021 17:54:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234551AbhHBPyw (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 2 Aug 2021 11:54:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229979AbhHBPyw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 2 Aug 2021 11:54:52 -0400
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADA41C061760
        for <linux-clk@vger.kernel.org>; Mon,  2 Aug 2021 08:54:41 -0700 (PDT)
Received: by mail-ua1-x92c.google.com with SMTP id t25so5282970uar.13
        for <linux-clk@vger.kernel.org>; Mon, 02 Aug 2021 08:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bOHjsgsD2KdQNZhj/X5isibZlyiTR/fOFK93D80plwc=;
        b=r5JUSa8om3a2IqrDpjkld41fhuxUws2xnvEyOIPhBF7HzWydcqePba+WNnvb4bJDUt
         5wdjOe31hgk6aFtusxeGh5+kD64l249eO1cyWWFwDKiXi3L4jg+NJckJg/ZU22MbMtW3
         o8NJM5hlGV/4szaeU2LFVOkjosNQFl6+pOtD+rZnDsEY35iIt6BzXZ8oYo6l0q+aIxop
         S9Jx99Fv7Y14tXmvYuT2rLXqzSPSEPDdBjTDcSkSZ9Nmo6a9qLZoyBpOdTK8O+cGGIlE
         YJUaZpRJE2F4A3P7dUMIFGi4hafm8QWQjZu8+FwyapCV2NN5Qz6lbUfyxaAKNdsYWJPq
         VqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bOHjsgsD2KdQNZhj/X5isibZlyiTR/fOFK93D80plwc=;
        b=scb+0jjvMi1999Mxmd2g8FpVNhcF0AnHMYn7clit4liGtzTaK/vdbxuZNp7xsZnzGm
         j5hy+n9VqGBMdTxWsv5vWgn0+uhCGpSqaRKCR99im7+sApIgsNWinEVYSPg4cAPIzyzn
         Jtmav/Jax5PfCyGdhU1+AJ+MDSrJ6xV5G7ZmXRTTZKHwzPr3tGGqISi5p5ABfcsNvjTx
         81AFsWCzqSo++Vwvb71u4y+R2uk0XAtzR4MI/zFnpH8lNCQ25kh68WtB06q5TCOOpF7F
         YD3Jz2o1QCO21Nmuwnm5vrDNpZnUWbNanLC4L3NUh08QEdH9ReUAl451cZtRZzTpnATK
         Uwug==
X-Gm-Message-State: AOAM5324TivIis/7hRa1mNeQJCBXBJeiAS47TRBQWxdYaH1zLE9i2nsK
        X5v3fqleBHTE9aGjHxrF0zw93Zgwo4lbW3GqYdzl5w==
X-Google-Smtp-Source: ABdhPJwwFeotl04CyVWoVwYJL+BLVjqfP1mwENz8wyrC099+592Gy8L4lxTA4UG3x5KSJX/W1GWpZxmNvh1fX5bxXBk=
X-Received: by 2002:ab0:6f4b:: with SMTP id r11mr1912984uat.104.1627919680833;
 Mon, 02 Aug 2021 08:54:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210720231837.1576130-1-linus.walleij@linaro.org>
In-Reply-To: <20210720231837.1576130-1-linus.walleij@linaro.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 2 Aug 2021 17:54:04 +0200
Message-ID: <CAPDyKFqSZiHubLDJaQmLtPjLxvU2N9iGY--Yc2ghhyBhcLaqJQ@mail.gmail.com>
Subject: Re: [PATCH 1/2 v2] dt-bindings: clock: u8500: Rewrite in YAML and extend
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 21 Jul 2021 at 01:20, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This rewrites the ux500/u8500 clock bindings in YAML schema and extends them
> with the PRCC reset controller.
>
> The bindings are a bit idiomatic but it just reflects their age, the ux500
> platform was used as guinea pig for early device tree conversion of platforms
> in 2015. The new subnode for the reset controller follows the pattern of the
> old bindings and adds a node with reset-cells for this.
>
> Cc: devicetree@vger.kernel.org
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Apologies for the delay! At some point we should also extend these
bindings by adding a power-domain consumer binding, as each PRCC block
belongs to the core power domain.

FWIW:
Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
> ChangeLog v1->v2:
> - Use an enum for compatible.
> - Mark the reset controller as object (node)
> - Mandate 2 #reset-cells on the reset controller.
> - Small blurb that PRCC 4 does not exist.
> - Rebase on v5.14-rc1
> - Cc Philipp Zabel
> ---
>  .../bindings/clock/stericsson,u8500-clks.yaml | 121 ++++++++++++++++++
>  .../devicetree/bindings/clock/ux500.txt       |  64 ---------
>  .../reset/stericsson,db8500-prcc-reset.h      |  51 ++++++++
>  3 files changed, 172 insertions(+), 64 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml
>  delete mode 100644 Documentation/devicetree/bindings/clock/ux500.txt
>  create mode 100644 include/dt-bindings/reset/stericsson,db8500-prcc-reset.h
>
> diff --git a/Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml b/Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml
> new file mode 100644
> index 000000000000..9bc95a308477
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml
> @@ -0,0 +1,121 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/stericsson,u8500-clks.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ST-Ericsson DB8500 (U8500) clocks
> +
> +maintainers:
> +  - Ulf Hansson <ulf.hansson@linaro.org>
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +description: While named "U8500 clocks" these clocks are inside the
> +  DB8500 digital baseband system-on-chip and its siblings such as
> +  DB8520. These bindings consider the clocks present in the SoC
> +  itself, not off-chip clocks. There are four different on-chip
> +  clocks - RTC (32 kHz), CPU clock (SMP TWD), PRCMU (power reset and
> +  control management unit) clocks and PRCC (peripheral reset and
> +  clock controller) clocks. For some reason PRCC 4 does not exist so
> +  the itemization can be a bit unintuitive.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - stericsson,u8500-clks
> +      - stericsson,u8540-clks
> +      - stericsson,u9540-clks
> +
> +  reg:
> +    items:
> +      - description: PRCC 1 register area
> +      - description: PRCC 2 register area
> +      - description: PRCC 3 register area
> +      - description: PRCC 5 register area
> +      - description: PRCC 6 register area
> +
> +  prcmu-clock:
> +    description: A subnode with one clock cell for PRCMU (power, reset, control
> +      management unit) clocks. The cell indicates which PRCMU clock in the
> +      prcmu-clock node the consumer wants to use.
> +    type: object
> +
> +    properties:
> +      '#clock-cells':
> +        const: 1
> +
> +    additionalProperties: false
> +
> +  prcc-periph-clock:
> +    description: A subnode with two clock cells for PRCC (peripheral
> +      reset and clock controller) peripheral clocks. The first cell indicates
> +      which PRCC block the consumer wants to use, possible values are 1, 2, 3,
> +      5, 6. The second cell indicates which clock inside the PRCC block it
> +      wants, possible values are 0 thru 31.
> +    type: object
> +
> +    properties:
> +      '#clock-cells':
> +        const: 2
> +
> +    additionalProperties: false
> +
> +  prcc-kernel-clock:
> +    description: A subnode with two clock cells for PRCC (peripheral reset
> +      and clock controller) kernel clocks. The first cell indicates which PRCC
> +      block the consumer wants to use, possible values are 1, 2, 3, 5, 6. The
> +      second cell indicates which clock inside the PRCC block it wants, possible
> +      values are 0 thru 31.
> +    type: object
> +
> +    properties:
> +      '#clock-cells':
> +        const: 2
> +
> +    additionalProperties: false
> +
> +  prcc-reset-controller:
> +    description: A subnode with two reset cells for the reset portions of the
> +      PRCC (peripheral reset and clock controller). The first cell indicates
> +      which PRCC block the consumer wants to use, possible values are 1, 2, 3
> +      5 and 6. The second cell indicates which reset line inside the PRCC block
> +      it wants to control, possible values are 0 thru 31.
> +    type: object
> +
> +    properties:
> +      '#reset-cells':
> +        const: 2
> +
> +    additionalProperties: false
> +
> +  rtc32k-clock:
> +    description: A subnode with zero clock cells for the 32kHz RTC clock.
> +    type: object
> +
> +    properties:
> +      '#clock-cells':
> +        const: 0
> +
> +    additionalProperties: false
> +
> +  smp-twd-clock:
> +    description: A subnode for the ARM SMP Timer Watchdog cluster with zero
> +      clock cells.
> +    type: object
> +
> +    properties:
> +      '#clock-cells':
> +        const: 0
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - prcmu-clock
> +  - prcc-periph-clock
> +  - prcc-kernel-clock
> +  - rtc32k-clock
> +  - smp-twd-clock
> +
> +additionalProperties: false
> diff --git a/Documentation/devicetree/bindings/clock/ux500.txt b/Documentation/devicetree/bindings/clock/ux500.txt
> deleted file mode 100644
> index e52bd4b72348..000000000000
> --- a/Documentation/devicetree/bindings/clock/ux500.txt
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -Clock bindings for ST-Ericsson Ux500 clocks
> -
> -Required properties :
> -- compatible : shall contain only one of the following:
> -  "stericsson,u8500-clks"
> -  "stericsson,u8540-clks"
> -  "stericsson,u9540-clks"
> -- reg : shall contain base register location and length for
> -  CLKRST1, 2, 3, 5, and 6 in an array. Note the absence of
> -  CLKRST4, which does not exist.
> -
> -Required subnodes:
> -- prcmu-clock: a subnode with one clock cell for PRCMU (power,
> -  reset, control unit) clocks. The cell indicates which PRCMU
> -  clock in the prcmu-clock node the consumer wants to use.
> -- prcc-periph-clock: a subnode with two clock cells for
> -  PRCC (programmable reset- and clock controller) peripheral clocks.
> -  The first cell indicates which PRCC block the consumer
> -  wants to use, possible values are 1, 2, 3, 5, 6. The second
> -  cell indicates which clock inside the PRCC block it wants,
> -  possible values are 0 thru 31.
> -- prcc-kernel-clock: a subnode with two clock cells for
> -  PRCC (programmable reset- and clock controller) kernel clocks
> -  The first cell indicates which PRCC block the consumer
> -  wants to use, possible values are 1, 2, 3, 5, 6. The second
> -  cell indicates which clock inside the PRCC block it wants,
> -  possible values are 0 thru 31.
> -- rtc32k-clock: a subnode with zero clock cells for the 32kHz
> -  RTC clock.
> -- smp-twd-clock: a subnode for the ARM SMP Timer Watchdog cluster
> -  with zero clock cells.
> -
> -Example:
> -
> -clocks {
> -       compatible = "stericsson,u8500-clks";
> -       /*
> -        * Registers for the CLKRST block on peripheral
> -        * groups 1, 2, 3, 5, 6,
> -        */
> -       reg = <0x8012f000 0x1000>, <0x8011f000 0x1000>,
> -           <0x8000f000 0x1000>, <0xa03ff000 0x1000>,
> -           <0xa03cf000 0x1000>;
> -
> -       prcmu_clk: prcmu-clock {
> -               #clock-cells = <1>;
> -       };
> -
> -       prcc_pclk: prcc-periph-clock {
> -               #clock-cells = <2>;
> -       };
> -
> -       prcc_kclk: prcc-kernel-clock {
> -               #clock-cells = <2>;
> -       };
> -
> -       rtc_clk: rtc32k-clock {
> -               #clock-cells = <0>;
> -       };
> -
> -       smp_twd_clk: smp-twd-clock {
> -               #clock-cells = <0>;
> -       };
> -};
> diff --git a/include/dt-bindings/reset/stericsson,db8500-prcc-reset.h b/include/dt-bindings/reset/stericsson,db8500-prcc-reset.h
> new file mode 100644
> index 000000000000..ea906896c70f
> --- /dev/null
> +++ b/include/dt-bindings/reset/stericsson,db8500-prcc-reset.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef _DT_BINDINGS_STE_PRCC_RESET
> +#define _DT_BINDINGS_STE_PRCC_RESET
> +
> +#define DB8500_PRCC_1                          1
> +#define DB8500_PRCC_2                          2
> +#define DB8500_PRCC_3                          3
> +#define DB8500_PRCC_6                          6
> +
> +/* Reset lines on PRCC 1 */
> +#define DB8500_PRCC_1_RESET_UART0              0
> +#define DB8500_PRCC_1_RESET_UART1              1
> +#define DB8500_PRCC_1_RESET_I2C1               2
> +#define DB8500_PRCC_1_RESET_MSP0               3
> +#define DB8500_PRCC_1_RESET_MSP1               4
> +#define DB8500_PRCC_1_RESET_SDI0               5
> +#define DB8500_PRCC_1_RESET_I2C2               6
> +#define DB8500_PRCC_1_RESET_SPI3               7
> +#define DB8500_PRCC_1_RESET_SLIMBUS0           8
> +#define DB8500_PRCC_1_RESET_I2C4               9
> +#define DB8500_PRCC_1_RESET_MSP3               10
> +#define DB8500_PRCC_1_RESET_PER_MSP3           11
> +#define DB8500_PRCC_1_RESET_PER_MSP1           12
> +#define DB8500_PRCC_1_RESET_PER_MSP0           13
> +#define DB8500_PRCC_1_RESET_PER_SLIMBUS                14
> +
> +/* Reset lines on PRCC 2 */
> +#define DB8500_PRCC_2_RESET_I2C3               0
> +#define DB8500_PRCC_2_RESET_PWL                        1
> +#define DB8500_PRCC_2_RESET_SDI4               2
> +#define DB8500_PRCC_2_RESET_MSP2               3
> +#define DB8500_PRCC_2_RESET_SDI1               4
> +#define DB8500_PRCC_2_RESET_SDI3               5
> +#define DB8500_PRCC_2_RESET_HSIRX              6
> +#define DB8500_PRCC_2_RESET_HSITX              7
> +#define DB8500_PRCC_1_RESET_PER_MSP2           8
> +
> +/* Reset lines on PRCC 3 */
> +#define DB8500_PRCC_3_RESET_SSP0               1
> +#define DB8500_PRCC_3_RESET_SSP1               2
> +#define DB8500_PRCC_3_RESET_I2C0               3
> +#define DB8500_PRCC_3_RESET_SDI2               4
> +#define DB8500_PRCC_3_RESET_SKE                        5
> +#define DB8500_PRCC_3_RESET_UART2              6
> +#define DB8500_PRCC_3_RESET_SDI5               7
> +
> +/* Reset lines on PRCC 6 */
> +#define DB8500_PRCC_3_RESET_RNG                        0
> +
> +#endif
> --
> 2.31.1
>
