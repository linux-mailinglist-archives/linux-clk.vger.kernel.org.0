Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D7DF7869F1
	for <lists+linux-clk@lfdr.de>; Thu, 24 Aug 2023 10:25:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233825AbjHXIZR (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 24 Aug 2023 04:25:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232438AbjHXIZL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Aug 2023 04:25:11 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BA7E21711;
        Thu, 24 Aug 2023 01:25:08 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,195,1684767600"; 
   d="scan'208";a="173816674"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 24 Aug 2023 17:25:08 +0900
Received: from localhost.localdomain (unknown [10.226.93.115])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7E07F4010E05;
        Thu, 24 Aug 2023 17:25:04 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 0/4] Fix Versa3 clock mapping
Date:   Thu, 24 Aug 2023 09:24:57 +0100
Message-Id: <20230824082501.87429-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

According to Table 3. ("Output Source") in the 5P35023 datasheet,
the output clock mapping should be 0=REF, 1=SE1, 2=SE2, 3=SE3,
4=DIFF1, 5=DIFF2. But the code uses inverse.

This patch series aims to document clock-output-names in bindings and
fix the mapping in driver.

Also added a fix for 64 by 64 division.

v3->v4:
 * Dropped clock-output-names as there is no validation for it and people
   can get it wrong.
 * Updated commit header, description and example to reflect this change
 * Retained Ack tag from Conor and Krzysztof as it is trivial change.
 * Used clamped value for rate calculation in vc3_pll_round_rate().
v2->v3:
 * Dropped dts patch and added fix for 64 byte division to this patch
   series.
 * Added Rb tag from Geert for patch#3
 * Added a patch to make vc3_clk_mux enum values depend on vc3_clk enum
   values.
v1->v2:
 * Updated binding commit description to make it clear it fixes
   "assigned-clock-rates" in the example based on 5P35023 datasheet.

Biju Das (4):
  dt-bindings: clock: versaclock3: Fix the assigned-clock-rates
  clk: vc3: Fix 64 by 64 division
  clk: vc3: Fix output clock mapping
  clk: vc3: Make vc3_clk_mux enum values based on vc3_clk enum values

 .../bindings/clock/renesas,5p35023.yaml       |  8 +-
 drivers/clk/clk-versaclock3.c                 | 81 +++++++++----------
 2 files changed, 44 insertions(+), 45 deletions(-)

-- 
2.25.1

