Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41B9C5881DD
	for <lists+linux-clk@lfdr.de>; Tue,  2 Aug 2022 20:32:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbiHBSc0 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 2 Aug 2022 14:32:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbiHBScZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 2 Aug 2022 14:32:25 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D91813F19;
        Tue,  2 Aug 2022 11:32:24 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id o2so11277372iof.8;
        Tue, 02 Aug 2022 11:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=jhq8ckgM3wThDcZldY9YmghfnMoP9xPtuQZ8KnzumAo=;
        b=VdRx0EOsVrd6Ybzj1Gs9qS7AxPtnD2QK2IFIf9RolrI/Ygx7n3CCPKpPU3zj+wbTT1
         ETLSmXQFke1UC+3v1WU2TyO3kRU0MD0Rdp0SGOvF3myFXUQ6wFHZKpIyw8xahimWkVON
         jk2wd4Nn434JzCuBcEdlIZySLE0BhWD9fadVz0ZqJ1obVJiJDZr5hMhXw24O2VEI8klm
         FZk8AO2kd42gWSy82KfZcBwGzBDMF+jqTz9kWkkYy4ue1OxZt0UsLBe6WJKHt6BVeLU2
         F6WSNBYCEa/kocJxgUbP0v5Frv/SqfhloM8ge/5o3X4nWAl+uGoYAKvubrM7r92YIIw5
         lt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=jhq8ckgM3wThDcZldY9YmghfnMoP9xPtuQZ8KnzumAo=;
        b=CZajW4LJwenfbh5Np/pf9emzw6nlayYaDbCqgMeq/RPT3mz3j/bl3Ta5htO5+GpAss
         4BSxEoQE9r4BXsI1SXuNzQm6Dwjcyls+jrsZo/JQRs+63lyd5nSda4J/s7n1BAn5DzCE
         u2jN0Wz+mDwbXo5HSL7CCKT0AS2XGsJfgBiPNFbhPxY/i1Y8DlH2s3FAC5xuNwF+pefp
         RmuWPrUwbHt1cjCWGfBWm1XHgctw/6GXEPqQ5W5DymZNvezHyqr62SPRLKjq5LYwl/Yn
         WU8zMO+JfLGj3UcCUPGHgk1AxhkeGCUkkzy5ZSjCQoYbku1bvyhMHDr+1M0stChTV0/d
         5oOQ==
X-Gm-Message-State: ACgBeo1tBaJy1R2zgkgg5urt0D8mFYaf/YrKC8N3toafg81xmzdRo1CJ
        UA/V3sBGTTAoAQPCLCWjcn7JpBfH4+beEs8WVxY=
X-Google-Smtp-Source: AA6agR4zB01AwMUmm2uoczyPEG/voRCuVs5QOx8SXiSosbJh2mT+l0ai6vNdX9v3/FVkFqgzoqRCCul6am0CDk+QETo=
X-Received: by 2002:a05:6638:25d0:b0:342:72f5:a080 with SMTP id
 u16-20020a05663825d000b0034272f5a080mr4809472jat.51.1659465144024; Tue, 02
 Aug 2022 11:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <1659172664-10345-1-git-send-email-quic_akhilpo@quicinc.com> <34ae275e-8d4c-3735-c08c-4769caf2909c@linaro.org>
In-Reply-To: <34ae275e-8d4c-3735-c08c-4769caf2909c@linaro.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 2 Aug 2022 11:32:50 -0700
Message-ID: <CAF6AEGv_cgPtaFpxSPCzWXeBcJvqE2fGucriRvMAJMbQ7ULndQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] clk/qcom: Support gdsc collapse polling using 'reset' inteface
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Akhil P Oommen <quic_akhilpo@quicinc.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Aug 2, 2022 at 12:02 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 30/07/2022 12:17, Akhil P Oommen wrote:
> >
> > Some clients like adreno gpu driver would like to ensure that its gdsc
> > is collapsed at hardware during a gpu reset sequence. This is because it
> > has a votable gdsc which could be ON due to a vote from another subsystem
> > like tz, hyp etc or due to an internal hardware signal.
>
> If this is votable, do we have any guarantee that the gdsc will collapse
> at all? How can we proceed if it did not collapse?

Other potential votes should be transient.  But I guess we eventually
need to timeout and give up.  At which point we are no worse off than
before.

But hmm, we aren't using RBBM_SW_RESET_CMD for sw reset like we have
on previous generations?  That does seem a bit odd.  Looks like kgsl
does use it.

BR,
-R

> > To allow
> > this, gpucc driver can expose an interface to the client driver using
> > reset framework. Using this the client driver can trigger a polling within
> > the gdsc driver.
>
> Trigger the polling made me think initially that we will actually
> trigger something in the HW. Instead the client uses reset framework to
> poll for the gdsc to be reset.
>
> >
> > This series is rebased on top of linus's master branch.
> >
> > Related discussion: https://patchwork.freedesktop.org/patch/493144/
> >
> >
> > Akhil P Oommen (5):
> >    dt-bindings: clk: qcom: Support gpu cx gdsc reset
> >    clk: qcom: Allow custom reset ops
> >    clk: qcom: gpucc-sc7280: Add cx collapse reset support
> >    clk: qcom: gdsc: Add a reset op to poll gdsc collapse
> >    arm64: dts: qcom: sc7280: Add Reset support for gpu
> >
> >   arch/arm64/boot/dts/qcom/sc7280.dtsi          |  3 +++
> >   drivers/clk/qcom/gdsc.c                       | 23 +++++++++++++++++++----
> >   drivers/clk/qcom/gdsc.h                       |  7 +++++++
> >   drivers/clk/qcom/gpucc-sc7280.c               |  6 ++++++
> >   drivers/clk/qcom/reset.c                      |  6 ++++++
> >   drivers/clk/qcom/reset.h                      |  2 ++
> >   include/dt-bindings/clock/qcom,gpucc-sc7280.h |  3 +++
> >   7 files changed, 46 insertions(+), 4 deletions(-)
> >
>
>
> --
> With best wishes
> Dmitry
