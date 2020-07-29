Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7472231B0B
	for <lists+linux-clk@lfdr.de>; Wed, 29 Jul 2020 10:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727885AbgG2ISl (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 29 Jul 2020 04:18:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727044AbgG2ISk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Jul 2020 04:18:40 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B256C061794
        for <linux-clk@vger.kernel.org>; Wed, 29 Jul 2020 01:18:39 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id df16so416020edb.9
        for <linux-clk@vger.kernel.org>; Wed, 29 Jul 2020 01:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xvxyjwl1Zq8e84u08zFLgcKDZLY0RcVfXlHy+Lt6fac=;
        b=FBCR2aA2bQ121FWaRdsh3p/p0OjGMqxeMBSzfGUgQfIfWo+5s2Hqz8IGL8Wau9joZV
         hleUEaWAr1MBJgFHmQrvaxdcubILzxve7ZJunTYiBpIOfRNoHYvaO2yudmaedj0TFoZF
         X24C5pmOVEJ9KjB2g1W2v1fh/ENk1sjIGJ4L3VbFKy/DovFf6xqocUr/xqgQELIkwBxp
         s4qSgvKw32zI5j22YDpGvgrZS3wyK4zLAzpglUn9b4v0h0XyePrO/tCpxxcyPKCL5Jk7
         MDC03vdoqKsZM0HFNJkESJTo7BT62XNUEy2vcjFu9Sz8xTyzBTtE7GkD+c7FKBorh/Fs
         WONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xvxyjwl1Zq8e84u08zFLgcKDZLY0RcVfXlHy+Lt6fac=;
        b=g6U8JJeDUey7dxNOh7FSwSX9FSIeF+u0Gwacw8ynnHMWXHI1K4IGdIQxGDS0XTzmmh
         6DpNOcsmRAZtC8yo2PYZ3KM+Tlnu+IPJeAbERJv75s9K3g0zgS7q7G2EEoIECN4fwRVi
         g8spWAiG8t81m46sQLGHoM/2oEBGJGSV9IKr8oYEPkFz4+arC2XHn/q2BUpuAC+kvxEg
         +AHkaRHCK4ew/p8Aacc03FmTSALu1bnv0aVAp/VQnkvp80XnhkRamRYiMtfkwWXTqRn7
         5DJnRW0YaX0nI/KCYrK/WqmZw4nhpd6yYofcaqsiXIp4N99ZhY2h6ZxqD6x+lhFUrf+H
         QZKQ==
X-Gm-Message-State: AOAM531wp93eEk33GJfJ8yyxXPKy1s2148ICZOumYolWQ5+GIeNLHXHW
        7p17UcJnyf11Hjwv5HfBaxN3eUoUkd/6+6tYRLc=
X-Google-Smtp-Source: ABdhPJxZMfTNUeXJM0SGigzKriD+NN0szyTWSBDvTFsNGDD5qgu7eT/mxUlG43ZDj6yQXbHrwWQybPWqhnERoynnUF0=
X-Received: by 2002:a05:6402:1803:: with SMTP id g3mr28708635edy.377.1596010718092;
 Wed, 29 Jul 2020 01:18:38 -0700 (PDT)
MIME-Version: 1.0
References: <1596009618-25516-1-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1596009618-25516-1-git-send-email-aisheng.dong@nxp.com>
From:   Dong Aisheng <dongas86@gmail.com>
Date:   Wed, 29 Jul 2020 16:04:11 +0800
Message-ID: <CAA+hA=RjwtWLA1aSoNHakHDASrk0+EYy+ayPBw-7ninrYrWFJw@mail.gmail.com>
Subject: Re: [PATCH v7 00/11] clk: imx8: add new clock binding for better pm support
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

This patchset addressed all your new comments.
Right now only Patch 2/3 still haven't got any R-b or A-b tags. So
still need your help to review.
All other patches already got the R-b tags.

BTW, for [PATCH v7 02/11] dt-bindings: clock: imx-lpcg: add support to parse
 clocks from device tree.
It was reviewed by Rob/Shawn and you before, however, due to the legacy binding
file has been removed and changed to json format.
So this patch also updated to json format accordingly based on the
former reviewed patch
and need a re-review.

Regards
Aisheng

On Wed, Jul 29, 2020 at 4:04 PM Dong Aisheng <aisheng.dong@nxp.com> wrote:
>
> This patch series is a preparation for the MX8 Architecture improvement.
> As for IMX SCU based platforms like MX8QM and MX8QXP, they are comprised
> of a couple of SS(Subsystems) while most of them within the same SS
> can be shared. e.g. Clocks, Devices and etc.
>
> However, current clock binding is using SW IDs for device tree to use
> which can cause troubles in writing the common <soc>-ss-xx.dtsi file for
> different SoCs.
>
> This patch series aims to introduce a new binding which is more close to
> hardware and platform independent and can makes us write a more general
> drivers for different SCU based SoCs.
>
> Another important thing is that on MX8, each Clock resource is associated
> with a power domain. So we have to attach that clock device to the power
> domain in order to make it work properly. Further more, the clock state
> will be lost when its power domain is completely off during suspend/resume,
> so we also introduce the clock state save&restore mechanism.
>
> It's based on latest shanw/for-next branch.
>
> The top commit is:
> 3c1a41dab7b8 Merge branch 'imx/defconfig' into for-next
>
> ChangeLog:
> v6->v7:
>  * addressed all comments from Stephen
>  * rebased to latest shawn/for-next
> v5->v6:
>  * add scu clk unregister if add provider failed
> v4->v5:
>  * Address all comments from Stephen
> v3->v4:
>  * use clk-indices for LPCG to fetch each clks offset from dt
> v2->v3:
>  * change scu clk into two cells binding
>  * add clk pm patches to ease the understand of the changes
> v1->v2:
>  * SCU clock changed to one cell clock binding inspired by arm,scpi.txt
>    Documentation/devicetree/bindings/arm/arm,scpi.txt
>  * Add required power domain property
>  * Dropped PATCH 3&4 first, will send the updated version accordingly
>    after the binding is finally determined,
>
> Dong Aisheng (11):
>   dt-bindings: firmware: imx-scu: new binding to parse clocks from
>     device tree
>   dt-bindings: clock: imx-lpcg: add support to parse clocks from device
>     tree
>   clk: imx: scu: add two cells binding support
>   clk: imx: scu: bypass cpu power domains
>   clk: imx: scu: allow scu clk to take device pointer
>   clk: imx: scu: add runtime pm support
>   clk: imx: scu: add suspend/resume support
>   clk: imx: imx8qxp-lpcg: add parsing clocks from device tree
>   clk: imx: lpcg: allow lpcg clk to take device pointer
>   clk: imx: clk-imx8qxp-lpcg: add runtime pm support
>   clk: imx: lpcg: add suspend/resume support
>
>  .../bindings/arm/freescale/fsl,scu.txt        |  12 +-
>  .../bindings/clock/imx8qxp-lpcg.yaml          |  79 ++++--
>  drivers/clk/imx/clk-imx8qxp-lpcg.c            | 139 +++++++++++
>  drivers/clk/imx/clk-imx8qxp.c                 | 136 +++++-----
>  drivers/clk/imx/clk-lpcg-scu.c                |  53 +++-
>  drivers/clk/imx/clk-scu.c                     | 234 +++++++++++++++++-
>  drivers/clk/imx/clk-scu.h                     |  56 ++++-
>  include/dt-bindings/clock/imx8-lpcg.h         |  14 ++
>  8 files changed, 620 insertions(+), 103 deletions(-)
>  create mode 100644 include/dt-bindings/clock/imx8-lpcg.h
>
> --
> 2.23.0
>
