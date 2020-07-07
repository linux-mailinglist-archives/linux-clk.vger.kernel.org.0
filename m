Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56967216BAE
	for <lists+linux-clk@lfdr.de>; Tue,  7 Jul 2020 13:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728100AbgGGLgO (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 7 Jul 2020 07:36:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727058AbgGGLgO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Jul 2020 07:36:14 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B0A6C061755
        for <linux-clk@vger.kernel.org>; Tue,  7 Jul 2020 04:36:13 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id y13so24511274lfe.9
        for <linux-clk@vger.kernel.org>; Tue, 07 Jul 2020 04:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BaUdPMwTbym0/FOb53irCXsw858iJMpd+U7fSCxbrZw=;
        b=EEgzrmFOPBRJPWSIHRYyePa9lAGoPCoxXqN3mLLCIQDZuRhWVmoWdIo9koYco7oq32
         vFLlttQN2LTQr2685xKsPGTcpR+SI/aGR9ptBAspLpMDLtnyIVcelAgEmNvUgUNT3Aw2
         5gDlCgfPKeKuRHTfhOvblO0quMu/M2GIaqhvEdyA4m0TtDrgBd9nLiKs+XRoNuQIxx5r
         xFw4hBR6ouQOf264O3KjYNKNtoiN1ZXqrS8VAVcqrL9tKo7cEpwCl77SdvW1KJAEuA12
         ZXDeXEgnbXWq7SkuqBrrVcROSIOaA257MsCDJHIFHBVIM8DlWdeE3/nbJvAeiXXL5aXt
         fYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BaUdPMwTbym0/FOb53irCXsw858iJMpd+U7fSCxbrZw=;
        b=PmgDTLDZQyiaLwuyFvhbtJFSgCmkzLuLYA3F0xYEZF8Z7alc2xGXplquiTi+idrKvR
         lzzgx63ZWSS13vBm4szCN25W1NIqbdtaOoVDWsjyWvvzV6BE6tNiDkOKA4mttu9+m90s
         hmwik9qK+/+QHL9AfhH+PRcJn/WMbwQNID2LX1MzknJ7HAJVW0lG85HboMafIOBf7INJ
         sK2EhcoT8LPkZPlVDB0RiJog3nw72QrHwPoR5+fquf86hZ/bm8ALyCiMTOi8osBIjnPp
         Va8tAIoOnSWpy6l5gwPHruPEtlxkR2cdS1UanAXaZZwvLSQ7RRZtj9E+E+a8GZBCTjdD
         W5KQ==
X-Gm-Message-State: AOAM530dySpd5C0Vl2usdqd7y6ZkVAfqnIVjwVq033+Bq7ucgX/CaSty
        2Zmn0WYu4ErtLciLkQByceOB9Y7pdDeU/4vUtfGE+A==
X-Google-Smtp-Source: ABdhPJwURK8xxItk20LIQyik7OCxh3Na7DKcSEzSy2t02n+xFYxkh4Kdd3MsRtyCZLblZdRY6s0fjloV3UCAX3MmsHk=
X-Received: by 2002:a19:7407:: with SMTP id v7mr31140846lfe.4.1594121771982;
 Tue, 07 Jul 2020 04:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <1592480018-3340-1-git-send-email-hanks.chen@mediatek.com> <1592480018-3340-6-git-send-email-hanks.chen@mediatek.com>
In-Reply-To: <1592480018-3340-6-git-send-email-hanks.chen@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jul 2020 13:36:01 +0200
Message-ID: <CACRpkdZc+PVGOXwba=ocs-VBh-sJT_1dpEVSxnjdwbmM_d0LFw@mail.gmail.com>
Subject: Re: [PATCH v6 5/7] pinctrl: mediatek: add mt6779 eint support
To:     Hanks Chen <hanks.chen@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        mtk01761 <wendell.lin@mediatek.com>,
        Andy Teng <andy.teng@mediatek.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>, wsd_upstream@mediatek.com,
        CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>,
        Mars Cheng <mars.cheng@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jun 18, 2020 at 1:34 PM Hanks Chen <hanks.chen@mediatek.com> wrote:

> add driver setting to support mt6779 eint
>
> Acked-by: Sean Wang <sean.wang@kernel.org>
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>

Patch applied.

Yours,
Linus Walleij
