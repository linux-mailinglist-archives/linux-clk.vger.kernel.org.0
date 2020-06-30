Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76CB820EF07
	for <lists+linux-clk@lfdr.de>; Tue, 30 Jun 2020 09:11:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730722AbgF3HLV (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 30 Jun 2020 03:11:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730637AbgF3HLT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 Jun 2020 03:11:19 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A12FC03E97B
        for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2020 00:11:19 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id h5so18964952wrc.7
        for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2020 00:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=K64/PWzIdJHy6AMq0CI1QxWBigdrJv6e4jIUjK6qkD0=;
        b=QwrOy5cCVRKI+Mspy8/CQFQQfjsIENqMArQcy6wu3W/FJtySPw8sfwnWO6wClLrdPR
         0t7Oiq1odHqpiKZG0L2OYdCDBz/1WEJDhsvFhR//xeQ+2hO6Kr80/All8equ1NCLTOYN
         2/Ydpyf3BWL3S6vyhCzZjGJZ4Qyn+y9NQfGiCgPf7TIoaIiHJQP4IiMFN8r/07C7ELzy
         dLV8FWsyiBN80NWS+vmM6O+PaF6qF/lrtht7CavF0JYAIsmWriZykdA2mxyKPqUTEJDw
         5WbXMJysulDXVFL02NFQ7frxgHN6CQpEVRjgjy+zybl6G0giruv4u8Qi6HcD/A3fcC2+
         en8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=K64/PWzIdJHy6AMq0CI1QxWBigdrJv6e4jIUjK6qkD0=;
        b=L9a6LDnWE7yHSCXHsULfy6Uw38TBGQ4cLXpOQK+avA2Dl1WBn72A5uc1zOrgcvr4TN
         8DYqdUtkNll5rSzCirm+uYlnGHAHnrqN2MfvnnhlpQQ+zZiwXxeyKxqjdfFji2ZslB1D
         9KpUlYZzNwdPmUgj3vq99Ilfo1C5jn5gzhbK4a/3GH2oviCndghsmN+MOOlW6+3O3Y02
         cOta+fJg/5/lA8Nj+jjfR0oJGQUCuMrpUaV1mORZPLOfHYOnMvSlICc+lrwFUzIih9QS
         6scG//tRD0kQacr2/FhrnVGdKri2WOBHVOKXVyrOpPfbHDxGMC70KL0bJ8qpmDMsaSze
         gy4w==
X-Gm-Message-State: AOAM531ULecSxH3msZp7dikoGI2+oAmSH77gvSKMS4Z7b79WJdU8f0nP
        9EU2zVYK/GMWO0tz/Efk/IVdig==
X-Google-Smtp-Source: ABdhPJwZssKxM2tBc6NCDnk4r2tWfyhz2turH5uFie+KVPTCYv0GHzeKD3NWkCZuHCFBkEVXD3Bc/Q==
X-Received: by 2002:adf:f350:: with SMTP id e16mr19880821wrp.43.1593501077875;
        Tue, 30 Jun 2020 00:11:17 -0700 (PDT)
Received: from dell ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id k20sm2459432wmi.27.2020.06.30.00.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 00:11:17 -0700 (PDT)
Date:   Tue, 30 Jun 2020 08:11:15 +0100
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
Message-ID: <20200630071115.GG1179328@dell>
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
> 
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

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
