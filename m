Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EE115A23D6
	for <lists+linux-clk@lfdr.de>; Fri, 26 Aug 2022 11:13:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245698AbiHZJLs (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 26 Aug 2022 05:11:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245710AbiHZJLj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Aug 2022 05:11:39 -0400
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0A28ECEB2C;
        Fri, 26 Aug 2022 02:11:35 -0700 (PDT)
Received: from hq-00021.fritz.box (p57bc9b74.dip0.t-ipconnect.de [87.188.155.116])
        by mail.bugwerft.de (Postfix) with ESMTPSA id B9BD528E698;
        Fri, 26 Aug 2022 09:11:33 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH v2 1/2] dt-bindings: clock: cs2000-cp: Document cirrus,pll-lock-timeout-ms
Date:   Fri, 26 Aug 2022 11:11:21 +0200
Message-Id: <20220826091122.2344503-1-daniel@zonque.org>
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
v1 -> v2: rename property to standard unit suffix, drop $ref, amend default value
 
.../devicetree/bindings/clock/cirrus,cs2000-cp.yaml          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
index 0abd6ba82dfd..8e68e1746d1c 100644
--- a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
+++ b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
@@ -62,6 +62,11 @@ properties:
       output signal directly from the REF_CLK input.
     $ref: /schemas/types.yaml#/definitions/flag
 
+  cirrus,pll-lock-timeout-ms:
+    description:
+      Specifies the maximum time to wait for the PLL to lock, in milliseconds.
+    default: 100
+
 required:
   - compatible
   - reg
-- 
2.37.2

