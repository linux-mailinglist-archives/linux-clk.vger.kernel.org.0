Return-Path: <linux-clk+bounces-8753-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCDA91A83A
	for <lists+linux-clk@lfdr.de>; Thu, 27 Jun 2024 15:46:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 696CB2851FE
	for <lists+linux-clk@lfdr.de>; Thu, 27 Jun 2024 13:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F412194C6E;
	Thu, 27 Jun 2024 13:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="je3EDbWl"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39B5194AC2
	for <linux-clk@vger.kernel.org>; Thu, 27 Jun 2024 13:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719495972; cv=none; b=Xoaiki8px4pPEdtuifpOC52ZqxyhOvRFjL78sfsuRdxEWugw29semwzNXzYojqMwpFwwSYtqT4yEobC7fXD+7wKjd+0Z9iaqHejf8OFleGLGsxvD8QMVx2m9PAJeLk+X/d3aAx17aqS3mQvYWuZs5NWuwNbcrL4Pyb98Ca5Sldg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719495972; c=relaxed/simple;
	bh=2Kdx66VoPWMlHJgEoW4o5IGRITYWvH/e/du9/hA5j2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DKx5r9cGPZhs3zmY28Ajuyl1NiMIwiO/Z/qXynyoECjDsXXTId/7y4LyVNnwwt+bS79bfsPb6KSJI1theACpvOYynwa4rFYfMVqyJVvBg/kWOC/yeTOBuV9FD4ggqtwtMHG6J7OhOXSNjjEKK5nQouJGbcjS3k0XLxuDib735Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=je3EDbWl; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52db11b1d31so3000743e87.0
        for <linux-clk@vger.kernel.org>; Thu, 27 Jun 2024 06:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719495968; x=1720100768; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M5RCMjEX5v8mikaMEJSdT6otjYc5ebzDVWRoxGoSvA0=;
        b=je3EDbWlZ7sAaheiVi/6IUiubpZYyvc/0q5yoEgwO385Sg9Lr5GMCK7xuPqQrorOrL
         E9p4g91r5nx3EK7P0YS/+0WtxP+dYcsZ5K9jDEZqSoIJDfQMSRBVEFVggJHSxGBUW21i
         kmEvEsBCz6MHl1/nWLyjW6rAlSfqA0ONF+iFSru/nNKssBJNtftCDDiDcTQWcexk5+K1
         gKvZrW8wT1Gy1Pfb0ksYKOR1Slu+GOdf66GPlRcXtd6tcrLdTAuMhM01Qt75FaeIuoJR
         Vd/9itAmwd3X2YzjW/gGmuXQJLexivIGOFaeLAUNZogjhTyc/vBiZXK1bcSUk2x8jW/5
         zBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719495968; x=1720100768;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M5RCMjEX5v8mikaMEJSdT6otjYc5ebzDVWRoxGoSvA0=;
        b=mLf5O+rsg6E2luTzFViA1Qgsz/zU9ynui/pDIDayyQYtw3kXe+jxoAbSRx7SPEu/7g
         xvy4KskVxQ6BDm0dDYOIquvZUOtY8Uf8t4+XL1DaTMqg1EZ9+ta9qVVgulNPT05QR/Qe
         0roeqAHkkY5JdE+8ejAE9DUpSlK3ywlAV3q+N3OaMRVza1+SBJXJQVWQJFtHxk+ms29A
         ygN5W3UPWuHNPtwqqSTvB/XhTPF3+5dFRi7/t974ouIW0rwnd01QcyxoFueqwuYqv/aJ
         z5RyXKIDVFFlsHDp9D7VuCrbTuG7T4oJQ3FLDLha26jHYCUFqaAvywF7VXmwuKY5XnF/
         33Mw==
X-Forwarded-Encrypted: i=1; AJvYcCWxlEbIcq+RdVBOM3ZhQpLcgZL78F0kmYAgP/ln5H9QD+RiuLGFHMcM+4eZuIivVF+EriI/zbjGZlz2X4y/GlKe4qVnMycgCk0Y
X-Gm-Message-State: AOJu0YxoZkcVRtlJOcvl/p6UYvuh/1xuBr/LuAATRxG+6GIoDJu3Fcme
	eRzUm2PWHfb6RE4UNZ3ESkBQGFkWByBFtbaaZvu2X2djth8CnXj1p++EhKm6bw0=
X-Google-Smtp-Source: AGHT+IGe5oxp0Dx9Nj4cwZ6f8A59igVAt7K+/Kc8kmItxvM53k2mxQ7qIZc0knVvGwoBtmH8Nd0srg==
X-Received: by 2002:a05:6512:acf:b0:52c:e28f:4da2 with SMTP id 2adb3069b0e04-52ce28f4e39mr10878543e87.43.1719495967838;
        Thu, 27 Jun 2024 06:46:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e71305be8sm202951e87.180.2024.06.27.06.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 06:46:07 -0700 (PDT)
