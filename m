Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7581045A70
	for <lists+linux-clk@lfdr.de>; Fri, 14 Jun 2019 12:32:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbfFNKcF (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 14 Jun 2019 06:32:05 -0400
Received: from gloria.sntech.de ([185.11.138.130]:39088 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726083AbfFNKcE (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 14 Jun 2019 06:32:04 -0400
Received: from we0305.dip.tu-dresden.de ([141.76.177.49] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1hbjV0-0004UU-OB; Fri, 14 Jun 2019 12:31:58 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     "Leonidas P. Papadakos" <papadakospan@gmail.com>
Cc:     itdaniher@gmail.com, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: rockchip: add clock for the watchdog pclk on rk3328
Date:   Fri, 14 Jun 2019 12:31:58 +0200
Message-ID: <2207770.HSO279VB62@phil>
In-Reply-To: <1560506054.1367.0@gmail.com>
References: <20190605235714.22432-1-papadakospan@gmail.com> <5657669.4RvfzeBcXs@phil> <1560506054.1367.0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

Am Freitag, 14. Juni 2019, 11:54:14 CEST schrieb Leonidas P. Papadakos:
> 
> > Were you able yet to take a look at the clock-patches I Cc'ed you on
> > and look at reworking your patch accrodingly?
> > 
> > 
> > Thanks
> > Heiko
> > 
> My time is limited due to exams, and I have no knowledge on how the clk 
> stuff works, but I'll read up when I have the time. The patched you 
> CCed me on is certainly helpful in this regard

ok. I have tested the conversion on the platforms I did convert there,
so I'll just apply the 2 patches later on.

Should I wait on you respinning the rk3328 watchdog patch, or just
add the rk3328 watchdog pclk myself?


Heiko


