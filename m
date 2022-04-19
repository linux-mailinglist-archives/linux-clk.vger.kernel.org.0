Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD67E506416
	for <lists+linux-clk@lfdr.de>; Tue, 19 Apr 2022 07:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234457AbiDSGA3 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 19 Apr 2022 02:00:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234305AbiDSGA2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Apr 2022 02:00:28 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12A8A2C138
        for <linux-clk@vger.kernel.org>; Mon, 18 Apr 2022 22:57:47 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id s33so1781463ybi.12
        for <linux-clk@vger.kernel.org>; Mon, 18 Apr 2022 22:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s2Mq/KXo85I/OUkWdk3Gw91RvgR7MItesWK3GhJYw2c=;
        b=W8YN/I6gYh88jAVMIihLdgPNL0d595w85B0bL7H/J/0P/ofL9dUZ/FBBHUkwKWony1
         f4A/TTKiLVqKO5pelo16M9HF5hB6OZ6UlX8RcpDhJxB6eR7D1pIiV+n2P8lqTNL52FiS
         1xuVeivp+Zb50XAJLeqP8h9VeuekXid5cqUwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s2Mq/KXo85I/OUkWdk3Gw91RvgR7MItesWK3GhJYw2c=;
        b=jU70O1CTB0An1BbKLmJMAAfie06X3aZ8N8y1KGtpXjUKKlqbmA2dRgOT2SPQXHGHlE
         pHdYA493YRSbkpuBNGm6DXP0FL8fw8WdHJ1VkV8phvQkXQ1MaaKU0QK+ISn7JM97rxWi
         3XGU+5FQ+/LCFfbACYqJnbin12VGgJvZ1a6uDYkHgBqy0HsVr/qKS4qW127igMaPLs+d
         NQ1aCgQI25vm5y0Qz2kdwc3rMogbbHEiddzWph+9MuWHyW4lkArJNI75611nPyXOfMAQ
         5n7rbpKAmkA8SJvWpVMwHqUt28vaNP1hhGh41MH6sfQBUm8AnJ4o+R6zazAxIcqQCA+Y
         TKMg==
X-Gm-Message-State: AOAM532UYmWwCAH8WmR6wEpcaZ0uNU2wFNU7sJ2uNMbw701Hh+Li3D3A
        S6eIxXE8F0nV8aYlTGAlF9Loe4yZY2q9uFrfuja23A==
X-Google-Smtp-Source: ABdhPJwYYcBxOtEG5s9zmIzc+xRZY7jcR0X2MW3EEbzIamXgJPjnppX5NLhhFjn6M6KCHWX9mrjp8DSSyVdk3/Ca/cY=
X-Received: by 2002:a25:8d90:0:b0:634:7136:4570 with SMTP id
 o16-20020a258d90000000b0063471364570mr13341740ybl.582.1650347866332; Mon, 18
 Apr 2022 22:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220418132154.7401-1-rex-bc.chen@mediatek.com> <20220418132154.7401-3-rex-bc.chen@mediatek.com>
In-Reply-To: <20220418132154.7401-3-rex-bc.chen@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 19 Apr 2022 13:57:35 +0800
Message-ID: <CAGXv+5F027EsJCG4zQarcoqCR8S4tew1n1DjeqU7_+HOzmZs2Q@mail.gmail.com>
Subject: Re: [PATCH 2/7] clk: mediatek: reset: Rename reset function
To:     Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
        p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com,
        chun-jie.chen@mediatek.com, yong.liang@mediatek.com,
        runyang.chen@mediatek.com, linux-kernel@vger.kernel.org,
        allen-kh.cheng@mediatek.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Apr 18, 2022 at 9:22 PM Rex-BC Chen <rex-bc.chen@mediatek.com> wrote:
>
> There are two version for clock reset register control of MediaTek SoCs.
> Since MT8183, the version 2 is adopted.
>
> To make the driver more readable,
> - Rename them to v2 for MT8183 and v1 for previous SoCs.
> - Adjust the fuinction order in reset.c.

I'm not sure that the renaming actually helps, since it is not given that
people outside of MediaTek would know which chip use which version. The
original name of "_set_clr" at least relays how the hardware works, which
coupled with the register naming in the datasheets make it quite obvious
if the hardware is using the "set/clr" variant.

On a different note, the v1 hardware, where a hardware bit represents the
state, is quite common, and there is a common reset driver that handles it.
Perhaps that could be reused instead of code duplicated?
See drivers/reset/reset-simple.c.


Thanks
ChenYu
