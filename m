Return-Path: <linux-clk+bounces-14824-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BA62C9D1DAC
	for <lists+linux-clk@lfdr.de>; Tue, 19 Nov 2024 02:58:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4DCF3B20CBC
	for <lists+linux-clk@lfdr.de>; Tue, 19 Nov 2024 01:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80FD213211A;
	Tue, 19 Nov 2024 01:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sb7duX0n"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9735D126BF9
	for <linux-clk@vger.kernel.org>; Tue, 19 Nov 2024 01:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731981499; cv=none; b=dVZj2QwQ82FwkFts5VOYy6nGXQeLHuE0XAKM8+BrnlcUd/DWEpyUNt0w5PM5LMwnMX0HpLZBh5s5VVozbAp8I0HxlIeGtUl39l29vrbWZ5TrwB/hmN/+ozOLyaXPz9U3p3vd9kxPTPAOims6dNSqUR0vpys/NobCG5ZEh6G6DlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731981499; c=relaxed/simple;
	bh=ib43JGOIZ1ATJp9/a9ElmBK4S1TyxSpfZHQfvMpHa/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jrBpZjRDQiQBV6tl3AumoG9FVFQG3d410iyYn1fg4T3JYRTN/iuCF3hSNwyc09raATLMqxTbltSYoNguDNg9rivcjZgzxTkinxeUAVkaaHbbDdofcCfusBw57f1PSARhAKEEK4ROE16yXJHbLWi+pUvzUIwKkt0Hn0wLlL3+9OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sb7duX0n; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb5014e2daso21529341fa.0
        for <linux-clk@vger.kernel.org>; Mon, 18 Nov 2024 17:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731981496; x=1732586296; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wdC7Ydz7m1dNRr4+gLJERncdScN7zJGfk7xMkgiJr2o=;
        b=sb7duX0nQharmQd8lGWsRWNFceN8fSeiJSAUt9HnEZxw36K+HS71/8J/Suw54AfoXz
         M0SvTAkT6nv3x5RmiVVgPfTmjbyyP3JsA3kTC9sQ2oWocyEh3RYicuBjwa4Fk9N/vY2p
         g/GPzZmk7t9NAWSHbuo4Y2rpLBkrt2fMDFn6EDN6vuOd4Y/UzauIdhv7zx8hT4YTldka
         rc7wJxgOwc0LTV5aNvgUK/K/epsRe+NLHvEcbmYT/ZoZdTH0jayV5/cgWtWZnZgfIQxr
         nadD1C/FYkCBDmC1oUxwofooLflMBeoT6PolNYsi4+UhPGaQ1P1w7/8JD1M9cXTfd4lM
         SdPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731981496; x=1732586296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdC7Ydz7m1dNRr4+gLJERncdScN7zJGfk7xMkgiJr2o=;
        b=laALDX5cZRMRWsnIY9hsYYF4X2SglCK0SyjWrDxCQ/24GqmfhkHaQWTeiVsHECnokD
         5SV8qWM0VwUKey9pMLA80XjXsS1Dwqy7/LKUPswRVI/lobO6Bkn8iq2lM7Q1JASNdIYz
         Y+rYhp7G8Ll2LMZI+MLkpE2tpVi5fsuHMJ1NKWBLDxqQ5+/CEyTDgF9YDqJktjG0hoH7
         93WmEruvYzxfh+hVOoXZtACSIpa9De1nMBVL20L1RwZHNWd/gPEF15gXetOmDQtmF2mN
         VyEyICNYPcXo1fyDqNiCC1w0snFHUDVj0p3rd8ypkAA7P3O6ffwdYgRkgg0GDPMx6mz7
         Ovjw==
X-Forwarded-Encrypted: i=1; AJvYcCW/9lRryvCWCX24KbEDmFxaiislJ2Eo4cSUPHU9uiRUz7h7wGPKJVVwEIwXicyIblrm9qznMuS3FjI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQK86fYlzRrAwwyFlODbXJQhEcRkDIiTj+t4sOECnjlytlVPB5
	xa1ynY29QKXYmkDsrlaf51uj1hiqkoL6dRN8nYS45kPOe4AfmbQI2SuMcGapZnY=
