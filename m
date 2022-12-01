Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC1BB63F912
	for <lists+linux-clk@lfdr.de>; Thu,  1 Dec 2022 21:24:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbiLAUYj (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 1 Dec 2022 15:24:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbiLAUYh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Dec 2022 15:24:37 -0500
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A53E4A5A1
        for <linux-clk@vger.kernel.org>; Thu,  1 Dec 2022 12:24:36 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id y83so3517925yby.12
        for <linux-clk@vger.kernel.org>; Thu, 01 Dec 2022 12:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FjfvCOjv2/yG/ojv9MlnZSCT5THwaCBgV3EWhXGxAro=;
        b=BaBYdJeYbAo1Z8bdg+NxBKYA+e4dKA3AqanBNNAO5kAWQWMnkBwQhrLqYxzQ+CEtQ0
         l6YI7mi7VsVqh0EvnzOCX6b1sP57f5l1kEVVrb7APp2xb+mKX+muFf+y8uSDsevNqULv
         hMSfCtQRtL7rJI/9U0+AK94Ch/F3qFnCyRaHT4HgyX/Cz+hfNnK0Iei3d9tCM8Rd6XmT
         CLc+zS4PfxOo3Ay2dyGrDHsX7MlCFuU7J0Oar3nOrwo76PZHPcwkkNpJ4vVo6eX3WKAi
         0PsteOIVx0FvMsmAjPxDH1v0R7A+0NEHx2UzBvi0xMu6DoRqUiEvEDRxcpF6JILLz5Ri
         zifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FjfvCOjv2/yG/ojv9MlnZSCT5THwaCBgV3EWhXGxAro=;
        b=pI1j5/6GsfSqLryYn1QQ1QQMcuAp+bAWp2qW8L77RPdXMSUSU/rz8lHzDbT2zBbolQ
         nN+HoJsM479N1AHP7Gv1ypsTCpt6EVdlP7b4N8+kd+gKVd9wdZq9Sk0X08lkjNV8fAxQ
         Xqa0QaMrIfdfjvpjkvkR7YSyYptep1afxqGI7e3Kb560fvui4/q6RFIT/BUYGJK0E/Ke
         OtIlx+A7DQT0B1BJ2ZUnOJt/cJ1qE4ToMa8v3QeSlNpr8nw5fZotFFeFIiOMzIxuhM68
         8AiK3/bA7wlVCyu3o72cEXrOnBLzOBcv34wJKmoDATtFBk24QEAWV8x9EXo263wN3cwk
         jMow==
X-Gm-Message-State: ANoB5pmChULaZ2o0+Bbze3F6zRG+5RJch9+DUWgySo8TJ2Q24hiMnmQN
        PuYG4YDQBErVNBwmRyOBNoQQkm6d9pYlk/Lf5Dl1cg==
X-Google-Smtp-Source: AA0mqf74FWOm0tteWzae/XcZEO8KaaorNZKfNHTAc3RBYptWqtuEIZKriNrPluz4RF2SCUTFiwW3uGU8XN2XMI+30Pw=
X-Received: by 2002:a25:cf4b:0:b0:6f4:6cd2:501b with SMTP id
 f72-20020a25cf4b000000b006f46cd2501bmr28681595ybg.194.1669926275649; Thu, 01
 Dec 2022 12:24:35 -0800 (PST)
MIME-Version: 1.0
References: <20221130131001.20912-1-dmitry.baryshkov@linaro.org>
 <20221130131001.20912-9-dmitry.baryshkov@linaro.org> <0a12ee5d-8bbe-7fbc-1d43-1c1b5ca750af@linaro.org>
In-Reply-To: <0a12ee5d-8bbe-7fbc-1d43-1c1b5ca750af@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 1 Dec 2022 22:24:24 +0200
Message-ID: <CAA8EJppXs94yWZQcKy2GHdsoHthat9gdQ491O7Pro_pH-nM0jA@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] clk: qcom: rpm: drop the platform from clock definitions
To:     Alex Elder <elder@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 1 Dec 2022 at 21:21, Alex Elder <elder@linaro.org> wrote:
>
> On 11/30/22 7:10 AM, Dmitry Baryshkov wrote:
> > A single clock definition can be used on different platforms. Thus the
> > platform part of the clock name is not correct (and can be misleading).
> >
> > Remove the platform-specific part of the defined clock.
>
> I didn't realize this was "clk_rpm" and not "clk_rpmh"...
>
> Why didn't you also manufacture the "active only" (or just
> "active"?) clocks here too?  I didn't look closely but it
> seems like the definitions in "clk-rpm.c" could be transformed
> further, as you have done in "clk-rpmh.c".

