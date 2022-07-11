Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9043568186
	for <lists+linux-clk@lfdr.de>; Wed,  6 Jul 2022 10:30:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbiGFIaC (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 6 Jul 2022 04:30:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232256AbiGFI3x (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Jul 2022 04:29:53 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0372E24966
        for <linux-clk@vger.kernel.org>; Wed,  6 Jul 2022 01:29:21 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id ck6so17228561qtb.7
        for <linux-clk@vger.kernel.org>; Wed, 06 Jul 2022 01:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TUlB7D0EVtJKLbRYI/VBJaDjLfIkrBDiyc+MBceBNJw=;
        b=G+4ns2MicHyAnMKWBTswSLk6EMnGCvvVmN7Hh6rIeqhmdPtKQ+sAI9/ywTY/Zses9k
         VjXIzW37c9Sb540i+Ci+T0zf2G1M7KteiF8/GUeSb9j2DiKZmQOh+huhzdfX+vinM/2x
         n6KwhOJhqsV2teycqzlsQrzEh3Tx0WLw9Vcgxl3SZV4+pmnKhXZ7q+KnvKulNXrIw4gv
         HbWR3PHSB+4R1rCvCT20/L7WSZVSe2plyxa/3aFTEGQjnYH2a0Ak9l8hXJhO7kNpBc3+
         W+ie0qxQ61m9mMby2eyf1/FSUjZdFwpbI1psikXNTgQ+gaZ1M13hV20o/0wT67sFFcLI
         d1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TUlB7D0EVtJKLbRYI/VBJaDjLfIkrBDiyc+MBceBNJw=;
        b=wG/OYEtv8LEKx7Q+tEtX3ex2erxPXmMtU6ZKKinU7Jt50EJ4CS+NY2K9f5ynqQ6a+z
         xnZXaM1sn0Vm4SgKCTH1MDLm+vOOphVxskJoGPdazdvjRhnjuHNF12BHHNcY8gxfSIzK
         UCbHvalccNXKW6gxOGQzXUzRTUaQ49torB3Kjfka1TcuzROpwt6zfniHxSjSV6VXQ/iq
         0isP68Vs1uKmlTCHKxrAkl44W3FxWRIAzuv62q7YB1uuttn8NAwX3hYOUY6tsHkEQeTc
         FyiG1eI4Pc4VMWBGigM9bTyOGb8y7cHEsuh80VNKE5Kz0UItWbCoOhxyFrjVi3zgGYXf
         x4Bg==
X-Gm-Message-State: AJIora9A4+YPXIimTO0XfneHexxcKGNeExpFfUru3MjmZmLoGMJWhFCr
        i49I+0z5ikeaKv5K2qcjkLks/aK8R5PB1ofcxHLl7Q==
X-Google-Smtp-Source: AGRyM1tp6chanGu4lEPBpPBMUDOPfkdef6yQ98JG92tsAoK2RG7slFYHuEBASN7lDE9c44Zpxb2+fBAWjf7GQLGInWE=
X-Received: by 2002:ac8:5dca:0:b0:31e:85b8:8a18 with SMTP id
 e10-20020ac85dca000000b0031e85b88a18mr4988874qtx.370.1657096160170; Wed, 06
 Jul 2022 01:29:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220705202837.667-1-ansuelsmth@gmail.com> <20220705202837.667-5-ansuelsmth@gmail.com>
In-Reply-To: <20220705202837.667-5-ansuelsmth@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 6 Jul 2022 11:29:09 +0300
Message-ID: <CAA8EJppTCZRpi8EqmRSJQiSmaANr=5+q5Rb5KsMYZROSNGpGqA@mail.gmail.com>
Subject: Re: [PATCH 4/5] ARM: dts: qcom: add pxo/cxo clock-output-names for ipq8064
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Tue, 5 Jul 2022 at 23:56, Christian Marangi <ansuelsmth@gmail.com> wrote:
>
> Drivers expect to call pxo/cxo_board clock as pxo/cxo.
> Use clock-output-names to set the correct naming for these fixed clock
> to save drivers that are migrating to parent_data and still use
> parent_names.

Please no. There is no reason to add these names. Let's follow the
example of other platforms.

>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  arch/arm/boot/dts/qcom-ipq8064.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> index 1425a4e4283f..720e27e29627 100644
> --- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> @@ -302,12 +302,14 @@ cxo_board: cxo_board {
>                         compatible = "fixed-clock";
>                         #clock-cells = <0>;
>                         clock-frequency = <25000000>;
> +                       clock-output-names = "cxo";
>                 };
>
>                 pxo_board: pxo_board {
>                         compatible = "fixed-clock";
>                         #clock-cells = <0>;
>                         clock-frequency = <25000000>;
> +                       clock-output-names = "pxo";
>                 };
>
>                 sleep_clk: sleep_clk {
> --
> 2.36.1
>


-- 
With best wishes
Dmitry
