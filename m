Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC96E5F3EF4
	for <lists+linux-clk@lfdr.de>; Tue,  4 Oct 2022 10:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbiJDI4p (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 4 Oct 2022 04:56:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230403AbiJDI4n (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Oct 2022 04:56:43 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B91C42937A
        for <linux-clk@vger.kernel.org>; Tue,  4 Oct 2022 01:56:41 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id b2so27415910eja.6
        for <linux-clk@vger.kernel.org>; Tue, 04 Oct 2022 01:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=lxkTJcblLVu6NuOqlRauwNwEZChGxIJKAd+juLm/hHA=;
        b=X5rSaOtzy6x5snBiRSfNAOjP2pRfTI8CdpgkUbTuQHwkzOk8SMvojJcn8YMGuLfi8g
         Y6LXIRCXQpP7WrH/rE2KaWCF5hdNoZ+3u5UvksYwE+4ANCwKj4JlsqMq6Uwg0vd641nJ
         T7OwkZMM6p6i8h7smNdvtg8vIfnIip3mURLBQscSkyd1O9SLf51YhHmpxqJpF7rLoVPR
         6/N6vTX3UJjl71RxhP7LN+EoY2pXFWf9CYLW6IJX1WfDxmdrXAZezEI9/iA4OY0C1nhk
         Em3Ja6XNZmNzh94nYm3kcG+fVMsgzAH+zhd/Ivj3PB7oHkgl5QiIHTT+u/Zk20c61MAu
         dYzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=lxkTJcblLVu6NuOqlRauwNwEZChGxIJKAd+juLm/hHA=;
        b=BLnO4XjFSs8UtEvcwEI35F+wYp3xKMbNbtyD6v+hgqjrBitmaIK8txTU8yNJh0iZyf
         ra4QChVMd+YOtMR7rEKPSoscNTRMsRaPRCXHgITaAlGERYMU5vnplhygwcW/nH+659lX
         oKaErv58RJk5O6fQ8qMCy05vsr2Uh2BcW1zfXxBXQQRGt8mzJnY+OLhCe/icl6i3tGPP
         8gPcndd/NK4QAVS9a7LHG8cGz/kd7rFbFhQVAGRxdO1olqfG1Rin17NB9lzhSEuzrTUB
         kD8Dnbw+Xv6K9mS3qwU2vs4t12e0eNogBZCVn7OPgoICttRPI6XbgF3abaCQEKI8bH6u
         F8MQ==
X-Gm-Message-State: ACrzQf24oKP6yB7bGG259lZa7yd+FBvsJQFp0hZcDKtF8rcm+x7JdY0H
        aCbf521494HqJHG2nrFZN9+rF3T0UwdCIbTFW8owug==
X-Google-Smtp-Source: AMsMyM7riW2z2sUUR3aIi4rAMS6ggGMmmrCrrTuvodb/LcmYfbLSB3cfWOTk+/hvzu00TNxkrT5FaalupYxMRlmbHac=
X-Received: by 2002:a17:906:58c8:b0:6fe:91d5:18d2 with SMTP id
 e8-20020a17090658c800b006fe91d518d2mr18648224ejs.190.1664873800297; Tue, 04
 Oct 2022 01:56:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com> <20220930074341.6386-1-hal.feng@linux.starfivetech.com>
In-Reply-To: <20220930074341.6386-1-hal.feng@linux.starfivetech.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 4 Oct 2022 10:56:28 +0200
Message-ID: <CACRpkdYMQ98Q1iXr7-YdUkQrSK8aauZuSFeDp2f7ubNH_W7_HQ@mail.gmail.com>
Subject: Re: [PATCH v1 26/30] pinctrl: starfive: Add StarFive JH7110 driver
To:     Hal Feng <hal.feng@linux.starfivetech.com>,
        Emil Renner Berthing <kernel@esmil.dk>
Cc:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Sep 30, 2022 at 9:45 AM Hal Feng
<hal.feng@linux.starfivetech.com> wrote:

> From: Jianlong Huang <jianlong.huang@starfivetech.com>
>
> Add pinctrl driver for StarFive JH7110 SoC.
>
> Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>

Since Emil submitted the first driver I would really appreciate his review
on this version.

Yours,
Linus Walleij
