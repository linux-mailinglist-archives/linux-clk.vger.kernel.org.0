Return-Path: <linux-clk+bounces-9945-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E12D793AD13
	for <lists+linux-clk@lfdr.de>; Wed, 24 Jul 2024 09:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 181D01C21AD5
	for <lists+linux-clk@lfdr.de>; Wed, 24 Jul 2024 07:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85BD7137932;
	Wed, 24 Jul 2024 07:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wZJhcyce"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D0612EBEA
	for <linux-clk@vger.kernel.org>; Wed, 24 Jul 2024 07:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721805218; cv=none; b=PQBAdpTMGtJlqK4AWNukq+qndg5QXxmSNKmp2v0UxEsxbpOqyrxxl9edes27W4TAFc+1x/okwIPHVqr0pvUsQEyk1n0zM41hYtwQkHdbcOxMY81InaT4rZJhy9GI4zYhKYpzU/l+5kUDUoab/LvYQVOT/o0a1KnqpSAz2T5Hb7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721805218; c=relaxed/simple;
	bh=uwyZFwSs4zyRVcD6GNu+z1tt0btijTTHCaceFk9BSDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cg+1+ZYYJVj20Hkt9kPDcF831Td9zypaNIzWI4C7MZQm0NFaafYCI/ztZqY4MagsRdIBxGQ90xwv5BegTA/pGGloZHXrxzS1PqGo8WFJIIY7IsXWQu1pDfQ7LeuUAj+Eso/S+WvIE44DxIwFNHQuYbOWmZSQ4ZAg2DyYvOj7S2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wZJhcyce; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-65f7bd30546so4980747b3.1
        for <linux-clk@vger.kernel.org>; Wed, 24 Jul 2024 00:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721805215; x=1722410015; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+a1tPg3HOKKRtQ+H1Jww0GEhJ0d9bDqysfDZw/250x0=;
        b=wZJhcyceCLvqdj41AmHl6BSJWrbVGR5EJU9+lZHLvK8pAuzDotD58d3HLvX+WmCh1p
         u9M+S3zqPuG1d/5nif5pRQSuKVfkGycZQqu/m9gBGgHRjlliK1jrckAbJW7/Q+kIdNdX
         G/nqzIraJJ9WZpEo2huEdxucw/EPsFDQCA1b3Dw4qOcn4+PdBUWp9gcP0/El6t24vl9h
         ByDU6qChUcpFh6eBjRMOF6IWuov6xdswoXsf13JqNI3fl+PIIOP+AYebfAREeOLFRJBp
         tWxdYz/g/CdDxJxw5n8VNVXKlKdAnD7YHT55+atYQgepW8977MGPR/2/YJf4N2wvldc/
         y5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721805215; x=1722410015;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+a1tPg3HOKKRtQ+H1Jww0GEhJ0d9bDqysfDZw/250x0=;
        b=GPndCt0idVdyB8/6SzDrdz0poRqb53Cit5G/CMPwIxUL+YIoleQ522UrVHyWyeNhYF
         hCA5t3m/XGlX8wycS0MqINoECggm5wvNfEdctc6Y5mEJB0C5d049VrriL8+q0r44EZne
         IvPaMXawhwjXw7mj5FfwF37OwnTEqRDWrE6v8ilQPSIbrqnq1T6Hz4t5lFUS0Sb85A6V
         DnnOOgQJu4e6BYWsYx0PMo4X19WiltBmR6nnu6FxahnUq8oCp0NzcCizl6J4TF1D6xcX
         BuxSzMGLEWd8QX+qIgBmco+S212Yr5jKjIBFXBAmtMZWt0r6Zjdg2Fn1qQtHzPy1pKhj
         L0ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSTpzwJL5j71acH8rR1M/hxHA3e8uWgDOEVotLnBlljLv4qzwO32LuNc35nnDLnm4vLkr73MR149uKzG3g5MARpMwvaubDcxuF
