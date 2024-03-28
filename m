Return-Path: <linux-clk+bounces-5146-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A1788FE21
	for <lists+linux-clk@lfdr.de>; Thu, 28 Mar 2024 12:34:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D7BB1F262A5
	for <lists+linux-clk@lfdr.de>; Thu, 28 Mar 2024 11:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B21297E79F;
	Thu, 28 Mar 2024 11:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ww6gW32v"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E22C64CF3
	for <linux-clk@vger.kernel.org>; Thu, 28 Mar 2024 11:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711625630; cv=none; b=QhGZp5uWF4gl5NgoA/KKodkzv5he93rNAqX4SDG+6YdLmDG10HG4QTfHf686LHZVHV5CGow69oeoHJdFMkvvrEIUCbHhhqnkwFm8pAeuNoS7a3NLpjizvmnAuZyySlHJwAQA5BdCSGwdF9RYefXUKVeac0/9Q5S6HJ8kh0FnLnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711625630; c=relaxed/simple;
	bh=XG2eHZbF48FHp4FOxjZ7PImg8xQr4qNNRTByT+nzzNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dqgyaacKWwby/wpeKLXAcPjINnpQXL/I/vKJpTNJTyBbEiqUGcuXBz34lAw+jduaVU0obt4O5qy/qbLrBMpJXVMwToQT5a6foDTENPBZu651WD7r7D2jSgUhqgF02EgwIdq1WDqGf4y/LzIzntY7CLKMJVFRykGmltA3Q0kgoXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ww6gW32v; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-612f318d421so8773757b3.3
        for <linux-clk@vger.kernel.org>; Thu, 28 Mar 2024 04:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711625626; x=1712230426; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MAnW99Pta4sHuBmz7x/rR9GJHMa6um4fxT2/0JGoaHg=;
        b=Ww6gW32va4Ba93Qi+zfeBo57vzM/12u/j0k1rsl9AkGUdaAFBJdG8iQnve0wqMsASM
         lSqmDnA3eCJfT05a5kL51zqL82lbC8+YXWnU28267+otxZcNgbIq4ICHhwM86BMFuTLp
         ecY6iGv1D7SXNmXVFK40Ab9T5dnWchPb4qeVJE9TgA8cvO93I9tQaE17g7pmK5lWr4yg
         HJRbfeqkkqtkP6rRE99DPFCZjGk0AwBkMn8LWFuRlF8nIB97O1uG/SZMMYDFDSSQ6RhN
         OvvsCJ10fPk3NZabkG2d+alJ7Rg+CX65BnObMpHUhPYQYOSckgfANve1U+D3YKwUhcfg
         RRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711625626; x=1712230426;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MAnW99Pta4sHuBmz7x/rR9GJHMa6um4fxT2/0JGoaHg=;
        b=YuVH2N0bNz7SHJVYLEteubvVFTXOT/7H794FqYdj9+LCW8ploXSojOEo9rPtIhDqWU
         9Lc0uNviiH+IgiPdYNqTCZOjCWNWVAboQ2IEBmrAZfVSI5S/lIzR7K28bpC2sR+epr5U
         JWAydqWlay4YvOkA9Lue+X76OWpgm2CcKQJxkMibuHzNIp4bxzJDmlSVNpCAijsIi/4U
         Rn1RuBw9oQ46sXsNwQyqnICyEqpA9vL64Mx5grqJGZPeDk/d27oCxM3w98ivcMsjQYwO
         lsJE5LYQ8UwC2Jf2batO3nXVHXYAsKd5M5ld1hhw0jugCz9w406PKI1/C3f8PSR5pbsN
         2vcw==
X-Forwarded-Encrypted: i=1; AJvYcCXfXxyOUouk+jtbpbKh18289Yse9XlROujl86hAADYoo1xEinGZ2HkeMVNa+BaVcMN9xwaXSLz+s4+Nrfu8NH46XnbQwCO+onT3
X-Gm-Message-State: AOJu0YxGx+x844/VEFGxfZt+VWlBf9wwiqfi4wJsPnzzhwwNQ3meAvAd
	3PPI6M1NwNpDfkSNuaZ+LJGVP+ZZfsFFrvYo2ki8h7Qp5P09oWowOvY0IVJR05sowVg/IQMue+V
	aFi+f3neHhgbE3q3YufzBSo0vbFAJ5vz/dRyT7Q==
