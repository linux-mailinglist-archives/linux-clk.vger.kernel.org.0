Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0D6B3C7926
	for <lists+linux-clk@lfdr.de>; Tue, 13 Jul 2021 23:42:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236292AbhGMVot (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 13 Jul 2021 17:44:49 -0400
Received: from mail-eopbgr1410132.outbound.protection.outlook.com ([40.107.141.132]:47855
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235534AbhGMVor (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 13 Jul 2021 17:44:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lb/2pXIvyj1yWkCJ0KzEjkbPOOSjQiSb1Tc5Cuk305wCSIrCntty3g3crkQ2HSJPZ/vfD7djANK1vwZwNtdckjiy3VKruHLGOgPEi0+zXlxnrvmS90VpBh0qzG780oUOgtcO7mg9pyzegQyeL11r3xJ2/+iKFCBPh5ZEluQSOVBoBz4WR/GQRJve9/m5ttuQKbS2Ik815aSyqx6CeJ46gMB5PICSjIv8HpI6xkzhNf2W86r3yvkqUmFclafbcFRLA/GzFV2UX/3tiBCssEM0LKt+GXC/1y2qBmoI2b+N6Q7eRYtFemBvBK1vv1IGa72x0PmYx+voKIRNr6gD+CkChA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzhSbXJvm39rADPfQVyQJ8B5F+KpxjPc5NdJfk/7jik=;
 b=ZyKfECwHSlGhBvhi8r5yEYNJ7uUzWEvLgJLy6zgvpEq+axVknhHsAXLZotoPs+LGVhWusq7mziCD3FVKZ+nVT8PwbM/zB9ED3amm0XonfKQ+eytiEsg6wvXi45wncYxVfOsPKDPScL2UzVaEvyX5RX+g3pV3cCFCe+iPA7eT2rynJPFM8rj96LpiA7fIGPFLs44EabR7TbIYnDThSgRusXWN2WVdcHSeNR+9lSaVh7RHNEhY2vqQ4b9T9Hda615wqSjX3TA4o/rpGHjZ2vDDVVeDPFCrsT9UwCXI4tp02T8U7uF4AIF2222ePg3+mHvlCnLmtNCymAvHB+3YWD4eDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzhSbXJvm39rADPfQVyQJ8B5F+KpxjPc5NdJfk/7jik=;
 b=H7uPd7ft7yF7aieB8BogMx2nCZGIh6ERVPz5iMc1Lha2/8ZoTfezFIer/CovP9R5nZe5AhONlv4YJz+GmoRRndgRG4NouvilBES78BYwN9IDbKy2MebyOQMSeCNBiAko6tYurzavWCmGOJhpOhHcV5BO52mLVW6p+8m0T6stKHc=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=renesas.com;
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com (2603:1096:604:5b::23)
 by OSBPR01MB3576.jpnprd01.prod.outlook.com (2603:1096:604:4d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Tue, 13 Jul
 2021 21:41:53 +0000
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::e1ee:a98a:2ba3:aee4]) by OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::e1ee:a98a:2ba3:aee4%7]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 21:41:53 +0000
From:   Alex Helms <alexander.helms.jy@renesas.com>
To:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
        geert+renesas@glider.be, alexander.helms.jy@renesas.com,
        david.cater.jc@renesas.com, michal.simek@xilinx.com,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v4 2/2] clk: Add ccf driver for Renesas 8T49N241
