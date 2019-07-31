Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11A1B7BBE6
	for <lists+linux-clk@lfdr.de>; Wed, 31 Jul 2019 10:40:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728178AbfGaIkZ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 31 Jul 2019 04:40:25 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42461 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728174AbfGaIkY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 31 Jul 2019 04:40:24 -0400
Received: by mail-wr1-f67.google.com with SMTP id x1so18782925wrr.9
        for <linux-clk@vger.kernel.org>; Wed, 31 Jul 2019 01:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ddHyvYdReNbGhKO21uVEIvjorbfyA05g6IvzqrFwjMw=;
        b=jFO4SD/NApA8ipcldRSPtR96lDawCCqLtYXq++TEknbVxxDnZL3JrR85VsU33TrR0Q
         sr6bkOPmj8k3cMMWIHyHo1kEl5r7ZFWAqMXMNfV/lDvgwulIf7nvctpQX9u+9Rb13PY0
         RZPyJ+ytGSRsViVrMFJ0X3Vexgi+QVC/pfzBwlYbXCKrIyOyjqPZko61A3XLprZUWpZB
         TM9sf75PWS3HJhkfPNNDCZP267DP7mKOF9E2vu09UiUP+zhYmUvhIGGDI7AM1bVuj7gk
         PcoSHXA4zEhPTmpxcj/RDgR9Ax7fmDC+fYU93RMl+O+5kIFSyeSDweCKMigFWdo4k82w
         yoHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ddHyvYdReNbGhKO21uVEIvjorbfyA05g6IvzqrFwjMw=;
        b=lHw85u9DEl+AA5Y0Fdm4ffEfwXmO7WLlY3bnnx2A0b0fhSgOuJpJR7jUswpk74wTPz
         lnt7EAU++0wIInM3O2uVieaV0L6bha/JhxFAsdEJWliebFjOmIbmHYLAilkK/pNwlJPy
         q9eKBAABG1zk1cIBjGBASPyyuRN0kSXxTpGGD4ptsaGrzOznnzGkDQuFZVXWQmYnYRNh
         rfzskl6E0f5KkSQPLDFFtYHag0BfATvBPLPCtvCh/9OGiZiRAdlTy8Q+Ii9FUaaGbZl6
         fmZ0Jq25xkzJbW/n36FTj9CBWufG9cZY7AO771qlQwObOQMrZm9pUFyYS8Q8k8hcvsvi
         lRNQ==
X-Gm-Message-State: APjAAAWY/bfsV/ygSjOLViDF9ph/z9zpMKVM0wg15XDsZOpStoXUbNR+
        RLWetnjvdOht7zJT2FG6QyNlhA==
X-Google-Smtp-Source: APXvYqwHQz/DoxpqjB2gG7yElbPFxVQmLqhP/9pw+D/cpuZHA0yH1P4HyL+uxk4zqqNoXxyZE1dsUA==
X-Received: by 2002:a5d:4d81:: with SMTP id b1mr52426973wru.27.1564562422857;
        Wed, 31 Jul 2019 01:40:22 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id 18sm56049308wmg.43.2019.07.31.01.40.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 01:40:22 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     sboyd@kernel.org, jbrunet@baylibre.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/4] clk: meson: g12a: add support for DVFS
Date:   Wed, 31 Jul 2019 10:40:15 +0200
Message-Id: <20190731084019.8451-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The G12A/G12B Socs embeds a specific clock tree for each CPU cluster :
cpu_clk / cpub_clk
|   \- cpu_clk_dyn
|      |  \- cpu_clk_premux0
|      |        |- cpu_clk_postmux0
|      |        |    |- cpu_clk_dyn0_div
|      |        |    \- xtal/fclk_div2/fclk_div3
|      |        \- xtal/fclk_div2/fclk_div3
|      \- cpu_clk_premux1
|            |- cpu_clk_postmux1
|            |    |- cpu_clk_dyn1_div
|            |    \- xtal/fclk_div2/fclk_div3
|            \- xtal/fclk_div2/fclk_div3
\ sys_pll / sys1_pll

This patchset adds notifiers on cpu_clk / cpub_clk, cpu_clk_dyn,
cpu_clk_premux0 and sys_pll / sys1_pll to permit change frequency of
the CPU clock in a safe way as recommended by the vendor Documentation
and reference code.

This patchset :
- introduces needed core and meson clk changes
- adds the clock notifiers

Dependencies:
- None

This patchset is split from the v3 RFC/RFC patchset at [3]

Changes from v1 at [4]:
- Removed export of regmap_div ops functions
- Added standalone cpu dynamic divider driver
- Uses cpu dynamic divider driver in g12a clkc driver
- Added missing signed-off tags
- Fixed missing removal of CLKID_CPUB_CLK from internal g12a.h

Changes from RFT/RFC v3 at [3]:
- Rebased on clk-meson v5.4/drivers tree with Alexandre's patches
- Removed the eeclk setup() callback, moved to a toplevel g12a-data struct

Changes since RFT/RFC v2 at [2]:
- Rebased on clk-meson v5.3/drivers trees
- added Kevin's review tags

Changes since RFT/RFC v1 at [1]:
- Added EXPORT_SYMBOL_GPL() to clk_hw_set_parent
- Added missing static to g12b_cpub_clk_mux0_div_ops and g12a_cpu_clk_mux_nb
- Simplified g12a_cpu_clk_mux_notifier_cb() without switch/case
- Fixed typo in "this the current path" in g12a.c
- Fixed various checkpatch errors

[1] https://patchwork.kernel.org/cover/11006929/
[2] https://patchwork.kernel.org/cover/11017273/
[3] https://patchwork.kernel.org/cover/11025309/
[4] https://patchwork.kernel.org/cover/11063803/

Neil Armstrong (4):
  clk: core: introduce clk_hw_set_parent()
  clk: meson: add g12a cpu dynamic divider driver
  clk: meson: g12a: add notifiers to handle cpu clock change
  clk: meson: g12a: expose CPUB clock ID for G12B

 drivers/clk/clk.c                     |   6 +
 drivers/clk/meson/Kconfig             |   5 +
 drivers/clk/meson/Makefile            |   1 +
 drivers/clk/meson/clk-cpu-dyndiv.c    |  73 ++++
 drivers/clk/meson/clk-cpu-dyndiv.h    |  20 +
 drivers/clk/meson/g12a.c              | 535 +++++++++++++++++++++++---
 drivers/clk/meson/g12a.h              |   1 -
 include/dt-bindings/clock/g12a-clkc.h |   1 +
 include/linux/clk-provider.h          |   1 +
 9 files changed, 588 insertions(+), 55 deletions(-)
 create mode 100644 drivers/clk/meson/clk-cpu-dyndiv.c
 create mode 100644 drivers/clk/meson/clk-cpu-dyndiv.h

-- 
2.22.0

