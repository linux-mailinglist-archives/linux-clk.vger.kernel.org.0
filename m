Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FC209AAED
	for <lists+linux-clk@lfdr.de>; Fri, 23 Aug 2019 10:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393347AbfHWI7V (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 23 Aug 2019 04:59:21 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33618 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393338AbfHWI7V (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Aug 2019 04:59:21 -0400
Received: by mail-lf1-f66.google.com with SMTP id x3so6620274lfc.0
        for <linux-clk@vger.kernel.org>; Fri, 23 Aug 2019 01:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GxUgalfpHvlU7G4S1EP7MwtQKJLrxEoCVtsJwnBq2SU=;
        b=w0B3dzBTa3+JyrZeVRsr9ly//+C08gCfIk8KvddiJai9vJRoezhj54mrdyVwb1cbFl
         sRPkN+bru2wP4dmVDTkn20UOrljSktzElsDLmYwfeNBsz3BkNKlwWa6y0Kr4+GWEfwG1
         YK9K3GDGdmw/+mt4yBZZ0rCBOvJ2wRiMivQwwjJJnFfQXf1LiACtdWqo7SnZbI9pSXdG
         FdguDX7EHD7VaI4fG3ApljZIFeKDUrSvlzeHp0Se0NWNeZNXwlDemX+J/tIyKK2beWBF
         YkS5UFt+u6TP+JMCmWolrRdMU/+bvPBegM8ACCpr9RWdg/IGiTuhMcKbWCZioaHt7WP/
         FWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GxUgalfpHvlU7G4S1EP7MwtQKJLrxEoCVtsJwnBq2SU=;
        b=XUP6Ipkl7DGMI9EGrbhzgAJDmcH+tnRf4x2QfOBhsYM+wuUIypj4RgDz7eA7vWIiUW
         7uNu+rYrI5GBiiwIJlCNNxdgiUHtBx1svKumoHy4Btwa+loUIKYNhdzSSzCtxpzXpGF3
         8PR49UbdSZka7zl/k8PLmD1PFAoRRucBP2dNbdrzBSr957YtHjV/IW+L6honDVW72djf
         3uC8jiklHGmcS72RvjKweAbw5RU5ONl4LjsxlzJM4Pvl0MjfS5khz4wzs125D5x4HUNR
         odeT+3VwOXuLksF/hlG8qidkUMMugTr/blSHCnhWwijNkLT4x7kfbylMk66LHZn4eGe5
         kNcA==
X-Gm-Message-State: APjAAAW4jKBg+i0N1/pxTE7p2bg4qj8DuH5wYGhp1mTHFemZVUhB7DGd
        TjlV/s3IN86fs/O44E3L8odcGjdRblg4sASiM7oVAg==
X-Google-Smtp-Source: APXvYqw5ndRJYH6Pq0vRfXqvSpTurLxTZpp9+LCmk3CwLeQH9ygW2pVl8/ZMQ7YOPv6vJPkMu932f3Yxr6LWZ0GzqPI=
X-Received: by 2002:a19:ed11:: with SMTP id y17mr2096873lfy.141.1566550759342;
 Fri, 23 Aug 2019 01:59:19 -0700 (PDT)
MIME-Version: 1.0
References: <1566206502-4347-1-git-send-email-mars.cheng@mediatek.com>
 <1566206502-4347-7-git-send-email-mars.cheng@mediatek.com> <CAGp9LzoVwNxY8Q3G4hxpa7=orsEox+J0mNamag70wyjrGvDiZw@mail.gmail.com>
In-Reply-To: <CAGp9LzoVwNxY8Q3G4hxpa7=orsEox+J0mNamag70wyjrGvDiZw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Aug 2019 10:59:08 +0200
Message-ID: <CACRpkdbZY2vZBaEXDMsjLxA1NGYWirhCdspu0W-foXJX=Fd4yg@mail.gmail.com>
Subject: Re: [PATCH v2 06/11] pinctrl: mediatek: add pinctrl support for
 MT6779 SoC
To:     Sean Wang <sean.wang@kernel.org>
Cc:     Mars Cheng <mars.cheng@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>,
        lkml <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, wsd_upstream@mediatek.com,
        mtk01761 <wendell.lin@mediatek.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Andy Teng <andy.teng@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Aug 22, 2019 at 8:12 PM Sean Wang <sean.wang@kernel.org> wrote:
> On Mon, Aug 19, 2019 at 2:22 AM Mars Cheng <mars.cheng@mediatek.com> wrote:
> >
> > This adds MT6779 pinctrl driver based on MediaTek pinctrl-paris core.
> >
> > Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> > Signed-off-by: Andy Teng <andy.teng@mediatek.com>
>
> Acked-by: Sean Wang <sean.wang@kernel.org>

Please look at the DT bindings as well when you have time, and
especially the "virtual GPIO" patch, I don't understand that at all.

I suspect the "virtual GPIO" is maybe more about something that
should be done by setting up the valid_mask in the gpio_chip
or something.

Yours,
Linus Walleij
