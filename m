Return-Path: <linux-clk+bounces-6239-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF2E8ACCE3
	for <lists+linux-clk@lfdr.de>; Mon, 22 Apr 2024 14:40:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 314EB1F21C12
	for <lists+linux-clk@lfdr.de>; Mon, 22 Apr 2024 12:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB58214EC7C;
	Mon, 22 Apr 2024 12:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GJzqxMnA"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4078A14EC67
	for <linux-clk@vger.kernel.org>; Mon, 22 Apr 2024 12:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713789582; cv=none; b=utUFM48CzhuwwoALbr0ehJ9LLukXbLY13Xz8SSbsEsICiVzECI5ZqS4lRxHkz72qlrykOqmQ39BWrxS4eeTkJUY+0Au1/B8J0pvFB8mrAtN/iFNaSv0ia53oa5a+ckhpMP/ija73kPq3lrSZTzmR7RTjIGBtwfC9eCqM+eB91Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713789582; c=relaxed/simple;
	bh=iyTsIMR6AeJPVBmq77RzZGnEgc860sS11RT6shdDDRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UCrj8xjselfjv9a00Dv9veeORpBzEBsnvtiKJxKGEauXqHoVRtA+RLaWBhOEK2OOjEB3JYK8nCH/hCHGIflU6Z9sRKjl/FxeBq/3K+ZmElrmA5T7Zt+2LoS4JNe6ddK6vLhvsgtML8mARJQG0JUZ6crjlMGzgc/6LTqa3+vHRt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GJzqxMnA; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-234db9dde9bso1467580fac.1
        for <linux-clk@vger.kernel.org>; Mon, 22 Apr 2024 05:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713789580; x=1714394380; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S4ySNq3QesUCzbAIR2RY0fipn3yuib781ddLRiaF6bc=;
        b=GJzqxMnAZlXFvpw/W7OFie1lW1lGs+B0rbRo4x7hIvcbGkrjUln9INDuLK9g+IphIX
         aDaGsgDTGZz8E3msvjjzd9yYcp099GvrB/UGkBdmNOtH7gKA2ZPil83GTGt565zZZM2g
         gOdHABj3iBLS2Zi1E4ke2ksQnniHGN7OpVehFs4ENiDNGsCQyhJG98hpaWt7zLe1cT/R
         8E/TB78cAXPp5kS/2DjzOxhcJSfXIvwTLvDJ4wHaonghCQYUDNlQdR3pS2jANq2moE4z
         0NM04olMYW4649SS9KYm7iKnSAyZCXe3IwIH9ma6AwZadKy30icRDpGmaarKoPIy5DIr
         JilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713789580; x=1714394380;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S4ySNq3QesUCzbAIR2RY0fipn3yuib781ddLRiaF6bc=;
        b=qMyhqyUnoT/227XBqkfSU+FHesE/FvglGmwMmZaTUXVuF/l/YsVvlhH8IuWV7CfrCH
         hZyiaMRFRFBLlDZZyObHiYtH08FOzRV3xzE3glK/MLwBuIffNc0c6EWmxxSieWLYhLDg
         DbMzj7c/yTnCw3d997P0qzp6cucqkI9Q7V8jlgfhmo1IguEWMODKkhN80548Ee1uuuv+
         V8wdabUl/lzxjpPVyG0EXn+4sRwEJ4G9c0QT5/oEMggCF41J/hXvXq0nLtkr7JvtJi31
         iK1Shhbi0/RNsac1Z8DJOyoh1+xqucDMfu/X+hLJYXYTyMaL6FAwFdmjT+ecbEV/PabL
         Tz/w==
X-Forwarded-Encrypted: i=1; AJvYcCVpCQyyloKeFzJIqmEAy2/vwOSM32tMHGr7WIxFnrd5f7XuyIQIDvPSLUNCCj2076pas0uflpa5eT/XHKKl9ta0BY1N397VZlz1
X-Gm-Message-State: AOJu0Yz6tjNl280hSP/t3AsOzM2TvJiY0/DGunlafFYS17NzDGnmkDcV
	8NmZ/QL/c/1WHm2rsaBlmYcCPqOMDEmn0KdVv8LlpEPLR2q6RFRq0ce45qbh/hsP9NK2Ko6Q5lg
	6pbokDjY8EjutPFD2boD2hXIOHxS/LI0FMadwVA==
