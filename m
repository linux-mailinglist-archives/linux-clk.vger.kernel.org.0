Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E76447AF35
	for <lists+linux-clk@lfdr.de>; Mon, 20 Dec 2021 16:10:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239689AbhLTPKj (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 20 Dec 2021 10:10:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238773AbhLTPJ3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Dec 2021 10:09:29 -0500
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5688EC07E5C3
        for <linux-clk@vger.kernel.org>; Mon, 20 Dec 2021 06:55:15 -0800 (PST)
Received: by mail-ua1-x92e.google.com with SMTP id y23so18114682uay.7
        for <linux-clk@vger.kernel.org>; Mon, 20 Dec 2021 06:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rNVouqrIPLa6IQqV3TFqg00sda6K3zfXkEQ5RkNQthc=;
        b=Vs5G4lopykIYb4h8vBTDM9CYQ8PnUX0O1E+KebdgJWkRhAY0eTOhzAA6q/x/4tU8G7
         XNeLaYhuWGpBT9hUY8zVXJ9uz+lAjPVLMXXga9gAcScDBLA4bAncaBxU+o/eg9lLfelb
         VgpU5eGoKnh+vTMDzuZJLy/AAuJS5XwJkHqDOewCTm4ZpuOQ2nLPF/DfJxLFkGGT+ufj
         pCCm2gjjOnkXQcAqfN2HEYRIF2aHeHxEwfAGwIVDpGeAXi6SjH3TFDIk6MV/r0hjGBI2
         sAGpibkP6SuLv+/lKMQwlkNTKkiq8COSVqBB0WIetakx72YUMSp5AZ0R679IvQqpTERr
         gAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rNVouqrIPLa6IQqV3TFqg00sda6K3zfXkEQ5RkNQthc=;
        b=jLj2c2iI0umhVWzlDITsLiV52/PU0aVgkuVynASBuWGZYdfBPpsvfyr1E53JvMaHX+
         M8onnPZceIrzjqRjKKEh5iM2/2rRfmf9vEYnuFLeTcncTeDpbXGiiY4tCiVxGuSrmMtq
         8ynHeyJ7rLFwQgBb/RrK0TKiEa86p8GpzoDw6j2t2IG0bovKLFzaxwKvNNkCxcZsE9QS
         eh2xadWS32bamXsM6FBgbofc2ZeOCB0RqDw/0R/S5K7juZF6zINFXDXe5KQkrJ/KzFkv
         imHtot4HAupRpWgtTZyfovR6VRyIeCinrDqKBK0GS9x9haiUt+5pBl948P1uL+fzvyrB
         VPSg==
X-Gm-Message-State: AOAM530GFEV/SA3ulEtDRADc+/32wPNwwuAtdyDY0YN3Yf6Ldenb8pjD
        XCIMDN9Wt3GmaNKjZ405BALI9gU8eb8SqF0iUcjWbg==
X-Google-Smtp-Source: ABdhPJzR/B260rIdEoX2NmWjpHz2CNBlx4uO7asCMUb8tRADJxGEUQFMbOXQNsBGusXKtt9JcUIhvqvaOkdm5hZTzOo=
X-Received: by 2002:a67:be12:: with SMTP id x18mr5032857vsq.86.1640012114496;
 Mon, 20 Dec 2021 06:55:14 -0800 (PST)
MIME-Version: 1.0
References: <20211217161549.24836-1-semen.protsenko@linaro.org>
 <20211217161549.24836-2-semen.protsenko@linaro.org> <2fdc5c97-6c19-8e70-d717-28b29d86160c@kernel.org>
 <5bd5c0bf-4390-22c2-e4e0-cb02b80dfb9c@canonical.com>
In-Reply-To: <5bd5c0bf-4390-22c2-e4e0-cb02b80dfb9c@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Mon, 20 Dec 2021 16:55:03 +0200
Message-ID: <CAPLW+4msw_yeG4uDbS9mMULOuc43MK9O6Paya_Z2jBj2t6ZTiA@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] dt-bindings: clock: exynos850: Add bindings for
 Exynos850 sysreg clocks
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Sylwester Nawrocki <snawrocki@kernel.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Hao Fang <fanghao11@huawei.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 20 Dec 2021 at 11:31, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 19/12/2021 23:29, Sylwester Nawrocki wrote:
> > On 17.12.2021 17:15, Sam Protsenko wrote:
> >> System Register is used to configure system behavior, like USI protocol,
> >> etc. SYSREG clocks should be provided to corresponding syscon nodes, to
> >> make it possible to modify SYSREG registers.
> >>
> >> While at it, add also missing PMU and GPIO clocks, which looks necessary
> >> and might be needed for corresponding Exynos850 features soon.
> >>
> >> Reviewed-by: Krzysztof Kozlowski<krzysztof.kozlowski@canonical.com>
> >> Acked-by: Rob Herring<robh@kernel.org>
> >> Acked-by: Chanwoo Choi<cw00.choi@samsung.com>
> >> Signed-off-by: Sam Protsenko<semen.protsenko@linaro.org>
> >
> > Apologies for late reply, this patch is applied now.
> >
>
> Sam,
>
> The clock is used in the DTSI, so since this was applied, there are only
> two choices now:
> 1. wait for next cycle with DTSI and DTS,
> 2. Resubmit with replacing the newly added clocks in DTSI/DTS with
> numbers and a TODO note.
>

But why? I thought because Sylwester applied my clock patches, those
will get into v5.17, and so DTSI/DTS might rely on those clocks? If I
get it wrong, please let me know why, and I'll go with item (2) you
suggested.

> Best regards,
> Krzysztof
