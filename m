Return-Path: <linux-clk+bounces-8743-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAA991A499
	for <lists+linux-clk@lfdr.de>; Thu, 27 Jun 2024 13:08:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4A6C28252D
	for <lists+linux-clk@lfdr.de>; Thu, 27 Jun 2024 11:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 372B9145B13;
	Thu, 27 Jun 2024 11:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SniUivUt"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5729C13FD72
	for <linux-clk@vger.kernel.org>; Thu, 27 Jun 2024 11:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719486504; cv=none; b=NQhIqkStI7yzp8ssJ/YReC3uq8ukl9+Ljf7b3sqxyGKAFQSDEafLy3AjCbUkzEqgVLOkxwFjXfdWZMsriEDwSxci6l2lV68jvHRfB2llnLhDefloNodRx22vK2JW+YNGjG/DLRydhqtQYbzQNBNm643UO7ppoOqXI8XQEFdvu/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719486504; c=relaxed/simple;
	bh=d2qDTrmbKUsr+Rx4meYIaCNy4rxF3QmIbu+x1J2u7qI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SDcIak/6CXlZiyOmyq65TJ3HTbctz217uwKfKOuu6/xRNlF34mfL0HbCwQ4UbOuYRw8qeKYYWaXEOgoFRZnORwwfu0oIVK2AEgPjMqeKS0owqiazqf6WzWU9n8nR4ECWWb+KGf+ZF2MrUG3uAy1OQ7KSwsTGJOllmyw/AtXrgOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SniUivUt; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ec59193468so13603141fa.1
        for <linux-clk@vger.kernel.org>; Thu, 27 Jun 2024 04:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719486500; x=1720091300; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LDIZ8jZNwgR+9ADgTc91LrJE3ciGgVcooiq9Tz2ImAg=;
        b=SniUivUtEHA81Og4mGlKsZA9+IR1j9Q772AfYEmvjB8/n3PbkqmwkGqBKql7FvyehN
         Cy0R4bAmDLQSO69VBDni1T0y28rYVwz9oLz9Xyq+Ra9RCg/eaECGCDo5enyJMCXwuIqv
         7M1/uImXvC4aTDG8O9JZ5KyYncFyiQf8nQcWSnRRYJ0/suhRVdDHto+xPJnP0T6993Ze
         tlOW/+bzDImw4xYOUFeDJ1hkNeLK+e5qYboUGWzVCk46dYHJLkufJhWtZaGJXJgC/E37
         iH3cFaCcL7d7R5oyP25IzfTmtKEUAE6OAko2YNSDu51BM41n8coFf9UWGJ3gU3+VSIj8
         HjDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719486500; x=1720091300;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LDIZ8jZNwgR+9ADgTc91LrJE3ciGgVcooiq9Tz2ImAg=;
        b=AgRx+5d3N7WHZrkpcME67r77ZDkmcOUT3t95lVZmho0ftfmzJERQSMg1nvdqAX/x7h
         lG1111StYD3yCKZW+VVVxdgI4THQADK6lp1GZlOnpt/5K6LoUu96E/MoKAJSeYkWcJmW
         KeGk7au+r3iKl9jsq1b6wH0l4P086Q1mgtRNcL3a7wP1l3x6xsR88h3/xxxCo0LjFve4
         vY/qqsEWPo44uHk/EMoMLiKKQ4pkDAX3uAc9fEvkfdwqU3NUqD04AUCGA8fyQ7RKL2W7
         yWvvJ+DfrkRIUk9IItAqhczYSIprfXWjaZzjtaS/wyzQF3dhuTWIHoeKJV9XFdGA+sK9
         209A==
X-Forwarded-Encrypted: i=1; AJvYcCVEWIjXxTWlBPAtk8IujL2gg68fMl652dAmJhWvVJ3Ei4DWolkLxvJ+82LASsjoDiKz6y2meooeg/QaiXiRw2n22omvO8Kt0Vtc
X-Gm-Message-State: AOJu0YxG4ydsd7UTtghpRYLpyr+OgW3DmAZztYTg1CrcWKeP5JCN2qwL
	vqFwGK3M8HC8p5wMWImtEJsHGIslx7vigCunR7N19aPtCtoAVAgetEuZ3a8ePR8=
