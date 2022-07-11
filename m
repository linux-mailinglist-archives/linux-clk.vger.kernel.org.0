Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2652A570DCC
	for <lists+linux-clk@lfdr.de>; Tue, 12 Jul 2022 01:03:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231152AbiGKXDV (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 11 Jul 2022 19:03:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbiGKXDV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Jul 2022 19:03:21 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FFF159273
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 16:03:20 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id u6so6169413iop.5
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 16:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZPXhzxwUo/ZCdZLeYUQL98xfFxCi7Cx7vbdqmGr4H/s=;
        b=od/y9HJhbzw+qEa4XZKbNNmwqNHoga7e9JNh21UKNlGBYkuRwP9U2SQ1vXpHnNkwWp
         L9pNhUuQaQGtfTyXSm/MGXGbeALkxDS/ebQcZVAxs5+aIKYV7AYjMm5QU+UzkuhwgQwI
         lwLlWxlemeNQAobTcVsNPKyjzu03zPqCGuoX5YB8vh9ikOLIDv4lH18Na5J0xss6BYGh
         5QmSW6HGzODXdBa+WANA/hqW5WbANEd+0WIegWRha2zR2NZr6qsyN8UMqYe/2XEwRO+P
         V/YDcpFBIzCaUozohLooMTc1uewzSTzRBmitz0+YWOh5eoZW7i+gJSAW6PdiU7+tXhL+
         ZTuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZPXhzxwUo/ZCdZLeYUQL98xfFxCi7Cx7vbdqmGr4H/s=;
        b=e62Tx/zz5/OhoM9tzaJ30jkdLlgPBMArL91NHMmUBokxg3UHEzZlZNqEZchHECrNez
         Mn6CXGtW5w3Z/2NQk1yG1bHZN8PiTHXp/GEwPvZfBYdPSItCN6Cp7MThllgnk2OCK4N/
         4bb0orYYU9aCmn98Q8nFCBevBK9+HTKHap9t+k6GRPdHJXP+0e1fBRFQjiwM34+Rd+my
         xd3FnxWgT3Zew3KfD+N88rSVkGNgKUN79wnl5LsdlSLXiQBMCtRXr/DymttnYh53JAzd
         0hYOWKq4rp1ku5qAi2/s6T6JDtMLQZ/4MHbDRvmnh3UQ6ktdrb90tjfIymnc6EA1qsh1
         IeZw==
X-Gm-Message-State: AJIora8vzM2SRI8v1mNLBRQTJq9KT+yroAxQ7TrB9n3HeJkK3DW2qvn+
        kqg7ge479lUuJOY8ah1LsuYloTyc1sASbnGSdKhn0g==
X-Google-Smtp-Source: AGRyM1s87Q93LXBgrqkRfeMusqvdl65gYPYSYZTJMADI5/6fvr0hZQDbHmoI2Wcof6Sm8CduljX/1HWmuR5vC3zJJKw=
X-Received: by 2002:a6b:3e83:0:b0:678:e63b:355d with SMTP id
 l125-20020a6b3e83000000b00678e63b355dmr10624504ioa.134.1657580599491; Mon, 11
 Jul 2022 16:03:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220711162713.2467476-1-dlatypov@google.com> <20220711204859.3DDD5C34115@smtp.kernel.org>
In-Reply-To: <20220711204859.3DDD5C34115@smtp.kernel.org>
From:   Daniel Latypov <dlatypov@google.com>
Date:   Mon, 11 Jul 2022 16:03:08 -0700
Message-ID: <CAGS_qxqxGfQ5tA063XoRbL1ktimyfmt+CuucJ_rsYVnoi4i7gw@mail.gmail.com>
Subject: Re: [PATCH] clk: explicitly disable CONFIG_UML_PCI_OVER_VIRTIO in .kunitconfig
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     brendanhiggins@google.com, davidgow@google.com,
        linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kselftest@vger.kernel.org, skhan@linuxfoundation.org,
        linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
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

On Mon, Jul 11, 2022 at 1:49 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Daniel Latypov (2022-07-11 09:27:13)
> > CONFIG_UML_PCI_OVER_VIRTIO=y is needed to enable CONFIG_PCI=y on UML.
> > However, this causes test failures when running the clk tests, i.e.
> > $ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/clk
> >
> > A snippet of the particular error is:
> > >     ok 1 - clk_gate_test_parent_rate
> > > ------------[ cut here ]------------
> > > WARNING: CPU: 0 PID: 45 at lib/logic_iomem.c:141 __raw_readl+0x9f/0xd0
> >
> > This is triggered by this cast in the test:
> >    143          ctx->fake_mem = (void __force __iomem *)&ctx->fake_reg;
> > this seems to work except when logic iomem is enabled, i.e.
> > CONFIG_INDIRECT_IOMEM=y.
> >
> > As a short-term fix, explicitly disable CONFIG_UML_PCI_OVER_VIRTIO in
> > drivers/clk/.kunitconfig so we can enable it for everyone else by
> > default in kunit.py.
> >
> > The long-term fix probably requires something more complicated, like
> >   #ifdef CONFIG_INDIRECT_IOMEM
> >     logic_iomem_add_region(...);
> >   #endif
>
> If this is how platform IO is mocked then yes we'll have to implement
> that.

It's not clear that it will be, but it's likely.
Until it's more clear, I figured we'd go with this simple bandaid fix for now.

There was initially some talk of using function-level
"stubbing"/"mocking" [1] to do the same, but Brendan started playing
around with logic iomem more. He and David can comment on it more
cogently than I can.

[1] https://lore.kernel.org/linux-kselftest/20220318021314.3225240-3-davidgow@google.com/

Daniel
