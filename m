Return-Path: <linux-clk+bounces-5391-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48814896DA4
	for <lists+linux-clk@lfdr.de>; Wed,  3 Apr 2024 13:06:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2DCC28DC4A
	for <lists+linux-clk@lfdr.de>; Wed,  3 Apr 2024 11:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F90E1411ED;
	Wed,  3 Apr 2024 11:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iJ33qjLn"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B61043AB4
	for <linux-clk@vger.kernel.org>; Wed,  3 Apr 2024 11:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712142378; cv=none; b=Tj6LsCRKLz0w0NDH6TiWLFpOLv57wW99g4mNqPP1VqIUpeDmN2LK4pkq8YYNQP4iBVirs+LqSXx2rxoX85CqKdoudw42htE+YD1ZnxHb38FpcYVGOArh36u1o9CezLvO08uHgZIVfc1CLPWzVmVSGkNf6fi3wZhkk0Wu3Z3tVEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712142378; c=relaxed/simple;
	bh=EDO9/p9Hc/6bNyYzsBIcNxt4PlNh1RbuF76k0hVY3Z0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gD+9iT5jwZVj6VWVbIxKs8oHE/iU7hn529FzG9LYG+ykxpgp2pQHbtCZezAPcyPEIvK2dgXL2ChA98Lv/VRQC2gXrP5GFVKhif9ZHAtIzQICUsARn3M3+cBVqBGgHkidyP+O95s8xWc+cS/D7g4gBshBCmZWB0ITqy8OkBQstv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iJ33qjLn; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dcd7c526cc0so5797082276.1
        for <linux-clk@vger.kernel.org>; Wed, 03 Apr 2024 04:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712142375; x=1712747175; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U/azMONlxGoseJ7B8jN3p15xzRfnJ6LHkSav7Pfj81I=;
        b=iJ33qjLnov+E2PWyqsrKRZ1coeiWQR8Z3bNbIAk/azMBSCnUgBVPPh3GKHmjeJrlaR
         b4FE7u2DVXmrX4/iUWWytymbawsLVne2ajUK779xIkoUrUiNBI27JQHqqS3BP4KaWbzU
         fZFt15/4YMxTgw05xNg3daUg5X1WzkMV5qUGUwHJ7ysMZFlTW6y31Po/p4a9WTiHQo2N
         jKZVOqPW1U8JmIPCDAShbQYpbyrxwRLWnXsPpbkf011IPvuduBWY6htgLyLoNtle8Nqb
         HMDwjf6yywh9rnKz17M9bmDACN9RKkcaYSBVN69INGt2n2ADFz2BYQnF+hLlgacxxbBm
         q0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712142375; x=1712747175;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/azMONlxGoseJ7B8jN3p15xzRfnJ6LHkSav7Pfj81I=;
        b=PrNkEnjTIXECq+9NHKNAt7JYzowtwLqtk0p4988Th36VzfSGgjqtA/hK1UAqEdJV/6
         Jf96A5PInvJ9iQo+NJWegx+cog/C3Rvb9AU2pw/kN9ba4bUGFrZlCd8M+KxRNKQZB7zp
         okr/hN5lMoR5IDCn8A6rbCSdaUEhAVfotPhKwLUhfKd9FGm3mbW5lLkmLwIY7k7y/Sl1
         m+l49qSWHEXD4Ax692WbeDJBto2DmHC5wVbq5MKUR+hyWyfrVtNpBBNLH5JPEiaLRxHR
         1bRlcNpF7P/bRHCGPy5bLTmjHB9wgI0p2yYnQvWkQbcRAU+JLiE0SfjNKnClLjHk834F
         jo5A==
X-Forwarded-Encrypted: i=1; AJvYcCU5ZkZ/RowTlQPz+PUZWflRRx56kQyP7CeXsliYwuhXsYbHtS4U/ff2MhwAqpUXMfONfun+ahrvLSxDh4iu1glzg+4I1SU/+CZN
X-Gm-Message-State: AOJu0Yy0G7dt3VLtHIGUM+7SADcD1uktVQbwZQ7vBXBikLWjAYJ+xO90
	/oce5mBsC+//U5B5fcFwuJdmJ/jk3+zmWnZ/57uu1LCP/qyyK1hQIjbpY0uGRzVgeB3YDdidOiS
	CwC0b6vzMxTnkURqke2ssraXrw1idAeTg2h6Ulw==
X-Google-Smtp-Source: AGHT+IFCSkXnx/Zrz3QddgbZ9vWZRtgUE2bIP/+PQ7HyTrJIIxTAcWLMp11z1+aMjfQaqdWLVSjpI2571d8frW0zBDA=
X-Received: by 2002:a25:1843:0:b0:dcc:1c6c:430d with SMTP id
 64-20020a251843000000b00dcc1c6c430dmr11673123yby.12.1712142375513; Wed, 03
 Apr 2024 04:06:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240403104220.1092431-1-quic_varada@quicinc.com> <20240403104220.1092431-4-quic_varada@quicinc.com>
