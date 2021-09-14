Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D8FE40B2BF
	for <lists+linux-clk@lfdr.de>; Tue, 14 Sep 2021 17:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234486AbhINPPL (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 14 Sep 2021 11:15:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234817AbhINPPG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Sep 2021 11:15:06 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A11A8C0613E1
        for <linux-clk@vger.kernel.org>; Tue, 14 Sep 2021 08:13:48 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id i4so12440664lfv.4
        for <linux-clk@vger.kernel.org>; Tue, 14 Sep 2021 08:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vs4JzNzYOIkiMNCXl/BXAxJoRkCBxorofWXnQlKIKTc=;
        b=pRPWsNXgrIohQph/8NpbL+8CQcifHOg3AtasJUc6ewrlqivFf7tNOnOev6xbHNeScy
         5lUw0JKVS2bKoFDpADjDZDubGnxK5+M9NWO2BpPX9q2R9b58vLMbE5CMjgmeiW2mNU8s
         o7ThsamuF+OksBlmKnCdC/Nw0BTW4A0/yGHr6VSMZWFPhdhurnzjm6uYfu9gnLkkCbv0
         lpdeXMq9bL2t29SyoDO11ImlthHn7AXkSS4a0zy/pQiHkSYi566+PTsS85skBEHoByF1
         ZgvNHr/rm3TIdw1ErNJ7E4dDZUpJCDskQV8oxzwthUO37ZBKKoQhbdM/zIrykMAFIsCq
         Kl9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vs4JzNzYOIkiMNCXl/BXAxJoRkCBxorofWXnQlKIKTc=;
        b=b0cX/AwTUyLTOiPerxxhuCSBvc3+v1uE0Qyjzuqww/HhwGiD45VVlmt3o6P7cVW6zx
         CImGkiTvcNM2jZnS27zOm9wW4Gcc7z6FrSREnv6hfugWLOrd6qigH8CbB25MEa3Wstvm
         n/vBgJbisYIxHwNWET34J0RS2hgpxBZ+SzXYUVMoLeAW8qSvHBiMJBaOmlILw3mSq/9S
         tM+qme2OjOBk+zCs5gltHNeUgU21VHJilf9Cu8ZcDANTOWIuKUsimRUxnpYR4IDstKAG
         A0MDwDnw9YpCkbJaKsh95yTQPD1qKVEnqKvQAO+Y/fxYSZ59by5wZ9oSbJKscxCla+Kp
         Zxkg==
X-Gm-Message-State: AOAM533fY7dRU75Cnq4i0sazvnjvFkgtdB4Y7NFwvSC4mojiJfYA8p8t
        NrLHJpSrN1dFtMer84mAZNRb2s6VoPCmDqTsgQBgB09L0cI=
X-Google-Smtp-Source: ABdhPJz/nB2X7ZhjAGNpGQ+wUMu55D7srT5Jv3DFOroslyMj15lcS2R9RnxlnBnfcSTTFydrMt0Pg3Xb7m3aCBq9Pto=
X-Received: by 2002:a05:6512:318a:: with SMTP id i10mr14107059lfe.444.1631632426763;
 Tue, 14 Sep 2021 08:13:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210913192816.1225025-1-robh@kernel.org> <20210913192816.1225025-9-robh@kernel.org>
In-Reply-To: <20210913192816.1225025-9-robh@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 14 Sep 2021 08:13:35 -0700
Message-ID: <CAKwvOdnNOMDWar2jpEw_yt8-dzW6KX-NVWh=UHc2FeYzux4tVw@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] kbuild: Enable dtc 'unit_address_format' warning
 by default
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Sep 13, 2021 at 12:28 PM Rob Herring <robh@kernel.org> wrote:
>
> With all the 'unit_address_format' warnings fixed, enable the warning by
> default.
>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: linux-kbuild@vger.kernel.org
> Acked-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  scripts/Makefile.lib | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 54582673fc1a..56d50eb0cd80 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -310,7 +310,6 @@ DTC_FLAGS += -Wno-interrupt_provider
>  # Disable noisy checks by default
>  ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
>  DTC_FLAGS += -Wno-unit_address_vs_reg \
> -       -Wno-unit_address_format \
>         -Wno-avoid_unnecessary_addr_size \
>         -Wno-alias_paths \
>         -Wno-graph_child_address \
> --
> 2.30.2
>


-- 
Thanks,
~Nick Desaulniers
