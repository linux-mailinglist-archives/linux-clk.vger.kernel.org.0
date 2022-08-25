Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB7FE5A10EC
	for <lists+linux-clk@lfdr.de>; Thu, 25 Aug 2022 14:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240817AbiHYMqi (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 25 Aug 2022 08:46:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234338AbiHYMqh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Aug 2022 08:46:37 -0400
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8577884ED4;
        Thu, 25 Aug 2022 05:46:36 -0700 (PDT)
Received: from hq-00021.holoplot.net (unknown [176.126.217.202])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 5C8904210DB;
        Thu, 25 Aug 2022 12:39:37 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH 1/2] dt-bindings: clock: cs2000-cp: Document cirrus,pll-lock-timeout-msec
Date:   Thu, 25 Aug 2022 14:39:23 +0200
Message-Id: <20220825123924.2284276-1-daniel@zonque.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This property can be used to set the maximum time to wait for the PLL to
lock.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 .../devicetree/bindings/clock/cirrus,cs2000-cp.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
index 0abd6ba82dfd..9eed1868dc6e 100644
--- a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
+++ b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
@@ -62,6 +62,12 @@ properties:
       output signal directly from the REF_CLK input.
     $ref: /schemas/types.yaml#/definitions/flag
 
+  cirrus,pll-lock-timeout-msec:
+    description:
+      Describes the maximum time to wait for the PLL to lock, in milliseconds.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 50
+
 required:
   - compatible
   - reg
-- 
2.37.2

