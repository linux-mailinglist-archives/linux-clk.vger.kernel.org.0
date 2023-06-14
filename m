Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF18872FE98
	for <lists+linux-clk@lfdr.de>; Wed, 14 Jun 2023 14:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244067AbjFNM1K (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 14 Jun 2023 08:27:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243263AbjFNM1J (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Jun 2023 08:27:09 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C3D61FCE
        for <linux-clk@vger.kernel.org>; Wed, 14 Jun 2023 05:27:08 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-b9a6eec8611so877509276.0
        for <linux-clk@vger.kernel.org>; Wed, 14 Jun 2023 05:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686745628; x=1689337628;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j5x6fr5aZlli+8WO85UDIDTo8toG3HYLiO6e7zSPWtQ=;
        b=TwSw2mYy1UhWSZa59w/UT+RjmuJ5V2JXMKBFXyaE14MoUY9/MBG5t6EBp6ereoGpMy
         /+pjca7tW7curhpkDrra70X/0XBVdKQaYzebnhHUTGAW+uUKfzsMqn5rn5Hf6tCHwNc/
         ZNc1jMuiR3r2lLecNC4cFkE4GRjNU4z0hW0TjgUyhUS/hIc7tLu2WB79S7MJydb/PZLD
         on/9GBLMcykD09LU3y+K0gbs0xmHUTdAbyiSf5WPSKXG+SvIilnxJYA5fdNttehNbsQ/
         DZNcpMtNskwmg56bnRBxZQJKJ5xqPlkbV4w7WXzmKDbAToS0CZjMUI1piOge6x9a6VXW
         Hdkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686745628; x=1689337628;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j5x6fr5aZlli+8WO85UDIDTo8toG3HYLiO6e7zSPWtQ=;
        b=QHxXVgwfXRGy6cxPVN1VqYOwne0QW+k8v68XJ7Dm6BNHXu9llXOz4sfbupzHSX/LbO
         QC0AZFjTkc6MEckl9EXbDLe1HrSYQ/Hj5XNqBYivlXTlWfoNEZlHLzZOe9hfclRjpzgi
         MUvJ/lpQbHsfUqB8CZvgf7CZtaxSA/5upCbfAoISKdneEJJSWEbdxLvFSwrTDDldCOwJ
         Ih0dYb8V/kX8hW2UaZ8D0W6WgNNHHfOcQdeNqtLZ7nWY8LnshnVp9wjrBWUl+ameRxq4
         5lkjty93fYLN7xY1OrSd8BuUI3mw+gWkHwbHlWZ6JKEshrl2shbwqZjEDbjJrHnBc49E
         f7JA==
X-Gm-Message-State: AC+VfDwBVZ3W5ZLMNrg6SNN2zoikZYnUdTq2ms+jPWFWT7C45B7IPdLI
        nKTX4CmkxDypJfyvZOqS3VF4FFEjuGmTl35fpzIXRA==
X-Google-Smtp-Source: ACHHUZ6Yz+yPX5k278RwB3vcRO1kIw8EQgvzRzZBfwAKXe6a0M2y+j79oylUsXuqJq8MYmGoMr/2m72G97EvieneTXI=
X-Received: by 2002:a25:7484:0:b0:bb3:9001:e2fe with SMTP id
 p126-20020a257484000000b00bb39001e2femr2049141ybc.13.1686745627812; Wed, 14
 Jun 2023 05:27:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230525172142.9039-1-quic_jkona@quicinc.com> <20230525172142.9039-4-quic_jkona@quicinc.com>
 <6e1d098d-03b9-aa63-a0bf-6cf748a0db0d@linaro.org> <7074f718-a3d5-8a03-3830-77a5a0b15500@linaro.org>
 <df7ab6f7-6c5e-9a7d-8d9b-09ff32da34d6@quicinc.com> <c60bb4d9-1b53-6c60-8b9d-13069bdff882@linaro.org>
 <1a6d46e4-7ec4-262c-dc3b-fc9c988f979e@quicinc.com> <CAA8EJprx6=QztOHi_18uqcGK9WnhkQJ_WP9TyKrsOT=WgKdRaw@mail.gmail.com>
 <695d7b39-2759-690d-5ff8-5aff6b37e39c@quicinc.com>
In-Reply-To: <695d7b39-2759-690d-5ff8-5aff6b37e39c@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 14 Jun 2023 15:26:57 +0300
Message-ID: <CAA8EJpp5_qG2eMQEoHqzboyi8xEbEmx2e1WsKsVQ3d6no0pp5g@mail.gmail.com>
Subject: Re: [PATCH V2 3/6] clk: qcom: clk-alpha-pll: Remove explicit CAL_L
 configuration for EVO PLL
To:     Jagadeesh Kona <quic_jkona@quicinc.com>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>
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

On Wed, 14 Jun 2023 at 14:53, Jagadeesh Kona <quic_jkona@quicinc.com> wrote:
>
>
>
> On 6/9/2023 5:55 PM, Dmitry Baryshkov wrote:
> > On Fri, 9 Jun 2023 at 14:50, Jagadeesh Kona <quic_jkona@quicinc.com> wrote:
> >>
> >> Hi Dmitry,
> >>
> >> Thanks for your review!
> >>
> >> On 6/1/2023 8:13 PM, Dmitry Baryshkov wrote:
> >>> On 01/06/2023 17:33, Jagadeesh Kona wrote:
> >>>> Hi Dmitry, Konrad,
> >>>>
> >>>> On 5/26/2023 9:23 PM, Dmitry Baryshkov wrote:
> >>>>> On 26/05/2023 12:33, Konrad Dybcio wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 25.05.2023 19:21, Jagadeesh Kona wrote:
> >>>>>>> In lucid evo pll, the CAL_L field is part of L value register
> >>>>>>> itself, and
> >>>>>>> the l value configuration passed from clock controller driver includes
> >>>>>>> CAL_L and L values as well. Hence remove explicit configuration of
> >>>>>>> CAL_L
> >>>>>>> for evo pll.
> >>>>>>>
> >>>>>>> Fixes: 260e36606a03 ("clk: qcom: clk-alpha-pll: add Lucid EVO PLL
> >>>>>>> configuration interfaces")
> >>>>>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> >>>>>>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> >>>>>>> ---
> >>>>>> Oh that isn't obvious at first sight, nice find!
> >>>>>>
> >>>>>> I'd suggest a different solution though:
> >>>>>>
> >>>>>> #define LUCID_EVO_PLL_L_LVAL    GENMASK(..
> >>>>>> #define LUCID_EVO_PLL_L_CAL_L    GENMASK(..
> >>>>>>
> >>>>>> lval = FIELD_PREP(LUCID_EVO_PLL_L_LVAL, config->l) |
> >>>>>>          FIELD_PREP(LUCID_EVO_PLL_L_CAL_L, config->cal_l);
> >>>>>>
> >>>>>> This would make the separation between the two parts more explicit
> >>>>>>
> >>>>>> however
> >>>>>>
> >>>>>> config->l would then represent the L value and not the end value
> >>>>>> written to the L register
> >>>>>
> >>>>> Yes. I think there should be separate config->l and config->cal_l
> >>>>> values (and probably ringosc_cal_l, basing on the comment in the
> >>>>> source).
> >>>>> Thanks for your suggestions. In all recent chipsets, L & CAL_L fields
> >>>> are encapsulated in the same register, so we feel it is better to
> >>>> directly pass the combined configuration value in config->l itself and
> >>>> program it directly into register without any additional handling
> >>>> required in pll driver code.
> >>>
> >>> My feeling is that it is better to split it, since these are the
> >>> different fields. The value .l = 0x4444003e doesn't mean anything per se.
> >>>
> >>> Three values are much more meaningful:
> >>> .l = 0x3e,
> >>> .cal_l = 0x44,
> >>> .ringosc_cal_l = 0x44,
> >>>
> >>> Not to mention that this way you don't have to touch pll configuration
> >>> for the existing Lucid EVO PLL. Not to mention that for the Lucid ole
> >>> PLLs the cal_l and ringosc_cal_l values seem to be static (0x44), so
> >>> there is no need to put them to the variable data.
> >>>
> >>
> >> Sure, will keep the existing code as is and will remove this patch in
> >> the next series.
> >>
> >>>>
> >>>> Also the evo pll code is currently reused for both lucid evo and ole
> >>>> pll's. Lucid ole PLL has an additional RINGOSC_CAL_L field along with
> >>>> L, CAL_L fields in the same L register. By passing combined
> >>>> configuration value in config->l itself, we feel we can avoid all the
> >>>> additional handling required in PLL code.
> >>>>
> >>>>> Just a question: is camcc-sm8550 using the same PLL type or is it
> >>>>> some kind of subtype of lucid_evo PLL?
> >>>>>
> >>>> No, it is not the same lucid evo PLL. It uses lucid ole PLL.
> >>>
> >>> Then please don't reuse the clk_lucid_evo_pll_configure() call.
> >>> You can add a new one, which will handle L/CAL_L/RINGOSC_CAL_L differences.
> >>>
> >>
> >> The only difference between evo and ole pll configure is extra
> >> RINGOSC_CAL_L programming needed only for ole pll. We can achieve the
> >> same with clk_lucid_evo_pll_configure() itself by directly including
> >> RINGOSC_CAL_L field in L configuration for OLE PLL's.
> >
> > Please don't, that's all I can say. Those are different fields. By
> > looking at the config->l one can calculate PLL rate. If you overload
> > the config->l with CAL_L and RINGOSC_CAL_L, the purpose of this field
> > is gone.
> >
> > As the CAL_L and RINGOSC_CAL_L fields are static, just move them to
> > the clk_lucid_ole_pll_configure().
> >
>
> We feel it is better to include them in config->l and reuse existing
> code than adding separate function for lucid ole pll configure. Even the
> other pll configurations(like .user_ctl_val) contains multiple fields
> but are passed as a single value from driver.

I suppose it was done this way because these fields are pretty much
not documented in the openly published data. And sometimes this
strikes, one can not easily check PLL's configuration. Or tune
it.There was a discussion whether we should start handling PLL outputs
properly (in CCF) rather than configuring them in a static way.

Also mentioned registers differ from PLL to PLL. For the RISCOSC_CAL_L
and CAL_L the value is static, if I'm not mistaken. Having them in the
configurable field doesn't sound correct.

Last, but not least. We are already handling CAL_L value completely in
the clock-alpha-pll.c for triton, lucid and lucid evo PLLs. What would
be the _reason_ to change that?

>
> We also added a comment in code stating all the fields included in
> config->l value, so user will be aware while calculating PLL frequency.
>
> Thanks,
> Jagadeesh



-- 
With best wishes
Dmitry