X-Google-Smtp-Source: AGHT+IHwZv+z93couUdcfrBSYJbEjitjwBpwPIxQ5GGLRkyBz5sbtXa96C/INZ7K24jqhX2BnvOu1Q==
X-Received: by 2002:a2e:9e8f:0:b0:2ec:514f:89af with SMTP id 38308e7fff4ca-2ee4803f58bmr7341271fa.6.1719486500528;
        Thu, 27 Jun 2024 04:08:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee4a4bef67sm2157101fa.122.2024.06.27.04.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 04:08:20 -0700 (PDT)
Date: Thu, 27 Jun 2024 14:08:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Gokul Sriram P <quic_gokulsri@quicinc.com>
Cc: sboyd@kernel.org, andersson@kernel.org, bjorn.andersson@linaro.org, 
	david.brown@linaro.org, devicetree@vger.kernel.org, jassisinghbrar@gmail.com, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com, 
	robh@kernel.org, sricharan@codeaurora.org, gokulsri@codeaurora.org
Subject: Re: [PATCH v9 1/8] remoteproc: qcom: Add PRNG proxy clock
Message-ID: <dyh3vxosjjfztgwgpb5jtoqhzfyf5jyfndaujqoslepzvbet4o@kx6xaotzazcs>
References: <20240621114659.2958170-1-quic_gokulsri@quicinc.com>
 <20240621114659.2958170-2-quic_gokulsri@quicinc.com>
 <chi3pzh5ss3mivnhs3qeoen5hsecfcgzaj6qnrgxantvinrri2@bxsbmpufuqpe>
 <73cb638e-4982-49a2-ba79-0e78402b59ad@quicinc.com>
 <ga5kczcyn3dqoky4525c74rr7dct5uizun2smvyx3p3u6z6vtm@5vshoozpttod>
 <2617940e-72ad-4214-be26-7a5b15374609@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2617940e-72ad-4214-be26-7a5b15374609@quicinc.com>

On Thu, Jun 27, 2024 at 03:31:01PM GMT, Gokul Sriram P wrote:
> 
> On 6/27/2024 12:47 AM, Dmitry Baryshkov wrote:
> > On Tue, Jun 25, 2024 at 11:03:30AM GMT, Gokul Sriram P wrote:
> > > On 6/22/2024 2:38 AM, Dmitry Baryshkov wrote:
> > > > On Fri, Jun 21, 2024 at 05:16:52PM GMT, Gokul Sriram Palanisamy wrote:
> > > > > PRNG clock is needed by the secure PIL, support for the same
> > > > > is added in subsequent patches.
> > > > Which 'same'?
> > > > What is 'secure PIL'?
> > >  � will elaborate in the updated version.
> > >  � To answer your question, secure PIL is signed PIL image which only
> > > TrustZone can authenticate and load.
> > Fine. So, the current driver can not load WCSS firmware on IPQ8074, is
> > that correct? Or was there some kind of firmware interface change? The
> > driver was added in 2018, so I can only hope that at that point it
> > worked. Could you please explain, what happened?
> The existing wcss driver can load unsigned PIL images without the
> involvement of TrustZone. That works even now.
> With the current change, we are trying to add signed PIL as an option based
> on "wcss->need_mem_protection" if set. For signed PIL alone, we send a PAS
> request to TrustZone to authenticate and load.

I see that you are enabling it unconditionally for IPQ8074. How is it
going to work?

> I also just noticed that Bjorn had suggested to submit a new driver for the
> PAS based IPQ WCSS instead of overloading this driver. Will also address
> that and post a new driver in updated revision.
> 
> Regards,
> Gokul
> > > > > Signed-off-by: Nikhil Prakash V <quic_nprakash@quicinc.com>
> > > > > Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
> > > > > Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> > > > > ---
> > > > >    drivers/remoteproc/qcom_q6v5_wcss.c | 65 +++++++++++++++++++++--------
> > > > >    1 file changed, 47 insertions(+), 18 deletions(-)
> > 

-- 
With best wishes
Dmitry

