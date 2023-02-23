Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 907B06A012A
	for <lists+linux-clk@lfdr.de>; Thu, 23 Feb 2023 03:27:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232889AbjBWC1T (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 22 Feb 2023 21:27:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjBWC1R (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Feb 2023 21:27:17 -0500
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5331F1165A
        for <linux-clk@vger.kernel.org>; Wed, 22 Feb 2023 18:27:14 -0800 (PST)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-1724d65d002so5730161fac.4
        for <linux-clk@vger.kernel.org>; Wed, 22 Feb 2023 18:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IAoLiHZonQ9yzf6exsyPnPMjat+DcttMudRnM/cvohQ=;
        b=kGKiOU9lZXUiSbBzfPeN1n7CSuyBK30Czjq4ei6DrXfsvFtKf14DPWNt+9PC9S3cHR
         XR249GLTqFWyDoy0IkR/4uBqwV+Pmpw0FJ1S6oy2ZBYIWntYJ1Xd+yUDSNuhjzsIRzvj
         psGjtU7aTul4IEQyhe1iljYAHM0PUt2hDwMPpDafq7IOL7swa7lrIAvfC4SbSzPOWawx
         qsPNag+kePk4okC/uBc8CsDsRi0lo1MuDhM0MyVpVsq6ekew54r7WivAbOkSutPrmzoY
         s15g+3NqJ/xGXjzh96MfZnYNeuky1vTc+PRQjXWYlJ24M4HNw6NwVi2VMd9ZlqUEcjnZ
         qipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IAoLiHZonQ9yzf6exsyPnPMjat+DcttMudRnM/cvohQ=;
        b=0W188SspJQbB1yAdTOwAlq/a195XWWNcRZl5noShuKfUcewjRymwqDkAggXpqeBoyC
         8Lg/TqCvIgSKH8cwNru9HbxDeC3+j2TyuFITY6+lnSFhRnbw6/Z8wlixPvWz7ceORSHn
         YnRPbgDlPQMk/ZuUEg5JrKJ9rs4AEPbaCwNs/ImbehGlByM2XTI/F7mHKnt14KUfygC7
         Wxki442A/B1aXSoHksp6ps5sQDppnZdH4YeMHKn9vkGJsIRa7UwD6jXR8ehwRqHr4ft3
         pAnZiFQQBsAh35kmVVnVaQj/F2WbrArl8rFLsFFtdlQk05Vem+SpJxJZ1ihss0UHi/kr
         eH8g==
X-Gm-Message-State: AO0yUKVWcqC57x3MKG0sX/DYr+qjiEt7g+YMh8EsC+k2356uusehC/ZS
        u0kKns75uSkFB6qK5ZO1jkKy8MUHUtjqZD5sUNmVxA==
X-Google-Smtp-Source: AK7set+h6QdDAN1HHNJ/ETPJpkHPuqATk5ZydfyUit0/Gt7f4augVb/rP3yqBsBk8d5tAAmUk9MZwkuSjop5xXR7v8g=
X-Received: by 2002:a05:6870:678a:b0:16e:19a8:31d8 with SMTP id
 gc10-20020a056870678a00b0016e19a831d8mr1457846oab.62.1677119233386; Wed, 22
 Feb 2023 18:27:13 -0800 (PST)
MIME-Version: 1.0
References: <20230211064006.14981-1-semen.protsenko@linaro.org>
 <CGME20230211063956epcas2p423cb99655dcfdb34c6847bb228aa7324@epcms2p2>
 <20230211064006.14981-6-semen.protsenko@linaro.org> <20230215024056epcms2p28f04cf946f20343643faca944ea147ea@epcms2p2>
In-Reply-To: <20230215024056epcms2p28f04cf946f20343643faca944ea147ea@epcms2p2>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Wed, 22 Feb 2023 20:27:18 -0600
Message-ID: <CAPLW+4=rsUKkX+pYEdfXst2LsOOdhTDhE9kB-DROZOfweTGB-A@mail.gmail.com>
Subject: Re: [PATCH 5/6] clk: samsung: exynos850: Add AUD and HSI main gate clocks
To:     chanho61.park@samsung.com
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        David Virag <virag.david003@gmail.com>,
        ALIM AKHTAR <alim.akhtar@samsung.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 14 Feb 2023 at 20:41, CHANHO PARK <chanho61.park@samsung.com> wrote:
>
> > -----Original Message-----
> > From: Sam Protsenko <semen.protsenko@linaro.org>
> > Sent: Saturday, February 11, 2023 3:40 PM
> > To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>; Chanwoo Choi
> > <cw00.choi@samsung.com>; Sylwester Nawrocki <s.nawrocki@samsung.com>; Rob
> > Herring <robh+dt@kernel.org>
> > Cc: David Virag <virag.david003@gmail.com>; Chanho Park
> > <chanho61.park@samsung.com>; Alim Akhtar <alim.akhtar@samsung.com>; Sumit
> > Semwal <sumit.semwal@linaro.org>; Tomasz Figa <tomasz.figa@gmail.com>;
> > Michael Turquette <mturquette@baylibre.com>; Stephen Boyd
> > <sboyd@kernel.org>; linux-samsung-soc@vger.kernel.org; linux-
> > clk@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-
> > kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> > Subject: [PATCH 5/6] clk: samsung: exynos850: Add AUD and HSI main gate
> > clocks
> >
> > Add main gate clocks for controlling AUD and HSI CMUs:
> >   - gout_aud_cmu_aud_pclk
> >   - gout_hsi_cmu_hsi_pclk
> >
> > Those clocks were marked as CLK_IGNORE_UNUSED, as system hangs on boot
> > otherwise.
> >
> > While at it, add missing PPMU (Performance Profiling Monitor Unit) clocks
> > for CMU_HSI.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> >  drivers/clk/samsung/clk-exynos850.c | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/drivers/clk/samsung/clk-exynos850.c
> > b/drivers/clk/samsung/clk-exynos850.c
> > index a24eff42baae..3d776d57cc8f 100644
> > --- a/drivers/clk/samsung/clk-exynos850.c
> > +++ b/drivers/clk/samsung/clk-exynos850.c
> > @@ -674,6 +674,7 @@ static const struct samsung_cmu_info apm_cmu_info
> > __initconst = {
> >  #define CLK_CON_GAT_GOUT_AUD_ABOX_BCLK_UAIF4 0x2014
> >  #define CLK_CON_GAT_GOUT_AUD_ABOX_BCLK_UAIF5 0x2018
> >  #define CLK_CON_GAT_GOUT_AUD_ABOX_BCLK_UAIF6 0x201c
> > +#define CLK_CON_GAT_CLK_AUD_CMU_AUD_PCLK     0x2020
> >  #define CLK_CON_GAT_GOUT_AUD_ABOX_ACLK               0x2048
> >  #define CLK_CON_GAT_GOUT_AUD_ABOX_BCLK_SPDY  0x204c
> >  #define CLK_CON_GAT_GOUT_AUD_ABOX_CCLK_ASB   0x2050
> > @@ -729,6 +730,7 @@ static const unsigned long aud_clk_regs[] __initconst
> > = {
> >       CLK_CON_GAT_GOUT_AUD_ABOX_BCLK_UAIF4,
> >       CLK_CON_GAT_GOUT_AUD_ABOX_BCLK_UAIF5,
> >       CLK_CON_GAT_GOUT_AUD_ABOX_BCLK_UAIF6,
> > +     CLK_CON_GAT_CLK_AUD_CMU_AUD_PCLK,
> >       CLK_CON_GAT_GOUT_AUD_ABOX_ACLK,
> >       CLK_CON_GAT_GOUT_AUD_ABOX_BCLK_SPDY,
> >       CLK_CON_GAT_GOUT_AUD_ABOX_CCLK_ASB,
> > @@ -848,6 +850,9 @@ static const struct samsung_div_clock aud_div_clks[]
> > __initconst = {  };
> >
> >  static const struct samsung_gate_clock aud_gate_clks[] __initconst = {
> > +     GATE(CLK_GOUT_AUD_CMU_AUD_PCLK, "gout_aud_cmu_aud_pclk",
> > +          "dout_aud_busd",
> > +          CLK_CON_GAT_CLK_AUD_CMU_AUD_PCLK, 21, CLK_IGNORE_UNUSED, 0),
> >       GATE(CLK_GOUT_AUD_CA32_CCLK, "gout_aud_ca32_cclk",
> > "mout_aud_cpu_hch",
> >            CLK_CON_GAT_GOUT_AUD_ABOX_CCLK_CA32, 21, 0, 0),
> >       GATE(CLK_GOUT_AUD_ASB_CCLK, "gout_aud_asb_cclk",
> > "dout_aud_cpu_aclk", @@ -1117,12 +1122,15 @@ static const struct
> > samsung_cmu_info g3d_cmu_info __initconst = {
> >  #define PLL_CON0_MUX_CLKCMU_HSI_MMC_CARD_USER                        0x0610
> >  #define PLL_CON0_MUX_CLKCMU_HSI_USB20DRD_USER                        0x0620
> >  #define CLK_CON_MUX_MUX_CLK_HSI_RTC                          0x1000
> > +#define CLK_CON_GAT_CLK_HSI_CMU_HSI_PCLK                     0x2000
> >  #define CLK_CON_GAT_HSI_USB20DRD_TOP_I_RTC_CLK__ALV          0x2008
> >  #define CLK_CON_GAT_HSI_USB20DRD_TOP_I_REF_CLK_50            0x200c
> >  #define CLK_CON_GAT_HSI_USB20DRD_TOP_I_PHY_REFCLK_26         0x2010
> >  #define CLK_CON_GAT_GOUT_HSI_GPIO_HSI_PCLK                   0x2018
> >  #define CLK_CON_GAT_GOUT_HSI_MMC_CARD_I_ACLK                 0x2024
> >  #define CLK_CON_GAT_GOUT_HSI_MMC_CARD_SDCLKIN                        0x2028
> > +#define CLK_CON_GAT_GOUT_HSI_PPMU_ACLK                               0x202c
> > +#define CLK_CON_GAT_GOUT_HSI_PPMU_PCLK                               0x2030
> >  #define CLK_CON_GAT_GOUT_HSI_SYSREG_HSI_PCLK                 0x2038
> >  #define CLK_CON_GAT_GOUT_HSI_USB20DRD_TOP_ACLK_PHYCTRL_20    0x203c
> >  #define CLK_CON_GAT_GOUT_HSI_USB20DRD_TOP_BUS_CLK_EARLY              0x2040
> > @@ -1132,12 +1140,15 @@ static const unsigned long hsi_clk_regs[]
> > __initconst = {
> >       PLL_CON0_MUX_CLKCMU_HSI_MMC_CARD_USER,
> >       PLL_CON0_MUX_CLKCMU_HSI_USB20DRD_USER,
> >       CLK_CON_MUX_MUX_CLK_HSI_RTC,
> > +     CLK_CON_GAT_CLK_HSI_CMU_HSI_PCLK,
> >       CLK_CON_GAT_HSI_USB20DRD_TOP_I_RTC_CLK__ALV,
> >       CLK_CON_GAT_HSI_USB20DRD_TOP_I_REF_CLK_50,
> >       CLK_CON_GAT_HSI_USB20DRD_TOP_I_PHY_REFCLK_26,
> >       CLK_CON_GAT_GOUT_HSI_GPIO_HSI_PCLK,
> >       CLK_CON_GAT_GOUT_HSI_MMC_CARD_I_ACLK,
> >       CLK_CON_GAT_GOUT_HSI_MMC_CARD_SDCLKIN,
> > +     CLK_CON_GAT_GOUT_HSI_PPMU_ACLK,
> > +     CLK_CON_GAT_GOUT_HSI_PPMU_PCLK,
> >       CLK_CON_GAT_GOUT_HSI_SYSREG_HSI_PCLK,
> >       CLK_CON_GAT_GOUT_HSI_USB20DRD_TOP_ACLK_PHYCTRL_20,
> >       CLK_CON_GAT_GOUT_HSI_USB20DRD_TOP_BUS_CLK_EARLY,
> > @@ -1163,6 +1174,9 @@ static const struct samsung_mux_clock hsi_mux_clks[]
> > __initconst = {  };
> >
> >  static const struct samsung_gate_clock hsi_gate_clks[] __initconst = {
> > +     GATE(CLK_GOUT_HSI_CMU_HSI_PCLK, "gout_hsi_cmu_hsi_pclk",
> > +          "mout_hsi_bus_user",
> > +          CLK_CON_GAT_CLK_HSI_CMU_HSI_PCLK, 21, CLK_IGNORE_UNUSED, 0),
>
> You'll need to put /* TODO: */ tag or use CLK_IS_CRITICAL if you make sure it is the critical clock.
>

Thanks for the review! I'll add the comment for now, as it's done in
other CMUs for similar clocks. As for making it critical: maybe I'll
do it as a part of PM enablement, which I'm working on right now (if
it's needed). But in that case I'd like to provide a separate patch
for making all similar clocks (XXX_CMU_XXX) critical, so not in this
patch.

Will send v2 soon.

> >       GATE(CLK_GOUT_USB_RTC_CLK, "gout_usb_rtc", "mout_hsi_rtc",
> >            CLK_CON_GAT_HSI_USB20DRD_TOP_I_RTC_CLK__ALV, 21, 0, 0),
> >       GATE(CLK_GOUT_USB_REF_CLK, "gout_usb_ref", "mout_hsi_usb20drd_user",
> > @@ -1177,6 +1191,10 @@ static const struct samsung_gate_clock
> > hsi_gate_clks[] __initconst = {
> >       GATE(CLK_GOUT_MMC_CARD_SDCLKIN, "gout_mmc_card_sdclkin",
> >            "mout_hsi_mmc_card_user",
> >            CLK_CON_GAT_GOUT_HSI_MMC_CARD_SDCLKIN, 21, CLK_SET_RATE_PARENT,
> > 0),
> > +     GATE(CLK_GOUT_HSI_PPMU_ACLK, "gout_hsi_ppmu_aclk",
> > "mout_hsi_bus_user",
> > +          CLK_CON_GAT_GOUT_HSI_PPMU_ACLK, 21, 0, 0),
> > +     GATE(CLK_GOUT_HSI_PPMU_PCLK, "gout_hsi_ppmu_pclk",
> > "mout_hsi_bus_user",
> > +          CLK_CON_GAT_GOUT_HSI_PPMU_PCLK, 21, 0, 0),
> >       GATE(CLK_GOUT_SYSREG_HSI_PCLK, "gout_sysreg_hsi_pclk",
> >            "mout_hsi_bus_user",
> >            CLK_CON_GAT_GOUT_HSI_SYSREG_HSI_PCLK, 21, 0, 0),
> > --
> > 2.39.1
