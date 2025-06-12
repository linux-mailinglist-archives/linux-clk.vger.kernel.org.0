Return-Path: <linux-clk+bounces-22881-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BBDAD70EF
	for <lists+linux-clk@lfdr.de>; Thu, 12 Jun 2025 14:57:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9C231BC417C
	for <lists+linux-clk@lfdr.de>; Thu, 12 Jun 2025 12:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C8523C511;
	Thu, 12 Jun 2025 12:57:11 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3F1239E8B
	for <linux-clk@vger.kernel.org>; Thu, 12 Jun 2025 12:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749733031; cv=none; b=jydsHtjOoCQcLQYYlDDCJvDVI8onwybzZYTx8fzOgrBxwCOuNL8MDob/zgjP6fQWr/enmwUDzMZ5sgCgq8KBR1xrZU7lLxi7mRtu4XPUpcVnRt95D6QHYgpa1xsD6r4zG28d2Ht2MlY0m3upYonFR8KjtEH7mGW636yd5znYruU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749733031; c=relaxed/simple;
	bh=8JxZvtllvWjakpqaItxlNl6mV192kL0bUL2elT1gdg8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=APpNSXIN7xxv3v3lKBPHndthuDEVsoiyed5RBSKBKtHZK4001WGufn7cXzHiepjcTdl5jLGHJvDcN2UMBEAmZyLu6bcGIgd0LR2GceRvS9Wn2hrAwlpJZSOYEfDWbrQ4JnJIz2609eWfJwnYDoDM1mrfpnWQFuiek9al9KAxFAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1uPhUK-0000zC-FR; Thu, 12 Jun 2025 14:57:00 +0200
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1uPhUJ-0037ot-38;
	Thu, 12 Jun 2025 14:56:59 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1uPhUJ-009XzG-2p;
	Thu, 12 Jun 2025 14:56:59 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Thu, 12 Jun 2025 14:56:57 +0200
Subject: [PATCH v3] clk: scmi: Handle case where child clocks are
 initialized before their parents
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-clk-scmi-children-parent-fix-v3-1-7de52a27593d@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAJjOSmgC/43NsQ6CMBDG8VcxnT3THtCAk+9hHAoccBELabHBE
 N7dwmTioMsl/2/43SI8OSYvzodFOArsebAxkuNBVJ2xLQHXsQVKzKSWKVT9HXz1YKg67mtHFkY
 T7wQNz5BmJi8UlnlppIjE6CjOO3+9xe7YT4N77d+C2tY/4aBAQUkodZGlda71ZSTbPic3WJ5PN
 YlND/ghKvwhYhQVZiVqkyjVfIvrur4BQ4iYJx8BAAA=
X-Change-ID: 20250604-clk-scmi-children-parent-fix-45a8912b8ba0
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749733019; l=3681;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=8JxZvtllvWjakpqaItxlNl6mV192kL0bUL2elT1gdg8=;
 b=xqjx5SXlcU2Ed4jQFMiktyqTi6Z0JkHykWrzmP0gJEUGdicSyjHF16tl+zPPtt3VLDIjVxUUV
 yB47GgqkLEKD70pqW0GzduIb2sbwnpcP1EpkCsZGkmiHxoRzNiS6FW5
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

The SCMI clock driver currently assumes that parent clocks are always
initialized before their children. However, this assumption can fail if
a child clock is encountered before its parent during probe.

This leads to an issue during initialization of the parent_data array:

    sclk->parent_data[i].hw = hws[sclk->info->parents[i]];

If the parent clock's hardware structure has not been initialized yet,
this assignment results in invalid data.

To resolve this, allocate all struct scmi_clk instances as a contiguous
array at the beginning of the probe and populate the hws[] array
upfront. This ensures that any parent referenced later is already
initialized, regardless of the order in which clocks are processed.

Note that we can no longer free individual scmi_clk instances if
scmi_clk_ops_init() fails which shouldn't be a problem if the SCMI
platform has proper per-agent clock discovery.

Fixes: 65a8a3dd3b95f ("clk: scmi: Add support for clock {set,get}_parent")
Reviewed-by: peng.fan@nxp.com
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
Changes in v3:
- Reword commit message
- Add Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
- Link to v2: https://lore.kernel.org/r/20250612-clk-scmi-children-parent-fix-v2-1-125b26a311f6@pengutronix.de

Changes in v2:
- Collect reviewed-by from Cristian Marussi and Peng Fan
- Do not use a local variable that is only used once (Christian)
- Link to v1: https://lore.kernel.org/r/20250604-clk-scmi-children-parent-fix-v1-1-be206954d866@pengutronix.de
---
 drivers/clk/clk-scmi.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index 15510c2ff21c0335f5cb30677343bd4ef59c0738..1b1561c84127b9e41bfb6096ceb3626f32c4fee0 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -404,6 +404,7 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
 	const struct scmi_handle *handle = sdev->handle;
 	struct scmi_protocol_handle *ph;
 	const struct clk_ops *scmi_clk_ops_db[SCMI_MAX_CLK_OPS] = {};
+	struct scmi_clk *sclks;
 
 	if (!handle)
 		return -ENODEV;
@@ -430,18 +431,21 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
 	transport_is_atomic = handle->is_transport_atomic(handle,
 							  &atomic_threshold_us);
 
+	sclks = devm_kcalloc(dev, count, sizeof(*sclks), GFP_KERNEL);
+	if (!sclks)
+		return -ENOMEM;
+
+	for (idx = 0; idx < count; idx++)
+		hws[idx] = &sclks[idx].hw;
+
 	for (idx = 0; idx < count; idx++) {
-		struct scmi_clk *sclk;
+		struct scmi_clk *sclk = &sclks[idx];
 		const struct clk_ops *scmi_ops;
 
-		sclk = devm_kzalloc(dev, sizeof(*sclk), GFP_KERNEL);
-		if (!sclk)
-			return -ENOMEM;
-
 		sclk->info = scmi_proto_clk_ops->info_get(ph, idx);
 		if (!sclk->info) {
 			dev_dbg(dev, "invalid clock info for idx %d\n", idx);
-			devm_kfree(dev, sclk);
+			hws[idx] = NULL;
 			continue;
 		}
 
@@ -479,13 +483,11 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
 		if (err) {
 			dev_err(dev, "failed to register clock %d\n", idx);
 			devm_kfree(dev, sclk->parent_data);
-			devm_kfree(dev, sclk);
 			hws[idx] = NULL;
 		} else {
 			dev_dbg(dev, "Registered clock:%s%s\n",
 				sclk->info->name,
 				scmi_ops->enable ? " (atomic ops)" : "");
-			hws[idx] = &sclk->hw;
 		}
 	}
 

---
base-commit: 5abc7438f1e9d62e91ad775cc83c9594c48d2282
change-id: 20250604-clk-scmi-children-parent-fix-45a8912b8ba0

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>


