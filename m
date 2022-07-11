Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95AB5570346
	for <lists+linux-clk@lfdr.de>; Mon, 11 Jul 2022 14:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbiGKMs0 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 11 Jul 2022 08:48:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231883AbiGKMs0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Jul 2022 08:48:26 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 889C4DECB
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 05:48:24 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id l11so262054qvu.13
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 05:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Aj5HYfV9IYuvXZkZCAwaX1PAJPYJ/AoOyrDvesXSwwk=;
        b=Zb3apUha9cAq1BA9hOtWwSlz+RNHmL1UmJQtiygdDmAPGZvHHvAfE27SrmK0miiC7Q
         andYqvbNd0aTSAN3/ET96Oa4c804ys5EVr4c52PePfihHYooV7GfN2InysP9crwfz8Ki
         BIXIKmP+Q2PCpeBEMCmoJNMBRE8AOvEL47plrTiLTNMXI2+55rsVZI7LL93/t75iFzLi
         CqwoA2naVYrlOY/r43BSvMzYdfzSnKKJ3OwB97YNsT2/co3QzvWaEtyRqgN4itlp2Up6
         C9h729eiQH8BaNNliXzcOiZZkX2u7mIUWEd3uJUU2cPCFDaPDC/KNgkgCXymWO9T+M2g
         GmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Aj5HYfV9IYuvXZkZCAwaX1PAJPYJ/AoOyrDvesXSwwk=;
        b=B4AfXYOzSOYRUwvxnvaQMui/C1UpDYEYm1GkHVuc1SYFX8vt3M03SnVMnnp/z68rSt
         cqwhPbzD5LfvFHhOXu21Q7jbHNnG3/SXg9h8DtekBqH9nAvmge/6nXr36YU3vb7kdsJB
         SKMun5nmDzbDjRouXpOIZm0GwuJQceAKEyI7wilix6hBvC5S3PL7FMxfhUA9unTvekxQ
         1Cm3qXyO3+PBgNTkgVCm8d7u88VgFfNDMeZiI1X/8f7Hk9wy8xn092++s2O+NXWGEMXv
         iW6AyvDdXwSJqdmbMyz4KzCv/31LnvII+COV2+md9BH0pDcClmD3m+ejFzVzN543zLL5
         83fg==
X-Gm-Message-State: AJIora8SdzRG4V+gNt68oMQ8OvXpAXGdZVtb7YpDZNFUQixxYRbBsZD7
        gycjxf4L7t8eCYwR7y9/HPMgpCwgcmsU2VzMzM/HNQ==
X-Google-Smtp-Source: AGRyM1vp3EX05aP+CFsoAhrmsKkFCZqcqJxAjvKik9ouv5Cvl0PexmP8BE1v33MWwg0xIXzf9g6uHdWprBgVGk8l7ps=
X-Received: by 2002:a05:6214:d03:b0:473:7764:2ab with SMTP id
 3-20020a0562140d0300b00473776402abmr1504864qvh.119.1657543703638; Mon, 11 Jul
 2022 05:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220711104719.40939-1-robimarko@gmail.com> <20220711104719.40939-2-robimarko@gmail.com>
In-Reply-To: <20220711104719.40939-2-robimarko@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 11 Jul 2022 15:48:12 +0300
Message-ID: <CAA8EJprfAW7kFSPxs7=LEHLmAVrWhV8KRbUseg8jXyiUbyZuRQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] clk: qcom: apss-ipq6018: fix apcs_alias0_clk_src
To:     Robert Marko <robimarko@gmail.com>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        konrad.dybcio@somainline.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, sivaprak@codeaurora.org,
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

On Mon, 11 Jul 2022 at 14:22, Robert Marko <robimarko@gmail.com> wrote:
>
> While working on IPQ8074 APSS driver it was discovered that IPQ6018 and
> IPQ8074 use almost the same PLL and APSS clocks, however APSS driver is
> currently broken.
>
> More precisely apcs_alias0_clk_src is broken, it was added as regmap_mux
> clock.
> However after debugging why it was always stuck at 800Mhz, it was figured
> out that its not regmap_mux compatible at all.
> It is a simple mux but it uses RCG2 register layout and control bits, so

To utilize control bits, you probably should also use

> utilize the new clk_rcg2_mux_closest_ops to correctly drive it while not
> having to provide a dummy frequency table.

Could you please clarify this. Your new rcg2 ops seems to be literally
equivalent to the clk_regmap_mux_closest_ops provided the shift and
width are set correctly..

> While we are here, use ARRAY_SIZE for number of parents.
>
> Tested on IPQ6018-CP01-C1 reference board and multiple IPQ8074 boards.
>
> Fixes: 5e77b4ef1b19 ("clk: qcom: Add ipq6018 apss clock controller")
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
>  drivers/clk/qcom/apss-ipq6018.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/clk/qcom/apss-ipq6018.c b/drivers/clk/qcom/apss-ipq6018.c
> index d78ff2f310bf..be952d417ded 100644
> --- a/drivers/clk/qcom/apss-ipq6018.c
> +++ b/drivers/clk/qcom/apss-ipq6018.c
> @@ -16,7 +16,7 @@
>  #include "clk-regmap.h"
>  #include "clk-branch.h"
>  #include "clk-alpha-pll.h"
> -#include "clk-regmap-mux.h"
> +#include "clk-rcg.h"
>
>  enum {
>         P_XO,
> @@ -33,16 +33,15 @@ static const struct parent_map parents_apcs_alias0_clk_src_map[] = {
>         { P_APSS_PLL_EARLY, 5 },
>  };
>
> -static struct clk_regmap_mux apcs_alias0_clk_src = {
> -       .reg = 0x0050,
> -       .width = 3,
> -       .shift = 7,

Judging from rcg2 ops, .shift should be set to 8.

> +static struct clk_rcg2 apcs_alias0_clk_src = {
> +       .cmd_rcgr = 0x0050,
> +       .hid_width = 5,
>         .parent_map = parents_apcs_alias0_clk_src_map,
>         .clkr.hw.init = &(struct clk_init_data){
>                 .name = "apcs_alias0_clk_src",
>                 .parent_data = parents_apcs_alias0_clk_src,
> -               .num_parents = 2,
> -               .ops = &clk_regmap_mux_closest_ops,
> +               .num_parents = ARRAY_SIZE(parents_apcs_alias0_clk_src),
> +               .ops = &clk_rcg2_mux_closest_ops,
>                 .flags = CLK_SET_RATE_PARENT,
>         },
>  };
> --
> 2.36.1
>


--
With best wishes
Dmitry
