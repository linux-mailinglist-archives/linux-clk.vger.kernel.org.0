Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9D2252AEE7
	for <lists+linux-clk@lfdr.de>; Wed, 18 May 2022 01:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232236AbiEQX7i (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 17 May 2022 19:59:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232197AbiEQX7f (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 May 2022 19:59:35 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D532B3CFFE;
        Tue, 17 May 2022 16:59:33 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 7B90C83443;
        Wed, 18 May 2022 01:59:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1652831971;
        bh=zZKzb0S0vDToEPGNqgl5ecWix8u9mDZmnQno2RYa9+g=;
        h=From:To:Cc:Subject:Date:From;
        b=UE7BZjiS/W4iOQCgZfbpmdsHzC3JhcqhxoDBra7CmEzeQQstWw6bHj71rwIh8Na9s
         BcdqTbnRX6UTEStGGi3B+h3UzW/zpiEFK4XFaWyL7MEc5qdiFoot+N7q3rMLH1RPUK
         +xWWtrP993jYkc1jwkmBCbS9FOKO+1fvKcw6xiusHRC+JFCZ+yR1JdHk3rIRrcUOrL
         v1pTGUcrRwPxnnsYx/04+cysNtAeFcY4pvoR+ryX+f0mmEXuF9woekPzh+lbrMe3aT
         ymw5jGTtuHumLme2JDwFl1hRN5vfcxlSMfyJj0zU9kLOTRL3BDo2d3os6orPytwdMS
         AIjT1IsYoaQRg==
From:   Marek Vasut <marex@denx.de>
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: clk: Introduce 'critical-clocks' property
Date:   Wed, 18 May 2022 01:59:18 +0200
Message-Id: <20220517235919.200375-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some platforms require select clock to be always running, e.g. because
those clock supply vital devices which are not otherwise attached to
the system and thus do not have a matching DT node and clock consumer.

An example is a system where the SoC serves as a crystal oscillator
replacement for a programmable logic device. The "critical-clocks"
property of a clock controller allows listing clock which must never
be turned off.

Clock listed in the "critical-clocks" property may have other consumers
in DT, listing the clock in "critical-clocks" only assures those clock
are never turned off, and none of these optional additional consumers
can turn the clock off either.

The implementation is modeled after "protected-clocks".

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
To: linux-clk@vger.kernel.org
---
V2: Update the commit message to clarify the behavior
V3: s@Some platforms require clock@Some platforms require some clocks@
---
 .../devicetree/bindings/clock/clock-bindings.txt | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt b/Documentation/devicetree/bindings/clock/clock-bindings.txt
index f2ea53832ac63..d7f7afe2cbd0c 100644
--- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
+++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
@@ -169,6 +169,22 @@ a shared clock is forbidden.
 Configuration of common clocks, which affect multiple consumer devices can
 be similarly specified in the clock provider node.
 
+==Critical clocks==
+
+Some platforms require some clocks to be always running, e.g. because those
+clock supply devices which are not otherwise attached to the system. One
+example is a system where the SoC serves as a crystal oscillator replacement
+for a programmable logic device. The critical-clocks property of a clock
+controller allows listing clock which must never be turned off.
+
+   clock-controller@a000f000 {
+        compatible = "vendor,clk95;
+        reg = <0xa000f000 0x1000>
+        #clocks-cells = <1>;
+        ...
+        critical-clocks = <UART3_CLK>, <SPI5_CLK>;
+   };
+
 ==Protected clocks==
 
 Some platforms or firmwares may not fully expose all the clocks to the OS, such
-- 
2.35.1

