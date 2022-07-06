Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34683567FF5
	for <lists+linux-clk@lfdr.de>; Wed,  6 Jul 2022 09:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231491AbiGFHf7 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 6 Jul 2022 03:35:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231174AbiGFHf6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Jul 2022 03:35:58 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A067122B12
        for <linux-clk@vger.kernel.org>; Wed,  6 Jul 2022 00:35:57 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id q16so17118235qtn.5
        for <linux-clk@vger.kernel.org>; Wed, 06 Jul 2022 00:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vE7hsWCUeMWZy2Wzpcb8FWwmYWHBQ2Wz3nLTP2Qqrig=;
        b=LCI8Lw08fq4ld7UiFf2pJ6QZPcJZCAOgDmJwKhI7zLlfobxgDFL7qNsJzNEs064Uyf
         oXqFPdd4Fqy5qKH+E3ruNdZHO5ruKQdT4b2GRzMihLiSCiJg4LLXg9jcwR3Ig8MWawro
         e6zKk9u02Ir/bGyT6lI3HqcfTAghkmxWGufJ1uRly/XpATAEbsK+0bok/4Gwr0QB15yO
         7oV+6Z63DhaIpJtGuujl55y/5vBXMmEWtUgXLtmZ1R7c9Vd4ERX0aJH0StQcrtzB0GNi
         pwetDA4fBMUovtzpHpiuEAWPvw8YdLQB15n5Zl40IUK1Fx48jWJdZksvvwqWE1BPy6G0
         oV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vE7hsWCUeMWZy2Wzpcb8FWwmYWHBQ2Wz3nLTP2Qqrig=;
        b=279MaBkH7CdhnndwQx3n/KpgYkzlQrkzkm2pqUXsiY2jlNqAUWZevc+9irwhRkzHnc
         Vi8/i0Q45tUKmGpeLNWMmKf3D9JzYVNQwXo22qsxlWc75m9WI0IzY5ENAV1hUl+MNXHA
         SKrmaoyi+9qtqLH5aCd0OEpT+ui1wpiw7ZXZQCiBfG2j/tSrNjLgZUAFQInnXg/7vWo3
         Vt9J0z9WtU8QZffiXuj01jlWdfM5aA4ij6Uh5dtYMIkqR7gzMJcxS0z/KEZNjzX2/k2M
         YzluMykseJQ2QScUYHR/9z87hcnQ0OjwlCFD17v0qFbpQHQxlwG89Uhr22wCh5WHGJCR
         ItHA==
X-Gm-Message-State: AJIora/fa6syi051fnpinK48R+y+Uym9Ya1ilzdtsIl/kCjbaTibFC9U
        vN/qSMxf0vhW3tTIAyTz7MBghk6/L/iysv16/cFsIw==
X-Google-Smtp-Source: AGRyM1vOvI00bt5VWP3RuexPVelL2LK7GORljij3oWO+rugNrWO7/KMoWpvSSQ/Cka8AsGksC7w2wZ5Z3NFKf1ow7uI=
X-Received: by 2002:a05:622a:1981:b0:31a:816f:9d48 with SMTP id
 u1-20020a05622a198100b0031a816f9d48mr32755171qtc.629.1657092956541; Wed, 06
 Jul 2022 00:35:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220705202837.667-1-ansuelsmth@gmail.com> <20220705202837.667-3-ansuelsmth@gmail.com>
In-Reply-To: <20220705202837.667-3-ansuelsmth@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 6 Jul 2022 10:35:45 +0300
Message-ID: <CAA8EJpqrw7V6PYSX24y+U7AbkpLOm_mCTrXvG-TSSPhiYjGJhA@mail.gmail.com>
Subject: Re: [PATCH 2/5] ARM: DTS: qcom: fix dtbs_check warning with new rpmcc clocks
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 5 Jul 2022 at 23:56, Christian Marangi <ansuelsmth@gmail.com> wrote:
>
> Fix dtbs_check warning for new rpmcc Documentation changes and add the
> required clocks.
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  arch/arm/boot/dts/qcom-apq8064.dtsi | 2 ++
>  arch/arm/boot/dts/qcom-ipq8064.dtsi | 2 ++
>  arch/arm/boot/dts/qcom-msm8660.dtsi | 4 +++-
>  3 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
> index 91adcbd54b17..6a88e616ea01 100644
> --- a/arch/arm/boot/dts/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
> @@ -853,6 +853,8 @@ rpm@108000 {
>                         rpmcc: clock-controller {
>                                 compatible = "qcom,rpmcc-apq8064", "qcom,rpmcc";
>                                 #clock-cells = <1>;
> +                               clocks = <&pxo_board>, <&cxo_board>;
> +                               clock-names = "pxo", "cxo";
>                         };
>
>                         regulators {
> diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> index 4b475d98343c..1425a4e4283f 100644
> --- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> @@ -773,6 +773,8 @@ rpm: rpm@108000 {
>                         rpmcc: clock-controller {
>                                 compatible = "qcom,rpmcc-ipq806x", "qcom,rpmcc";
>                                 #clock-cells = <1>;
> +                               clocks = <&pxo_board>;
> +                               clock-names = "pxo";
>                         };
>                 };
>
> diff --git a/arch/arm/boot/dts/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom-msm8660.dtsi
> index b9cded35b1cc..63a501c63cf8 100644
> --- a/arch/arm/boot/dts/qcom-msm8660.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8660.dtsi
> @@ -56,7 +56,7 @@ cxo_board {
>                         clock-frequency = <19200000>;
>                 };
>
> -               pxo_board {
> +               pxo_board: pxo_board {
>                         compatible = "fixed-clock";
>                         #clock-cells = <0>;
>                         clock-frequency = <27000000>;
> @@ -411,6 +411,8 @@ rpm: rpm@104000 {
>                         rpmcc: clock-controller {
>                                 compatible = "qcom,rpmcc-msm8660", "qcom,rpmcc";
>                                 #clock-cells = <1>;
> +                               clocks = <&pxo_board>;
> +                               clock-names = "pxo";
>                         };
>
>                         pm8901-regulators {
> --
> 2.36.1
>


-- 
With best wishes
Dmitry
