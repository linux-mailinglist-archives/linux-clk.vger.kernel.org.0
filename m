Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADC4B371CA5
	for <lists+linux-clk@lfdr.de>; Mon,  3 May 2021 18:56:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234476AbhECQyB (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 3 May 2021 12:54:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:34748 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233657AbhECQwB (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 3 May 2021 12:52:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F387161363;
        Mon,  3 May 2021 16:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620060100;
        bh=ORvfsTPWidhMijguO6X2vUt3yYaF9/7ZZj8+OK9Lx3k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JqdNJZNF1bRLri9RAGyBG/Z4ZeX1MiAcXPA62mpONvk7Bnv8zrj9jfP085hwT/f3+
         I5mw+5J1MmLH9xeGCQAYupt1yrODelLN9z7L70fO5v/BVM6iq0xVdGUqs3yJGcB0TO
         Wn9Il6vLSIyrciy2bkfFLWMoGfm+aggj/Y/P36UIevWEnRAE/JayTOY5Mz7bMZ/KXc
         2SxAh3ch2ze/ShmvNMQ5XPtlP3vT0SQfYkAD1gnkzatXt3EnrbLMZuxkAcY6MIsLLx
         Xl4galK1nZfKclTsfD+XErGOkoAwLK0ZNfbdtoWNMZ/xg000/o8TswM/5lFGPiGSj8
         sa635md08u2Tg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Colin Ian King <colin.king@canonical.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-clk@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 20/35] clk: socfpga: arria10: Fix memory leak of socfpga_clk on error return
Date:   Mon,  3 May 2021 12:40:54 -0400
Message-Id: <20210503164109.2853838-20-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503164109.2853838-1-sashal@kernel.org>
References: <20210503164109.2853838-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

[ Upstream commit 657d4d1934f75a2d978c3cf2086495eaa542e7a9 ]

There is an error return path that is not kfree'ing socfpga_clk leading
to a memory leak. Fix this by adding in the missing kfree call.

Addresses-Coverity: ("Resource leak")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
Link: https://lore.kernel.org/r/20210406170115.430990-1-colin.king@canonical.com
Acked-by: Dinh Nguyen <dinguyen@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/socfpga/clk-gate-a10.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/socfpga/clk-gate-a10.c b/drivers/clk/socfpga/clk-gate-a10.c
index 36376c542055..637e26babf89 100644
--- a/drivers/clk/socfpga/clk-gate-a10.c
+++ b/drivers/clk/socfpga/clk-gate-a10.c
@@ -157,6 +157,7 @@ static void __init __socfpga_gate_init(struct device_node *node,
 		if (IS_ERR(socfpga_clk->sys_mgr_base_addr)) {
 			pr_err("%s: failed to find altr,sys-mgr regmap!\n",
 					__func__);
+			kfree(socfpga_clk);
 			return;
 		}
 	}
-- 
2.30.2

