Return-Path: <linux-clk+bounces-49-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BDB7E5C72
	for <lists+linux-clk@lfdr.de>; Wed,  8 Nov 2023 18:34:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E8B71F219C8
	for <lists+linux-clk@lfdr.de>; Wed,  8 Nov 2023 17:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA7DF328C6;
	Wed,  8 Nov 2023 17:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PAs55n9U"
X-Original-To: linux-clk@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE6330338
	for <linux-clk@vger.kernel.org>; Wed,  8 Nov 2023 17:34:00 +0000 (UTC)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BC891BE3
	for <linux-clk@vger.kernel.org>; Wed,  8 Nov 2023 09:33:59 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-280137f1a1bso5520561a91.1
        for <linux-clk@vger.kernel.org>; Wed, 08 Nov 2023 09:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699464838; x=1700069638; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sAWSOoeAjfBbJekhTKUv9QwV6bzlMliXHO1btit3MQo=;
        b=PAs55n9UN0Tt4azZuzlN/v4fOpAQkVUhX1VuQsYZhU0jHvGaVLULti+ZZd2hhS1CPg
         lcJPvfGofMpQ8x8KjEyqQ37WRb0aeqwbmSt7r8bLqRFOxeKkAxsZiPgH2AVJn6Pfnfnf
         ROZxj/y8NDoH0G/VUip3RR9Jqnc2sOyGKuQhcfj7mF/DVB9ybWbBzx9rQG/Nj9GxVExg
         N8U4TR5MAvenuZMFnJOsSS3CBJX7ob6xMg7AV4QDqMEtUZbKLOfMf2Onc/Zpmv2dOcr9
         iYOEJGKcz897YYDG3ynCmFFDcmU3euYGFCU5QOi6XwttWgO46PIBpu4HalMhZ5RdSYgw
         jJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699464838; x=1700069638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sAWSOoeAjfBbJekhTKUv9QwV6bzlMliXHO1btit3MQo=;
        b=BvOBKn39RIUYivYo42W0QAfdWGh1HH8GutKSYCCE3t+E9VwViWxs/iv3D5mOsrpnqJ
         JQUpRiyfgvQxxVwBWSd3gm4CbbH0tX3OSeOStkaybLmwNRAR6IAFSxgM2mlWgkRDV9hT
         QUOM+3lgqvbMXH3Ku+6G/0FGWMbRqL2u4UI04dOaylwL1SjUZNV8Sllyy/AMcAS5KP2d
         9CBwJ72KodSLI/9md/QoLRQMe0SF94AHCZLMWro5p+2pSF/pXcmqV66rlIZJ1pnt5Uqq
         NV9nZCYdOlwxCX/oiHTcl+C0ci3VRMkrF/AO4xeWoY6xmEiKxa/egHta5a4mlbCuV6H+
         0oyg==
X-Gm-Message-State: AOJu0YzmyZlQQ76Mq0YT07B5jK1UYZIo0Y6sdKxy1gDSSFmxCG7NTCm4
	6FD9t/j8e7xAcfctIRGaUId0ubzzW5NGoQmq04z8EA==
X-Google-Smtp-Source: AGHT+IGY4VBAJ38xlUtcmXFmIEhynykPBn3dfo+SVZRmQxxurhZcoKtbYoXN1XDKnlHvImSQIH0q75kjXSAbWt8IHAw=
X-Received: by 2002:a17:90a:6888:b0:281:da1:4b96 with SMTP id
 a8-20020a17090a688800b002810da14b96mr2347498pjd.22.1699464838284; Wed, 08 Nov
 2023 09:33:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-11-peter.griffin@linaro.org> <aae4e6cd-dcfc-442d-9ed7-d5a73c419ba8@kernel.org>
 <CADrjBPrUsSigThoLU9thmZiaG4690B9-BcZYrBn44K9Fc8z3vg@mail.gmail.com>