X-Google-Smtp-Source: AGHT+IExMaebhV1XlwlPj50zb1TuO1Bml7uBS55GIKK5jUniaNeksbPGpUis4Mt9iI/WZEEB7plCGP2QemMnJoHM2fs=
X-Received: by 2002:a0d:ff01:0:b0:611:3407:2e7e with SMTP id
 p1-20020a0dff01000000b0061134072e7emr2382124ywf.0.1711625626444; Thu, 28 Mar
 2024 04:33:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240326172813.801470-1-tudor.ambarus@linaro.org> <20240326172813.801470-3-tudor.ambarus@linaro.org>
In-Reply-To: <20240326172813.801470-3-tudor.ambarus@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 28 Mar 2024 11:33:35 +0000
Message-ID: <CADrjBPqxbgSxEGdor059eGXfpmE4O4e49EroXkpRW0vZEAqGJA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] clk: samsung: gs101: propagate PERIC1 USI SPI
 clock rate
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, andre.draszik@linaro.org, 
	willmcvicker@google.com, kernel-team@android.com, s.nawrocki@samsung.com, 
	cw00.choi@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
	semen.protsenko@linaro.org, linux-clk@vger.kernel.org, 
	jaewon02.kim@samsung.com
Content-Type: text/plain; charset="UTF-8"

Hi Tudor,

On Tue, 26 Mar 2024 at 17:28, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> When SPI transfer is being prepared, the spi-s3c64xx driver will call
> clk_set_rate() to change the rate of SPI source clock (IPCLK). But IPCLK
> is a gate (leaf) clock, so it must propagate the rate change up the
> clock tree, so that corresponding MUX/DIV clocks can actually change
> their values. Add CLK_SET_RATE_PARENT flag to corresponding clocks for
> all USI instances in GS101 PERIC1: USI{0, 9, 10, 11, 12, 13}. This change
> involves the following clocks:
>
> PERIC1 USI*:
>
>     Clock                              Div range    MUX Selection
>     -------------------------------------------------------------------
>     gout_peric1_peric1_top0_ipclk_*    -            -
>     dout_peric1_usi*_usi               /1..16       -
>     mout_peric1_usi*_usi_user          -            {24.5 MHz, 400 MHz}
>
> With input clock of 400 MHz this scheme provides the following IPCLK
> rate range, for each USI block:
>
>     PERIC1 USI*:       1.5 MHz ... 400 MHz
>
> Accounting for internal /4 divider in SPI blocks, and because the max
> SPI frequency is limited at 50 MHz, it gives us next SPI SCK rates:
>
>     PERIC1 USI_SPI*:   384 KHz ... 49.9 MHz
>
> Which shall be fine for the applications of the SPI bus.
>
> Note that with this we allow the reparenting of the MUX_USIx clocks to
> OSCCLK. Each instance of the USI IP has its own MUX_USI clock, thus the
> reparenting of a MUX_USI clock corresponds to a single instance of the
> USI IP. The datasheet mentions OSCCLK just in the low-power mode
> context, but the downstream driver reparents too the MUX_USI clocks to
> OSCCLK. Follow the downstream driver and do the same.
>
> Fixes: 63b4bd1259d9 ("clk: samsung: gs101: add support for cmu_peric1")
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Thanks Tudor for looking into this! I agree with the approach outlined above.
Given that
1) Samsung engineers OK'd it
2) Downstream clock driver does it (and also has other features
enabled like automatic clock gating enabled, which implies it should
not cause any issues there if we enable it in the future upstream).
3) We don't want to change clock frequencies of other IP instances

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>






