Return-Path: <linux-clk+bounces-9691-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F915932E8D
	for <lists+linux-clk@lfdr.de>; Tue, 16 Jul 2024 18:46:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAE112838F0
	for <lists+linux-clk@lfdr.de>; Tue, 16 Jul 2024 16:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D80B019F482;
	Tue, 16 Jul 2024 16:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="saqgYE8M"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306421E528
	for <linux-clk@vger.kernel.org>; Tue, 16 Jul 2024 16:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721148395; cv=none; b=rmZbydoOhBnJXjicfa4KKyWS2DuFKUjkLyTIwhM5BFd79ex4E4/eG40RmcGiwICvdH1HH1EWUMsHWVUqNKiUncPc3UVFK+FOfavXhwvsSXlE6OPGBvhgmsvBhuwhdN2OeUlXPya02rHQpLVig/itLo+ymRNJtYiS6v3wuJoL3ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721148395; c=relaxed/simple;
	bh=/uO28JIzVjT3o+pteNKJcM0A5ixMT0fdtKUaIBjY+XA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wzk7dHFOoKa8uu9m0jTFzPs4pe/JJgrbC6OaiTWNmw04YdSh9CX7xZiVIMkE4qWMEBi8S3RBq5lYu2J1ApAPi88tncGqXR/idI3cLdnzLZNlgV+mPv/HHQ+mAE1rZLM8fbmX8RKVd6LznVJ9EPoCSfry753wsSE0LF1Ke9L+byM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=saqgYE8M; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52e94eaf5efso7196631e87.2
        for <linux-clk@vger.kernel.org>; Tue, 16 Jul 2024 09:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721148390; x=1721753190; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UdlcGvPV4rMkeD613/ZfNJun3YfIW1JB7Y540EAzI4A=;
        b=saqgYE8M0ftR2nbP5DxHECYBBnLZaf4K3mgxJwXRQWPIohsd5GZ7gFu2w+AbdivJBI
         T6PxtFRY0zshmzfSobXiOV/IHV2ILKu2g0awIbxv4VekTuE+4F9cWNTDCYSEsdutbCo0
         9M67xcWKOZShoEPxq/wd1gCEE/LStzL1V01c3uT/CJFOA9watrRtMPEHZBpVxPQGvm02
         vPVYLDHfVDsJAqsRq6x8dYZlbpzNbeW/Re6AzfS2Qqc+cXPw2lU7fiQxxiVDe29bzzfJ
         9EdYBkccpH9JT/xrscrs8JRjgA3o+zCH4t37ldGA+3U2PYd9AQ9oF2Z9S//dSGIqTh3I
         B3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721148390; x=1721753190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UdlcGvPV4rMkeD613/ZfNJun3YfIW1JB7Y540EAzI4A=;
        b=XBT1JIyvHEmAS7YyZUiNm0DVhTlz3nZmElDY5KhagdzIwrPsHULVn6MOS/72IBHSra
         1ZU//Ena5xs3k8qzsMPmeL2lb3bcNpq4UCALVzZJqgzKQVZ4yYZ8wS7vq7zsW5Cr60lI
         75iSzrDtvvcqRWRLbw49ZaRK1yL+uN9ts+xaDGK416E1LO8biq9NmdHjWKDJAUg9GbRQ
         v/CxIQSyJgavNbr+rCI/Z7zrz5R/ZdOIVgwR9N5ThhbfcjqEUIgjVKNP+zSIf6sr+9w3
         DfSznwneLwdyrZ1KypI0GiCxQpzg4whX5uuUr29Z6Bqgfwjbk6zdZHNEn5qMSlUMN9De
         cvYw==
X-Forwarded-Encrypted: i=1; AJvYcCXbpeYLdTgVx6lAS54EEsa+vhJQorvbLq4HnrQu+h9ZMfzMIXc4PbhCgkcDww6Q2LcTaoDkOE+MAdpQ1sgQl/lTRTu4VNwpxHCW
X-Gm-Message-State: AOJu0YykfnXK66qROkaPZH1r0FFACoyJ+j3Mq3WUkF2CVK542u+Ypnwv
	dpIzu+b29vrFrjZtaU0NIie/rLQAzB4yx4IG25JgxTPjK+s80uBhu9tOhd6AWT0=
