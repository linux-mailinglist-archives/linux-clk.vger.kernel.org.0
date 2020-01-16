Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4941F13E90F
	for <lists+linux-clk@lfdr.de>; Thu, 16 Jan 2020 18:36:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393103AbgAPRgJ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 16 Jan 2020 12:36:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:49876 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405133AbgAPRfc (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 16 Jan 2020 12:35:32 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A08F624727;
        Thu, 16 Jan 2020 17:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579196131;
        bh=i5owRwERAnOiCFmbkU+ANJ+g3C6UCYGaMA8Usv0k760=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Nti6Bjv/vF4ohuj1mdwkY9Yday56HuA0dDg9wFRXly8c8I0YdKUme6Cl07L7bV8Hm
         sgE053t/CbWDz8V/DspezrmbDtjJqVAsHGpLjnzFcjyUrPZv/D8K+G0FrLeMyDs/jt
         o5nsGnYivZAlh+OMXZC8ZxdQdNlpkecZEvGdlPFo=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Yangtao Li <tiny.windzz@gmail.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-clk@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 035/251] clk: dove: fix refcount leak in dove_clk_init()
Date:   Thu, 16 Jan 2020 12:31:09 -0500
Message-Id: <20200116173445.21385-35-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116173445.21385-1-sashal@kernel.org>
References: <20200116173445.21385-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Yangtao Li <tiny.windzz@gmail.com>

[ Upstream commit 8d726c5128298386b907963033be93407b0c4275 ]

The of_find_compatible_node() returns a node pointer with refcount
incremented, but there is the lack of use of the of_node_put() when
done. Add the missing of_node_put() to release the refcount.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
Reviewed-by: Gregory CLEMENT <gregory.clement@bootlin.com>
Fixes: 8f7fc5450b64 ("clk: mvebu: dove: maintain clock init order")
Fixes: 63b8d92c793f ("clk: add Dove PLL divider support for GPU, VMeta and AXI clocks")
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/mvebu/dove.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mvebu/dove.c b/drivers/clk/mvebu/dove.c
index 59fad9546c84..5f258c9bb68b 100644
--- a/drivers/clk/mvebu/dove.c
+++ b/drivers/clk/mvebu/dove.c
@@ -190,10 +190,14 @@ static void __init dove_clk_init(struct device_node *np)
 
 	mvebu_coreclk_setup(np, &dove_coreclks);
 
-	if (ddnp)
+	if (ddnp) {
 		dove_divider_clk_init(ddnp);
+		of_node_put(ddnp);
+	}
 
-	if (cgnp)
+	if (cgnp) {
 		mvebu_clk_gating_setup(cgnp, dove_gating_desc);
+		of_node_put(cgnp);
+	}
 }
 CLK_OF_DECLARE(dove_clk, "marvell,dove-core-clock", dove_clk_init);
-- 
2.20.1