X-Google-Smtp-Source: AGHT+IFh0Cuv9/HfcvnF4zuwr0S46WRrJc62S0qKB/X9mLPdDDoNco2zDj4DDugU5E//exJwUKsY7g==
X-Received: by 2002:a2e:bd02:0:b0:2ff:5630:b9a4 with SMTP id 38308e7fff4ca-2ff60711fe3mr60427691fa.38.1731981495555;
        Mon, 18 Nov 2024 17:58:15 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff69851184sm10527051fa.15.2024.11.18.17.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 17:58:14 -0800 (PST)
Date: Tue, 19 Nov 2024 03:58:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v2 2/7] clk: qcom: rpmh: Add support for SM8750 rpmh
 clocks
Message-ID: <lyqiwzahl46fy2eqaz6g4wqwik623mstbjlew5mkfqj2zp4jxz@xjnt5uh2bc3p>
References: <20241112002807.2804021-1-quic_molvera@quicinc.com>
 <20241112002807.2804021-3-quic_molvera@quicinc.com>
 <5pgwerxhqhyr2u47grqzgzvvng4rojzq4gozil7vy37bew5pqj@wt676vfjs7bg>
 <8d3c2efd-b6c3-4b01-ae01-78460f4e9f26@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d3c2efd-b6c3-4b01-ae01-78460f4e9f26@quicinc.com>

On Mon, Nov 18, 2024 at 10:53:16AM -0800, Melody Olvera wrote:
> On 11/15/2024 7:31 AM, Dmitry Baryshkov wrote:
> > On Mon, Nov 11, 2024 at 04:28:02PM -0800, Melody Olvera wrote:
> > > From: Taniya Das <quic_tdas@quicinc.com>

[...]

> > > @@ -894,6 +919,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
> > >   	{ .compatible = "qcom,sa8775p-rpmh-clk", .data = &clk_rpmh_sa8775p},
> > >   	{ .compatible = "qcom,sar2130p-rpmh-clk", .data = &clk_rpmh_sar2130p},
> > >   	{ .compatible = "qcom,sc7180-rpmh-clk", .data = &clk_rpmh_sc7180},
> > > +	{ .compatible = "qcom,sc7280-rpmh-clk", .data = &clk_rpmh_sc7280},
> > >   	{ .compatible = "qcom,sc8180x-rpmh-clk", .data = &clk_rpmh_sc8180x},
> > >   	{ .compatible = "qcom,sc8280xp-rpmh-clk", .data = &clk_rpmh_sc8280xp},
> > >   	{ .compatible = "qcom,sdm845-rpmh-clk", .data = &clk_rpmh_sdm845},
> > > @@ -909,7 +935,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
> > >   	{ .compatible = "qcom,sm8450-rpmh-clk", .data = &clk_rpmh_sm8450},
> > >   	{ .compatible = "qcom,sm8550-rpmh-clk", .data = &clk_rpmh_sm8550},
> > >   	{ .compatible = "qcom,sm8650-rpmh-clk", .data = &clk_rpmh_sm8650},
> > > -	{ .compatible = "qcom,sc7280-rpmh-clk", .data = &clk_rpmh_sc7280},
> > Please don't mix fixes and actual code. I'd suggest splitting sc7280
> > move to the separate commit.
> 
> Bryan O'Donoghue requested we sort these as part of this patch. I don't feel
> strongly either way,
> but clear guidance here would be appreciated.

I don't see v1 of this patch on the linux-arm-msm list (hint: use b4
tool to send patches), so I can not comment on what Bryan ment. But I'd
definitely say, moving of the sc7280 entry is a _separate_ commit.

> 
> Thanks,
> Melody
> 
> > 
> > > +	{ .compatible = "qcom,sm8750-rpmh-clk", .data = &clk_rpmh_sm8750},
> > >   	{ .compatible = "qcom,x1e80100-rpmh-clk", .data = &clk_rpmh_x1e80100},
> > >   	{ }
> > >   };
> > > -- 
> > > 2.46.1
> > > 
> 

-- 
With best wishes
Dmitry

