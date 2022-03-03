Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06BBD4CBB78
	for <lists+linux-clk@lfdr.de>; Thu,  3 Mar 2022 11:34:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbiCCKfa (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 3 Mar 2022 05:35:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231626AbiCCKfa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Mar 2022 05:35:30 -0500
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B17433E20
        for <linux-clk@vger.kernel.org>; Thu,  3 Mar 2022 02:34:44 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id n185so3529642qke.5
        for <linux-clk@vger.kernel.org>; Thu, 03 Mar 2022 02:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Paj8FNxOly+Z1sFlHaZ1IXLZB2+GxhjkskQqoM3JxY8=;
        b=MOxX/pIfiTOHdcUuGfh6LT1Cc8tLMfyk3Kw99M3VF33JijFC6ckUJO1x69xBW1P26N
         sUWWm3HwoEgSn6edanOXeaqALRNvLDAkFWPe6wpn4pGtIGAxVkGqX4AQYhak6lzWNm/u
         0ps0yB/+WjA2yEayDqcUmErk48dHwvz1j8MkHWfwsOvnk+Ocumjo9nVHu3V3QKxzJh8R
         iryNVi1grlruL0lxxIukQto7olpV1KJXn0K5SMUb3a/uTBL24O1rQu/FDjAx5lD63N6I
         NUi9DvCs3DwRNknUOB43Vd1SHL+CBCIb/aYoWLkHpzlhttHUmKoz4Fm8z+OpodTH3s09
         OKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Paj8FNxOly+Z1sFlHaZ1IXLZB2+GxhjkskQqoM3JxY8=;
        b=t/I3njQk5PqKGDazOUF9jrLP0EcMKAHoCOcvzwgNTWA1EmuNv3dHOtzfW6UW4w7FLE
         ZMjmK79fjtgjsgtYFuHzVXKsSfEC2GN2Ifkwh6hi+4ObHjMzxafdvkLpW4X+EY7tUWGo
         yY/YO8OJrowC9LQD88eWj1BaQGr4npnU071KmyN6ajC4hdPnyLhddeZQm5lTmD+Cg/KA
         ZFhY0ws84ywVgVRpJMz54vQdd03zXYMKk7ctaHLJ7Us8kP3BpoNOJXCTygfN0Qq8jQ0K
         aOmzpzJW3TqAIOhj1wHklAHmXU4pnge4VIJxxZL/88/colEtx0iqsy8fSgpGSkQHtYAf
         MbKw==
X-Gm-Message-State: AOAM532HW5XL9w0/C088Ij5JhztkRoPoahxLEmC5SkOu4JktvBMvJOIM
        fOI47AzatjirIqncaQMknSuvQxcfw7F8ar9UrVJZPg==
X-Google-Smtp-Source: ABdhPJwo7qYsBN4V7J+1DL7V0IsCYkDt2z/F+5SxCYlKEhf0gzrrQAla1e+8qSFyuEdV0xn468wsWrAwkznC6fcjC24=
X-Received: by 2002:a37:6215:0:b0:508:c213:72de with SMTP id
 w21-20020a376215000000b00508c21372demr18862608qkb.30.1646303683187; Thu, 03
 Mar 2022 02:34:43 -0800 (PST)
MIME-Version: 1.0
References: <20220303084824.284946-1-bhupesh.sharma@linaro.org> <20220303084824.284946-6-bhupesh.sharma@linaro.org>
In-Reply-To: <20220303084824.284946-6-bhupesh.sharma@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 3 Mar 2022 13:34:32 +0300
Message-ID: <CAA8EJprSU5KAN-pOE1kz49_f8sDD1+1qB80Ga5+RWe5WRnuKPA@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm8150: add ethernet node
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, sboyd@kernel.org, tdas@codeaurora.org,
        mturquette@baylibre.com, linux-clk@vger.kernel.org,
        robh+dt@kernel.org, bjorn.andersson@linaro.org,
        Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 3 Mar 2022 at 11:49, Bhupesh Sharma <bhupesh.sharma@linaro.org> wrote:
>
> From: Vinod Koul <vkoul@kernel.org>
>
> SM8150 SoC supports ethqos ethernet controller so add the node for it

Is it available e.g. in the sm8150 SoC that I have in the phone?

>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> [bhsharma: Correct ethernet interrupt numbers and add power-domain]
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index 6012322a5984..2ed231767535 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -915,6 +915,33 @@ gpi_dma0: dma-controller@800000 {
>                         status = "disabled";
>                 };
>
> +               ethernet: ethernet@20000 {
> +                       compatible = "qcom,sm8150-ethqos";
> +                       reg = <0x0 0x00020000 0x0 0x10000>,
> +                             <0x0 0x00036000 0x0 0x100>;
> +                       reg-names = "stmmaceth", "rgmii";
> +                       clock-names = "stmmaceth", "pclk", "ptp_ref", "rgmii";
> +                       clocks = <&gcc GCC_EMAC_AXI_CLK>,
> +                               <&gcc GCC_EMAC_SLV_AHB_CLK>,
> +                               <&gcc GCC_EMAC_PTP_CLK>,
> +                               <&gcc GCC_EMAC_RGMII_CLK>;
> +                       interrupts = <GIC_SPI 689 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 699 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "macirq", "eth_lpi";
> +
> +                       power-domains = <&gcc EMAC_GDSC>;
> +                       resets = <&gcc GCC_EMAC_BCR>;
> +
> +                       iommus = <&apps_smmu 0x3C0 0x0>;
> +
> +                       snps,tso;
> +                       rx-fifo-depth = <4096>;
> +                       tx-fifo-depth = <4096>;
> +
> +                       status = "disabled";
> +               };
> +
> +
>                 qupv3_id_0: geniqup@8c0000 {
>                         compatible = "qcom,geni-se-qup";
>                         reg = <0x0 0x008c0000 0x0 0x6000>;
> --
> 2.35.1
>


-- 
With best wishes
Dmitry
