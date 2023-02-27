Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 803906A4A56
	for <lists+linux-clk@lfdr.de>; Mon, 27 Feb 2023 19:53:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbjB0Sxb (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 27 Feb 2023 13:53:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbjB0Sxb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Feb 2023 13:53:31 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B1C51041E
        for <linux-clk@vger.kernel.org>; Mon, 27 Feb 2023 10:53:29 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1pWicd-0002aM-JC; Mon, 27 Feb 2023 19:53:15 +0100
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1pWicb-0008Ja-93; Mon, 27 Feb 2023 19:53:13 +0100
Date:   Mon, 27 Feb 2023 19:53:13 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 3/5] dt-bindings: clock: imx8mp: Add audiomix block
 control
Message-ID: <20230227185313.sfuc3nehayjxbhqw@pengutronix.de>
References: <20230227174308.87286-1-marex@denx.de>
 <20230227174308.87286-3-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230227174308.87286-3-marex@denx.de>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Marek,

sorry for the late review on this, please see below.

On 23-02-27, Marek Vasut wrote:
> Unlike the other block control IPs in i.MX8M, the audiomix is mostly a
> series of clock gates and muxes. Add DT bindings for this IP.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Tested-by: Adam Ford <aford173@gmail.com> #imx8mp-beacon-kit
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jacky Bai <ping.bai@nxp.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Marco Felsch <m.felsch@pengutronix.de>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Richard Cochran <richardcochran@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
> V2: No change
> V3: - Add missed RB from Rob from V1
>     - Rename audio_ahb to plain ahb
> V4: - Rebase on next 20230223
> V5: Add TB from Adam and Alexander
> ---
>  .../bindings/clock/imx8mp-audiomix.yaml       | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml b/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
> new file mode 100644
> index 0000000000000..01b4e1e311cef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP i.MX8MP AudioMIX Block Control Binding
> +
> +maintainers:
> +  - Marek Vasut <marex@denx.de>
> +
> +description: |
> +  NXP i.MX8M Plus AudioMIX is dedicated clock muxing and gating IP
> +  used to control Audio related clock on the SoC.
> +
> +properties:
> +  compatible:
> +    const: fsl,imx8mp-audio-blk-ctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  power-domain-names:
> +    const: audio

Why do we need to specify the name here? We have just one power-domain,
so there should be no need to distinguish between them, or do I miss
something?

> +
> +  clocks:
> +    minItems: 7
> +    maxItems: 7
> +
> +  clock-names:
> +    items:
> +      - const: ahb
> +      - const: sai1
> +      - const: sai2
> +      - const: sai3
> +      - const: sai5
> +      - const: sai6
> +      - const: sai7
> +
> +  '#clock-cells':
> +    const: 1
> +    description:
> +      The clock consumer should specify the desired clock by having the clock
> +      ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8mp-clock.h
> +      for the full list of i.MX8MP IMX8MP_CLK_AUDIOMIX_ clock IDs.
> +
> +required:
> +  - compatible
> +  - reg
> +  - power-domains
> +  - power-domain-names

We can drop the power-domain-names here as well.

> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  # Clock Control Module node:
> +  - |
> +    #include <dt-bindings/clock/imx8mp-clock.h>
> +
> +    clock-controller@30e20000 {
> +        #clock-cells = <1>;
> +        compatible = "fsl,imx8mp-audio-blk-ctrl";
> +        clocks = <&clk IMX8MP_CLK_AUDIO_ROOT>,
> +                 <&clk IMX8MP_CLK_SAI1>,
> +                 <&clk IMX8MP_CLK_SAI2>,
> +                 <&clk IMX8MP_CLK_SAI3>,
> +                 <&clk IMX8MP_CLK_SAI5>,
> +                 <&clk IMX8MP_CLK_SAI6>,
> +                 <&clk IMX8MP_CLK_SAI7>;
> +        clock-names = "ahb",
> +                      "sai1", "sai2", "sai3",
> +                      "sai5", "sai6", "sai7";
> +        power-domains = <&pgc_audio>;
> +        power-domain-names = "audio";
> +        reg = <0x30e20000 0x10000>;

It is common to have have the compatible as the first property followed
by the reg property. We should change this here as well as in the
8mp.dtsi patch.

Regards,
  Marco

> +    };
> +
> +...
> -- 
> 2.39.2
> 
> 