>  drivers/clk/samsung/clk-gs101.c | 90 ++++++++++++++++++---------------
>  1 file changed, 48 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
> index d065e343a85d..ddf2d57eed68 100644
> --- a/drivers/clk/samsung/clk-gs101.c
> +++ b/drivers/clk/samsung/clk-gs101.c
> @@ -3230,47 +3230,53 @@ static const struct samsung_mux_clock peric1_mux_clks[] __initconst = {
>         MUX(CLK_MOUT_PERIC1_I3C_USER,
>             "mout_peric1_i3c_user", mout_peric1_nonbususer_p,
>             PLL_CON0_MUX_CLKCMU_PERIC1_I3C_USER, 4, 1),
> -       MUX(CLK_MOUT_PERIC1_USI0_USI_USER,
> -           "mout_peric1_usi0_usi_user", mout_peric1_nonbususer_p,
> -           PLL_CON0_MUX_CLKCMU_PERIC1_USI0_USI_USER, 4, 1),
> -       MUX(CLK_MOUT_PERIC1_USI10_USI_USER,
> -           "mout_peric1_usi10_usi_user", mout_peric1_nonbususer_p,
> -           PLL_CON0_MUX_CLKCMU_PERIC1_USI10_USI_USER, 4, 1),
> -       MUX(CLK_MOUT_PERIC1_USI11_USI_USER,
> -           "mout_peric1_usi11_usi_user", mout_peric1_nonbususer_p,
> -           PLL_CON0_MUX_CLKCMU_PERIC1_USI11_USI_USER, 4, 1),
> -       MUX(CLK_MOUT_PERIC1_USI12_USI_USER,
> -           "mout_peric1_usi12_usi_user", mout_peric1_nonbususer_p,
> -           PLL_CON0_MUX_CLKCMU_PERIC1_USI12_USI_USER, 4, 1),
> -       MUX(CLK_MOUT_PERIC1_USI13_USI_USER,
> -           "mout_peric1_usi13_usi_user", mout_peric1_nonbususer_p,
> -           PLL_CON0_MUX_CLKCMU_PERIC1_USI13_USI_USER, 4, 1),
> -       MUX(CLK_MOUT_PERIC1_USI9_USI_USER,
> -           "mout_peric1_usi9_usi_user", mout_peric1_nonbususer_p,
> -           PLL_CON0_MUX_CLKCMU_PERIC1_USI9_USI_USER, 4, 1),
> +       nMUX(CLK_MOUT_PERIC1_USI0_USI_USER,
> +            "mout_peric1_usi0_usi_user", mout_peric1_nonbususer_p,
> +            PLL_CON0_MUX_CLKCMU_PERIC1_USI0_USI_USER, 4, 1),
> +       nMUX(CLK_MOUT_PERIC1_USI10_USI_USER,
> +            "mout_peric1_usi10_usi_user", mout_peric1_nonbususer_p,
> +            PLL_CON0_MUX_CLKCMU_PERIC1_USI10_USI_USER, 4, 1),
> +       nMUX(CLK_MOUT_PERIC1_USI11_USI_USER,
> +            "mout_peric1_usi11_usi_user", mout_peric1_nonbususer_p,
> +            PLL_CON0_MUX_CLKCMU_PERIC1_USI11_USI_USER, 4, 1),
> +       nMUX(CLK_MOUT_PERIC1_USI12_USI_USER,
> +            "mout_peric1_usi12_usi_user", mout_peric1_nonbususer_p,
> +            PLL_CON0_MUX_CLKCMU_PERIC1_USI12_USI_USER, 4, 1),
> +       nMUX(CLK_MOUT_PERIC1_USI13_USI_USER,
> +            "mout_peric1_usi13_usi_user", mout_peric1_nonbususer_p,
> +            PLL_CON0_MUX_CLKCMU_PERIC1_USI13_USI_USER, 4, 1),
> +       nMUX(CLK_MOUT_PERIC1_USI9_USI_USER,
> +            "mout_peric1_usi9_usi_user", mout_peric1_nonbususer_p,
> +            PLL_CON0_MUX_CLKCMU_PERIC1_USI9_USI_USER, 4, 1),
>  };
>
>  static const struct samsung_div_clock peric1_div_clks[] __initconst = {
>         DIV(CLK_DOUT_PERIC1_I3C, "dout_peric1_i3c", "mout_peric1_i3c_user",
>             CLK_CON_DIV_DIV_CLK_PERIC1_I3C, 0, 4),
> -       DIV(CLK_DOUT_PERIC1_USI0_USI,
> -           "dout_peric1_usi0_usi", "mout_peric1_usi0_usi_user",
> -           CLK_CON_DIV_DIV_CLK_PERIC1_USI0_USI, 0, 4),
> -       DIV(CLK_DOUT_PERIC1_USI10_USI,
> -           "dout_peric1_usi10_usi", "mout_peric1_usi10_usi_user",
> -           CLK_CON_DIV_DIV_CLK_PERIC1_USI10_USI, 0, 4),
> -       DIV(CLK_DOUT_PERIC1_USI11_USI,
> -           "dout_peric1_usi11_usi", "mout_peric1_usi11_usi_user",
> -           CLK_CON_DIV_DIV_CLK_PERIC1_USI11_USI, 0, 4),
> -       DIV(CLK_DOUT_PERIC1_USI12_USI,
> -           "dout_peric1_usi12_usi", "mout_peric1_usi12_usi_user",
> -           CLK_CON_DIV_DIV_CLK_PERIC1_USI12_USI, 0, 4),
> -       DIV(CLK_DOUT_PERIC1_USI13_USI,
> -           "dout_peric1_usi13_usi", "mout_peric1_usi13_usi_user",
> -           CLK_CON_DIV_DIV_CLK_PERIC1_USI13_USI, 0, 4),
> -       DIV(CLK_DOUT_PERIC1_USI9_USI,
> -           "dout_peric1_usi9_usi", "mout_peric1_usi9_usi_user",
> -           CLK_CON_DIV_DIV_CLK_PERIC1_USI9_USI, 0, 4),
> +       DIV_F(CLK_DOUT_PERIC1_USI0_USI,
> +             "dout_peric1_usi0_usi", "mout_peric1_usi0_usi_user",
> +             CLK_CON_DIV_DIV_CLK_PERIC1_USI0_USI, 0, 4,
> +             CLK_SET_RATE_PARENT, 0),
> +       DIV_F(CLK_DOUT_PERIC1_USI10_USI,
> +             "dout_peric1_usi10_usi", "mout_peric1_usi10_usi_user",
> +             CLK_CON_DIV_DIV_CLK_PERIC1_USI10_USI, 0, 4,
> +             CLK_SET_RATE_PARENT, 0),
> +       DIV_F(CLK_DOUT_PERIC1_USI11_USI,
> +             "dout_peric1_usi11_usi", "mout_peric1_usi11_usi_user",
> +             CLK_CON_DIV_DIV_CLK_PERIC1_USI11_USI, 0, 4,
> +             CLK_SET_RATE_PARENT, 0),
> +       DIV_F(CLK_DOUT_PERIC1_USI12_USI,
> +             "dout_peric1_usi12_usi", "mout_peric1_usi12_usi_user",
> +             CLK_CON_DIV_DIV_CLK_PERIC1_USI12_USI, 0, 4,
> +             CLK_SET_RATE_PARENT, 0),
> +       DIV_F(CLK_DOUT_PERIC1_USI13_USI,
> +             "dout_peric1_usi13_usi", "mout_peric1_usi13_usi_user",
> +             CLK_CON_DIV_DIV_CLK_PERIC1_USI13_USI, 0, 4,
> +             CLK_SET_RATE_PARENT, 0),
> +       DIV_F(CLK_DOUT_PERIC1_USI9_USI,
> +             "dout_peric1_usi9_usi", "mout_peric1_usi9_usi_user",
> +             CLK_CON_DIV_DIV_CLK_PERIC1_USI9_USI, 0, 4,
> +             CLK_SET_RATE_PARENT, 0),
>  };
>
>  static const struct samsung_gate_clock peric1_gate_clks[] __initconst = {
> @@ -3305,27 +3311,27 @@ static const struct samsung_gate_clock peric1_gate_clks[] __initconst = {
>         GATE(CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_1,
>              "gout_peric1_peric1_top0_ipclk_1", "dout_peric1_usi0_usi",
>              CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_1,
> -            21, 0, 0),
> +            21, CLK_SET_RATE_PARENT, 0),
>         GATE(CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_2,
>              "gout_peric1_peric1_top0_ipclk_2", "dout_peric1_usi9_usi",
>              CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_2,
> -            21, 0, 0),
> +            21, CLK_SET_RATE_PARENT, 0),
>         GATE(CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_3,
>              "gout_peric1_peric1_top0_ipclk_3", "dout_peric1_usi10_usi",
>              CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_3,
> -            21, 0, 0),
> +            21, CLK_SET_RATE_PARENT, 0),
>         GATE(CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_4,
>              "gout_peric1_peric1_top0_ipclk_4", "dout_peric1_usi11_usi",
>              CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_4,
> -            21, 0, 0),
> +            21, CLK_SET_RATE_PARENT, 0),
>         GATE(CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_5,
>              "gout_peric1_peric1_top0_ipclk_5", "dout_peric1_usi12_usi",
>              CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_5,
> -            21, 0, 0),
> +            21, CLK_SET_RATE_PARENT, 0),
>         GATE(CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_6,
>              "gout_peric1_peric1_top0_ipclk_6", "dout_peric1_usi13_usi",
>              CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_6,
> -            21, 0, 0),
> +            21, CLK_SET_RATE_PARENT, 0),
>         GATE(CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_8,
>              "gout_peric1_peric1_top0_ipclk_8", "dout_peric1_i3c",
>              CLK_CON_GAT_GOUT_BLK_PERIC1_UID_PERIC1_TOP0_IPCLKPORT_IPCLK_8,
> --
> 2.44.0.396.g6e790dbe36-goog
>