Date:   Tue, 13 Jul 2021 14:41:26 -0700
Message-Id: <20210713214126.2278-3-alexander.helms.jy@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210713214126.2278-1-alexander.helms.jy@renesas.com>
References: <20210713214126.2278-1-alexander.helms.jy@renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0080.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::21) To OSAPR01MB3892.jpnprd01.prod.outlook.com
 (2603:1096:604:5b::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from az-ahelms.na.ads.idt.com (68.225.135.226) by BYAPR07CA0080.namprd07.prod.outlook.com (2603:10b6:a03:12b::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend Transport; Tue, 13 Jul 2021 21:41:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94a58811-6f69-4cb6-fdca-08d94647076b
X-MS-TrafficTypeDiagnostic: OSBPR01MB3576:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <OSBPR01MB3576F0C965E5FA3C9D0B54AFC8149@OSBPR01MB3576.jpnprd01.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:530;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RDWDPIcvRw8yGjCf9bSJXf39nUh9HnYks4stSLWDLmL5SwKJ4JxWW7X8PIzF6vSnq9VDZtUJg8D5IDXhuJ15dv2BPNvFuRuYnQ5oQv54mCSOzEwAoHh/tEATAmNlcc/0srYRYnS+D92MNjZn1s4cCV9TCqfFdI1ldV1WzzlBGTncMhnh/XFOrOWPsnmUoQfT1xoJnBOrvAqX/0xrsyZ1zCMqQOG3cEo4B04Xm0AyBk0xRxcusZH/Otzep5J/oU35MXcjuzAjEK2pik7q5DioGaKUZ/dWGdtkYKFisw3cQGwm61WhowX8J/mPuOtZ8goMYoDVbJf8oy5Ekr6R/EH+zLYtP72Ay4Smib/b8vtHII/0wMbxf6nAwGh8iV7eKIPrklNH96espiadwhZ6Z19RpJU2Au3xhihNO9DCsleOJSwJbMuCiOZov9LVv7n7Rak/qY9LDm777aErosmnd8cc6+sWgjhkTzXfbXM6oWHLYisZfE5slAd7fqOxHg1O1GcDy5Yp1xAJCvr/mfh6CxHxVDcBAMzuZzY2nkSTZkmjXwVL1UZXnsHnhzNcZLL1KIIq9Z9nRMLb1p84UiVib/In2e3SQZhavPCWmjXGrYjChalkmFwuXVGgqY9LfpLiJJMmPjuOBG8Ehxj3lUt70VQWsyZedhkv6T9qBBpe7Dq/pSrKbOVVs2T2JE9gDgsm445ZgP1TWZG7A1MvLiDRzw9UCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB3892.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(396003)(136003)(366004)(346002)(478600001)(38100700002)(2906002)(2616005)(6666004)(6506007)(6512007)(6486002)(30864003)(1076003)(103116003)(8676002)(186003)(4326008)(36756003)(38350700002)(86362001)(956004)(5660300002)(26005)(52116002)(8936002)(66556008)(316002)(83380400001)(7416002)(66476007)(66946007)(579004)(559001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kB4WbR9+bNNpmys8IAHLQO16ycGnGp2ddbuUHgEddTYHIKR3Dj6gvI/E/P39?=
 =?us-ascii?Q?+JPXTEkzhz6w5c0N3u9BfOwQxaVKjuOjAttc70XVCAbJdSXIACKZ1fuQ8dSm?=
 =?us-ascii?Q?vAATI9Yrx7LLrYGdYAlrsu8PAHZ2Hn5bkZjcbjvglk6Umk6EXN9kSijBqj2Q?=
 =?us-ascii?Q?28V2OtsVc2CpXf3JKxqnEAiv0Yp63ACXB5Jv/xTDUGiUtC4SDm/06Sk1CupX?=
 =?us-ascii?Q?k1y0KE5Om7EVINzdaxuyr1GOnQ21G3wbdDbVTp0gZT/QP8LUosUdmZfBfbub?=
 =?us-ascii?Q?/IZ/qbGdCSF9PGPTbVYbeNMm0I7LsiAXOvZbS4SVswrpQz8UbQDc/lk9t6sY?=
 =?us-ascii?Q?Naii/yZ8eNtsVgIoOSNCx0Xwbrr/rDWsbkK3pcfMSWgb+hCqCsIbjXfx7lvM?=
 =?us-ascii?Q?SLLdlLtU9U3CGn2YlQnW7SRcOwrYdw+9dixUvOr05FQ9psKEGO/rIzIlznZt?=
 =?us-ascii?Q?5QDtobQjG3kUM1Rhd9rT7BttJWtiGhti8uKgavMM+86QSr6+olGYNGbkdFan?=
 =?us-ascii?Q?WeHwUcFxW/abu4T828KapIxj9yPOeGGIT96xeqN7CsQEQXFOJc/FvEp+IWlE?=
 =?us-ascii?Q?aSXtkPxtGksy4oydMMK4/1+DRVhWgnriiE2LQT5UH1l071wvYmgk/lwyn2sK?=
 =?us-ascii?Q?vpGt6cBefCRF3aA8sgnQzZIcEXiR7b6zVJZmjFQOEhZ3xa2S82Z1/ReLtK/v?=
 =?us-ascii?Q?xYG414o5b/wI0QpjS3X+onZelX4mzMTDohs3XpGzdUTug5ItivzMeMmOZ9xU?=
 =?us-ascii?Q?LR7O4ZIga23oHdIguNZrvsvY98gM859r2EMda4kGjwr9juBzgFwvTtE+HpFg?=
 =?us-ascii?Q?Fe5AkxQKcZ2F5P5yuAscghC6XOLDBvjiOEbkh7dS8ne+aBF375Net/gAgKau?=
 =?us-ascii?Q?OeNQ1OooVUtP4D88Ng1yKjKky+4CVuXDgNSmY9e5elX0wPbzFUjl4cOsa/Fo?=
 =?us-ascii?Q?4DYuHBSBshD/Bv/5bLf7gehZryPLXb3M9DLzaPvOf7GbXKv1IEnFym0Ikb7Z?=
 =?us-ascii?Q?+ISIWxPFD7M1imou9p37dyqSLkS1W7KqcMRPufY9skPMQ0vXQOqNSElMTHFc?=
 =?us-ascii?Q?QjmWrG24wFb1dp2Poiu3OCvNqlyq6s8xEOV9Igwxfpge7bv/jnNEUtfF6G1I?=
 =?us-ascii?Q?PuvVnMNrSDIt1updqMloOLZAMW9xKGdUTCrnYayooBqAAjZnsuyXSB59KzHb?=
 =?us-ascii?Q?tUpWWeomB2qJZDnJzNHHtSiYuFTBIDld6x9XLWdS4tmSAhjHlIrcPeDfhHJV?=
 =?us-ascii?Q?FUWiwq+QkmXZZ4ofMseC+sV5q/GoRhXj+5i86oTyZ7LsMmpDyNYqBQM7+8nh?=
 =?us-ascii?Q?UH1Q/8KUZX7Vya7mOJReeM8m?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94a58811-6f69-4cb6-fdca-08d94647076b
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB3892.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 21:41:53.4723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CTk+PSlMYsKQ3VRYZi9s9B97WqktGrKU8nXYIEGCqi8gZwKHTk01yhCiVHCw8CdFTM1sC3cH8qsm/c1CVjL2CpmxQ1kbUO0dS7P9Pf9v3Qw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3576
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This is a common clock framework driver that supports the 8T49N241 chip.
No other chips in the family are currently supported. The driver
supports setting the rate for all four outputs on the chip and
automatically calculating/setting the appropriate VCO value.

The driver can read a full register map from the device tree
and will use that register map to initialize the attached device
(via I2C) when the system boots. Any configuration not supported by
the common clock framework must be done via the full register map,
including optimized settings.

All outputs are currently assumed to be LVDS unless overridden in
the full register map in the DT.

Signed-off-by: Alex Helms <alexander.helms.jy@renesas.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 MAINTAINERS                         |   1 +
 drivers/clk/Kconfig                 |  21 +
 drivers/clk/renesas/8t49n24x-core.c | 836 ++++++++++++++++++++++++++++
 drivers/clk/renesas/8t49n24x-core.h | 250 +++++++++
 drivers/clk/renesas/8t49n24x.c      | 572 +++++++++++++++++++
 drivers/clk/renesas/Makefile        |   4 +
 6 files changed, 1684 insertions(+)
 create mode 100644 drivers/clk/renesas/8t49n24x-core.c
 create mode 100644 drivers/clk/renesas/8t49n24x-core.h
 create mode 100644 drivers/clk/renesas/8t49n24x.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 882d79ead..4ff414023 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15580,6 +15580,7 @@ M:	Alex Helms <alexander.helms.jy@renesas.com>
 M:	David Cater <david.cater.jc@renesas.com>
 S:	Odd Fixes
 F:	Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
+F:	drivers/clk/renesas/8t49n24x*
 
 RENESAS CLOCK DRIVERS
 M:	Geert Uytterhoeven <geert+renesas@glider.be>
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index e80918be8..7a7523372 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -330,6 +330,27 @@ config COMMON_CLK_VC5
 	  This driver supports the IDT VersaClock 5 and VersaClock 6
 	  programmable clock generators.
 
+config COMMON_CLK_8T49N24X
+	tristate "Clock driver for Renesas 8T49N24x"
+	depends on I2C
+	depends on OF
+	select REGMAP_I2C
+	help
+	  This driver supports the Renesas 8T49N24x universal frequency
+	  translator product family. The only chip in the family that is currently
+	  supported is the 8T49N241. The driver supports setting the rate for
+	  all four outputs on the chip and automatically calculating/setting
+	  the appropriate VCO value.
+
+	  The driver can read a full register map from the DT,
+	  and will use that register map to initialize the attached part
+	  (via I2C) when the system boots. Any configuration not supported
+	  by the common clock framework must be done via the full register
+	  map, including optimized settings.
+
+	  All outputs are currently assumed to be LVDS, unless overridden
+	  in the full register map in the DT.
+
 config COMMON_CLK_STM32MP157
 	def_bool COMMON_CLK && MACH_STM32MP157
 	help
diff --git a/drivers/clk/renesas/8t49n24x-core.c b/drivers/clk/renesas/8t49n24x-core.c
new file mode 100644
index 000000000..0e8ad92b2
--- /dev/null
+++ b/drivers/clk/renesas/8t49n24x-core.c
@@ -0,0 +1,836 @@
+// SPDX-License-Identifier: GPL-2.0
+/* 8t49n24x-core.c - Program 8T49N24x settings via I2C (common code)
+ *
+ * Copyright (C) 2018, Renesas Electronics America <david.cater.jc@renesas.com>
+ */
+
+#include <linux/i2c.h>
+#include <linux/regmap.h>
+
+#include "8t49n24x-core.h"
+
+/*
+ * In Timing Commander, Q0 is changed from 25MHz to Q0 75MHz, the following
+ * changes occur:
+ *
+ * 2 bytes change in EEPROM data string.
+ *
+ * DSM_INT R0025[0],R0026[7:0] : 35 => 30
+ * NS2_Q0 R0040[7:0],R0041[7:0] : 14 => 4
+ *
+ * In EEPROM
+ * 1. R0026
+ * 2. R0041
+ *
+ * Note that VCO_Frequency (metadata) also changed (3500 =>3000).
+ * This reflects a change to DSM_INT.
+ *
+ * Note that the Timing Commander code has workarounds in the workflow scripts
+ * to handle dividers for the 8T49N241 (because the development of that GUI
+ * predates chip override functionality). That affects NS1_Qx (x in 1-3)
+ * and NS2_Qx. NS1_Qx contains the upper bits of NS_Qx, and NS2_Qx contains
+ * the lower bits. That is NOT the case for Q0, though. In that case NS1_Q0
+ * is the 1st stage output divider (/5, /6, /4) and NS2_Q0 is the 16-bit
+ * second stage (with actual divide being twice the value stored in the
+ * register).
+ *
+ * NS1_Q0 R003F[1:0]
+ */
+
+#define RENESAS24X_VCO_MIN			2999997000u
+#define RENESAS24X_VCO_MAX			4000004000u
+#define RENESAS24X_VCO_OPT			3500000000u
+#define RENESAS24X_MIN_INT_DIVIDER	6
+#define RENESAS24X_MIN_NS1			4
+#define RENESAS24X_MAX_NS1			6
+
+static u8 q0_ns1_options[3] = { 5, 6, 4 };
+
+/**
+ * __renesas_bits_to_shift - num bits to shift given specified mask
+ * @mask:	32-bit word input to count zero bits on right
+ *
+ * Given a bit mask indicating where a value will be stored in
+ * a register, return the number of bits you need to shift the value
+ * before ORing it into the register value.
+ *
+ * Return: number of bits to shift
+ */
+int __renesas_bits_to_shift(unsigned int mask)
+{
+	/* the number of zero bits on the right */
+	unsigned int c = 32;
+
+	mask &= ~mask + 1;
+	if (mask)
+		c--;
+	if (mask & 0x0000FFFF)
+		c -= 16;
+	if (mask & 0x00FF00FF)
+		c -= 8;
+	if (mask & 0x0F0F0F0F)
+		c -= 4;
+	if (mask & 0x33333333)
+		c -= 2;
+	if (mask & 0x55555555)
+		c -= 1;
+	return c;
+}
+
+/*
+ * TODO: Consider replacing this with regmap_multi_reg_write, which
+ * supports introducing a delay after each write. Experiment to see if
+ * the writes succeed consistently when using that API.
+ */
+static int regmap_bulk_write_with_retry(struct regmap *map, unsigned int offset,
+					u8 *val, int val_count,
+					int max_attempts)
+{
+	int err = 0, count = 1;
+
+	do {
+		err = regmap_bulk_write(map, offset, val, val_count);
+		if (err == 0)
+			return 0;
+		usleep_range(100, 200);
+	} while (count++ <= max_attempts);
+	return err;
+}
+
+static int regmap_write_with_retry(struct regmap *map, unsigned int offset,
+				   unsigned int val, int max_attempts)
+{
+	int err = 0, count = 1;
+
+	do {
+		err = regmap_write(map, offset, val);
+		if (err == 0)
+			return 0;
+		usleep_range(100, 200);
+	} while (count++ <= max_attempts);
+	return err;
+}
+
+/*
+ * TODO: Consider using regmap_multi_reg_write instead. Explore
+ * use of regmap to configure WRITE_BLOCK_SIZE, and using the delay
+ * mechanism in regmap_multi_reg_write instead of retrying multiple
+ * times (regmap_bulk_write_with_retry).
+ */
+int __renesas_i2c_write_bulk(struct i2c_client *client, struct regmap *map,
+			     unsigned int reg, u8 val[], size_t val_count)
+{
+	char dbg[128];
+	u8 block[WRITE_BLOCK_SIZE];
+	unsigned int block_offset = reg;
+	int x = 0, err = 0, currentOffset = 0;
+
+	dev_dbg(&client->dev,
+		"I2C->0x%04x : [hex] . First byte: %02x, Second byte: %02x",
+		reg, reg >> 8, reg & 0xFF);
+
+	dbg[0] = 0;
+
+	for (x = 0; x < val_count; x++) {
+		char data[4];
+
+		block[currentOffset++] = val[x];
+		sprintf(data, "%02x ", val[x]);
+		strcat(dbg, data);
+		if (x > 0 && (x + 1) % WRITE_BLOCK_SIZE == 0) {
+			dev_dbg(&client->dev, "%s", dbg);
+			dbg[0] = '\0';
+			sprintf(dbg,
+				"(loop) calling regmap_bulk_write @ 0x%04x [%d bytes]",
+				block_offset, WRITE_BLOCK_SIZE);
+			dev_dbg(&client->dev, "%s", dbg);
+			dbg[0] = '\0';
+			err = regmap_bulk_write_with_retry(map, block_offset, block,
+							   WRITE_BLOCK_SIZE, 5);
+			if (err)
+				break;
+			block_offset += WRITE_BLOCK_SIZE;
+			currentOffset = 0;
+		}
+	}
+	if (err == 0 && currentOffset > 0) {
+		dev_dbg(&client->dev, "%s", dbg);
+		dev_dbg(&client->dev,
+			"(final) calling regmap_bulk_write @ 0x%04x [%d bytes]",
+			block_offset, currentOffset);
+		err = regmap_bulk_write_with_retry(map, block_offset, block, currentOffset, 5);
+	}
+
+	return err;
+}
+
+static int __i2c_write(struct i2c_client *client, struct regmap *map,
+		       unsigned int reg, unsigned int val)
+{
+	int err = 0;
+
+	dev_dbg(&client->dev, "I2C->0x%x : [hex] %x", reg, val);
+	err = regmap_write_with_retry(map, reg, val, 5);
+	usleep_range(100, 200);
+	return err;
+}
+
+static int __i2c_write_with_mask(struct i2c_client *client, struct regmap *map,
+				 unsigned int reg, u8 val, u8 original, u8 mask)
+{
+	return __i2c_write(client, map, reg,
+			   ((val << __renesas_bits_to_shift(mask)) & mask) | (original & ~mask));
+}
+
+int renesas24x_get_offsets(u8 output_num, struct clk_register_offsets *offsets)
+{
+	switch (output_num) {
+	case 0:
+		offsets->oe_offset = RENESAS24X_REG_OUTEN;
+		offsets->oe_mask = RENESAS24X_REG_OUTEN0_MASK;
+		offsets->dis_mask = RENESAS24X_REG_Q0_DIS_MASK;
+		offsets->ns1_offset = RENESAS24X_REG_NS1_Q0;
+		offsets->ns1_offset_mask = RENESAS24X_REG_NS1_Q0_MASK;
+		offsets->ns2_15_8_offset = RENESAS24X_REG_NS2_Q0_15_8;
+		offsets->ns2_7_0_offset = RENESAS24X_REG_NS2_Q0_7_0;
+		break;
+	case 1:
+		offsets->oe_offset = RENESAS24X_REG_OUTEN;
+		offsets->oe_mask = RENESAS24X_REG_OUTEN1_MASK;
+		offsets->dis_mask = RENESAS24X_REG_Q1_DIS_MASK;
+		offsets->n_17_16_offset = RENESAS24X_REG_N_Q1_17_16;
+		offsets->n_17_16_mask = RENESAS24X_REG_N_Q1_17_16_MASK;
+		offsets->n_15_8_offset = RENESAS24X_REG_N_Q1_15_8;
+		offsets->n_7_0_offset = RENESAS24X_REG_N_Q1_7_0;
+		offsets->nfrac_27_24_offset = RENESAS24X_REG_NFRAC_Q1_27_24;
+		offsets->nfrac_27_24_mask = RENESAS24X_REG_NFRAC_Q1_27_24_MASK;
+		offsets->nfrac_23_16_offset = RENESAS24X_REG_NFRAC_Q1_23_16;
+		offsets->nfrac_15_8_offset = RENESAS24X_REG_NFRAC_Q1_15_8;
+		offsets->nfrac_7_0_offset = RENESAS24X_REG_NFRAC_Q1_7_0;
+		break;
+	case 2:
+		offsets->oe_offset = RENESAS24X_REG_OUTEN;
+		offsets->oe_mask = RENESAS24X_REG_OUTEN2_MASK;
+		offsets->dis_mask = RENESAS24X_REG_Q2_DIS_MASK;
+		offsets->n_17_16_offset = RENESAS24X_REG_N_Q2_17_16;
+		offsets->n_17_16_mask = RENESAS24X_REG_N_Q2_17_16_MASK;
+		offsets->n_15_8_offset = RENESAS24X_REG_N_Q2_15_8;
+		offsets->n_7_0_offset = RENESAS24X_REG_N_Q2_7_0;
+		offsets->nfrac_27_24_offset = RENESAS24X_REG_NFRAC_Q2_27_24;
+		offsets->nfrac_27_24_mask = RENESAS24X_REG_NFRAC_Q2_27_24_MASK;
+		offsets->nfrac_23_16_offset = RENESAS24X_REG_NFRAC_Q2_23_16;
+		offsets->nfrac_15_8_offset = RENESAS24X_REG_NFRAC_Q2_15_8;
+		offsets->nfrac_7_0_offset = RENESAS24X_REG_NFRAC_Q2_7_0;
+		break;
+	case 3:
+		offsets->oe_offset = RENESAS24X_REG_OUTEN;
+		offsets->oe_mask = RENESAS24X_REG_OUTEN3_MASK;
+		offsets->dis_mask = RENESAS24X_REG_Q3_DIS_MASK;
+		offsets->n_17_16_offset = RENESAS24X_REG_N_Q3_17_16;
+		offsets->n_17_16_mask = RENESAS24X_REG_N_Q3_17_16_MASK;
+		offsets->n_15_8_offset = RENESAS24X_REG_N_Q3_15_8;
+		offsets->n_7_0_offset = RENESAS24X_REG_N_Q3_7_0;
+		offsets->nfrac_27_24_offset = RENESAS24X_REG_NFRAC_Q3_27_24;
+		offsets->nfrac_27_24_mask = RENESAS24X_REG_NFRAC_Q3_27_24_MASK;
+		offsets->nfrac_23_16_offset = RENESAS24X_REG_NFRAC_Q3_23_16;
+		offsets->nfrac_15_8_offset = RENESAS24X_REG_NFRAC_Q3_15_8;
+		offsets->nfrac_7_0_offset = RENESAS24X_REG_NFRAC_Q3_7_0;
+		break;
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
+
+/**
+ * renesas24x_calc_div_q0 - Calculate dividers and VCO freq to generate
+ *		the specified Q0 frequency.
+ * @chip:	Device data structure. contains all requested frequencies
+ *		for all outputs.
+ *
+ * The actual output divider is ns1 * ns2 * 2. fOutput = fVCO / (ns1 * ns2 * 2)
+ *
+ * The options for ns1 (when the source is the VCO) are 4,5,6. ns2 is a
+ * 16-bit value.
+ *
+ * chip->divs: structure for specifying ns1/ns2 values. If 0 after this
+ * function, Q0 is not requested
+ *
+ * Return: 0 on success, negative errno otherwise.
+ */
+static int renesas24x_calc_div_q0(struct clk_renesas24x_chip *chip)
+{
+	u8 x = 0;
+	u32 min_div = 0, max_div = 0, best_vco = 0;
+	u16 min_ns2 = 0, max_ns2 = 0;
+	bool is_lower_vco = false;
+
+	chip->divs.ns1_q0 = 0;
+	chip->divs.ns2_q0 = 0;
+
+	if (chip->clk[0].requested == 0)
+		return 0;
+
+	min_div = div64_u64((u64)RENESAS24X_VCO_MIN, chip->clk[0].requested * 2) * 2;
+	max_div = div64_u64((u64)RENESAS24X_VCO_MAX, chip->clk[0].requested * 2) * 2;
+
+	dev_dbg(&chip->i2c_client->dev,
+		"requested: %u, min_div: %u, max_div: %u",
+		chip->clk[0].requested, min_div, max_div);
+
+	min_ns2 = div64_u64((u64)min_div, RENESAS24X_MAX_NS1 * 2);
+	max_ns2 = div64_u64((u64)max_div, RENESAS24X_MIN_NS1 * 2);
+
+	dev_dbg(&chip->i2c_client->dev, "min_ns2: %u, max_ns2: %u", min_ns2, max_ns2);
+
+	for (x = 0; x < ARRAY_SIZE(q0_ns1_options); x++) {
+		u16 y = min_ns2;
+
+		while (y <= max_ns2) {
+			u32 actual_div = q0_ns1_options[x] * y * 2;
+			u32 current_vco = actual_div * chip->clk[0].requested;
+
+			if (current_vco < RENESAS24X_VCO_MIN)
+				dev_dbg(&chip->i2c_client->dev,
+					"ignore div: (ns1=%u * ns2=%u * 2 * %u) == %u < %u",
+					q0_ns1_options[x], y,
+					chip->clk[0].requested, current_vco,
+					RENESAS24X_VCO_MIN);
+			else if (current_vco > RENESAS24X_VCO_MAX) {
+				dev_dbg(&chip->i2c_client->dev,
+					"ignore div: (ns1=%u * ns2=%u * 2 * %u) == %u > %u. EXIT LOOP.",
+					q0_ns1_options[x], y,
+					chip->clk[0].requested, current_vco,
+					RENESAS24X_VCO_MAX);
+				y = max_ns2;
+			} else {
+				bool use = false;
+
+				dev_dbg(&chip->i2c_client->dev,
+					"contender: (ns1=%u * ns2=%u * 2 * %u) == %u [in range]",
+					q0_ns1_options[x], y,
+					chip->clk[0].requested, current_vco);
+				if (current_vco <= RENESAS24X_VCO_OPT) {
+					if (current_vco > best_vco || !is_lower_vco) {
+						is_lower_vco = true;
+						use = true;
+					}
+				} else if (!is_lower_vco && current_vco > best_vco) {
+					use = true;
+				}
+				if (use) {
+					chip->divs.ns1_q0 = x;
+					chip->divs.ns2_q0 = y;
+					best_vco = current_vco;
+				}
+			}
+			y++;
+		}
+	}
+
+	dev_dbg(&chip->i2c_client->dev,
+		"best: (ns1=%u [/%u] * ns2=%u * 2 * %u) == %u",
+		chip->divs.ns1_q0, q0_ns1_options[chip->divs.ns1_q0],
+		chip->divs.ns2_q0, chip->clk[0].requested, best_vco);
+	return 0;
+}
+
+/**
+ * renesas24x_calc_divs - Calculate dividers to generate the specified frequency.
+ * @chip:	Device data structure. contains all requested frequencies
+ *		for all outputs.
+ *
+ * Calculate the clock dividers (dsmint, dsmfrac for vco; ns1/ns2 for q0,
+ * n/nfrac for q1-3) for a given target frequency.
+ *
+ * Return: 0 on success, negative errno otherwise.
+ */
+static int renesas24x_calc_divs(struct clk_renesas24x_chip *chip)
+{
+	u32 vco = 0;
+	int result = 0;
+
+	result = renesas24x_calc_div_q0(chip);
+	if (result < 0)
+		return result;
+
+	dev_dbg(&chip->i2c_client->dev,
+		"after renesas24x_calc_div_q0. ns1: %u [/%u], ns2: %u",
+		chip->divs.ns1_q0, q0_ns1_options[chip->divs.ns1_q0],
+		chip->divs.ns2_q0);
+
+	chip->divs.dsmint = 0;
+	chip->divs.dsmfrac = 0;
+
+	if (chip->clk[0].requested > 0) {
+		/* Q0 is in use and is governing the actual VCO freq */
+		vco = q0_ns1_options[chip->divs.ns1_q0] * chip->divs.ns2_q0
+			* 2 * chip->clk[0].requested;
+	} else {
+		u32 freq = 0;
+		u32 walk = 0;
+		u32 min_div = 0, max_div = 0;
+		bool is_lower_vco = false;
+
+		/*
+		 * Q0 is not in use. Use the first requested (fractional)
+		 * output frequency as the one controlling the VCO.
+		 */
+		for (walk = 1; walk < NUM_OUTPUTS; walk++) {
+			if (chip->clk[walk].requested != 0) {
+				freq = chip->clk[walk].requested;
+				break;
+			}
+		}
+
+		if (freq == 0) {
+			dev_err(&chip->i2c_client->dev, "NO FREQUENCIES SPECIFIED");
+			return -EINVAL;
+		}
+
+		/*
+		 * First, determine the min/max div for the output frequency.
+		 */
+		min_div = RENESAS24X_MIN_INT_DIVIDER;
+		max_div = div64_u64((u64)RENESAS24X_VCO_MAX, freq * 2) * 2;
+
+		dev_dbg(&chip->i2c_client->dev,
+			"calc_divs for fractional output. freq: %u, min_div: %u, max_div: %u",
+			freq, min_div, max_div);
+
+		walk = min_div;
+
+		while (walk <= max_div) {
+			u32 current_vco = freq * walk;
+
+			dev_dbg(&chip->i2c_client->dev,
+				"calc_divs for fractional output. walk: %u, freq: %u, vco: %u",
+				walk, freq, vco);
+			if (current_vco >= RENESAS24X_VCO_MIN &&
+			    vco <= RENESAS24X_VCO_MAX) {
+				if (current_vco <= RENESAS24X_VCO_OPT) {
+					if (current_vco > vco || !is_lower_vco) {
+						is_lower_vco = true;
+						vco = current_vco;
+					}
+				} else if (!is_lower_vco && current_vco > vco) {
+					vco = current_vco;
+				}
+			}
+			/* Divider must be even. */
+			walk += 2;
+		}
+	}
+
+	if (vco != 0) {
+		u32 pfd = 0;
+		u64 rem = 0;
+		int x = 0;
+
+		/* Setup dividers for outputs with fractional dividers. */
+		for (x = 1; x < NUM_OUTPUTS; x++) {
+			if (chip->clk[x].requested != 0) {
+				/*
+				 * The value written to the chip is half
+				 * the calculated divider.
+				 */
+				chip->divs.nint[x - 1] = div64_u64_rem((u64)vco,
+								       chip->clk[x].requested * 2,
+								       &rem);
+				chip->divs.nfrac[x - 1] = div64_u64(rem * 1 << 28,
+								    chip->clk[x].requested * 2);
+				dev_dbg(&chip->i2c_client->dev,
+					"div to get Q%i freq %u from vco %u: int part: %u, rem: %llu, frac part: %u",
+					x, chip->clk[x].requested,
+					vco, chip->divs.nint[x - 1], rem,
+					chip->divs.nfrac[x - 1]);
+			}
+		}
+
+		/* Calculate freq for pfd */
+		pfd = chip->input_clk_freq * (chip->doubler_disabled ? 1 : 2);
+
+		/*
+		 * Calculate dsmint & dsmfrac:
+		 * -----------------------------
+		 * dsm = float(vco)/float(pfd)
+		 * dsmfrac = dsm-floor(dsm) * 2^21
+		 * rem = vco % pfd
+		 * therefore:
+		 * dsmfrac = (rem * 2^21)/pfd
+		 */
+		chip->divs.dsmint = div64_u64_rem(vco, pfd, &rem);
+		chip->divs.dsmfrac = div64_u64(rem * 1 << 21, pfd);
+
+		dev_dbg(&chip->i2c_client->dev,
+			"vco: %u, pfd: %u, dsmint: %u, dsmfrac: %u, rem: %llu",
+			vco, pfd, chip->divs.dsmint,
+			chip->divs.dsmfrac, rem);
+	} else {
+		dev_err(&chip->i2c_client->dev, "no integer divider in range found. NOT SUPPORTED.");
+		return -EINVAL;
+	}
+	return 0;
+}
+
+/**
+ * renesas24x_enable_output - Enable/disable a particular output
+ * @chip:	Device data structure
+ * @output:	Output to enable/disable
+ * @enable:	Enable (true/false)
+ *
+ * Return: passes on regmap_write return value.
+ */
+static int renesas24x_enable_output(struct clk_renesas24x_chip *chip, u8 output,
+				    bool enable)
+{
+	int err = 0;
+	struct clk_register_offsets offsets;
+	struct i2c_client *client = chip->i2c_client;
+
+	/*
+	 * When an output is enabled, enable it in the original
+	 * data read from the chip and cached. Otherwise it may be
+	 * accidentally	turned off when another output is enabled.
+	 *
+	 * E.g., the driver starts with all outputs off in reg_out_en_x.
+	 * Q1 is enabled with the appropriate mask. Q2 is then enabled,
+	 * which results in Q1 being turned back off (because Q1 was off
+	 * in reg_out_en_x).
+	 */
+
+	err = renesas24x_get_offsets(output, &offsets);
+	if (err) {
+		dev_err(&client->dev, "error calling renesas24x_get_offsets for %d: %i",
+			output, err);
+		return err;
+	}
+
+	dev_dbg(&client->dev,
+		"q%u enable? %d. reg_out_en_x before: 0x%x, reg_out_mode_0_1 before: 0x%x",
+		output, enable, chip->reg_out_en_x, chip->reg_out_mode_0_1);
+
+	dev_dbg(&client->dev, "reg_out_mode_2_3 before: 0x%x, reg_qx_dis before: 0x%x",
+		chip->reg_out_mode_2_3, chip->reg_qx_dis);
+
+	chip->reg_out_en_x = chip->reg_out_en_x & ~offsets.oe_mask;
+	if (enable)
+		chip->reg_out_en_x |= (1 << __renesas_bits_to_shift(offsets.oe_mask));
+
+	chip->reg_qx_dis = chip->reg_qx_dis & ~offsets.dis_mask;
+	dev_dbg(&client->dev,
+		"q%u enable? %d. reg_qx_dis mask: 0x%x, before checking enable: 0x%x",
+		output, enable, offsets.dis_mask, chip->reg_qx_dis);
+
+	if (!enable)
+		chip->reg_qx_dis |= (1 << __renesas_bits_to_shift(offsets.dis_mask));
+
+	dev_dbg(&client->dev,
+		"q%u enable? %d. reg_out_en_x after: 0x%x, reg_qx_dis after: 0x%x",
+		output, enable, chip->reg_out_en_x, chip->reg_qx_dis);
+
+	err = __i2c_write(client, chip->regmap, RENESAS24X_REG_OUTEN, chip->reg_out_en_x);
+	if (err) {
+		dev_err(&client->dev, "error setting RENESAS24X_REG_OUTEN: %i", err);
+		return err;
+	}
+
+	err = __i2c_write(client, chip->regmap, RENESAS24X_REG_OUTMODE0_1, chip->reg_out_mode_0_1);
+	if (err) {
+		dev_err(&client->dev, "error setting RENESAS24X_REG_OUTMODE0_1: %i", err);
+		return err;
+	}
+
+	err = __i2c_write(client, chip->regmap, RENESAS24X_REG_OUTMODE2_3, chip->reg_out_mode_2_3);
+	if (err) {
+		dev_err(&client->dev, "error setting RENESAS24X_REG_OUTMODE2_3: %i", err);
+		return err;
+	}
+
+	err = __i2c_write(client, chip->regmap, RENESAS24X_REG_Q_DIS, chip->reg_qx_dis);
+	if (err) {
+		dev_err(&client->dev, "error setting RENESAS24X_REG_Q_DIS: %i", err);
+		return err;
+	}
+
+	return 0;
+}
+
+/**
+ * renesas24x_update_device - write registers to the chip
+ * @chip:	Device data structure
+ *
+ * Write all values to hardware that we	have calculated.
+ *
+ * Return: passes on regmap_bulk_write return value.
+ */
+static int renesas24x_update_device(struct clk_renesas24x_chip *chip)
+{
+	int err = 0, x = -1;
+	struct i2c_client *client = chip->i2c_client;
+
+	dev_dbg(&client->dev, "setting DSM_INT_8 (val %u @ %u)",
+		chip->divs.dsmint >> 8, RENESAS24X_REG_DSM_INT_8);
+
+	err = __i2c_write_with_mask(client, chip->regmap, RENESAS24X_REG_DSM_INT_8,
+				    (chip->divs.dsmint >> 8) & RENESAS24X_REG_DSM_INT_8_MASK,
+				    chip->reg_dsm_int_8, RENESAS24X_REG_DSM_INT_8_MASK);
+	if (err) {
+		dev_err(&client->dev, "error setting RENESAS24X_REG_DSM_INT_8: %i", err);
+		return err;
+	}
+
+	dev_dbg(&client->dev, "setting DSM_INT_7_0 (val %u @ 0x%x)",
+		chip->divs.dsmint & 0xFF, RENESAS24X_REG_DSM_INT_7_0);
+
+	err = __i2c_write(client, chip->regmap, RENESAS24X_REG_DSM_INT_7_0,
+			  chip->divs.dsmint & 0xFF);
+	if (err) {
+		dev_err(&client->dev, "error setting RENESAS24X_REG_DSM_INT_7_0: %i", err);
+		return err;
+	}
+
+	dev_dbg(&client->dev,
+		"setting RENESAS24X_REG_DSMFRAC_20_16 (val %u @ 0x%x)",
+		chip->divs.dsmfrac >> 16,
+		RENESAS24X_REG_DSMFRAC_20_16);
+
+	err = __i2c_write_with_mask(client, chip->regmap, RENESAS24X_REG_DSMFRAC_20_16,
+				    (chip->divs.dsmfrac >> 16) & RENESAS24X_REG_DSMFRAC_20_16_MASK,
+				    chip->reg_dsm_int_8, RENESAS24X_REG_DSMFRAC_20_16_MASK);
+	if (err) {
+		dev_err(&client->dev, "error setting RENESAS24X_REG_DSMFRAC_20_16: %i", err);
+		return err;
+	}
+
+	dev_dbg(&client->dev,
+		"setting RENESAS24X_REG_DSMFRAC_15_8 (val %u @ 0x%x)",
+		(chip->divs.dsmfrac >> 8) & 0xFF,
+		RENESAS24X_REG_DSMFRAC_15_8);
+
+	err = __i2c_write(client, chip->regmap, RENESAS24X_REG_DSMFRAC_15_8,
+			  (chip->divs.dsmfrac >> 8) & 0xFF);
+	if (err) {
+		dev_err(&client->dev, "error setting RENESAS24X_REG_DSMFRAC_15_8: %i", err);
+		return err;
+	}
+
+	dev_dbg(&client->dev,
+		"setting RENESAS24X_REG_DSMFRAC_7_0 (val %u @ 0x%x)",
+		chip->divs.dsmfrac & 0xFF,
+		RENESAS24X_REG_DSMFRAC_7_0);
+
+	err = __i2c_write(client, chip->regmap, RENESAS24X_REG_DSMFRAC_7_0,
+			  chip->divs.dsmfrac & 0xFF);
+	if (err) {
+		dev_err(&client->dev, "error setting RENESAS24X_REG_DSMFRAC_7_0: %i", err);
+		return err;
+	}
+
+	dev_dbg(&client->dev,
+		"setting RENESAS24X_REG_NS1_Q0 (val %u @ 0x%x)",
+		chip->divs.ns1_q0, RENESAS24X_REG_NS1_Q0);
+
+	err = __i2c_write_with_mask(client, chip->regmap, RENESAS24X_REG_NS1_Q0,
+				    chip->divs.ns1_q0 & RENESAS24X_REG_NS1_Q0_MASK,
+				    chip->reg_ns1_q0, RENESAS24X_REG_NS1_Q0_MASK);
+	if (err) {
+		dev_err(&client->dev, "error setting RENESAS24X_REG_NS1_Q0: %i", err);
+		return err;
+	}
+
+	dev_dbg(&client->dev,
+		"setting RENESAS24X_REG_NS2_Q0_15_8 (val %u @ 0x%x)",
+		(chip->divs.ns2_q0 >> 8) & 0xFF, RENESAS24X_REG_NS2_Q0_15_8);
+
+	err = __i2c_write(client, chip->regmap, RENESAS24X_REG_NS2_Q0_15_8,
+			  (chip->divs.ns2_q0 >> 8) & 0xFF);
+	if (err) {
+		dev_err(&client->dev, "error setting RENESAS24X_REG_NS2_Q0_15_8: %i", err);
+		return err;
+	}
+
+	dev_dbg(&client->dev,
+		"setting RENESAS24X_REG_NS2_Q0_7_0 (val %u @ 0x%x)",
+		chip->divs.ns2_q0 & 0xFF, RENESAS24X_REG_NS2_Q0_7_0);
+
+	err = __i2c_write(client, chip->regmap, RENESAS24X_REG_NS2_Q0_7_0,
+			  chip->divs.ns2_q0 & 0xFF);
+	if (err) {
+		dev_err(&client->dev, "error setting RENESAS24X_REG_NS2_Q0_7_0: %i", err);
+		return err;
+	}
+
+	dev_dbg(&client->dev,
+		"calling renesas24x_enable_output for Q0. requestedFreq: %u",
+		chip->clk[0].requested);
+	renesas24x_enable_output(chip, 0, chip->clk[0].requested != 0);
+
+	dev_dbg(&client->dev, "writing values for q1-q3");
+	for (x = 1; x < NUM_OUTPUTS; x++) {
+		struct clk_register_offsets offsets;
+
+		if (chip->clk[x].requested != 0) {
+			dev_dbg(&client->dev, "calling renesas24x_get_offsets for %u", x);
+			err = renesas24x_get_offsets(x, &offsets);
+			if (err) {
+				dev_err(&client->dev, "error calling renesas24x_get_offsets: %i",
+					err);
+				return err;
+			}
+
+			dev_dbg(&client->dev, "(q%u, nint: %u, nfrac: %u)",
+				x, chip->divs.nint[x - 1],
+				chip->divs.nfrac[x - 1]);
+
+			dev_dbg(&client->dev,
+				"setting n_17_16_offset (q%u, val %u @ 0x%x)",
+				x, chip->divs.nint[x - 1] >> 16,
+				offsets.n_17_16_offset);
+
+			err = __i2c_write_with_mask(client, chip->regmap,
+						    offsets.n_17_16_offset,
+						    (chip->divs.nint[x - 1] >> 16) &
+							offsets.n_17_16_mask,
+						    chip->reg_n_qx_17_16[x - 1],
+						    offsets.n_17_16_mask);
+			if (err) {
+				dev_err(&client->dev, "error setting n_17_16_offset: %i", err);
+				return err;
+			}
+
+			dev_dbg(&client->dev,
+				"setting n_15_8_offset (q%u, val %u @ 0x%x)",
+				x, (chip->divs.nint[x - 1] >> 8) & 0xFF,
+				offsets.n_15_8_offset);
+
+			err = __i2c_write(client, chip->regmap,
+					  offsets.n_15_8_offset,
+					  (chip->divs.nint[x - 1] >> 8) & 0xFF);
+			if (err) {
+				dev_err(&client->dev, "error setting n_15_8_offset: %i", err);
+				return err;
+			}
+
+			dev_dbg(&client->dev,
+				"setting n_7_0_offset (q%u, val %u @ 0x%x)",
+				x, chip->divs.nint[x - 1] & 0xFF,
+				offsets.n_7_0_offset);
+
+			err = __i2c_write(client, chip->regmap,
+					  offsets.n_7_0_offset,
+					  chip->divs.nint[x - 1] & 0xFF);
+			if (err) {
+				dev_err(&client->dev, "error setting n_7_0_offset: %i", err);
+				return err;
+			}
+
+			dev_dbg(&client->dev,
+				"setting nfrac_27_24_offset (q%u, val %u @ 0x%x)",
+				x, (chip->divs.nfrac[x - 1] >> 24),
+				offsets.nfrac_27_24_offset);
+
+			err = __i2c_write_with_mask(client, chip->regmap,
+						    offsets.nfrac_27_24_offset,
+						    (chip->divs.nfrac[x - 1] >> 24) &
+							offsets.nfrac_27_24_mask,
+						    chip->reg_nfrac_qx_27_24[x - 1],
+						    offsets.nfrac_27_24_mask);
+			if (err) {
+				dev_err(&client->dev, "error setting nfrac_27_24_offset: %i", err);
+				return err;
+			}
+
+			dev_dbg(&client->dev,
+				"setting nfrac_23_16_offset (q%u, val %u @ 0x%x)",
+				x, (chip->divs.nfrac[x - 1] >> 16) & 0xFF,
+				offsets.nfrac_23_16_offset);
+
+			err = __i2c_write(client, chip->regmap,
+					  offsets.nfrac_23_16_offset,
+					  (chip->divs.nfrac[x - 1] >> 16) & 0xFF);
+			if (err) {
+				dev_err(&client->dev, "error setting nfrac_23_16_offset: %i", err);
+				return err;
+			}
+
+			dev_dbg(&client->dev,
+				"setting nfrac_15_8_offset (q%u, val %u @ 0x%x)",
+				x, (chip->divs.nfrac[x - 1] >> 8) & 0xFF,
+				offsets.nfrac_15_8_offset);
+
+			err = __i2c_write(client, chip->regmap, offsets.nfrac_15_8_offset,
+					  (chip->divs.nfrac[x - 1] >> 8) & 0xFF);
+			if (err) {
+				dev_err(&client->dev, "error setting nfrac_15_8_offset: %i", err);
+				return err;
+			}
+
+			dev_dbg(&client->dev,
+				"setting nfrac_7_0_offset (q%u, val %u @ 0x%x)",
+				x, chip->divs.nfrac[x - 1] & 0xFF,
+				offsets.nfrac_7_0_offset);
+
+			err = __i2c_write(client, chip->regmap,
+					  offsets.nfrac_7_0_offset,
+					  chip->divs.nfrac[x - 1] & 0xFF);
+			if (err) {
+				dev_err(&client->dev, "error setting nfrac_7_0_offset: %i", err);
+				return err;
+			}
+		}
+		renesas24x_enable_output(chip, x, chip->clk[x].requested != 0);
+		chip->clk[x].actual = chip->clk[x].requested;
+	}
+	return 0;
+}
+
+/**
+ * renesas24x_set_frequency - Adjust output frequency on the attached chip.
+ * @chip:	Device data structure, including all requested frequencies.
+ *
+ * Return: 0 on success.
+ */
+int renesas24x_set_frequency(struct clk_renesas24x_chip *chip)
+{
+	int err = 0, x = 0;
+	bool all_disabled = true;
+	struct i2c_client *client = chip->i2c_client;
+
+	for (x = 0; x < NUM_OUTPUTS; x++) {
+		if (chip->clk[x].requested == 0) {
+			renesas24x_enable_output(chip, x, false);
+			chip->clk[x].actual = 0;
+		} else {
+			all_disabled = false;
+		}
+	}
+
+	if (all_disabled)
+		/*
+		 * no requested frequencies, so nothing else to calculate
+		 * or write to the chip. If the consumer wants to disable
+		 * all outputs, they can request 0 for all frequencies.
+		 */
+		return 0;
+
+	if (chip->input_clk_freq == 0) {
+		dev_err(&client->dev, "no input frequency; can't continue.");
+		return -EINVAL;
+	}
+
+	err = renesas24x_calc_divs(chip);
+	if (err) {
+		dev_err(&client->dev,
+			"error calling renesas24x_calc_divs: %i", err);
+		return err;
+	}
+
+	err = renesas24x_update_device(chip);
+	if (err) {
+		dev_err(&client->dev, "error updating the device: %i", err);
+		return err;
+	}
+
+	return 0;
+}
diff --git a/drivers/clk/renesas/8t49n24x-core.h b/drivers/clk/renesas/8t49n24x-core.h
new file mode 100644
index 000000000..0786aa03a
--- /dev/null
+++ b/drivers/clk/renesas/8t49n24x-core.h
@@ -0,0 +1,250 @@
+/* SPDX-License-Identifier: GPL-2.0
+ * 8t49n24x-core.h - Program 8T49N24x settings via I2C (common code)
+ *
+ * Copyright (C) 2018, Renesas Electronics America <david.cater.jc@renesas.com>
+ */
+
+#ifndef __8T49N24X_CORE_H_
+#define __8T49N24X_CORE_H_
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/regmap.h>
+
+/*
+ * The configurations in the settings file have 0x317 registers (last offset is 0x316).
+ */
+#define NUM_CONFIG_REGISTERS			0x317
+#define NUM_INPUTS				2
+#define NUM_OUTPUTS				4
+#define WRITE_BLOCK_SIZE			2
+
+/* Non output-specific registers */
+#define RENESAS24X_REG_DBL_DIS			0x6C
+#define RENESAS24X_REG_DBL_DIS_MASK		0x01
+#define RENESAS24X_REG_DSM_INT_8		0x25
+#define RENESAS24X_REG_DSM_INT_8_MASK		0x01
+#define RENESAS24X_REG_DSM_INT_7_0		0x26
+#define RENESAS24X_REG_DSMFRAC_20_16		0x28
+#define RENESAS24X_REG_DSMFRAC_20_16_MASK	0x1F
+#define RENESAS24X_REG_DSMFRAC_15_8		0x29
+#define RENESAS24X_REG_DSMFRAC_7_0		0x2A
+#define RENESAS24X_REG_OUTEN			0x39
+#define RENESAS24X_REG_OUTMODE0_1		0x3E
+#define RENESAS24X_REG_OUTMODE2_3		0x3D
+#define RENESAS24X_REG_Q_DIS			0x6F
+
+/* Q0 */
+#define RENESAS24X_REG_OUTEN0_MASK		0x01
+#define RENESAS24X_REG_OUTMODE0_MASK		0x0E
+#define RENESAS24X_REG_Q0_DIS_MASK		0x01
+#define RENESAS24X_REG_NS1_Q0			0x3F
+#define RENESAS24X_REG_NS1_Q0_MASK		0x03
+#define RENESAS24X_REG_NS2_Q0_15_8		0x40
+#define RENESAS24X_REG_NS2_Q0_7_0		0x41
+
+/* Q1 */
+#define RENESAS24X_REG_OUTEN1_MASK		0x02
+#define RENESAS24X_REG_OUTMODE1_MASK		0xE0
+#define RENESAS24X_REG_Q1_DIS_MASK		0x02
+#define RENESAS24X_REG_N_Q1_17_16		0x42
+#define RENESAS24X_REG_N_Q1_17_16_MASK		0x03
+#define RENESAS24X_REG_N_Q1_15_8		0x43
+#define RENESAS24X_REG_N_Q1_7_0			0x44
+#define RENESAS24X_REG_NFRAC_Q1_27_24		0x57
+#define RENESAS24X_REG_NFRAC_Q1_27_24_MASK	0x0F
+#define RENESAS24X_REG_NFRAC_Q1_23_16		0x58
+#define RENESAS24X_REG_NFRAC_Q1_15_8		0x59
+#define RENESAS24X_REG_NFRAC_Q1_7_0		0x5A
+
+/* Q2 */
+#define RENESAS24X_REG_OUTEN2_MASK		0x04
+#define RENESAS24X_REG_OUTMODE2_MASK		0x0E
+#define RENESAS24X_REG_Q2_DIS_MASK		0x04
+#define RENESAS24X_REG_N_Q2_17_16		0x45
+#define RENESAS24X_REG_N_Q2_17_16_MASK		0x03
+#define RENESAS24X_REG_N_Q2_15_8		0x46
+#define RENESAS24X_REG_N_Q2_7_0			0x47
+#define RENESAS24X_REG_NFRAC_Q2_27_24		0x5B
+#define RENESAS24X_REG_NFRAC_Q2_27_24_MASK	0x0F
+#define RENESAS24X_REG_NFRAC_Q2_23_16		0x5C
+#define RENESAS24X_REG_NFRAC_Q2_15_8		0x5D
+#define RENESAS24X_REG_NFRAC_Q2_7_0		0x5E
+
+/* Q3 */
+#define RENESAS24X_REG_OUTEN3_MASK		0x08
+#define RENESAS24X_REG_OUTMODE3_MASK		0xE0
+#define RENESAS24X_REG_Q3_DIS_MASK		0x08
+#define RENESAS24X_REG_N_Q3_17_16		0x48
+#define RENESAS24X_REG_N_Q3_17_16_MASK		0x03
+#define RENESAS24X_REG_N_Q3_15_8		0x49
+#define RENESAS24X_REG_N_Q3_7_0			0x4A
+#define RENESAS24X_REG_NFRAC_Q3_27_24		0x5F
+#define RENESAS24X_REG_NFRAC_Q3_27_24_MASK	0x0F
+#define RENESAS24X_REG_NFRAC_Q3_23_16		0x60
+#define RENESAS24X_REG_NFRAC_Q3_15_8		0x61
+#define RENESAS24X_REG_NFRAC_Q3_7_0		0x62
+
+/**
+ * struct renesas24x_output - device output information
+ * @hw:		hw registration info for this specific output clcok. This gets
+ *		passed as an argument to CCF api calls (e.g., set_rate).
+ *		container_of can then be used to get the reference to this
+ *		struct.
+ * @chip:	store a reference to the parent device structure. container_of
+ *		cannot be used to get to the parent device structure from
+ *		renesas24x_output, because clk_renesas24x_chip contains an array of
+ *		output structs (for future enhancements to support devices
+ *		with different numbers of output clocks).
+ * @index:	identifies output on the chip; used in debug statements
+ * @requested:	requested output clock frequency (in Hz)
+ * @actual:	actual output clock frequency (in Hz). Will only be set after
+ *		successful update of the device.
+ */
+struct renesas24x_output {
+	struct clk_hw hw;
+	struct clk_renesas24x_chip *chip;
+	u8 index;
+	u32 requested;
+	u32 actual;
+};
+
+/**
+ * struct renesas24x_dividers - output dividers
+ * @dsmint:	int component of feedback divider for VCO (2-stage divider)
+ * @dsmfrac:	fractional component of feedback divider for VCO
+ * @ns1_q0:	ns1 divider component for Q0
+ * @ns2_q0:	ns2 divider component for Q0
+ * @nint:	int divider component for Q1-3
+ * @nfrac:	fractional divider component for Q1-3
+ */
+struct renesas24x_dividers {
+	u16 dsmint;
+	u32 dsmfrac;
+
+	u8 ns1_q0;
+	u16 ns2_q0;
+
+	u32 nint[3];
+	u32 nfrac[3];
+};
+
+/**
+ * struct clk_renesas24x_chip - device info for chip
+ * @regmap:		register map used to perform i2c writes to the chip
+ * @i2c_client:		i2c_client struct passed to probe
+ * @min_freq:		min frequency for this chip
+ * @max_freq:		max frequency for this chip
+ * @settings:		filled in if full register map is specified in the DT
+ * @has_settings:	true if settings array is valid
+ * @input_clk:		ptr to input clock specified in DT
+ * @input_clk_num:	which input clock was specified. 0-based. A value of
+ *			NUM_INPUTS indicates that a XTAL is used as the input.
+ * @input_clk_nb:	notification support (if input clk changes)
+ * @input_clk_freq:	current freq of input_clk
+ * @doubler_disabled:	whether input doubler is enabled. This value is read
+ *			from the hw on probe (in case it is set in @settings).
+ * @clk:		array of outputs. One entry per output supported by the
+ *			chip. Frequencies requested via the ccf api will be
+ *			recorded in this array.
+ * @reg_dsm_int_8:	record current value from hw to avoid modifying
+ *			when writing register values
+ * @reg_dsm_frac_20_16:	record current value
+ * @reg_out_en_x:	record current value
+ * @reg_out_mode_0_1:	record current value
+ * @reg_out_mode_2_3:	record current value
+ * @reg_qx_dis:		record current value
+ * @reg_ns1_q0:		record current value
+ * @reg_n_qx_17_16:	record current value
+ * @reg_nfrac_qx_27_24:	record current value
+ * @divs:		output divider values for all outputs
+ */
+struct clk_renesas24x_chip {
+	struct regmap *regmap;
+	struct i2c_client *i2c_client;
+
+	u32 min_freq;
+	u32 max_freq;
+
+	u8 settings[NUM_CONFIG_REGISTERS];
+
+	bool has_settings;
+
+	struct clk *input_clk;
+	int input_clk_num;
+	struct notifier_block input_clk_nb;
+	u32 input_clk_freq;
+
+	bool doubler_disabled;
+
+	struct renesas24x_output clk[NUM_OUTPUTS];
+
+	unsigned int reg_dsm_int_8;
+	unsigned int reg_dsm_frac_20_16;
+	unsigned int reg_out_en_x;
+	unsigned int reg_out_mode_0_1;
+	unsigned int reg_out_mode_2_3;
+	unsigned int reg_qx_dis;
+	unsigned int reg_ns1_q0;
+	unsigned int reg_n_qx_17_16[3];
+	unsigned int reg_nfrac_qx_27_24[3];
+
+	struct renesas24x_dividers divs;
+};
+
+#define to_renesas24x_output(_hw) \
+	container_of(_hw, struct renesas24x_output, hw)
+
+#define to_clk_renesas24x_from_client(_client) \
+	container_of(_client, struct clk_renesas24x_chip, i2c_client)
+
+#define to_clk_renesas24x_from_nb(_nb) \
+	container_of(_nb, struct clk_renesas24x_chip, input_clk_nb)
+
+/**
+ * struct clk_register_offsets - register offsets for current context
+ * @oe_offset:		offset for current output enable and mode
+ * @oe_mask:		mask for current output enable
+ * @dis_mask:		mask for current output disable
+ * @n_17_16_offset:	offset for current output int divider (bits 17:16)
+ * @n_17_16_mask:	mask for current output int divider (bits 17:16)
+ * @n_15_8_offset:	offset for current output int divider (bits 15:8)
+ * @n_7_0_offset:	offset for current output int divider (bits 7:0)
+ * @nfrac_27_24_offset:	offset for current output frac divider (bits 27:24)
+ * @nfrac_27_24_mask:	mask for current output frac divider (bits 27:24)
+ * @nfrac_23_16_offset:	offset for current output frac divider (bits 23:16)
+ * @nfrac_15_8_offset:	offset for current output frac divider (bits 15:8)
+ * @nfrac_7_0_offset:	offset for current output frac divider (bits 7:0)
+ * @ns1_offset:		offset for stage 1 div for output Q0
+ * @ns1_offset_mask:	mask for stage 1 div for output Q0
+ * @ns2_15_8_offset:	offset for stage 2 div for output Q0 (bits 15:8)
+ * @ns2_7_0_offset:	offset for stage 2 div for output Q0 (bits 7:0)
+ */
+struct clk_register_offsets {
+	u16 oe_offset;
+	u8 oe_mask;
+	u8 dis_mask;
+
+	u16 n_17_16_offset;
+	u8 n_17_16_mask;
+	u16 n_15_8_offset;
+	u16 n_7_0_offset;
+	u16 nfrac_27_24_offset;
+	u8 nfrac_27_24_mask;
+	u16 nfrac_23_16_offset;
+	u16 nfrac_15_8_offset;
+	u16 nfrac_7_0_offset;
+
+	u16 ns1_offset;
+	u8 ns1_offset_mask;
+	u16 ns2_15_8_offset;
+	u16 ns2_7_0_offset;
+};
+
+int __renesas_bits_to_shift(unsigned int mask);
+int __renesas_i2c_write_bulk(struct i2c_client *client, struct regmap *map,
+			     unsigned int reg, u8 val[], size_t val_count);
+int renesas24x_get_offsets(u8 output_num, struct clk_register_offsets *offsets);
+int renesas24x_set_frequency(struct clk_renesas24x_chip *chip);
+
+#endif /* #ifndef __8T49N24X_CORE_H_ */
diff --git a/drivers/clk/renesas/8t49n24x.c b/drivers/clk/renesas/8t49n24x.c
new file mode 100644
index 000000000..5d95705c0
--- /dev/null
+++ b/drivers/clk/renesas/8t49n24x.c
@@ -0,0 +1,572 @@
+// SPDX-License-Identifier: GPL-2.0
+/* 8t49n24x.c - Program 8T49N24x settings via I2C.
+ *
+ * Copyright (C) 2018, Renesas Electronics America <david.cater.jc@renesas.com>
+ */
+
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+
+#include "8t49n24x-core.h"
+
+#define OUTPUTMODE_HIGHZ		0
+#define OUTPUTMODE_LVDS			2
+#define RENESAS24X_MIN_FREQ		1000000L
+#define RENESAS24X_MAX_FREQ		300000000L
+
+enum clk_renesas24x_variant { renesas24x };
+
+static u32 __mask_and_shift(u32 value, u8 mask)
+{
+	value &= mask;
+	return value >> __renesas_bits_to_shift(mask);
+}
+
+/**
+ * renesas24x_set_output_mode - Set the mode for a particular clock
+ * output in the register.
+ * @reg:	The current register value before setting the mode.
+ * @mask:	The bitmask identifying where in the register the
+ *		output mode is stored.
+ * @mode:	The mode to set.
+ *
+ * Return: the new register value with the specified mode bits set.
+ */
+static int renesas24x_set_output_mode(u32 reg, u8 mask, u8 mode)
+{
+	if (((reg & mask) >> __renesas_bits_to_shift(mask)) == OUTPUTMODE_HIGHZ) {
+		reg = reg & ~mask;
+		reg |= OUTPUTMODE_LVDS << __renesas_bits_to_shift(mask);
+	}
+	return reg;
+}
+
+/**
+ * renesas24x_read_from_hw - Get the current values on the hw
+ * @chip:	Device data structure
+ *
+ * Return: 0 on success, negative errno otherwise.
+ */
+static int renesas24x_read_from_hw(struct clk_renesas24x_chip *chip)
+{
+	int err = 0;
+	u32 tmp = 0, tmp2 = 0;
+	u8 output = 0;
+	struct i2c_client *client = chip->i2c_client;
+
+	err = regmap_read(chip->regmap, RENESAS24X_REG_DSM_INT_8, &chip->reg_dsm_int_8);
+	if (err) {
+		dev_err(&client->dev, "error reading RENESAS24X_REG_DSM_INT_8: %i", err);
+		return err;
+	}
+
+	dev_dbg(&client->dev, "reg_dsm_int_8: 0x%x", chip->reg_dsm_int_8);
+
+	err = regmap_read(chip->regmap, RENESAS24X_REG_DSMFRAC_20_16_MASK,
+			  &chip->reg_dsm_frac_20_16);
+	if (err) {
+		dev_err(&client->dev, "error reading RENESAS24X_REG_DSMFRAC_20_16_MASK: %i", err);
+		return err;
+	}
+
+	dev_dbg(&client->dev, "reg_dsm_frac_20_16: 0x%x", chip->reg_dsm_frac_20_16);
+
+	err = regmap_read(chip->regmap, RENESAS24X_REG_OUTEN, &chip->reg_out_en_x);
+	if (err) {
+		dev_err(&client->dev, "error reading RENESAS24X_REG_OUTEN: %i", err);
+		return err;
+	}
+
+	dev_dbg(&client->dev, "reg_out_en_x: 0x%x", chip->reg_out_en_x);
+
+	err = regmap_read(chip->regmap, RENESAS24X_REG_OUTMODE0_1, &tmp);
+	if (err) {
+		dev_err(&client->dev, "error reading RENESAS24X_REG_OUTMODE0_1: %i", err);
+		return err;
+	}
+
+	tmp2 = renesas24x_set_output_mode(tmp, RENESAS24X_REG_OUTMODE0_MASK, OUTPUTMODE_LVDS);
+	tmp2 = renesas24x_set_output_mode(tmp2, RENESAS24X_REG_OUTMODE1_MASK, OUTPUTMODE_LVDS);
+	dev_dbg(&client->dev,
+		"reg_out_mode_0_1 original: 0x%x. After OUT0/1 to LVDS if necessary: 0x%x",
+		tmp, tmp2);
+
+	chip->reg_out_mode_0_1 = tmp2;
+	err = regmap_read(chip->regmap, RENESAS24X_REG_OUTMODE2_3, &tmp);
+	if (err) {
+		dev_err(&client->dev, "error reading RENESAS24X_REG_OUTMODE2_3: %i", err);
+		return err;
+	}
+
+	tmp2 = renesas24x_set_output_mode(tmp, RENESAS24X_REG_OUTMODE2_MASK, OUTPUTMODE_LVDS);
+	tmp2 = renesas24x_set_output_mode(tmp2, RENESAS24X_REG_OUTMODE3_MASK, OUTPUTMODE_LVDS);
+	dev_dbg(&client->dev,
+		"reg_out_mode_2_3 original: 0x%x. After OUT2/3 to LVDS if necessary: 0x%x",
+		tmp, tmp2);
+
+	chip->reg_out_mode_2_3 = tmp2;
+	err = regmap_read(chip->regmap, RENESAS24X_REG_Q_DIS, &chip->reg_qx_dis);
+	if (err) {
+		dev_err(&client->dev, "error reading RENESAS24X_REG_Q_DIS: %i", err);
+		return err;
+	}
+
+	dev_dbg(&client->dev, "reg_qx_dis: 0x%x", chip->reg_qx_dis);
+
+	err = regmap_read(chip->regmap, RENESAS24X_REG_NS1_Q0, &chip->reg_ns1_q0);
+	if (err) {
+		dev_err(&client->dev, "error reading RENESAS24X_REG_NS1_Q0: %i", err);
+		return err;
+	}
+
+	dev_dbg(&client->dev, "reg_ns1_q0: 0x%x", chip->reg_ns1_q0);
+
+	for (output = 1; output <= 3; output++) {
+		struct clk_register_offsets offsets;
+
+		err = renesas24x_get_offsets(output, &offsets);
+		if (err) {
+			dev_err(&client->dev, "error calling renesas24x_get_offsets: %i", err);
+			return err;
+		}
+
+		err = regmap_read(chip->regmap, offsets.n_17_16_offset,
+				  &chip->reg_n_qx_17_16[output - 1]);
+		if (err) {
+			dev_err(&client->dev,
+				"error reading n_17_16_offset output %d (offset: 0x%x): %i",
+				output, offsets.n_17_16_offset, err);
+			return err;
+		}
+
+		dev_dbg(&client->dev, "reg_n_qx_17_16[Q%u]: 0x%x", output,
+			chip->reg_n_qx_17_16[output - 1]);
+
+		err = regmap_read(chip->regmap, offsets.nfrac_27_24_offset,
+				  &chip->reg_nfrac_qx_27_24[output - 1]);
+		if (err) {
+			dev_err(&client->dev,
+				"error reading nfrac_27_24_offset output %d (offset: 0x%x): %i",
+				output, offsets.nfrac_27_24_offset,
+				err);
+			return err;
+		}
+
+		dev_dbg(&client->dev, "reg_nfrac_qx_27_24[Q%u]: 0x%x", output,
+			chip->reg_nfrac_qx_27_24[output - 1]);
+	}
+
+	dev_info(&client->dev, "initial values read from chip successfully");
+
+	/* Also read DBL_DIS to determine whether the doubler is disabled. */
+	err = regmap_read(chip->regmap, RENESAS24X_REG_DBL_DIS, &tmp);
+	if (err) {
+		dev_err(&client->dev, "error reading RENESAS24X_REG_DBL_DIS: %i", err);
+		return err;
+	}
+
+	chip->doubler_disabled = __mask_and_shift(tmp, RENESAS24X_REG_DBL_DIS_MASK);
+	dev_dbg(&client->dev, "doubler_disabled: %d", chip->doubler_disabled);
+
+	return 0;
+}
+
+/**
+ * renesas24x_set_rate - Sets the specified output clock to the specified rate.
+ * @hw:		clk_hw struct that identifies the specific output clock.
+ * @rate:	the rate (in Hz) for the specified clock.
+ * @parent_rate:(not sure) the rate for a parent signal (e.g.,
+ *		the VCO feeding the output)
+ *
+ * This function will call renesas24x_set_frequency, which means it will
+ * calculate divider for all requested outputs and update the attached
+ * device (issue I2C commands to update the registers).
+ *
+ * Return: 0 on success.
+ */
+static int renesas24x_set_rate(struct clk_hw *hw, unsigned long rate,
+			       unsigned long parent_rate)
+{
+	int err = 0;
+
+	/*
+	 * hw->clk is the pointer to the specific output clock the user is
+	 * requesting. We use hw to get back to the output structure for
+	 * the output clock. Set the requested rate in the output structure.
+	 * Note that container_of cannot be used to find the device structure
+	 * (clk_renesas24x_chip) from clk_hw, because clk_renesas24x_chip has an array
+	 * of renesas24x_output structs. That is why it is necessary to use
+	 * output->chip to access the device structure.
+	 */
+	struct renesas24x_output *output = to_renesas24x_output(hw);
+	struct i2c_client *client = output->chip->i2c_client;
+
+	if (rate < output->chip->min_freq || rate > output->chip->max_freq) {
+		dev_err(&client->dev,
+			"requested frequency (%luHz) is out of range\n", rate);
+		return -EINVAL;
+	}
+
+	/*
+	 * Set the requested frequency in the output data structure, and then
+	 * call renesas24x_set_frequency. renesas24x_set_frequency considers all
+	 * requested frequencies when deciding on a vco frequency and
+	 * calculating dividers.
+	 */
+	output->requested = rate;
+
+	dev_info(&client->dev, "calling renesas24x_set_frequency for Q%u. rate: %lu",
+		 output->index, rate);
+	err = renesas24x_set_frequency(output->chip);
+	if (err)
+		dev_err(&client->dev, "error calling set_frequency: %d", err);
+
+	return err;
+}
+
+/**
+ * renesas24x_round_rate - get valid rate that is closest to the requested rate
+ * @hw:		clk_hw struct that identifies the specific output clock.
+ * @rate:	the rate (in Hz) for the specified clock.
+ * @parent_rate:(not sure) the rate for a parent signal (e.g., the VCO
+ *		feeding the output). This is an i/o param.
+ *		If the driver supports a parent clock for the output (e.g.,
+ *		the VCO(?), then set this param to indicate what the rate of
+ *		the parent would be (e.g., the VCO frequency) if the rounded
+ *		rate is used.
+ *
+ * Returns the closest rate to the requested rate actually supported by the
+ * chip.
+ *
+ * Return: adjusted rate
+ */
+static long renesas24x_round_rate(struct clk_hw *hw, unsigned long rate,
+				  unsigned long *parent_rate)
+{
+	/*
+	 * The chip has fractional output dividers, so assume it
+	 * can provide the requested rate.
+	 *
+	 * TODO: figure out the closest rate that chip can support
+	 * within a low error threshold and return that rate.
+	 */
+	return rate;
+}
+
+/**
+ * renesas24x_recalc_rate - return the frequency being provided by the clock.
+ * @hw:			clk_hw struct that identifies the specific output clock.
+ * @parent_rate:	(not sure) the rate for a parent signal (e.g., the
+ *			VCO feeding the output)
+ *
+ * This API appears to be used to read the current values from the hardware
+ * and report the frequency being provided by the clock. Without this function,
+ * the clock will be initialized to 0 by default. The OS appears to be
+ * calling this to find out what the current value of the clock is at
+ * startup, so it can determine when .set_rate is actually changing the
+ * frequency.
+ *
+ * Return: the frequency of the specified clock.
+ */
+static unsigned long renesas24x_recalc_rate(struct clk_hw *hw,
+					    unsigned long parent_rate)
+{
+	struct renesas24x_output *output = to_renesas24x_output(hw);
+
+	return output->requested;
+}
+
+/*
+ * Note that .prepare and .unprepare appear to be used more in Gates.
+ * They do not appear to be necessary for this device.
+ * Instead, update the device when .set_rate is called.
+ */
+static const struct clk_ops renesas24x_clk_ops = {
+	.recalc_rate = renesas24x_recalc_rate,
+	.round_rate = renesas24x_round_rate,
+	.set_rate = renesas24x_set_rate,
+};
+
+static bool renesas24x_regmap_is_volatile(struct device *dev, unsigned int reg)
+{
+	return false;
+}
+
+static bool renesas24x_regmap_is_writeable(struct device *dev, unsigned int reg)
+{
+	return true;
+}
+
+static const struct regmap_config renesas24x_regmap_config = {
+	.reg_bits = 16,
+	.val_bits = 8,
+	.cache_type = REGCACHE_RBTREE,
+	.max_register = 0xffff,
+	.writeable_reg = renesas24x_regmap_is_writeable,
+	.volatile_reg = renesas24x_regmap_is_volatile,
+};
+
+/**
+ * renesas24x_clk_notifier_cb - Clock rate change callback
+ * @nb:		Pointer to notifier block
+ * @event:	Notification reason
+ * @data:	Pointer to notification data object
+ *
+ * This function is called when the input clock frequency changes.
+ * The callback checks whether a valid bus frequency can be generated after the
+ * change. If so, the change is acknowledged, otherwise the change is aborted.
+ * New dividers are written to the HW in the pre- or post change notification
+ * depending on the scaling direction.
+ *
+ * Return:	NOTIFY_STOP if the rate change should be aborted, NOTIFY_OK
+ *		to acknowledge the change, NOTIFY_DONE if the notification is
+ *		considered irrelevant.
+ */
+static int renesas24x_clk_notifier_cb(struct notifier_block *nb,
+				      unsigned long event, void *data)
+{
+	struct clk_notifier_data *ndata = data;
+	struct clk_renesas24x_chip *chip = to_clk_renesas24x_from_nb(nb);
+	int err = 0;
+
+	dev_info(&chip->i2c_client->dev, "input changed: %lu Hz. event: %lu",
+		 ndata->new_rate, event);
+
+	switch (event) {
+	case PRE_RATE_CHANGE: {
+		dev_dbg(&chip->i2c_client->dev, "PRE_RATE_CHANGE\n");
+		return NOTIFY_OK;
+	}
+	case POST_RATE_CHANGE:
+		chip->input_clk_freq = ndata->new_rate;
+		/*
+		 * Can't call clock API clk_set_rate here; I believe
+		 * it will be ignored if the rate is the same as we
+		 * set previously. Need to call our internal function.
+		 */
+		dev_dbg(&chip->i2c_client->dev, "POST_RATE_CHANGE. Calling renesas24x_set_frequency\n");
+		err = renesas24x_set_frequency(chip);
+		if (err)
+			dev_err(&chip->i2c_client->dev, "error setting frequency (%i)\n", err);
+		return NOTIFY_OK;
+	case ABORT_RATE_CHANGE:
+		return NOTIFY_OK;
+	default:
+		return NOTIFY_DONE;
+	}
+}
+
+static struct clk_hw *of_clk_renesas24x_get(struct of_phandle_args *clkspec,
+					    void *_data)
+{
+	struct clk_renesas24x_chip *chip = _data;
+	unsigned int idx = clkspec->args[0];
+
+	if (idx >= ARRAY_SIZE(chip->clk)) {
+		pr_err("invalid index %u\n", idx);
+		return ERR_PTR(-EINVAL);
+	}
+
+	return &chip->clk[idx].hw;
+}
+
+/**
+ * renesas24x_probe - main entry point for ccf driver
+ * @client:	pointer to i2c_client structure
+ * @id:		pointer to i2c_device_id structure
+ *
+ * Main entry point function that gets called to initialize the driver.
+ *
+ * Return: 0 for success.
+ */
+static int renesas24x_probe(struct i2c_client *client,
+			    const struct i2c_device_id *id)
+{
+	struct clk_renesas24x_chip *chip;
+	struct clk_init_data init;
+
+	int err = 0, x = 0;
+	char buf[6];
+
+	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	init.ops = &renesas24x_clk_ops;
+	init.flags = 0;
+	init.num_parents = 0;
+	chip->i2c_client = client;
+
+	chip->min_freq = RENESAS24X_MIN_FREQ;
+	chip->max_freq = RENESAS24X_MAX_FREQ;
+
+	for (x = 0; x < NUM_INPUTS + 1; x++) {
+		char name[12];
+
+		sprintf(name, x == NUM_INPUTS ? "xtal" : "clk%i", x);
+		dev_dbg(&client->dev, "attempting to get %s", name);
+		chip->input_clk = devm_clk_get(&client->dev, name);
+		if (IS_ERR(chip->input_clk)) {
+			err = PTR_ERR(chip->input_clk);
+			/*
+			 * TODO: Handle EPROBE_DEFER error, which indicates
+			 * that the input_clk isn't available now but may be
+			 * later when the appropriate module is loaded.
+			 */
+		} else {
+			err = 0;
+			chip->input_clk_num = x;
+			break;
+		}
+	}
+
+	if (err) {
+		dev_err(&client->dev, "Unable to get input clock, error %d", err);
+		chip->input_clk = NULL;
+		return err;
+	}
+
+	chip->input_clk_freq = clk_get_rate(chip->input_clk);
+	dev_dbg(&client->dev, "Frequency from clk in device tree: %uHz", chip->input_clk_freq);
+
+	chip->input_clk_nb.notifier_call = renesas24x_clk_notifier_cb;
+	if (clk_notifier_register(chip->input_clk, &chip->input_clk_nb))
+		dev_warn(&client->dev, "Unable to register clock notifier for input_clk.");
+
+	dev_dbg(&client->dev, "about to read settings: %zu", ARRAY_SIZE(chip->settings));
+
+	err = of_property_read_u8_array(client->dev.of_node, "renesas,settings", chip->settings,
+					ARRAY_SIZE(chip->settings));
+	if (!err) {
+		dev_dbg(&client->dev, "settings property specified in DT");
+		chip->has_settings = true;
+	} else {
+		if (err == -EOVERFLOW) {
+			dev_alert(&client->dev, "EOVERFLOW reading settings. ARRAY_SIZE: %zu",
+				  ARRAY_SIZE(chip->settings));
+			return err;
+		}
+		dev_dbg(&client->dev,
+			"settings property missing in DT (or an error that can be ignored: %i).",
+			err);
+	}
+
+	/*
+	 * Requested output frequencies cannot be specified in the DT.
+	 * Either a consumer needs to use the clock API to request the rate.
+	 * Use clock-names in DT to specify the output clock.
+	 */
+
+	chip->regmap = devm_regmap_init_i2c(client, &renesas24x_regmap_config);
+	if (IS_ERR(chip->regmap)) {
+		dev_err(&client->dev, "failed to allocate register map\n");
+		return PTR_ERR(chip->regmap);
+	}
+
+	dev_dbg(&client->dev, "call i2c_set_clientdata");
+	i2c_set_clientdata(client, chip);
+
+	if (chip->has_settings) {
+		/*
+		 * A raw settings array was specified in the DT. Write the
+		 * settings to the device immediately.
+		 */
+		err = __renesas_i2c_write_bulk(chip->i2c_client, chip->regmap, 0, chip->settings,
+					       ARRAY_SIZE(chip->settings));
+		if (err) {
+			dev_err(&client->dev, "error writing all settings to chip (%i)\n", err);
+			return err;
+		}
+		dev_dbg(&client->dev, "successfully wrote full settings array");
+	}
+
+	/*
+	 * Whether or not settings were written to the device, read all
+	 * current values from the hw.
+	 */
+	dev_dbg(&client->dev, "read from HW");
+	err = renesas24x_read_from_hw(chip);
+	if (err) {
+		dev_err(&client->dev, "failed calling renesas24x_read_from_hw (%i)\n", err);
+		return err;
+	}
+
+	/* Create all 4 clocks */
+	for (x = 0; x < NUM_OUTPUTS; x++) {
+		init.name = kasprintf(GFP_KERNEL, "%s.Q%i", client->dev.of_node->name, x);
+		chip->clk[x].chip = chip;
+		chip->clk[x].hw.init = &init;
+		chip->clk[x].index = x;
+		err = devm_clk_hw_register(&client->dev, &chip->clk[x].hw);
+		kfree(init.name); /* clock framework made a copy of the name */
+		if (err) {
+			dev_err(&client->dev, "clock registration failed\n");
+			return err;
+		}
+		dev_dbg(&client->dev, "successfully registered Q%i", x);
+	}
+
+	if (err) {
+		dev_err(&client->dev, "clock registration failed\n");
+		return err;
+	}
+
+	err = of_clk_add_hw_provider(client->dev.of_node, of_clk_renesas24x_get, chip);
+	if (err) {
+		dev_err(&client->dev, "unable to add clk provider\n");
+		return err;
+	}
+
+	if (chip->input_clk_num == NUM_INPUTS)
+		sprintf(buf, "XTAL");
+	else
+		sprintf(buf, "CLK%i", chip->input_clk_num);
+
+	dev_info(&client->dev,
+		 "probe success. input freq: %uHz (%s), settings string? %s\n",
+		 chip->input_clk_freq, buf,
+		 chip->has_settings ? "true" : "false");
+
+	return 0;
+}
+
+static int renesas24x_remove(struct i2c_client *client)
+{
+	struct clk_renesas24x_chip *chip = to_clk_renesas24x_from_client(&client);
+
+	of_clk_del_provider(client->dev.of_node);
+
+	if (!chip->input_clk)
+		clk_notifier_unregister(chip->input_clk, &chip->input_clk_nb);
+	return 0;
+}
+
+static const struct i2c_device_id renesas24x_id[] = {
+	 { "8t49n24x", renesas24x },
+	 {}
+};
+MODULE_DEVICE_TABLE(i2c, renesas24x_id);
+
+static const struct of_device_id renesas24x_of_match[] = {
+	{ .compatible = "renesas,8t49n241" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, renesas24x_of_match);
+
+static struct i2c_driver renesas24x_driver = {
+	.driver = {
+		.name = "8t49n24x",
+		.of_match_table = renesas24x_of_match,
+	},
+	.probe = renesas24x_probe,
+	.remove = renesas24x_remove,
+	.id_table = renesas24x_id,
+};
+
+module_i2c_driver(renesas24x_driver);
+
+MODULE_DESCRIPTION("8T49N24x ccf driver");
+MODULE_AUTHOR("David Cater <david.cater.jc@renesas.com>");
+MODULE_AUTHOR("Alex Helms <alexander.helms.jy@renesas.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index ef0d2bba9..e8f69b760 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -41,3 +41,7 @@ obj-$(CONFIG_CLK_RCAR_USB2_CLOCK_SEL)	+= rcar-usb2-clock-sel.o
 obj-$(CONFIG_CLK_RENESAS_CPG_MSSR)	+= renesas-cpg-mssr.o
 obj-$(CONFIG_CLK_RENESAS_CPG_MSTP)	+= clk-mstp.o
 obj-$(CONFIG_CLK_RENESAS_DIV6)		+= clk-div6.o
+
+# 8T49N24x
+obj-$(CONFIG_COMMON_CLK_8T49N24X)	+= clk-8t49n24x.o
+clk-8t49n24x-objs 			:= 8t49n24x.o 8t49n24x-core.o
-- 
2.30.2

