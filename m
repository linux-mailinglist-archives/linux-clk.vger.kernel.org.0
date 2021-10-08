Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03016426D84
	for <lists+linux-clk@lfdr.de>; Fri,  8 Oct 2021 17:31:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242780AbhJHPdl (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 8 Oct 2021 11:33:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242961AbhJHPdi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Oct 2021 11:33:38 -0400
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59475C061762
        for <linux-clk@vger.kernel.org>; Fri,  8 Oct 2021 08:31:43 -0700 (PDT)
Received: by mail-vs1-xe29.google.com with SMTP id o124so10994597vsc.6
        for <linux-clk@vger.kernel.org>; Fri, 08 Oct 2021 08:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wfDWQNp2UL5+jS6p6MxQkSeoBswEyDZEW6ZvRWiqAYE=;
        b=FG4nizPJKDttHDSuuLn3c6p8Myl+TE1ZajoLc02DiK82T5KiV2nzbAt9Lv37fLIA8x
         jKWygR3yU4GfALjLvhn9RMbmj/MaEHuxJgQEoSfc5lYuqIkrvBvRubGjJHE63lSnPr1B
         QTFecQ9I+HD1MPhI5wHPc4d0fh3EkJfZl/pqaQT9QiF3n1eJoI8wIO0hbET6LovqlLUG
         idSGGFCcJz6UCgWODWsu5YjmH08T+PLc0TXKMwKEPjR5fsPatYxvLH8cm6U75QRAx9xo
         x0+OJbzzXys4T0ZoXT5HVbErDYC6s1LvqGnsBCkjOLwX9Ue7hn4MVNOPWPtT9ip/m4Ds
         EZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wfDWQNp2UL5+jS6p6MxQkSeoBswEyDZEW6ZvRWiqAYE=;
        b=SJo3jsror7cVQmK3YoQYm2+PxO+oiT6iPPKfuqxbNHJ9UgzKFYdlHGeF4r28dLegqc
         hzAOWfFwanEcXmKCSi97t0ku/7MU7l0yxfGV7Acvfaj2kP4VkTfwc8Nz2T+SOd6FiIK3
         oxduH7zFv7oAc0lvBBRMJxs2mxaut8AbMtprAbbsWu4uIPQ8K/uyxHXNs0f6tIz7X0p/
         U96VHT8gVTrkt0B+7hclZRWtyK0188KBUMOFzuFdhniRb+imkNJaW/JursUgZGKRJKwj
         zBOxZ+HNxcssDBlFEgKctgaoKbBC90OVhtSPmNyMnAUFaKgqOPPpKPqe+evh9msW3msU
         vymA==
X-Gm-Message-State: AOAM531w7ESZl9LLvxq3KdxmYTRSa3z8F0w/EeRS3ctnuNzx7Uj/IeBc
        /a2Xa2lYRVv19Iq5eShwX+MbpCJBpcWNyr3scc+5tQ==
X-Google-Smtp-Source: ABdhPJyvkGFu2hMnsDq29OMlmBSQiVg7L1kDuYFftacecAIHtbfGGV1GkOkzVRQpb7mW2uyOr4/ZNuPmO90t1XUAn1k=
X-Received: by 2002:a67:d91b:: with SMTP id t27mr11899992vsj.55.1633707102322;
 Fri, 08 Oct 2021 08:31:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211007194113.10507-1-semen.protsenko@linaro.org>
 <20211007194113.10507-4-semen.protsenko@linaro.org> <abe4bdeb-ee15-d8c8-54af-1cdf7282b004@canonical.com>
In-Reply-To: <abe4bdeb-ee15-d8c8-54af-1cdf7282b004@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 8 Oct 2021 18:31:30 +0300
Message-ID: <CAPLW+4mM978QS8ce9ipnhAPc0ge2H8+ZZ5bsc=7Ryq4-yL8NQw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] dt-bindings: clock: Add bindings definitions for
 Exynos850 CMU
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 8 Oct 2021 at 09:45, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 07/10/2021 21:41, Sam Protsenko wrote:
> > Clock controller driver is designed to have separate instances for each
> > particular CMU. So clock IDs in this bindings header also start from 1
> > for each CMU.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> > Acked-by: Rob Herring <robh@kernel.org>
> > ---
> > Changes in v2:
> >   - Added all clock ids
> >   - Added CLK_ prefix for all clock constants
> >   - Added R-b tag by Krzysztof Kozlowski
> >   - Added Ack tag by Rob Herring
> >
> >  include/dt-bindings/clock/exynos850.h | 141 ++++++++++++++++++++++++++
> >  1 file changed, 141 insertions(+)
> >  create mode 100644 include/dt-bindings/clock/exynos850.h
> >
> > diff --git a/include/dt-bindings/clock/exynos850.h b/include/dt-bindings/clock/exynos850.h
> > new file mode 100644
> > index 000000000000..a44c5f91d3c7
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/exynos850.h
> > @@ -0,0 +1,141 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
>
> The bindings are preferred to be under GPL-2.0+BSD. I don't know about
> such policy for the headers but it seems reasonable - allows re-usage in
> other systems. Do you mind licensing it under:
> GPL-2.0-only or BSD-2-Clause
> ?
>

Sure, will do in v3.

> Best regards,
> Krzysztof
>
> > +/*
> > + * Copyright (C) 2021 Linaro Ltd.
> > + * Author: Sam Protsenko <semen.protsenko@linaro.org>
> > + *
> > + * Device Tree binding constants for Exynos850 clock controller.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_CLOCK_EXYNOS_850_H
> > +#define _DT_BINDINGS_CLOCK_EXYNOS_850_H
> > +
> > +/* CMU_TOP */
