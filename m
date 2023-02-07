Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32ED668D338
	for <lists+linux-clk@lfdr.de>; Tue,  7 Feb 2023 10:49:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231419AbjBGJto (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 7 Feb 2023 04:49:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231204AbjBGJtn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Feb 2023 04:49:43 -0500
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F5122E0F9
        for <linux-clk@vger.kernel.org>; Tue,  7 Feb 2023 01:49:42 -0800 (PST)
Received: by mail-vk1-xa35.google.com with SMTP id g25so3980vkk.11
        for <linux-clk@vger.kernel.org>; Tue, 07 Feb 2023 01:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YoW3sjlSzqH6ySQMRZbQRxMotG8FJyB7q2pV+SeilrM=;
        b=g2IUWbA4gGq0AVgEaJMonDk+PY1GyDAWQ1luMTjMLAlvh/+9cE/NrqaQj1S0Y/IMJM
         VQUkPzq0sY7z0gCgMS5B6nczHQ/c4a5W/imV0oP6cAIiBbRncsWLULqSd7GyoRZcb3OK
         zzDmyfFZl05yo1SHwisn1V5xitiF52XUzoNQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YoW3sjlSzqH6ySQMRZbQRxMotG8FJyB7q2pV+SeilrM=;
        b=HDSDRyUFlDhoGLj4X6ULeq1v2Puls76Qv6I5xzCnKG+LIWeNc73jw4JEKoc/u7zPoS
         H0Vh5gbtAeZCRuVbsd2ToBB0yY6di+++a/wsX+ZTIuKaJvjKWE0Pd2QrS/iDtEq55S/d
         m75U1622YFzDdRH7kvM2eDnJdvGNWDxZBJeOV71sVg/uUZ++oAArXXZMIRtoXYCjy7t3
         8jo19RU5G5fqgIbcxIDVKY1+cJ4oOrGbbzjsMRuWKsy/ogvJWDBlc28o04vK7MbCnO55
         AEBKvkqoGC4bHoaaC1WVZmWuoRXdjpSQjP9yr5V6wGBUe2l55wJ8IUoTuUd6vRgsHtU8
         hGWA==
X-Gm-Message-State: AO0yUKWInORYHaG+h+eOEM1fpg8rZLpcfY0hysPYOoADeHpgjg40loYJ
        RP6b2y2qfGNCB4CFRhc+MmWu3UbzYkICcYYTmtZWZg==
X-Google-Smtp-Source: AK7set8D6nY7w9ShU5K2U8eRiHiDa9ibytJS0Wv6eY0rGBr0MJsKEKzmlFXTcfeZomR8j6SmMRYHpsgb6aDQlDYucJs=
X-Received: by 2002:a1f:9493:0:b0:3ea:7394:e9ef with SMTP id
 w141-20020a1f9493000000b003ea7394e9efmr317423vkd.11.1675763381226; Tue, 07
 Feb 2023 01:49:41 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com>
 <847332fb-5f10-a8dd-4203-a1906973d0ff@collabora.com> <CAGXv+5GUaWzoPZuO3ZUX60exZeg2S=91u-i1bGOraV1AcWP9Og@mail.gmail.com>
 <ea5b8fd0-579e-12e1-d9ca-775b6db30f69@collabora.com>
In-Reply-To: <ea5b8fd0-579e-12e1-d9ca-775b6db30f69@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 7 Feb 2023 17:49:30 +0800
Message-ID: <CAGXv+5F3eReSDY2ZLVSg4RoT-H9uA9G1zboN5e_8x-beuZC9sA@mail.gmail.com>
Subject: Re: [PATCH v1 00/45] MediaTek clocks: full module build and cleanups
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
        johnson.wang@mediatek.com, miles.chen@mediatek.com,
        chun-jie.chen@mediatek.com, daniel@makrotopia.org,
        fparent@baylibre.com, msp@baylibre.com, nfraprado@collabora.com,
        rex-bc.chen@mediatek.com, zhaojh329@gmail.com,
        sam.shih@mediatek.com, edward-jw.yang@mediatek.com,
        yangyingliang@huawei.com, granquet@baylibre.com,
        pablo.sun@mediatek.com, sean.wang@mediatek.com,
        chen.zhong@mediatek.com, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Feb 7, 2023 at 5:19 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 07/02/23 10:04, Chen-Yu Tsai ha scritto:
> > On Mon, Feb 6, 2023 at 11:38 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Il 06/02/23 16:28, AngeloGioacchino Del Regno ha scritto:
> >>> This is part 2 of the "MediaTek clocks cleanups and improvements" series,
> >>> which was already picked.
> >>>
> >>> If reading this full cover letter is too boring for you, here's a short
> >>> summary of the changes of this series:
> >>>    - Added mtk_clk_pdev_probe() for mtk-mmsys probed clocks;
> >>>    - Added divider clock support to common probe mechanism;
> >>>    - Various cleanups here and there;
> >>>    - Converted most clock drivers to platform_driver;
> >>>    - MediaTek clocks can now be built as modules.
> >>>
> >>> NOTE: Applies on top of [1].
> >>>
> >>>
> >
> > Something broke on MT8183 Juniper, though I'm not sure what. It ended up
> > crashing in mtk-cpufreq in a badly written error path. Once that was fixed
> > it was endlessly looping through deferred probe. Seems like mtk-cpufreq
> > was not able to get all its resources.
> >
>
> I would be silly to expect everything to go alright in v1, wouldn't I? :-)
> I'll recheck and try to understand what went wrong here.

"clk: mediatek: mt8183: Convert all remaining clocks to common probe" is
the first patch that breaks things.

ChenYu
