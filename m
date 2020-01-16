Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA74913E616
	for <lists+linux-clk@lfdr.de>; Thu, 16 Jan 2020 18:18:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391457AbgAPRSY (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 16 Jan 2020 12:18:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:45694 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391021AbgAPRSX (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 16 Jan 2020 12:18:23 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 446F920728;
        Thu, 16 Jan 2020 17:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579195103;
        bh=tTXgJ4yQ2CfwceTQzvDnr1V0GRvj/lrJuLv4lsjxcs0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EcyjCOPTyrXxfCdNNo0hoDxrHEOqln+fuZ1/LlxVbwPTVNS55eQiSKVklFmCmqnRg
         VLsF+vnVhxBznavyMvxyQGDF7HQ6hKgvRkudDvDqWCqLif8qzHpB98nqAOdudfmiPa
         TsriD6w9icZsBp94eRnw/OXbP9nI5j2GIKX9RiNU=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Yangtao Li <tiny.windzz@gmail.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-clk@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 047/371] clk: mv98dx3236: fix refcount leak in mv98dx3236_clk_init()
Date:   Thu, 16 Jan 2020 12:11:55 -0500
Message-Id: <20200116171719.16965-47-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116171719.16965-1-sashal@kernel.org>
References: <20200116171719.16965-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Yangtao Li <tiny.windzz@gmail.com>

[ Upstream commit 9b4eedf627045ae5ddcff60a484200cdd554c413 ]

The of_find_compatible_node() returns a node pointer with refcount
incremented, but there is the lack of use of the of_node_put() when
done. Add the missing of_node_put() to release the refcount.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
Reviewed-by: Gregory CLEMENT <gregory.clement@bootlin.com>
Fixes: 337072604224 ("clk: mvebu: Expand mv98dx3236-core-clock support")
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/mvebu/mv98dx3236.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mvebu/mv98dx3236.c b/drivers/clk/mvebu/mv98dx3236.c
index 6e203af73cac..c8a0d03d2cd6 100644
--- a/drivers/clk/mvebu/mv98dx3236.c
+++ b/drivers/clk/mvebu/mv98dx3236.c
@@ -174,7 +174,9 @@ static void __init mv98dx3236_clk_init(struct device_node *np)
 
 	mvebu_coreclk_setup(np, &mv98dx3236_core_clocks);
 
-	if (cgnp)
+	if (cgnp) {
 		mvebu_clk_gating_setup(cgnp, mv98dx3236_gating_desc);
+		of_node_put(cgnp);
+	}
 }
 CLK_OF_DECLARE(mv98dx3236_clk, "marvell,mv98dx3236-core-clock", mv98dx3236_clk_init);
-- 
2.20.1

