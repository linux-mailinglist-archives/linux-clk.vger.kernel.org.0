Return-Path: <linux-clk+bounces-5975-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 901218A6866
	for <lists+linux-clk@lfdr.de>; Tue, 16 Apr 2024 12:29:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20CE6282D12
	for <lists+linux-clk@lfdr.de>; Tue, 16 Apr 2024 10:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C449127E18;
	Tue, 16 Apr 2024 10:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GTyLr1Yn"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10CA127E04
	for <linux-clk@vger.kernel.org>; Tue, 16 Apr 2024 10:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713263368; cv=none; b=vAdxbCuEEohPUrF32tuQwOWWVNrz+7uRGai3bu25UNB/GT7CwTikDa6TFzXEaA3vrNtvUVtLE+u+Fwzd5hzhk8ixBm5VuAY9hNQ/wAE5A3oEc5ZBLcbnkaA1bkLN/TWOpxbCVA4m7UlBFOmx1bn3tXSB8ghPPFjkLJ+HxLG9cU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713263368; c=relaxed/simple;
	bh=CTjrCNZbBSPJIq0cHJaUgYHpJavxftBIjzydI7AEWe8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UfUtT8XmD/sgUk+cfDydaa660MEPjeE6aKK4W9Jc4pBdrTCVFjIdsu8H9NCjng6jZ+4WKTy9QTPnaVkjZp0qfL7Q23zLTEIIz62S3J7ydgjL8Bt23CvEvOCYCAVzVUGneqstTaG1XAM84NNj3nsAFA8orOJrXDexu1NJeiKLGVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GTyLr1Yn; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5aa1bf6cb40so3108096eaf.1
        for <linux-clk@vger.kernel.org>; Tue, 16 Apr 2024 03:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713263366; x=1713868166; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CTjrCNZbBSPJIq0cHJaUgYHpJavxftBIjzydI7AEWe8=;
        b=GTyLr1YnIn1Gj4hf0+sXQng3qRUeoJMvoHZuVwzJ5jduu/1O2AmTbphLHLWcWZeWFq
         GhcFiL4zxZ/EQpHDcQskAiye3kQ7wlint+B3aExxIDldjWzh1VDNUE5aa9vvQGxalitR
         jA6alvyNb7mcDPwqql+ZyoSCJ8cS/Fpxj8BoE1hymp4iARnByqOVfLsuJxT+dy2mvbG4
         4romHI7a4BBz4Qbz8R4WQgTGaprtTg7BWSpQoDn+nosqEQsixw3NRpeLBAZBt6gE2voo
         n+EO6rJz4H1YSTDrBLG9OZuNf8zC2BHS3j7Oz6mICZqHLA70vrShcgVKCu6+CVGp4c31
         80+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713263366; x=1713868166;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CTjrCNZbBSPJIq0cHJaUgYHpJavxftBIjzydI7AEWe8=;
        b=X/Cc8Ty4xvb1WSBZQ+ABuR5IzG4rkAmBK5Xu0diiA2wwN/MUBqZe8NLB4GiMQKWPnU
         1pxM6qtxJQYRMqEDs86OZRkhUjCknp9oxq02ilIeuqwFYcBHOWv1H3IJPZVyJiXU7JhU
         b5lTy2FQm09KHdAnuAqziKpqEXQNEkiujN4BRhL0w/hCfLLVQuDCT1iIvg7AKdZGdQsB
         qH2t74fcI7uXLcnjFx4lr680Bb2PjEsKXbBlQgZKIKWfhgme4SgLKuMhKmI1yRMaWrW2
         P0ZcnWmcJZZ4SevLt7c7DZ4oDnxh9y0UC4pb6Doh8Wr0Zc5qyNBKJ7czybbpP+Jpyxmh
         WJNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoWA2iFuQKHnt3K7ONb72dpPm9ZY8X7tMAjxdvV6gMo/JhQez1lmsfcOxNtxmJiMiPwc4dfuBlz8qDlsLuECY97eEGVA+JSzRI
