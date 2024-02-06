Return-Path: <linux-clk+bounces-3331-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C777C84B49A
	for <lists+linux-clk@lfdr.de>; Tue,  6 Feb 2024 13:12:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77C131F28F2A
	for <lists+linux-clk@lfdr.de>; Tue,  6 Feb 2024 12:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65733132C0A;
	Tue,  6 Feb 2024 12:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G6EyGV+l"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8E5132491
	for <linux-clk@vger.kernel.org>; Tue,  6 Feb 2024 12:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707221315; cv=none; b=cdS0uwwJQsRbfu/aQ2AGCYzSne2cf7M/JxObibbfTgNDh2CDt/fB1E9GkE+d6GjvgD9XoohtTZQhwevmBaY+DfWaI2l+X8u+L5p1u9vu5uGTZvBkDPYBHG5RiO/YfOnsukekDCh/EkZB9CqHI2YGS+aLgmbz9j6rLdvGYhRtXoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707221315; c=relaxed/simple;
	bh=4Vu5+qjHqnLiD6M7Jx0MYJ1t1IIXbkexS1k3JHNLYrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=StPZlYPpB3V1ZcHflXLc2pDV/Gm0UINTkImUTQ6LAD/5fCH2UiZPtOTPXZJYFZC46hz5W4mRWYiYfpbhD+W7j0R5fZ9t2hP9XOPLpBb8heK5rlIH+ToE8bcv4UMz9ZQWpvhL3rJh5KxEXa9crWQvJzzITLbT5AuDCcyQoh0bFQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G6EyGV+l; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dc6e080c1f0so4704023276.2
        for <linux-clk@vger.kernel.org>; Tue, 06 Feb 2024 04:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707221311; x=1707826111; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D+xvbQgPMNIqZPpU5Yxz0zVKVlrqGRam+oSS93XuAZg=;
        b=G6EyGV+lrk2qG3c+xFFT4QmZe2kZkL9L2k5sSJU/PrFBr4GnBNIk0arxVEwPb3GoWi
         Qrikzt0jttBL6H6PZ/MMc83caJB6fJOFPzDt9Q3bRLxPFU0dSuR4p1QWpnuuHtMP1t32
         RiCAtdfrahm4lAChEB1aX7PYoV9lGe6IGkINfaOcaQyiZNRNlJA0H2JUP9H9k4Is31XJ
         18DzKyk5pHouBFEY+VmINipp86Iw2fG0s9YsqAEFFww1328ZzXOVdnvY8E5Qz6huyw20
         p1PeCOf6VS625ax1b/MkGH5MUZ+XFMw6/bViWxMZy9MzlzlWanANBY2VW/QGAf3YkKC9
         VBXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707221311; x=1707826111;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D+xvbQgPMNIqZPpU5Yxz0zVKVlrqGRam+oSS93XuAZg=;
        b=uSKo31wM/LPv4vmOKNpVsiiTo4EDmSHoVrw+ZLh3K6wfYnf0/K9iuKIVjLHFmaHM5W
         M4wWX76Wih4t5V4zExv3OcH3T5+GnqcvqXPGouQGc/PetJvqrxr8Yv9if3Wrs57Eqg5R
         6dVqR3nkeMLFWyYHAQ5SgH67qJAWgbpLE+IZrVgcx1OtO7PSNntsUH/R78LRJml5nXhQ
         K6Snz0epQZ0RkvnAh6L5BudI2DKAiv2Ba9Egs06B9qcJbuqSYbY0rT46PaWb4S3FCg+u
         17cfgVPXUW6YxEY9U41NfQwnUdKc6F7NberPYbmYBbkLPBy2+yLrfl9nim0q4oxcppM0
         6CKA==
X-Gm-Message-State: AOJu0YydimR4ugRbPBM9jpDrap1WGI6O2fiVnXb8W69FQT8qWkhPW51I
	auOh0wevMhfqKzPn6/ayOJM6qLhcqZyZ9ozROYRKzjuP8IfvYMXQFsW0gwvNznC8lUK7W/cqayU
	d65D6P7Zsph25S4cp1ESdtSdjtSxQFx4ytssWMw==
X-Google-Smtp-Source: AGHT+IHm/LzSZOY6wELij8ZqF6KUJKp53jlruo64Z12qH3QsvW0iqh2+ij7pZZDRD7Tg0EAkEehe8Eq/Q5Xya9Gok24=
X-Received: by 2002:a25:6984:0:b0:dc2:3c3b:fa3e with SMTP id
 e126-20020a256984000000b00dc23c3bfa3emr1424003ybc.31.1707221311472; Tue, 06
 Feb 2024 04:08:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240206113145.31096-1-quic_jkona@quicinc.com> <20240206113145.31096-5-quic_jkona@quicinc.com>
In-Reply-To: <20240206113145.31096-5-quic_jkona@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 6 Feb 2024 14:08:20 +0200
Message-ID: <CAA8EJpp7p35UECE7QfE-At+=xpa253=De+ZZNnaPSO9GqXCnrg@mail.gmail.com>
Subject: Re: [PATCH 4/5] clk: qcom: camcc-sm8650: Add camera clock controller
 driver for SM8650
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Imran Shaik <quic_imrashai@quicinc.com>, 
	Ajit Pandey <quic_ajipan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Feb 2024 at 13:41, Jagadeesh Kona <quic_jkona@quicinc.com> wrote:
>
> Add support for the camera clock controller for camera clients to be
> able to request for camcc clocks on SM8650 platform.
>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  drivers/clk/qcom/Kconfig        |    8 +
>  drivers/clk/qcom/Makefile       |    1 +
>  drivers/clk/qcom/camcc-sm8650.c | 3601 +++++++++++++++++++++++++++++++
>  3 files changed, 3610 insertions(+)
>  create mode 100644 drivers/clk/qcom/camcc-sm8650.c
[
[skipped]

> +static int __init cam_cc_sm8650_init(void)
> +{
> +       return platform_driver_register(&cam_cc_sm8650_driver);
> +}
> +subsys_initcall(cam_cc_sm8650_init);

We have been here for the patch series for camcc-sm8550. Upstream
reviewers expect that you don't repeat the same mistakes over and over
again.

Please use module_platform_driver().

> +
> +static void __exit cam_cc_sm8650_exit(void)
> +{
> +       platform_driver_unregister(&cam_cc_sm8650_driver);
> +}
> +module_exit(cam_cc_sm8650_exit);
> +
> +MODULE_DESCRIPTION("QTI CAMCC SM8650 Driver");
> +MODULE_LICENSE("GPL");
> --
> 2.43.0
>
>


-- 
With best wishes
Dmitry

