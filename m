Return-Path: <linux-clk+bounces-2999-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D88483FA32
	for <lists+linux-clk@lfdr.de>; Sun, 28 Jan 2024 22:55:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 047C81F21823
	for <lists+linux-clk@lfdr.de>; Sun, 28 Jan 2024 21:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FF073BB55;
	Sun, 28 Jan 2024 21:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cv/CHmIz"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E453C466
	for <linux-clk@vger.kernel.org>; Sun, 28 Jan 2024 21:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706478896; cv=none; b=OshZhaMUQeQjq6pd46X9Z5dEvqM55Ro7sCbhvNy6YOTdL77fpPkAQxhNUeXOJ2liU45Tp4Ese/TErowbTsOwOd4uIunFzN8uVOinnEqbhGYrQVCclHq8x/nXDOs0MDwf3ybM4hANt+e1fz2yU7YcAWsazRJB+pYIZ4VyRgCA71M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706478896; c=relaxed/simple;
	bh=WugGfDK+emUMgdBb1FkLCuURsfNZ1uU59q+8DxDxxZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=myGxx3mA48ECByBTlmPa7hT1mdOGVTC0WD6XbZdlZGEMr2DEJ8GOD09M+Fkd5o07T7OkM/WAivYUIJDX5+yADqmwDSfxEhIvXnDAaRROGQBAL/AY/VcEljaF33H5A6mO1MooI23S9neEIRQ3hLZhWvZjiHsTSygqRdOk9KgTjjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cv/CHmIz; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a3542a3374bso159512466b.2
        for <linux-clk@vger.kernel.org>; Sun, 28 Jan 2024 13:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706478893; x=1707083693; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D+XQ5J70Vv4JK+99QpNV1l2iMHbJbDR/DSuCxbzTjVM=;
        b=cv/CHmIzfVJ6pd22YjE1Mtfe4WoJ5LPntjTugKqhzRmY3/FtzAdEmDqP0Ga8GxzH4n
         ZYRdbEs2+ITAwojqhk9c3PKgdpSh7s/gGVgK2a1Meos6i6FQaucc0mi9LazNmLfW8sR7
         FaUtNI92bm9mqOxbO++zpRNeUosi9fKAqPrJPFKjP0FJsW3kIAArnsbz/gXBguKcIjt0
         qQD7gQHxutEpDEU/oIVwUDf/RzoxKZbHtdDAmPPBN1TC39XubtlOHbbmKtb8xGJO564z
         u16Z4g69r6vk3gI2GwfQcmPasRfbXRhWiXogP0DUpxAQASQXNoSwxcnf+h/YR0RijLZu
         vyng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706478893; x=1707083693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+XQ5J70Vv4JK+99QpNV1l2iMHbJbDR/DSuCxbzTjVM=;
        b=U9XXCukfNyMhPVoPP+38J1yYhMXtQSW73GNeafqNTksuhdz4CVSKVzga6+lTag6EY7
         fxpz/LplHSE9a+n1tS7ggm1V4VFvlHwL0pBx0NkkMxKkTcumUsdfz6h5Va7tibb7hp/i
         eWVn28oe2OybhXK7EJTrEO5EJSIVTDSGhghMGrdW+HUwpcN6kq0UjbxfEx1sHYEALkmF
         pJIjsilLyl7bUa6nFuEwFuk6lG7kbFD3onbV+mHMOyVK7AQ/Ox4QxcwcTyu7tKBgkQ44
         cGS2RwIidcj2ZfiiUR43AD4T5gIrH7knT/wewhWekN9WlmdRIMJX6seD9v1FMWwdfCx/
         VdSg==
X-Gm-Message-State: AOJu0Yxep3EPMfDKUozhegZcgzwzlbBNW6zZ0hD+LL24cTEHSJ1DO3qc
	tQwaJqQkPJFCAXGMPImYQKxlodcqMrcdCSwjEmI492b4XEnSezcJ4I622rhdY+I=
X-Google-Smtp-Source: AGHT+IGwkQQURlUlsbXUqGqdg2JFIas0UFI7/DKvPhXxcltfn/ipNh+f9fXJupwAXTqT/wt8TETTOA==
X-Received: by 2002:a17:906:4901:b0:a35:2758:22a3 with SMTP id b1-20020a170906490100b00a35275822a3mr2847446ejq.1.1706478892377;
        Sun, 28 Jan 2024 13:54:52 -0800 (PST)
Received: from linaro.org ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id s8-20020a170906bc4800b00a317165027fsm3297385ejv.13.2024.01.28.13.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jan 2024 13:54:51 -0800 (PST)
Date: Sun, 28 Jan 2024 23:54:50 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	Rajendra Nayak <quic_rjendra@quicinc.com>
Subject: Re: [PATCH v2 10/10] clk: qcom: Add camcc clock driver for x1e80100
Message-ID: <ZbbNKtXF7b20YZLl@linaro.org>
References: <20231214-x1e80100-clock-controllers-v2-0-2b0739bebd27@linaro.org>
 <20231214-x1e80100-clock-controllers-v2-10-2b0739bebd27@linaro.org>
 <624956b6-d7ea-43da-bb8d-32d9166a0272@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <624956b6-d7ea-43da-bb8d-32d9166a0272@linaro.org>

On 23-12-16 14:39:48, Konrad Dybcio wrote:
> On 14.12.2023 17:49, Abel Vesa wrote:
> > From: Rajendra Nayak <quic_rjendra@quicinc.com>
> > 
> > Add the camcc clock driver for x1e80100
> > 
> > Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> [...]
> 
> > +enum {
> > +	DT_BI_TCXO,
> > +	DT_BI_TCXO_AO,
> > +	DT_SLEEP_CLK,
> > +};
> > +
> > +enum {
> > +	P_BI_TCXO,
> Please don't overload this define with DT_BI_TCXO_AO, add a new one
> for the active-only clock. Please also do this in other drivers in
> this series.
> 
> [...]
> 
> > +	clk_lucid_ole_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config);
> > +	clk_lucid_ole_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_config);
> > +	clk_rivian_evo_pll_configure(&cam_cc_pll2, regmap, &cam_cc_pll2_config);
> > +	clk_lucid_ole_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
> > +	clk_lucid_ole_pll_configure(&cam_cc_pll4, regmap, &cam_cc_pll4_config);
> > +	clk_lucid_ole_pll_configure(&cam_cc_pll6, regmap, &cam_cc_pll6_config);
> > +	clk_lucid_ole_pll_configure(&cam_cc_pll8, regmap, &cam_cc_pll8_config);
> Do we know whether these configure calls are actually necessary?

So camera support hasn't been fully brought up yet, but based on the SM8550
driver (which is quite similar), they seem to be needed.

Once camera is up, we can confirm for sure.

> > +
> > +	/*
> > +	 * Keep clocks always enabled:
> > +	 *	cam_cc_gdsc_clk
> > +	 *	cam_cc_sleep_clk
> > +	 */
> > +	regmap_update_bits(regmap, 0x13a9c, BIT(0), BIT(0));
> > +	regmap_update_bits(regmap, 0x13ab8, BIT(0), BIT(0));
> Please make the comments inline with each line

Will do.

> 
> Konrad

