Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8B988BF35
	for <lists+linux-clk@lfdr.de>; Tue, 13 Aug 2019 19:05:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726094AbfHMRFg (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 13 Aug 2019 13:05:36 -0400
Received: from inva021.nxp.com ([92.121.34.21]:57666 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725923AbfHMRFg (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 13 Aug 2019 13:05:36 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0AF272007C5;
        Tue, 13 Aug 2019 19:05:35 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E87312007B0;
        Tue, 13 Aug 2019 19:05:34 +0200 (CEST)
Received: from fsr-ub1864-112.ea.freescale.net (fsr-ub1864-112.ea.freescale.net [10.171.82.98])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 2F91D2060E;
        Tue, 13 Aug 2019 19:05:34 +0200 (CEST)
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Jacky Bai <ping.bai@nxp.com>, Abel Vesa <abel.vesa@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>
Cc:     Anson Huang <Anson.Huang@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        linux-clk@vger.kernel.org, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/4] clk: imx8m: Fix incorrect parents
Date:   Tue, 13 Aug 2019 20:05:27 +0300
Message-Id: <cover.1565715590.git.leonard.crestez@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

No checks are made to ensure the parents in the _sels arrays actually
exist and it turns out that several are incorrect.

I found the errors using a hack to clk core, is there a better way?
Link: https://github.com/cdleonard/linux/commit/da32c2e76eb373e8a03aec905af2eef28a7997a7

Also add imx8mn GIC clock while we're at it because otherwise parent
could get disabled and lock the system.

Leonard Crestez (4):
  clk: imx8mq: Fix sys3 pll references
  clk: imx8mm: Fix incorrect parents
  clk: imx8mn: Fix incorrect parents
  clk: imx8mn: Add GIC clock

 drivers/clk/imx/clk-imx8mm.c             |   8 +-
 drivers/clk/imx/clk-imx8mn.c             |  19 ++--
 drivers/clk/imx/clk-imx8mq.c             | 112 +++++++++++------------
 include/dt-bindings/clock/imx8mn-clock.h |   3 +-
 4 files changed, 74 insertions(+), 68 deletions(-)

-- 
2.17.1

