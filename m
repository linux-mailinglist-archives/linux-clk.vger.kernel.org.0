Return-Path: <linux-clk+bounces-9927-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A79F893A019
	for <lists+linux-clk@lfdr.de>; Tue, 23 Jul 2024 13:40:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D73541C21E05
	for <lists+linux-clk@lfdr.de>; Tue, 23 Jul 2024 11:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A48781514F8;
	Tue, 23 Jul 2024 11:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mkLk4Mfp"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75FD1509BC
	for <linux-clk@vger.kernel.org>; Tue, 23 Jul 2024 11:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721734836; cv=none; b=mPys93b8adlJvWlGIGzKumpKJYEwsedHft/YXLFS9Su0TwjzFWVozYUEijwYcrXs7oyiWYpg3VOoLvwi+iEGLYmaJXjtqE2J73lQ0nsh9Gr0T8w5Qf5JHGBIXYgT7yBzoazaCODJ1x/uxK8EfIz9ulbSMHr5V/GF8FIgLXJDWAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721734836; c=relaxed/simple;
	bh=W7OW3Ejgfp7G5j4icOUna0C6UGhzfYE5ZoNeOw3JMyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PL/FFplKqqqqCed+SevhWbAFP9Rwu9AnlJw5BHhC2aCIBfpKxT9wmyUf0Y64iJEkeXCBBmplwZWK1ok/9q4cIfcZhOFoVPUtgonx9raKnhfeDjWkIJSRzE089Ly90tdUmpkKw1ASnp43gopLIDwYOAuQ5H8O412CTOCjG5wiHgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mkLk4Mfp; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52efd530a4eso4228337e87.0
        for <linux-clk@vger.kernel.org>; Tue, 23 Jul 2024 04:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721734832; x=1722339632; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hjlt0t66AG+BzODJZGyLjit24PidKbfoYtsLZ8osE8U=;
        b=mkLk4Mfpu++PmPspTzfAPROfQVTLJb4zyW8J5JDYdzz4HdmEWQEDsVJ4Uzv3e40u2l
         cIQ2YJbz6mBuxV8AFeSFUxGIYIbTfKMXjqan1uU3O+O8KRjuFKn9LJiJgmMrzFn7Umyr
         tRK0JXYvn4OKTW5olRIX4T+kKPsfPp4YW8eaYWTRO9VNKB3txk/jQHB8NN7bhnP5TVLS
         fNpNCIbbNR/qt45HwfM6hGKcMwFr69tnTqGlHjr+mQQoyiXIlscPxeTgdlvHsSfpJfqg
         5uSto9NVi9Hw+NBjdsZoAUyuJYOExnIr8QNoEoLaUOx25cZboXsrtWifnhy2aXJJyhFf
         3m0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721734832; x=1722339632;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hjlt0t66AG+BzODJZGyLjit24PidKbfoYtsLZ8osE8U=;
        b=g0hsmwVmCEzo/wRHnunQsQQvSIaiiFF0Ekl4gzcKDb5YvqDSKhSbMm6K7k3LOJBY87
         uON6zEjIeXhC/o5XsZld+WJf9aHh4lo7g1LfCpZXRJ2wd0fMrCCH0tk4g240HunHkcux
         /nJh/2bIdxlSdKPazw90psYGhiXySY8Jrv+iPbMwI39dpiaBQs3d0Lq9FpujMrVGb3nn
         Szgz6ai4JLIUXOPWqDmFDbLTyYBTecI4aZr+J/qE5OGNjfquEVCINBdOVWmL0eBhJP5P
         XGWpFu/c5JRxn6MRYdq0/JcOo3mSeZ3UgeMhhiuKCf5RaMWwRi87tzxgDgM/M8pnHSS4
         CoKg==
X-Forwarded-Encrypted: i=1; AJvYcCVqxVIGNropjx7wIjl9jyXemQywF1YPHARhVnr8ScqyvAz1lFUl/lHX754ucSEcTx35tRhzQLxrPzTp7I3jH5uRnGaUQIS1j5GM
X-Gm-Message-State: AOJu0Yzj2EOtfnlcBAQ/GhdvNbG/E40//dXbXai68CbBU//nAu2yHJnE
	CeNVLy9dwpwATo6sbNfVsSO8CJ0FFSs6TftVc71rmSFNdr6xfk6y2JbHmVyD1kw=
X-Google-Smtp-Source: AGHT+IEbGSdRnrn1tMqSaQIsvU2xtF9ZvhQfnBkvrzoX6ZyDx0qPmdCjK7nDuJdNYROSEalcudqrEQ==
X-Received: by 2002:a05:6512:b84:b0:52c:d645:eda7 with SMTP id 2adb3069b0e04-52fc4046b22mr2098202e87.18.1721734831905;
        Tue, 23 Jul 2024 04:40:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52f0212c743sm881109e87.26.2024.07.23.04.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 04:40:31 -0700 (PDT)
Date: Tue, 23 Jul 2024 14:40:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	gregkh@linuxfoundation.org, konrad.dybcio@linaro.org, djakov@kernel.org, 
	quic_wcheng@quicinc.com, quic_kathirav@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 4/5] clk: qcom: ipq5332: Use icc-clk for enabling NoC
 related clocks
Message-ID: <tg6wzvgiv67gpf6cc3wwubrj7hmpj3tdzsxtkce5shwjhbw5lx@kxa3umil5q5g>
References: <20240723090304.336428-1-quic_varada@quicinc.com>
 <20240723090304.336428-5-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240723090304.336428-5-quic_varada@quicinc.com>

On Tue, Jul 23, 2024 at 02:33:03PM GMT, Varadarajan Narayanan wrote:
> Use the icc-clk framework to enable few clocks to be able to
> create paths and use the peripherals connected on those NoCs.
> 
> Remove CLK_IGNORE_UNUSED from gpll4_main as all consumers have
> been identified.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v4: Remove CLK_IGNORE_UNUSED from gpll4_main
> 
> v3: Not taking Reviewed-by: Konrad as NAK-ed by Dmitry
>     Remove CLK_IGNORE_UNUSED -> CLK_IS_CRITICAL change and fix
>     that in a separate patch
> ---
>  drivers/clk/qcom/gcc-ipq5332.c | 35 +++++++++++++++++++++++-----------
>  1 file changed, 24 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

