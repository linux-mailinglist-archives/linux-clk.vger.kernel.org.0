Return-Path: <linux-clk+bounces-4849-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2894E88578C
	for <lists+linux-clk@lfdr.de>; Thu, 21 Mar 2024 11:37:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C5B81C21ECA
	for <lists+linux-clk@lfdr.de>; Thu, 21 Mar 2024 10:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 893AF5644E;
	Thu, 21 Mar 2024 10:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a1LcEzz/"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B202456B85
	for <linux-clk@vger.kernel.org>; Thu, 21 Mar 2024 10:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711017449; cv=none; b=T4GvWg/WNd2OkwMGD8AFuhQLlPfremAiPPJIGswP0PgkWRZGobirGyOQ4izMFapjz+mvlvG8u0R3gs/d8d+VVbH0GunvNxohL5Yf6AhARJbZ9PPDokgs4tOGJ1EJv4ATEFQaOxOs0wUvA7R+mH2/M3ISVllGcEz+gUWxgMSyqms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711017449; c=relaxed/simple;
	bh=Q5HIPUafMl6eXevlnHQ/URvfVcm3dyhh3w+1UjS8SKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EsR0oceWU1HVY5MJU4ejjiCbEswOrzbaxUko96e/uc0BAoTSAU76HvXl8/73geEGCKTFtHHuSOG9ZB2164vp1tLQlMwOnxzEkh7N1xZDQDcKhT1SSp+WByjg3Y2RH1P1/oOw9M9um/jwIOJ8xH6XKKeV5jWhm+rTPe8QsnLCybk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a1LcEzz/; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-609f4d8551eso15072107b3.1
        for <linux-clk@vger.kernel.org>; Thu, 21 Mar 2024 03:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711017447; x=1711622247; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rgS7vN2/6Af+74Byj9OlnJ0H2zeuQGC5P3Z2OCbZVfM=;
        b=a1LcEzz/X2gNicqmhPQDL0qaKaEqhPmy3KaTuYNzEwowyPmBPMEcudiIYiTOdHpN9z
         4vB9UM7pns9KfD4BYVw7HHxdmSdVxC4+QjLzPzRvJuQxgVZT9xhHZslwMZF5of9LCpFu
         TDR8QBjnqsRAFK1FcRfju9rwbVz6vycJPH5Y+Nq9iTpgzjHpkoGWyS0cllfp3sUZ196l
         X7bjBN6w05fflwitx2AH1B3qCd9lwS/fMtZefDz8EDhewWaIDLcN9piOqGv8zLsj9Hvi
         S8WoeHgVpGstjC6Lf092Q5IVVQLEIVxAuddbE1Za9CmIbqeD2KDFaMuxnpJYaxxyN+n/
         u0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711017447; x=1711622247;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rgS7vN2/6Af+74Byj9OlnJ0H2zeuQGC5P3Z2OCbZVfM=;
        b=LZ37MDtyKdivphG98YtJDxPjkw1gXw6R20ra5Hn4nltMJjyFIZ9iOi5IM6ePqwgTVL
         dvBVdQlBWl6gjfJ8oM/Na8e+Vzp6YFdM2xdaudI4N0CF6fCjsaOVN9KQnGhz4nGhS6dV
         VzHgTMvii7aa5b4nHuohL1OVZj4JjbWsXVwYTCwolyQuLeQ4/6qVjwPKhxn2u+UwEXRa
         4TJ6voQpfqp2GzJ6/Z/DIk5pA+Z2OxJ51HpfBrm+gp6byf4vZ2Sxf7gGYmhxwNvRcU/x
         XUvs2j5uaTuv1iVZcpRXnX3IETdXi475LiPvKLGoZnRwz1ZGlmmu/ZQlyVfMK20pl5Qv
         rFjg==
X-Forwarded-Encrypted: i=1; AJvYcCVdncg3bJW6oXBRtEyuqb05WPkNJxE6qsEpkt98fN5Lc/GPPMehco09XCj4YZB73AIEwMJxRF7bnN3LuZDigMkI3rL9hDG+0zrQ
X-Gm-Message-State: AOJu0YzDfn1C2TDYxg0q6QmNqx7fB/2uOTgsZt76SD/nKacpWDDA87YG
	QsDJ0xjksGYa9w3jpQdvF902Zbk80UeWIoQQosTaSApUYZ1DUBO46rnmyIloGsRjVtPVqfmtMRk
	qGrbJlqa0GBVwepceAMmkJaHrVFf44BP3TSwieQ==
