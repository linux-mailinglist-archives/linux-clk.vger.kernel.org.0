Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E82015F3B7
	for <lists+linux-clk@lfdr.de>; Thu,  4 Jul 2019 09:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727358AbfGDH06 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 4 Jul 2019 03:26:58 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:42732 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbfGDH06 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 Jul 2019 03:26:58 -0400
Received: by mail-lf1-f65.google.com with SMTP id s19so2796306lfb.9
        for <linux-clk@vger.kernel.org>; Thu, 04 Jul 2019 00:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J+Ba5vmuqSqIoQZUfrVFUAlnYym6OvIM55l/Sf2uuaQ=;
        b=bhZ+K8GhK9VkN3k2GoJp7VboKKDOCk8N+9ilQC1UfpnTVZQU/M/q3ZV0uKtJMhzrLp
         WR6N+xp8EdWHY5N8G/8c+dzXsqsPB2kGRDj8imJLl//BnAuQ1uqx8v1aiVk4g/jjUf5y
         7wDs7m5sqPGqGItDDmsY+ZkZbaX6Qxjr32U4EyS938hj2LRPuQVFSq+iyPqP0CPpu9tF
         c3YzO1fONoujRaSYnPaeiB5EM2eLuI5p1X0QincmyDYQLCCuvxzikG6GdRRAvYMmDEXg
         MQB/FhlGlVNR+MMzKi/APvc581uXYARpuzFWoVZ62fMr4qsN//N6Rj+O00zFxm5rVUP2
         /oYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J+Ba5vmuqSqIoQZUfrVFUAlnYym6OvIM55l/Sf2uuaQ=;
        b=ANXBoFHvqxw+3v/ktgr/j4aVE0DcmmjV42kF/GzbCkGrQ39RcDjv+Ww0+zeIpRovfz
         5/7TzgncXTekj2DJm2gdQX+4WCJevTvfqblwEFkQNEdYCo8tZ37rctK6u9ahhi4wedhj
         LARsnJcrEt4N9h/zM/qZWb+XKiAb8WDpTCOnngYkismM1h/8PQa0WSKbN0FAzVLeZ/Dv
         p8TUugPKP7x5/l9agT+nKhpyDBS7q4c3N8/wIbggOx4Pt8AuQZmJ3XuFxvT9lTeOaoL5
         4X7ja78tAW8HoUmOAJ8im1BNVMzaw5o0JWNawQXY4HGs1g/zZBaMicSqDPPhe3FUCghn
         IE+Q==
X-Gm-Message-State: APjAAAX9vhmV499/oB8liTMnvQH+cpkeMEa+PBOtUK2zt96+MrgWINO5
        SVhLHQ1SNtw9vNUGrLvSgn+ZDxYJbNUdpPv+ittGjg==
X-Google-Smtp-Source: APXvYqwNzEjm08f5v1JSveVg/JRpWRlOEA0F0/jHeUfvrHLnDXF0UuVE85NvMlSbzQ06gTd+F91sZZ7/wpwLHY8mq10=
X-Received: by 2002:ac2:5c42:: with SMTP id s2mr4215393lfp.61.1562225216742;
 Thu, 04 Jul 2019 00:26:56 -0700 (PDT)
MIME-Version: 1.0
References: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com> <1561687972-19319-3-git-send-email-skomatineni@nvidia.com>
In-Reply-To: <1561687972-19319-3-git-send-email-skomatineni@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 4 Jul 2019 09:26:45 +0200
Message-ID: <CACRpkdYfuNK4rShCqpf7hyKDzL_1JgiW=k8Y=CMs_Hx-+vnmVQ@mail.gmail.com>
Subject: Re: [PATCH V5 02/18] pinctrl: tegra: Add suspend and resume support
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Stefan Agner <stefan@agner.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        jckuo@nvidia.com, Joseph Lo <josephl@nvidia.com>, talho@nvidia.com,
        linux-tegra@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>, spatra@nvidia.com,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Jun 28, 2019 at 4:13 AM Sowjanya Komatineni
<skomatineni@nvidia.com> wrote:

> This patch adds support for Tegra pinctrl driver suspend and resume.
>
> During suspend, context of all pinctrl registers are stored and
> on resume they are all restored to have all the pinmux and pad
> configuration for normal operation.
>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>

Looks good.

Can I just apply this patch or does it need to go in with
the other (clk) changes?

Yours,
Linus Walleij
