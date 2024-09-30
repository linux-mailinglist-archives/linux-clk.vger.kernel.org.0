Return-Path: <linux-clk+bounces-12535-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BB9989B65
	for <lists+linux-clk@lfdr.de>; Mon, 30 Sep 2024 09:26:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9670BB20E4B
	for <lists+linux-clk@lfdr.de>; Mon, 30 Sep 2024 07:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D42A155A52;
	Mon, 30 Sep 2024 07:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xqCU1Qmc"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFDC1547DE
	for <linux-clk@vger.kernel.org>; Mon, 30 Sep 2024 07:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727681164; cv=none; b=ntV2sRl74iPU9cNmqiRbzYxGcWs5yHfzOFSrXhNvi3Y5uKuXxnnlUIWXA9c9FnGXzQoXjA1kuGqJwCc5beLKNgbfUyWAgmNypOO1l+pBfvNnkmnMC7v1wo32d3KIs10eDQnpSV5z9QZhwdkCDaSH6XjyEe9Y/f2bfKEnxcJgtss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727681164; c=relaxed/simple;
	bh=WKBH9RpmycF/rFa4JiAICMu9B7e2tmlZaMSJHg1A+e4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZHfHsoy8XF9syxG72RF5mddKQxgPpJ9ScpsveS734jOajlIz/0Vs2ap6p6BYUtcJaDpjt0b/2t2lhyp/LAY0tSJMRdZyiPOv6wlgTrvHCA6Ga0+nBRmFHdeh2xQmH5YQabCVwZUDMS/pVvrDjiEyuCivlLv9MtBSyXA6Z0BYF2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xqCU1Qmc; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2e109539aedso867351a91.0
        for <linux-clk@vger.kernel.org>; Mon, 30 Sep 2024 00:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727681162; x=1728285962; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XiYNvrHNwoSiNsSeCUdLp/SxlfKq9ylhEZCoyBEobJ4=;
        b=xqCU1QmcgBOSV4c0u0l+3ZcdyL9gFXADsN8+7UeQOwzChcKof39ZLn0WhZbhQqHI0W
         G3c5CETJl+sZEfblZbEKYT/8DRXdyalsQJ4SifcSNwl9A8wYtvjIY4CtZs+oZC8pGPxo
         xSNit5M/LSX9vhcz4nfMTZuupgXshbNepzcelpGa1dWPr5UcU7oGxGfbHxt64ysgYcfv
         lpJwblWXik9yIl04arPlACDiIXQrgCvv9QGFQASj6y91av+iBpVhFgR9AJchVdzQ/5MN
         WtVBUt7KcG0aVXb/81G9oRoSoIIXQkMEciZSdEfkzc8f9mL4BgAxP2RBZlyVgq24KHdH
         SBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727681162; x=1728285962;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XiYNvrHNwoSiNsSeCUdLp/SxlfKq9ylhEZCoyBEobJ4=;
        b=XmCgr38sEZwUqR28qpumxsTVFXpnBH/8CA4dY2cIzVkRJe082PEvJ5/srnRH466uOB
         pQOe+xJ5MQSFT+HZ5janCMIy0Ex6+dixT1lzzxDnClir98nEJ6KICNmKNfkiSCCeoKmH
         tPQ/8xDvXQzq9IduFa3tyMmYT7JIX1cXxxi7EpCiS0Zfg/zQ0amQ8GkzuTuqexfUHnCc
         B6lHRDzxUVGBzyEkXot5OZPmC5Nxvqs0KUwNE+tCVcslvBHmp27ptq+9faapez8qAa9E
         VFNva5nZicVgo2NrEBPPwarDZW9GL/8s0r+LER3I9qyht22hSehOciXzGGOk0ULAMTHI
         q5Ng==
X-Forwarded-Encrypted: i=1; AJvYcCVvNlo6s8v6aBwxqADmbEWa1lLCKkB9ad+MujWw7ZTK+JYsNZk6yVtpcHTyAbWu1l9Yu9MbYPnyfdI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxWr6TH6APpi3lRKOGsAEXbLiHIgVC5RYi00xxK1DvEaI+beZq
	wXyyieD39CTAZdlbvreF3ZG0zM2bMVyge50VF+pvYCyQIyGRRJ/zgXogzI3sYQ==
X-Google-Smtp-Source: AGHT+IH0ZhL7ulk9Zz/JIeZ0eAXcKPWm10c/BmyJgbeW6CC9X3LbTa4pQ4KY597t8qxTugpYl6gXJw==
X-Received: by 2002:a17:90a:3486:b0:2d8:89ad:a67e with SMTP id 98e67ed59e1d1-2e0b88903famr14733476a91.1.1727681162073;
        Mon, 30 Sep 2024 00:26:02 -0700 (PDT)
