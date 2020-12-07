Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 701C42D09E2
	for <lists+linux-clk@lfdr.de>; Mon,  7 Dec 2020 05:56:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728332AbgLGE4l (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 6 Dec 2020 23:56:41 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:8958 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726483AbgLGE4l (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 6 Dec 2020 23:56:41 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Cq9x40kGpzhnZk;
        Mon,  7 Dec 2020 12:55:36 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.9) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Mon, 7 Dec 2020 12:55:50 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "Pengutronix Kernel Team" <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "NXP Linux Team" <linux-imx@nxp.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] dt-bindings: clock: imx8qxp-lpcg: eliminate yamllint warnings
Date:   Mon, 7 Dec 2020 12:55:27 +0800
Message-ID: <20201207045527.1607-2-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20201207045527.1607-1-thunder.leizhen@huawei.com>
References: <20201207045527.1607-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.177.9]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Eliminate the following yamllint warnings:
./Documentation/devicetree/bindings/clock/imx8qxp-lpcg.yaml
:32:13:[warning] wrong indentation: expected 14 but found 12 (indentation)
:35:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 .../devicetree/bindings/clock/imx8qxp-lpcg.yaml      | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.yaml b/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.yaml
index e709e530e17a27a..940486ef1051d10 100644
--- a/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.yaml
@@ -29,18 +29,18 @@ properties:
       - const: fsl,imx8qxp-lpcg
       - items:
           - enum:
-            - fsl,imx8qm-lpcg
+              - fsl,imx8qm-lpcg
           - const: fsl,imx8qxp-lpcg
       - enum:
-        - fsl,imx8qxp-lpcg-adma
-        - fsl,imx8qxp-lpcg-conn
-        - fsl,imx8qxp-lpcg-dc
-        - fsl,imx8qxp-lpcg-dsp
-        - fsl,imx8qxp-lpcg-gpu
-        - fsl,imx8qxp-lpcg-hsio
-        - fsl,imx8qxp-lpcg-img
-        - fsl,imx8qxp-lpcg-lsio
-        - fsl,imx8qxp-lpcg-vpu
+          - fsl,imx8qxp-lpcg-adma
+          - fsl,imx8qxp-lpcg-conn
+          - fsl,imx8qxp-lpcg-dc
+          - fsl,imx8qxp-lpcg-dsp
+          - fsl,imx8qxp-lpcg-gpu
+          - fsl,imx8qxp-lpcg-hsio
+          - fsl,imx8qxp-lpcg-img
+          - fsl,imx8qxp-lpcg-lsio
+          - fsl,imx8qxp-lpcg-vpu
         deprecated: true
   reg:
     maxItems: 1
-- 
1.8.3


