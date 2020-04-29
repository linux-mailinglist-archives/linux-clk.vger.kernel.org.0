Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A371F1BEA54
	for <lists+linux-clk@lfdr.de>; Wed, 29 Apr 2020 23:54:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgD2VyH (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 29 Apr 2020 17:54:07 -0400
Received: from muru.com ([72.249.23.125]:51748 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726511AbgD2VyH (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 29 Apr 2020 17:54:07 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id E73E4810A;
        Wed, 29 Apr 2020 21:54:53 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <aford173@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Brian Hutchinson <b.hutchman@gmail.com>,
        Graeme Smecher <gsmecher@threespeedlogic.com>,
        Keerthy <j-keerthy@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCHv2 00/15] Update omaps to use drivers/clocksource timers
Date:   Wed, 29 Apr 2020 14:53:47 -0700
Message-Id: <20200429215402.18125-1-tony@atomide.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi all,

Here's v2 series to udpate omaps to use drivers/clocksource timers for
the 32k counter and dmtimer, and to remove the old legacy platform code.
Please review and test.

I've updated the timer-ti-dm-systimer.c patch based on the comments from
Daniel, and also updated the dts files accordingly.

Then for merging when folks are happy with this series, Daniel if you
can please apply the first three patches into an immutable branch it
would be great.

Regards,

Tony


Tony Lindgren (15):
  clocksource/drivers/timer-ti-32k: Add support for initializing
    directly
  dt-bindings: timer: add ti,dmtimer compatible for for system timers
  clocksource/drivers/timer-ti-dm: Add clockevent and clocksource
    support
  clk: ti: dm816: enable sysclk6_ck on init
  bus: ti-sysc: Ignore timer12 on secure omap3
  ARM: OMAP2+: Add omap_init_time_of()
  ARM: dts: Configure system timers for am335x
  ARM: dts: Configure system timers for am437x
  ARM: dts: Configure system timers for omap4
  ARM: dts: Configure system timers for omap5 and dra7
  ARM: dts: Configure system timers for omap3
  ARM: dts: Configure system timers for ti81xx
  ARM: dts: Configure system timers for omap2
  ARM: OMAP2+: Drop old timer code for dmtimer and 32k counter
  bus: ti-sysc: Timers no longer need legacy quirk handling

 .../devicetree/bindings/timer/ti,timer.txt    |   1 +
 arch/arm/boot/dts/am33xx-l4.dtsi              |   6 +-
 arch/arm/boot/dts/am33xx.dtsi                 |  24 +
 arch/arm/boot/dts/am3517.dtsi                 |  28 +-
 arch/arm/boot/dts/am4372.dtsi                 |  24 +
 arch/arm/boot/dts/am437x-l4.dtsi              |   7 +-
 arch/arm/boot/dts/dm814x.dtsi                 |  78 ++-
 arch/arm/boot/dts/dm816x.dtsi                 |  82 ++-
 arch/arm/boot/dts/dra7-l4.dtsi                |   7 +-
 arch/arm/boot/dts/dra7.dtsi                   |  11 +
 arch/arm/boot/dts/omap2.dtsi                  |  31 +-
 arch/arm/boot/dts/omap2420.dtsi               |  69 ++-
 arch/arm/boot/dts/omap2430.dtsi               |  69 ++-
 arch/arm/boot/dts/omap3-beagle.dts            |  33 +
 arch/arm/boot/dts/omap3-devkit8000.dts        |  33 +
 arch/arm/boot/dts/omap3.dtsi                  | 135 ++++-
 arch/arm/boot/dts/omap4-l4.dtsi               |   4 +-
 arch/arm/boot/dts/omap4.dtsi                  |  11 +
 arch/arm/boot/dts/omap5-l4.dtsi               |   4 +-
 arch/arm/boot/dts/omap5.dtsi                  |  11 +
 arch/arm/mach-omap2/Makefile                  |   4 +-
 arch/arm/mach-omap2/board-generic.c           |  32 +-
 arch/arm/mach-omap2/common.h                  |   7 +
 arch/arm/mach-omap2/omap_hwmod_2420_data.c    |  20 -
 arch/arm/mach-omap2/omap_hwmod_2430_data.c    |  19 -
 .../omap_hwmod_2xxx_interconnect_data.c       |   8 -
 .../mach-omap2/omap_hwmod_2xxx_ipblock_data.c |  47 --
 .../omap_hwmod_33xx_43xx_common_data.h        |   2 -
 .../omap_hwmod_33xx_43xx_interconnect_data.c  |   8 -
 .../omap_hwmod_33xx_43xx_ipblock_data.c       |  62 --
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c    |  10 -
 arch/arm/mach-omap2/omap_hwmod_3xxx_data.c    | 146 +----
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c    |  45 --
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c    |  90 ---
 arch/arm/mach-omap2/omap_hwmod_54xx_data.c    |  89 ---
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c     | 176 ------
 arch/arm/mach-omap2/omap_hwmod_81xx_data.c    |  74 ---
 arch/arm/mach-omap2/omap_hwmod_common_data.h  |   3 -
 arch/arm/mach-omap2/timer.c                   | 568 +-----------------
 drivers/bus/ti-sysc.c                         |  25 +-
 drivers/clk/ti/clk-816x.c                     |   1 +
 drivers/clocksource/Makefile                  |   1 +
 drivers/clocksource/timer-ti-32k.c            |  48 +-
 drivers/clocksource/timer-ti-dm-systimer.c    | 511 ++++++++++++++++
 44 files changed, 1179 insertions(+), 1485 deletions(-)
 create mode 100644 drivers/clocksource/timer-ti-dm-systimer.c

-- 
2.26.2
