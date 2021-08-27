Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A3853F98AC
	for <lists+linux-clk@lfdr.de>; Fri, 27 Aug 2021 14:02:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245060AbhH0MDW (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 27 Aug 2021 08:03:22 -0400
Received: from mail.bugwerft.de ([46.23.86.59]:37080 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231191AbhH0MDW (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 27 Aug 2021 08:03:22 -0400
Received: from hq-00021.fritz.box (p57bc979a.dip0.t-ipconnect.de [87.188.151.154])
        by mail.bugwerft.de (Postfix) with ESMTPSA id E31AC327D07;
        Fri, 27 Aug 2021 11:54:26 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, kuninori.morimoto.gx@renesas.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH v4 3/9] dt-bindings: clock: cs2000-cp: document cirrus,clock-skip flag
Date:   Fri, 27 Aug 2021 13:54:14 +0200
Message-Id: <20210827115420.3052019-4-daniel@zonque.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210827115420.3052019-1-daniel@zonque.org>
References: <20210827115420.3052019-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 .../devicetree/bindings/clock/cirrus,cs2000-cp.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
index 79b90500f6ac..9047d8a24a08 100644
--- a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
+++ b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
@@ -48,6 +48,12 @@ properties:
       - 3 # CS2000CP_AUX_OUTPUT_PLL_LOCK: pll lock status
     default: 0
 
+  cirrus,clock-skip:
+    description:
+      This mode allows the PLL to maintain lock even when CLK_IN
+      has missing pulses for up to 20 ms.
+    $ref: /schemas/types.yaml#/definitions/flag
+
 required:
   - compatible
   - reg
-- 
2.31.1

