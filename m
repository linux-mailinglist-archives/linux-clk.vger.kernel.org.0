Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 885B860BEFE
	for <lists+linux-clk@lfdr.de>; Tue, 25 Oct 2022 01:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230308AbiJXXwe (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 24 Oct 2022 19:52:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230326AbiJXXwO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Oct 2022 19:52:14 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1602033A9B4
        for <linux-clk@vger.kernel.org>; Mon, 24 Oct 2022 15:09:53 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id c24so9594600pls.9
        for <linux-clk@vger.kernel.org>; Mon, 24 Oct 2022 15:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ByQe9Tozm56e2z/SgB3MMCCorS7ZbSTQRv+bdNrKwdE=;
        b=JgdDEVBxg/ntSWNzMrV2+DAouotMkeLAl8ig+QRuxdAxGtxDaogmaDiUj5V8NyxKfK
         WDiASJc1qpyDfiBni5iH7FGk+hafgfLKCFKh4c7X1IfD77F85ZbkjHoXkOayVMF98Bdt
         nHgATL15mNYC6xRj1cDcWULvtUJHZfhqB9x2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ByQe9Tozm56e2z/SgB3MMCCorS7ZbSTQRv+bdNrKwdE=;
        b=yS/xTDkxG6Uwcv3cR0QQ/jW7h1xZVU26a7SQbVpuaD/G6iPHP+1e6xGXa34ufusiO4
         yED6/MDox3YfHY8lzXUGDVQuPEfvRFZAsVoVe0dOhqnUVybQww/tQoD5V4M5GOGxEgEb
         ImyL8hQxAUExQh7UdCIcbKU428crnfdi9HtKany0c56xV+jb/uCcnhJDAI8XC420oOGj
         w9RShAV9Hw4WBEaLA0iJAPYT4IOOjD5FxOk44YIsFV4myWla8eun85A1i8A+m7Uoj2cV
         Kddm2cpCADvf7heVg1AX58ItTuohUwb8FsNM4sRQJ1Vbua4pO4PduZDKqpYliT9oulJp
         TC9A==
X-Gm-Message-State: ACrzQf1obRo2C+766gIran6XyUl1TDoiS0lEXTR7bry+BpdEHK6NcERt
        e7IWkgZfx7PTlrrG9hE9SxpZP3+UC2YaGLv9VpBv1LcVW8sbUA==
X-Google-Smtp-Source: AMsMyM7A2eK5sg7PivulAlOOyHSElA3puwh6IhCEXpMZi6C2X3SGLXYd7wCb17hHCkzTdu1UUZhq9l8JVdzWoRJi0cI=
X-Received: by 2002:a05:6102:38c9:b0:3a9:7206:b99e with SMTP id
 k9-20020a05610238c900b003a97206b99emr20719006vst.65.1666649379415; Mon, 24
 Oct 2022 15:09:39 -0700 (PDT)
MIME-Version: 1.0
References: <20221024102307.33722-1-angelogioacchino.delregno@collabora.com> <20221024102307.33722-7-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221024102307.33722-7-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 24 Oct 2022 15:09:28 -0700
Message-ID: <CAGXv+5Gx2hSzKSdizThXLshz0ZhO_VUwDCbckUrWOjjy1pTHZw@mail.gmail.com>
Subject: Re: [PATCH 06/10] clk: mediatek: mt6795-topckgen: Drop flags for
 main/sys/univpll fixed factors
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     sboyd@kernel.org, mturquette@baylibre.com, matthias.bgg@gmail.com,
        miles.chen@mediatek.com, nfraprado@collabora.com,
        rex-bc.chen@mediatek.com, chun-jie.chen@mediatek.com,
        jose.exposito89@gmail.com, yangyingliang@huawei.com,
        msp@baylibre.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Oct 24, 2022 at 3:23 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The main/sys/univpll clocks are used as clock sources for multiple
> peripherals of different kind, some of which are critical (like AXIs);
> a rate change on any of these two will produce a rate change on many
> devices and that's likely to produce system instability if not done
> correctly: this is the reason why we have (a lot of) "fixed factor"
> main/sys/univpll divider clocks, used by MUX clocks to provide
> different rates based on PLL output dividers.
>
> Following what was done on clk-mt8186-topckgen and also preventing the
> same GPU DVFS issue, drop CLK_SET_RATE_PARENT from the aforementioned
> clocks.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Looks good to me, but I'm less familiar with the design of this chip.
