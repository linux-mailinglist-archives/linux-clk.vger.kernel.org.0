Return-Path: <linux-clk+bounces-10228-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B56DD942A4B
	for <lists+linux-clk@lfdr.de>; Wed, 31 Jul 2024 11:22:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E750E1C23FC0
	for <lists+linux-clk@lfdr.de>; Wed, 31 Jul 2024 09:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 546ED1AC421;
	Wed, 31 Jul 2024 09:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yAGAlv+v"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDDC1AB53A
	for <linux-clk@vger.kernel.org>; Wed, 31 Jul 2024 09:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722417683; cv=none; b=MwN1lYX8GCBXfqTyGyrDguQJxa49kXJksJqh/8T1kT4wd74xlhqC9I0x3+LhitVxUZjHW8TjIUE2L7+xo8D7NCmliTvoW4xNLxdLXuzlNGmG1tez7uuFJI9ok5U80f5BYN6dsrv6tlPgAe9vqVK59fN2dD52DhAepR5uk4D47VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722417683; c=relaxed/simple;
	bh=xj0mCD2QgttQlP9ZbqYxOvfeB8gbnbRMMgq5AJzeUXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TtJ6ncj6BlTVEFHH/+Mld1IW4E131waxH62zYB4+qTWhpy4k4dzwrseLh+XuffpMssIistk/G9EnG35yXXhfs5EM+8odgW8uAGqJwRwRn66R577aXiXovIF6vOndlLJOKImlQyHnNXAHOSq6Sbo0aAU0RPJpalZZvQ8AB7IYpuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yAGAlv+v; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-65fe1239f12so33056997b3.0
        for <linux-clk@vger.kernel.org>; Wed, 31 Jul 2024 02:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722417680; x=1723022480; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DnUjBn+/d/YDX4qkQNOkPARCeLeNJpUfQHIds6ii0e8=;
        b=yAGAlv+vdeFhsJ7dOOMvx6PMFyQhT9eVuvSa56gxjBSLkZZ4AbmGrLdUM69LxhW2IW
         DX6gtVaSfPrBrIE4XxI0OfK3DNxlHy4EPHLGEpqQ27X7zz2g3Z/Z4y7mVaO9m3kajzWM
         qkta2pU2IgOw+18VQua2AKtnC+CmIoYIYbItlxRc82Xtwgmur8WJajchZoAq8enWBtID
         uqB4wFaG4xtiWnDm0L8KNPmo76Gmyo98JfsdiU8mhqya/x7ZQPOL2jltxGgkkhZb6vw5
         2vkdlzh/YuyoTDh5YeHFOmt4SawejplqwsYK/hk0cSHuWLMDf1KH8vhUEL7DdbG5Y7Vk
         Mzig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722417680; x=1723022480;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DnUjBn+/d/YDX4qkQNOkPARCeLeNJpUfQHIds6ii0e8=;
        b=p2TQs0AT8TxzhY9EHsm6OcJ4Tfnz9Y3xQbsDxmcTE889vWckfzJzZ+HFObrvyBW1Bv
         yeMlTBN+JIut2I3xt7X4Z4+DGM5hTFH1RilovjIOoUWH5ZJeBY0SZq907/R+vnV6mVdl
         sQ3BLDDmnSqsQrVUcE0+mx8AFtp1LH/pFkH1W6bFgP0JSBtGPBCnDKZiGJoGSlYWlBC/
         D5/ph3NDnoWAFRSgicQ5V9gVF/LC7AQeJSy2GT2LI0l2w2259U0La6E7WWvZdemyatKI
         ovhpHDK/BsOjsQFQgLKoGSqoyEB9xfFSHggP+RCEUfyLTqxZpjDcgPwnQY1NyHW5pkCj
         SwfA==
X-Forwarded-Encrypted: i=1; AJvYcCUFJXfayi9xazOY6MRH1QqxvR2csz4d3LC+h4igKHcQLbejK4jCFp9Opclgac6F5RhrhqVowIXJ7CxCfuKXw+sEdxoG5moIl6Nq
X-Gm-Message-State: AOJu0YwH+MHVJc1ktasWLw0+y+1HJeHAshotYwTb30Y4QaVXp9BxZFAy
	g+sMCWFbhLubMrRqatfLJN5IW7rVhTUpNhZIIgBcQiVkAuQ4NfwcSMh5b3zgkTQMih/qkmJMd8j
	ZRT2X6G9n2V/K+gEM4mun3hKI1QAlG3ha9yGnMA==
X-Google-Smtp-Source: AGHT+IE5XcOpPj6iLzHjSTjIuq7B9+/rLrwh+EhDwGDUkVmfRrx7PTZ9akE/hgDNwQb6oBXZsZmh7/DDfnnxh+twdkA=
X-Received: by 2002:a81:c302:0:b0:64b:77e:84cf with SMTP id
 00721157ae682-67a09d5e528mr135046717b3.43.1722417680503; Wed, 31 Jul 2024
 02:21:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725-gcc-sc8180x-fixes-v1-0-576a55fe4780@quicinc.com>
 <20240725-gcc-sc8180x-fixes-v1-1-576a55fe4780@quicinc.com>
 <g4etw2efnugdsv73ejbbqfxmumy5m3oqzkpeqexzpgzlxsms5r@u62f5jcskqfd> <ea7fcbe4-1822-eca4-7492-55f1f2895605@quicinc.com>
In-Reply-To: <ea7fcbe4-1822-eca4-7492-55f1f2895605@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 31 Jul 2024 12:21:08 +0300
Message-ID: <CAA8EJppJR=sDj3ae2r9_QvcmG8vr8_GEPdiFcEit6L=-regXrQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] clk: qcom: gcc-sc8180x: Register QUPv3 RCGs for DFS
 on sc8180x
To: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Taniya Das <quic_tdas@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 31 Jul 2024 at 11:44, Satya Priya Kakitapalli (Temp)
<quic_skakitap@quicinc.com> wrote:
>
>
> On 7/27/2024 4:24 PM, Dmitry Baryshkov wrote:
> > On Thu, Jul 25, 2024 at 05:03:11PM GMT, Satya Priya Kakitapalli wrote:
> >> QUPv3 clocks support DFS, thus register the RCGs which require
> >> support for DFS.
> >  From the commit message it is not clear if the patch fixes the issue
> > (and thus should have Fixes and possibly cc:stable) or an improvement.
>
>
> Actually its a fix, I'll add Fixes tag in next post.

Together with the description of the actual issue it fixes, please.

>
>
> >> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> >> ---
> >>   drivers/clk/qcom/gcc-sc8180x.c | 350 ++++++++++++++++++++++++-----------------
> >>   1 file changed, 210 insertions(+), 140 deletions(-)
> >>
> >



-- 
With best wishes
Dmitry