Received: from thinkpad ([36.255.17.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e08c35fed5sm6239192a91.0.2024.09.30.00.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 00:26:01 -0700 (PDT)
Date: Mon, 30 Sep 2024 09:25:53 +0200
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: Johan Hovold <johan@kernel.org>, vkoul@kernel.org, kishon@kernel.org,
	robh@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com,
	sboyd@kernel.org, abel.vesa@linaro.org, quic_msarkar@quicinc.com,
	quic_devipriy@quicinc.com, dmitry.baryshkov@linaro.org,
	kw@linux.com, lpieralisi@kernel.org, neil.armstrong@linaro.org,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 5/6] PCI: qcom: Add support for X1E80100 SoC
Message-ID: <20240930072553.n2tj5jjtltowswbf@thinkpad>
References: <20240924101444.3933828-1-quic_qianyu@quicinc.com>
 <20240924101444.3933828-6-quic_qianyu@quicinc.com>
 <20240924135021.ybpyoahlpuvedma5@thinkpad>
 <ZvLX_wkh7_y7sjPZ@hovoldconsulting.com>
 <4368503f-fb33-4e6a-bef4-517e2b959400@quicinc.com>
 <20240925080724.vgkgmnqc44aoiarv@thinkpad>
 <1419ba07-5163-4126-8869-2213eea6c492@quicinc.com>
 <fb40afe3-eb27-4136-8942-26a40fb395a7@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb40afe3-eb27-4136-8942-26a40fb395a7@quicinc.com>

On Thu, Sep 26, 2024 at 01:19:18PM +0800, Qiang Yu wrote:
> 
> On 9/26/2024 11:28 AM, Qiang Yu wrote:
> > 
> > On 9/25/2024 4:07 PM, Manivannan Sadhasivam wrote:
> > > On Wed, Sep 25, 2024 at 11:47:02AM +0800, Qiang Yu wrote:
> > > > On 9/24/2024 11:17 PM, Johan Hovold wrote:
> > > > > On Tue, Sep 24, 2024 at 03:50:21PM +0200, Manivannan Sadhasivam wrote:
> > > > > > On Tue, Sep 24, 2024 at 03:14:43AM -0700, Qiang Yu wrote:
> > > > > > > X1E80100 has PCIe ports that support up to Gen4 x8
> > > > > > > based on hardware IP
> > > > > > > version 1.38.0.
> > > > > > > 
> > > > > > > Currently the ops_1_9_0 which is being used for
> > > > > > > X1E80100 has config_sid
> > > > > > > callback to config BDF to SID table. However, this callback is not
> > > > > > > required for X1E80100 because it has smmuv3 support
> > > > > > > and BDF to SID table
> > > > > > > will be not present.
> > > > > > > 
> > > > > > > Hence add support for X1E80100 by introducing a new
> > > > > > > ops and cfg structures
> > > > > > > that don't require the config_sid callback. This
> > > > > > > could be reused by the
> > > > > > > future platforms based on SMMUv3.
> > > > > > > 
> > > > > > Oops... I completely overlooked that you are not adding
> > > > > > the SoC support but
> > > > > > fixing the existing one :( Sorry for suggesting a commit
> > > > > > message that changed
> > > > > > the context.
> > > > > > 
> > > > > > For this, you can have something like:
> > > > > > 
> > > > > > "PCI: qcom: Fix the ops for X1E80100 SoC
> > > > > > 
> > > > > > X1E80100 SoC is based on SMMUv3, hence it doesn't need
> > > > > > the BDF2SID mapping
> > > > > > present in the existing cfg_1_9_0 ops. This is fixed by
> > > > > > introducing new ops
> > > > > > 'ops_1_38_0' and cfg 'cfg_1_38_0' structures. These are
> > > > > > exactly same as the
> > > > > > 1_9_0 ones, but they don't have the 'config_sid()'
> > > > > > callback that handles the
> > > > > > BDF2SID mapping in the hardware. These new structures
> > > > > > could also be used by the
> > > > > > future SoCs making use of SMMUv3."
> > > > > Don't we need something like this for sc8280xp and other
> > > > > platforms using
> > > > > SMMUv3 as well?
> > > >  From what I know, sc8280xp and other qcom platforms are not
> > > > using SMMUv3.
> > > sc8280xp indeed has SMMUv3 for PCIe, but I'm not sure how it is
> > > configured. So
> > > not completely sure whether we can avoid the mapping table or not.
> > > 
> > > Qiang, please check with the hw team and let us know.
> > Sure, will update once I get any response from hw team.
> HW team confirmed sc8280xp uses smmv3 for PCIe and doesn't support BDF2SID
> map.
> 
> Besides, Abel once got confirmation from Joe that we also need to disable
> L0s for X1E80100. So can we use cfg_sc8280xp for both X1E80100 and SC8280XP
> and change its ops to ops_1_38_0?
> 

Sounds good. But, OPS naming should be based on the baseline version i.e., it
should be based on the IP version of SC8280XP and reused by X1E80100. Not the
other way around.

- Mani

> Thanks,
> Qiang
> > 
> > Thanks,
> > Qiang
> > > 
> > > - Mani
> > > 

-- 
மணிவண்ணன் சதாசிவம்

