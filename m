Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEB6347B01A
	for <lists+linux-clk@lfdr.de>; Mon, 20 Dec 2021 16:25:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239460AbhLTPZW (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 20 Dec 2021 10:25:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240258AbhLTPYg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Dec 2021 10:24:36 -0500
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9370FC08EA73
        for <linux-clk@vger.kernel.org>; Mon, 20 Dec 2021 07:05:39 -0800 (PST)
Received: by mail-vk1-xa2d.google.com with SMTP id b77so885981vka.11
        for <linux-clk@vger.kernel.org>; Mon, 20 Dec 2021 07:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6vFAc9SeeK/r1UH3ubCGIgjE+74yVGov3VoOpunaN8U=;
        b=deuBeiuc5jIB1k0dnZzH/t6Cb+FxqwYRq6vwC2tMbtLnXCg9yRfQMLK1J2qbxpF/6K
         zTdAahSI4r+jaIXvI4mxMRc+YI+fBUvPKx0ms401rIQKobU0y1J1QXJNDkt7IH5fqpto
         ynOruk7fUjtVEmL4ZV6wmSgTddX6zAKtxPzem5cLwJpikP1TAXqtbFJiTzuC2z5bQllp
         dyolXYX6oqiJowiONA70mNvT4QlUgVS3TD0ulVUECAVgPz/UWaq0N5c15Ws7UjYG6LVS
         LfJM/QbR2kLaHqKZSPXCkrzppaZddXqJWi1z1AiKLH0coCMaM0X1T2a4deYpkBLSUw7X
         2ovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6vFAc9SeeK/r1UH3ubCGIgjE+74yVGov3VoOpunaN8U=;
        b=xJkjM4n+oCIuDbmp4Rc6TebafU0GKqRYSRumdXQ9nk8ZcBcxRj91TvvcqUxt1Rmsgq
         V6GTGgIMm4oo6GSdxdhqkGwWQpjUjrRNWoQm9OH4p0xLYdzRQR4yj//KTF3//3zIa31Y
         GAiGKqCYEKPFW/1zKvUuT/frraASSelY74cUgOwo8z2JTxomba6n5ZY84WDGpqIJ+OKW
         5VnVy8a2h1tKofrJMap0Q31dPLiOQd5v19rxu0dGArz4ENNnf2OLxRrrJRiIB4NVL4qS
         MaLoFz6jOwh+pD8TGzoNhJAWO7IILcztF9DUniZPq/tjVfBasbH2Z1Z3+kJrvi3T4Tdp
         VOVA==
X-Gm-Message-State: AOAM530vMekwA6DH/StllvOHCTnJL+Qz8Wul8P5dmAqHm26yabE64voV
        GTi5TcEkUAO1OgL+QjgK1lwcm90fOJcm9dXfKk/6rQ==
X-Google-Smtp-Source: ABdhPJxBe3GHXdjAd9DU5qWdRH7VeJlYsTnmv5IZKHDx4275EuQZE0M28lGfvIvAunUGVLazUctlDUSOvpsfpLbciLs=
X-Received: by 2002:a1f:2849:: with SMTP id o70mr5722252vko.35.1640012738706;
 Mon, 20 Dec 2021 07:05:38 -0800 (PST)
MIME-Version: 1.0
References: <20211217161549.24836-1-semen.protsenko@linaro.org>
 <20211217161549.24836-4-semen.protsenko@linaro.org> <cc1c2906-60c2-7d4a-78c3-014f6712f9b2@canonical.com>
In-Reply-To: <cc1c2906-60c2-7d4a-78c3-014f6712f9b2@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Mon, 20 Dec 2021 17:05:27 +0200
Message-ID: <CAPLW+4mn24mfZmY2u-qs9mybPy2qSnffNWVPmX-Y-sLbMPejWA@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] dt-bindings: Add vendor prefix for WinLink
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
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
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 20 Dec 2021 at 11:36, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 17/12/2021 17:15, Sam Protsenko wrote:
> > WinLink Co., Ltd is a hardware design and manufacturing company based in
> > South Korea. Official web-site: [1].
> >
> > [1] http://win-link.net/
> >
> > Acked-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>
> Ack goes after your SoB. First you create patch, sign it and then Rob
> sees it and acks it.
>

Sorry, just mixed that up. It's even documented in [1]. Anyway, I can
see that you already fixed that and applied this patch, thanks!

[1] Documentation/process/maintainer-tip.rst

>
> Best regards,
> Krzysztof