X-Google-Smtp-Source: AGHT+IH1Umt4AGKUi97EA/xp39tZETdjijAkzPUgbnJvzG0aE8B3zUOXJakTJA6Nzb4q5X83AOT3QQ==
X-Received: by 2002:a05:6512:3f29:b0:52e:9d6c:4462 with SMTP id 2adb3069b0e04-52edf01c462mr1777240e87.23.1721148390000;
        Tue, 16 Jul 2024 09:46:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ed24e2b66sm1202263e87.59.2024.07.16.09.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 09:46:29 -0700 (PDT)
Date: Tue, 16 Jul 2024 19:46:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: neil.armstrong@linaro.org
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Taniya Das <quic_tdas@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] clk: qcom: dispcc-sm8650: add missing
 CLK_SET_RATE_PARENT flag
Message-ID: <kxrhhb3vdojbnqfbwks2qmob55fwm3onleood73qfk6esl7g2c@q66kw5am4emc>
References: <20240716-topic-sm8650-upstream-fix-dispcc-v3-0-5bfd56c899da@linaro.org>
 <20240716-topic-sm8650-upstream-fix-dispcc-v3-2-5bfd56c899da@linaro.org>
 <dccttz5b44bl3lwmcaqz6wjx3n4sv3eq4yh6276vzwrtkcvqcw@qxhbo7bylnsg>
 <9ad10d92-d755-4fae-b206-6e8648be6d48@linaro.org>
 <CAA8EJpr9L+AKDhuHfQa=Nco7fvG9vLH3a+gxVhENrhz12b3n=Q@mail.gmail.com>
 <278354ec-532b-48de-8ee1-5477ddb4a285@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <278354ec-532b-48de-8ee1-5477ddb4a285@linaro.org>

On Tue, Jul 16, 2024 at 03:46:24PM GMT, neil.armstrong@linaro.org wrote:
> On 16/07/2024 15:44, Dmitry Baryshkov wrote:
> > On Tue, 16 Jul 2024 at 15:32, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> > > 
> > > On 16/07/2024 13:20, Dmitry Baryshkov wrote:
> > > > On Tue, Jul 16, 2024 at 11:05:22AM GMT, Neil Armstrong wrote:
> > > > > Add the missing CLK_SET_RATE_PARENT for the byte0_div_clk_src
> > > > > and byte1_div_clk_src, the clock rate should propagate to
> > > > > the corresponding _clk_src.
> > > > > 
> > > > > Fixes: 9e939f008338 ("clk: qcom: add the SM8650 Display Clock Controller driver")
> > > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > > > ---
> > > > >    drivers/clk/qcom/dispcc-sm8650.c | 2 ++
> > > > >    1 file changed, 2 insertions(+)
> > > > 
> > > > This doesn't seem correct, the byte1_div_clk_src is a divisor, so the
> > > > rate should not be propagated. Other platforms don't set this flag.
> > > > 
> > > 
> > > Why not ? the disp_cc_mdss_byte1_clk_src has CLK_SET_RATE_PARENT and a div_table,
> > > and we only pass DISP_CC_MDSS_BYTE1_CLK to the dsi controller.
> > 
> > Yes, the driver sets byte_clk with the proper rate, then it sets
> > byte_intf_clk, which results in a proper divisor.
> > If we have CLK_SET_RATE_PARENT for byte1_div_clk_src, then setting
> > byte_intf_clk rate will also result in a rate change for the byte_clk
> > rate.
> > 
> > Note, all other platforms don't set that flag for this reason (I think
> > I had to remove it during sm8450 development for this reason).
> > 
> 
> Ack, I think this deserves a comment explaining this, I'll add it.

But where to place it? This applies to _all_ dispcc controllers.

-- 
With best wishes
Dmitry

