Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E575113BC9
	for <lists+linux-clk@lfdr.de>; Thu,  5 Dec 2019 07:37:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727304AbfLEGhn (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 5 Dec 2019 01:37:43 -0500
Received: from mail-bn8nam11on2046.outbound.protection.outlook.com ([40.107.236.46]:32804
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725905AbfLEGhm (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 5 Dec 2019 01:37:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hb51dMaV0k6bGrW6oIJ8+WzzXRlrkuzWRpuxzC/chobkJ4xgmn6+i62txzQpy36cWLRdUDqTYKwKAvgbk/c42+ypz4aQWOhaq4vicUnX+SDMIndXIvZOPoFcecXTPKbWHybHaynyh/m+XFXaJzkBAxKkpb8h1Ctyf1yeSvxt1jqAZ+urAKB79hMriGaAPLhHPlz6jcN8TFQDG0kGLrcyvEyirCnRR+LYI3W/S07Sj8gOvIu+dMEgkzpjlr+axsJrLIgOrboqltr+ROJG04235atf93C6C3oilvrAg03KWws/RjCUnoBpgN2XEngp+jKwodaLghlmHyBEXn0O92GP8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7dR6wQU33M3UN4w3m+4SyVhcnGxaxC++sn5renW2Kpg=;
 b=Dwcln5Uv3neNsT+GqpYLR4LVP0qLcFZKeH5zPPI0V/dcfDODSMP0aKXti1V9LDqLXl9WvtlKXqjkgeoOb0mH6nugjfYbylDZ+8vJqKcTv+0heNtRmVBs9bN8MTsBH6P4qkDUvk/FXVxONhxYiL+S3YpaPC363qcLQ0PGpHXD7b7tMy+sBc488fm/1tyIyGY9ONcYJ7oJH5sCaS7BlyhY/HwL4nhwIhacg664e1C8QyJEE0yCqBICefawupLc8u9Du1DTuF+88EM2S31rmaalc6YDeQWciu2H5crNUCdqjp0QSE9HMV5iJ1raFKy/G/tn74H9q0s68d4v+PitPeVNqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7dR6wQU33M3UN4w3m+4SyVhcnGxaxC++sn5renW2Kpg=;
 b=eZlig54EW0aN4Nc14hv5PgoFOCq4ph0GOy3aiq6Aer5ZS6aUopYOkummcJMpW82JDOxTt/TVgHSKRew+UBSwGOXvMzp0PEObjLXMbSbG0fg55Mg4NdLlDbhaxkae0pQp80hg6J3RzjfomzoUB2hPU+hXulxbJ/ndzK8gnOWh0kc=
Received: from CY4PR02CA0001.namprd02.prod.outlook.com (2603:10b6:903:18::11)
 by SN4PR0201MB3486.namprd02.prod.outlook.com (2603:10b6:803:51::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.22; Thu, 5 Dec
 2019 06:37:35 +0000
Received: from CY1NAM02FT049.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::207) by CY4PR02CA0001.outlook.office365.com
 (2603:10b6:903:18::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12 via Frontend
 Transport; Thu, 5 Dec 2019 06:37:35 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT049.mail.protection.outlook.com (10.152.75.83) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2474.17
 via Frontend Transport; Thu, 5 Dec 2019 06:37:35 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <rajan.vaja@xilinx.com>)
        id 1ickla-0000xL-QY; Wed, 04 Dec 2019 22:37:34 -0800
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <rajan.vaja@xilinx.com>)
        id 1icklV-0000XV-NB; Wed, 04 Dec 2019 22:37:29 -0800
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id xB56bJ9Q010327;
        Wed, 4 Dec 2019 22:37:20 -0800
Received: from [172.19.2.91] (helo=xsjjollys50.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <rajan.vaja@xilinx.com>)
        id 1icklL-0000WL-Ok; Wed, 04 Dec 2019 22:37:19 -0800
From:   Rajan Vaja <rajan.vaja@xilinx.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, michal.simek@xilinx.com,
        jolly.shah@xilinx.com, m.tretter@pengutronix.de,
        gustavo@embeddedor.com, tejas.patel@xilinx.com,
        nava.manne@xilinx.com, mdf@kernel.org
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Rajan Vaja <rajan.vaja@xilinx.com>
Subject: [PATCH v3 1/6] dt-bindings: clock: Add bindings for versal clock driver
Date:   Wed,  4 Dec 2019 22:35:54 -0800
Message-Id: <1575527759-26452-2-git-send-email-rajan.vaja@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575527759-26452-1-git-send-email-rajan.vaja@xilinx.com>
References: <1574415814-19797-1-git-send-email-rajan.vaja@xilinx.com>
 <1575527759-26452-1-git-send-email-rajan.vaja@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(376002)(346002)(396003)(136003)(199004)(189003)(2616005)(6666004)(107886003)(70586007)(426003)(478600001)(11346002)(5660300002)(36756003)(966005)(336012)(4326008)(356004)(305945005)(316002)(76176011)(7416002)(7696005)(50226002)(6306002)(16586007)(14444005)(2906002)(186003)(9786002)(81156014)(51416003)(48376002)(8936002)(81166006)(70206006)(44832011)(8676002)(36386004)(26005)(50466002)(921003)(1121003);DIR:OUT;SFP:1101;SCL:1;SRVR:SN4PR0201MB3486;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;MX:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea3d4a13-e2ee-42f2-f1f6-08d7794d9d4f
X-MS-TrafficTypeDiagnostic: SN4PR0201MB3486:
X-Microsoft-Antispam-PRVS: <SN4PR0201MB3486ACA15F3726CED33A0F7AB75C0@SN4PR0201MB3486.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 02426D11FE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ja40FRGjix7VUXJUESx/OJCmLuzJwOFc++QcMVcLqdAZPBxWjB40EphE0gtcdor2jOkqjXrv8bz4uJEvz0HEB6uQC3s445GGHmjvOtnrg25e7MRguTP24AfmZoTj7exTlxWnEIjbrtp+PbDijdWU4Xf9eTrcqb/+LJpJxrP3rbzObK76sERYJJoNLPaeESINN3CRA00txK4UiD2DRV3JHWUJT1SziltBg1Rgt+2/LBMvisZnbUX+4xoGfWeduHBaNzsnqXkuHzjbLuaPKcL6xy+Y3hzEK3fmVPaUK/ygGoqnQIwD2crnMmEgVo7yA9gvGqs8B5tr3nKrazbLu0/3Ut/mYnJwSqEnUsOXhdIUtJADIkScWpnEvwnERrHScEdKi9UFCHKaAg2jfjorVUr0R3c3x0LguAZydOKAw4XBFa/qBrD6ePmRsNkQwddwMthZ8c80LLAimVNnInkeqJbs3wm5vfaUGxTNZzQai2l8J6J2YzgkyjMgVQn+GJRgQuNCTbRdk1tYQMfXUpzIBXX3Fvdesnfu4Qhct2Lz7oaB8Q0=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2019 06:37:35.3198
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea3d4a13-e2ee-42f2-f1f6-08d7794d9d4f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB3486
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add documentation to describe Xilinx Versal clock driver
bindings.

Signed-off-by: Rajan Vaja <rajan.vaja@xilinx.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes in v3:
 - Update SPDX-License-Identifier.
Changes in v2:
 - Correct description.
 - Add "select: false" field to avoid failing when firmware schema is
   available.
 - Remove "_clk" from clock names.
 - Remove minItems and maxItems fields.

NOTE: firmware dt-bindings in yaml format will be added in a separate
      change and $ref of this yaml to firmware will be added.
---
 .../devicetree/bindings/clock/xlnx,versal-clk.yaml |  64 +++++++++++
 include/dt-bindings/clock/xlnx-versal-clk.h        | 123 +++++++++++++++++++++
 2 files changed, 187 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
 create mode 100644 include/dt-bindings/clock/xlnx-versal-clk.h

diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
new file mode 100644
index 0000000..f1150ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bindings/clock/xlnx,versal-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx Versal clock controller
+
+maintainers:
+  - Michal Simek <michal.simek@xilinx.com>
+  - Jolly Shah <jolly.shah@xilinx.com>
+  - Rajan Vaja <rajan.vaja@xilinx.com>
+
+description: |
+  The clock controller is a hardware block of Xilinx versal clock tree. It
+  reads required input clock frequencies from the devicetree and acts as clock
+  provider for all clock consumers of PS clocks.
+
+select: false
+
+properties:
+  compatible:
+    const: xlnx,versal-clk
+
+  "#clock-cells":
+    const: 1
+
+  clocks:
+    description: List of clock specifiers which are external input
+      clocks to the given clock controller.
+    items:
+      - description: reference clock
+      - description: alternate reference clock
+      - description: alternate reference clock for programmable logic
+
+  clock-names:
+    items:
+      - const: ref
+      - const: alt_ref
+      - const: pl_alt_ref
+
+required:
+  - compatible
+  - "#clock-cells"
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    firmware {
+      zynqmp_firmware: zynqmp-firmware {
+        compatible = "xlnx,zynqmp-firmware";
+        method = "smc";
+        versal_clk: clock-controller {
+          #clock-cells = <1>;
+          compatible = "xlnx,versal-clk";
+          clocks = <&ref>, <&alt_ref>, <&pl_alt_ref>;
+          clock-names = "ref", "alt_ref", "pl_alt_ref";
+        };
+      };
+    };
+...
diff --git a/include/dt-bindings/clock/xlnx-versal-clk.h b/include/dt-bindings/clock/xlnx-versal-clk.h
new file mode 100644
index 0000000..264d634
--- /dev/null
+++ b/include/dt-bindings/clock/xlnx-versal-clk.h
@@ -0,0 +1,123 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ *  Copyright (C) 2019 Xilinx Inc.
+ *
+ */
+
+#ifndef _DT_BINDINGS_CLK_VERSAL_H
+#define _DT_BINDINGS_CLK_VERSAL_H
+
+#define PMC_PLL					1
+#define APU_PLL					2
+#define RPU_PLL					3
+#define CPM_PLL					4
+#define NOC_PLL					5
+#define PLL_MAX					6
+#define PMC_PRESRC				7
+#define PMC_POSTCLK				8
+#define PMC_PLL_OUT				9
+#define PPLL					10
+#define NOC_PRESRC				11
+#define NOC_POSTCLK				12
+#define NOC_PLL_OUT				13
+#define NPLL					14
+#define APU_PRESRC				15
+#define APU_POSTCLK				16
+#define APU_PLL_OUT				17
+#define APLL					18
+#define RPU_PRESRC				19
+#define RPU_POSTCLK				20
+#define RPU_PLL_OUT				21
+#define RPLL					22
+#define CPM_PRESRC				23
+#define CPM_POSTCLK				24
+#define CPM_PLL_OUT				25
+#define CPLL					26
+#define PPLL_TO_XPD				27
+#define NPLL_TO_XPD				28
+#define APLL_TO_XPD				29
+#define RPLL_TO_XPD				30
+#define EFUSE_REF				31
+#define SYSMON_REF				32
+#define IRO_SUSPEND_REF				33
+#define USB_SUSPEND				34
+#define SWITCH_TIMEOUT				35
+#define RCLK_PMC				36
+#define RCLK_LPD				37
+#define WDT					38
+#define TTC0					39
+#define TTC1					40
+#define TTC2					41
+#define TTC3					42
+#define GEM_TSU					43
+#define GEM_TSU_LB				44
+#define MUXED_IRO_DIV2				45
+#define MUXED_IRO_DIV4				46
+#define PSM_REF					47
+#define GEM0_RX					48
+#define GEM0_TX					49
+#define GEM1_RX					50
+#define GEM1_TX					51
+#define CPM_CORE_REF				52
+#define CPM_LSBUS_REF				53
+#define CPM_DBG_REF				54
+#define CPM_AUX0_REF				55
+#define CPM_AUX1_REF				56
+#define QSPI_REF				57
+#define OSPI_REF				58
+#define SDIO0_REF				59
+#define SDIO1_REF				60
+#define PMC_LSBUS_REF				61
+#define I2C_REF					62
+#define TEST_PATTERN_REF			63
+#define DFT_OSC_REF				64
+#define PMC_PL0_REF				65
+#define PMC_PL1_REF				66
+#define PMC_PL2_REF				67
+#define PMC_PL3_REF				68
+#define CFU_REF					69
+#define SPARE_REF				70
+#define NPI_REF					71
+#define HSM0_REF				72
+#define HSM1_REF				73
+#define SD_DLL_REF				74
+#define FPD_TOP_SWITCH				75
+#define FPD_LSBUS				76
+#define ACPU					77
+#define DBG_TRACE				78
+#define DBG_FPD					79
+#define LPD_TOP_SWITCH				80
+#define ADMA					81
+#define LPD_LSBUS				82
+#define CPU_R5					83
+#define CPU_R5_CORE				84
+#define CPU_R5_OCM				85
+#define CPU_R5_OCM2				86
+#define IOU_SWITCH				87
+#define GEM0_REF				88
+#define GEM1_REF				89
+#define GEM_TSU_REF				90
+#define USB0_BUS_REF				91
+#define UART0_REF				92
+#define UART1_REF				93
+#define SPI0_REF				94
+#define SPI1_REF				95
+#define CAN0_REF				96
+#define CAN1_REF				97
+#define I2C0_REF				98
+#define I2C1_REF				99
+#define DBG_LPD					100
+#define TIMESTAMP_REF				101
+#define DBG_TSTMP				102
+#define CPM_TOPSW_REF				103
+#define USB3_DUAL_REF				104
+#define OUTCLK_MAX				105
+#define REF_CLK					106
+#define PL_ALT_REF_CLK				107
+#define MUXED_IRO				108
+#define PL_EXT					109
+#define PL_LB					110
+#define MIO_50_OR_51				111
+#define MIO_24_OR_25				112
+
+#endif
-- 
2.7.4