Yes, but it would require more work, as it's not a clear _ao suffix.
I'd have to add '_clk' vs '_a_clk' suffixes (so, doable, but requires
more work).

> And if you do that, maybe it's a second series?

Maybe.

>
> Anyway, this generally looks good to me but I'll wait until
> you re-send to sign off on it.
>
> Thanks.
>
>                                         -Alex
>
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/clk/qcom/clk-rpm.c | 194 +++++++++++++++++--------------------
> >   1 file changed, 89 insertions(+), 105 deletions(-)
> >
> > diff --git a/drivers/clk/qcom/clk-rpm.c b/drivers/clk/qcom/clk-rpm.c
> > index 747c473b0b5e..bcab76776571 100644
> > --- a/drivers/clk/qcom/clk-rpm.c
> > +++ b/drivers/clk/qcom/clk-rpm.c
> > @@ -31,11 +31,11 @@ static const struct clk_parent_data gcc_cxo[] = {
> >       { .fw_name = "cxo", .name = "cxo_board" },
> >   };
> >
> > -#define DEFINE_CLK_RPM(_platform, _name, _active, r_id)                            \
> > -     static struct clk_rpm _platform##_##_active;                          \
> > -     static struct clk_rpm _platform##_##_name = {                         \
> > +#define DEFINE_CLK_RPM(_name, _active, r_id)                               \
> > +     static struct clk_rpm clk_rpm_##_active;                              \
> > +     static struct clk_rpm clk_rpm_##_name = {                             \
> >               .rpm_clk_id = (r_id),                                         \
> > -             .peer = &_platform##_##_active,                               \
> > +             .peer = &clk_rpm_##_active,                                   \
> >               .rate = INT_MAX,                                              \
> >               .hw.init = &(struct clk_init_data){                           \
> >                       .ops = &clk_rpm_ops,                                  \
> > @@ -44,9 +44,9 @@ static const struct clk_parent_data gcc_cxo[] = {
> >                       .num_parents = ARRAY_SIZE(gcc_pxo),                   \
> >               },                                                            \
> >       };                                                                    \
> > -     static struct clk_rpm _platform##_##_active = {                       \
> > +     static struct clk_rpm clk_rpm_##_active = {                           \
> >               .rpm_clk_id = (r_id),                                         \
> > -             .peer = &_platform##_##_name,                                 \
> > +             .peer = &clk_rpm_##_name,                                     \
> >               .active_only = true,                                          \
> >               .rate = INT_MAX,                                              \
> >               .hw.init = &(struct clk_init_data){                           \
> > @@ -57,20 +57,20 @@ static const struct clk_parent_data gcc_cxo[] = {
> >               },                                                            \
> >       }
> >
> > -#define DEFINE_CLK_RPM_XO_BUFFER(_platform, _name, _active, offset)        \
> > -     static struct clk_rpm _platform##_##_name = {                         \
> > +#define DEFINE_CLK_RPM_XO_BUFFER(_name, _active, offset)                   \
> > +     static struct clk_rpm clk_rpm_##_name = {                             \
> >               .rpm_clk_id = QCOM_RPM_CXO_BUFFERS,                           \
> >               .xo_offset = (offset),                                        \
> >               .hw.init = &(struct clk_init_data){                           \
> > -                     .ops = &clk_rpm_xo_ops,                       \
> > +                     .ops = &clk_rpm_xo_ops,                               \
> >                       .name = #_name,                                       \
> >                       .parent_data = gcc_cxo,                               \
> >                       .num_parents = ARRAY_SIZE(gcc_cxo),                   \
> >               },                                                            \
> >       }
> >
> > -#define DEFINE_CLK_RPM_FIXED(_platform, _name, _active, r_id, r)           \
> > -     static struct clk_rpm _platform##_##_name = {                         \
> > +#define DEFINE_CLK_RPM_FIXED(_name, _active, r_id, r)                              \
> > +     static struct clk_rpm clk_rpm_##_name = {                             \
> >               .rpm_clk_id = (r_id),                                         \
> >               .rate = (r),                                                  \
> >               .hw.init = &(struct clk_init_data){                           \
> > @@ -403,37 +403,47 @@ static const struct clk_ops clk_rpm_ops = {
> >   };
> >
> >   /* MSM8660/APQ8060 */
> > -DEFINE_CLK_RPM(msm8660, afab_clk, afab_a_clk, QCOM_RPM_APPS_FABRIC_CLK);
> > -DEFINE_CLK_RPM(msm8660, sfab_clk, sfab_a_clk, QCOM_RPM_SYS_FABRIC_CLK);
> > -DEFINE_CLK_RPM(msm8660, mmfab_clk, mmfab_a_clk, QCOM_RPM_MM_FABRIC_CLK);
> > -DEFINE_CLK_RPM(msm8660, daytona_clk, daytona_a_clk, QCOM_RPM_DAYTONA_FABRIC_CLK);
> > -DEFINE_CLK_RPM(msm8660, sfpb_clk, sfpb_a_clk, QCOM_RPM_SFPB_CLK);
> > -DEFINE_CLK_RPM(msm8660, cfpb_clk, cfpb_a_clk, QCOM_RPM_CFPB_CLK);
> > -DEFINE_CLK_RPM(msm8660, mmfpb_clk, mmfpb_a_clk, QCOM_RPM_MMFPB_CLK);
> > -DEFINE_CLK_RPM(msm8660, smi_clk, smi_a_clk, QCOM_RPM_SMI_CLK);
> > -DEFINE_CLK_RPM(msm8660, ebi1_clk, ebi1_a_clk, QCOM_RPM_EBI1_CLK);
> > -DEFINE_CLK_RPM_FIXED(msm8660, pll4_clk, pll4_a_clk, QCOM_RPM_PLL_4, 540672000);
> > +DEFINE_CLK_RPM(afab_clk, afab_a_clk, QCOM_RPM_APPS_FABRIC_CLK);
> > +DEFINE_CLK_RPM(sfab_clk, sfab_a_clk, QCOM_RPM_SYS_FABRIC_CLK);
> > +DEFINE_CLK_RPM(mmfab_clk, mmfab_a_clk, QCOM_RPM_MM_FABRIC_CLK);
> > +DEFINE_CLK_RPM(daytona_clk, daytona_a_clk, QCOM_RPM_DAYTONA_FABRIC_CLK);
> > +DEFINE_CLK_RPM(sfpb_clk, sfpb_a_clk, QCOM_RPM_SFPB_CLK);
> > +DEFINE_CLK_RPM(cfpb_clk, cfpb_a_clk, QCOM_RPM_CFPB_CLK);
> > +DEFINE_CLK_RPM(mmfpb_clk, mmfpb_a_clk, QCOM_RPM_MMFPB_CLK);
> > +DEFINE_CLK_RPM(smi_clk, smi_a_clk, QCOM_RPM_SMI_CLK);
> > +DEFINE_CLK_RPM(ebi1_clk, ebi1_a_clk, QCOM_RPM_EBI1_CLK);
> > +DEFINE_CLK_RPM(qdss_clk, qdss_a_clk, QCOM_RPM_QDSS_CLK);
> > +DEFINE_CLK_RPM(nss_fabric_0_clk, nss_fabric_0_a_clk, QCOM_RPM_NSS_FABRIC_0_CLK);
> > +DEFINE_CLK_RPM(nss_fabric_1_clk, nss_fabric_1_a_clk, QCOM_RPM_NSS_FABRIC_1_CLK);
> > +
> > +DEFINE_CLK_RPM_FIXED(pll4_clk, pll4_a_clk, QCOM_RPM_PLL_4, 540672000);
> > +
> > +DEFINE_CLK_RPM_XO_BUFFER(xo_d0_clk, xo_d0_a_clk, 0);
> > +DEFINE_CLK_RPM_XO_BUFFER(xo_d1_clk, xo_d1_a_clk, 8);
> > +DEFINE_CLK_RPM_XO_BUFFER(xo_a0_clk, xo_a0_a_clk, 16);
> > +DEFINE_CLK_RPM_XO_BUFFER(xo_a1_clk, xo_a1_a_clk, 24);
> > +DEFINE_CLK_RPM_XO_BUFFER(xo_a2_clk, xo_a2_a_clk, 28);
> >
> >   static struct clk_rpm *msm8660_clks[] = {
> > -     [RPM_APPS_FABRIC_CLK] = &msm8660_afab_clk,
> > -     [RPM_APPS_FABRIC_A_CLK] = &msm8660_afab_a_clk,
> > -     [RPM_SYS_FABRIC_CLK] = &msm8660_sfab_clk,
> > -     [RPM_SYS_FABRIC_A_CLK] = &msm8660_sfab_a_clk,
> > -     [RPM_MM_FABRIC_CLK] = &msm8660_mmfab_clk,
> > -     [RPM_MM_FABRIC_A_CLK] = &msm8660_mmfab_a_clk,
> > -     [RPM_DAYTONA_FABRIC_CLK] = &msm8660_daytona_clk,
> > -     [RPM_DAYTONA_FABRIC_A_CLK] = &msm8660_daytona_a_clk,
> > -     [RPM_SFPB_CLK] = &msm8660_sfpb_clk,
> > -     [RPM_SFPB_A_CLK] = &msm8660_sfpb_a_clk,
> > -     [RPM_CFPB_CLK] = &msm8660_cfpb_clk,
> > -     [RPM_CFPB_A_CLK] = &msm8660_cfpb_a_clk,
> > -     [RPM_MMFPB_CLK] = &msm8660_mmfpb_clk,
> > -     [RPM_MMFPB_A_CLK] = &msm8660_mmfpb_a_clk,
> > -     [RPM_SMI_CLK] = &msm8660_smi_clk,
> > -     [RPM_SMI_A_CLK] = &msm8660_smi_a_clk,
> > -     [RPM_EBI1_CLK] = &msm8660_ebi1_clk,
> > -     [RPM_EBI1_A_CLK] = &msm8660_ebi1_a_clk,
> > -     [RPM_PLL4_CLK] = &msm8660_pll4_clk,
> > +     [RPM_APPS_FABRIC_CLK] = &clk_rpm_afab_clk,
> > +     [RPM_APPS_FABRIC_A_CLK] = &clk_rpm_afab_a_clk,
> > +     [RPM_SYS_FABRIC_CLK] = &clk_rpm_sfab_clk,
> > +     [RPM_SYS_FABRIC_A_CLK] = &clk_rpm_sfab_a_clk,
> > +     [RPM_MM_FABRIC_CLK] = &clk_rpm_mmfab_clk,
> > +     [RPM_MM_FABRIC_A_CLK] = &clk_rpm_mmfab_a_clk,
> > +     [RPM_DAYTONA_FABRIC_CLK] = &clk_rpm_daytona_clk,
> > +     [RPM_DAYTONA_FABRIC_A_CLK] = &clk_rpm_daytona_a_clk,
> > +     [RPM_SFPB_CLK] = &clk_rpm_sfpb_clk,
> > +     [RPM_SFPB_A_CLK] = &clk_rpm_sfpb_a_clk,
> > +     [RPM_CFPB_CLK] = &clk_rpm_cfpb_clk,
> > +     [RPM_CFPB_A_CLK] = &clk_rpm_cfpb_a_clk,
> > +     [RPM_MMFPB_CLK] = &clk_rpm_mmfpb_clk,
> > +     [RPM_MMFPB_A_CLK] = &clk_rpm_mmfpb_a_clk,
> > +     [RPM_SMI_CLK] = &clk_rpm_smi_clk,
> > +     [RPM_SMI_A_CLK] = &clk_rpm_smi_a_clk,
> > +     [RPM_EBI1_CLK] = &clk_rpm_ebi1_clk,
> > +     [RPM_EBI1_A_CLK] = &clk_rpm_ebi1_a_clk,
> > +     [RPM_PLL4_CLK] = &clk_rpm_pll4_clk,
> >   };
> >
> >   static const struct rpm_clk_desc rpm_clk_msm8660 = {
> > @@ -441,46 +451,30 @@ static const struct rpm_clk_desc rpm_clk_msm8660 = {
> >       .num_clks = ARRAY_SIZE(msm8660_clks),
> >   };
> >
> > -/* apq8064 */
> > -DEFINE_CLK_RPM(apq8064, afab_clk, afab_a_clk, QCOM_RPM_APPS_FABRIC_CLK);
> > -DEFINE_CLK_RPM(apq8064, cfpb_clk, cfpb_a_clk, QCOM_RPM_CFPB_CLK);
> > -DEFINE_CLK_RPM(apq8064, daytona_clk, daytona_a_clk, QCOM_RPM_DAYTONA_FABRIC_CLK);
> > -DEFINE_CLK_RPM(apq8064, ebi1_clk, ebi1_a_clk, QCOM_RPM_EBI1_CLK);
> > -DEFINE_CLK_RPM(apq8064, mmfab_clk, mmfab_a_clk, QCOM_RPM_MM_FABRIC_CLK);
> > -DEFINE_CLK_RPM(apq8064, mmfpb_clk, mmfpb_a_clk, QCOM_RPM_MMFPB_CLK);
> > -DEFINE_CLK_RPM(apq8064, sfab_clk, sfab_a_clk, QCOM_RPM_SYS_FABRIC_CLK);
> > -DEFINE_CLK_RPM(apq8064, sfpb_clk, sfpb_a_clk, QCOM_RPM_SFPB_CLK);
> > -DEFINE_CLK_RPM(apq8064, qdss_clk, qdss_a_clk, QCOM_RPM_QDSS_CLK);
> > -DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_d0_clk, xo_d0_a_clk, 0);
> > -DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_d1_clk, xo_d1_a_clk, 8);
> > -DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_a0_clk, xo_a0_a_clk, 16);
> > -DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_a1_clk, xo_a1_a_clk, 24);
> > -DEFINE_CLK_RPM_XO_BUFFER(apq8064, xo_a2_clk, xo_a2_a_clk, 28);
> > -
> >   static struct clk_rpm *apq8064_clks[] = {
> > -     [RPM_APPS_FABRIC_CLK] = &apq8064_afab_clk,
> > -     [RPM_APPS_FABRIC_A_CLK] = &apq8064_afab_a_clk,
> > -     [RPM_CFPB_CLK] = &apq8064_cfpb_clk,
> > -     [RPM_CFPB_A_CLK] = &apq8064_cfpb_a_clk,
> > -     [RPM_DAYTONA_FABRIC_CLK] = &apq8064_daytona_clk,
> > -     [RPM_DAYTONA_FABRIC_A_CLK] = &apq8064_daytona_a_clk,
> > -     [RPM_EBI1_CLK] = &apq8064_ebi1_clk,
> > -     [RPM_EBI1_A_CLK] = &apq8064_ebi1_a_clk,
> > -     [RPM_MM_FABRIC_CLK] = &apq8064_mmfab_clk,
> > -     [RPM_MM_FABRIC_A_CLK] = &apq8064_mmfab_a_clk,
> > -     [RPM_MMFPB_CLK] = &apq8064_mmfpb_clk,
> > -     [RPM_MMFPB_A_CLK] = &apq8064_mmfpb_a_clk,
> > -     [RPM_SYS_FABRIC_CLK] = &apq8064_sfab_clk,
> > -     [RPM_SYS_FABRIC_A_CLK] = &apq8064_sfab_a_clk,
> > -     [RPM_SFPB_CLK] = &apq8064_sfpb_clk,
> > -     [RPM_SFPB_A_CLK] = &apq8064_sfpb_a_clk,
> > -     [RPM_QDSS_CLK] = &apq8064_qdss_clk,
> > -     [RPM_QDSS_A_CLK] = &apq8064_qdss_a_clk,
> > -     [RPM_XO_D0] = &apq8064_xo_d0_clk,
> > -     [RPM_XO_D1] = &apq8064_xo_d1_clk,
> > -     [RPM_XO_A0] = &apq8064_xo_a0_clk,
> > -     [RPM_XO_A1] = &apq8064_xo_a1_clk,
> > -     [RPM_XO_A2] = &apq8064_xo_a2_clk,
> > +     [RPM_APPS_FABRIC_CLK] = &clk_rpm_afab_clk,
> > +     [RPM_APPS_FABRIC_A_CLK] = &clk_rpm_afab_a_clk,
> > +     [RPM_CFPB_CLK] = &clk_rpm_cfpb_clk,
> > +     [RPM_CFPB_A_CLK] = &clk_rpm_cfpb_a_clk,
> > +     [RPM_DAYTONA_FABRIC_CLK] = &clk_rpm_daytona_clk,
> > +     [RPM_DAYTONA_FABRIC_A_CLK] = &clk_rpm_daytona_a_clk,
> > +     [RPM_EBI1_CLK] = &clk_rpm_ebi1_clk,
> > +     [RPM_EBI1_A_CLK] = &clk_rpm_ebi1_a_clk,
> > +     [RPM_MM_FABRIC_CLK] = &clk_rpm_mmfab_clk,
> > +     [RPM_MM_FABRIC_A_CLK] = &clk_rpm_mmfab_a_clk,
> > +     [RPM_MMFPB_CLK] = &clk_rpm_mmfpb_clk,
> > +     [RPM_MMFPB_A_CLK] = &clk_rpm_mmfpb_a_clk,
> > +     [RPM_SYS_FABRIC_CLK] = &clk_rpm_sfab_clk,
> > +     [RPM_SYS_FABRIC_A_CLK] = &clk_rpm_sfab_a_clk,
> > +     [RPM_SFPB_CLK] = &clk_rpm_sfpb_clk,
> > +     [RPM_SFPB_A_CLK] = &clk_rpm_sfpb_a_clk,
> > +     [RPM_QDSS_CLK] = &clk_rpm_qdss_clk,
> > +     [RPM_QDSS_A_CLK] = &clk_rpm_qdss_a_clk,
> > +     [RPM_XO_D0] = &clk_rpm_xo_d0_clk,
> > +     [RPM_XO_D1] = &clk_rpm_xo_d1_clk,
> > +     [RPM_XO_A0] = &clk_rpm_xo_a0_clk,
> > +     [RPM_XO_A1] = &clk_rpm_xo_a1_clk,
> > +     [RPM_XO_A2] = &clk_rpm_xo_a2_clk,
> >   };
> >
> >   static const struct rpm_clk_desc rpm_clk_apq8064 = {
> > @@ -488,33 +482,23 @@ static const struct rpm_clk_desc rpm_clk_apq8064 = {
> >       .num_clks = ARRAY_SIZE(apq8064_clks),
> >   };
> >
> > -/* ipq806x */
> > -DEFINE_CLK_RPM(ipq806x, afab_clk, afab_a_clk, QCOM_RPM_APPS_FABRIC_CLK);
> > -DEFINE_CLK_RPM(ipq806x, cfpb_clk, cfpb_a_clk, QCOM_RPM_CFPB_CLK);
> > -DEFINE_CLK_RPM(ipq806x, daytona_clk, daytona_a_clk, QCOM_RPM_DAYTONA_FABRIC_CLK);
> > -DEFINE_CLK_RPM(ipq806x, ebi1_clk, ebi1_a_clk, QCOM_RPM_EBI1_CLK);
> > -DEFINE_CLK_RPM(ipq806x, sfab_clk, sfab_a_clk, QCOM_RPM_SYS_FABRIC_CLK);
> > -DEFINE_CLK_RPM(ipq806x, sfpb_clk, sfpb_a_clk, QCOM_RPM_SFPB_CLK);
> > -DEFINE_CLK_RPM(ipq806x, nss_fabric_0_clk, nss_fabric_0_a_clk, QCOM_RPM_NSS_FABRIC_0_CLK);
> > -DEFINE_CLK_RPM(ipq806x, nss_fabric_1_clk, nss_fabric_1_a_clk, QCOM_RPM_NSS_FABRIC_1_CLK);
> > -
> >   static struct clk_rpm *ipq806x_clks[] = {
> > -     [RPM_APPS_FABRIC_CLK] = &ipq806x_afab_clk,
> > -     [RPM_APPS_FABRIC_A_CLK] = &ipq806x_afab_a_clk,
> > -     [RPM_CFPB_CLK] = &ipq806x_cfpb_clk,
> > -     [RPM_CFPB_A_CLK] = &ipq806x_cfpb_a_clk,
> > -     [RPM_DAYTONA_FABRIC_CLK] = &ipq806x_daytona_clk,
> > -     [RPM_DAYTONA_FABRIC_A_CLK] = &ipq806x_daytona_a_clk,
> > -     [RPM_EBI1_CLK] = &ipq806x_ebi1_clk,
> > -     [RPM_EBI1_A_CLK] = &ipq806x_ebi1_a_clk,
> > -     [RPM_SYS_FABRIC_CLK] = &ipq806x_sfab_clk,
> > -     [RPM_SYS_FABRIC_A_CLK] = &ipq806x_sfab_a_clk,
> > -     [RPM_SFPB_CLK] = &ipq806x_sfpb_clk,
> > -     [RPM_SFPB_A_CLK] = &ipq806x_sfpb_a_clk,
> > -     [RPM_NSS_FABRIC_0_CLK] = &ipq806x_nss_fabric_0_clk,
> > -     [RPM_NSS_FABRIC_0_A_CLK] = &ipq806x_nss_fabric_0_a_clk,
> > -     [RPM_NSS_FABRIC_1_CLK] = &ipq806x_nss_fabric_1_clk,
> > -     [RPM_NSS_FABRIC_1_A_CLK] = &ipq806x_nss_fabric_1_a_clk,
> > +     [RPM_APPS_FABRIC_CLK] = &clk_rpm_afab_clk,
> > +     [RPM_APPS_FABRIC_A_CLK] = &clk_rpm_afab_a_clk,
> > +     [RPM_CFPB_CLK] = &clk_rpm_cfpb_clk,
> > +     [RPM_CFPB_A_CLK] = &clk_rpm_cfpb_a_clk,
> > +     [RPM_DAYTONA_FABRIC_CLK] = &clk_rpm_daytona_clk,
> > +     [RPM_DAYTONA_FABRIC_A_CLK] = &clk_rpm_daytona_a_clk,
> > +     [RPM_EBI1_CLK] = &clk_rpm_ebi1_clk,
> > +     [RPM_EBI1_A_CLK] = &clk_rpm_ebi1_a_clk,
> > +     [RPM_SYS_FABRIC_CLK] = &clk_rpm_sfab_clk,
> > +     [RPM_SYS_FABRIC_A_CLK] = &clk_rpm_sfab_a_clk,
> > +     [RPM_SFPB_CLK] = &clk_rpm_sfpb_clk,
> > +     [RPM_SFPB_A_CLK] = &clk_rpm_sfpb_a_clk,
> > +     [RPM_NSS_FABRIC_0_CLK] = &clk_rpm_nss_fabric_0_clk,
> > +     [RPM_NSS_FABRIC_0_A_CLK] = &clk_rpm_nss_fabric_0_a_clk,
> > +     [RPM_NSS_FABRIC_1_CLK] = &clk_rpm_nss_fabric_1_clk,
> > +     [RPM_NSS_FABRIC_1_A_CLK] = &clk_rpm_nss_fabric_1_a_clk,
> >   };
> >
> >   static const struct rpm_clk_desc rpm_clk_ipq806x = {
>


-- 
With best wishes
Dmitry
