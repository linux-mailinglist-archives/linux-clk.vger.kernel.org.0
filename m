Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8CF3231C1
	for <lists+linux-clk@lfdr.de>; Mon, 20 May 2019 12:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730955AbfETKvE (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 20 May 2019 06:51:04 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42109 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730763AbfETKvE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 May 2019 06:51:04 -0400
Received: by mail-pl1-f193.google.com with SMTP id x15so6544681pln.9
        for <linux-clk@vger.kernel.org>; Mon, 20 May 2019 03:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YW9HGM19uXsoCoTdRY5JIfYDHKn9S6uoZXsNTuG/dJI=;
        b=nwKyM/IEfq5ctjmYY2jYx0QaToWYb1YEuO/QgxBA8FfWHLb8CsKObYDEvzR49aMFbv
         +oCYec9BmqEYalYo6wUQNHs7NdIb1s+BWbibEgPSe9CFiJGZ4EnF9Ze+cz3e34PXLu0Z
         Go6tkBaHkP6bJEkNUalms35nw8zGwJ2+hihxeooKztv5hmF4OIS+gPeX2oceCcAy+Q4u
         G6iAB3C7xRw07Jb/+F1MEC0tjWHjS29c2NSQhCOIEQcvF9TjNmzN/J2P5WzstB/HuOJz
         D6hwHrVl3td8rIgJIFKzxV/iAjMFTAiJo3fBbK2T9R78xEwU0jkt1bBYhv+P95sZ/cQ5
         ueaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YW9HGM19uXsoCoTdRY5JIfYDHKn9S6uoZXsNTuG/dJI=;
        b=kPa0qkaUfadJf8aPGKI/A4STXvhEyMqRdqQi6iSfFISNvG6L6tR+hFLzgWhqDJ7ylH
         7L2oI/FbPWREpg22dSaZNQIqTyA+kiF8H4caosM3q/lsdtxHOm6nCiG3qRSgbC6CsHaJ
         ScLf5DQcSZA3kAtdKPZaEZbLv5JXJBqS/7ZRBKBID5ZGLIpE/VIwpmjbisRCTuHwEGSx
         L2OZE+uHy2zfReQ8uZmiqNfVSpcMGUdEYX279i9OZCeOl3VTdb75oUBOHzj26Wc1xQ9p
         nS8WKlxAJYRwSzWIPOmr9pPT3WeYPx0wXybxQ5S9K5ZbBQaK1m0RwUK7VyAbr3aBlqKH
         19KA==
X-Gm-Message-State: APjAAAWnb8A6mDHnd77R+mVz7l7OxnQs34NE8Ycu9BMoohb8RgNjkG/s
        M6ZDlcBz5e0wSGchO9S+zA5h0Q==
X-Google-Smtp-Source: APXvYqwLPnoz4Sab1bFclPQh5T547o374DXWd3I8Z4Z2RFohtUgkOKBd841X9Qsjl4Wl44THZDVQjQ==
X-Received: by 2002:a17:902:b20f:: with SMTP id t15mr54482368plr.220.1558349463660;
        Mon, 20 May 2019 03:51:03 -0700 (PDT)
Received: from localhost ([122.172.118.99])
        by smtp.gmail.com with ESMTPSA id 63sm24202008pfu.95.2019.05.20.03.51.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 03:51:02 -0700 (PDT)
Date:   Mon, 20 May 2019 16:21:00 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     stefan.wahren@i2se.com, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        mbrugger@suse.de, sboyd@kernel.org, eric@anholt.net,
        f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        ptesarik@suse.com, linux-rpi-kernel@lists.infradead.org,
        ssuloev@orpaltech.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC v2 5/5] cpufreq: add driver for Raspbery Pi
Message-ID: <20190520105100.hol6cmvnsf3exzes@vireshk-i7>
References: <20190520104708.11980-1-nsaenzjulienne@suse.de>
 <20190520104708.11980-6-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190520104708.11980-6-nsaenzjulienne@suse.de>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 20-05-19, 12:47, Nicolas Saenz Julienne wrote:
> Raspberry Pi's firmware offers and interface though which update it's
> performance requirements. It allows us to request for specific runtime
> frequencies, which the firmware might or might not respect, depending on
> the firmware configuration and thermals.
> 
> As the maximum and minimum frequencies are configurable in the firmware
> there is no way to know in advance their values. So the Raspberry Pi
> cpufreq driver queries them, builds an opp frequency table to then
> launch cpufreq-dt.
> 
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> ---
>  drivers/cpufreq/Kconfig.arm           |  8 +++
>  drivers/cpufreq/Makefile              |  1 +
>  drivers/cpufreq/raspberrypi-cpufreq.c | 83 +++++++++++++++++++++++++++
>  3 files changed, 92 insertions(+)
>  create mode 100644 drivers/cpufreq/raspberrypi-cpufreq.c
> 
> diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
> index 179a1d302f48..f6eba7ae50d0 100644
> --- a/drivers/cpufreq/Kconfig.arm
> +++ b/drivers/cpufreq/Kconfig.arm
> @@ -308,3 +308,11 @@ config ARM_PXA2xx_CPUFREQ
>  	  This add the CPUFreq driver support for Intel PXA2xx SOCs.
>  
>  	  If in doubt, say N.
> +
> +config ARM_RASPBERRYPI_CPUFREQ
> +	tristate "Raspberry Pi cpufreq support"
> +	depends on RASPBERRYPI_FIRMWARE || COMPILE_TEST
> +	help
> +	  This adds the CPUFreq driver for Raspberry Pi
> +
> +	  If in doubt, say N.
> diff --git a/drivers/cpufreq/Makefile b/drivers/cpufreq/Makefile
> index 689b26c6f949..02678e9b2ff5 100644
> --- a/drivers/cpufreq/Makefile
> +++ b/drivers/cpufreq/Makefile
> @@ -84,6 +84,7 @@ obj-$(CONFIG_ARM_TEGRA124_CPUFREQ)	+= tegra124-cpufreq.o
>  obj-$(CONFIG_ARM_TEGRA186_CPUFREQ)	+= tegra186-cpufreq.o
>  obj-$(CONFIG_ARM_TI_CPUFREQ)		+= ti-cpufreq.o
>  obj-$(CONFIG_ARM_VEXPRESS_SPC_CPUFREQ)	+= vexpress-spc-cpufreq.o
> +obj-$(CONFIG_ARM_RASPBERRYPI_CPUFREQ) 	+= raspberrypi-cpufreq.o

My bad sorry, I noticed this earlier and forgot to comment. The above
two files are maintained in alphabetical order, please add the entries
at relevant places.
  
>  ##################################################################################
> diff --git a/drivers/cpufreq/raspberrypi-cpufreq.c b/drivers/cpufreq/raspberrypi-cpufreq.c
> new file mode 100644
> index 000000000000..a85988867d56
> --- /dev/null
> +++ b/drivers/cpufreq/raspberrypi-cpufreq.c
> @@ -0,0 +1,83 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Raspberry Pi cpufreq driver
> + *
> + * Copyright (C) 2019, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> + */
> +
> +#include <linux/of.h>
> +#include <linux/clk.h>
> +#include <linux/cpu.h>
> +#include <linux/module.h>
> +#include <linux/pm_opp.h>
> +#include <linux/cpufreq.h>
> +#include <linux/platform_device.h>

Would be better to keep above in alphabetical order as well.

Please don't send another version now and wait for comments on the
other patches.

-- 
viresh
