Return-Path: <linux-clk+bounces-2046-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 950A9822917
	for <lists+linux-clk@lfdr.de>; Wed,  3 Jan 2024 08:45:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89E471C23026
	for <lists+linux-clk@lfdr.de>; Wed,  3 Jan 2024 07:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91364179B0;
	Wed,  3 Jan 2024 07:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NznUv0QM"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119E71803F
	for <linux-clk@vger.kernel.org>; Wed,  3 Jan 2024 07:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ccc6e509c8so1757061fa.0
        for <linux-clk@vger.kernel.org>; Tue, 02 Jan 2024 23:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704267928; x=1704872728; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qp6FcFL6ukPLR5E+VXKBAlytc1GJbe7ZjRNXKkg7yJE=;
        b=NznUv0QM2orzzFlteTkyn1/7uH1FabGzGJRHX3M9+oy/9chgciVnqFK+Heesb0SqIw
         ssJu0+1P9t/cVtESScNy04KtpW9rfYKAvX4jpfO2wGqmW0e8iMTOSPsmJ6+Jh7q4dSpP
         J9WsmGB76fnhxE3qQjfeyqhmoHRmyk3Ysh/FM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704267928; x=1704872728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qp6FcFL6ukPLR5E+VXKBAlytc1GJbe7ZjRNXKkg7yJE=;
        b=v2ybgqXq0yotThiqp7IostkJHeGDouFXkuGTS+CqbO27WvSUvTm0fa/jJfxngmhDPq
         eYsvmOdkgebVd/SXdMCG3ELnf9sFVtKz0uRoILfc6t5UtdcDzsGIpBkdU1v632C8jhVu
         NX/L1xZ3O4mqqEtYxFyG+UTSNfXq4Me+0CfZKog6Ij9BIG2CxIAHqc8XwtZV5FcNalIV
         9eJzLFS0Ru1U8brmSDJmeMcX1gOuHAIHFnfEDKlArRKiJ+xK5u4LDSuxVgXjf5hkyFS7
         mTlOj+Uro8Z1vdXwHVmYDtOw3hypNQnh024kOMcTFFJT+LvGr4ih6f8NjWmuAZuedhXu
         HL7A==
X-Gm-Message-State: AOJu0Yzoi1JNgRmZvZ9InFGBpUDxQuOIurPVqc/l6ENyiRAi1PZAHn89
	JORvRsgYOapRjGcNdHlfrmiIEXz4dtaZI+GMXf3KxU5yqA9m
X-Google-Smtp-Source: AGHT+IFyXu8My+izeEzyJdZ8sEntbdgwFjGfLGe2KKcFBr1ZqJrFAIQn6XWRmJwJINhZghJGH2+U4BezZsczM7OOQkw=
X-Received: by 2002:a2e:a487:0:b0:2cd:19ba:36f0 with SMTP id
 h7-20020a2ea487000000b002cd19ba36f0mr130664lji.17.1704267928052; Tue, 02 Jan
 2024 23:45:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102081402.1226795-1-treapking@chromium.org>
In-Reply-To: <20240102081402.1226795-1-treapking@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 3 Jan 2024 15:45:17 +0800
Message-ID: <CAGXv+5F1AjQYf0qVd5PwZobkvHLCczX_KcGEebNP5JvJCHb9rw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: mediatek: Introduce need_pm_runtime to mtk_clk_desc
To: Pin-yen Lin <treapking@chromium.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 2, 2024 at 4:14=E2=80=AFPM Pin-yen Lin <treapking@chromium.org>=
 wrote:
>
> Introduce a new need_pm_runtime variable to mtk_clk_desc to indicate
> this clock needs a runtime PM get on the clock controller during the
> probing stage.

No. The flag indicates that the clock controller needs runtime PM
for its operation, likely because it needs some power domain enabled.

The runtime PM get during the probe phase is a workaround to prevent
a deadlock in clk_register.

These are two separate things. The second part also should be documented
in the code with a comment, i.e. a comment should be placed before
pm_runtime_resume_and_get().

ChenYu

> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> ---
>
> Changes in v2:
> - Fix the order of error handling
> - Update the commit message and add a comment before the runtime PM call
>
>  drivers/clk/mediatek/clk-mtk.c | 15 +++++++++++++++
>  drivers/clk/mediatek/clk-mtk.h |  2 ++
>  2 files changed, 17 insertions(+)
>
> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mt=
k.c
> index 2e55368dc4d8..c31e535909c8 100644
> --- a/drivers/clk/mediatek/clk-mtk.c
> +++ b/drivers/clk/mediatek/clk-mtk.c
> @@ -13,6 +13,7 @@
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/slab.h>
>
>  #include "clk-mtk.h"
> @@ -494,6 +495,14 @@ static int __mtk_clk_simple_probe(struct platform_de=
vice *pdev,
>                         return IS_ERR(base) ? PTR_ERR(base) : -ENOMEM;
>         }
>
> +
> +       if (mcd->need_runtime_pm) {
> +               devm_pm_runtime_enable(&pdev->dev);
> +               r =3D pm_runtime_resume_and_get(&pdev->dev);
> +               if (r)
> +                       return r;
> +       }
> +
>         /* Calculate how many clk_hw_onecell_data entries to allocate */
>         num_clks =3D mcd->num_clks + mcd->num_composite_clks;
>         num_clks +=3D mcd->num_fixed_clks + mcd->num_factor_clks;
> @@ -574,6 +583,9 @@ static int __mtk_clk_simple_probe(struct platform_dev=
ice *pdev,
>                         goto unregister_clks;
>         }
>
> +       if (mcd->need_runtime_pm)
> +               pm_runtime_put(&pdev->dev);
> +
>         return r;
>
>  unregister_clks:
> @@ -604,6 +616,9 @@ static int __mtk_clk_simple_probe(struct platform_dev=
ice *pdev,
>  free_base:
>         if (mcd->shared_io && base)
>                 iounmap(base);
> +
> +       if (mcd->need_runtime_pm)
> +               pm_runtime_put(&pdev->dev);
>         return r;
>  }
>
> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mt=
k.h
> index 22096501a60a..c17fe1c2d732 100644
> --- a/drivers/clk/mediatek/clk-mtk.h
> +++ b/drivers/clk/mediatek/clk-mtk.h
> @@ -237,6 +237,8 @@ struct mtk_clk_desc {
>
>         int (*clk_notifier_func)(struct device *dev, struct clk *clk);
>         unsigned int mfg_clk_idx;
> +
> +       bool need_runtime_pm;
>  };
>
>  int mtk_clk_pdev_probe(struct platform_device *pdev);
> --
> 2.43.0.472.g3155946c3a-goog
>

