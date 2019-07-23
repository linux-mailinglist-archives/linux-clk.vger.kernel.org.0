Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EFE3722D3
	for <lists+linux-clk@lfdr.de>; Wed, 24 Jul 2019 01:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbfGWXIr (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 23 Jul 2019 19:08:47 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:36834 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725554AbfGWXIr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 Jul 2019 19:08:47 -0400
Received: by mail-io1-f68.google.com with SMTP id o9so85572338iom.3;
        Tue, 23 Jul 2019 16:08:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HYo2fuuuneL5Fo4jEfaXQ1heuCdpTzyb5jPxys5e614=;
        b=XqrUQvJsO8a513YfCVItM3DPGoIq0nNeSWhSSyHpcgcM0DnRkPnSJdwNY/VOAPWv+2
         pVNW0br8EpuHQbksC+rANl14jitpRST2PW29udEeUs7teJfYqxLLsH51fU5+V4QaJLBw
         xcp77p3ibUEP+SYgJWpUoCpIEEr5xy1b9uUeOai07NFXS6AajVCsWz/E+hMYativ+mng
         ms/O2WwF0HZehpRe8jTF3Un8h3ZaFAqpL0GaynZeM0POCIegU7SSQL521qx++LyH4dl2
         B42jqOhlvwIZTQylxXvmVzkEjzAxabC0ewmXBiKHscCHnl3TRWfMBI6yUg+JV3mDZx2b
         mBAA==
X-Gm-Message-State: APjAAAUJat9UTR9X+I+DIsWO2W/hTKRNuPffuuJOnKU79PSsJdIe0scg
        nTdTOfZc4uO9gazdSjh9acJ4LHQ=
X-Google-Smtp-Source: APXvYqwlJV09K4RP12HY5SbNeA4DQYH2eq1IjJhUlDTm+CQ6P0v68r2Ic4RqfVM0mf7j+OEb3QNpiw==
X-Received: by 2002:a5e:8210:: with SMTP id l16mr47099097iom.240.1563923325720;
        Tue, 23 Jul 2019 16:08:45 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.254])
        by smtp.googlemail.com with ESMTPSA id b14sm48025590iod.33.2019.07.23.16.08.44
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 23 Jul 2019 16:08:44 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org
Subject: [PATCH] dt-bindings: clk: allwinner,sun4i-a10-ccu: Correct path in $id
Date:   Tue, 23 Jul 2019 17:08:43 -0600
Message-Id: <20190723230843.19922-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The path in the schema '$id' value is wrong. Fix it.

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: linux-clk@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
I can take this via the DT tree.

Rob

 .../devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
index c935405458fe..fa4d143a73de 100644
--- a/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
+++ b/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/phy/allwinner,sun4i-a10-ccu.yaml#
+$id: http://devicetree.org/schemas/clock/allwinner,sun4i-a10-ccu.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Allwinner Clock Control Unit Device Tree Bindings
-- 
2.20.1

