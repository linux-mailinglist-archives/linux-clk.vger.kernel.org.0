Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8A46B6813
	for <lists+linux-clk@lfdr.de>; Wed, 18 Sep 2019 18:28:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731958AbfIRQ2l (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 18 Sep 2019 12:28:41 -0400
Received: from muru.com ([72.249.23.125]:33678 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731935AbfIRQ2k (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 18 Sep 2019 12:28:40 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 1B6B0806C;
        Wed, 18 Sep 2019 16:29:10 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org
Subject: [PATCH 0/2] dra7 mcasp clock warning fixes
Date:   Wed, 18 Sep 2019 09:28:30 -0700
Message-Id: <20190918162832.25784-1-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

So the dra7 mcasp clock warning turned out to be a bit more of a mess than
expected :) Below are two fixes to correct the clock data and dts use of
the clocks.

Please review and ack if this looks OK. I'd like to merge these via my
fixes branch during the -rc cycle.

Regards,

Tony


Tony Lindgren (2):
  clk: ti: dra7: Fix mcasp8 clock bits
  ARM: dts: Fix wrong clocks for dra7 mcasp

 arch/arm/boot/dts/dra7-l4.dtsi | 48 +++++++++++++++-------------------
 drivers/clk/ti/clk-7xx.c       |  6 ++---
 2 files changed, 24 insertions(+), 30 deletions(-)

-- 
2.23.0
