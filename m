Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E3A21FED3D
	for <lists+linux-clk@lfdr.de>; Thu, 18 Jun 2020 10:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728464AbgFRIKm (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 18 Jun 2020 04:10:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728469AbgFRIJh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 Jun 2020 04:09:37 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C36C0C061755
        for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2020 01:09:36 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id l26so4247117wme.3
        for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2020 01:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=aa9FGpSBU0p0SkiM2oqKVw0h4OsYKmsdaf41oPs0vM4=;
        b=JZ2DoDiqpWFUvgxnCeqJipmSehBOhlGEN4DI/Br9dFqFoR+0t1Rm+LipBYanLVATwe
         1pzOBFKiaoVwnejyhr+54+DqWSGHUj893x390snhCIvjEsg7GfZpDv6Fq71r10mDiJbf
         AI6h8IiZpknBrzYxEwf05V+5PcFgp7uZ1LbFkRjCL1kcxXykNxLw/YXAMQwSPzC6JBGy
         29BqXIzw0HKKnNdY05qZph0tgmFBdrP6Rm2sG/oCnfgMF/mGqac8zelpReFYPvEcqdQA
         jFP1eK5T5a7NOfqJzhLWRMKwCWJTQpiULTkTsY9df8CH1KrfVU9QMiDxEG1OAqzdnXJv
         N1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=aa9FGpSBU0p0SkiM2oqKVw0h4OsYKmsdaf41oPs0vM4=;
        b=dnVLGjdEb0NQA6YP6oRgsdjM/DUccRWEPnLOvEd46kL4srku/eyfdjY2+Uw5bBmcLf
         +kDZUmTMYUoEVdSgJXYn5W5h89iaqOg2THRJRlaCBGz0pkqi1sPqsIP2CG3vjqyGv1V5
         F9HOHYKcDvJto+lUdiaQGXuIx5lY9OVA0DWF8ZbM7I8wNl0AbPU28IFrHXpPwBmJsUmO
         5oNcppV6UURQCqS+5Faz8jKlkXalc8AsFlx0yhhTuJaVghzZmBVDT88JNBnQpBva+wIY
         6JmbfYHOSkMm535SgT2kfWFyqwGKcI8buSRRMU85SicGJd7QxHcNXM4S+W0HYX6kFef5
         3W1w==
X-Gm-Message-State: AOAM532z5QDc8VDyPJIXZVDvS2c07gHsJ91WdCz9GFrRlq+IWJjfUPA0
        RNv3axHd4ImIFiYw/1u9vheX4Q==
X-Google-Smtp-Source: ABdhPJxykprCYfE9CDJKy6l36stICHQh0Hzp3gCi+QfRIwYROeNp3OkNtRUy+NNKi8dtsQz9fbKqMQ==
X-Received: by 2002:a7b:c1c5:: with SMTP id a5mr2657143wmj.35.1592467775057;
        Thu, 18 Jun 2020 01:09:35 -0700 (PDT)
Received: from dell ([95.149.164.118])
        by smtp.gmail.com with ESMTPSA id c70sm2436069wme.32.2020.06.18.01.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 01:09:34 -0700 (PDT)
Date:   Thu, 18 Jun 2020 09:09:32 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com, Sebastian Reichel <sre@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-power@fi.rohmeurope.com, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2] MAINTAINERS: Add entry for ROHM power management ICs
Message-ID: <20200618080932.GZ2608702@dell>
References: <20200618073331.GA9403@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200618073331.GA9403@localhost.localdomain>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 18 Jun 2020, Matti Vaittinen wrote:

> Add entry for maintaining power management IC drivers for ROHM
> BD71837, BD71847, BD71850, BD71828, BD71878, BD70528 and BD99954.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> Acked-by: Sebastian Reichel <sre@kernel.org>
> ---
> Morning Lee - could you take this in MFD? This is scattered all around
> different subsystems anyways... I guess crafting bunch of patches to
> each individual subsystems would just end up with lots of merge
> conflicts.

Yes, no problem.  Let's let it sit around for a week or so.  If it
doesn't gain any negative attention, I'll apply it.

> Changes from v1:
> - Dropped patch 2/2 (linear-ranges maintainer) which was already applied by Mark
> - Added shiny new ROHM linux-power list so that I am no longer the lonely
>   poor sod watching these at ROHM side :)
> - sort few files to alphabethical order as checkpatch now nagged about
>   that.
> 
> v1 was here:
> https://lore.kernel.org/lkml/e11366fd280736844ae63791b6193bb84d6205bf.1589866138.git.matti.vaittinen@fi.rohmeurope.com/
> 
> 
>  MAINTAINERS | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
