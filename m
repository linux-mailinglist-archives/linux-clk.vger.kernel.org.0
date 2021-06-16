Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 805FB3A8D89
	for <lists+linux-clk@lfdr.de>; Wed, 16 Jun 2021 02:37:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231143AbhFPAj4 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 15 Jun 2021 20:39:56 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:48909 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230265AbhFPAj4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Jun 2021 20:39:56 -0400
X-UUID: a646cc1d7fcb4883877e66c97ae05315-20210616
X-UUID: a646cc1d7fcb4883877e66c97ae05315-20210616
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <chun-jie.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1459602376; Wed, 16 Jun 2021 08:37:47 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 08:37:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Jun 2021 08:37:46 +0800
From:   Chun-Jie Chen <chun-jie.chen@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>
Subject: [PATCH v10 01/19] dt-bindings: ARM: Mediatek: Add new document bindings of MT8192 clock
Date:   Wed, 16 Jun 2021 08:36:25 +0800
Message-ID: <20210616003643.28648-2-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210616003643.28648-1-chun-jie.chen@mediatek.com>
References: <20210616003643.28648-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch adds the new binding documentation for system clock
and functional clock on Mediatek MT8192.

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
---
 .../arm/mediatek/mediatek,mt8192-clock.yaml   | 216 ++++++++++++++++++
 .../mediatek/mediatek,mt8192-sys-clock.yaml   |  66 ++++++
 2 files changed, 282 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
new file mode 100644
index 000000000000..ce02c22c5d08
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
@@ -0,0 +1,216 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt8192-clock.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediaTek Functional Clock Controller for MT8192
+
+maintainers:
+  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
+
+description:
+  The Mediatek functional clock controller provides various clocks on MT8192.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - mediatek,mt8192-scp_adsp
+              - mediatek,mt8192-imp_iic_wrap_c
+              - mediatek,mt8192-audsys
+              - mediatek,mt8192-imp_iic_wrap_e
+              - mediatek,mt8192-imp_iic_wrap_s
+              - mediatek,mt8192-imp_iic_wrap_ws
+              - mediatek,mt8192-imp_iic_wrap_w
+              - mediatek,mt8192-imp_iic_wrap_n
+              - mediatek,mt8192-msdc_top
+              - mediatek,mt8192-msdc
+              - mediatek,mt8192-mfgcfg
+              - mediatek,mt8192-mmsys
+              - mediatek,mt8192-imgsys
+              - mediatek,mt8192-imgsys2
+              - mediatek,mt8192-vdecsys_soc
+              - mediatek,mt8192-vdecsys
+              - mediatek,mt8192-vencsys
+              - mediatek,mt8192-camsys
+              - mediatek,mt8192-camsys_rawa
+              - mediatek,mt8192-camsys_rawb
+              - mediatek,mt8192-camsys_rawc
+              - mediatek,mt8192-ipesys
+              - mediatek,mt8192-mdpsys
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    scp_adsp: clock-controller@10720000 {
+        compatible = "mediatek,mt8192-scp_adsp";
+        reg = <0x10720000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    imp_iic_wrap_c: clock-controller@11007000 {
+        compatible = "mediatek,mt8192-imp_iic_wrap_c";
+        reg = <0x11007000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    audsys: clock-controller@11210000 {
+        compatible = "mediatek,mt8192-audsys";
+        reg = <0x11210000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    imp_iic_wrap_e: clock-controller@11cb1000 {
+        compatible = "mediatek,mt8192-imp_iic_wrap_e";
+        reg = <0x11cb1000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    imp_iic_wrap_s: clock-controller@11d03000 {
+        compatible = "mediatek,mt8192-imp_iic_wrap_s";
+        reg = <0x11d03000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    imp_iic_wrap_ws: clock-controller@11d23000 {
+        compatible = "mediatek,mt8192-imp_iic_wrap_ws";
+        reg = <0x11d23000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    imp_iic_wrap_w: clock-controller@11e01000 {
+        compatible = "mediatek,mt8192-imp_iic_wrap_w";
+        reg = <0x11e01000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    imp_iic_wrap_n: clock-controller@11f02000 {
+        compatible = "mediatek,mt8192-imp_iic_wrap_n";
+        reg = <0x11f02000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    msdc_top: clock-controller@11f10000 {
+        compatible = "mediatek,mt8192-msdc_top";
+        reg = <0x11f10000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    msdc: clock-controller@11f60000 {
+        compatible = "mediatek,mt8192-msdc";
+        reg = <0x11f60000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    mfgcfg: clock-controller@13fbf000 {
+        compatible = "mediatek,mt8192-mfgcfg";
+        reg = <0x13fbf000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    mmsys: clock-controller@14000000 {
+        compatible = "mediatek,mt8192-mmsys";
+        reg = <0x14000000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    imgsys: clock-controller@15020000 {
+        compatible = "mediatek,mt8192-imgsys";
+        reg = <0x15020000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    imgsys2: clock-controller@15820000 {
+        compatible = "mediatek,mt8192-imgsys2";
+        reg = <0x15820000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    vdecsys_soc: clock-controller@1600f000 {
+        compatible = "mediatek,mt8192-vdecsys_soc";
+        reg = <0x1600f000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    vdecsys: clock-controller@1602f000 {
+        compatible = "mediatek,mt8192-vdecsys";
+        reg = <0x1602f000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    vencsys: clock-controller@17000000 {
+        compatible = "mediatek,mt8192-vencsys";
+        reg = <0x17000000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    camsys: clock-controller@1a000000 {
+        compatible = "mediatek,mt8192-camsys";
+        reg = <0x1a000000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    camsys_rawa: clock-controller@1a04f000 {
+        compatible = "mediatek,mt8192-camsys_rawa";
+        reg = <0x1a04f000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    camsys_rawb: clock-controller@1a06f000 {
+        compatible = "mediatek,mt8192-camsys_rawb";
+        reg = <0x1a06f000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    camsys_rawc: clock-controller@1a08f000 {
+        compatible = "mediatek,mt8192-camsys_rawc";
+        reg = <0x1a08f000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    ipesys: clock-controller@1b000000 {
+        compatible = "mediatek,mt8192-ipesys";
+        reg = <0x1b000000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    mdpsys: clock-controller@1f000000 {
+        compatible = "mediatek,mt8192-mdpsys";
+        reg = <0x1f000000 0x1000>;
+        #clock-cells = <1>;
+    };
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml
new file mode 100644
index 000000000000..ececce3a1507
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt8192-sys-clock.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediaTek System Clock Controller for MT8192
+
+maintainers:
+  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
+
+description:
+  The Mediatek system clock controller provides various clocks and system configuration
+  like reset and bus protection on MT8192.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - mediatek,mt8192-topckgen
+              - mediatek,mt8192-infracfg
+              - mediatek,mt8192-pericfg
+              - mediatek,mt8192-apmixedsys
+          - const: syscon
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    topckgen: syscon@10000000 {
+        compatible = "mediatek,mt8192-topckgen", "syscon";
+        reg = <0x10000000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    infracfg: syscon@10001000 {
+        compatible = "mediatek,mt8192-infracfg", "syscon";
+        reg = <0x10001000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    pericfg: syscon@10003000 {
+        compatible = "mediatek,mt8192-pericfg", "syscon";
+        reg = <0x10003000 0x1000>;
+        #clock-cells = <1>;
+    };
+
+  - |
+    apmixedsys: syscon@1000c000 {
+        compatible = "mediatek,mt8192-apmixedsys", "syscon";
+        reg = <0x1000c000 0x1000>;
+        #clock-cells = <1>;
+    };
-- 
2.18.0

