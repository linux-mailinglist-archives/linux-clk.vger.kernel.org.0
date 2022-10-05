Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27F035F556E
	for <lists+linux-clk@lfdr.de>; Wed,  5 Oct 2022 15:32:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229823AbiJENcV (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 5 Oct 2022 09:32:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbiJENcU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Oct 2022 09:32:20 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0C0E79EEB
        for <linux-clk@vger.kernel.org>; Wed,  5 Oct 2022 06:32:18 -0700 (PDT)
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6D1E94146C
        for <linux-clk@vger.kernel.org>; Wed,  5 Oct 2022 13:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1664976737;
        bh=6LkuqTP0xa6XajPgZoG/IjY8IZRdyk1AbTrKKTZip3M=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=mdDsovCOj0fBO4W3Yt+kwnmRTYxTvvcU+v/Q8DRckzz5HEQ2wuCBIqO3RHW6SYT4Q
         qT06zARvyntRDqju2tdoNrutGu3qGlvDYyux4J1vOJEUOTJGeVSmnHfCixq9hzl3LQ
         MUkJi8rQoDHnTdKzyxTiHtxTl/bf8HvoQB//r5sfroYeLObp54hTl0V/2UlGFW6PlA
         2XGxzwuFB9SKfFgm0CkSVJHv+I/imFOhraZdhVFFWFvWCIE/h0a7zSNbKhtOAAFAkI
         ZCXwiKSa2lgMD/wh3QzULC2QFfn0BSdeFNYAKfdZtV+1wSYfxqAEJUqWK5uhnWsTCB
         cYSIGhwxicFrA==
Received: by mail-qv1-f72.google.com with SMTP id cy11-20020a05621418cb00b004b17b3cf429so6665743qvb.6
        for <linux-clk@vger.kernel.org>; Wed, 05 Oct 2022 06:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=6LkuqTP0xa6XajPgZoG/IjY8IZRdyk1AbTrKKTZip3M=;
        b=OvF4r40P/gjCfdFPkMmWuewX/M55WPrI9d5pLwop28i4HQo3PVL7J7soxOOQn7DoDL
         Lptyf66OKKwlHg1sSsGXNgYHO7Y3jSywOS78GsLTdynbhnf3H3wqsMDv2eiVjScVBxHC
         sPZU6Y29wgXCj91XCwLXv2t8fZ572BEswfBqmztfdgmKYci5mJlwy5SX/B7wI6jUDG0V
         gAcjJrmt1FkISX7PnGZESbPjT/o/GSlxdUb7xOJwEl8GbnCmuWZajz5rdO/vaGz1cCPg
         wIN4mgEJQAw5EdwIyuPJdKsMVRhP5QyI+LnSvC8qF5sI1OY95YbE1pw3dadkdlif/9aj
         0xVw==
X-Gm-Message-State: ACrzQf3aseGuhWpiO/ZdlDPHueYX5UsRAgf0xZLjjSd2DhLpLgAljTnf
        sGh1t+mP1F53GW1Mi3MdrOgteSz3ulbtFpWCXck/TQ7VKk7cqfqgXFSHJ97RS0fDPHBurHAyhtJ
        v1KIzNeDvdGvm1i00aDY5XjyG6dZSx8oi2bVO8Zy7GkjC0uKoP4JJ6Q==
X-Received: by 2002:a05:620a:488a:b0:6ce:5caa:37d1 with SMTP id ea10-20020a05620a488a00b006ce5caa37d1mr19656621qkb.37.1664976735804;
        Wed, 05 Oct 2022 06:32:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Xl+UsR78BPCM9pC3pjMNNB38LjTXXtDyoeNI34kPvrpVwp+y4DCHK0DykjnJjicQW6z4ascUy+oxEZUfANUw=
X-Received: by 2002:a05:620a:488a:b0:6ce:5caa:37d1 with SMTP id
 ea10-20020a05620a488a00b006ce5caa37d1mr19656602qkb.37.1664976735563; Wed, 05
 Oct 2022 06:32:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
 <20220930074341.6386-1-hal.feng@linux.starfivetech.com> <CACRpkdYMQ98Q1iXr7-YdUkQrSK8aauZuSFeDp2f7ubNH_W7_HQ@mail.gmail.com>
In-Reply-To: <CACRpkdYMQ98Q1iXr7-YdUkQrSK8aauZuSFeDp2f7ubNH_W7_HQ@mail.gmail.com>
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date:   Wed, 5 Oct 2022 15:31:59 +0200
Message-ID: <CAJM55Z91TL4eLOjZsRVZuxspcL40gG2MQRZf31h0L2yyaW--Cg@mail.gmail.com>
Subject: Re: [PATCH v1 26/30] pinctrl: starfive: Add StarFive JH7110 driver
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Hal Feng <hal.feng@linux.starfivetech.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
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
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 4 Oct 2022 at 10:57, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Sep 30, 2022 at 9:45 AM Hal Feng
> <hal.feng@linux.starfivetech.com> wrote:
>
> > From: Jianlong Huang <jianlong.huang@starfivetech.com>
> >
> > Add pinctrl driver for StarFive JH7110 SoC.
> >
> > Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> > Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
>
> Since Emil submitted the first driver I would really appreciate his review
> on this version.

I tried really hard to come up with a good way to share code between
the JH7100 and JH7110 drivers, but so many details different on the
JH7110 that it's probably best to just have a separate driver, so that
part is fine.

As mentioned elsewhere this driver certainly shouldn't be accepted
without following the generic pinctrl and pinmux bindings. You can see
the driver I wrote here:
https://github.com/esmil/linux/commit/c2633315385fef1a25aa3711facef07d915820e1

It is certainly not perfect and far from complete, but at least it
does follow the generic bindings. Feel free to copy all or parts of
that.

/Emil


>
> Yours,
> Linus Walleij
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
