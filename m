Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD47F58A305
	for <lists+linux-clk@lfdr.de>; Fri,  5 Aug 2022 00:06:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239733AbiHDWGX (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 4 Aug 2022 18:06:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231321AbiHDWGV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 Aug 2022 18:06:21 -0400
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-eopbgr130047.outbound.protection.outlook.com [40.107.13.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBA9F2613B;
        Thu,  4 Aug 2022 15:06:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SDFpV9RkF/1BBXF/P6QUZU2Nr0fnr3wnbZbSpl5t75buO0s/6JFBtPEcE5ynkTG2F8UnkSB7QRS+hMgmgMTHmP7rfp1vHjpn1Is9g/HtqXcqV6Qgpj7cGTEUgaD+uSEA9cjVXIzf76FIzCgetmTwjfY5AvBbeQafXYyZViNBerC3w1VPNdMDoxu0RnVidVSbzJmKRy0KHCje4kDEHynPF4HaM0c1rJj0z19vL0S4hzCsnnmERVppmXM7pZzACxL85WT7ekIvsXQfwQqQdtpyWBBvX1WSomI2bv8s+WRGnmgF48OoxqWmbtkd/2IWoSPIce+n0VmvaUHeOebpW7H9Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5V8YwPFUT0Hv/rr/nNMiPSzkLn61sIkHDsoocy1Wvw=;
 b=XoLTu+ELZ+VB3J6md4bLy5mlr13E2lA6LOa1/UKh+GUwH6AmaMCoydpNI/1+4bnzOUxJEJrFFTOeXRrrF/lyovlGRrja1cUyUyNeiPLsMGZHXBN+jm5ElZ8tUIfgMq9U5s8GYOosBlWlbntRLhET/Wyf5/JkxMWKsfhbUS7z8TpMJ3JPVBh7zZeHF15TnCUTm6a1D374/psFrJbEae5MSrtM30xHQyzVQ7pt21aRUNOmYCxxaBh0ky/PjbilCzLPYB3XKEeVUSd4E+rIu494KQugfsgeemUx6LUXqmA956wG9QzVceLhS3VgpOFczOebKgjX0Y82aLDvhl2o1Y+7vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5V8YwPFUT0Hv/rr/nNMiPSzkLn61sIkHDsoocy1Wvw=;
 b=M7n8/WchlCHlD/rccRKYhw+r9PlWVXRyvD1xPDW4QlE7JKHF6AXgZqavAj6lyOW3+2OUsKyS0Tt58VXf30CnNK87X3XBDfpwBmX0cYiY5Fbx4p9/P+WeiyOOPIY93ZuFMtxMq9lwLCwWZVHLE1yP6sZnnfs5Fyq7WwdJ6F1AlcdEHzX89fJs6d5oMWJNkO0azRd2nQ11lSe3bNghoIy8W71jjhwXAJjH0CeYJAvHaz1oXAf5qT14B8uZwcIpkV0Iw9SWbePXM3uEeiZ6TRvy2UnOhObOGC3a1N6DZzPqF/rseYjvMABx8I+BNLM3ZwMLNmfnWU/Y5UuatfBIZCMUyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by AS8PR03MB8419.eurprd03.prod.outlook.com (2603:10a6:20b:527::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Thu, 4 Aug
 2022 22:06:16 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2%4]) with mapi id 15.20.5504.014; Thu, 4 Aug 2022
 22:06:16 +0000
From:   Sean Anderson <sean.anderson@seco.com>
To:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-phy@lists.infradead.org
Cc:     devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>,
        Camelia Alexandra Groza <camelia.groza@nxp.com>,
        linuxppc-dev@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sean Anderson <sean.anderson@seco.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: [PATCH v4 2/8] dt-bindings: phy: Add Lynx 10G phy binding
Date:   Thu,  4 Aug 2022 18:05:56 -0400
Message-Id: <20220804220602.477589-3-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20220804220602.477589-1-sean.anderson@seco.com>
References: <20220804220602.477589-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0097.namprd03.prod.outlook.com
 (2603:10b6:208:32a::12) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 510fb894-2f4f-4e8b-7b23-08da76658d46
X-MS-TrafficTypeDiagnostic: AS8PR03MB8419:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CpxenYhtIYoSyyD7phxvBZJsmbajgo8KNW8M/baq6WkW/pg2CGK7ZWbPJcaX/gqA/EJ10VwVUhM1647+KUldrCvVyVpVBU4OMaNJsHe/OwdRDVrqDtQQafBDD/x2ZRakYp6koOmVlqn0q731cKrQMtr54gVCX8LDm4B03M8PTDSrJyo8c3EHH9Aye5sNA3EtERx7fVzxtkyic2gSff+kMY8/llebLjjZus8P4fZAbn8M/At1CLrvCk5Vp86FarkSQwn05mbS+LZenNuIDL9bFIPutiDFvpLdt4T0+yuDdPUdaavCYB+ZUW7WBFOKQdEHk7+40IOcaGGGH+3vnX4vY3a3hFB86QWbf7n2WNydPdY+qJevbb31F6tMKezqqZwHGhph6QuVa2az+ccE0X9h969/94jI/CCisWFOCKiPJgrmwRvzBwzjwFugfTBzdsVWfaxfm8VBl75xkDPhBuUv7cjN0nrEPGVPebjR+zFe74YCXIeY2CxWVAfusW5w5erbo9MQFtvwb/86w5JpRNOnJKoJ4s/8dAI+kIDulKLc1DGF9X4gpfT31P+8NG0nLK63lCK02B6/LMpeZb6Gs/c4AqLZNrPAnV4kAXot2DqAYM+6Az8H4RouYev9i+ca9or+ViN2q92Cd2wne5xPz2mIj4zIReOEHn+eKXzPKEPMmGXbNvmz8IHqRzByjfroiw05JI4q1qq7bctrroOwmJBlgVGKn1YeCpdUlAkyJVdYSVOOpKUXpJsp8BDayufXB/mLDTvJC6wHPD2+2CuRc8k4dbECFHDSEz6+0k14BSa4YYgeGNTIABnoAgQr9TagG6grTj29mx0F4dLAC1/88lMj2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(376002)(136003)(39850400004)(346002)(6486002)(36756003)(110136005)(5660300002)(316002)(66556008)(54906003)(66476007)(4326008)(8676002)(66946007)(966005)(38350700002)(1076003)(6512007)(86362001)(2616005)(478600001)(186003)(83380400001)(8936002)(6666004)(38100700002)(41300700001)(7416002)(44832011)(6506007)(52116002)(2906002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LVdlRHKzmbS6gLjv28iU7YjoCTM8B4KBNoCMSBfz1EBk4bLVw4gMr/nHlGTa?=
 =?us-ascii?Q?7njOa6Bj1QjN5f1I0o+4i6iRZ0165iwwmF+lcP+rqoRitMK2ub1MeXw/Ile+?=
 =?us-ascii?Q?LW37z5mupi5DKDG/JAEMzp7iAzt8pBc+SWbppSGV/3Zr7mw9zH0yNLMRpMeq?=
 =?us-ascii?Q?0bzR2v0y8/M75EtDcVCe8LQeM5ktdI3a2E2vXeD5V9ERnQzYZVi8r+aKgTDu?=
 =?us-ascii?Q?X+ZDB+xbJcXxg7B2tjapqOb8SKuhe0EqDXbkTHeLlvuCeLkbX/XGfA1nwDds?=
 =?us-ascii?Q?2xM9lu6Nqk/B7Zrh5u1STw6ji8FP1nFZ8c+vu7N+7dxGAgmnWkRa1M8JV8dI?=
 =?us-ascii?Q?aeXnLHYwFdsc6g3e2tQedwLoMp+kZ/nV7FJnZ1A9s6jbBqgbaDOpOm5bGCIh?=
 =?us-ascii?Q?a6keFbVWLVqdPfVpbcU+FPLv2s9xjaSk9UPKlJxAgv0Zd3qF8+ffoVKp5G2K?=
 =?us-ascii?Q?amkDRCvr7VRvlscYYiEPxDz1u3GLuXU8GawDfnaiP+2zfT2LpIlbvqRndcVV?=
 =?us-ascii?Q?FKBP8J+VJURaTGp4j8+aAldFo29fgQzuHrSLmyo7ixu6A+1fEXkCWfp97xru?=
 =?us-ascii?Q?YrHdOeHnF085ZyaNVVg4lCwJOPAfaasOyyBF0lrE6C/ax4n1mUXKuXQFP0ul?=
 =?us-ascii?Q?XogHmklISrLB5YSOIuD/CNs+CyPcu1ZnPQ8GGSnQs++YrOstfSQkP4k5M1tp?=
 =?us-ascii?Q?JR1bzh/UXsYdf9R1q4tR5xtSezzuxoAuBmsOuJPxGRBQzmP/aBReIz833cbZ?=
 =?us-ascii?Q?0O4iqc+95/y5R4y2YB4UNuavoJF12sG5NNSzccCx89Uy8U32GzVISLiOsYm9?=
 =?us-ascii?Q?7xZ8CAn6fKzbudMThnxwQdoTf9RjhyQqSWYpg56ZJDr+wRT1wd6QlJVtyLX1?=
 =?us-ascii?Q?Pf5pDWT5F8+E1Vpx+KzbHE61DNy4jdBIPEE4D41B/Y2eo5760mUbh0YHLAsJ?=
 =?us-ascii?Q?ZRQ5ziQOAq3dRF7DlgFJRUId6vxA41h63JD26WcPsc2flUAISOeHIHEJw0TQ?=
 =?us-ascii?Q?t2/eFDFLiFc/7VG4MUAc3GJpiA6IVxr9YuuKRKgVR2XrpHm3SAVn9TLocpP6?=
 =?us-ascii?Q?zwBqKA7rliHGgYxVx+0x5YT44smKGkGfCFmJRKsyESD8n3sfiJ058roA1uJh?=
 =?us-ascii?Q?5kThDH6OLa0b2zmgYsYtCsrM6ArH8p5MLUnLYJ0uCE8636NgUzfnFuvC0xj5?=
 =?us-ascii?Q?rWJtnqof9Kr17izKlMmTJwmbzwtUApXwLLa3dB63leqHibvUFEBNZ7U8EZ6l?=
 =?us-ascii?Q?9UIMS+wgP4JajS90dHiLOP4qKCQfl6wNFb0h+diLHhU1bRLtAUJeHLDYHSyk?=
 =?us-ascii?Q?4UKH7rj/SbjuZBec7JyCSxFrcxNkMS5aN1U4s0QtcUream0KPvkZxptrypxa?=
 =?us-ascii?Q?zAdt/APqR9pMBl1AsRzPTrCYazLIsDO1tPvJq+gTqAypcoQspGE9SOobM+4J?=
 =?us-ascii?Q?x0ypZS2UtOgWY/mhUfORbzk4DKZXduBcvE2WTl7/no3PTD6ZFerwY0V7ECCP?=
 =?us-ascii?Q?11YPZQUZdslaVvJyqRWiHV9gDGz4G5/cJkyhJmB9G51BQUIIn8smOmgbtHSa?=
 =?us-ascii?Q?MsR/KEDIitnF+RDNZpYdzN7w0B0pswRGSlXGx73TDW0PAjoG4HjESmYdX+QK?=
 =?us-ascii?Q?vw=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 510fb894-2f4f-4e8b-7b23-08da76658d46
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 22:06:16.1264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Lc8pGEMNMNd5twVGyKWhXoLF6v3JBKFVXBrrnqfKrYQf7MTwbQZqO5ag2DRQ2xC90fcvVIKcxz6eHbwVUrW0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8419
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This adds a binding for the SerDes module found on QorIQ processors.
Each phy is a subnode of the top-level device, possibly supporting
multiple lanes and protocols. This "thick" #phy-cells is used due to
allow for better organization of parameters. Note that the particular
parameters necessary to select a protocol-controller/lane combination
vary across different SoCs, and even within different SerDes on the same
SoC.

The driver is designed to be able to completely reconfigure lanes at
runtime. Generally, the phy consumer can select the appropriate
protocol using set_mode.

There are two PLLs, each of which can be used as the master clock for
each lane. Each PLL has its own reference. For the moment they are
required, because it simplifies the driver implementation. Absent
reference clocks can be modeled by a fixed-clock with a rate of 0.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

Changes in v4:
- Use subnodes to describe lane configuration, instead of describing
  PCCRs. This is the same style used by phy-cadence-sierra et al.

Changes in v3:
- Manually expand yaml references
- Add mode configuration to device tree

Changes in v2:
- Rename to fsl,lynx-10g.yaml
- Refer to the device in the documentation, rather than the binding
- Move compatible first
- Document phy cells in the description
- Allow a value of 1 for phy-cells. This allows for compatibility with
  the similar (but according to Ioana Ciornei different enough) lynx-28g
  binding.
- Remove minItems
- Use list for clock-names
- Fix example binding having too many cells in regs
- Add #clock-cells. This will allow using assigned-clocks* to configure
  the PLLs.
- Document the structure of the compatible strings

 .../devicetree/bindings/phy/fsl,lynx-10g.yaml | 236 ++++++++++++++++++
 1 file changed, 236 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml

diff --git a/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
new file mode 100644
index 000000000000..59417e6172d7
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
@@ -0,0 +1,236 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/fsl,lynx-10g.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP Lynx 10G SerDes
+
+maintainers:
+  - Sean Anderson <sean.anderson@seco.com>
+
+description: |
+  These Lynx "SerDes" devices are found in NXP's QorIQ line of processors. The
+  SerDes provides up to eight lanes. Each lane may be configured individually,
+  or may be combined with adjacent lanes for a multi-lane protocol. The SerDes
+  supports a variety of protocols, including up to 10G Ethernet, PCIe, SATA, and
+  others. The specific protocols supported for each lane depend on the
+  particular SoC.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - fsl,ls1046a-serdes
+          - fsl,ls1088a-serdes
+      - const: fsl,lynx-10g
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  "#clock-cells":
+    const: 1
+    description: |
+      The cell contains an ID as described in dt-bindings/clock/fsl,lynx-10g.h.
+      Note that when assigning a rate to a PLL, the PLL's rate is divided by
+      1000 to avoid overflow. A rate of 5000000 corresponds to 5GHz.
+
+  clocks:
+    maxItems: 2
+    description: |
+      Clock for each PLL reference clock input.
+
+  clock-names:
+    minItems: 2
+    maxItems: 2
+    items:
+      enum:
+        - ref0
+        - ref1
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  '^phy@':
+    type: object
+
+    description: |
+      A contiguous group of lanes which will be configured together. Each group
+      corresponds to one phy device. Lanes not described by any group will be
+      left as-is.
+
+    properties:
+      "#phy-cells":
+        const: 0
+
+      reg:
+        minItems: 1
+        maxItems: 8
+        description:
+          The lanes in the group. These must be listed in order. The first lane
+          will have the FIRST_LANE bit set in GCR0. The order of lanes also
+          determines the reset order (TRSTDIR).
+
+    patternProperties:
+      '^(q?sgmii|xfi)':
+        type: object
+
+        description: |
+          A protocol controller which may control the group of lanes. Each
+          controller is selected through the PCCRs. In addition to protocols
+          desired for use by the OS, protocols which may have been configured
+          by the bootloader must also be described. This ensures that only one
+          protocol controller is attached to a group of lanes at once.
+
+        properties:
+          fsl,pccr:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: |
+              The index of the PCCR which configures this protocol controller.
+              This is the same as the register name suffix. For example, PCCR8
+              would use a value of 8 for an offset of 0x220 (0x200 + 4 * 8).
+
+          fsl,index:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: |
+              The index of the protocol controller. This corresponds to the
+              suffix in the documentation. For example, PEXa would be 0, PEXb
+              1, etc. Generally, higher fields occupy lower bits.
+
+          fsl,cfg:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 1
+            description: |
+              The configuration value to program into the protocol controller
+              field.
+
+          fsl,type:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum:
+              - 8 # PHY_TYPE_SGMII
+              - 9 # PHY_TYPE_QSGMII
+              - 12 # PHY_TYPE_2500BASEX
+              - 13 # PHY_TYPE_10GBASER
+            description: |
+              The category of protocols supported by this controller. See
+              "dt-bindings/phy/phy.h" for the relevant definitions. Individual
+              protocols are selected by the phy consumer. The availability of
+              1000BASE-KX and 10GBASE-KR depends on the SoC.
+
+              - PHY_TYPE_SGMII: 1000BASE-X, SGMII, and 1000BASE-KX
+              - PHY_TYPE_2500BASEX: 2500BASE-X, 1000BASE-X, SGMII, and
+                                    1000BASE-KX
+              - PHY_TYPE_QSGMII: QSGMII
+              - PHY_TYPE_10GBASER: 10GBASE-R and 10GBASE-KR
+
+        required:
+          - fsl,pccr
+          - fsl,index
+          - fsl,cfg
+          - fsl,type
+
+        additionalProperties: false
+
+    required:
+      - "#phy-cells"
+      - reg
+
+    additionalProperties: false
+
+required:
+  - "#address-cells"
+  - "#clock-cells"
+  - "#size-cells"
+  - compatible
+  - clocks
+  - clock-names
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/phy/phy.h>
+
+    serdes1: serdes@1ea0000 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      #clock-cells = <1>;
+      compatible = "fsl,ls1046a-serdes", "fsl,lynx-10g";
+      reg = <0x1ea0000 0x2000>;
+      clocks = <&clk_100mhz>, <&clk_156mhz>;
+      clock-names = "ref0", "ref1";
+
+      serdes1_0: phy@0 {
+        #phy-cells = <0>;
+        reg = <0>;
+
+        /* SGMII.6 */
+        sgmii-0 {
+          fsl,pccr = <0x8>;
+          fsl,index = <0>;
+          fsl,cfg = <0x1>;
+          fsl,type = <PHY_TYPE_SGMII>;
+        };
+      };
+
+      serdes1_1: phy@1 {
+        #phy-cells = <0>;
+        reg = <1>;
+
+        /* SGMII.5 */
+        sgmii-1 {
+          fsl,pccr = <0x8>;
+          fsl,index = <1>;
+          fsl,cfg = <0x1>;
+          fsl,type = <PHY_TYPE_2500BASEX>;
+        };
+      };
+
+      serdes1_2: phy@2 {
+        #phy-cells = <0>;
+        reg = <2>;
+
+        /* SGMII.10 */
+        sgmii-2 {
+          fsl,pccr = <0x8>;
+          fsl,index = <2>;
+          fsl,cfg = <0x1>;
+          fsl,type = <PHY_TYPE_2500BASEX>;
+        };
+
+        /* XFI.10 */
+        xfi-0 {
+          fsl,pccr = <0xb>;
+          fsl,index = <0>;
+          fsl,cfg = <0x2>;
+          fsl,type = <PHY_TYPE_10GBASER>;
+        };
+      };
+
+      serdes1_3: phy@3 {
+        #phy-cells = <0>;
+        reg = <3>;
+
+        /* SGMII.9 */
+        sgmii-3 {
+          fsl,pccr = <0x8>;
+          fsl,index = <3>;
+          fsl,cfg = <0x1>;
+          fsl,type = <PHY_TYPE_2500BASEX>;
+        };
+
+        /* XGI.9 */
+        xfi-9 {
+          fsl,pccr = <0xb>;
+          fsl,index = <1>;
+          fsl,cfg = <0x1>;
+          fsl,type = <PHY_TYPE_10GBASER>;
+        };
+      };
+    };
+...
-- 
2.35.1.1320.gc452695387.dirty

