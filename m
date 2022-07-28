Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1948583CA4
	for <lists+linux-clk@lfdr.de>; Thu, 28 Jul 2022 12:58:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235111AbiG1K6E (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 28 Jul 2022 06:58:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236634AbiG1K55 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Jul 2022 06:57:57 -0400
Received: from mail.baikalelectronics.com (unknown [87.245.175.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0AD6A61B0D;
        Thu, 28 Jul 2022 03:57:49 -0700 (PDT)
Received: from mail (mail.baikal.int [192.168.51.25])
        by mail.baikalelectronics.com (Postfix) with ESMTP id 74C1E16CB;
        Thu, 28 Jul 2022 14:00:10 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.baikalelectronics.com 74C1E16CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baikalelectronics.ru; s=mail; t=1659006010;
        bh=JHMHt2qpKhob8kZ7cQLsQ2KwSOX6LYlaQszSvkgfFhc=;
        h=From:To:CC:Subject:Date:From;
        b=WNALO59Dl43FslNE+aPgfpPwc4BGmHLZYMbwhCw1fx69WeR02uMeJax50r/1uKE3C
         xO1VrrGZ5WROU7Vx3TDLzuPngSqpa+4c2U0O2FGtojqCIBVJ2/s1K5yvSAck2X7Sns
         QSBW565nXR31OHMqNsWBMAYKjEDNMliVdjKPzhUo=
Received: from localhost (192.168.53.207) by mail (192.168.51.25) with
 Microsoft SMTP Server (TLS) id 15.0.1395.4; Thu, 28 Jul 2022 13:57:45 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        <linux-clk@vger.kernel.org>, <linux-mips@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 0/7] clk/resets: baikal-t1: Add DDR/PCIe resets and xGMAC/SATA fixes
Date:   Thu, 28 Jul 2022 13:57:28 +0300
Message-ID: <20220728105736.8266-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,T_SPF_PERMERROR
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

@Stephen, @Michael

It has been over five months since the first series submission for
review. Moreover the reset-part has already got @Philipp's ab tag.
Please merge it in.

Short summary regarding this patchset. The series starts from fixing of
the clocks glitching cause by the Renesas 5P49V6901 chip in some
circumstances. Afterwards a few more modifications are introduced to
finally finish the Baikal-T1 CCU unit support up and prepare the code
before adding the Baikal-T1 PCIe/xGMAC support. First of all it turned out
I specified wrong DW xGMAC PTP reference clock divider in my initial
patches. It must be 8, not 10. Secondly I was wrong to add a joint xGMAC
Ref and PTP clock instead of having them separately defined.  The SoC
manual describes these clocks as separate fixed clock wrappers. Finally
in order to close the SoC clock/reset support up we need to add the DDR
and PCIe interfaces reset controls support. It's done in two steps. First
I've moved the reset-controls-related code into a dedicated module. Then
the DDR/PCIe reset-control functionality is added. As the series
finalization we've decided to convert the Baikal-T1 clock/reset source
drivers to mainly being the platform device driver and pre-initialize the
basic clocks only at the early kernel boot stages.

Link: https://lore.kernel.org/linux-pci/20220324010905.15589-1-Sergey.Semin@baikalelectronics.ru/
Changelog v2:
- Resubmit the series with adding @Philipp to the list of the recipients.

Link: https://lore.kernel.org/linux-pci/20220330144320.27039-1-Sergey.Semin@baikalelectronics.ru/
Changelog v3:
- No comments. Just resend the series.
- Rebased from v5.17 onto v5.18-rc3.

Link: https://lore.kernel.org/linux-clk/20220503205722.24755-1-Sergey.Semin@baikalelectronics.ru/
Changelog v4:
- Completely split the CCU Dividers and Resets functionality up. (@Stephen)
- Add a new fixes patch: "clk: baikal-t1: Actually enable SATA internal
  ref clock".
- Add a new fixes patch: "reset: Fix devm bulk optional exclusive control
  getter".
- Add a new fixes patch: "clk: vc5: Fix 5P49V6901 outputs disabling when
  enabling FOD".
- Add a new feagure patch: "clk: baikal-t1: Convert to platform device
  driver".
- Change the internal clock ID to the XGMAC-referred name.
- Rebase onto the kernel v5.18.

Link: https://lore.kernel.org/lkml/20220610072124.8714-1-Sergey.Semin@baikalelectronics.ru/
Changelog v5:
- Just resend.
- Rebase onto the kernel v5.19-rcX.

Link: https://lore.kernel.org/linux-clk/20220624141853.7417-1-Sergey.Semin@baikalelectronics.ru/
Changelog v6:
- Drop the patch
  [PATCH RESEND v5 1/8] reset: Fix devm bulk optional exclusive control getter
  since it has already been accepted by @Philipp.
- Refactor the reset-control code to support the linear reset IDs only.
  (@Philipp)
- Combine the reset-related code into a single file. (@Philipp)
- Drop CCU_DIV_RST_MAP() macro. It's no longer used.

Link: https://lore.kernel.org/linux-clk/20220708192725.9501-1-Sergey.Semin@baikalelectronics.ru/
Changelog v7:
- Fix "Alignment should match open parenthesis" warning for the
  pr_err() method invocations. (@Philipp)
- Drop empty line from the sys_rst_info structure initialization block.
  (@Philipp)

Link: https://lore.kernel.org/linux-clk/20220711154433.15415-1-Sergey.Semin@baikalelectronics.ru/
Changelog v8:
- Fix "sef-deasserted" spelling in the CLK_BT1_CCU_RST config help
  text. (@Randy)

Link: https://lore.kernel.org/linux-clk/20220712121505.5671-1-Sergey.Semin@baikalelectronics.ru
Changelog v9:
- Just resend.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-clk@vger.kernel.org
Cc: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Serge Semin (7):
  clk: vc5: Fix 5P49V6901 outputs disabling when enabling FOD
  clk: baikal-t1: Fix invalid xGMAC PTP clock divider
  clk: baikal-t1: Add shared xGMAC ref/ptp clocks internal parent
  clk: baikal-t1: Add SATA internal ref clock buffer
  clk: baikal-t1: Move reset-controls code into a dedicated module
  clk: baikal-t1: Add DDR/PCIe directly controlled resets support
  clk: baikal-t1: Convert to platform device driver

 drivers/clk/baikal-t1/Kconfig       |  12 +-
 drivers/clk/baikal-t1/Makefile      |   1 +
 drivers/clk/baikal-t1/ccu-div.c     |  84 +++++++--
 drivers/clk/baikal-t1/ccu-div.h     |  17 +-
 drivers/clk/baikal-t1/ccu-pll.h     |   8 +
 drivers/clk/baikal-t1/ccu-rst.c     | 217 +++++++++++++++++++++++
 drivers/clk/baikal-t1/ccu-rst.h     |  67 +++++++
 drivers/clk/baikal-t1/clk-ccu-div.c | 263 ++++++++++++++++------------
 drivers/clk/baikal-t1/clk-ccu-pll.c | 128 +++++++++++---
 drivers/clk/clk-versaclock5.c       |   2 +-
 include/dt-bindings/reset/bt1-ccu.h |   9 +
 11 files changed, 647 insertions(+), 161 deletions(-)
 create mode 100644 drivers/clk/baikal-t1/ccu-rst.c
 create mode 100644 drivers/clk/baikal-t1/ccu-rst.h

-- 
2.35.1

