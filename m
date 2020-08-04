Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B98C23BA6E
	for <lists+linux-clk@lfdr.de>; Tue,  4 Aug 2020 14:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728103AbgHDMdl (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 4 Aug 2020 08:33:41 -0400
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:50924 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726724AbgHDMdl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Aug 2020 08:33:41 -0400
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 074B4tG2006974;
        Tue, 4 Aug 2020 07:05:47 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
        by mx0a-00128a01.pphosted.com with ESMTP id 32n69ehhy5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 04 Aug 2020 07:05:47 -0400
Received: from ASHBMBX9.ad.analog.com (ashbmbx9.ad.analog.com [10.64.17.10])
        by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 074B5jEg065028
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
        Tue, 4 Aug 2020 07:05:45 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Tue, 4 Aug 2020
 07:05:44 -0400
Received: from zeus.spd.analog.com (10.64.82.11) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Tue, 4 Aug 2020 07:05:44 -0400
Received: from localhost.localdomain ([10.48.65.12])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 074B5VE0005208;
        Tue, 4 Aug 2020 07:05:42 -0400
From:   Alexandru Ardelean <alexandru.ardelean@analog.com>
To:     <linux-clk@vger.kernel.org>, <linux-fpga@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <mturquette@baylibre.com>, <sboyd@kernel.org>, <mdf@kernel.org>,
        Mircea Caprioru <mircea.caprioru@analog.com>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH 6/6] clk: axi-clkgen: Add support for FPGA info
Date:   Tue, 4 Aug 2020 14:06:58 +0300
Message-ID: <20200804110658.40911-7-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200804110658.40911-1-alexandru.ardelean@analog.com>
References: <20200804110658.40911-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain
X-ADIRoutedOnPrem: True
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-04_03:2020-08-03,2020-08-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008040084
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Mircea Caprioru <mircea.caprioru@analog.com>

This patch adds support for vco maximum and minimum ranges in accordance
with fpga speed grade, voltage, device package, technology and family. This
new information is extracted from two new registers implemented in the ip
core: ADI_REG_FPGA_INFO and ADI_REG_FPGA_VOLTAGE, which are stored in the
'include/linux/fpga/adi-axi-common.h' file as they are common to all ADI
FPGA cores.

Signed-off-by: Mircea Caprioru <mircea.caprioru@analog.com>
Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/clk/clk-axi-clkgen.c | 67 +++++++++++++++++++++++++++++++-----
 1 file changed, 59 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-axi-clkgen.c b/drivers/clk/clk-axi-clkgen.c
index 6ffc19e9d850..51c890103dad 100644
--- a/drivers/clk/clk-axi-clkgen.c
+++ b/drivers/clk/clk-axi-clkgen.c
@@ -8,6 +8,7 @@
 
 #include <linux/platform_device.h>
 #include <linux/clk-provider.h>
+#include <linux/fpga/adi-axi-common.h>
 #include <linux/slab.h>
 #include <linux/io.h>
 #include <linux/of.h>
@@ -49,6 +50,7 @@
 struct axi_clkgen {
 	void __iomem *base;
 	struct clk_hw clk_hw;
+	unsigned int pcore_version;
 };
 
 static uint32_t axi_clkgen_lookup_filter(unsigned int m)
@@ -101,15 +103,15 @@ static uint32_t axi_clkgen_lookup_lock(unsigned int m)
 }
 
 #ifdef ARCH_ZYNQMP
-static const unsigned int fpfd_min = 10000;
-static const unsigned int fpfd_max = 450000;
-static const unsigned int fvco_min = 800000;
-static const unsigned int fvco_max = 1600000;
+static unsigned int fpfd_min = 10000;
+static unsigned int fpfd_max = 450000;
+static unsigned int fvco_min = 800000;
+static unsigned int fvco_max = 1600000;
 #else
-static const unsigned int fpfd_min = 10000;
-static const unsigned int fpfd_max = 300000;
-static const unsigned int fvco_min = 600000;
-static const unsigned int fvco_max = 1200000;
+static unsigned int fpfd_min = 10000;
+static unsigned int fpfd_max = 300000;
+static unsigned int fvco_min = 600000;
+static unsigned int fvco_max = 1200000;
 #endif
 
 static void axi_clkgen_calc_params(unsigned long fin, unsigned long fout,
@@ -229,6 +231,49 @@ static void axi_clkgen_read(struct axi_clkgen *axi_clkgen,
 	*val = readl(axi_clkgen->base + reg);
 }
 
+static void axi_clkgen_setup_ranges(struct axi_clkgen *axi_clkgen)
+{
+	unsigned int reg_value;
+	unsigned int tech, family, speed_grade, voltage;
+
+	axi_clkgen_read(axi_clkgen, ADI_AXI_REG_FPGA_INFO, &reg_value);
+	tech = ADI_AXI_INFO_FPGA_TECH(reg_value);
+	family = ADI_AXI_INFO_FPGA_FAMILY(reg_value);
+	speed_grade = ADI_AXI_INFO_FPGA_SPEED_GRADE(reg_value);
+
+	axi_clkgen_read(axi_clkgen, ADI_AXI_REG_FPGA_VOLTAGE, &reg_value);
+	voltage = ADI_AXI_INFO_FPGA_VOLTAGE(reg_value);
+
+	switch (speed_grade) {
+	case ADI_AXI_FPGA_SPEED_1 ... ADI_AXI_FPGA_SPEED_1LV:
+		fvco_max = 1200000;
+		fpfd_max = 450000;
+		break;
+	case ADI_AXI_FPGA_SPEED_2 ... ADI_AXI_FPGA_SPEED_2LV:
+		fvco_max = 1440000;
+		fpfd_max = 500000;
+		if ((family == ADI_AXI_FPGA_FAMILY_KINTEX) |
+		    (family == ADI_AXI_FPGA_FAMILY_ARTIX)) {
+			if (voltage < 950) {
+				fvco_max = 1200000;
+				fpfd_max = 450000;
+			}
+		}
+		break;
+	case ADI_AXI_FPGA_SPEED_3:
+		fvco_max = 1600000;
+		fpfd_max = 550000;
+		break;
+	default:
+		break;
+	};
+
+	if (tech == ADI_AXI_FPGA_TECH_ULTRASCALE_PLUS) {
+		fvco_max = 1600000;
+		fvco_min = 800000;
+	}
+}
+
 static int axi_clkgen_wait_non_busy(struct axi_clkgen *axi_clkgen)
 {
 	unsigned int timeout = 10000;
@@ -524,6 +569,12 @@ static int axi_clkgen_probe(struct platform_device *pdev)
 	if (IS_ERR(axi_clkgen->base))
 		return PTR_ERR(axi_clkgen->base);
 
+	axi_clkgen_read(axi_clkgen, ADI_AXI_REG_VERSION,
+			&axi_clkgen->pcore_version);
+
+	if (ADI_AXI_PCORE_VER_MAJOR(axi_clkgen->pcore_version) > 0x04)
+		axi_clkgen_setup_ranges(axi_clkgen);
+
 	init.num_parents = of_clk_get_parent_count(pdev->dev.of_node);
 	if (init.num_parents < 1 || init.num_parents > 2)
 		return -EINVAL;
-- 
2.17.1

