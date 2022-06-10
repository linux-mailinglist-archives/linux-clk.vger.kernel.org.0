Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 093895456EE
	for <lists+linux-clk@lfdr.de>; Fri, 10 Jun 2022 00:11:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233876AbiFIWL0 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 9 Jun 2022 18:11:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232916AbiFIWLY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 9 Jun 2022 18:11:24 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 073E415FE21
        for <linux-clk@vger.kernel.org>; Thu,  9 Jun 2022 15:11:23 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id l126-20020a1c2584000000b0039c1a10507fso222344wml.1
        for <linux-clk@vger.kernel.org>; Thu, 09 Jun 2022 15:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=InjL74e+G90ZxHkv8wOPoRjvtkmrCI8/zFa+GegrWrs=;
        b=ZZ8Pi5On3BCsTOPysE3hM6XnnDucvZsZ0t/ef7wkpsRg8lN4Df2vn+K+Vo563wBfbl
         UoItTQW5DUWNtuO1hm+hjoXsIUr33oQkeHCIIXk4jUJm0z2AFkkcKQ+oc63iIDC3QkQP
         fSYvUToL2vsacT6stkdK7JTQtlcItWEs5nt9WANRz4cQSqXVGwJH66iLEirchtjLm4LM
         DRfhfzeHvWlmGDqVgEFfHiUftWWixFr6digktG25QTfp7eakexLJ6MYV2vt0tNTRUXuo
         QMh6lWAraDLRyEqPbeCsxEc8jeP8qK9L1MU22uG1iRWItFND0ap49cEM3iPT1IOp5InB
         c8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=InjL74e+G90ZxHkv8wOPoRjvtkmrCI8/zFa+GegrWrs=;
        b=QVewvbQ+CxK871W/CLdwgg23KSs7IliHxuHcO3yjj8BE2l8QLIGFJXFPuZxQX5rO/I
         Sa0H+srhBnVPW6NE4VQW2Yz4TrzEUd2jAWCZoiscnSiK007NkYYSVO3e7iSokHVoRN6U
         1Ro+QQBLVfmcLGPK7Du47zwCNDN9/KQyj76x3t1AzZMgUGRXQEykDLPllquKPRB2pw4U
         d/xapydmLFskoLEi5Wo7HRxoXYn4f6m98dXJHNupEqGNwTXsQGc1WFzXmFT1EjQnabpB
         lkAOePfToE5pS3sIheuWrflS6skjeR+8RGymb2BqXWMMiKi3UTvimFfJ5lq54bo2wrS6
         Cuzw==
X-Gm-Message-State: AOAM532++2tkg1eldLimxkVyWVJreSrdcfluJ2dihU91F9lUgOOsUcTg
        LoLa6TM91IM/epz7tXbda233H7I83tx9dNfDcaw7fg==
X-Google-Smtp-Source: ABdhPJz5c1e9+2oQkV6XjK2Ycf7s16aY52v1eiy6DzzvjdPdlELuaZ+jCSVlSpyHhiU80AGroldiHhcBwBe+Ts442Bo=
X-Received: by 2002:a7b:c392:0:b0:39c:4d27:e698 with SMTP id
 s18-20020a7bc392000000b0039c4d27e698mr5397998wmj.57.1654812681381; Thu, 09
 Jun 2022 15:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220608095623.22327-1-tmaimon77@gmail.com> <20220608095623.22327-11-tmaimon77@gmail.com>
 <3aa70c91-d6d7-e2eb-9c45-a1fb0a5751ca@linaro.org> <CAP6Zq1iCJO3AzHnG7RSQ1pyVwayxs+X3iVM4U=6j2k0EgR7psg@mail.gmail.com>
In-Reply-To: <CAP6Zq1iCJO3AzHnG7RSQ1pyVwayxs+X3iVM4U=6j2k0EgR7psg@mail.gmail.com>
From:   Benjamin Fair <benjaminfair@google.com>
Date:   Thu, 9 Jun 2022 15:10:45 -0700
Message-ID: <CADKL2t523rdOnm=iUNXcw06Soq3NjbJEsEiPwCXdSx3Np-rNDQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/20] ARM: dts: nuvoton: add reset syscon property
To:     Tomer Maimon <tmaimon77@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Joel Stanley <joel@jms.id.au>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Jiri Slaby <jirislaby@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Vinod Koul <vkoul@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Robert Hancock <robert.hancock@calian.com>,
        =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Lubomir Rintel <lkundrak@v3.sk>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Tomer,

On Thu, 9 Jun 2022 at 14:30, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Hi Krzysztof,
>
> Thanks for your comments
>
> On Wed, 8 Jun 2022 at 13:07, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > On 08/06/2022 11:56, Tomer Maimon wrote:
> > > Add nuvoton,sysgcr syscon property to the reset
> > > node to handle the general control registers.
> >
> > Wrong wrapping.
> it will be very helpful if you could point me what wrong wrapped in
> the commit message, is it the explanation or the header? or something
> else?

The commit message body should be wrapped at 72 chars. You can fit
more on the first line if you reflow:

Add nuvoton,sysgcr syscon property to the reset node to handle the
general control registers.

> >
> > Best regards,
> > Krzysztof
>
> Best regards,
>
> Tomer