X-Gm-Message-State: AOJu0YwU5TCiHKG+R0pyytF1YEoVjRdiLtArNbPIqBSEqgfHTIlW0WRy
	1S/EIr1umlZo9Y0cOUVTyPvBZfINNBcqH+vsPZEFWZxuHV9zzIoUUCSmSdbx42R+iql06OwG38W
	505P/QzcN8TcG4aBFRW55vXpE3VDSK4K0XhPIpQ==
X-Google-Smtp-Source: AGHT+IF0mprWmsJ0VbCYrBsXHEko3BiOSfnamAyFvbNWuNvMQCxuk0etOf3eft9TH8byKplO1hBCDcIJEdlM+FZqB18=
X-Received: by 2002:a4a:98d1:0:b0:5ac:9f37:3ef4 with SMTP id
 b17-20020a4a98d1000000b005ac9f373ef4mr5487329ooj.4.1713263365969; Tue, 16 Apr
 2024 03:29:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20240404122615epcas5p3812bd7c825bf604fc474bbcdf40d11f6@epcas5p3.samsung.com>
 <20240404122559.898930-1-peter.griffin@linaro.org> <04d401da898e$fd57ec10$f807c430$@samsung.com>
In-Reply-To: <04d401da898e$fd57ec10$f807c430$@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 16 Apr 2024 11:29:15 +0100
Message-ID: <CADrjBPoVSvUoq4Yw6DWRXN6=xi31p6=UKCL=57VHDoaKiQCTEQ@mail.gmail.com>
Subject: Re: [PATCH 00/17] HSI2, UFS & UFS phy support for Tensor GS101
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, kishon@kernel.org, 
	avri.altman@wdc.com, bvanassche@acm.org, s.nawrocki@samsung.com, 
	cw00.choi@samsung.com, jejb@linux.ibm.com, martin.petersen@oracle.com, 
	chanho61.park@samsung.com, ebiggers@kernel.org, linux-scsi@vger.kernel.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, saravanak@google.com, 
	willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"

Hi Alim,

Thanks for your review feedback.

On Mon, 8 Apr 2024 at 09:30, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
> Hi Peter
>
> > -----Original Message-----
> > From: Peter Griffin <peter.griffin@linaro.org>
> > Sent: Thursday, April 4, 2024 5:56 PM
> > To: mturquette@baylibre.com; sboyd@kernel.org; robh@kernel.org;
> > krzk+dt@kernel.org; conor+dt@kernel.org; vkoul@kernel.org;
> > kishon@kernel.org; alim.akhtar@samsung.com; avri.altman@wdc.com;
> > bvanassche@acm.org; s.nawrocki@samsung.com; cw00.choi@samsung.com;
> > jejb@linux.ibm.com; martin.petersen@oracle.com;
> > chanho61.park@samsung.com; ebiggers@kernel.org
> > Cc: linux-scsi@vger.kernel.org; linux-phy@lists.infradead.org;
> > devicetree@vger.kernel.org; linux-clk@vger.kernel.org; linux-samsung-
> > soc@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
> > kernel@lists.infradead.org; tudor.ambarus@linaro.org;
> > andre.draszik@linaro.org; saravanak@google.com;
> > willmcvicker@google.com; Peter Griffin <peter.griffin@linaro.org>
> > Subject: [PATCH 00/17] HSI2, UFS & UFS phy support for Tensor GS101
> >
> > Hi folks,
> >
> >
> > Question
> > ========
> >
> > Currently the link comes up in Gear 3 due to ufshcd_init_host_params()
> > host_params initialisation. If I update that to use UFS_HS_G4 for
> negotiation
> > then the link come up in Gear 4. I propose (in a future patch) to use VER
> > register offset 0x8 to determine whether to set G4 capability or not (if
> major
> > version is >= 3).
> >
> > The bitfield of VER register in gs101 docs is
> >
> > RSVD [31:16] Reserved
> > MJR [15:8] Major version number
> > MNR [7:4] Minor version number
> > VS [3:0] Version Suffix
> >
> > Can anyone confirm if other Exynos platforms supported by this driver have
> > the same register, and if it conforms to the bitfield described above?
> >
>
> VER (offset 0x8) is standard UFS HCI spec, so all vendor need to have this
> (unless something really wrong with the HW)
> Yes, Exynos and FSD SoC has these bitfield implemented.

Thanks for confirming! I will look to propose something once this
series is merged.

Peter.

