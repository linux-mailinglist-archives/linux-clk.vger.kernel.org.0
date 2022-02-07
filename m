Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE1394AB3DF
	for <lists+linux-clk@lfdr.de>; Mon,  7 Feb 2022 07:12:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240929AbiBGFvN (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 7 Feb 2022 00:51:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233113AbiBGFWE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Feb 2022 00:22:04 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9239BC043181
        for <linux-clk@vger.kernel.org>; Sun,  6 Feb 2022 21:22:03 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id z19so24479364lfq.13
        for <linux-clk@vger.kernel.org>; Sun, 06 Feb 2022 21:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OGto9Xi5kXT109TGKxmESbnUdLkURSUbKuwtAM3GVRY=;
        b=GJYJs5kr8L0CzbroD4u7gx12y0B2e/A+Jz8EL53bOvsjtCs/mAgZDnq3jzwqzO+xl0
         06SVvCAQ48ly9xfH1vZ6XttX+BjiM2aLz9J2QV4dBlFL8h/cyY3oUnTdJkio5YwZHtl4
         lb/EmaT+WIxT2jh5rzhWwHE1Grpz5T517csUsI6DBroXvJtpWzAcLvbv2Ab59sf4IMbI
         hREJpECLkM3ZhSswZ025QpXrE0kHPdHcqJU8I81V42KTMNbVLg/31QDZzz4XRZ5jNf7q
         +FnQIDVk2DuB1eCWk9/RjawuZp2iqT8o0aj2dwGZskWk2gLHmX2BG6gkBIN0hXKS/fBu
         6gLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OGto9Xi5kXT109TGKxmESbnUdLkURSUbKuwtAM3GVRY=;
        b=yVNtKOnBa8j7BVkHf3ZvV9iaTTXlvkP0vodNKJblFMNBP3jtCrl97yiaZ7qU+sckkh
         vBe4Z1UWhqGVbJVF0+Pp0Z+0wWYcGFuklTjDCIX3Lq8atoNENiEfbHg/4r8bPbJ7CEcA
         qX4vMVsFITlE/gKb+iZfKdk2sqIEjGPTPFfXXoP14LgsiKACG1LwlvkdDQgmC5IYRUro
         pZ4rzxIJqQ88/l2Xe/WDaJsm20WGfg9o5JQTGgTMb+Y918zyjhqrYAUPjRI4fZThsgNy
         75Zj6cSPuu56owZbbBr7xKQAFFmTXLmJ6AZ+HZB4CxIWQ7LjP7scnhK3RmRcW++0Ew79
         x4dg==
X-Gm-Message-State: AOAM533p6uRvR7IAAbvRUz2Jte9i8G+YjjSGDQEtlBy1R6LSVOTdrCin
        hzJyiZDy5AQ4KqQGDzc5aLHQcmaCMi6TQn/U8fBHxg==
X-Google-Smtp-Source: ABdhPJxpeJtXFqUmwrOBzOQ8MX54Xs5LsU2VrMor7DxLiCWIdFLgRJ2+sq3U6j9wrfCSu7HJ7TGRQJP+lUaFlqERBQY=
X-Received: by 2002:a05:6512:3e0b:: with SMTP id i11mr7348588lfv.510.1644211321557;
 Sun, 06 Feb 2022 21:22:01 -0800 (PST)
MIME-Version: 1.0
References: <cover.1642582832.git.zong.li@sifive.com> <mhng-ffd770d4-8f8a-417a-a589-f14d09f55282@palmer-ri-x1c9>
In-Reply-To: <mhng-ffd770d4-8f8a-417a-a589-f14d09f55282@palmer-ri-x1c9>
From:   Zong Li <zong.li@sifive.com>
Date:   Mon, 7 Feb 2022 13:21:50 +0800
Message-ID: <CANXhq0pYHfsa4T1t=FK2=jM4OEfgXD=sDS5vVV4EKCpkwTz6og@mail.gmail.com>
Subject: Re: [PATCH 0/4] Refactor the PRCI driver to reduce the complexity
To:     Palmer Dabbelt <palmer@dabbelt.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, Feb 5, 2022 at 2:56 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Wed, 19 Jan 2022 01:28:37 PST (-0800), zong.li@sifive.com wrote:
> > This patch set tries to improve the PRCI driver to reduce the
> > complexity, we remove the SoCs C files by putting putting all stuff in
> > each SoCs header file, and include these SoCs-specific header files in
> > core of PRCI. It can also avoid the W=1 kernel build warnings about
> > variable defined but not used [-Wunused-const-variable=], like 'commit
> > 487dc7bb6a0c ("clk: sifive:fu540-prci: Declare static const variable
> > 'prci_clk_fu540' where it's used")' does.
> >
> > This patch set also contains the dt-bindings and dts change, because
> > we change the macro name for fu540 and fu740 by adding the prefix
> > respectively.
> >
> > Thanks all for your review and suggestions.
> >
> > Zong Li (4):
> >   dt-bindings: change the macro name of prci in header files and example
> >   riscv: dts: Change the macro name of prci in each device node
> >   clk: sifive: Add SoCs prefix in each SoCs-dependent data
>
> IIUC these there aren't bisectable: the bindings change will break
> builds of the DTs and drivers.  I'm not sure what's generally the way to
> go with these, but I always try to avoid broken builds in the middle of
> patch sets.
>
> Aside from that this generally looks good to me, but the DT and clock
> folks are probably a better bet for a proper review here.  Happy to take
> this through the RISC-V tree, but IMO it's a better candidate for the
> clock tree so
>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # aside from breaking bisect
>
> Thanks!
>

Many thanks for your review and reminding, and yes, it seems a bit
hard there since the DT binding docs and includes need to be a
separate patch.

> >   clk: sifive: Move all stuff into SoCs header files from C files
> >
> >  .../devicetree/bindings/gpio/sifive,gpio.yaml |   2 +-
> >  .../bindings/pci/sifive,fu740-pcie.yaml       |   2 +-
> >  .../bindings/serial/sifive-serial.yaml        |   2 +-
> >  arch/riscv/boot/dts/sifive/fu540-c000.dtsi    |  22 +--
> >  arch/riscv/boot/dts/sifive/fu740-c000.dtsi    |  26 ++--
> >  drivers/clk/sifive/Makefile                   |   2 +-
> >  drivers/clk/sifive/fu540-prci.c               |  89 ------------
> >  drivers/clk/sifive/fu540-prci.h               |  91 +++++++++++-
> >  drivers/clk/sifive/fu740-prci.c               | 134 ------------------
> >  drivers/clk/sifive/fu740-prci.h               | 130 ++++++++++++++++-
> >  drivers/clk/sifive/sifive-prci.c              |   5 -
> >  include/dt-bindings/clock/sifive-fu540-prci.h |   8 +-
> >  include/dt-bindings/clock/sifive-fu740-prci.h |  18 +--
> >  13 files changed, 254 insertions(+), 277 deletions(-)
> >  delete mode 100644 drivers/clk/sifive/fu540-prci.c
> >  delete mode 100644 drivers/clk/sifive/fu740-prci.c
