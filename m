Return-Path: <linux-clk+bounces-5723-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2342D89FDD5
	for <lists+linux-clk@lfdr.de>; Wed, 10 Apr 2024 19:12:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 917881F2297C
	for <lists+linux-clk@lfdr.de>; Wed, 10 Apr 2024 17:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B12117BB02;
	Wed, 10 Apr 2024 17:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wUKWwJyL"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FC117B506
	for <linux-clk@vger.kernel.org>; Wed, 10 Apr 2024 17:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712769118; cv=none; b=pG4WNwXwkmbRI8FzQ8V7uutkNOK4euX7pkzxaTSL2SIw25xM7mOQmaBmgoJFvsVMBs2Q0jOXK0GdC3OPu6qLfvx7bLEo3Cqeo9TOP5xusEPmvFx064aX8m2KW9HRGzG09IpvzX+6Gf8xGWc2tHzyK+zzRJ/hrwXCXuzFKIdnTZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712769118; c=relaxed/simple;
	bh=i2MKukkSWItj1fsVHmkUoM7qU4Ft83lpcnaP3ZJDOlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DrDGBMkn3PZ7EJdqKLZggiG9q+7rRuiDhXEASPwiLzjYTdaVj7ZP3Lzj+EBiC9HIolI5sN9l4c+Ld9qUhXjwrajRM3LVN2euO2toplzAThoGNZ5I6RwXF1fC+X8olOK6aLPuSa4M5DLEK9qGrkFHCVlcD7EqK08I08UvGxeZdJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wUKWwJyL; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6184acc1ef3so8451027b3.0
        for <linux-clk@vger.kernel.org>; Wed, 10 Apr 2024 10:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712769115; x=1713373915; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=krVqdNJGaSWnCm1fFe2sDo2PvBuE9P/OvcdLjateS3M=;
        b=wUKWwJyL8ias0pJ1hygAN5aN1GfA8sapG2G0EF9LqEw8mPCbDYK19qkNUsTgJUVsJE
         S1GgXkf89dBuLn/wJ6yy/7ZFUBPfrzzg+iwoDjT6qEzU4YWBED4UnjgczQj7CrYtTA3n
         7Ddywj7BgFdnz8nOmnQ5D0ciebF1n7Y2zyDCSYW/l9Ocdi+O/Sv8uIzYkBy6VOR6dwID
         R1qImIVRVJ18dylwpeBq6AeDt0cKrPbJ6C3BpQWRf29GoLJInFnBgyhTyckjsi3ME2+w
         VObLHxzQBhMR2CBBNrLcCh4bMQKDJSgoEZl3AL8W/0r1DuS+YFyySsjlNfXJs41kkKz8
         xqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712769115; x=1713373915;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=krVqdNJGaSWnCm1fFe2sDo2PvBuE9P/OvcdLjateS3M=;
        b=foG1e22ASNq2Xpghd55302E8DQug4fzfi59Kn4vJjXV4STu1wn9z3fJh3YYALk6BFI
         +tUSaEGLqX705X2p4rZ794Lb12UIyU6gwn6BnJ6ffbeaFsI4FbfVAL9DuT2afkNUcqTs
         K6wQXm4L+lA846xerrgNK8AgvEDtxY07Yw+iz45fHKvPsc0rG+Mfp9usA7bIJEP6Rfp8
         1KRWfAS4TQ9PdiwEExvxUG1qEB4M7fA47COZJjtXNsWhDP8b4nsLLRXsuZc3fCU7o8KO
         ASGYrg+2lb+n7n/qC+3xSnADXvfSK9jWL1lZ8BeKUQDzrQDwopboLBnn2x4huqHqyliz
         ZJcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBWVhCFmQPi900Wdc2FzeK9nGCAAX72U2dCCK8jXXdBs4VepHLutPGXt8iXaenpn4UScdwZoDHZ8s8PkKkXSkXv8qqTsJeU8Tp
X-Gm-Message-State: AOJu0YyydEGG3/epsaYI7rtSJe1q1xpVVjYivKvFxrc2RHfoFMkHqaLx
	IkMh8gA3laBUF5DMRNhrgMio+7KEkMKTUlnPpRJM4gP9rJJx+ttJ/NXE2i7LM+vPEuM1xTPbIXM
	02PQg6hgeHwFlyRuyF6AyXP4AOLmzEaAD/K1Lng==
X-Google-Smtp-Source: AGHT+IEVpAGOSFK1J2kzYqoP+B+FaJqrVPpqi9DXr0x0VEB+7rxo95stUUE+nKOfATESTPOUz4R5f8qOBgId05SD5jE=
X-Received: by 2002:a25:ac49:0:b0:dbe:9509:141c with SMTP id
 r9-20020a25ac49000000b00dbe9509141cmr3796379ybd.30.1712769115576; Wed, 10 Apr
 2024 10:11:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240408-dispcc-dp-clocks-v1-0-f9e44902c28d@linaro.org>
 <20240408-dispcc-dp-clocks-v1-1-f9e44902c28d@linaro.org> <57735f4f-aa94-4ca7-8d5b-a95519c5ffd6@linaro.org>
