Return-Path: <linux-clk+bounces-232-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F08607ED0A5
	for <lists+linux-clk@lfdr.de>; Wed, 15 Nov 2023 20:56:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 998DA1F268B7
	for <lists+linux-clk@lfdr.de>; Wed, 15 Nov 2023 19:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 327E43D3B7;
	Wed, 15 Nov 2023 19:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LxmZEKG9"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15471286B6;
	Wed, 15 Nov 2023 19:56:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8C91C433C9;
	Wed, 15 Nov 2023 19:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700078206;
	bh=colsCBiZ5rEuEKm8hctz+RNECfyn8Sk5X8ahyDvL5cE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LxmZEKG9ijvmzFsEMK28dW6ISwsfXSmyJOOQWYGzOZWXQEP9W2k/bIysoP4VY7sKt
	 VCpa3PuQHOmWTITaOel3TcFkUj90maXMX/NiNQ+kA2qZyMZYafSB1wjjUxi0I5mDqi
	 4dfOGxokr6nZpnDN2jyG/1zGu/aNXTpZA6Crs630=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.1 178/379] clk: scmi: Free scmi_clk allocated when the clocks with invalid info are skipped
Date: Wed, 15 Nov 2023 14:24:13 -0500
Message-ID: <20231115192655.635718403@linuxfoundation.org>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231115192645.143643130@linuxfoundation.org>
References: <20231115192645.143643130@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

6.1-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Sudeep Holla <sudeep.holla@arm.com>

[ Upstream commit 3537a75e73f3420614a358d0c8b390ea483cc87d ]

Add the missing devm_kfree() when we skip the clocks with invalid or
missing information from the firmware.

Cc: Cristian Marussi <cristian.marussi@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Fixes: 6d6a1d82eaef ("clk: add support for clocks provided by SCMI")
Link: https://lore.kernel.org/r/20231004193600.66232-1-sudeep.holla@arm.com
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/clk-scmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index 2c7a830ce3080..fdec715c9ba9b 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -213,6 +213,7 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
 		sclk->info = scmi_proto_clk_ops->info_get(ph, idx);
 		if (!sclk->info) {
 			dev_dbg(dev, "invalid clock info for idx %d\n", idx);
+			devm_kfree(dev, sclk);
 			continue;
 		}
 
-- 
2.42.0




