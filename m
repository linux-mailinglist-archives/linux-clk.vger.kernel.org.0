Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B39665609D
	for <lists+linux-clk@lfdr.de>; Mon, 26 Dec 2022 08:05:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231583AbiLZHFT (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 26 Dec 2022 02:05:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbiLZHFS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Dec 2022 02:05:18 -0500
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95E2421AC
        for <linux-clk@vger.kernel.org>; Sun, 25 Dec 2022 23:05:17 -0800 (PST)
Received: by mail-vs1-xe2c.google.com with SMTP id m2so9645123vsv.9
        for <linux-clk@vger.kernel.org>; Sun, 25 Dec 2022 23:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=soa+SAFtKAZ0dT0XWd2urT+evcY34HAipQoZWgmMXbE=;
        b=AVkrZP9oZ8T5y66+Ca0o04Gd8v5/nPQ6wdjf01cJZw8AOtLBp2xbVGTc+6FIsZe+/4
         asslmG7k7JHTzM7dCd4zA3ZFkilt8rsQ7sdIU9bsWaAp3BJ6gKoIWHvNEnoA831efiuz
         sygRl9HVWNwI99H8FztedcqzRHZVGNhPlepx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=soa+SAFtKAZ0dT0XWd2urT+evcY34HAipQoZWgmMXbE=;
        b=qI8RcrlKrjK3yhRUequ3/+xBRyvBN2kzGhsQAiEtVGRD/UY/3WGeS5qtAGH4u+J0t4
         0z1K9P0JbmDwFez1Qh/jOJoSQ6YsplBB4GsqpjZJ3C/mKiCwdaA2GQcKueP2xU1F66s/
         cJXfR7mFppkF0Sx23dwvdB8Tj3oZBFv8AcomPP2OLTIbF8L1G5B/VpHO2BpDtmI5XReO
         cMzhgK6t7e2E17DQwPQ5HZyc5qDqGBfMEmNqDWWh1EtlOGGwU1pRD+EQ7rPU51CTYykV
         U/szEm6HN17tcOWmI6c08FuZcuZeuPtnU3caGYDlbA0nGcw6oCWxTE+2hMVddKF95XnG
         GI4A==
X-Gm-Message-State: AFqh2krxrSOBV/vfhNoBtdCE6xZcL2UFBC+tt2uun19C7WcwHJv58WBw
        /DzUwUGMhdHtPZaC+uXChVkivInq5P5MZqkEyZirEw==
X-Google-Smtp-Source: AMrXdXsgQsNveB+g3fxLQ8RqpmCH85x9K4V8BIWAdTWcIummB2ZNtDC+Ulay47RwMG6g7adIPRyBPkhBwZ2aDQ6FwOo=
X-Received: by 2002:a05:6102:74b:b0:3ad:3d65:22b with SMTP id
 v11-20020a056102074b00b003ad3d65022bmr2396976vsg.65.1672038316696; Sun, 25
 Dec 2022 23:05:16 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com> <20221223094259.87373-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221223094259.87373-4-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 26 Dec 2022 15:05:05 +0800
Message-ID: <CAGXv+5G7DFsapt5y-ujPKTTS7xxR8K1iCZ7La__D2_ZZ+hwU3g@mail.gmail.com>
Subject: Re: [PATCH v2 03/23] clk: mediatek: clk-gate: Propagate struct device
 with mtk_clk_register_gates()
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        johnson.wang@mediatek.com, miles.chen@mediatek.com,
        fparent@baylibre.com, chun-jie.chen@mediatek.com,
        sam.shih@mediatek.com, y.oudjana@protonmail.com,
        nfraprado@collabora.com, rex-bc.chen@mediatek.com,
        ryder.lee@kernel.org, daniel@makrotopia.org,
        jose.exposito89@gmail.com, yangyingliang@huawei.com,
        pablo.sun@mediatek.com, msp@baylibre.com, weiyi.lu@mediatek.com,
        ikjn@chromium.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Dec 23, 2022 at 5:43 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Commit e4c23e19aa2a ("clk: mediatek: Register clock gate with device")
> introduces a helper function for the sole purpose of propagating a
> struct device pointer to the clk API when registering the mtk-gate
> clocks to take advantage of Runtime PM when/where needed and where
> a power domain is defined in devicetree.
>
> Function mtk_clk_register_gates() then becomes a wrapper around the
> new mtk_clk_register_gates_with_dev() function that will simply pass
> NULL as struct device: this is essential when registering drivers
> with CLK_OF_DECLARE instead of as a platform device, as there will
> be no struct device to pass... but we can as well simply have only
> one function that always takes such pointer as a param and pass NULL
> when unavoidable.
>
> This commit removes the mtk_clk_register_gates() wrapper and renames
> mtk_clk_register_gates_with_dev() to the former and all of the calls
> to either of the two functions were fixed in all drivers in order to
> reflect this change.
>
> Since a lot of MediaTek clock drivers are actually registering as a
> platform device, but were still registering the mtk-gate clocks
> without passing any struct device to the clock framework, they've
> been changed to pass a valid one now, as to make all those platforms
> able to use runtime power management where available.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

However, I wonder if we could move the |struct device *| paramter to be
the first one? This matches other APIs better, notably the clk_register()
family.

Regards
ChenYu
