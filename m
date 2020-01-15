Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BE7213CED9
	for <lists+linux-clk@lfdr.de>; Wed, 15 Jan 2020 22:25:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728903AbgAOVZe (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 15 Jan 2020 16:25:34 -0500
Received: from mga09.intel.com ([134.134.136.24]:63375 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726501AbgAOVZe (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 15 Jan 2020 16:25:34 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Jan 2020 13:25:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,323,1574150400"; 
   d="scan'208";a="213841133"
Received: from maru.jf.intel.com ([10.54.51.77])
  by orsmga007.jf.intel.com with ESMTP; 15 Jan 2020 13:25:34 -0800
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To:     Joel Stanley <joel@jms.id.au>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>
Cc:     linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH 0/2] clk: aspeed/ast2600: Add critical clock setting logic
Date:   Wed, 15 Jan 2020 13:26:37 -0800
Message-Id: <20200115212639.4998-1-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This commit adds critical clock setting logic that applies
CLK_IS_CRITICAL flag if it detects 'clock-critical' property in
device tree. With this patch, each platform can enable critical clocks
through device tree setting like below:

&syscon {
	clock-critical = <ASPEED_CLK_GATE_BCLK>,
			 <ASPEED_CLK_GATE_MCLK>,
			 <ASPEED_CLK_GATE_REFCLK>;
};

Please review.

Thanks,

Jae

Jae Hyun Yoo (2):
  clk: aspeed: add critical clock setting logic
  clk: ast2600: add critical clock setting logic

 drivers/clk/clk-aspeed.c  | 5 ++++-
 drivers/clk/clk-ast2600.c | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.17.1

