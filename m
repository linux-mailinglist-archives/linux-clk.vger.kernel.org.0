Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3E34ADAD4
	for <lists+linux-clk@lfdr.de>; Mon,  9 Sep 2019 16:11:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405230AbfIIOLh (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 9 Sep 2019 10:11:37 -0400
Received: from inva021.nxp.com ([92.121.34.21]:40718 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405209AbfIIOLg (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 9 Sep 2019 10:11:36 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E91DB2000F6;
        Mon,  9 Sep 2019 16:11:33 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 8AC1C200409;
        Mon,  9 Sep 2019 16:11:29 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 7C2E24031D;
        Mon,  9 Sep 2019 22:11:23 +0800 (SGT)
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH V5 08/11] clk: imx: imx8qxp-lpcg: add parsing clocks from device tree
Date:   Mon,  9 Sep 2019 22:10:05 -0400
Message-Id: <1568081408-26800-9-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568081408-26800-1-git-send-email-aisheng.dong@nxp.com>
References: <1568081408-26800-1-git-send-email-aisheng.dong@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

One LPCG controller supports up to 8 clock outputs while each of them
is fixed to 4 bits.  It supports only gating function with fixed bits.
So we can use the clk-indices to fetch the corresponding clock idx from
device tree. With this way, we can write a generic LPCG clock drivers.

This patch add that support to parse clocks from device tree.

Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
Changelog:
v4->v5:
 * add more commit message
 * a few minor updates
v3->v4:
 * remove hw_autogate which is not still used by driver
 * use clock-indices to indicate LPCG clock bit offset
v1->v3: no changes
---
 drivers/clk/imx/clk-imx8qxp-lpcg.c | 103 +++++++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
index c0aff7c..31efc7a 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -9,6 +9,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -157,6 +158,101 @@ static const struct imx8qxp_ss_lpcg imx8qxp_ss_lsio = {
 	.num_max = IMX_LSIO_LPCG_CLK_END,
 };
 
+#define IMX_LPCG_MAX_CLKS	8
+
+static struct clk_hw *imx_lpcg_of_clk_src_get(struct of_phandle_args *clkspec,
+					      void *data)
+{
+	struct clk_hw_onecell_data *hw_data = data;
+	unsigned int idx = clkspec->args[0] / 4;
+
+	if (idx >= hw_data->num) {
+		pr_err("%s: invalid index %u\n", __func__, idx);
+		return ERR_PTR(-EINVAL);
+	}
+
+	return hw_data->hws[idx];
+}
+
+static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
+				       struct device_node *np)
+{
+	const char *output_names[IMX_LPCG_MAX_CLKS];
+	const char *parent_names[IMX_LPCG_MAX_CLKS];
+	unsigned int bit_offset[IMX_LPCG_MAX_CLKS];
+	struct clk_hw_onecell_data *clk_data;
+	struct clk_hw **clk_hws;
+	struct resource *res;
+	void __iomem *base;
+	int count;
+	int idx;
+	int ret;
+	int i;
+
+	if (!of_device_is_compatible(np, "fsl,imx8qxp-lpcg"))
+		return -EINVAL;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	count = of_property_count_u32_elems(np, "clock-indices");
+	if (count < 0) {
+		dev_err(&pdev->dev, "failed to count clocks\n");
+		return -EINVAL;
+	}
+
+	clk_data = devm_kzalloc(&pdev->dev, struct_size(clk_data, hws,
+				IMX_LPCG_MAX_CLKS), GFP_KERNEL);
+	if (!clk_data)
+		return -ENOMEM;
+
+	clk_data->num = IMX_LPCG_MAX_CLKS;
+	clk_hws = clk_data->hws;
+
+	ret = of_property_read_u32_array(np, "clock-indices", bit_offset,
+					 count);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to read clock-indices\n");
+		return -EINVAL;
+	}
+
+	ret = of_clk_parent_fill(np, parent_names, count);
+	if (ret != count) {
+		dev_err(&pdev->dev, "failed to get clock parent names\n");
+		return count;
+	}
+
+	ret = of_property_read_string_array(np, "clock-output-names",
+					    output_names, count);
+	if (ret != count) {
+		dev_err(&pdev->dev, "failed to read clock-output-names\n");
+		return -EINVAL;
+	}
+
+	for (i = 0; i < count; i++) {
+		idx = bit_offset[i] / 4;
+		if (idx > IMX_LPCG_MAX_CLKS) {
+			dev_warn(&pdev->dev, "invalid bit offset of clock %d\n",
+				 i);
+			return -EINVAL;
+		}
+
+		clk_hws[idx] = imx_clk_lpcg_scu(output_names[i],
+						parent_names[i], 0, base,
+						bit_offset[i], false);
+		if (IS_ERR(clk_hws[idx])) {
+			dev_warn(&pdev->dev, "failed to register clock %d\n",
+				 idx);
+			return -EINVAL;
+		}
+	}
+
+	return devm_of_clk_add_hw_provider(&pdev->dev, imx_lpcg_of_clk_src_get,
+					   clk_data);
+}
+
 static int imx8qxp_lpcg_clk_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -167,8 +263,14 @@ static int imx8qxp_lpcg_clk_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct clk_hw **clks;
 	void __iomem *base;
+	int ret;
 	int i;
 
+	/* try new binding to parse clocks from device tree first */
+	ret = imx_lpcg_parse_clks_from_dt(pdev, np);
+	if (!ret)
+		return 0;
+
 	ss_lpcg = of_device_get_match_data(dev);
 	if (!ss_lpcg)
 		return -ENODEV;
@@ -208,6 +310,7 @@ static const struct of_device_id imx8qxp_lpcg_match[] = {
 	{ .compatible = "fsl,imx8qxp-lpcg-adma", &imx8qxp_ss_adma, },
 	{ .compatible = "fsl,imx8qxp-lpcg-conn", &imx8qxp_ss_conn, },
 	{ .compatible = "fsl,imx8qxp-lpcg-lsio", &imx8qxp_ss_lsio, },
+	{ .compatible = "fsl,imx8qxp-lpcg", NULL },
 	{ /* sentinel */ }
 };
 
-- 
2.7.4

