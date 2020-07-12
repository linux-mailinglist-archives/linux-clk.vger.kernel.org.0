Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9F2F21CA7D
	for <lists+linux-clk@lfdr.de>; Sun, 12 Jul 2020 18:58:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729168AbgGLQ6d (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 12 Jul 2020 12:58:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728844AbgGLQ6d (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 12 Jul 2020 12:58:33 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FFCAC08C5DD
        for <linux-clk@vger.kernel.org>; Sun, 12 Jul 2020 09:58:33 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id ls15so4971468pjb.1
        for <linux-clk@vger.kernel.org>; Sun, 12 Jul 2020 09:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=81VG818pMyCMeObuY0Lnq7OIq0/1trDhkGYhGsXjMvU=;
        b=XsZ93uYy/foX6o8q1xCxtf91N/S/I0+sI4A7mp5vwt3BZzpO0YgKkPWfaRoQeEZfEr
         IV8ZfXq+Diq3fx75WMXuN1b5JKyBqgAXwNC7Eg+fYWvcTwxh0d+x3sRiX1Jd5wCDHEIu
         oW7ui7pe/hwmAqXj8NYconFQauQogPDmYvq4KUOiljqVAxWfL+f3VO6WXCecLYolQun5
         fgvGxQcazTeF0NmxHBbBFfregigq7Go0ywCam77rV0MvAbPOfH64pP5m6DgTszy3byYR
         TCqmoZmBAo/uu/g1ZGXb6J4CjwhiVRmyWLimjOEO1ZHF2k6pE49kFtkSnPnsMiLUrR4T
         Wz4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=81VG818pMyCMeObuY0Lnq7OIq0/1trDhkGYhGsXjMvU=;
        b=nXoPYfIC0O/gW9czVhB2uJ3/Mm2MLu3b2QFec0x57oVqwfUjVx/Qv5TGKUxXeoLjIJ
         +8EzTKkBMTA+amD7et2eNR1549EUWJsSb1Hjtvda4Lg2s5R72BT5Zz5yWPo9oz+ZetNV
         X/ictVO8ZIcfXcNnVXaPQPSu9V7wa4WmqH4O/KeQNE5aNDqPDJmF1jbmIlyeJkQUc6Ta
         p5AkXavRTHa3reY2U+QojXUszyQbURCgA++zgBTfse8/a+MjqoW/eNbmEW01XqxTgicG
         FFpNH3mKcIkPjIyJCV2T4P7ooV7ATjRq6EhbMCWf7IvcZGqG/fs8sfZsmhuUydEqKSIw
         Pf8A==
X-Gm-Message-State: AOAM530Hzdw8O+mug/qQ3NttXQgDFQUQ5ggROckO5h9FCL4ScB18VSJq
        9QsZ89fhKPqMTyrGd9QKN0lI
X-Google-Smtp-Source: ABdhPJxOIZgMYozvqspN0rUdWA6m8Lp+V2Px+VYzdLA+hTYIcHQljXmotPH39K/WfUBHPw3VYXAILQ==
X-Received: by 2002:a17:90a:1f81:: with SMTP id x1mr14677430pja.115.1594573112789;
        Sun, 12 Jul 2020 09:58:32 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6c81:c187:70f5:3123:b5de:e77f])
        by smtp.gmail.com with ESMTPSA id n12sm11003682pgr.88.2020.07.12.09.58.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Jul 2020 09:58:32 -0700 (PDT)
Date:   Sun, 12 Jul 2020 22:28:26 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-actions@lists.infradead.org
Subject: Re: [PATCH v3 6/6] MAINTAINERS: Add reset binding entry for Actions
 Semi Owl SoCs
Message-ID: <20200712165826.GD6110@Mani-XPS-13-9360>
References: <cover.1593788312.git.cristian.ciocaltea@gmail.com>
 <78d63d97e3a8a8f7a9048b6eec74a9d158578833.1593788312.git.cristian.ciocaltea@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78d63d97e3a8a8f7a9048b6eec74a9d158578833.1593788312.git.cristian.ciocaltea@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Jul 03, 2020 at 08:05:12PM +0300, Cristian Ciocaltea wrote:
> Add a reset binding entry to match all members of Actions Semi Owl SoCs.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
> Changes in v3:
>  - Removed the "-reset.h" suffix from the binding entry, as suggested
>    by Mani
> 
> Changes in v2:
>  - None
> 
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 496fd4eafb68..5033de342f31 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1533,6 +1533,7 @@ F:	drivers/mmc/host/owl-mmc.c
>  F:	drivers/pinctrl/actions/*
>  F:	drivers/soc/actions/
>  F:	include/dt-bindings/power/owl-*
> +F:	include/dt-bindings/reset/actions,*
>  F:	include/linux/soc/actions/
>  N:	owl
>  
> -- 
> 2.27.0
> 