Date: Thu, 27 Jun 2024 16:46:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	angelogioacchino.delregno@collabora.com, andersson@kernel.org, konrad.dybcio@linaro.org, 
	mturquette@baylibre.com, sboyd@kernel.org, ilia.lin@kernel.org, rafael@kernel.org, 
	viresh.kumar@linaro.org, ulf.hansson@linaro.org, quic_sibis@quicinc.com, 
	otto.pflueger@abscue.de, neil.armstrong@linaro.org, luca@z3ntu.xyz, abel.vesa@linaro.org, 
	danila@jiaxyga.com, quic_ipkumar@quicinc.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 8/9] soc: qcom: cpr3: Add IPQ9574 definitions
Message-ID: <3mzerxpsa2gj227pryu2pg5rgaoqya7y3fplvpdsq5cnffuzj3@puwzk4j2t2t5>
References: <20240626104002.420535-1-quic_varada@quicinc.com>
 <20240626104002.420535-9-quic_varada@quicinc.com>
 <txid2b47zhnuknz35xaosfctuojrnrskcjehhqmyqubuxdimqj@7q7pzxlavk6k>
 <Zn0TZiIDQ9W/ttox@hu-varada-blr.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zn0TZiIDQ9W/ttox@hu-varada-blr.qualcomm.com>

On Thu, Jun 27, 2024 at 12:53:18PM GMT, Varadarajan Narayanan wrote:
> On Wed, Jun 26, 2024 at 09:27:53PM +0300, Dmitry Baryshkov wrote:
> > On Wed, Jun 26, 2024 at 04:10:01PM GMT, Varadarajan Narayanan wrote:
> > > From: Praveenkumar I <quic_ipkumar@quicinc.com>
> > >
> > > Add thread, scaling factor, CPR descriptor defines to enable CPR
> > > on IPQ9574.
> > >
> > > Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> > > Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> > > ---
> > > v3: Fix patch author
> > >     Included below information in cover letter
> > > v2: Fix Signed-off-by order
> > > Depends:
> > > 	[1] https://lore.kernel.org/lkml/20230217-topic-cpr3h-v14-0-9fd23241493d@linaro.org/T/
> > > 	[2] https://github.com/quic-varada/cpr/commits/konrad/
> > > ---
> > >  drivers/pmdomain/qcom/cpr3.c | 137 +++++++++++++++++++++++++++++++++++
> > >  1 file changed, 137 insertions(+)
> > >
> > > diff --git a/drivers/pmdomain/qcom/cpr3.c b/drivers/pmdomain/qcom/cpr3.c
> > > index c28028be50d8..66c8a4bd9adc 100644
> > > --- a/drivers/pmdomain/qcom/cpr3.c
> > > +++ b/drivers/pmdomain/qcom/cpr3.c
> >
> > > +
> > > +static const struct cpr_desc ipq9574_cpr_desc = {
> > > +	.cpr_type = CTRL_TYPE_CPR4,
> >
> > So, is it CPR4 or CPRh?
> 
> CPR4.

Then why do you have cprh in the compatible?

> 
> > > +	.num_threads = 1,
> > > +	.apm_threshold = 850000,
> > > +	.apm_crossover = 880000,
> > > +	.apm_hysteresis = 0,
> > > +	.cpr_base_voltage = 700000,
> > > +	.cpr_max_voltage = 1100000,
> > > +	.timer_delay_us = 5000,
> > > +	.timer_cons_up = 0,
> > > +	.timer_cons_down = 0,
> > > +	.up_threshold = 2,
> > > +	.down_threshold = 2,
> > > +	.idle_clocks = 15,
> > > +	.count_mode = CPR3_CPR_CTL_COUNT_MODE_ALL_AT_ONCE_MIN,
> > > +	.count_repeat = 1,
> > > +	.gcnt_us = 1,
> > > +	.vreg_step_fixed = 12500,
> > > +	.vreg_step_up_limit = 1,
> > > +	.vreg_step_down_limit = 1,
> > > +	.vdd_settle_time_us = 34,
> > > +	.corner_settle_time_us = 6,
> > > +	.reduce_to_corner_uV = true,
> > > +	.hw_closed_loop_en = false,
> > > +	.threads = (const struct cpr_thread_desc *[]) {
> > > +		&ipq9574_thread_silver,
> >
> > If it's silver, where is gold or bronze?
> 
> Will rename this as "ipq9574_thread"
> 
> Thanks
> Varada
> 
> > > +	},
> > > +};
> > > +
> > > +static const struct cpr_acc_desc ipq9574_cpr_acc_desc = {
> > > +	.cpr_desc = &ipq9574_cpr_desc,
> > > +};
> > > +
> > >  static const int sdm630_gold_scaling_factor[][CPR3_RO_COUNT] = {
> > >  	/* Same RO factors for all fuse corners */
> > >  	{
> > > @@ -2828,6 +2964,7 @@ static void cpr_remove(struct platform_device *pdev)
> > >  }
> > >
> > >  static const struct of_device_id cpr3_match_table[] = {
> > > +	{ .compatible = "qcom,ipq9574-cprh", .data = &ipq9574_cpr_acc_desc },
> > >  	{ .compatible = "qcom,msm8998-cprh", .data = &msm8998_cpr_acc_desc },
> > >  	{ .compatible = "qcom,sdm630-cprh", .data = &sdm630_cpr_acc_desc },
> > >  	{ }
> > > --
> > > 2.34.1
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

