Return-Path: <linux-clk+bounces-13484-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA99C9A69EF
	for <lists+linux-clk@lfdr.de>; Mon, 21 Oct 2024 15:20:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8368AB2817D
	for <lists+linux-clk@lfdr.de>; Mon, 21 Oct 2024 13:14:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0E2C1F585A;
	Mon, 21 Oct 2024 13:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LGOxoxxa"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDB61F4285
	for <linux-clk@vger.kernel.org>; Mon, 21 Oct 2024 13:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729516477; cv=none; b=gE7mfqYkJGfGaiL6UAh+xkLOnhEo3S+0G69Lm5k51rt4gHraozXPiOyv6FnGdTcgPE3ffu0wdqE8LpxC4YQDB4jAEbrDwdEo9grHIijfdi8a4RVKv3iEv0dQtd0SjMxTOcPQlKB9F+NeZxvnm0yCvh4CcTRDociCsd5HsqfHJKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729516477; c=relaxed/simple;
	bh=ZNT6dErQm5dUkUtKaX2wR+uSRQ/CgST7uPEYAR7/AZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KCRkaIca9Bg0mxOHE1ykXpB0V0cwKVSuhe6AVq53RW+Ib7fmGGdGFJcQmi5PNy5wbAhpyQkDBXZl/eEB/ABh8KuZlwfLJQLL8XmS/OJ0gTArZLQRvhm1aZ/YV9/+YEjRWocuzh4hVggklcyb3AJjzlDK9v5Y5OJQ154tSIcV0Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LGOxoxxa; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e38fc62b9fso43907767b3.2
        for <linux-clk@vger.kernel.org>; Mon, 21 Oct 2024 06:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729516474; x=1730121274; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+SABp5bMa8b+ka5LQY2m+GgmsBuAwrypkhPoy4YrVo=;
        b=LGOxoxxaFzzKIn06jykezQME8nrYyqY0n0yC830hJDL4t9z9iM+tKuxi8eSLLI8mxZ
         NydxU67nrR3DPCmMTPqwV5Xnhy94P0d0gEhk0wOheNqvGkQL6smAR0hQXPe+Bp6AuDk5
         KOp03GN1Nu+TZl38uzkdO7ko+kyjdCQc28zlMcnaEePX1/LJE4KaUvXYvKj7mLG+NErE
         wC30VzMnGGrKquEeK/KPPLCioZiUbb7llPX3yRwTdECF6gDi2EEH/8OH0YJ2pmoqyBrq
         HAFX1n0aYcC5bj/LfRuDYa9Ac8rH/wzX5c7FCLkz2rkazK0cIn4JJadY8Kg7iqsVT36s
         WxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729516474; x=1730121274;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z+SABp5bMa8b+ka5LQY2m+GgmsBuAwrypkhPoy4YrVo=;
        b=ax13edPw+CdHKVAPR1bTGVD+ZQ8PG4GUFjfOmIcC6zm9ukeM7sPWwErqVyJnWuMI1s
         8s5N7MXe9csXboUf02IYq6ieHbYkHTi/bIEZbovKU4aWdqKJvTVV48y0hQ2/FgpEhPGy
         I+0kVBFRJGVOadyuqdrWJ9gXEaQh9rFjIqRy9SFWpuAUqfBLSMK4HhGDHBWAhNYNeCp7
         A9bZcfo2W1IkI6BfHetNTtEtBbsANWE33K1XK5vqD7bOYyzDu50HpGcYRaTfIvSf56Ds
         jEDlo/OhmrHGJqYYYFiD2fU9+hciLy1Vdhr7Wm0gC26AnICPz6LVvn8E9hUAS96ML7OH
         jXbg==
X-Forwarded-Encrypted: i=1; AJvYcCXHdKPjKbY+BO6ysKgqyrE7cbAOVHm3S94ILvN1GTdPUW27B61YXcXZiow9GcaOvctOuOK4ymzqTlo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTIxqt1y261B3kVi/6JZ11q7C25t/EVRrn/gb8Xp8TyjfsukYl
	UX4HnSfzgWy2yqPscJ2aDd2kCE5GO9/EVbbC0WQezmvKWRSUPzbWDU4b/NYPupYzRStcsc3knJt
	u4ICrsNOg5clNa2xgiV39IuPkR5Bs8S2gc4zKVQ==
X-Google-Smtp-Source: AGHT+IGS44A0LdF6F2vfatWoI0HEnmQZmlrki8Eve3Hnu3YdtW2VBHa3nNHJLmWNeIOMMpmk2ozUlE0zwWWxt/VJwcI=
X-Received: by 2002:a05:690c:d81:b0:6e2:d2a:e998 with SMTP id
 00721157ae682-6e5bf73cc21mr98859307b3.2.1729516474442; Mon, 21 Oct 2024
 06:14:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241021-sar2130p-clocks-v2-0-383e5eb123a2@linaro.org> <c6a1eced-ea8e-4174-9f8b-dbf4131e0a2c@oss.qualcomm.com>
In-Reply-To: <c6a1eced-ea8e-4174-9f8b-dbf4131e0a2c@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 21 Oct 2024 16:14:23 +0300
Message-ID: <CAA8EJprQ2538TKhA1NTzH5JVP5QH7qLNeFOWsbNoYz6QXd257A@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] clk: qcom: add support for clock controllers on
 the SAR2130P platform
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Kalpak Kawadkar <quic_kkawadka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Oct 2024 at 14:07, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 21.10.2024 12:30 PM, Dmitry Baryshkov wrote:
> > Add support for the RPMh, TCSR, Global, Display and GPU clock
> > controllers as present on the Qualcomm SAR2130P platform.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Changes in v2:
> > - Dropped gcc_camera_hf_axi_clk, gcc_camera_sf_axi_clk,
> >   gcc_qmip_camera_nrt_ahb_clk, gcc_qmip_camera_rt_ahb_clk,
> >   gcc_iris_ss_hf_axi1_sreg, gcc_iris_ss_spd_axi1_sreg,
> >   gcc_video_axi0_sreg and gcc_video_axi1_sreg clocks until corresponding
> >   subsytems bringup (Taniya)
> > - Program GDSC_SLEEP_ENA_VOTE directly from the probe function (Taniya)
> > - Dropped sreg, BRANCH_HALT_POLL and collapse_sleep_mask patches
> >   (Taniya)
> > - Dropped gcc_parent_data_4, gcc_parent_map_4, gcc_parent_data_5,
> >   gcc_parent_map_5 (LKP)
> > - Link to v1: https://lore.kernel.org/r/20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org
>
> Please address the remaining comments from me too

Oops. Excuse me.



-- 
With best wishes
Dmitry

