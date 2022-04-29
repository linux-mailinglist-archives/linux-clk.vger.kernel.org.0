Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF894513EC2
	for <lists+linux-clk@lfdr.de>; Fri, 29 Apr 2022 00:55:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353077AbiD1W6S (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 28 Apr 2022 18:58:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350157AbiD1W6S (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Apr 2022 18:58:18 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAB80C1CA8
        for <linux-clk@vger.kernel.org>; Thu, 28 Apr 2022 15:55:00 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id m128so11633265ybm.5
        for <linux-clk@vger.kernel.org>; Thu, 28 Apr 2022 15:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cgTFMUsq9gVZz59+3kDOySK+OVbeH8W2pPDccjzuXKE=;
        b=ov2q5f2yE12o/uS00CPcFLtntiChTcYemtbGaDmhDAusLUIMEjB4VaNqGcC3WNcCPd
         L7yYE9xuB/7zZyKq9VQCxp2jIFB8CR7OFU5ZyhIOoVX3kFdYNID85+1a7J1f7sxAjjtG
         W7h8rWHl0hDVgXzxH0vvYzqteazALEC74JXOYii/DLzplO/NYZ0Lc0/ot+q4NvVAqt/I
         YIiJgCRu8Bb3hGo76YEBHfVL64mDFlBZKDBoB33icT3OC/SkBRmpCz6Nglkboa6ia0jE
         dDwfvH+RJVmQAqLIK8xM+VJl3XthUy4h6wSYEuLNngxFj+VdGOtvJcl1oBXwOwCsjeKl
         KreQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cgTFMUsq9gVZz59+3kDOySK+OVbeH8W2pPDccjzuXKE=;
        b=W5xE8apkCaB3zSeqz+B0LzdtprN6rQLO0fW9XXnmhtc6tIqNQMLmyruTALTPF4oav2
         0hhxxhrq8rOmKqeeuDtIpgURgvaFS7n9+L0noYoQ31/P3gTeWNMMHx8Y4RYmBKrUXjZ5
         TfbkxEbe1FWKRXJmmzLjDhexrRbdxj4TcFvYURb3h5yBXktl3Q/jMRiNOjX8cmPnC5B2
         WyD2jOJNqMibwPwzc5zgjZ/v6NyI7wl1TwqkgvpNWmFDm6hdaJCYOtbF3s/Y8nyAeV9H
         haot0xCb0tSmHBN9idY268esz/1+Lb/DsVAoBTVZThNtGOnl34VuGvbY0+9nxTTQhGlG
         8PSg==
X-Gm-Message-State: AOAM532Asou2S1w10F04++X6+9NMYr+NrLoRFt5OC45rl2x7B5UM3ULc
        63Mfn2gHV9B5EB9Yfy0/7SLANXfuuRMwjSC5/rVtKw==
X-Google-Smtp-Source: ABdhPJzzpmlI/Pkjo7HQbAq5Q2zszomNzPfs/JPPXY6KHrXgc/mt8oB2lus+Oi/UtX2SN9COoG/Tm2fMjSmMEsomV1M=
X-Received: by 2002:a25:bcc3:0:b0:648:7360:8e75 with SMTP id
 l3-20020a25bcc3000000b0064873608e75mr20334083ybm.533.1651186500208; Thu, 28
 Apr 2022 15:55:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220422170920.401914-1-sebastian.reichel@collabora.com> <20220422170920.401914-13-sebastian.reichel@collabora.com>
In-Reply-To: <20220422170920.401914-13-sebastian.reichel@collabora.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 29 Apr 2022 00:54:49 +0200
Message-ID: <CACRpkdZZGXMV5cnZpdat1Z_22CZE-gGfCqRHpOqnd_asw_KMwQ@mail.gmail.com>
Subject: Re: [PATCHv1 12/19] pinctrl/rockchip: add error handling for
 pull/drive register getters
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
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Apr 22, 2022 at 7:09 PM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:

> Add error handling for the pull and driver register getters in preparation
> for RK3588 support.
>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Patch applied.

Yours,
Linus Walleij
