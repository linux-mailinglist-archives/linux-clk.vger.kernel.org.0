Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B18F1C344F
	for <lists+linux-clk@lfdr.de>; Mon,  4 May 2020 10:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727100AbgEDI0M (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 4 May 2020 04:26:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725941AbgEDI0M (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 4 May 2020 04:26:12 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E877DC061A0F
        for <linux-clk@vger.kernel.org>; Mon,  4 May 2020 01:26:11 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id s8so9515276wrt.9
        for <linux-clk@vger.kernel.org>; Mon, 04 May 2020 01:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=n5utVexByIlwVa1JUCEUjzVIUGqWjCE4M8uVE3TwE+M=;
        b=Jd8QRL+zgOFdBJ/lk24W5lhMdSFlhDdyG8mvpzpm40aTmd75dT6sSm+3fMmxLWJQ5J
         2mHq6FlEDHtKKlj5cyDoY1invckZFXsinicmYZhicr/2IlBmPdgdoDt8gnHxhf0CZm2I
         v9XIwGE04CZNSU45B3Sysd+F17nL6xtmmS05YNIjeN3GuGO/DTe0IPHq5ru2mLT9l/46
         C2cl/drmKkBVdKps2u+TdqAWtXqpoXSwl6g/yFnQt0iIkRd413zULDaBmKwE25VczgGX
         nWi5RQ4TZUjMrq8QMJs8baZNJqMfQNBr9DJbrPMlv4B/t6vw6Z2xtggnwSoH6DoIJQ/R
         S5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=n5utVexByIlwVa1JUCEUjzVIUGqWjCE4M8uVE3TwE+M=;
        b=N6D4+wvtYwZD5Xco24QHFexfctY/IN1W8RwjDzjN59J2IRJ/0RP9jHDBpdmYlLxa4y
         iBkC8vzZRg5SCvP2GVVRzd8r7UUIjnFM8AdeLsma87zFZgCkPLfyphZ8CKUrxmhZ8TGV
         dQ603xvDxkl55saKYBdMHi79utrIYCNDkIuu0JhL3dk7jTA2BzNZKEAr/ZqyI2BnwjIT
         AeeX5A391sht17J3vDSsOsAsYbv1WMbBVzGtUcGGC+Q8CvoKbj7SWgLmCiNynJ3lKOMw
         UjReCj4+ur9B92udq42vQdACw5zBJb09W19I+PaeTw2Vziml9b/d3nUKpXRDUtBg7mka
         ytiQ==
X-Gm-Message-State: AGi0PuaaOHABxHxJo5FfiKhvLCqLVWIhQBeqcIK8nCQ6AJMVxsR/lnnv
        yAKZYiY+lGKUL5EH2kGHPvvwkw==
X-Google-Smtp-Source: APiQypIHlXgPkJWkD3nLibz6TxOMDF7gc3HUQFdp/Sz/FeUzFc3kLlLDwe91THddYROIubCtA0BPBg==
X-Received: by 2002:adf:ab18:: with SMTP id q24mr17475648wrc.214.1588580770615;
        Mon, 04 May 2020 01:26:10 -0700 (PDT)
Received: from dell ([2.31.163.63])
        by smtp.gmail.com with ESMTPSA id r20sm11910698wmh.26.2020.05.04.01.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 01:26:09 -0700 (PDT)
Date:   Mon, 4 May 2020 09:26:08 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Kevin Brodsky <Kevin.Brodsky@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 14/16] vexpress: Move setting master site to
 vexpress-config bus
Message-ID: <20200504082608.GD298816@dell>
References: <20200429205825.10604-1-robh@kernel.org>
 <20200429205825.10604-15-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200429205825.10604-15-robh@kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 29 Apr 2020, Rob Herring wrote:

> There's only a single caller of vexpress_config_set_master() from
> vexpress-sysreg.c. Let's just make the registers needed available to
> vexpress-config and move all the code there. The registers needed aren't
> used anywhere else either. With this, we can get rid of the private API
> between these 2 drivers.
> 
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Acked-by: Liviu Dudau <liviu.dudau@arm.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v2:
>   - Reword subject
> ---
>  drivers/bus/vexpress-config.c | 37 +++++++++++++++++++++++++++++++----

>  drivers/mfd/vexpress-sysreg.c | 25 +----------------------

Acked-by: Lee Jones <lee.jones@linaro.org>

>  include/linux/vexpress.h      |  9 ---------
>  3 files changed, 34 insertions(+), 37 deletions(-)

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
