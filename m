Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B46F6293249
	for <lists+linux-clk@lfdr.de>; Tue, 20 Oct 2020 02:17:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389309AbgJTARA (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 19 Oct 2020 20:17:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:60756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727220AbgJTARA (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 19 Oct 2020 20:17:00 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A5F8620637;
        Tue, 20 Oct 2020 00:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603153019;
        bh=tZT7sWuz8c1hvr10guCDW3+G39WjrKlazjDfJy7HCCA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ZpNGVBvWrHges5zua3oES2ZJm+47tqhKSWGyXrTvI0prS4tRp+O1TLZT2+hRCzEJ5
         rXwvz1T4+IUrJinqLqLsAkX429QrmUDkx6zKNw6YkTr2z7ZzMds+v/LSPH+o9HwX1s
         AjxavIcmpE5GaoKAAlx4xYcCjD6zJ1zP5xcqBjj8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAJKOXPduq7OSeSD9nbJG+DFK4n-WUzvED2s9d7pUNTA0+ya1Ww@mail.gmail.com>
References: <20201015114725.23137-1-daire.mcnamara@microchip.com> <20201015114725.23137-3-daire.mcnamara@microchip.com> <CAJKOXPduq7OSeSD9nbJG+DFK4n-WUzvED2s9d7pUNTA0+ya1Ww@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] CLK: microchip: Add driver for Microchip PolarFire SoC
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, linux-clk@vger.kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        padmarao.begari@microchip.com, david.abdurachmanov@gmail.com
To:     Krzysztof Kozlowski <krzk@kernel.org>, daire.mcnamara@microchip.com
Date:   Mon, 19 Oct 2020 17:16:58 -0700
Message-ID: <160315301824.884498.14688775786937252027@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Krzysztof Kozlowski (2020-10-15 05:52:30)
> On Thu, 15 Oct 2020 at 14:25, <daire.mcnamara@microchip.com> wrote:
> > +struct pfsoc_cfg_hw_clock {
> > +       struct pfsoc_cfg_clock cfg;
> > +       void __iomem *sys_base;
> > +       /* lock is used to prevent multiple writes */
> > +       spinlock_t *lock;
>=20
> Doesn't the core already provide you locking? Why do you need it?
>=20

Please keep the lock. The core has locking for itself and it shouldn't
be relied upon to ensure that register writes in this driver are
protected from each other, assuming that clks are sharing registers and
need to be protected from each other.

> > +       struct clk_hw hw;
> > +       struct clk_init_data init;
> > +};
> > +
