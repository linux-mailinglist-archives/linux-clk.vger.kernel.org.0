Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A855E7CA234
	for <lists+linux-clk@lfdr.de>; Mon, 16 Oct 2023 10:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232745AbjJPIrR (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 16 Oct 2023 04:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232861AbjJPIrK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 Oct 2023 04:47:10 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF3D6107
        for <linux-clk@vger.kernel.org>; Mon, 16 Oct 2023 01:47:07 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5a822f96aedso33160757b3.2
        for <linux-clk@vger.kernel.org>; Mon, 16 Oct 2023 01:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697446027; x=1698050827; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W5NJ69kX6Bm+ubsFCLmuvdrCURMYuhfL3kxTQtdRQ+o=;
        b=NDfzuOtuFXPrbza2/JIvk8SJzRnoHadvnc4lSEoz3ZoB1hxYL/9U4eNiPtfpC7e0oY
         g1CaX6WftO0AaYzWCA3Y4bJJAdw2zeWFRAeDwMoGInJYqmBievaBPkYpFJjpzDm2yjv4
         KwpTGHDJM8boc1r23WOYKu3qh9S/vbVigURfoE4C+nkPO2zWlqLKD92jKc/YnB+IdP7I
         FCsi4CYb8etuLw8KJCgPUfPkqPgHq6+BvtfFQnLlPKAn7+jm6vRSbzRT8eb4aOF6bX07
         LJarDWzLy99oJRE/KVCpl0RqauR+k7tVlY4LiQuSF+cL1QpLQqeHddgpVPAvMKHhwBNc
         XzBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697446027; x=1698050827;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W5NJ69kX6Bm+ubsFCLmuvdrCURMYuhfL3kxTQtdRQ+o=;
        b=sDdiw37Gx7wswTplCaZMfoTC4xtYRtmLS874xlmD+KtR0q2Vnt+LNJ4SwH2ZVSASio
         6BYoPINmanZVBDASEVqp7cQPXgxKu3TkBy4ZDkNc5AWTT4JgcUebK07btWXeSDdkz1ET
         SH0CgBB4wUmrXYY3toO5TeTbmv7agtQGyuxWURcTJB3fP+Z7yITQtb8zJrB9FRlBlR0z
         ewg5e6DXX/ult+hpjUrn3w2dAkyMVHYj2Yv9Mx45WFUHqh/HTRUUiEb09K7CSlKNR7oU
         Ow5eMUrukN5uYVToAaasBkdu22iW2G/KwKSKJFuAbJGmvsQfd+AFXqcJOsE24WtFSZ/z
         fVbA==
X-Gm-Message-State: AOJu0YxfRh3TeAPCnSMi0kWHCHKn+dfcFTCelnvcHzwonhHmIdusmn9D
        gaa8tLAgye7uuczCQ0fR0KXvIUOjV/Mnn9Y3aOfMKw==
X-Google-Smtp-Source: AGHT+IG8XvfaO2iDQZru45tosMwj2yXei141FG7yCZLeVf1EhFA7GavmH/c+LB3Hs9LuIeU78Tz3RVP03MeUP/zdExg=
X-Received: by 2002:a05:690c:a08:b0:5a7:af51:e274 with SMTP id
 cg8-20020a05690c0a0800b005a7af51e274mr17967004ywb.18.1697446027019; Mon, 16
 Oct 2023 01:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1697101543.git.quic_varada@quicinc.com> <8f578277cc015cfe9cdca06586b2c82f1a728bad.1697101543.git.quic_varada@quicinc.com>
 <06b823d5c2ec05a940849ac341c48090.sboyd@kernel.org> <20231016070256.GA24128@varda-linux.qualcomm.com>
In-Reply-To: <20231016070256.GA24128@varda-linux.qualcomm.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 16 Oct 2023 11:46:56 +0300
Message-ID: <CAA8EJpoQwDaUa+-WyM6FBzQJo9gn1k2rYLmKSFBLUH00epGJ0Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] clk: qcom: clk-alpha-pll: introduce stromer plus ops
To:     Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, agross@kernel.org,
        andersson@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, ilia.lin@kernel.org,
        konrad.dybcio@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        mturquette@baylibre.com, quic_kathirav@quicinc.com,
        rafael@kernel.org, robh+dt@kernel.org, viresh.kumar@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 16 Oct 2023 at 10:03, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> On Thu, Oct 12, 2023 at 01:55:36PM -0700, Stephen Boyd wrote:
> > Quoting Varadarajan Narayanan (2023-10-12 02:26:17)
> > > Stromer plus APSS PLL does not support dynamic frequency scaling.
> > > To switch between frequencies, we have to shut down the PLL,
> > > configure the L and ALPHA values and turn on again. So introduce the
> > > separate set of ops for Stromer Plus PLL.
> >
> > Does this assume the PLL is always on?
>
> Yes once the PLL is configured by apss-ipq-pll driver, it is always on.
>
> > > Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> > > Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> > > ---
> > > v2:     Use clk_alpha_pll_stromer_determine_rate, instead of adding new
> > >         clk_alpha_pll_stromer_plus_determine_rate as the alpha pll width
> > >         is same for both
> > >
> > >         Fix review comments
> > >                 udelay(50) -> usleep_range(50, 60)
> > >                 Remove SoC-specific from print message
> > > ---
> > >  drivers/clk/qcom/clk-alpha-pll.c | 57 ++++++++++++++++++++++++++++++++++++++++
> > >  drivers/clk/qcom/clk-alpha-pll.h |  1 +
> > >  2 files changed, 58 insertions(+)
> > >
> > > diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> > > index 4edbf77..5221b6c 100644
> > > --- a/drivers/clk/qcom/clk-alpha-pll.c
> > > +++ b/drivers/clk/qcom/clk-alpha-pll.c
> > > @@ -2508,3 +2508,60 @@ const struct clk_ops clk_alpha_pll_stromer_ops = {
> > >         .set_rate = clk_alpha_pll_stromer_set_rate,
> > >  };
> > >  EXPORT_SYMBOL_GPL(clk_alpha_pll_stromer_ops);
> > > +
> > > +static int clk_alpha_pll_stromer_plus_set_rate(struct clk_hw *hw,
> > > +                                              unsigned long rate,
> > > +                                              unsigned long prate)
> > > +{
> > > +       struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> > > +       u32 l, alpha_width = pll_alpha_width(pll);
> > > +       int ret;
> > > +       u64 a;
> > > +
> > > +       rate = alpha_pll_round_rate(rate, prate, &l, &a, alpha_width);
> > > +
> > > +       regmap_write(pll->clkr.regmap, PLL_MODE(pll), 0);
> >
> > There's a theoretical problem here if I understand correctly. A call to
> > clk_enable() can happen while clk_set_rate() is in progress or vice
> > versa. Probably we need some sort of spinlock for this PLL that
> > synchronizes any enable/disable with the rate change so that when we
> > restore the enable bit the clk isn't enabled when it was supposed to be
> > off.
>
> Since the PLL is always on, should we worry about enable/disable?
> If you feel it is better to synchronize with a spin lock, will
> add and post a new revision. Please let me know.

Probably another option might be to change stromer PLL ops to use
prepare/unprepare instead of enable/disable. This way the
clk_prepare_lock() in clk_set_rate() will take care of locking.

>
> Thanks
> Varada



-- 
With best wishes
Dmitry
