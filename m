Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E5D75EF47E
	for <lists+linux-clk@lfdr.de>; Thu, 29 Sep 2022 13:41:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235029AbiI2LlH (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 29 Sep 2022 07:41:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233190AbiI2LlG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Sep 2022 07:41:06 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7A4C130725
        for <linux-clk@vger.kernel.org>; Thu, 29 Sep 2022 04:41:05 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id l22so108108edj.5
        for <linux-clk@vger.kernel.org>; Thu, 29 Sep 2022 04:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=Dw83wxyiv8d9x5gzkn+1kB/8arfTKV9yvRNBKmJCj1w=;
        b=HYhIixFmCMcXWuK0s+gqC/gCRpGPJvlcnCY0+n5kIOvBMxShrjzttWLHNjaFgQbehG
         mU9l+hsqyFarc1jW/xT3lTrQiPEdHr/hrvYoIKvN5DS2cZq5IY3mi0FWT17CO191utFO
         H86TI/w8jonw+bEnTxU5yB5wy+8W++oe6BFaGBESddWmETX2UjFQHdFSurvwLlvfD1y/
         A3ggxGJ65FoD0Kim9IqtCeT5GvltP5mMY53nuqvA6iGp1JMmjxpCe/wtbQGThVo+NcBw
         oEhhXd8eFdXXt36bijLPz3+eElPV3m7Pv+PpaH5R/fcUZc3fx1iMbNNnkMYEgT10Z5jG
         o3YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=Dw83wxyiv8d9x5gzkn+1kB/8arfTKV9yvRNBKmJCj1w=;
        b=aZ9JMPHjzUjl4I5cObL9r6lhQabA3fWcSHzT7WbPUUz7zVlzqOO+wpmiosYXtGiWw+
         4SJx1//+jPqtMRVi6r02/woaCsVzh8TTUmoCV1hxvYeI7SDP/NnQunU6NjZdKSGOXiGB
         Z2SwGR6dNLLX+I/OvVNTb3KD41IFOalmKvexX1ZpAj/lUGFrsFeQw9tAJcNOHlY/nZzc
         Y2OUGWmTsR0wYkhZtfalQZkENKGJIr3ORg84ljSbfqfqW8001kJumeMAPPALGRF1PjWH
         a3rqTHZSA/EIzJBhv1wUe50nGbiHPqE9lgclm0/JN/jBDOuB4zs7cjmDcnicmj2vucwz
         iUmQ==
X-Gm-Message-State: ACrzQf0b5IQtUVwvK481rQhWj8dMXWerHVtyTgj+Iv2w+Mp2FKr4kyoI
        yGZnw3tU+taDlbX41z4iY/nlQg==
X-Google-Smtp-Source: AMsMyM7PI78XuR+onhPJYVzNFqVptvRezUc+DvwBLhZWgOXy6OHV4kaokvdBly8hqNswcRHqhAckJg==
X-Received: by 2002:a05:6402:50cc:b0:451:bf26:8c51 with SMTP id h12-20020a05640250cc00b00451bf268c51mr3041588edb.336.1664451664374;
        Thu, 29 Sep 2022 04:41:04 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id g15-20020aa7d1cf000000b0044e937ddcabsm5265346edp.77.2022.09.29.04.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 04:41:03 -0700 (PDT)
Date:   Thu, 29 Sep 2022 13:40:57 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Vadim Fedorenko <vfedorenko@novek.ru>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Vadim Fedorenko <vadfed@fb.com>, Aya Levin <ayal@nvidia.com>,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/3] Create common DPLL/clock configuration API
Message-ID: <YzWESUXPwcCo67LP@nanopsycho>
References: <20220626192444.29321-1-vfedorenko@novek.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220626192444.29321-1-vfedorenko@novek.ru>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Sun, Jun 26, 2022 at 09:24:41PM CEST, vfedorenko@novek.ru wrote:
>From: Vadim Fedorenko <vadfed@fb.com>
>
>Implement common API for clock/DPLL configuration and status reporting.
>The API utilises netlink interface as transport for commands and event
>notifications. This API aim to extend current pin configuration and
>make it flexible and easy to cover special configurations.

Do you have the userspace part somewhere?
It is very nice to add example outputs of user cmdline of such tool to
the patch description/cover letter.

Also, did you consider usage of sysfs? Why it isn't a better fit than
netlink?

Regarding the naming, is "dpll" the correct one. Forgive me for being a
syncE greenie, but isn't dpll just one algo to achieve syntonous
clocks? Perhaps "dco" as for "Digitally Controlled Oscillator" would be
somewhat better fit?


>
>v1 -> v2:
> * implement returning supported input/output types
> * ptp_ocp: follow suggestions from Jonathan
> * add linux-clk mailing list
>v0 -> v1:
> * fix code style and errors
> * add linux-arm mailing list
>
>
>Vadim Fedorenko (3):
>  dpll: Add DPLL framework base functions
>  dpll: add netlink events
>  ptp_ocp: implement DPLL ops
>
> MAINTAINERS                 |   8 +
> drivers/Kconfig             |   2 +
> drivers/Makefile            |   1 +
> drivers/dpll/Kconfig        |   7 +
> drivers/dpll/Makefile       |   7 +
> drivers/dpll/dpll_core.c    | 161 ++++++++++
> drivers/dpll/dpll_core.h    |  40 +++
> drivers/dpll/dpll_netlink.c | 595 ++++++++++++++++++++++++++++++++++++
> drivers/dpll/dpll_netlink.h |  14 +
> drivers/ptp/Kconfig         |   1 +
> drivers/ptp/ptp_ocp.c       | 169 +++++++---
> include/linux/dpll.h        |  29 ++
> include/uapi/linux/dpll.h   |  81 +++++
> 13 files changed, 1079 insertions(+), 36 deletions(-)
> create mode 100644 drivers/dpll/Kconfig
> create mode 100644 drivers/dpll/Makefile
> create mode 100644 drivers/dpll/dpll_core.c
> create mode 100644 drivers/dpll/dpll_core.h
> create mode 100644 drivers/dpll/dpll_netlink.c
> create mode 100644 drivers/dpll/dpll_netlink.h
> create mode 100644 include/linux/dpll.h
> create mode 100644 include/uapi/linux/dpll.h
>
>-- 
>2.27.0
>
