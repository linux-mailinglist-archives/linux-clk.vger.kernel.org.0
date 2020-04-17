Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AA551ADF9E
	for <lists+linux-clk@lfdr.de>; Fri, 17 Apr 2020 16:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725766AbgDQOQU (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 17 Apr 2020 10:16:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725272AbgDQOQU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Apr 2020 10:16:20 -0400
X-Greylist: delayed 302 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 17 Apr 2020 07:16:20 PDT
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CA84C061A0C
        for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2020 07:16:20 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:fd83:81bb:c1d7:433d])
        by albert.telenet-ops.be with bizsmtp
        id TqBH220074dKHqf06qBHz0; Fri, 17 Apr 2020 16:11:17 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jPRi9-0002Eo-2j; Fri, 17 Apr 2020 16:11:17 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jPRi9-000600-1Z; Fri, 17 Apr 2020 16:11:17 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] MAINTAINERS: Add DT Bindings for Renesas Clock Generators
Date:   Fri, 17 Apr 2020 16:11:16 +0200
Message-Id: <20200417141116.23019-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The "RENESAS CLOCK DRIVERS" section lacks the related DT bindings.
Add them.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in clk-renesas for v5.8.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b5edcd4bdbdf63d1..33c56d4fc5c79c7e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14367,6 +14367,7 @@ M:	Geert Uytterhoeven <geert+renesas@glider.be>
 L:	linux-renesas-soc@vger.kernel.org
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git clk-renesas
+F:	Documentation/devicetree/bindings/clock/renesas,*
 F:	drivers/clk/renesas/
 
 RENESAS EMEV2 I2C DRIVER
-- 
2.17.1

