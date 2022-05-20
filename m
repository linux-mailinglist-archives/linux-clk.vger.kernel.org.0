Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10B5F52E402
	for <lists+linux-clk@lfdr.de>; Fri, 20 May 2022 06:49:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345401AbiETEtw (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 20 May 2022 00:49:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242333AbiETEtv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 May 2022 00:49:51 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB6B213C1DD
        for <linux-clk@vger.kernel.org>; Thu, 19 May 2022 21:49:50 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id rs12so1736961ejb.13
        for <linux-clk@vger.kernel.org>; Thu, 19 May 2022 21:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G+rF6dhHbqvrEHl1JWCO7qzVBXB368ohsf4MuiTQiGc=;
        b=ZOuuxSvg8cjtrSjVsHC3HrcS4loCp7wFy+f6Np3AgYS0CzySnmkUv+4mYG9zHnv8ne
         1vAVNQiWeEr2Yn9HphkCERYB38suK9P+DcVnterVzxpYuv4Mq+IVxpVVS1J/MIuFojpQ
         /y4nqyfZ1QbwjMIy5PtGCH35SRYTPqk9OI9B4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G+rF6dhHbqvrEHl1JWCO7qzVBXB368ohsf4MuiTQiGc=;
        b=Pzk2LeOyGXPMLssnK2uhGZC1vI05WgV1+63RGYn0yjhCJR1PRhLxs6ma1s0mIo7+XT
         5szZiosX6BZmZkLdidtFnJA00MSISPgmf3JZZitalWaYsGYRuMRoQVp6Qc6U8f+RW440
         5LgGtaxHFCnR2aaG05y/7X7KcHGIgoWYXQdrGSgZqUqbmRTiuBYul47MJnm+Bz6zdFj1
         wqgtYFJASQn35n6Vq+4mlud40SAgPpz+IX4iVqSNI8xle12NbyUzDD85s7PAXSifSJtK
         3d2nywaImlvcTi4bdVaMi0RKuFHkXFhtGkdr7zjw5E4NLFznqHxdAoFx/oVvVrbHtlPR
         no8Q==
X-Gm-Message-State: AOAM533uh6I2rTjLtRSKmqFi9crCYK569aK2LTAmUFMDCTEEle63kmZS
        fl5hT+7hGhJD3w79yRaqgicVPJ2KdZoryT5jDx94Ng==
X-Google-Smtp-Source: ABdhPJzGKNfnnGJBNEgXcSGNHSdo0I8dXA7F0rfAVqQ9CybvOQZe8592uBcZxReyMAUCaispAKzhJxf4iQLyBJlbE0s=
X-Received: by 2002:a17:906:c142:b0:6da:9781:ae5d with SMTP id
 dp2-20020a170906c14200b006da9781ae5dmr6803613ejc.73.1653022189315; Thu, 19
 May 2022 21:49:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220519134728.456643-1-y.oudjana@protonmail.com> <20220519134728.456643-3-y.oudjana@protonmail.com>
In-Reply-To: <20220519134728.456643-3-y.oudjana@protonmail.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 20 May 2022 12:49:38 +0800
Message-ID: <CAGXv+5GnjY1DOWHx-B4PZqNi5tnWOgYQ_TCk6YzhtEnPQnVVnA@mail.gmail.com>
Subject: Re: [PATCH 2/6] clk: mediatek: Use mtk_clk_register_gates_with_dev in
 simple probe
To:     Yassine Oudjana <yassine.oudjana@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Miles Chen <miles.chen@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
        Rex-BC Chen <rex-bc.chen@mediatek.com>,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, May 19, 2022 at 9:49 PM Yassine Oudjana
<yassine.oudjana@gmail.com> wrote:
>
> From: Yassine Oudjana <y.oudjana@protonmail.com>
>
> Register gates with dev in mtk_clk_simple_probe.
>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
