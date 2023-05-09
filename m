Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5076FC4EF
	for <lists+linux-clk@lfdr.de>; Tue,  9 May 2023 13:25:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234437AbjEILZE (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 9 May 2023 07:25:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230252AbjEILZD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 May 2023 07:25:03 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B83349CE
        for <linux-clk@vger.kernel.org>; Tue,  9 May 2023 04:25:01 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-b9a6f17f2b6so29837500276.1
        for <linux-clk@vger.kernel.org>; Tue, 09 May 2023 04:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683631500; x=1686223500;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zDYwURL6aB5EYY0Cme2ttwuND/PMKWLi8Em3Bv+6xTA=;
        b=R+/w/DCiQYMNVSHwP8o461Wr84ZWVO+hxSAQb3irmmqSahWvRocgABTOi+O/cdDhGX
         pEPm1+c/LPdOxAGAiNcq5ke85kYwlYSNAIic8gGJAFkCyRlVSvm+VKOUUtjYTbAKSWVo
         Uotbe7NXdcUnv/SLsFEUKPcXwhBCwUKu2x0i8/fg7fbbswe0S5ZpN4O2SJ4NPZiwTSUU
         BUxD22T1Zy3eCOnRdXo/n4H81gWpjctD4zVz9DMBsLRRPOezoS3PtIC5T21h7SJAv5hI
         mTJwALR0BkRiTQZXhwEmgsqkUebkM5zHHhTcyB2B8mi0enq8r5eOafjjjnacd41W0aWL
         su7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683631500; x=1686223500;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zDYwURL6aB5EYY0Cme2ttwuND/PMKWLi8Em3Bv+6xTA=;
        b=QKQsVf+QrAJZ4UwACRMLo6hz/ym73eU5nhuBlDaaThPAB3O25dvRf2cmEYpXgh89lV
         IhsVeGpa1DJ8R78HOct7wSqWXpsRUb3h9z09iAm4Xha7XqAPLuwkN+PKaR5K6hTiCYzK
         AHDl+0OS+R7as4rNb109NSaTiey0ksdQ8D6jDulff5YX4RFnQ5Im77guptqIDQ8ABzmV
         7EegjafJjOX2g3kacv4WLODs3mNsaIKAATxL5dTBfDRfE+7aq/Clr2R+YN68aieaRebo
         7EtoCixhMiYXuHALE/gtzMHwzssxOn75Sv9wsGS+PoUTxBLU9TbJhKvb1YUrp3hvA6ec
         jvCQ==
X-Gm-Message-State: AC+VfDxbADDn0sTdDb6uAqpu1QX2TZfvg33OjFJNTn15piPicvCz5dpV
        ZKuLPl2DiIE+TqnT1JSxjDSlQV0nkJ7/znDX6RkcVg==
X-Google-Smtp-Source: ACHHUZ6xKbFhdzaGmoiDXeRtSJbtJJiXsPKcmktUy3Wxzk6Ifb3O+E7YLlxBL/iwLSCHIes7iX/slLRG29RsTZMq+JM=
X-Received: by 2002:a0d:c604:0:b0:55a:3502:d2ca with SMTP id
 i4-20020a0dc604000000b0055a3502d2camr13380602ywd.13.1683631500305; Tue, 09
 May 2023 04:25:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230419133013.2563-1-quic_tdas@quicinc.com> <20230419133013.2563-5-quic_tdas@quicinc.com>
 <af5435c3-b3a4-af46-444e-023d6ee2304a@linaro.org> <f9a64c13-a8e4-c84d-cf6d-86f4ddf6d288@quicinc.com>
In-Reply-To: <f9a64c13-a8e4-c84d-cf6d-86f4ddf6d288@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 9 May 2023 14:24:49 +0300
Message-ID: <CAA8EJpriwM0Z=q+huhfkHdAG2tGAnVr_BUFkGjJnORia4PfBeg@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: qcom: Add GCC driver support for SDX75
To:     Taniya Das <quic_tdas@quicinc.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        quic_skakitap@quicinc.com, Imran Shaik <quic_imrashai@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_rohiagar@quicinc.com, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 9 May 2023 at 12:14, Taniya Das <quic_tdas@quicinc.com> wrote:
>
> Thanks Dmitry for the review.
>
> On 4/20/2023 3:40 PM, Dmitry Baryshkov wrote:
> >> +static const struct clk_parent_data gcc_parent_data_5[] = {
> >> +    { .fw_name = "emac0_sgmiiphy_rclk" },
> >
> > So, this looks like a mixture of fw_name and index clocks. Please
> > migrate all of fw_names to the .index usage.
> >
>
> I will take care of it to move to index, but does it not bind us to use
> the right index always from DT.
>
> The current approach I was thinking to bind the XO clock to 0th index,
> but we cannot gurantee these external clocks would be placed at the
> right index.

Please define all parent clocks as <0> inside the DT. This way you
ensure ordering of the external clocks. Replace <0> with proper clock
references as devices are added to DT.

>
> >> +    { .index = DT_BI_TCXO },
> >> +};
> >> +
> >> +static const struct parent_map gcc_parent_map_6[] = {
> >> +    { P_EMAC0_SGMIIPHY_TCLK, 0 },
> >> +    { P_BI_TCXO, 2 },
> >> +};
> >> +
> >> +static const struct clk_parent_data gcc_parent_data_6[] = {
> >> +    { .fw_name = "emac0_sgmiiphy_tclk" },
> >> +    { .index = DT_BI_TCXO },
> >> +};
> >> +
> >> +static const struct parent_map gcc_parent_map_7[] = {
> >> +    { P_EMAC0_SGMIIPHY_MAC_RCLK, 0 },
> >> +    { P_BI_TCXO, 2 },
> >> +};
> >> +
> >> +static const struct clk_parent_data gcc_parent_data_7[] = {
> >> +    { .fw_name = "emac0_sgmiiphy_mac_rclk" },
> >> +    { .index = DT_BI_TCXO },
> >> +};
> >> +
> >> +static const struct parent_map gcc_parent_map_8[] = {
> >> +    { P_EMAC0_SGMIIPHY_MAC_TCLK, 0 },
> >> +    { P_BI_TCXO, 2 },
> >> +};
> >> +
> >> +static const struct clk_parent_data gcc_parent_data_8[] = {
> >> +    { .fw_name = "emac0_sgmiiphy_mac_tclk" },
> >> +    { .index = DT_BI_TCXO },
> >> +};
> >> +
> >> +static const struct parent_map gcc_parent_map_9[] = {
> >> +    { P_EMAC1_SGMIIPHY_RCLK, 0 },
> >> +    { P_BI_TCXO, 2 },
> >> +};
> >> +
> >> +static const struct clk_parent_data gcc_parent_data_9[] = {
> >> +    { .fw_name = "emac1_sgmiiphy_rclk" },
> >> +    { .index = DT_BI_TCXO },
> >> +};
> >> +
> >> +static const struct parent_map gcc_parent_map_10[] = {
> >> +    { P_EMAC1_SGMIIPHY_TCLK, 0 },
> >> +    { P_BI_TCXO, 2 },
> >> +};
> >> +
> >> +static const struct clk_parent_data gcc_parent_data_10[] = {
> >> +    { .fw_name = "emac1_sgmiiphy_tclk" },
> >> +    { .index = DT_BI_TCXO },
> >> +};
> >> +
> >> +static const struct parent_map gcc_parent_map_11[] = {
> >> +    { P_EMAC1_SGMIIPHY_MAC_RCLK, 0 },
> >> +    { P_BI_TCXO, 2 },
> >> +};
> >> +
> >> +static const struct clk_parent_data gcc_parent_data_11[] = {
> >> +    { .fw_name = "emac1_sgmiiphy_mac_rclk" },
> >> +    { .index = DT_BI_TCXO },
> >> +};
> >> +
> >> +static const struct parent_map gcc_parent_map_12[] = {
> >> +    { P_EMAC1_SGMIIPHY_MAC_TCLK, 0 },
> >> +    { P_BI_TCXO, 2 },
> >> +};
> >> +
> >> +static const struct clk_parent_data gcc_parent_data_12[] = {
> >> +    { .fw_name = "emac1_sgmiiphy_mac_tclk" },
> >> +    { .index = DT_BI_TCXO },
> >> +};
> >> +
> >> +static const struct parent_map gcc_parent_map_13[] = {
> >> +    { P_PCIE_1_PIPE_CLK, 0 },
> >> +    { P_BI_TCXO, 2 },
> >> +};
> >> +
> >> +static const struct clk_parent_data gcc_parent_data_13[] = {
> >> +    { .fw_name = "pcie_1_pipe_clk" },
> >> +    { .index = DT_BI_TCXO },
> >> +};
> >> +
> >> +static const struct parent_map gcc_parent_map_14[] = {
> >> +    { P_PCIE_2_PIPE_CLK, 0 },
> >> +    { P_BI_TCXO, 2 },
> >> +};
> >> +
> >> +static const struct clk_parent_data gcc_parent_data_14[] = {
> >> +    { .fw_name = "pcie_2_pipe_clk" },
> >> +    { .index = DT_BI_TCXO },
> >> +};
> >> +
> >> +static const struct parent_map gcc_parent_map_15[] = {
> >> +    { P_PCIE20_PHY_AUX_CLK, 0 },
> >> +    { P_BI_TCXO, 2 },
> >> +};
> >> +
> >> +static const struct clk_parent_data gcc_parent_data_15[] = {
> >> +    { .fw_name = "pcie20_phy_aux_clk" },
> >> +    { .index = DT_BI_TCXO },
> >> +};
> >> +
> >> +static const struct parent_map gcc_parent_map_16[] = {
> >> +    { P_PCIE_PIPE_CLK, 0 },
> >> +    { P_BI_TCXO, 2 },
> >> +};
> >> +
> >> +static const struct clk_parent_data gcc_parent_data_16[] = {
> >> +    { .fw_name = "pcie_pipe_clk" },
> >> +    { .index = DT_BI_TCXO },
> >> +};
> >> +
> >> +static const struct parent_map gcc_parent_map_17[] = {
> >> +    { P_BI_TCXO, 0 },
> >> +    { P_GPLL0_OUT_MAIN, 1 },
> >> +    { P_GPLL6_OUT_MAIN, 2 },
> >> +    { P_GPLL0_OUT_EVEN, 6 },
> >> +};
> >> +
> >> +static const struct clk_parent_data gcc_parent_data_17[] = {
> >> +    { .index = DT_BI_TCXO },
> >> +    { .hw = &gpll0.clkr.hw },
> >> +    { .hw = &gpll6.clkr.hw },
> >> +    { .hw = &gpll0_out_even.clkr.hw },
> >> +};
> >> +
> >> +static const struct parent_map gcc_parent_map_18[] = {
> >> +    { P_BI_TCXO, 0 },
> >> +    { P_GPLL0_OUT_MAIN, 1 },
> >> +    { P_GPLL8_OUT_MAIN, 2 },
> >> +    { P_GPLL0_OUT_EVEN, 6 },
> >> +};
> >> +
> >> +static const struct clk_parent_data gcc_parent_data_18[] = {
> >> +    { .index = DT_BI_TCXO },
> >> +    { .hw = &gpll0.clkr.hw },
> >> +    { .hw = &gpll8.clkr.hw },
> >> +    { .hw = &gpll0_out_even.clkr.hw },
> >> +};
> >> +
> >> +static const struct parent_map gcc_parent_map_19[] = {
> >> +    { P_USB3_PHY_WRAPPER_GCC_USB30_PIPE_CLK, 0 },
> >> +    { P_BI_TCXO, 2 },
> >> +};
> >> +
> >> +static const struct clk_parent_data gcc_parent_data_19[] = {
> >> +    { .fw_name = "usb3_phy_wrapper_gcc_usb30_pipe_clk" },
> >> +    { .index = DT_BI_TCXO },
> >> +};
> >> +
> >> +static struct clk_regmap_mux gcc_emac0_cc_sgmiiphy_rx_clk_src = {
> >> +    .reg = 0x71060,
> >> +    .shift = 0,
> >> +    .width = 2,
> >> +    .parent_map = gcc_parent_map_5,
> >> +    .clkr = {
> >> +        .hw.init = &(const struct clk_init_data) {
> >> +            .name = "gcc_emac0_cc_sgmiiphy_rx_clk_src",
> >> +            .parent_data = gcc_parent_data_5,
> >> +            .num_parents = ARRAY_SIZE(gcc_parent_data_5),
> >> +            .ops = &clk_regmap_mux_closest_ops,
> >> +        },
> >> +    },
> >> +};
> >> +
> >> +static struct clk_regmap_mux gcc_emac0_cc_sgmiiphy_tx_clk_src = {
> >> +    .reg = 0x71058,
> >> +    .shift = 0,
> >> +    .width = 2,
> >> +    .parent_map = gcc_parent_map_6,
> >> +    .clkr = {
> >> +        .hw.init = &(const struct clk_init_data) {
> >> +            .name = "gcc_emac0_cc_sgmiiphy_tx_clk_src",
> >> +            .parent_data = gcc_parent_data_6,
> >> +            .num_parents = ARRAY_SIZE(gcc_parent_data_6),
> >> +            .ops = &clk_regmap_mux_closest_ops,
> >> +        },
> >> +    },
> >> +};
> >> +
> >> +static struct clk_regmap_mux gcc_emac0_sgmiiphy_mac_rclk_src = {
> >> +    .reg = 0x71098,
> >> +    .shift = 0,
> >> +    .width = 2,
> >> +    .parent_map = gcc_parent_map_7,
> >> +    .clkr = {
> >> +        .hw.init = &(const struct clk_init_data) {
> >> +            .name = "gcc_emac0_sgmiiphy_mac_rclk_src",
> >> +            .parent_data = gcc_parent_data_7,
> >> +            .num_parents = ARRAY_SIZE(gcc_parent_data_7),
> >> +            .ops = &clk_regmap_mux_closest_ops,
> >> +        },
> >> +    },
> >> +};
> >> +
> >> +static struct clk_regmap_mux gcc_emac0_sgmiiphy_mac_tclk_src = {
> >> +    .reg = 0x71094,
> >> +    .shift = 0,
> >> +    .width = 2,
> >> +    .parent_map = gcc_parent_map_8,
> >> +    .clkr = {
> >> +        .hw.init = &(const struct clk_init_data) {
> >> +            .name = "gcc_emac0_sgmiiphy_mac_tclk_src",
> >> +            .parent_data = gcc_parent_data_8,
> >> +            .num_parents = ARRAY_SIZE(gcc_parent_data_8),
> >> +            .ops = &clk_regmap_mux_closest_ops,
> >> +        },
> >> +    },
> >> +};
> >> +
> >> +static struct clk_regmap_mux gcc_emac1_cc_sgmiiphy_rx_clk_src = {
> >> +    .reg = 0x72060,
> >> +    .shift = 0,
> >> +    .width = 2,
> >> +    .parent_map = gcc_parent_map_9,
> >> +    .clkr = {
> >> +        .hw.init = &(const struct clk_init_data) {
> >> +            .name = "gcc_emac1_cc_sgmiiphy_rx_clk_src",
> >> +            .parent_data = gcc_parent_data_9,
> >> +            .num_parents = ARRAY_SIZE(gcc_parent_data_9),
> >> +            .ops = &clk_regmap_mux_closest_ops,
> >> +        },
> >> +    },
> >> +};
> >> +
> >> +static struct clk_regmap_mux gcc_emac1_cc_sgmiiphy_tx_clk_src = {
> >> +    .reg = 0x72058,
> >> +    .shift = 0,
> >> +    .width = 2,
> >> +    .parent_map = gcc_parent_map_10,
> >> +    .clkr = {
> >> +        .hw.init = &(const struct clk_init_data) {
> >> +            .name = "gcc_emac1_cc_sgmiiphy_tx_clk_src",
> >> +            .parent_data = gcc_parent_data_10,
> >> +            .num_parents = ARRAY_SIZE(gcc_parent_data_10),
> >> +            .ops = &clk_regmap_mux_closest_ops,
> >> +        },
> >> +    },
> >> +};
> >> +
> >> +static struct clk_regmap_mux gcc_emac1_sgmiiphy_mac_rclk_src = {
> >> +    .reg = 0x72098,
> >> +    .shift = 0,
> >> +    .width = 2,
> >> +    .parent_map = gcc_parent_map_11,
> >> +    .clkr = {
> >> +        .hw.init = &(const struct clk_init_data) {
> >> +            .name = "gcc_emac1_sgmiiphy_mac_rclk_src",
> >> +            .parent_data = gcc_parent_data_11,
> >> +            .num_parents = ARRAY_SIZE(gcc_parent_data_11),
> >> +            .ops = &clk_regmap_mux_closest_ops,
> >> +        },
> >> +    },
> >> +};
> >> +
> >> +static struct clk_regmap_mux gcc_emac1_sgmiiphy_mac_tclk_src = {
> >> +    .reg = 0x72094,
> >> +    .shift = 0,
> >> +    .width = 2,
> >> +    .parent_map = gcc_parent_map_12,
> >> +    .clkr = {
> >> +        .hw.init = &(const struct clk_init_data) {
> >> +            .name = "gcc_emac1_sgmiiphy_mac_tclk_src",
> >> +            .parent_data = gcc_parent_data_12,
> >> +            .num_parents = ARRAY_SIZE(gcc_parent_data_12),
> >> +            .ops = &clk_regmap_mux_closest_ops,
> >> +        },
> >> +    },
> >> +};
> >> +
> >> +static struct clk_regmap_mux gcc_pcie_1_pipe_clk_src = {
> >> +    .reg = 0x67084,
> >> +    .shift = 0,
> >> +    .width = 2,
> >> +    .parent_map = gcc_parent_map_13,
> >> +    .clkr = {
> >> +        .hw.init = &(const struct clk_init_data) {
> >> +            .name = "gcc_pcie_1_pipe_clk_src",
> >> +            .parent_data = gcc_parent_data_13,
> >> +            .num_parents = ARRAY_SIZE(gcc_parent_data_13),
> >> +            .ops = &clk_regmap_mux_closest_ops,
> >
> > Are these clocks a clk_regmap_mux_closest_ops in reality
> > clk_regmap_phy_mux_ops?
>
> clk_regmap_phy_mux_ops cannot be used here, as multi parent mux requires
> the .get_parent ops to be supported.

If we strike out the tcxo (= disable from regmap_phy_mux POV), there
is only a single parent.

-- 
With best wishes
Dmitry