In-Reply-To: <20240403104220.1092431-4-quic_varada@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Apr 2024 14:06:04 +0300
Message-ID: <CAA8EJpohAe-aW1QqVkE9NBRU0DpZR7UiwdUKk6rS_YFAhenZZA@mail.gmail.com>
Subject: Re: [PATCH v7 3/5] clk: qcom: common: Add interconnect clocks support
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, mturquette@baylibre.com, 
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	djakov@kernel.org, quic_anusha@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Apr 2024 at 13:42, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> Unlike MSM platforms that manage NoC related clocks and scaling
> from RPM, IPQ SoCs dont involve RPM in managing NoC related
> clocks and there is no NoC scaling.
>
> However, there is a requirement to enable some NoC interface
> clocks for accessing the peripheral controllers present on
> these NoCs. Though exposing these as normal clocks would work,
> having a minimalistic interconnect driver to handle these clocks
> would make it consistent with other Qualcomm platforms resulting
> in common code paths. This is similar to msm8996-cbf's usage of
> icc-clk framework.
>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v7: Restore clk_get
> v6: first_id -> icc_first_node_id
>     Remove clock get so that the peripheral that uses the clock
>     can do the clock get
> v5: Split changes in common.c to separate patch
>     Fix error handling
>     Use devm_icc_clk_register instead of icc_clk_register
> v4: Use clk_hw instead of indices
>     Do icc register in qcom_cc_probe() call stream
>     Add icc clock info to qcom_cc_desc structure
> v3: Use indexed identifiers here to avoid confusion
>     Fix error messages and move to common.c
> v2: Move DTS to separate patch
>     Update commit log
>     Auto select CONFIG_INTERCONNECT & CONFIG_INTERCONNECT_CLK to fix build error
> ---
>  drivers/clk/qcom/common.c | 31 ++++++++++++++++++++++++++++++-
>  drivers/clk/qcom/common.h |  3 +++
>  2 files changed, 33 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index 8b6080eb43a7..fa4ec89c04c4 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -8,6 +8,7 @@
>  #include <linux/regmap.h>
>  #include <linux/platform_device.h>
>  #include <linux/clk-provider.h>
> +#include <linux/interconnect-clk.h>
>  #include <linux/reset-controller.h>
>  #include <linux/of.h>
>
> @@ -252,6 +253,34 @@ static struct clk_hw *qcom_cc_clk_hw_get(struct of_phandle_args *clkspec,
>         return cc->rclks[idx] ? &cc->rclks[idx]->hw : NULL;
>  }
>
> +static int qcom_cc_icc_register(struct device *dev,
> +                               const struct qcom_cc_desc *desc)
> +{
> +       struct icc_clk_data *icd;
> +       int i;
> +
> +       if (!IS_ENABLED(CONFIG_INTERCONNECT_CLK))
> +               return 0;
> +
> +       if (!desc->icc_hws)
> +               return 0;
> +
> +       icd = devm_kcalloc(dev, desc->num_icc_hws, sizeof(*icd), GFP_KERNEL);
> +       if (!icd)
> +               return -ENOMEM;
> +
> +       for (i = 0; i < desc->num_icc_hws; i++) {
> +               icd[i].clk = devm_clk_hw_get_clk(dev, desc->icc_hws[i], "icc");
> +               if (!icd[i].clk)
> +                       return dev_err_probe(dev, -ENOENT,
> +                                            "(%d) clock entry is null\n", i);
> +               icd[i].name = clk_hw_get_name(desc->icc_hws[i]);
> +       }
> +
> +       return devm_icc_clk_register(dev, desc->icc_first_node_id,
> +                                                    desc->num_icc_hws, icd);
> +}
> +
>  int qcom_cc_really_probe(struct platform_device *pdev,
>                          const struct qcom_cc_desc *desc, struct regmap *regmap)
>  {
> @@ -327,7 +356,7 @@ int _qcom_cc_really_probe(struct device *dev,
>         if (ret)
>                 return ret;
>
> -       return 0;
> +       return qcom_cc_icc_register(dev, desc);
>  }
>  EXPORT_SYMBOL_GPL(_qcom_cc_really_probe);
>
> diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
> index 8657257d56d3..43073d2ef32a 100644
> --- a/drivers/clk/qcom/common.h
> +++ b/drivers/clk/qcom/common.h
> @@ -29,6 +29,9 @@ struct qcom_cc_desc {
>         size_t num_gdscs;
>         struct clk_hw **clk_hws;
>         size_t num_clk_hws;
> +       struct clk_hw **icc_hws;

Still we are passing hws here. We already have all the hws in a
different array. Can we just pass the indices?

> +       size_t num_icc_hws;
> +       unsigned int icc_first_node_id;
>  };
>
>  /**
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

