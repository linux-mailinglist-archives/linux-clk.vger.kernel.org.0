Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 182471F88A7
	for <lists+linux-clk@lfdr.de>; Sun, 14 Jun 2020 13:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726786AbgFNLvp (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 14 Jun 2020 07:51:45 -0400
Received: from mga12.intel.com ([192.55.52.136]:32131 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725815AbgFNLvn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 14 Jun 2020 07:51:43 -0400
IronPort-SDR: oOtsrc5Qs0BU1AunzJUPCNgB/dPQcK+F/fCxP2DBB0X0nHRF3U9cyFhqC+7xjmB8CKU6DtI8Zg
 t9KYy21gQXGw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2020 04:51:43 -0700
IronPort-SDR: F+euaQCveme3+smFJIA40obK3hNjB9Ifhcq5d5GQxRTagYcvr6LAMFwvQM2WdLAqgQUZpNKYPp
 z6T3NHXwSS8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,511,1583222400"; 
   d="scan'208";a="475507672"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 14 Jun 2020 04:51:42 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 761F714E; Sun, 14 Jun 2020 14:51:41 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] clk: Drop duplicate selection in Kconfig
Date:   Sun, 14 Jun 2020 14:51:40 +0300
Message-Id: <20200614115140.41262-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

There is no need to select RATIONAL in individual drivers,
since common clock symbol does it already.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/clk/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 69934c0c3dd8..42301ebf06e9 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -120,7 +120,6 @@ config COMMON_CLK_SI5351
 	tristate "Clock driver for SiLabs 5351A/B/C"
 	depends on I2C
 	select REGMAP_I2C
-	select RATIONAL
 	help
 	  This driver supports Silicon Labs 5351A/B/C programmable clock
 	  generators.
@@ -162,7 +161,6 @@ config COMMON_CLK_CDCE706
 	tristate "Clock driver for TI CDCE706 clock synthesizer"
 	depends on I2C
 	select REGMAP_I2C
-	select RATIONAL
 	help
 	  This driver supports TI CDCE706 programmable 3-PLL clock synthesizer.
 
-- 
2.27.0.rc2

