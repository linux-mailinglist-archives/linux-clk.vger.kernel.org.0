Return-Path: <linux-clk+bounces-2052-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA7D822D91
	for <lists+linux-clk@lfdr.de>; Wed,  3 Jan 2024 13:54:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3003E1F21676
	for <lists+linux-clk@lfdr.de>; Wed,  3 Jan 2024 12:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 170AF18632;
	Wed,  3 Jan 2024 12:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cOnw9bNd"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E73419445
	for <linux-clk@vger.kernel.org>; Wed,  3 Jan 2024 12:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-db3a09e96daso6740153276.3
        for <linux-clk@vger.kernel.org>; Wed, 03 Jan 2024 04:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704286478; x=1704891278; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pOGNoa+uoP67gG3C3OdO7eu3hZWCRo+rAfnDqGQ6OWk=;
        b=cOnw9bNdlSS3KGMy113cvsKHQg220lVPEWJP/CZ7zG7S+/DxwKnQUPhjSflJmYpQaW
         sPB3bi3+/OIPqpGVpyBpXZ0t+seoM1IALVU9tFE1ikGEhabSNlc8n8qxiV5nL4ThcCEk
         5BN2jEM5EajpBRzTJIF6+Tex9JcFcZV7OHdKxF56cwGznan4RfKRwlds2/r034FvdHvY
         n1zk2S9R4vrvHiNIIYPl1eSnngSUPg1PBoZXsQXHTzCEE4IhuBQqrK+Lf5ninxygGTgr
         bQQDQFHfEzCXZcsd1b5mxViC5gCkavQ1VWjmSCP+Ggj44tRQkrQYjSNtoTEyZWp013P5
         nYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704286478; x=1704891278;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pOGNoa+uoP67gG3C3OdO7eu3hZWCRo+rAfnDqGQ6OWk=;
        b=l7cLIBdQaRY9sWegdjAYOiKdhXF/nW8Lol3f42HiEyCZ6NUw0seZBPpzYrectONARf
         dr3yzPN4T3VSKiN652a93L931tv7XtMBVX3eyu/aITiGOfkS+Ojwy16fVcyRX3kiWzOO
         v7dV6eA04RRBd2WNS4GosR4dIst+ONht4aTaWevUMpatMIGUGHuVZDpmeF+hDexOwzGy
         QQwGqq9AZAyqZuNvkLcqHfjqDUgezozksoIkGEUvk5Gjvh2kLLbi+SxojPLjAkTsNpTe
         P69+6EbS3fqyyyrx0KHjhycVlOLFmoGFRSb3fFqTF3MouPZuPju4bk3ukHT9I9H/KXbi
         VaJA==
X-Gm-Message-State: AOJu0Yy8GxswdqFFcOu5xp5v3KPwZkYE2PiNILXv5skteFtF5Taxxz0H
	tIH6tVVbNqkjREPA0zdun4b5xzATS/loR9P8ZzWW+l87fI4vrw==
X-Google-Smtp-Source: AGHT+IEixB+WBNhbDXVIfjA3/lNv5WlNF7f1gcgq06js9K5QExKPJiNz8iPEs2JGsGvCguUuLd4AYEFxFy6bIiDoz20=
X-Received: by 2002:a25:d245:0:b0:dbc:f8ff:c7d7 with SMTP id
 j66-20020a25d245000000b00dbcf8ffc7d7mr9690250ybg.37.1704286478608; Wed, 03
 Jan 2024 04:54:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231220-sa8295p-gpu-v2-0-4763246b72c0@quicinc.com> <20231220-sa8295p-gpu-v2-4-4763246b72c0@quicinc.com>
In-Reply-To: <20231220-sa8295p-gpu-v2-4-4763246b72c0@quicinc.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 3 Jan 2024 13:54:02 +0100
Message-ID: <CAPDyKFoD-+2q4sDZL3J-2a2kGUmBXpUc6vj8zxzaO72O_Ksj7g@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] soc: qcom: rpmhpd: Drop SA8540P gfx.lvl
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Johan Hovold <johan+linaro@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 22 Dec 2023 at 05:39, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> On SA8295P and SA8540P gfx.lvl is not provdied by rpmh, but rather is
> handled by an external regulator (max20411). Drop gfx.lvl from the list
> of power-domains exposed on this platform.
>
> Fixes: f68f1cb3437d ("soc: qcom: rpmhpd: add sc8280xp & sa8540p rpmh power-domains")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>

I guess it's easier if you funnel this through the soc tree - or you
prefer if I take it through my pmdomain tree?

No matter what, feel free to add:
Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
> index 3078896b1300..27a73ff72614 100644
> --- a/drivers/pmdomain/qcom/rpmhpd.c
> +++ b/drivers/pmdomain/qcom/rpmhpd.c
> @@ -217,7 +217,6 @@ static struct rpmhpd *sa8540p_rpmhpds[] = {
>         [SC8280XP_CX] = &cx,
>         [SC8280XP_CX_AO] = &cx_ao,
>         [SC8280XP_EBI] = &ebi,
> -       [SC8280XP_GFX] = &gfx,
>         [SC8280XP_LCX] = &lcx,
>         [SC8280XP_LMX] = &lmx,
>         [SC8280XP_MMCX] = &mmcx,
>
> --
> 2.25.1
>

