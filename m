Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 955073E09C9
	for <lists+linux-clk@lfdr.de>; Wed,  4 Aug 2021 23:03:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240094AbhHDVD3 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 4 Aug 2021 17:03:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240060AbhHDVDX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 Aug 2021 17:03:23 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1048C06179B
        for <linux-clk@vger.kernel.org>; Wed,  4 Aug 2021 14:03:07 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id m12so1817485qvt.1
        for <linux-clk@vger.kernel.org>; Wed, 04 Aug 2021 14:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zdp6WltwdPJTiYOXAA38Zmu1ytNFtDVTLeWSJfJQUTA=;
        b=pYDFpii+lgAAPWns/N8L4Cmo0xyRztJF7JYeWgj8oHRZZO0s6PKpyDemjtdowSWg/S
         t/RRf2/vebxyVqxstAUzy1XQVdpo8U8CcM+yCecg6xK1+EBidwwDlR2nd79tC2teo5oe
         ZCU+GD5GpyO+cpGLLnCG9QZHL7wgVOIa2+Z78QvHvuPFzFbA5+hmYx8TocrlDUcXnwKN
         s7P1cVm4hI9QbQd5xaUp9Tsl9IAFgJAZBcz6tbSZ2qOmwBCbqsRGxKd7EdvtOugP08lB
         9F/qPbRjJ9qKRp4eN5wwt4phJ1ZXLovPrW7FFMti7r/jNmc5C6U/6nY50hYv5ByHBdo+
         rNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zdp6WltwdPJTiYOXAA38Zmu1ytNFtDVTLeWSJfJQUTA=;
        b=S/riMeVGham7LCdS7qing6AMCVmH+BxwuGGKAAGK31wmePFg6csYSY5pu5W1MX3Ysc
         KFJuI3PrRdBqCsiYOMH0RS95prlXmkiTIVH793m2tK8VvwQgkw3jYjq11B026nAoyWVx
         KlBCGQvg4BVD+t4smPG8QipqHR8jBMvQD2J5H1vQ28oi89aEd8RCZdVL1GPh4OgPQ9an
         jHzoKmQFDygQjs55FQtAXXbt6K2RvaxjZrEOjNISPtehyzt0ij5J7FnNdtQmvothw7F4
         fP8djtx0u9TDolzmIva/kI/cJWh/kHyPAUqZLcLyrc4xXP3/nuNnexepJ1JMNhdKEe5k
         jkIQ==
X-Gm-Message-State: AOAM532cTFzP+Pay9eWiK6/Y0y6iNdR95FRzhxJmDb8Qh1H15xJFKEOv
        OmevxaLLpON7MlGNXB7igcrZR+M/ygjSyAxabO665A==
X-Google-Smtp-Source: ABdhPJwzRxAtYtsckH8eXVYGse7q8J4o42yWbF/cUsPjzKXnvsENpPibR4PjjuetgtQCFE0DxrNZ7FJB/59wegVXnLA=
X-Received: by 2002:a0c:aa42:: with SMTP id e2mr1547891qvb.23.1628110987030;
 Wed, 04 Aug 2021 14:03:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210731195034.979084-1-dmitry.baryshkov@linaro.org>
 <20210731195034.979084-2-dmitry.baryshkov@linaro.org> <CAJZ5v0gWD8WSQU4oPMSdZFM9VpNpc4TAFJ=_wQLB60XFxw-Ciw@mail.gmail.com>
In-Reply-To: <CAJZ5v0gWD8WSQU4oPMSdZFM9VpNpc4TAFJ=_wQLB60XFxw-Ciw@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 5 Aug 2021 00:02:54 +0300
Message-ID: <CAA8EJpq5DB2a=C+eo_S7QgVMzpm=mvUcC4DkWwGoKQ1g8trmgA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] PM: runtime: add devm_pm_runtime_enable helper
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Pavel Machek <pavel@ucw.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 4 Aug 2021 at 21:07, Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Sat, Jul 31, 2021 at 9:50 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > A typical code pattern for pm_runtime_enable() call is to call it in the
> > _probe function and to call pm_runtime_disable() both from _probe error
> > path and from _remove function. For some drivers the whole remove
> > function would consist of the call to pm_remove_disable().
> >
> > Add helper function to replace this bolierplate piece of code. Calling
> > devm_pm_runtime_enable() removes the need for calling
> > pm_runtime_disable() both in the probe()'s error path and in the
> > remove() function.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/base/power/runtime.c | 17 +++++++++++++++++
> >  include/linux/pm_runtime.h   |  4 ++++
> >  2 files changed, 21 insertions(+)
> >
> > diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
> > index 8a66eaf731e4..ec94049442b9 100644
> > --- a/drivers/base/power/runtime.c
> > +++ b/drivers/base/power/runtime.c
> > @@ -1447,6 +1447,23 @@ void pm_runtime_enable(struct device *dev)
> >  }
> >  EXPORT_SYMBOL_GPL(pm_runtime_enable);
> >
> > +static void pm_runtime_disable_action(void *data)
> > +{
> > +       pm_runtime_disable(data);
> > +}
> > +
> > +/**
> > + * devm_pm_runtime_enable - devres-enabled version of pm_runtime_enable.
> > + * @dev: Device to handle.
> > + */
> > +int devm_pm_runtime_enable(struct device *dev)
> > +{
> > +       pm_runtime_enable(dev);
> > +
> > +       return devm_add_action_or_reset(dev, pm_runtime_disable_action, dev);
>
> When exactly is pm_runtime_disable_action() going to run by this rule?
>  When the device goes away or when the driver is unbound from it?

When the driver is unbound (either because probe() returns an error or
because __device_release_driver() is being called).
This corresponds to a typical call to pm_runtime_disable() from the
probe()'s error path or in the remove() callback.

> > +}
> > +EXPORT_SYMBOL_GPL(devm_pm_runtime_enable);
> > +
> >  /**
> >   * pm_runtime_forbid - Block runtime PM of a device.
> >   * @dev: Device to handle.
> > diff --git a/include/linux/pm_runtime.h b/include/linux/pm_runtime.h
> > index aab8b35e9f8a..222da43b7096 100644
> > --- a/include/linux/pm_runtime.h
> > +++ b/include/linux/pm_runtime.h
> > @@ -59,6 +59,8 @@ extern void pm_runtime_put_suppliers(struct device *dev);
> >  extern void pm_runtime_new_link(struct device *dev);
> >  extern void pm_runtime_drop_link(struct device_link *link);
> >
> > +extern int devm_pm_runtime_enable(struct device *dev);
> > +
> >  /**
> >   * pm_runtime_get_if_in_use - Conditionally bump up runtime PM usage counter.
> >   * @dev: Target device.
> > @@ -253,6 +255,8 @@ static inline void __pm_runtime_disable(struct device *dev, bool c) {}
> >  static inline void pm_runtime_allow(struct device *dev) {}
> >  static inline void pm_runtime_forbid(struct device *dev) {}
> >
> > +static inline int devm_pm_runtime_enable(struct device *dev) { return 0; }
> > +
> >  static inline void pm_suspend_ignore_children(struct device *dev, bool enable) {}
> >  static inline void pm_runtime_get_noresume(struct device *dev) {}
> >  static inline void pm_runtime_put_noidle(struct device *dev) {}
> > --
> > 2.30.2
> >



-- 
With best wishes
Dmitry
