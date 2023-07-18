Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E29C757CDE
	for <lists+linux-clk@lfdr.de>; Tue, 18 Jul 2023 15:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232516AbjGRNJU (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 18 Jul 2023 09:09:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232593AbjGRNJK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Jul 2023 09:09:10 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BEBF173D
        for <linux-clk@vger.kernel.org>; Tue, 18 Jul 2023 06:09:05 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-c4cb4919bb9so5642489276.3
        for <linux-clk@vger.kernel.org>; Tue, 18 Jul 2023 06:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689685744; x=1690290544;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=arlaxmSPjr+t49XEWI2/MiuInUH3guP7HZZCse70XY8=;
        b=mxJQziMe1+EUYzx/QahnAIuck+FYWaKf+SVKYZuvBv8cjOo7mfwV+1aMFfaLV39nkX
         00VfhiSeaaTFXA2xFr4gji6QqOuOSycg/rRdgDmTu4J/eLp5wI1v/dKyWuW38F3W5HCO
         A6RCKr1zmyX6/5EzgsiM+HU17nQaOAGt1kSFO2GTRPhwDWZYmqpLttF4RStISKpbc3ZV
         6CxPyVQWkyua2NYR6JbuC2GfM0nWkF/TFG6sFuBfDubLJjWKgf9KFBi4/W0ZnWSe2SI7
         14lYDcPtfxjZJbWCu2Zzn2rH23x0jGuSezFNU0HvQci/hjfZQCs0ZMJbyVZUnMee/tjo
         iypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689685744; x=1690290544;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=arlaxmSPjr+t49XEWI2/MiuInUH3guP7HZZCse70XY8=;
        b=eqt780j6youHgIM6WDdcDEU/5X+NA+vjvaazHO54l7852N+k6erFrgQdjRYLfzjVWB
         ouE9KzEJka6zWe7dr7DmVkCwAWCkKLb3hyuhmWVKnh+UtrXgZcv06M2h8tC8gLhckXcu
         BsSpIf/ZveKniPYInQS7p8Yr+9n78OvvJmHOEr86CVXGvMC+0T92WoQfIYUoQBKWvjr8
         zAU1qDd/23tOgIOYL5o6x/05+v0CIrvmnte/IdKej94PleY9IRU5y8TiBx9+4IClKKEJ
         2Amf/taKRPi9LlUSxxWN1XQCLgPmwpzF66MwMOyWto3OCzgiQPe/Jraf3xe5kGsFQaRj
         rUFw==
X-Gm-Message-State: ABy/qLbaa2zAyUBO1kYEWD1uh+xChRADm1TNBFfPJ9U+K9o3QS5U5HyM
        lEFt22IWpdHGMGZ/t64G3PMJ9j4pb1e/xp6ot0F7Hg==
X-Google-Smtp-Source: APBJJlHK6AyLaAaLUSgPySkhrZdE9+hpDzVV8P2eZl0JHEVw4D2MnsNuSQW/tb8MXm2p7mfzFFevlgeh5Hex06CshMU=
X-Received: by 2002:a25:3446:0:b0:c6d:e3e3:5592 with SMTP id
 b67-20020a253446000000b00c6de3e35592mr12933036yba.54.1689685744321; Tue, 18
 Jul 2023 06:09:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230717-topic-branch_aon_cleanup-v1-0-27784d27a4f4@linaro.org>
 <20230717-topic-branch_aon_cleanup-v1-15-27784d27a4f4@linaro.org>
 <ZLVsN40kYsvQm1z6@gerhold.net> <a193a4dd-0a0a-0d36-6d83-0424cd1dce80@linaro.org>
 <ZLVyvHnKPdOfqAck@gerhold.net> <8c5dc146-c305-bef9-0d97-76a91345ed1a@linaro.org>
 <ZLV5CirE8CZfCjkX@gerhold.net> <9b28a17a-fe9c-3ff0-fa1d-320e75e174d0@linaro.org>
 <ZLZ94Qc6x1HyjJPQ@gerhold.net> <d087d0df-0bf6-c93a-7999-f9385ebb7a38@linaro.org>
In-Reply-To: <d087d0df-0bf6-c93a-7999-f9385ebb7a38@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 18 Jul 2023 16:08:53 +0300
Message-ID: <CAA8EJppFaYPm33Z-_a+AgKYcWsaPE_y=B+agYVQ8z0ncfrvUAw@mail.gmail.com>
Subject: Re: [PATCH 15/15] arm64: dts: qcom: sm6115: Add VDD_CX to GPU_CCC
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 18 Jul 2023 at 15:48, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 18.07.2023 13:56, Stephan Gerhold wrote:
> > On Mon, Jul 17, 2023 at 09:18:21PM +0200, Konrad Dybcio wrote:
> >> On 17.07.2023 19:23, Stephan Gerhold wrote:
> >>> On Mon, Jul 17, 2023 at 07:11:33PM +0200, Konrad Dybcio wrote:
> >>>> On 17.07.2023 18:56, Stephan Gerhold wrote:
> >>>>> On Mon, Jul 17, 2023 at 06:50:18PM +0200, Konrad Dybcio wrote:
> >>>>>> On 17.07.2023 18:28, Stephan Gerhold wrote:
> >>>>>>> On Mon, Jul 17, 2023 at 05:19:22PM +0200, Konrad Dybcio wrote:
> >>>>>>>> The GPU_CC block is powered by VDD_CX. Describe that.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >>>>>>>> ---
> >>>>>>>>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 2 ++
> >>>>>>>>  1 file changed, 2 insertions(+)
> >>>>>>>>
> >>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> >>>>>>>> index 29b5b388cd94..bfaaa1801a4d 100644
> >>>>>>>> --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
> >>>>>>>> +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> >>>>>>>> @@ -1430,6 +1430,8 @@ gpucc: clock-controller@5990000 {
> >>>>>>>>                        clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
> >>>>>>>>                                 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
> >>>>>>>>                                 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
> >>>>>>>> +                      power-domains = <&rpmpd SM6115_VDDCX>;
> >>>>>>>> +                      required-opps = <&rpmpd_opp_low_svs>;
> >>>>>>>
> >>>>>>> Where is this required-opp coming from? The clocks in gpucc seem to have
> >>>>>>> different voltage requirements depending on the rates, but we usually
> >>>>>>> handle that in the OPP tables of the consumer.
> >>>>>> The only lower levels defined for this SoC are VDD_MIN and VDD_RET,
> >>>>>> but quite obviously the GPU won't work then
> >>>>>>
> >>>>>
> >>>>> The levels needed for the GPU clocks to run should be in the GPU OPP
> >>>>> table though, just like e.g. sdhc2_opp_table for the SDCC clocks.
> >>>>>
> >>>>> I still don't really understand why this is specified here. :)
> >>>> The GPU_CC block needs this rail to be at a certain power level for
> >>>> register access. This describes that requirement.
> >>>>
> >>>
> >>> Can you show where this is defined downstream? On a quick look I didn't
> >>> see something like that anywhere. Or is this from some secret
> >>> documentation?
> >> As far as downstream goes, you can notice that no branch's or RCG's
> >> vdd tables ever define a level lower than the one I mentioned.
> >>
> >
> > As far as I can tell the vdd tables are only used when the clock is
> > actually enabled though, not for writing to registers while they are
> > disabled.
> Maybe, but you can also notice that even XO rates require at least
> SVS_LOW to function.

But the vdd tables are related to clock rates, which, in the upstream
design, should be voted by the consumers, not by the clock driver.


-- 
With best wishes
Dmitry
