Return-Path: <linux-clk+bounces-5938-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 500C18A57F4
	for <lists+linux-clk@lfdr.de>; Mon, 15 Apr 2024 18:38:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07CF4281454
	for <lists+linux-clk@lfdr.de>; Mon, 15 Apr 2024 16:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EBAA85269;
	Mon, 15 Apr 2024 16:37:16 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC68A84D0F;
	Mon, 15 Apr 2024 16:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713199036; cv=none; b=Nm7RLVSwR5zT6ipuF6ternHLSJgZmk2E5ppou9/djpkYb1gzZiBLC8e/h+n18kenCZN6SCeHa9xT4N6/1OoIxQfNmx8/k1uOU9IC8JBvXZG2tIHrSWOkBcI6IeUOsfigvGRXzT6S1XgmUj2mMa3x4eEksSSJhcpetem5YgIUKXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713199036; c=relaxed/simple;
	bh=f6rYvbpMRk0zMKV+IFoHYzZ1EY90ZTkLFXL72ExvXuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a9M9zUGUkBILSIq00MktTRKBNtbWA4tVIUjN17pJ75GhaTrW4JUvel6qFVy7ewH8E8ZxiVOA+vkSNojCN0Gn7up+P189KGHrjluQ7i/8vKtQTiM93NwIKsjwByz+xJzynX9/rA/aXLw+2P1Uym5ssLiI5uqmkuRWT6kZ0lsYsQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CEF331476;
	Mon, 15 Apr 2024 09:37:42 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1FB493F64C;
	Mon, 15 Apr 2024 09:37:12 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Cc: sudeep.holla@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	quic_sibis@quicinc.com,
	quic_nkela@quicinc.com,
	souvik.chakravarty@arm.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v3 4/5] clk: scmi: Add support for re-parenting restricted clocks
Date: Mon, 15 Apr 2024 17:36:48 +0100
Message-ID: <20240415163649.895268-5-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240415163649.895268-1-cristian.marussi@arm.com>
References: <20240415163649.895268-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some exposed SCMI Clocks could be marked as non-supporting re-parenting
changes.
Configure a clk_ops descriptor which does not provide the re-parenting
callbacks for such clocks when registering with CLK framework.

CC: Michael Turquette <mturquette@baylibre.com>
CC: Stephen Boyd <sboyd@kernel.org>
CC: linux-clk@vger.kernel.org
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v2 --> v3
- using SCMI_CLK_PARENT_CTRL_SUPPORTED instead of _FORBIDDEN
---
 drivers/clk/clk-scmi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index ba234b56f742..ce0f26ee632f 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -21,6 +21,7 @@ enum scmi_clk_feats {
 	SCMI_CLK_ATOMIC_SUPPORTED,
 	SCMI_CLK_STATE_CTRL_SUPPORTED,
 	SCMI_CLK_RATE_CTRL_SUPPORTED,
+	SCMI_CLK_PARENT_CTRL_SUPPORTED,
 	SCMI_CLK_FEATS_COUNT
 };
 
@@ -254,7 +255,8 @@ scmi_clk_ops_alloc(struct device *dev, unsigned long feats_key)
 
 	/* Parent ops */
 	ops->get_parent = scmi_clk_get_parent;
-	ops->set_parent = scmi_clk_set_parent;
+	if (feats_key & BIT(SCMI_CLK_PARENT_CTRL_SUPPORTED))
+		ops->set_parent = scmi_clk_set_parent;
 
 	return ops;
 }
@@ -307,6 +309,9 @@ scmi_clk_ops_select(struct scmi_clk *sclk, bool atomic_capable,
 	if (!ci->rate_ctrl_forbidden)
 		feats_key |= BIT(SCMI_CLK_RATE_CTRL_SUPPORTED);
 
+	if (!ci->parent_ctrl_forbidden)
+		feats_key |= BIT(SCMI_CLK_PARENT_CTRL_SUPPORTED);
+
 	if (WARN_ON(feats_key >= db_size))
 		return NULL;
 
-- 
2.44.0


