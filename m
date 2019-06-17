Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4179C48323
	for <lists+linux-clk@lfdr.de>; Mon, 17 Jun 2019 14:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728030AbfFQMw7 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 17 Jun 2019 08:52:59 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:40264 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727541AbfFQMw7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Jun 2019 08:52:59 -0400
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id Rosg2000e3XaVaC06osgLK; Mon, 17 Jun 2019 14:52:46 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hcr7n-0001ru-Hn; Mon, 17 Jun 2019 14:52:39 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hcr7n-0003al-FW; Mon, 17 Jun 2019 14:52:39 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/5] clk: renesas: rcar-gen2/gen3: Switch to .determine_rate()
Date:   Mon, 17 Jun 2019 14:52:33 +0200
Message-Id: <20190617125238.13761-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

	Hi Mike, Stephen,

As the .round_rate() callback returns a long clock rate, it cannot
return clock rates that do not fit in signed long, but do fit in
unsigned long.  The newer .determine_rate() callback does not suffer
from this limitation.  In addition, .determine_rate() provides the
ability to specify a rate range.

Hence this patch series switches the Z (CPU) and SD clocks in the R-Car
Gen2 and Gen3 clock drivers from the .round_rate() to the
.determine_rate() callback.

Note that the "div6" clock driver hasn't been converted yet, so div6
clocks still use .round_rate().

This has been tested on R-Car M2-W and R-Car M3-N, and should have no
behavioral impact.

To be queued in clk-renesas-for-v5.3, if approved.

Thanks for your comments!

Geert Uytterhoeven (5):
  clk: renesas: rcar-gen2-legacy: Switch Z clock to .determine_rate()
  clk: renesas: rcar-gen2: Switch Z clock to .determine_rate()
  clk: renesas: rcar-gen3: Switch Z clocks to .determine_rate()
  clk: renesas: rcar-gen3: Avoid double table iteration in SD
    .set_rate()
  clk: renesas: rcar-gen3: Switch SD clocks to .determine_rate()

 drivers/clk/renesas/clk-rcar-gen2.c | 23 ++++++-----
 drivers/clk/renesas/rcar-gen2-cpg.c | 23 ++++++-----
 drivers/clk/renesas/rcar-gen3-cpg.c | 64 ++++++++++++++++-------------
 3 files changed, 61 insertions(+), 49 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
