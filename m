Return-Path: <linux-clk+bounces-12354-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3479847C5
	for <lists+linux-clk@lfdr.de>; Tue, 24 Sep 2024 16:36:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FFF0284210
	for <lists+linux-clk@lfdr.de>; Tue, 24 Sep 2024 14:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00E461A7AD2;
	Tue, 24 Sep 2024 14:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fE0x+ley"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398021A7273
	for <linux-clk@vger.kernel.org>; Tue, 24 Sep 2024 14:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727188600; cv=none; b=LI/94oCDbzgrxZEoDSzWbHx2vSlA06qYSNJg1CM+S108U4AEiJelcZOrlbFQIM9AvW74GWCKN+ERuj9IkLh8DaxVb04r1hKW/2dXmbFvmIUgq34i4DEIcQpl2hyx8If29KhdeOu0mvGwn8eXLjYJK6QwmSP0ZU6wShSaHbwghKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727188600; c=relaxed/simple;
	bh=cLcWPN+PccGT2ROUb0f3XJgZE+53pErMvAAijrqofjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qPNA7YsTqGp4pgSl6o4ZJTs+IMxF1Pc4mMXNHZ32SFLk19swusD9AiT7QzPfseFjSQK69kdPRk2WE4UFYSfQVklwYq6pHS27zdlEIDOMnfliSC4tQ2ucBrVkSTkAamJbX1BBni8huqdHOp91a7c/kO1zffxMw0nM9AKUggjvOFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fE0x+ley; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-374bd0da617so4005739f8f.3
        for <linux-clk@vger.kernel.org>; Tue, 24 Sep 2024 07:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727188596; x=1727793396; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hsQoCD7nt+kXzq9WRw11BBd3dSUqlfD/BOkGLN3L+0I=;
        b=fE0x+leyuT6P8sWmbJ/YAA0FNayw0C13wT2uFUTbBnku1oQfdig5fGxNtjepx4Qbv+
         f4ZNDyUFYUEPwgZ+07Ij7lxyVep1iMmwMmgoesHTN28Jqs0W5CdZAYNnDlK1Y2SLfBrG
         jWNJc73L2B4v00QOLhPoLC7wxHdrHevIKTc+Vf0+AnjNkoSqwaiTAV6te2j6bTZGSR+V
         dnEX5zOuc+6BgwyTe2uYSdRznY4F7f696cwM+plt/KXbGIDm1+AuZ9ZGzudWcE8hIErU
         I+McKWv+F+ySB1QXKSf86PbiHzmnDzMy1rBN7e2mqpb4yL+5j1Rwly+DW+zQ1mnYWMjf
         Y01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727188596; x=1727793396;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hsQoCD7nt+kXzq9WRw11BBd3dSUqlfD/BOkGLN3L+0I=;
        b=UtC5E0E0HvengXyrbtwtxPkcdUhJYlhZuLdN+ivQz3MFLTt2zjGBbfd+9B3YJ4Hs5z
         T/6TH5C7cKc0qJj8Th2ZqvaPfT1xWFEiUoPIBI2dZ3T35sKoMHZdCawq0jP5IQH+qW72
         y1QUY++3GADgUDbFcE+71g6dZxd2RHFzjL6ZqJhC+JW3L57jGpLfKqa//Kj83uGff/Gx
         HOpd7kUSXzYnB3HfYLKKLxLdaD+uLPNqR8PhS0uaSddC5w3dikVi7MxEyGMC/DUYmU30
         NvjPliQ/Iaqj8NEw2pGHm7Vf357vha34YOiEfQqcSzJbbbOCnRlQTVdH6vUfDyO1VVnD
         7HSQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/T7JVVEFx0DI52Y3WlCInZrBr6hWB+u1DhCMOBVgeE7peiY6FLCwhI13Z4vm8l/RX+omnyW5uR0I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiATz3yAfg/xTXULDTZkGB+ZGGM6aRz/xNamqK/MRNjZCFNcNo
	SLPc4w5YYViL49cTDQ5CUHMTNy6HiHjPGzH7JuIc8deQsV541zpXqs3fzWIIAA==
X-Google-Smtp-Source: AGHT+IFN85rvCU/A9zmRJhSH2USWFhIw9IW1vh5sN+JWuThrPkD39MtliW2jnnO6qPRDmIjAZMG5dA==
X-Received: by 2002:a05:6000:151:b0:374:b71f:72c0 with SMTP id ffacd0b85a97d-37a4227805bmr9321610f8f.21.1727188596428;
        Tue, 24 Sep 2024 07:36:36 -0700 (PDT)
Received: from thinkpad ([62.67.186.33])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc3187a4sm1763135f8f.90.2024.09.24.07.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 07:36:35 -0700 (PDT)
Date: Tue, 24 Sep 2024 16:36:34 +0200
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, kernel@collabora.com,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 0/4] Provide devm_clk_bulk_get_all_enabled() helper
Message-ID: <20240924143634.pqpdsewoqxn3liqi@thinkpad>
References: <20240914-clk_bulk_ena_fix-v1-0-ce3537585c06@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240914-clk_bulk_ena_fix-v1-0-ce3537585c06@collabora.com>

On Sat, Sep 14, 2024 at 09:04:53PM +0300, Cristian Ciocaltea wrote:
> Commit 265b07df758a ("clk: Provide managed helper to get and enable bulk
> clocks") added devm_clk_bulk_get_all_enable() function, but missed to
> return the number of clocks stored in the clk_bulk_data table referenced
> by the clks argument.
> 
> That is required in case there is a need to iterate these clocks later,
> therefore I couldn't see any use case of this parameter and should have
> been simply removed from the function declaration.
> 

Is there an user that currerntly does this?

- Mani

> The first patch in the series provides devm_clk_bulk_get_all_enabled()
> variant, which is consistent with devm_clk_bulk_get_all() in terms of
> the returned value:
> 
>  > 0 if one or more clocks have been stored
>  = 0 if there are no clocks
>  < 0 if an error occurred
> 
> Moreover, the naming is consistent with devm_clk_get_enabled(), i.e. use
> the past form of 'enable'.
> 
> The next two patches switch existing users of devm_clk_get_enable() to
> the new helper - there were only two, as of next-20240913.
> 
> The last patch drops the now obsolete devm_clk_bulk_get_all_enable()
> helper.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> Cristian Ciocaltea (4):
>       clk: Provide devm_clk_bulk_get_all_enabled() helper
>       soc: mediatek: pwrap: Switch to devm_clk_bulk_get_all_enabled()
>       PCI: exynos: Switch to devm_clk_bulk_get_all_enabled()
>       clk: Drop obsolete devm_clk_bulk_get_all_enable() helper
> 
>  drivers/clk/clk-devres.c                | 30 ++++++++++++++++--------------
>  drivers/pci/controller/dwc/pci-exynos.c |  2 +-
>  drivers/soc/mediatek/mtk-pmic-wrap.c    |  4 ++--
>  include/linux/clk.h                     | 12 +++++++-----
>  4 files changed, 26 insertions(+), 22 deletions(-)
> ---
> base-commit: 5acd9952f95fb4b7da6d09a3be39195a80845eb6
> change-id: 20240912-clk_bulk_ena_fix-16ba77358ddf
> 

-- 
மணிவண்ணன் சதாசிவம்