In-Reply-To: <CADrjBPrUsSigThoLU9thmZiaG4690B9-BcZYrBn44K9Fc8z3vg@mail.gmail.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 8 Nov 2023 11:33:46 -0600
Message-ID: <CAPLW+4m+n-U4cAkJZTeCsoE_e6r1j8srYmVjSLawPWwHi6SEAw@mail.gmail.com>
Subject: Re: [PATCH v3 10/20] clk: samsung: clk-gs101: Add cmu_top registers,
 plls, mux and gates
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Chanwoo Choi <chanwoo@kernel.org>, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, 
	conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com, 
	s.nawrocki@samsung.com, linus.walleij@linaro.org, wim@linux-watchdog.org, 
	linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, 
	olof@lixom.net, gregkh@linuxfoundation.org, cw00.choi@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 7, 2023 at 7:57=E2=80=AFAM Peter Griffin <peter.griffin@linaro.=
org> wrote:
>
> Hi Chanwoo,
>
> Thanks for your review!
>
> On Wed, 18 Oct 2023 at 17:51, Chanwoo Choi <chanwoo@kernel.org> wrote:
> >
> > Hi Peter,
> >
> > On 23. 10. 12. 03:48, Peter Griffin wrote:
> > > CMU_TOP is the top level clock management unit which contains PLLs, m=
uxes
> > > and gates that feed the other clock management units.
> > >
> > > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > > ---
> > >  drivers/clk/samsung/Kconfig     |    9 +
> > >  drivers/clk/samsung/Makefile    |    2 +
> > >  drivers/clk/samsung/clk-gs101.c | 1551 +++++++++++++++++++++++++++++=
++
> > >  3 files changed, 1562 insertions(+)
> > >  create mode 100644 drivers/clk/samsung/clk-gs101.c
> > >
> > > diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfi=
g
> > > index 76a494e95027..14362ec9c543 100644
> > > --- a/drivers/clk/samsung/Kconfig
> > > +++ b/drivers/clk/samsung/Kconfig
> > > @@ -12,6 +12,7 @@ config COMMON_CLK_SAMSUNG
> > >       select EXYNOS_5410_COMMON_CLK if ARM && SOC_EXYNOS5410
> > >       select EXYNOS_5420_COMMON_CLK if ARM && SOC_EXYNOS5420
> > >       select EXYNOS_ARM64_COMMON_CLK if ARM64 && ARCH_EXYNOS
> > > +     select GOOGLE_GS101_COMMON_CLK if ARM64 && ARCH_GOOGLE_TENSOR
> > >       select TESLA_FSD_COMMON_CLK if ARM64 && ARCH_TESLA_FSD
> > >
> > >  config S3C64XX_COMMON_CLK
> > > @@ -95,6 +96,14 @@ config EXYNOS_CLKOUT
> > >         status of the certains clocks from SoC, but it could also be =
tied to
> > >         other devices as an input clock.
> > >
> > > +config GOOGLE_GS101_COMMON_CLK
> > > +     bool "Google gs101 clock controller support" if COMPILE_TEST
> > > +     depends on COMMON_CLK_SAMSUNG
> > > +     depends on EXYNOS_ARM64_COMMON_CLK
> > > +     help
> > > +       Support for the clock controller present on the Google gs101 =
SoC.
> > > +       Choose Y here only if you build for this SoC.
> > > +
> >
> > (snip)
> >
> > > +
> > > +/* gs101 */
> > > +static const struct samsung_mux_clock cmu_top_mux_clks[] __initconst=
 =3D {
> > > +     /* CMU_TOP_PURECLKCOMP */
> > > +     MUX(CLK_MOUT_SHARED0_PLL, "mout_shared0_pll", mout_shared0_pll_=
p,
> > > +         PLL_CON0_PLL_SHARED0, 4, 1),
> > > +     MUX(CLK_MOUT_SHARED1_PLL, "mout_shared1_pll", mout_shared1_pll_=
p,
> > > +         PLL_CON0_PLL_SHARED1, 4, 1),
> > > +     MUX(CLK_MOUT_SHARED2_PLL, "mout_shared2_pll", mout_shared2_pll_=
p,
> > > +         PLL_CON0_PLL_SHARED2, 4, 1),
> > > +     MUX(CLK_MOUT_SHARED3_PLL, "mout_shared3_pll", mout_shared3_pll_=
p,
> > > +         PLL_CON0_PLL_SHARED3, 4, 1),
> > > +     MUX(CLK_MOUT_SPARE_PLL, "mout_spare_pll", mout_spare_pll_p,
> > > +         PLL_CON0_PLL_SPARE, 4, 1),
> > > +
> > > +     /* BUS0 */
> > > +     MUX(CLK_MOUT_BUS0_BUS, "mout_cmu_bus0_bus", mout_cmu_bus0_bus_p=
,
> > > +         CLK_CON_MUX_MUX_CLKCMU_BUS0_BUS, 0, 2),
> > > +     MUX(CLK_MOUT_CMU_BOOST, "mout_cmu_boost", mout_cmu_cmu_boost_p,
> >
> > In order to keep the consistent naming style,
> > I think that need to change from 'mout_cmu_boost' to 'mout_cmu_cmu_boos=
t'.
>
> Yes, that's a good point, and a good spot! Will fix it in v4.
>

Why do we need cmu_cmu part at all? From the look of it, renaming all
*_cmu_cmu_* clocks to just cmu wouldn't cause any naming conflicts. So
I don't see any benefit of double cmu prefix really.

> >
> > > +         CLK_CON_MUX_MUX_CLKCMU_CMU_BOOST, 0, 2),
> > > +
> > > +     /* BUS1 */
> > > +     MUX(CLK_MOUT_BUS1_BUS, "mout_cmu_bus1_bus", mout_cmu_bus1_bus_p=
,
> > > +         CLK_CON_MUX_MUX_CLKCMU_BUS1_BUS, 0, 2),
> > > +
> > > +     /* BUS2 */
> > > +     MUX(CLK_MOUT_BUS2_BUS, "mout_cmu_bus2_bus", mout_cmu_bus2_bus_p=
,
> > > +         CLK_CON_MUX_MUX_CLKCMU_BUS2_BUS, 0, 2),
> > > +
> > > +     /* CORE */
> > > +     MUX(CLK_MOUT_CORE_BUS, "mout_cmu_core_bus", mout_cmu_core_bus_p=
,
> > > +         CLK_CON_MUX_MUX_CLKCMU_CORE_BUS, 0, 2),
> > > +
> > > +     /* EH */
> > > +     MUX(CLK_MOUT_EH_BUS, "mout_cmu_eh_bus", mout_cmu_eh_bus_p,
> > > +         CLK_CON_MUX_MUX_CLKCMU_CORE_BUS, 0, 2),
> >
> > 'mout_cmu_core_bus' and 'mout_cmu_eh_bus' uses the same register/shift/=
width information.
> > I think it should be modified by changing the regiter or changing the s=
hift/width information.
>
> It should be using the CLK_CON_MUX_MUX_CLKCMU_EH_BUS register.
> Will fix it in v4.
>
> >
> > > +
> > > +     /* CPUCL{0,1,2,} */
> > > +     MUX(CLK_MOUT_CPUCL2_SWITCH, "mout_cmu_cpucl2_switch", mout_cmu_=
cpucl2_switch_p,
> > > +         CLK_CON_MUX_MUX_CLKCMU_CPUCL2_SWITCH, 0, 2),
> > > +
> > > +     MUX(CLK_MOUT_CPUCL1_SWITCH, "mout_cmu_cpucl1_switch", mout_cmu_=
cpucl1_switch_p,
> > > +         CLK_CON_MUX_MUX_CLKCMU_CPUCL1_SWITCH, 0, 2),
> > > +
> > > +     MUX(CLK_MOUT_CPUCL0_SWITCH, "mout_cmu_cpucl0_switch", mout_cmu_=
cpucl0_switch_p,
> > > +         CLK_CON_MUX_MUX_CLKCMU_CPUCL0_SWITCH, 0, 2),
> > > +
> > > +     MUX(CLK_MOUT_CPUCL0_DBG, "mout_cmu_cpucl0_dbg", mout_cmu_cpucl0=
_dbg_p,
> > > +         CLK_CON_DIV_CLKCMU_CPUCL0_DBG, 0, 2),
> > > +
> > > +     MUX(CLK_MOUT_CMU_HPM, "mout_cmu_hpm", mout_cmu_hpm_p,
> > > +         CLK_CON_MUX_MUX_CLKCMU_HPM, 0, 2),
> > >
> >
> > (snip)
> >
> > > +     /* PDP */
> > > +     MUX(CLK_MOUT_PDP_BUS, "mout_cmu_pdp_bus", mout_cmu_pdp_bus_p,
> > > +         CLK_CON_MUX_MUX_CLKCMU_PDP_BUS, 0, 2),
> > > +
> > > +     /* PDP */
> > > +     MUX(CLK_MOUT_PDP_VRA, "mout_cmu_pdp_vra", mout_cmu_pdp_vra_p,
> > > +         CLK_CON_MUX_MUX_CLKCMU_PDP_VRA, 0, 2),
> > > +
> > > +     /* IPP */
> > > +     MUX(CLK_MOUT_IPP_BUS, "mout_cmu_ipp_bus", mout_cmu_ipp_bus_p,
> > > +         CLK_CON_MUX_MUX_CLKCMU_IPP_BUS, 0, 2),
> > > +
> > > +     /* G3AA */
> > > +     MUX(CLK_MOUT_G3AA, "mout_cmu_g3aa", mout_cmu_g3aa_p,
> > > +         CLK_CON_MUX_MUX_CLKCMU_G3AA_G3AA, 0, 2),
> >
> > I think that need to change the mux name and mux parent name
> > because other mux name use the twice word according to the register nam=
e
> > even if use the same work such as 'mout_cmu_g2d_g2d', 'mout_cmu_mcsc_mc=
sc' and 'mout_cmu_mfc_mfc'.
> > - mout_cmu_g3aa -> mout_cmu_g3aa_g3aa
> > - mout_cmu_g3aa_p -> mount_cmu_g3aa_g3aa_p
>
> Will fix in v4
>

That consistent name duplication, while not causing any conflicts when
being removed, looks suspicious to me. That's probably some internal
scheme which doesn't make much sense for us and doesn't bring any
value, in terms of clock drivers. Maybe it'll be better to instead get
rid of such duplication throughout the driver, at least for clock name
strings? I mention this, because that's what I did in clk-exynos850.
With the only exception being the main domain clocks, which basically
enables/disables the whole unit internally, e.g.

    GATE(CLK_GOUT_G3D_CMU_G3D_PCLK, "gout_g3d_cmu_g3d_pclk", ...

which "G3D domain gate clock that enables/disables G3D", or something
like that. But clk-exynos850 doesn't have any duplicating bits like
"cmu_cmu" or "g3d_g3d". And the reason why I did that is I wanted
those clock names appear short and nice in device tree, as there were
no benefits in those duplicating bits.

> >
> > (snip)
> >
> > > +     /* CSIS */
> > > +     GATE(CLK_GOUT_CSIS, "gout_cmu_csis_bus", "mout_cmu_csis_bus",
> > > +          CLK_CON_GAT_GATE_CLKCMU_CSIS_BUS, 21, 0, 0),
> > > +     /* PDP */
> > > +     GATE(CLK_GOUT_PDP_BUS, "gout_cmu_pdp_bus", "mout_cmu_pdp_bus",
> > > +          CLK_CON_GAT_GATE_CLKCMU_PDP_BUS, 21, 0, 0),
> > > +
> > > +     GATE(CLK_GOUT_PDP_VRA, "gout_cmu_pdp_vra", "mout_cmu_pdp_vra",
> > > +          CLK_CON_GAT_GATE_CLKCMU_PDP_BUS, 21, 0, 0),
> > > +
> > > +     /* IPP */
> > > +     GATE(CLK_GOUT_IPP_BUS, "gout_cmu_ipp_bus", "mout_cmu_ipp_bus",
> > > +          CLK_CON_GAT_GATE_CLKCMU_IPP_BUS, 21, 0, 0),
> > > +     /* G3AA */
> > > +     GATE(CLK_GOUT_G3AA, "gout_cmu_g3aa", "mout_cmu_g3aa",
> > > +          CLK_CON_MUX_MUX_CLKCMU_G3AA_G3AA, 21, 0, 0),
> >
> > ditto.
> > gout_cmu_g3aa -> gout_cmu_g3aa_g3aa
> > mout_cmu_g3aa -> mout_cmu_g3aa_g3aa
>

Ditto.

> Will fix in V4
>
> regards,
>
> Peter.