X-Google-Smtp-Source: AGHT+IFRVyCeWFThbOBOiFgmqUhy26Z9HP2Lw9XMRIZylBypB7g6tOUorMkXN+WcL7sQuHVha6TScv+q+Y0CqpP+4uw=
X-Received: by 2002:a05:6870:c1cf:b0:21f:d2a2:7ff4 with SMTP id
 i15-20020a056870c1cf00b0021fd2a27ff4mr14344315oad.17.1713789580152; Mon, 22
 Apr 2024 05:39:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240404122559.898930-1-peter.griffin@linaro.org>
 <20240404122559.898930-11-peter.griffin@linaro.org> <75b1b063-e8d4-417d-99a8-4320d72297cf@moroto.mountain>
In-Reply-To: <75b1b063-e8d4-417d-99a8-4320d72297cf@moroto.mountain>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 22 Apr 2024 13:39:28 +0100
Message-ID: <CADrjBPputDQWpQZgPiuUDLTWZA83KJEMp-X8ZtXAwt6ivTOG9g@mail.gmail.com>
Subject: Re: [PATCH 10/17] phy: samsung-ufs: ufs: Add SoC callbacks for
 calibration and clk data recovery
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, kishon@kernel.org, 
	alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org, 
	s.nawrocki@samsung.com, cw00.choi@samsung.com, jejb@linux.ibm.com, 
	martin.petersen@oracle.com, chanho61.park@samsung.com, ebiggers@kernel.org, 
	linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, tudor.ambarus@linaro.org, 
	andre.draszik@linaro.org, saravanak@google.com, willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

Thanks for the review.

On Wed, 17 Apr 2024 at 10:52, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> On Thu, Apr 04, 2024 at 01:25:52PM +0100, Peter Griffin wrote:
> > diff --git a/drivers/phy/samsung/phy-samsung-ufs.c b/drivers/phy/samsung/phy-samsung-ufs.c
> > index c567efafc30f..f57a2f2a415d 100644
> > --- a/drivers/phy/samsung/phy-samsung-ufs.c
> > +++ b/drivers/phy/samsung/phy-samsung-ufs.c
> > @@ -46,7 +46,7 @@ static void samsung_ufs_phy_config(struct samsung_ufs_phy *phy,
> >       }
> >  }
> >
> > -static int samsung_ufs_phy_wait_for_lock_acq(struct phy *phy)
> > +int samsung_ufs_phy_wait_for_lock_acq(struct phy *phy, u8 lane)
> >  {
> >       struct samsung_ufs_phy *ufs_phy = get_samsung_ufs_phy(phy);
> >       const unsigned int timeout_us = 100000;
> > @@ -98,8 +98,15 @@ static int samsung_ufs_phy_calibrate(struct phy *phy)
> >               }
> >       }
> >
> > -     if (ufs_phy->ufs_phy_state == CFG_POST_PWR_HS)
> > -             err = samsung_ufs_phy_wait_for_lock_acq(phy);
> > +     for_each_phy_lane(ufs_phy, i) {
> > +             if (ufs_phy->ufs_phy_state == CFG_PRE_INIT &&
> > +                 ufs_phy->drvdata->wait_for_cal)
> > +                     err = ufs_phy->drvdata->wait_for_cal(phy, i);
> > +
> > +             if (ufs_phy->ufs_phy_state == CFG_POST_PWR_HS &&
> > +                 ufs_phy->drvdata->wait_for_cdr)
> > +                     err = ufs_phy->drvdata->wait_for_cdr(phy, i);
>
> The "err" value is only preserved from the last iteration in this loop.

I'll send a follow up patch for this as it's already applied.

Thanks,

Peter

