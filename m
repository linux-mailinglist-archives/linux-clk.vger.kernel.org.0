Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD6227A86E
	for <lists+linux-clk@lfdr.de>; Mon, 28 Sep 2020 09:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbgI1HTd (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 28 Sep 2020 03:19:33 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:27870 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbgI1HTd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Sep 2020 03:19:33 -0400
Received: from twspam01.aspeedtech.com (localhost [127.0.0.2] (may be forged))
        by twspam01.aspeedtech.com with ESMTP id 08S6gdVU009890
        for <linux-clk@vger.kernel.org>; Mon, 28 Sep 2020 14:42:39 +0800 (GMT-8)
        (envelope-from ryan_chen@aspeedtech.com)
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 08S6fvxN009735;
        Mon, 28 Sep 2020 14:41:57 +0800 (GMT-8)
        (envelope-from ryan_chen@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.9) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 28 Sep
 2020 15:01:12 +0800
From:   Ryan Chen <ryan_chen@aspeedtech.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        <bmc-sw@aspeedtech.com>
CC:     Ryan Chen <ryan_chen@aspeedtech.com>
Subject: [PATCH 0/1] Modify ASPEED SoC some default clks are critical
Date:   Mon, 28 Sep 2020 15:01:07 +0800
Message-ID: <20200928070108.14040-1-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.10.9]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 08S6fvxN009735
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch is modify for ASPEED SoC some default clks can't disable
need keep default clk on.

Ryan Chen (1):
  clk: aspeed: modify some default clks are critical

 drivers/clk/clk-aspeed.c  | 8 ++++----
 drivers/clk/clk-ast2600.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.17.1

