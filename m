Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 786EF52D377
	for <lists+linux-clk@lfdr.de>; Thu, 19 May 2022 15:05:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238355AbiESNFN (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 19 May 2022 09:05:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238161AbiESNFL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 May 2022 09:05:11 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CCF067D2D
        for <linux-clk@vger.kernel.org>; Thu, 19 May 2022 06:05:10 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-2fee9fe48c2so56163247b3.3
        for <linux-clk@vger.kernel.org>; Thu, 19 May 2022 06:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FvS6oIYuJD+X/Sl5GyHKX9reZ4E6zgz4WuUSfpo4I1I=;
        b=cuUOVJMltrI7hB/SFs6chT4HOwwy3oA61jegFQS3eMZwuTE+w1145KZDnb8oyR6Tel
         QgauXxUvZ36jV/zTD3D7xyjpzpc8h/ztzct0mhcAnNACKMODQfg7Ymse3S7OsjhJQ3So
         Lsu1g4HGPEk955ldtzo/ZZgcprFUvW/9gsDpeAH7TtYK+0agHPo6Mhmo6IS/p59W6Mqo
         SItSjTv6JmhbnmqXgSbmSi/R9mCOCKAKvo+9lt8V/HzbaSCmmuMX5iXJqR67MluglWjx
         dhgi1CpRcdxgS803lPXtYUALykAzcFfh7ha/NcKJmOXatxLKmrsZmei8JKCv/eK+k0r3
         4O5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FvS6oIYuJD+X/Sl5GyHKX9reZ4E6zgz4WuUSfpo4I1I=;
        b=uSl0G8G2KuQRqho0mzFUa0DaTOc7vaq3laY1Zpu6/cWDkpYt2xyJXEHVjsxKoFDxQb
         pis5DzIv1ZyL2+2TxV/IAyLFFcsyjk4S30/crxzySbjYtzZZ+BvIxBdgoKfwcbRGBK8i
         Phy+rbOfJvF+SrAEspMCGHwBTI2WMIo95m1rK73kwKD3EL7y5jQ6vp5RkNdY20I8LrqE
         ymELpipOAQ2Te2bpdiiCQ22adujLYroFhDkPbZ/LsrvE9xvk2T+agKziW/rjdj/LWItk
         BcH/jaVwS9AUPHlrxZGkKXk+v/VIrCpOIJj8UL2KCIifC8BYW4UvZ/HBBEhMGYGRhI13
         NhqQ==
X-Gm-Message-State: AOAM531V0wfYT09b5SxkLWr5HnWqH/Zo+WcQg6/J+YgJCUVd3bhtzPRe
        3PGMsqXAGJFMD+VULbxDZ29HcQz76vo+qMstEo33YA==
X-Google-Smtp-Source: ABdhPJzCqwZlIRlav0EjPiuT+GEqGML2V538fx0hb3/tK+CgfQDqc/5gWM2/UHdZ3ADOOwISs7cS0bmmxHbqgXmtybc=
X-Received: by 2002:a0d:c4c2:0:b0:2f1:6c00:9eb4 with SMTP id
 g185-20020a0dc4c2000000b002f16c009eb4mr4769667ywd.448.1652965508286; Thu, 19
 May 2022 06:05:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220504213251.264819-1-sebastian.reichel@collabora.com> <20220504213251.264819-19-sebastian.reichel@collabora.com>
In-Reply-To: <20220504213251.264819-19-sebastian.reichel@collabora.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 19 May 2022 15:04:57 +0200
Message-ID: <CACRpkdY4Db1jV55HUeLzOjqWs3cfjSCpcKX2Q7Zs-+rB9UkEsg@mail.gmail.com>
Subject: Re: [PATCHv2 18/21] dt-bindings: pinctrl: rockchip: increase max
 amount of device functions
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@lists.collabora.co.uk,
        kernel@collabora.com
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

On Wed, May 4, 2022 at 11:38 PM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:

> RK3588 can have 10 different device functions, so increase the maximum
> amount appropriately. Considering rockchip uses auto-generated pinmux
> files, adding a quite complex if construct to increase the limit just
> for rk3588 does not seem to be worth the effort.
>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

This patch applied to the pinctrl tree.

Yours,
Linus Walleij
