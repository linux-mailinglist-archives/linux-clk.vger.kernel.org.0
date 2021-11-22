Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 672E9459840
	for <lists+linux-clk@lfdr.de>; Tue, 23 Nov 2021 00:07:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232292AbhKVXKx (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 22 Nov 2021 18:10:53 -0500
Received: from foss.arm.com ([217.140.110.172]:46266 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232316AbhKVXKk (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 22 Nov 2021 18:10:40 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF7CE1063;
        Mon, 22 Nov 2021 15:07:32 -0800 (PST)
Received: from e120937-lin.home (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1856C3F5A1;
        Mon, 22 Nov 2021 15:07:30 -0800 (PST)
From:   Cristian Marussi <cristian.marussi@arm.com>
To:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     sudeep.holla@arm.com, james.quinlan@broadcom.com,
        Jonathan.Cameron@Huawei.com, f.fainelli@gmail.com,
        vincent.guittot@linaro.org, souvik.chakravarty@arm.com,
        cristian.marussi@arm.com,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: [PATCH v6 16/16] clk: scmi: Support atomic clock enable/disable API
Date:   Mon, 22 Nov 2021 23:06:40 +0000
Message-Id: <20211122230640.1345-17-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211122230640.1345-1-cristian.marussi@arm.com>
References: <20211122230640.1345-1-cristian.marussi@arm.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Support also atomic enable/disable clk_ops beside the bare non-atomic one
(sprepare/unprepare) when the underlying SCMI transport is configured to
support atomic transactions for synchronous commands.

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
V5 --> V6
- add concurrent availability of atomic and non atomic reqs
---
 drivers/clk/clk-scmi.c | 56 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 47 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index 1e357d364ca2..50033d873dde 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -88,21 +88,53 @@ static void scmi_clk_disable(struct clk_hw *hw)
 	scmi_proto_clk_ops->disable(clk->ph, clk->id);
 }
 
+static int scmi_clk_atomic_enable(struct clk_hw *hw)
+{
+	struct scmi_clk *clk = to_scmi_clk(hw);
+
+	return scmi_proto_clk_ops->enable_atomic(clk->ph, clk->id);
+}
+
+static void scmi_clk_atomic_disable(struct clk_hw *hw)
+{
+	struct scmi_clk *clk = to_scmi_clk(hw);
+
+	scmi_proto_clk_ops->disable_atomic(clk->ph, clk->id);
+}
+
+/*
+ * We can provide enable/disable atomic callbacks only if the underlying SCMI
+ * transport for an SCMI instance is configured to handle SCMI commands in an
+ * atomic manner.
+ *
+ * When no SCMI atomic transport support is available we instead provide only
+ * the prepare/unprepare API, as allowed by the clock framework when atomic
+ * calls are not available.
+ *
+ * Two distinct sets of clk_ops are provided since we could have multiple SCMI
+ * instances with different underlying transport quality, so they cannot be
+ * shared.
+ */
 static const struct clk_ops scmi_clk_ops = {
 	.recalc_rate = scmi_clk_recalc_rate,
 	.round_rate = scmi_clk_round_rate,
 	.set_rate = scmi_clk_set_rate,
-	/*
-	 * We can't provide enable/disable callback as we can't perform the same
-	 * in atomic context. Since the clock framework provides standard API
-	 * clk_prepare_enable that helps cases using clk_enable in non-atomic
-	 * context, it should be fine providing prepare/unprepare.
-	 */
 	.prepare = scmi_clk_enable,
 	.unprepare = scmi_clk_disable,
 };
 
-static int scmi_clk_ops_init(struct device *dev, struct scmi_clk *sclk)
+static const struct clk_ops scmi_atomic_clk_ops = {
+	.recalc_rate = scmi_clk_recalc_rate,
+	.round_rate = scmi_clk_round_rate,
+	.set_rate = scmi_clk_set_rate,
+	.prepare = scmi_clk_enable,
+	.unprepare = scmi_clk_disable,
+	.enable = scmi_clk_atomic_enable,
+	.disable = scmi_clk_atomic_disable,
+};
+
+static int scmi_clk_ops_init(struct device *dev, struct scmi_clk *sclk,
+			     const struct clk_ops *scmi_ops)
 {
 	int ret;
 	unsigned long min_rate, max_rate;
@@ -110,7 +142,7 @@ static int scmi_clk_ops_init(struct device *dev, struct scmi_clk *sclk)
 	struct clk_init_data init = {
 		.flags = CLK_GET_RATE_NOCACHE,
 		.num_parents = 0,
-		.ops = &scmi_clk_ops,
+		.ops = scmi_ops,
 		.name = sclk->info->name,
 	};
 
@@ -145,6 +177,7 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
 	struct device_node *np = dev->of_node;
 	const struct scmi_handle *handle = sdev->handle;
 	struct scmi_protocol_handle *ph;
+	const struct clk_ops *scmi_ops;
 
 	if (!handle)
 		return -ENODEV;
@@ -168,6 +201,11 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
 	clk_data->num = count;
 	hws = clk_data->hws;
 
+	if (handle->is_transport_atomic(handle))
+		scmi_ops = &scmi_atomic_clk_ops;
+	else
+		scmi_ops = &scmi_clk_ops;
+
 	for (idx = 0; idx < count; idx++) {
 		struct scmi_clk *sclk;
 
@@ -184,7 +222,7 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
 		sclk->id = idx;
 		sclk->ph = ph;
 
-		err = scmi_clk_ops_init(dev, sclk);
+		err = scmi_clk_ops_init(dev, sclk, scmi_ops);
 		if (err) {
 			dev_err(dev, "failed to register clock %d\n", idx);
 			devm_kfree(dev, sclk);
-- 
2.17.1

