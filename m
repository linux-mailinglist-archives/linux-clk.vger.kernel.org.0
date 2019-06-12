Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29DA042A37
	for <lists+linux-clk@lfdr.de>; Wed, 12 Jun 2019 17:04:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408637AbfFLPD6 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 12 Jun 2019 11:03:58 -0400
Received: from ns.iliad.fr ([212.27.33.1]:40876 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2408311AbfFLPD6 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 12 Jun 2019 11:03:58 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 15DF8202EC;
        Wed, 12 Jun 2019 17:03:57 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id F2B0720D88;
        Wed, 12 Jun 2019 17:03:56 +0200 (CEST)
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: [PATCH v1] clk: xgene: Don't build COMMON_CLK_XGENE by default
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Feng Kan <fkan@apm.com>
Message-ID: <68c0d022-569c-c529-047a-a0bfae17994d@free.fr>
Date:   Wed, 12 Jun 2019 17:03:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Wed Jun 12 17:03:57 2019 +0200 (CEST)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Building COMMON_CLK_XGENE is pointless, unless we're building for
an XGENE system.

Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
---
 drivers/clk/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index fc1e0cf44995..b97974662a1f 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -215,7 +215,7 @@ config CLK_QORIQ
 
 config COMMON_CLK_XGENE
 	bool "Clock driver for APM XGene SoC"
-	default y
+	default ARCH_XGENE
 	depends on ARM64 || COMPILE_TEST
 	---help---
 	  Sypport for the APM X-Gene SoC reference, PLL, and device clocks.
-- 
2.17.1
