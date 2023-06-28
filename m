Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2519D741631
	for <lists+linux-clk@lfdr.de>; Wed, 28 Jun 2023 18:20:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbjF1QUX (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 28 Jun 2023 12:20:23 -0400
Received: from relay06.th.seeweb.it ([5.144.164.167]:55211 "EHLO
        relay06.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231345AbjF1QUX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Jun 2023 12:20:23 -0400
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 04F413F3ED;
        Wed, 28 Jun 2023 18:20:14 +0200 (CEST)
Date:   Wed, 28 Jun 2023 18:20:13 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Lux Aliaga <they@mint.lgbt>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 07/15] dt-bindings: display/msm: Add SM6125 MDSS
Message-ID: <zk6v4h2gtjqss2jf5ntrv2r5dzbkfm6roa6ks763us7mvjt7o6@hfsfw6o7dyrk>
References: <20230627-sm6125-dpu-v2-0-03e430a2078c@somainline.org>
 <20230627-sm6125-dpu-v2-7-03e430a2078c@somainline.org>
 <20230628153051.GA507988-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230628153051.GA507988-robh@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2023-06-28 09:30:51, Rob Herring wrote:
> On Tue, Jun 27, 2023 at 10:14:22PM +0200, Marijn Suijten wrote:
> > Document the SM6125 MDSS.
> > 
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > ---
> >  .../bindings/display/msm/qcom,sm6125-mdss.yaml     | 217 +++++++++++++++++++++
> >  1 file changed, 217 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml
> > new file mode 100644
> > index 000000000000..2525482424cb
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml
> > @@ -0,0 +1,217 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/msm/qcom,sm6125-mdss.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm SM6125 Display MDSS
> > +
> > +maintainers:
> > +  - Marijn Suijten <marijn.suijten@somainline.org>
> > +
> > +description:
> > +  SM6125 MSM Mobile Display Subsystem (MDSS), which encapsulates sub-blocks
> > +  like DPU display controller, DSI and DP interfaces etc.
> > +
> > +$ref: /schemas/display/msm/mdss-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,sm6125-mdss
> > +
> > +  clocks:
> > +    items:
> > +      - description: Display AHB clock from gcc
> > +      - description: Display AHB clock
> > +      - description: Display core clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: iface
> > +      - const: ahb
> > +      - const: core
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +  interconnects:
> > +    maxItems: 2
> > +
> > +  interconnect-names:
> > +    maxItems: 2
> > +
> > +patternProperties:
> > +  "^display-controller@[0-9a-f]+$":
> > +    type: object
> > +    properties:
> > +      compatible:
> > +        const: qcom,sm6125-dpu
> > +
> > +  "^dsi@[0-9a-f]+$":
> > +    type: object
> > +    properties:
> > +      compatible:
> > +        items:
> > +          - const: qcom,sm6125-dsi-ctrl
> > +          - const: qcom,mdss-dsi-ctrl
> > +
> > +  "^phy@[0-9a-f]+$":
> > +    type: object
> > +    properties:
> > +      compatible:
> > +        const: qcom,sm6125-dsi-phy-14nm
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/qcom,dispcc-sm6125.h>
> > +    #include <dt-bindings/clock/qcom,gcc-sm6125.h>
> > +    #include <dt-bindings/clock/qcom,rpmcc.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/power/qcom-rpmpd.h>
> > +
> > +    display-subsystem@5e00000 {
> > +        compatible = "qcom,sm6125-mdss";
> > +        reg = <0x05e00000 0x1000>;
> > +        reg-names = "mdss";
> > +
> > +        interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
> > +        interrupt-controller;
> > +        #interrupt-cells = <1>;
> > +
> > +        clocks = <&gcc GCC_DISP_AHB_CLK>,
> > +                 <&dispcc DISP_CC_MDSS_AHB_CLK>,
> > +                 <&dispcc DISP_CC_MDSS_MDP_CLK>;
> > +        clock-names = "iface",
> > +                      "ahb",
> > +                      "core";
> > +
> > +        power-domains = <&dispcc MDSS_GDSC>;
> > +
> > +        iommus = <&apps_smmu 0x400 0x0>;
> > +
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> > +        ranges;
> > +
> > +        status = "disabled";
> 
> Examples should not be disabled. Drop.

Thanks, I think I missed this in the diff when importing the updated DT
bindings into this example.

Will drop for v3 pending other comments.

More importantly, why is your bot complaining the following about this
example:

    ['qcom,sm6125-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
    ...
    'qcom,sm6125-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']

This is patch 07/15, but that compatible was already added in 05/15.

- Marijn

> > +
> > +        display-controller@5e01000 {
> > +            compatible = "qcom,sm6125-dpu";
> > +            reg = <0x05e01000 0x83208>,
> > +                  <0x05eb0000 0x2008>;
> > +            reg-names = "mdp", "vbif";
> > +
> > +            interrupt-parent = <&mdss>;
> > +            interrupts = <0>;
> > +
> > +            clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> > +                     <&dispcc DISP_CC_MDSS_AHB_CLK>,
> > +                     <&dispcc DISP_CC_MDSS_ROT_CLK>,
> > +                     <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> > +                     <&dispcc DISP_CC_MDSS_MDP_CLK>,
> > +                     <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> > +            clock-names = "bus",
> > +                          "iface",
> > +                          "rot",
> > +                          "lut",
> > +                          "core",
> > +                          "vsync";
> > +            assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> > +            assigned-clock-rates = <19200000>;
> > +
> > +            operating-points-v2 = <&mdp_opp_table>;
> > +            power-domains = <&rpmpd SM6125_VDDCX>;
> > +
> > +            ports {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +
> > +                port@0 {
> > +                    reg = <0>;
> > +                    dpu_intf1_out: endpoint {
> > +                        remote-endpoint = <&mdss_dsi0_in>;
> > +                    };
> > +                };
> > +            };
> > +        };
> > +
> > +        dsi@5e94000 {
> > +            compatible = "qcom,sm6125-dsi-ctrl", "qcom,mdss-dsi-ctrl";
> > +            reg = <0x05e94000 0x400>;
> > +            reg-names = "dsi_ctrl";
> > +
> > +            interrupt-parent = <&mdss>;
> > +            interrupts = <4>;
> > +
> > +            clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
> > +                     <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
> > +                     <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
> > +                     <&dispcc DISP_CC_MDSS_ESC0_CLK>,
> > +                     <&dispcc DISP_CC_MDSS_AHB_CLK>,
> > +                     <&gcc GCC_DISP_HF_AXI_CLK>;
> > +            clock-names = "byte",
> > +                          "byte_intf",
> > +                          "pixel",
> > +                          "core",
> > +                          "iface",
> > +                          "bus";
> > +            assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
> > +                      <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
> > +            assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
> > +
> > +            operating-points-v2 = <&dsi_opp_table>;
> > +            power-domains = <&rpmpd SM6125_VDDCX>;
> > +
> > +            phys = <&mdss_dsi0_phy>;
> > +            phy-names = "dsi";
> > +
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            status = "disabled";
> 
> Ditto.
> 
> > +
> > +            ports {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +
> > +                port@0 {
> > +                    reg = <0>;
> > +                    mdss_dsi0_in: endpoint {
> > +                        remote-endpoint = <&dpu_intf1_out>;
> > +                    };
> > +                };
> > +
> > +                port@1 {
> > +                    reg = <1>;
> > +                    mdss_dsi0_out: endpoint {
> > +                    };
> > +                };
> > +            };
> > +        };
> > +
> > +        phy@5e94400 {
> > +            compatible = "qcom,sm6125-dsi-phy-14nm";
> > +            reg = <0x05e94400 0x100>,
> > +                  <0x05e94500 0x300>,
> > +                  <0x05e94800 0x188>;
> > +            reg-names = "dsi_phy",
> > +                        "dsi_phy_lane",
> > +                        "dsi_pll";
> > +
> > +            #clock-cells = <1>;
> > +            #phy-cells = <0>;
> > +
> > +            clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> > +                     <&rpmcc RPM_SMD_XO_CLK_SRC>;
> > +            clock-names = "iface",
> > +                          "ref";
> > +
> > +            required-opps = <&rpmpd_opp_svs>;
> > +            power-domains = <&rpmpd SM6125_VDDMX>;
> > +
> > +            status = "disabled";
> 
> Ditto
> 
> > +        };
> > +    };
> > +...
> > 
> > -- 
> > 2.41.0
> > 
