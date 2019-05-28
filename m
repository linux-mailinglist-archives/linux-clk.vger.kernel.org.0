Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C59E92C774
	for <lists+linux-clk@lfdr.de>; Tue, 28 May 2019 15:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbfE1NKl (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 28 May 2019 09:10:41 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:38900 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727057AbfE1NKl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 May 2019 09:10:41 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4SDAbQK100912;
        Tue, 28 May 2019 08:10:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559049037;
        bh=tDG44Vt4584Rd2sNRDh0O70euESEC+9ovgb60TrmNzk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=knH53MQghvQCilYwoSjgi+cUtuymvehq7tHrFOAF4B7jcHLwk3l/E3CcMIHabVxxC
         Aq/NU/P9dQnzX85BMcMu4sMwIpQWCUBBR2LrnAO7bZ7xtEALnCFxVvPMtOxDw4o4jL
         ebAICOTEj5OAT6lO8vK/wIgFzmdrao+9D6z0ggJ0=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4SDAbJt076625
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 28 May 2019 08:10:37 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 08:10:36 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 08:10:36 -0500
Received: from gomoku.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4SDAVBw079520;
        Tue, 28 May 2019 08:10:35 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>, <ssantosh@kernel.org>, <nm@ti.com>
CC:     <linux-arm-kernel@lists.infradead.org>
Subject: [PATCHv2 2/5] clk: keystone: sci-clk: split out the fw clock parsing to own function
Date:   Tue, 28 May 2019 16:10:21 +0300
Message-ID: <1559049024-30872-3-git-send-email-t-kristo@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1559049024-30872-1-git-send-email-t-kristo@ti.com>
References: <1559049024-30872-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This makes it both easier to see what the probe does, and also makes it
possible to add alternative implementations for the clock data source.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/keystone/sci-clk.c | 68 +++++++++++++++++++++++++-----------------
 1 file changed, 41 insertions(+), 27 deletions(-)

diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
index e737f24..1e465de 100644
--- a/drivers/clk/keystone/sci-clk.c
+++ b/drivers/clk/keystone/sci-clk.c
@@ -403,22 +403,8 @@ static int ti_sci_init_clocks(struct sci_clk_provider *p)
 };
 MODULE_DEVICE_TABLE(of, ti_sci_clk_of_match);
 
-/**
- * ti_sci_clk_probe - Probe function for the TI SCI clock driver
- * @pdev: platform device pointer to be probed
- *
- * Probes the TI SCI clock device. Allocates a new clock provider
- * and registers this to the common clock framework. Also applies
- * any required flags to the identified clocks via clock lists
- * supplied from DT. Returns 0 for success, negative error value
- * for failure.
- */
-static int ti_sci_clk_probe(struct platform_device *pdev)
+static int ti_sci_scan_clocks_from_fw(struct sci_clk_provider *provider)
 {
-	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
-	struct sci_clk_provider *provider;
-	const struct ti_sci_handle *handle;
 	int ret;
 	int num_clks = 0;
 	struct sci_clk **clks = NULL;
@@ -429,18 +415,7 @@ static int ti_sci_clk_probe(struct platform_device *pdev)
 	int dev_id = 0;
 	u8 num_parents;
 	int gap_size = 0;
-
-	handle = devm_ti_sci_get_handle(dev);
-	if (IS_ERR(handle))
-		return PTR_ERR(handle);
-
-	provider = devm_kzalloc(dev, sizeof(*provider), GFP_KERNEL);
-	if (!provider)
-		return -ENOMEM;
-
-	provider->sci = handle;
-	provider->ops = &handle->ops.clk_ops;
-	provider->dev = dev;
+	struct device *dev = provider->dev;
 
 	while (1) {
 		ret = provider->ops->get_num_parents(provider->sci, dev_id,
@@ -501,6 +476,45 @@ static int ti_sci_clk_probe(struct platform_device *pdev)
 
 	devm_kfree(dev, clks);
 
+	return 0;
+}
+
+/**
+ * ti_sci_clk_probe - Probe function for the TI SCI clock driver
+ * @pdev: platform device pointer to be probed
+ *
+ * Probes the TI SCI clock device. Allocates a new clock provider
+ * and registers this to the common clock framework. Also applies
+ * any required flags to the identified clocks via clock lists
+ * supplied from DT. Returns 0 for success, negative error value
+ * for failure.
+ */
+static int ti_sci_clk_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct sci_clk_provider *provider;
+	const struct ti_sci_handle *handle;
+	int ret;
+
+	handle = devm_ti_sci_get_handle(dev);
+	if (IS_ERR(handle))
+		return PTR_ERR(handle);
+
+	provider = devm_kzalloc(dev, sizeof(*provider), GFP_KERNEL);
+	if (!provider)
+		return -ENOMEM;
+
+	provider->sci = handle;
+	provider->ops = &handle->ops.clk_ops;
+	provider->dev = dev;
+
+	ret = ti_sci_scan_clocks_from_fw(provider);
+	if (ret) {
+		dev_err(dev, "scan clocks from FW failed: %d\n", ret);
+		return ret;
+	}
+
 	ret = ti_sci_init_clocks(provider);
 	if (ret) {
 		pr_err("ti-sci-init-clocks failed.\n");
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
