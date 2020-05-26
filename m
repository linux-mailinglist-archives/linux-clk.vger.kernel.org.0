Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3073C1D29DF
	for <lists+linux-clk@lfdr.de>; Thu, 14 May 2020 10:21:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbgENIVX (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 14 May 2020 04:21:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725965AbgENIVW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 May 2020 04:21:22 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A294C061A0F
        for <linux-clk@vger.kernel.org>; Thu, 14 May 2020 01:21:22 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id w10so2558607ljo.0
        for <linux-clk@vger.kernel.org>; Thu, 14 May 2020 01:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ylNyjxPU0jW9A5cG6J8lYn77ZbNao4PuP4byNxuwb40=;
        b=pL+XB6xDy0cGnanxPxZeCoXI+0/bH/MJrC9FZHLbSFeABMiSHzmaFy/I+vlbadTqdg
         moVU55iWLxpm1nnhHrCGKzA2uK7DqkWVrHrypLWkQ77O98C65VIQg4eWTACmBhqQAvbe
         pHSqklAJtsA1BGN8aJrEPgAzkjuaIRy0vNfWRPOiZ0Gx9pkVb9qjr26pYd9MiqLjtOJr
         54QU9Kl6XwBPNiecFaQ5Q2UN0C0xobJnHAsuUb9l4eWMcWJxS8krPxWVDver5JV680GH
         IzpZdlsYOHiSkmT8GBGTZ0VfuqV8Pk7Uv4HSe7NIk0lkUADLNFPO/dZ01aPB2TJo4RoU
         he7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ylNyjxPU0jW9A5cG6J8lYn77ZbNao4PuP4byNxuwb40=;
        b=bhaFzAtYU/51sv6wTPfS9PzhLsKovFf0uen0cf+qB5bSKdAOMqnG23NMwotk+HkX1c
         A1Fj9AeuNG20UPF3/vxbgpa5Jwlwgi9QY5sSL5R0GoxRtre0FPY9/WnN5h5i28Nn6GXp
         NhiGHe84TKda5Vk+9VD7n8fC8bLMIxTYa6gCrnJf2Rdte6731K9L0excpCydst6oQBdQ
         j+ouJRmGfdLCOpqO82uo9GRUIOSrMdhEOQMhHWtdmFIgrN4twbnJ5rhUVEtRSmLpL1/L
         PB4BHT0yNHKANgmCcPgWJqwVYZAbolgKp+qbTREevkhlv348VjlED/6wVi18GymLn4TM
         rB+g==
X-Gm-Message-State: AOAM5329lvgqLJJ/ILNcVyQ0txmhjF0NwTRHkLSmboBUx2YHMeoVtTZR
        9j74p6hUV/4ReB7SfxQxNIiEx0r5g08dcTUBRuKmJQ==
X-Google-Smtp-Source: ABdhPJyRERMIh+MQZPItj7QatuGXtUx06mgJ88uloHfqTCykxSiONeYCm+tNHIHuv9MC+hs2Hr0mPlFfLP8XGnr3zRA=
X-Received: by 2002:a2e:531e:: with SMTP id h30mr1125043ljb.168.1589444480845;
 Thu, 14 May 2020 01:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <1589267017-17294-1-git-send-email-dillon.minfei@gmail.com> <1589267017-17294-3-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1589267017-17294-3-git-send-email-dillon.minfei@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 14 May 2020 10:21:09 +0200
Message-ID: <CACRpkdZUyRh0KZzRxsdfFU_L-F=Ns0j1d3eR-ermhx2Gb0Zrgg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: display: panel: Add ilitek ili9341
 panel bindings
To:     dillon.minfei@gmail.com
Cc:     Rob Herring <robh+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, May 12, 2020 at 9:03 AM <dillon.minfei@gmail.com> wrote:

> From: dillon min <dillon.minfei@gmail.com>
>
> Add documentation for "ilitek,ili9341" panel.
>
> Signed-off-by: dillon min <dillon.minfei@gmail.com>

This looks good to me.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