X-Google-Smtp-Source: AGHT+IG2RUQPgEXkiyPfIu42ue8IopFBcxsPMrsI45xpnMh6qrZimyfxJTyJ0YmVvs0DIScxCwEfz3O2Hzr3FChTGMA=
X-Received: by 2002:a25:808f:0:b0:dc6:d513:cd3 with SMTP id
 n15-20020a25808f000000b00dc6d5130cd3mr1365059ybk.31.1711017446673; Thu, 21
 Mar 2024 03:37:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240321-apss-ipq-pll-cleanup-v2-0-201f3cf79fd4@gmail.com> <20240321-apss-ipq-pll-cleanup-v2-3-201f3cf79fd4@gmail.com>
In-Reply-To: <20240321-apss-ipq-pll-cleanup-v2-3-201f3cf79fd4@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 21 Mar 2024 12:37:15 +0200
Message-ID: <CAA8EJprr4E1CM4f+eBzdRN41nm33xY-hRPQDn3peR94vLyJsYQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] clk: qcom: apss-ipq-pll: remove 'pll_type' field
 from struct 'apss_pll_data'
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Mar 2024 at 09:50, Gabor Juhos <j4g8y7@gmail.com> wrote:
>
> The value of the 'pll_type' field of 'struct apps_pll_data'
> is used only by the probe function to decide which config
> function should be called for the actual PLL. However this
> can be derived also from the 'pll' field  which makes the
> 'pll_type' field redundant.
>
> Additionally, the CLK_ALPHA_PLL_TYPE_* enumeration values
> are meant to be used as indices to the 'clk_alpha_pll_regs'
> array so using those to define the pll type in this driver
> is misleading anyway.
>
> Change the probe function to use the 'pll' field to determine
> the configuration function to be used, and remove the
> 'pll_type' field to simplify the code.

I can't fully appreciate this idea. There can be cases when different
PLL types share the set of ops. I think having a type is more
versatile and makes the code more obvious.

>
> No functional changes.
>
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
> Changes in v2:
>  - no changes
>  - Link to v1: https://lore.kernel.org/r/20240318-apss-ipq-pll-cleanup-v1-3-52f795429d5d@gmail.com
> ---
>  drivers/clk/qcom/apss-ipq-pll.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/clk/qcom/apss-ipq-pll.c b/drivers/clk/qcom/apss-ipq-pll.c
> index 8cf17374a2e2a..816b0d1f8d8c8 100644
> --- a/drivers/clk/qcom/apss-ipq-pll.c
> +++ b/drivers/clk/qcom/apss-ipq-pll.c
> @@ -131,37 +131,31 @@ static const struct alpha_pll_config ipq9574_pll_config = {
>  };
>
>  struct apss_pll_data {
> -       int pll_type;
>         struct clk_alpha_pll *pll;
>         const struct alpha_pll_config *pll_config;
>  };
>
>  static const struct apss_pll_data ipq5018_pll_data = {
> -       .pll_type = CLK_ALPHA_PLL_TYPE_STROMER,
>         .pll = &ipq_pll_stromer,
>         .pll_config = &ipq5018_pll_config,
>  };
>
>  static struct apss_pll_data ipq5332_pll_data = {
> -       .pll_type = CLK_ALPHA_PLL_TYPE_STROMER_PLUS,
>         .pll = &ipq_pll_stromer_plus,
>         .pll_config = &ipq5332_pll_config,
>  };
>
>  static struct apss_pll_data ipq8074_pll_data = {
> -       .pll_type = CLK_ALPHA_PLL_TYPE_HUAYRA,
>         .pll = &ipq_pll_huayra,
>         .pll_config = &ipq8074_pll_config,
>  };
>
>  static struct apss_pll_data ipq6018_pll_data = {
> -       .pll_type = CLK_ALPHA_PLL_TYPE_HUAYRA,
>         .pll = &ipq_pll_huayra,
>         .pll_config = &ipq6018_pll_config,
>  };
>
>  static struct apss_pll_data ipq9574_pll_data = {
> -       .pll_type = CLK_ALPHA_PLL_TYPE_HUAYRA,
>         .pll = &ipq_pll_huayra,
>         .pll_config = &ipq9574_pll_config,
>  };
> @@ -194,10 +188,10 @@ static int apss_ipq_pll_probe(struct platform_device *pdev)
>         if (!data)
>                 return -ENODEV;
>
> -       if (data->pll_type == CLK_ALPHA_PLL_TYPE_HUAYRA)
> +       if (data->pll == &ipq_pll_huayra)
>                 clk_alpha_pll_configure(data->pll, regmap, data->pll_config);
> -       else if (data->pll_type == CLK_ALPHA_PLL_TYPE_STROMER ||
> -                data->pll_type == CLK_ALPHA_PLL_TYPE_STROMER_PLUS)
> +       else if (data->pll == &ipq_pll_stromer ||
> +                data->pll == &ipq_pll_stromer_plus)
>                 clk_stromer_pll_configure(data->pll, regmap, data->pll_config);
>
>         ret = devm_clk_register_regmap(dev, &data->pll->clkr);
>
> --
> 2.44.0
>


-- 
With best wishes
Dmitry

