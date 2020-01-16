Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5183C13F79B
	for <lists+linux-clk@lfdr.de>; Thu, 16 Jan 2020 20:13:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387469AbgAPTM6 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 16 Jan 2020 14:12:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:43974 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387435AbgAPQ5I (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 16 Jan 2020 11:57:08 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4758921D56;
        Thu, 16 Jan 2020 16:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579193828;
        bh=avXqc5KA2Ev0UHhePAXgSI1BiUN8Gtq0LGx8b4d8lvQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fQuu39//UnvNtYgGNrcYIKUJdRjZ2X46YRQRbeGxzotjB63gURHJ4eFvXCqSAj3is
         zIpyiWZLpSqdzoI150rSsSBaqP2rJZMiDXVGmuYyor9WzWituPdRCq0JS3oTrcp0+a
         JNh18Gru/vH3Xcpc4R1zEwiMU0fnzv5MaaaVuOx4=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Yangtao Li <tiny.windzz@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-clk@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 085/671] clk: qoriq: fix refcount leak in clockgen_init()
Date:   Thu, 16 Jan 2020 11:45:16 -0500
Message-Id: <20200116165502.8838-85-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116165502.8838-1-sashal@kernel.org>
References: <20200116165502.8838-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Yangtao Li <tiny.windzz@gmail.com>

[ Upstream commit 70af6c5b5270e8101f318c4b69cc98a726edfab9 ]

The of_find_compatible_node() returns a node pointer with refcount
incremented, but there is the lack of use of the of_node_put() when
done. Add the missing of_node_put() to release the refcount.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
Fixes: 0dfc86b3173f ("clk: qoriq: Move chip-specific knowledge into driver")
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/clk-qoriq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-qoriq.c b/drivers/clk/clk-qoriq.c
index 8abc5c8cb8b8..a0713b2a12f3 100644
--- a/drivers/clk/clk-qoriq.c
+++ b/drivers/clk/clk-qoriq.c
@@ -1389,6 +1389,7 @@ static void __init clockgen_init(struct device_node *np)
 				pr_err("%s: Couldn't map %pOF regs\n", __func__,
 				       guts);
 			}
+			of_node_put(guts);
 		}
 
 	}
-- 
2.20.1

