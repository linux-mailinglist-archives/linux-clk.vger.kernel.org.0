Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 706A91E0E46
	for <lists+linux-clk@lfdr.de>; Mon, 25 May 2020 14:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390570AbgEYMUh (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 25 May 2020 08:20:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390196AbgEYMUg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 May 2020 08:20:36 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47D60C05BD43
        for <linux-clk@vger.kernel.org>; Mon, 25 May 2020 05:20:36 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id r125so10375134lff.13
        for <linux-clk@vger.kernel.org>; Mon, 25 May 2020 05:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2uL/BTgbcmhuM5YoKw/xsIFunhmdvIl/vJd/r4JhQGI=;
        b=s27kr2eqyPVVUBlXSvFGIQr/trFb1G9zTpaZkf+2EZG3Hx2n20tojKndnRmHxnFm5B
         ASp5qUZUcNhgDtSz05MKDEc0AhNM7RX+XqKC4RcH+dueKzNuzdA9UUtfJm3QObywiyNn
         gLyUfwWbN87noM3TipQ1xxzLT/qC8suP8C2ItO0uKVBLZF7gkDhYZYdyWaPhGsZlURx5
         dC7jiymi5TrHLn3WrjWoWbTG/vN0K0XXq9T9jya4WAVmkhAW4KU3DPDDLxbaJk+51A8y
         NPUY8Y3/kWXC5iqcAEtXLI21yhLyJybrVzQtHPxoRDO5FDHaT8xNMF10qM6k/sr2ih0m
         THuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2uL/BTgbcmhuM5YoKw/xsIFunhmdvIl/vJd/r4JhQGI=;
        b=XRxXxa6bkmKmANtAIw2/KF9gnnkjLGgZSGhKlKgX+q1Ym4cZnz71hmLZMokEDx9eG/
         qAOP577FNLM5O1Yf2iwe+2SoMxJh/0XMrG1CmZGTTTV/FfrRguRZcgxq1rBTQbUnAdO3
         6Tg/ep4EJ0xfRu4ZAS/slYvf/t3qOdC+Yx+LpKkUhvxnsou8PwnNjalad/LSvW1397Mk
         V+D4i6nq9Lr8jpU4IIwGx3oJHzXiJxWoGX6tlnEDLjqoQCFw0z1KTLdZ196TTk/u52sh
         LyW3IYySpY5b/U9JhIwiN7YtiQv90iXs74Csw2i9r3VadgyVKkOuhLQSlE8Hg+t5W0ph
         0j5g==
X-Gm-Message-State: AOAM530apXPJ7zfQ3GOHZt2nchT1jLhjQnoNm0htcoJM02h4KefEIhH7
        7N2erbD0SpUk3PPdgsXpSKgVibBHHlss6DH9ioZm0A==
X-Google-Smtp-Source: ABdhPJzzn4cmibq9OV9VwB1X2PlikxB9SvAFGTTF5EB8YLtQ3tUTqPOcsUIpd9PFnnM7N1+NhdQzLiY+0rFB4yQUkHM=
X-Received: by 2002:ac2:5473:: with SMTP id e19mr14251823lfn.21.1590409234803;
 Mon, 25 May 2020 05:20:34 -0700 (PDT)
MIME-Version: 1.0
References: <1590378348-8115-1-git-send-email-dillon.minfei@gmail.com> <1590378348-8115-5-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1590378348-8115-5-git-send-email-dillon.minfei@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 25 May 2020 14:20:23 +0200
Message-ID: <CACRpkdb=+T0jSzBkrViHnuXGNhD4F3d_VX1t-hkqMG0CSdDhnQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/8] dt-bindings: display: panel: Add ilitek ili9341
 panel bindings
To:     dillon min <dillon.minfei@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, May 25, 2020 at 5:46 AM <dillon.minfei@gmail.com> wrote:

> From: dillon min <dillon.minfei@gmail.com>
>
> Add documentation for "ilitek,ili9341" panel.
>
> Signed-off-by: dillon min <dillon.minfei@gmail.com>

This looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
