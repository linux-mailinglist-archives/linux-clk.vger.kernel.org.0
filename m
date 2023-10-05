Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C69A27B9E24
	for <lists+linux-clk@lfdr.de>; Thu,  5 Oct 2023 16:01:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232029AbjJEN7M (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 5 Oct 2023 09:59:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231993AbjJEN5K (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 Oct 2023 09:57:10 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F93424EB5
        for <linux-clk@vger.kernel.org>; Thu,  5 Oct 2023 04:39:55 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-59e88a28b98so8044127b3.1
        for <linux-clk@vger.kernel.org>; Thu, 05 Oct 2023 04:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696505994; x=1697110794; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0IYhvMB+/tYsbO1if1548hQ+c5ri7I00N34cZT67haM=;
        b=oUq2raYXSnEPlgXt9I4U8k/ylLqsjxW7iy19qYuBTNdQNuQgMb3A7Dpz1OpTKmXVpZ
         bsMOeRUoimciF283mTMFn2aX+N2iDW5xlSkEBBPqawFIl6M/UxoJVSWEsyTulKgmfPRs
         SaU9+JOqJTJPx4MyVA4FiY5en+miU2dTVehnKbFJ5R+cLqZ547vuBbmgyp0VqL0FATmR
         ZbywQHrc3+dm1lA+tG/gYeLz+vkztGYrG8fNPF7egVXjnxqQNu1swsvhbDZlGbr75sid
         kF/Z2tBOpOx57v+pW3Y/YqqpsycOPdvliwuUJbC0UpWPTnev5H22Y+rUIV+UBWMOHiCv
         k1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696505994; x=1697110794;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0IYhvMB+/tYsbO1if1548hQ+c5ri7I00N34cZT67haM=;
        b=VqieHH7o/FipYhy8VgGvGeySIc0XJE0AGg6D0XtbBVztH6CV9RiAqz/pX8ALdjv1Se
         BtrunJPX44964C/8ItOleCrhzYNM9LO1ptG6MQYN6rWz9M3M+EgbNTzEEd+c2iLBWQrr
         ysqsDLgtHvGGNnaa2OrYzbVPWilIQynhjJK4fd/+oo18dEKwcRa+8v8zKihVE7Xyg4YW
         G0pthYcgJn4hcF+X6Rc3Hw5oAWNfEsZqDpQHgXG79h4EZE4IFbLgfPKImBtA600a4Sq1
         iJoyNj79Y2eEgpSBsvdg+Nz/AesNPMTiJc24V7Tt8G8W4mztwH5mFPZpDI16aM50As+Q
         XkWQ==
X-Gm-Message-State: AOJu0YxYOMIJ0di9N6sGRX9pEne4n84K89oDQBKXoc+MMondx65HAVON
        svgfewS3U1YMQwB29qHk3+WP37/mh2vC5eLjaokOig==
X-Google-Smtp-Source: AGHT+IGz2SaLD3aU6BIPbHvTjKIKQ4LlW6fB/f1GiSxG/rP9irvPSE52u5ik65BnlAY9ONpAHojoUO4fqPhRZjJyZyE=
X-Received: by 2002:a0d:d711:0:b0:59f:79e7:6e5d with SMTP id
 z17-20020a0dd711000000b0059f79e76e5dmr716346ywd.15.1696505994365; Thu, 05 Oct
 2023 04:39:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1693996662.git.quic_varada@quicinc.com> <a6d12e3b253d6a55d85f66979ba8b7d9c9ff6072.1693996662.git.quic_varada@quicinc.com>
 <CAA8EJppNsgUNgwadq9oM0_KyORNR5PBZGVZukN6MzAm2KPzC9g@mail.gmail.com> <20231005095744.GA29795@varda-linux.qualcomm.com>
In-Reply-To: <20231005095744.GA29795@varda-linux.qualcomm.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 5 Oct 2023 14:39:43 +0300
Message-ID: <CAA8EJpr124fymnbZ1bO=Dbbxavn3Z=1xOPmFRPnfSp-UB3p6OQ@mail.gmail.com>
Subject: Re: [PATCH v1 07/10] arm64: dts: qcom: ipq5332: populate the opp
 table based on the eFuse
To:     Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     ilia.lin@kernel.org, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, rafael@kernel.org,
        viresh.kumar@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        quic_kathirav@quicinc.com, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 5 Oct 2023 at 12:58, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> On Thu, Sep 07, 2023 at 04:59:28PM +0300, Dmitry Baryshkov wrote:
> > On Thu, 7 Sept 2023 at 08:23, Varadarajan Narayanan
> > <quic_varada@quicinc.com> wrote:
> > >
> > > IPQ53xx have different OPPs available for the CPU based on
> > > SoC variant. This can be determined through use of an eFuse
> > > register present in the silicon.
> > >
> > > Add support to read the eFuse and populate the OPPs based on it.
> > >
> > > Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> > > Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/ipq5332.dtsi | 34 +++++++++++++++++++++++++++++++---
> > >  1 file changed, 31 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> > > index 82761ae..3ca3f34 100644
> > > --- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> > > @@ -91,11 +91,34 @@
> > >         };
> > >
> > >         cpu_opp_table: opp-table-cpu {
> > > -               compatible = "operating-points-v2";
> > > +               compatible = "operating-points-v2-kryo-cpu";
> > >                 opp-shared;
> > > +               nvmem-cells = <&cpu_speed_bin>;
> > > +               nvmem-cell-names = "speed_bin";
> > > +
> > > +               /*
> > > +                * Listed all supported CPU frequencies and opp-supported-hw
> > > +                * values to select CPU frequencies based on the limits fused.
> > > +                * ------------------------------------------------------------
> > > +                * Frequency     BIT3   BIT2   BIT1    BIT0    opp-supported-hw
> > > +                *              1.0GHz 1.2GHz 1.5GHz No Limit
> > > +                * ------------------------------------------------------------
> > > +                * 1100000000     1      1      1       1            0xF
> > > +                * 1500000000     0      0      1       1            0x3
> > > +                * -----------------------------------------------------------
> > > +                */
> >
> > This can probably go to the commit message instead.
>
> Ok
>
> > > +
> > > +               opp-1100000000 {
> > > +                       opp-hz = /bits/ 64 <1100000000>;
> >
> > But your table shows 1.0 GHz and 1.2 GHz instead of 1.1 GHz
>
> Will update it.
>
> > > +                       opp-microvolt = <850000>;
> > > +                       opp-supported-hw = <0xF>;
> > > +                       clock-latency-ns = <200000>;
> > > +               };
> > >
> > > -               opp-1488000000 {
> > > -                       opp-hz = /bits/ 64 <1488000000>;
> > > +               opp-1500000000 {
> > > +                       opp-hz = /bits/ 64 <1500000000>;
> >
> > So, 1.488 GHz or 1.5 GHz?
>
> 1.5 GHz
>
> > > +                       opp-microvolt = <950000>;
> >
> > Which regulator is controlled by this microvolt?
>
> Based on the SKU, the XBL sets up the regulator to provide 950000uV
> on CPUs capable of running 1.5G and 850000uV on other SKUs. Linux
> doesn't control it.

Then why do you need this property here in the first place?


-- 
With best wishes
Dmitry
