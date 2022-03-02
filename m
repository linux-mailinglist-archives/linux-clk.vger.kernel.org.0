Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3798C4CA4D0
	for <lists+linux-clk@lfdr.de>; Wed,  2 Mar 2022 13:30:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241768AbiCBMbS (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 2 Mar 2022 07:31:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235226AbiCBMbR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Mar 2022 07:31:17 -0500
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FC71606D7
        for <linux-clk@vger.kernel.org>; Wed,  2 Mar 2022 04:30:33 -0800 (PST)
Received: by mail-qt1-x82c.google.com with SMTP id b23so1412873qtt.6
        for <linux-clk@vger.kernel.org>; Wed, 02 Mar 2022 04:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZK7Z8l0uzHhCLdOEVA+CCXXbkpSYVOIEoN9UnQuldQY=;
        b=MpxUDic94okaoHal13gk9BII8USunlqaMdkNSrB0QGQrijiXWYykhXCb+JIjhw6zkO
         +o0YkuYstuzArZgnuqOhwmW6VAOn+AiYG2FGbL9AzRCMrquA4nt5jJUBJBNyDfeeyv5C
         QsicRn/5wX4x/tCj3lRuT174ONe7Ah46O5DasSRrXG+fluCKZWcwemqx1/Ye+x9OKwLd
         QqiGO2TSzkkURi79A5Ja1ktHq/4CMZE+EuFb2V/5QypBKw2gipTMm+afaAGL98awHXrI
         9zfFFosn6/2314DXJ7ZQFhvejiyFPg2QoPrYCTVX5mvFNEHOempgmf4uujdgb9ljTMiy
         iWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZK7Z8l0uzHhCLdOEVA+CCXXbkpSYVOIEoN9UnQuldQY=;
        b=3r1Gf7+HpLDObQ0tWVJphLqZA9Ecp71hGIb2Onv7P9oUWyvPKff+PFTP1QDBFU2fiE
         /UtSHeUDk9i4TU5Ui7xVaFzMTcJ1OLuGWmH9wRAsQByWf08cyygWaSdZAuVw+MPhjupD
         g/q8Semf8O8XTknx7kmuKUtjKYngzH4mU0s7R4RNpUCn6c1QPwQujWQ0lZmkMXoW8CtH
         HhMw4UEphLMQmScimpUa/g+S573Y98CkyzeA81BDOCqa4n+mDFqoS400tS5kZTvyDqRZ
         PWjFGCXd2+zmLVsQN2UdMxpTz6iICFNo+Bfv/7x+Iv5dm8j62y8MZ1rtkNFfedD03VUW
         cAvw==
X-Gm-Message-State: AOAM530MoU8tP/CiAT6XOLbL+IAYsnE8sh/Ni97UHhidCjQEmJsRoyN4
        DWeudTLX7go0CC5Q6bqf5ePxZ9tBTaVB08jJzf05MOxTIH8=
X-Google-Smtp-Source: ABdhPJzqzgidzn/D62pa5oX+t3VEO1+8ysQGiMvWP4mSLU3vJCie+tJInrTXIxm/YFgfmEaFmPxvfoWbIHGXNnnU5RU=
X-Received: by 2002:ac8:5713:0:b0:2de:4e16:5b25 with SMTP id
 19-20020ac85713000000b002de4e165b25mr23187953qtw.682.1646224232667; Wed, 02
 Mar 2022 04:30:32 -0800 (PST)
MIME-Version: 1.0
References: <20220302110508.69053-1-bhupesh.sharma@linaro.org> <20220302110508.69053-3-bhupesh.sharma@linaro.org>
In-Reply-To: <20220302110508.69053-3-bhupesh.sharma@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 2 Mar 2022 15:30:21 +0300
Message-ID: <CAA8EJprTiGfEnkPOeDPyobdRGkyzyC6=vHivfQ9zsk22JPjM3w@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] clk: qcom: gcc: Add emac GDSC support for SM8150
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, sboyd@kernel.org, tdas@codeaurora.org,
        mturquette@baylibre.com, linux-clk@vger.kernel.org,
        robh+dt@kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>
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

On Wed, 2 Mar 2022 at 14:05, Bhupesh Sharma <bhupesh.sharma@linaro.org> wrote:
>
> Add the EMAC GDSC defines and driver structures for SM8150.
>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  drivers/clk/qcom/gcc-sm8150.c               | 34 +++++++++++++--------
>  include/dt-bindings/clock/qcom,gcc-sm8150.h |  1 +
>  2 files changed, 23 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
> index 245794485719..08ba29e3a835 100644
> --- a/drivers/clk/qcom/gcc-sm8150.c
> +++ b/drivers/clk/qcom/gcc-sm8150.c
> @@ -3448,22 +3448,31 @@ static struct clk_branch gcc_video_xo_clk = {
>         },
>  };
>
> +static struct gdsc emac_gdsc = {
> +       .gdscr = 0x6004,
> +       .pd = {
> +               .name = "emac_gdsc",
> +       },
> +       .pwrsts = PWRSTS_OFF_ON,
> +       .flags = POLL_CFG_GDSCR,
> +};
> +
>  static struct gdsc usb30_prim_gdsc = {
> -               .gdscr = 0xf004,
> -               .pd = {
> -                       .name = "usb30_prim_gdsc",
> -               },
> -               .pwrsts = PWRSTS_OFF_ON,
> -               .flags = POLL_CFG_GDSCR,
> +       .gdscr = 0xf004,
> +       .pd = {
> +               .name = "usb30_prim_gdsc",
> +       },
> +       .pwrsts = PWRSTS_OFF_ON,
> +       .flags = POLL_CFG_GDSCR,

Please move alignment changes to a separate patch

>  };
>
>  static struct gdsc usb30_sec_gdsc = {
> -               .gdscr = 0x10004,
> -               .pd = {
> -                       .name = "usb30_sec_gdsc",
> -               },
> -               .pwrsts = PWRSTS_OFF_ON,
> -               .flags = POLL_CFG_GDSCR,
> +       .gdscr = 0x10004,
> +       .pd = {
> +               .name = "usb30_sec_gdsc",
> +       },
> +       .pwrsts = PWRSTS_OFF_ON,
> +       .flags = POLL_CFG_GDSCR,
>  };
>
>  static struct clk_regmap *gcc_sm8150_clocks[] = {
> @@ -3714,6 +3723,7 @@ static const struct qcom_reset_map gcc_sm8150_resets[] = {
>  };
>
>  static struct gdsc *gcc_sm8150_gdscs[] = {
> +       [EMAC_GDSC] = &emac_gdsc,
>         [USB30_PRIM_GDSC] = &usb30_prim_gdsc,
>         [USB30_SEC_GDSC] = &usb30_sec_gdsc,
>  };
> diff --git a/include/dt-bindings/clock/qcom,gcc-sm8150.h b/include/dt-bindings/clock/qcom,gcc-sm8150.h
> index 3e1a91876610..40596b9ded06 100644
> --- a/include/dt-bindings/clock/qcom,gcc-sm8150.h
> +++ b/include/dt-bindings/clock/qcom,gcc-sm8150.h
> @@ -243,5 +243,6 @@
>  /* GCC GDSCRs */
>  #define USB30_PRIM_GDSC                     4
>  #define USB30_SEC_GDSC                                         5
> +#define EMAC_GDSC                                              6
>
>  #endif
> --
> 2.35.1
>


-- 
With best wishes
Dmitry
