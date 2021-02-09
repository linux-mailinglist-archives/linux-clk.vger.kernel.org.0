Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09EAE31592A
	for <lists+linux-clk@lfdr.de>; Tue,  9 Feb 2021 23:11:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233440AbhBIWKN (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 9 Feb 2021 17:10:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233637AbhBIWHM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 Feb 2021 17:07:12 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06CD6C08EB2F
        for <linux-clk@vger.kernel.org>; Tue,  9 Feb 2021 13:55:30 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id d184so8381189ybf.1
        for <linux-clk@vger.kernel.org>; Tue, 09 Feb 2021 13:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/PGZ6373hwX21uII2yTNlUq0BGVrzE4VOh9IUqL/yOY=;
        b=QMbKQ/jadoFRzkunArX38Q12u3yrUElD5NaALMt6Gr5sASFNErzU750CisBVhEKxbZ
         BKsBL/FAnK6bP4RsSApVhEr6Anv9KwZcAzCeS1G5UxYly2GzVAHU4nj+zBK7fQzg9KWS
         hkfl7KFyNbN8Fd9hOTVkK+MlD2a++rRtv0rbzXsbf6CmGOD5Z55NCopVLSQg80Mu4oam
         hJAOgavYCPe0Z0AGKoON1zf9X5fDwPt+LVwlbW0+8R9wFlkxS77ze0Dn3fWBZ9FdZdEz
         0aa6qtJavWGV6X8bmsNRzFp7OLc33PfIGmHAIOrdFBs0JOWb5NOoqY193QJVgrCECaYu
         /f3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/PGZ6373hwX21uII2yTNlUq0BGVrzE4VOh9IUqL/yOY=;
        b=T2wZYwPxgMsPz2BPJJLR9ClxNY/t81t+JK64cZCZVGfG2X2KE5ShPwIEo0j8p+Rurz
         sT6CeHTvB2gStK9GfRqY5cETUZ4w+EgchBDvje6/flDJN8up5mH8KDAmfdsB2Pgf01al
         4z/1vBHKiC26uiCYA5eKUZpgWpz8gpmWkyPfJQ9ZR8QSWHen0VUX2VUHN2/6lyW6csbA
         WVSjhm5ImCKtlVfpQrz9MAB/bhzOpiLg4fHNwF25BHeKtZWPH3FdQy7F+nJj683lg+OT
         5SDP7YUsSI95xjiNdqCka588+QxM7ow+DSuevLJ5WkOCUzgqSWcmJYoQ3xLvh2PVJnVT
         4TBg==
X-Gm-Message-State: AOAM532wBj8DEvkQwBHhPG0KW8oCQf14jmRsjxZhPSMGje4uknMvFDia
        NzHP2jmNixVVWf46UvoYllTCwkb3iY4jxx1MU1i5tg==
X-Google-Smtp-Source: ABdhPJyj1xOOpj4onlG2/WW3umTyJvCVg8fQGOPytjYVlJXvUchM6BAlnaXUWge9bvj0zPdNDJIpSnxTV2zaYfiH3IQ=
X-Received: by 2002:a25:b74c:: with SMTP id e12mr37996841ybm.20.1612907728418;
 Tue, 09 Feb 2021 13:55:28 -0800 (PST)
MIME-Version: 1.0
References: <20210205222644.2357303-1-saravanak@google.com>
 <20210205222644.2357303-5-saravanak@google.com> <20210209213320.GA219007@robh.at.kernel.org>
In-Reply-To: <20210209213320.GA219007@robh.at.kernel.org>
From:   Saravana Kannan <saravanak@google.com>
Date:   Tue, 9 Feb 2021 13:54:52 -0800
Message-ID: <CAGETcx_gHRd9UYHvSsHX_=NFF+HEJkamJp3JcpojuJob_a8_DA@mail.gmail.com>
Subject: Re: [PATCH v4 4/8] of: property: Add fw_devlink support for optional properties
To:     Rob Herring <robh@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Len Brown <len.brown@intel.com>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@ucw.cz>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Android Kernel Team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Feb 9, 2021 at 1:33 PM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Feb 05, 2021 at 02:26:40PM -0800, Saravana Kannan wrote:
> > Not all DT bindings are mandatory bindings. Add support for optional DT
> > bindings and mark iommus, iommu-map, dmas as optional DT bindings.
>
> I don't think we can say these are optional or not. It's got to be a
> driver decision somehow.

Right, so maybe the word "optional" isn't a good name for it. I can
change that if you want.

The point being, fw_devlink can't block the probe of this driver based
on iommu property. We let the driver decide if it wants to
-EPROBE_DEFER or not or however it wants to handle this.

> For example, if IOMMU is optional, what happens with this sequence:
>
> driver probes without IOMMU
> driver calls dma_map_?()
> IOMMU driver probes
> h/w accesses DMA buffer --> BOOM!

Right. But how is this really related to fw_devlink? AFAICT, this is
an issue even today. If the driver needs the IOMMU, then it needs to
make sure the IOMMU has probed? What am I missing?

-Saravana