X-Gm-Message-State: AOJu0YxYRoV30hy0NfSqUaEV5z/Mba+QofcuJhLIKnzQ0iD5GGzIqJ4f
	u19qjqwj3rnBn8lnJoSiwpAXAqZ5oS+NTi4jRVNE6zXbU489kBaE1gcf/2bZ5UuhmD1BTOlRBYn
	70tTkxCWb42qfOBjT6in21kAJSGIKiLl+cWYSmQ==
X-Google-Smtp-Source: AGHT+IEPG1bHq5OcfqednTsQJ647G2YbNdaFkAv2JHjQWuG+H9RUFpS0NlqBBVg0Uc/Z02sFUMoTU5E5IsQ01hU01b4=
X-Received: by 2002:a05:690c:2e0f:b0:65f:96e9:42f4 with SMTP id
 00721157ae682-672bdaa5cd0mr5792037b3.15.1721805214701; Wed, 24 Jul 2024
 00:13:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240703091651.2820236-1-quic_varada@quicinc.com>
 <20240703091651.2820236-6-quic_varada@quicinc.com> <57dadb35-5dde-4127-87aa-962613730336@linaro.org>
 <ZqCCpf1FwLWulSgr@hu-varada-blr.qualcomm.com>
In-Reply-To: <ZqCCpf1FwLWulSgr@hu-varada-blr.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 24 Jul 2024 10:13:23 +0300
Message-ID: <CAA8EJpq5XLQ8WXVxr+3=DZ58URpfqM2phcWVhukpmc_HnRsRfQ@mail.gmail.com>
Subject: Re: [PATCH v4 05/10] pmdomain: qcom: rpmpd: Add IPQ9574 power domains
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, vireshk@kernel.org, nm@ti.com, 
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	angelogioacchino.delregno@collabora.com, andersson@kernel.org, 
	mturquette@baylibre.com, ilia.lin@kernel.org, rafael@kernel.org, 
	ulf.hansson@linaro.org, quic_sibis@quicinc.com, quic_rjendra@quicinc.com, 
	quic_rohiagar@quicinc.com, abel.vesa@linaro.org, otto.pflueger@abscue.de, 
	danila@jiaxyga.com, quic_ipkumar@quicinc.com, luca@z3ntu.xyz, 
	stephan.gerhold@kernkonzept.com, nks@flawful.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Jul 2024 at 07:27, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> On Tue, Jul 09, 2024 at 11:52:19AM +0200, Konrad Dybcio wrote:
> > On 3.07.2024 11:16 AM, Varadarajan Narayanan wrote:
> > > From: Praveenkumar I <quic_ipkumar@quicinc.com>
> > >
> > > Add the APC power domain definitions used in IPQ9574.
> > >
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> > > Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> > > ---
> > > v4: Add Reviewed-by: Dmitry Baryshkov
> > > v3: Fix patch author
> > > v2: Fix Signed-off-by order
> > > ---
> > >  drivers/pmdomain/qcom/rpmpd.c | 19 +++++++++++++++++++
> > >  1 file changed, 19 insertions(+)
> > >
> > > diff --git a/drivers/pmdomain/qcom/rpmpd.c b/drivers/pmdomain/qcom/rpmpd.c
> > > index 5e6280b4cf70..947d6a9c3897 100644
> > > --- a/drivers/pmdomain/qcom/rpmpd.c
> > > +++ b/drivers/pmdomain/qcom/rpmpd.c
> > > @@ -38,6 +38,7 @@ static struct qcom_smd_rpm *rpmpd_smd_rpm;
> > >  #define KEY_FLOOR_CORNER   0x636676   /* vfc */
> > >  #define KEY_FLOOR_LEVEL            0x6c6676   /* vfl */
> > >  #define KEY_LEVEL          0x6c766c76 /* vlvl */
> > > +#define RPM_KEY_UV         0x00007675 /* "uv" */
> >
> > The "uv" key is handled in qcom_smd-regulator.c.. I'm assuming on this
> > platform, it accepts level idx instead of the regulator properties
> > and this is intentional?
>
> IPQ9574 RPM accepts regulator properties (uv) and not the level idx.
> Hence added the "uv" key in the rpmpd.c

Does it expect the actual voltage? If so, then it is not a power
domain and it should be modelled as a regulator instead.


-- 
With best wishes
Dmitry