In-Reply-To: <57735f4f-aa94-4ca7-8d5b-a95519c5ffd6@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 10 Apr 2024 20:11:44 +0300
Message-ID: <CAA8EJpqjc2JUSm6xT+6Y03Scazysgdj6xX6XWPsUrrActTA7zw@mail.gmail.com>
Subject: Re: [PATCH 1/4] clk: qcom: dispcc-sm8450: fix DisplayPort clocks
To: neil.armstrong@linaro.org
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@somainline.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Apr 2024 at 19:27, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On 08/04/2024 13:47, Dmitry Baryshkov wrote:
> > On SM8450 DisplayPort link clocks use frequency tables inherited from
> > the vendor kernel, it is not applicable in the upstream kernel. Drop
> > frequency tables and use clk_byte2_ops for those clocks.
> >
> > Fixes: 16fb89f92ec4 ("clk: qcom: Add support for Display Clock Controller on SM8450")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/clk/qcom/dispcc-sm8450.c | 20 ++++----------------
> >   1 file changed, 4 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/clk/qcom/dispcc-sm8450.c b/drivers/clk/qcom/dispcc-sm8450.c
> > index 92e9c4e7b13d..49bb4f58c391 100644
> > --- a/drivers/clk/qcom/dispcc-sm8450.c
> > +++ b/drivers/clk/qcom/dispcc-sm8450.c
> > @@ -309,26 +309,17 @@ static struct clk_rcg2 disp_cc_mdss_dptx0_aux_clk_src = {
> >       },
> >   };
> >
> > -static const struct freq_tbl ftbl_disp_cc_mdss_dptx0_link_clk_src[] = {
> > -     F(162000, P_DP0_PHY_PLL_LINK_CLK, 1, 0, 0),
> > -     F(270000, P_DP0_PHY_PLL_LINK_CLK, 1, 0, 0),
> > -     F(540000, P_DP0_PHY_PLL_LINK_CLK, 1, 0, 0),
> > -     F(810000, P_DP0_PHY_PLL_LINK_CLK, 1, 0, 0),
> > -     { }
> > -};
> > -
> >   static struct clk_rcg2 disp_cc_mdss_dptx0_link_clk_src = {
> >       .cmd_rcgr = 0x819c,
> >       .mnd_width = 0,
> >       .hid_width = 5,
> >       .parent_map = disp_cc_parent_map_3,
> > -     .freq_tbl = ftbl_disp_cc_mdss_dptx0_link_clk_src,
> >       .clkr.hw.init = &(struct clk_init_data) {
> >               .name = "disp_cc_mdss_dptx0_link_clk_src",
> >               .parent_data = disp_cc_parent_data_3,
> >               .num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
> >               .flags = CLK_SET_RATE_PARENT,
> > -             .ops = &clk_rcg2_ops,
> > +             .ops = &clk_byte2_ops,
> >       },
> >   };
> >
> > @@ -382,13 +373,12 @@ static struct clk_rcg2 disp_cc_mdss_dptx1_link_clk_src = {
> >       .mnd_width = 0,
> >       .hid_width = 5,
> >       .parent_map = disp_cc_parent_map_3,
> > -     .freq_tbl = ftbl_disp_cc_mdss_dptx0_link_clk_src,
> >       .clkr.hw.init = &(struct clk_init_data) {
> >               .name = "disp_cc_mdss_dptx1_link_clk_src",
> >               .parent_data = disp_cc_parent_data_3,
> >               .num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
> >               .flags = CLK_SET_RATE_PARENT,
> > -             .ops = &clk_rcg2_ops,
> > +             .ops = &clk_byte2_ops,
> >       },
> >   };
> >
> > @@ -442,13 +432,12 @@ static struct clk_rcg2 disp_cc_mdss_dptx2_link_clk_src = {
> >       .mnd_width = 0,
> >       .hid_width = 5,
> >       .parent_map = disp_cc_parent_map_3,
> > -     .freq_tbl = ftbl_disp_cc_mdss_dptx0_link_clk_src,
> >       .clkr.hw.init = &(struct clk_init_data) {
> >               .name = "disp_cc_mdss_dptx2_link_clk_src",
> >               .parent_data = disp_cc_parent_data_3,
> >               .num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
> >               .flags = CLK_SET_RATE_PARENT,
> > -             .ops = &clk_rcg2_ops,
> > +             .ops = &clk_byte2_ops,
> >       },
> >   };
> >
> > @@ -502,13 +491,12 @@ static struct clk_rcg2 disp_cc_mdss_dptx3_link_clk_src = {
> >       .mnd_width = 0,
> >       .hid_width = 5,
> >       .parent_map = disp_cc_parent_map_3,
> > -     .freq_tbl = ftbl_disp_cc_mdss_dptx0_link_clk_src,
> >       .clkr.hw.init = &(struct clk_init_data) {
> >               .name = "disp_cc_mdss_dptx3_link_clk_src",
> >               .parent_data = disp_cc_parent_data_3,
> >               .num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
> >               .flags = CLK_SET_RATE_PARENT,
> > -             .ops = &clk_rcg2_ops,
> > +             .ops = &clk_byte2_ops,
> >       },
> >   };
> >
> >
>
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>
> I can't test, but I assume you tested on your HDK8450

That's how I stumbled upon it. I was not able to test other patches in
the series, but granted the similarity I assume that they should work
in the same way.

-- 
With best wishes
Dmitry

