Return-Path: <linux-clk+bounces-8553-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A40B891465E
	for <lists+linux-clk@lfdr.de>; Mon, 24 Jun 2024 11:25:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5864F1F214E2
	for <lists+linux-clk@lfdr.de>; Mon, 24 Jun 2024 09:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02E73130AD7;
	Mon, 24 Jun 2024 09:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="je+TYd6X"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB29130A73
	for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 09:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719221150; cv=none; b=CodJJ39JwYEYNns7e58SxS0wqwi07o5EnSGV43D5jFg/jKhQD5Y12eRKa2Gb/Ei4e3rb2hhJJAjfSxeGCwFsYtCDEolRF1qV6KbeBN5f+ktpJpV42bz5L9w1NYuxOC20uPSWX8mICL5Rz96nIR6gPzt3O/VdDMStXuxqRxge86c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719221150; c=relaxed/simple;
	bh=dSpj6RVdGlwSynNTqiNA10vYR+M1oEJQAoRfZLhS/8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bv9/IvNdN9sUz8mDOCa0GpvzVV+wbKnFrDSDqzLt/EYCFnB/rICn9l4T8gJk7DjF93uhKJMwTUUo/q2ioQolfsFpq+RjBUWKeOzD+eiU4l3D+1x3xYAi3xLbTwzq9BgrtUH9clOIqZJCFiLZIo1n5t0DM3JmnwVuW4cLReB0vh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=je+TYd6X; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ec5fad1984so11907821fa.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 02:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719221147; x=1719825947; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hQ8rDTFoLXAhMjy0OhmeajbUY5vNojlhHctYKafkZN4=;
        b=je+TYd6X6Epx5TXmUdV32lnX0jOt5fSRMF9O/FPmLnbvave1b3wMtu53E31nD+hVlg
         7+J2CqD8zHqK+8+1P0cC9v2HKHqULRY/c/CB3GciWzLdnNTNPqm2zbkJVIWccD4VPngW
         1Ol+pKtCuezWsDHo8yrjaV6eRJB1OnBivHQuocM1lfn4dDN6cfqK3HNfO6n3COeqq1PW
         hoVgabNaGzu3FFKAShsArYKXsGk0xirP7sFmqlS82hbh4QrPk1/XeMtfJyRUaOvzqHdt
         UN802zOYh+P12gHpRY5NdSTjmxs0h5v8pk7VnwI93ZUYZXNlS44QoeqZu0kG1PNaqIS+
         h7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719221147; x=1719825947;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQ8rDTFoLXAhMjy0OhmeajbUY5vNojlhHctYKafkZN4=;
        b=Ht9+73eRWPpy56zftHe0+xLDpInNam0yZ8tYMtQfVhUEZnXeYAeVinrIkYzYP484zJ
         iCbGmB3nWHzoVeO4dV6IbK3sKe9VgN81cKw6wh1V0+VqLhxfYXk9pIca3EqsZu0vDBC7
         xrQBgnB2tNx5Iy/KZDwabVoN/QrASkzm7uL3BXhV4TVp480UkD4t0fc3TBpu32JXpI4q
         K380h71YWn6CYsP5Z1ZyYDCyBaf/0DYgeG8eIUupGYyilkiGUqXCG9YJWRTECx4bgjaJ
         fypb/8JhO5m88/7TD1ar/pnS2jaLYJjyNNzvajXpt+HAWxeByB3BelgXWXGenVt0cOSu
         aOiw==
X-Forwarded-Encrypted: i=1; AJvYcCUkBiIcwVPmS98m9TI7KX9NsVM0oGKEgP1Jgin+//7pixuEB9eimddHNQuhEv1akM6/XB17V3OgRhCUvqyP65tTHfnprJC45/Uw
X-Gm-Message-State: AOJu0YznmJz/W6jl4et4dMiurmFQkjw8pwb7KpgacXI3D7LKAHEbjBFQ
	5Xzv5X8gPyChWxFTlM9ZZ0Lkx93GQeDlXT3aYWm+8z1yqHm7wCEEOQSGY8O7YUE=
X-Google-Smtp-Source: AGHT+IFyYQcI0M2p6Aug3g8DCGmk6of8qUf+Yl9RI+onwe/r8cDJBAKjW1liB62k+oh2Qcw1PYwa5g==
X-Received: by 2002:a2e:7805:0:b0:2ec:5073:5814 with SMTP id 38308e7fff4ca-2ec5b2fd2f3mr32530691fa.8.1719221147588;
        Mon, 24 Jun 2024 02:25:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec5843318fsm5388401fa.91.2024.06.24.02.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 02:25:47 -0700 (PDT)
Date: Mon, 24 Jun 2024 12:25:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Taniya Das <quic_tdas@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] clk: qcom: dispcc-sm8650: Update the GDSC flags
Message-ID: <kjb6m7sr2secyalg2szb36vcxtgwiqcbuqxilxc7uxmfhkx7n2@yrmkw4tw6nng>
References: <20240624-topic-sm8650-upstream-fix-dispcc-v2-0-ddaa13f3b207@linaro.org>
 <20240624-topic-sm8650-upstream-fix-dispcc-v2-3-ddaa13f3b207@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624-topic-sm8650-upstream-fix-dispcc-v2-3-ddaa13f3b207@linaro.org>

On Mon, Jun 24, 2024 at 10:05:52AM GMT, Neil Armstrong wrote:
> Update the GDSC flags by adding missing POLL_CFG_GDSCR flag.
> 
> Fixes: 9e939f008338 ("clk: qcom: add the SM8650 Display Clock Controller driver")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/clk/qcom/dispcc-sm8650.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

