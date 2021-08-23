Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C70563F4B1E
	for <lists+linux-clk@lfdr.de>; Mon, 23 Aug 2021 14:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237143AbhHWMvJ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 23 Aug 2021 08:51:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237118AbhHWMvI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Aug 2021 08:51:08 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02C66C061757
        for <linux-clk@vger.kernel.org>; Mon, 23 Aug 2021 05:50:26 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id i9so37655069lfg.10
        for <linux-clk@vger.kernel.org>; Mon, 23 Aug 2021 05:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JaVX46aQ+V25UIMXASQYuq5exbppMpl9+jwK0qjbA9w=;
        b=QHyjy8vxmJ2E7RBLJOkvcAQat6PnacE5+TOWtL32+HgOI/BMwW2ecb+uDywPWjwt2Q
         XvXjbMsPMxSe/1ZLPpHXxbAGA4N7d9U8L6mpZnk8FnH6YaQp7XYaI/LCoXv2n5oy4mAu
         gBChrriDPr7/Arrz4k75yo7ELEVuQe+5+V59U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JaVX46aQ+V25UIMXASQYuq5exbppMpl9+jwK0qjbA9w=;
        b=JM8983tCz1pOCdD6G1ZNoRH+cp7haV08ULFA4zLzsaOysz53X3YO3jGUrGcJsNDl9F
         nwfelLE8ppiI82puBBFIbY7xGSju7jzOeqqOymYld5CRH4vJjOY4TnVSiXhgpz4149eO
         2qdrQ5LC8Bz72uGwBhI/KUZGGVuJbNwWTBrXgo+DwWNxrkNOOxaP3rlZFwtpJlHsVa6l
         ksFKpow0/aU/IydYjWBHeSh9Sfv9TfKzXkqauxW945sSCd8S/GGV39XZQi5pFprM464x
         Ax4OlZZ7807RCIH+AFG7urGkoKa+Bfc/NeUz7azn/AZBvxOX6FfrDR0m1nqfYd1Oxenw
         Pecg==
X-Gm-Message-State: AOAM5327XtOXk5TRY68Ag0KInKz60oC6jo5Jyt9lWMigLAqiwoGyKk+X
        q7JpQgdkEMLgHF8isLb1fWkygeqWDFKsXrP7utONAQ==
X-Google-Smtp-Source: ABdhPJw6toCNVTyqjq3up8DTak/+y7rMwN30zZbzOMJMC3UnKVTDsk/Re2QMsobWKxKRqccqaE7mhnKWfSo1ip9RYOY=
X-Received: by 2002:a05:6512:3b98:: with SMTP id g24mr17315353lfv.276.1629723024425;
 Mon, 23 Aug 2021 05:50:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210820111504.350-1-chun-jie.chen@mediatek.com> <20210820111504.350-24-chun-jie.chen@mediatek.com>
In-Reply-To: <20210820111504.350-24-chun-jie.chen@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 23 Aug 2021 20:50:13 +0800
Message-ID: <CAGXv+5EDn=OjghzN6wzx0RF4k=h6eKAY6qdf278WZbANHnoGUw@mail.gmail.com>
Subject: Re: [v2 23/24] clk: mediatek: Add MT8195 imp i2c wrapper clock support
To:     Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, linux-clk@vger.kernel.org,
        Devicetree List <devicetree@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Project_Global_Chrome_Upstream_Group 
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Aug 20, 2021 at 7:36 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 imp i2c wrapper clock controllers which provide clock gate
> control in IIC IP blocks.

Standard terminology is I2C.

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
