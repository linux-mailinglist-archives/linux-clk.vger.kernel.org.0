Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D3EB78C87
	for <lists+linux-clk@lfdr.de>; Mon, 29 Jul 2019 15:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728555AbfG2NRC (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 29 Jul 2019 09:17:02 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36448 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726173AbfG2NRB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 29 Jul 2019 09:17:01 -0400
Received: by mail-wm1-f67.google.com with SMTP id g67so49337418wme.1
        for <linux-clk@vger.kernel.org>; Mon, 29 Jul 2019 06:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oynpEq+Rva8XBfHeYWHdmuSsXuLqJ4yySPhy6VhqL9A=;
        b=va/m4r4dkyOP1H7msYfzDxN4+0vxPlSoe+oUQ4l/rirf0OhntUYksvZZwImE3yEz0T
         oBaLe8s00sw6YpMAmKbDDfMJ3mCl28yLI59Ef6CiNZUUKGfhFf+NDo5mic6oiM20KxKR
         8e2iXUVWGg/5SBAy23v8YvJvjir1BgTnUhFoiSVojDGfS2Uv0NQw5UX04REnvkVV5RsO
         0/xJ5HncMOscX99UEea1qAz6NyeqODccTnEm/p0TXkddx0FI8A9rkhv5U4Sx3hcD6Mpn
         SkQhDKIsiBKPMOhr/4Bm1s4lGW8Pr24oT4yPFoPKpTRnPfszLYYMnc4VIcdgJtC2qpZJ
         K8tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oynpEq+Rva8XBfHeYWHdmuSsXuLqJ4yySPhy6VhqL9A=;
        b=Drz+yuXG8O06aSd7kZssfDxAwtD6Kg0MINdk1zZVyyji56QrRNks2kJ/aI4gB0y223
         P4SugOYxKbNXHcmaJEPCU7IQBoD/ebwB0tOfDlSJLtpxWImlSoSdgjEd1tri+kN9wVnP
         1hXmbBvio6EJusHeAzh9y0cD/DZMWQjef5fV3ULYkifR3Q/S0KQX78FUQkJMAvX+LPXj
         3Ai12EXplfu9j2r9hWV8glaml2vXWCzumCr3X2ND/yKTA66uN/VM5KiaTW7YTlqypMRU
         FQ47VDA9nnJNiGlKG6j/4vWuHlQ9mgI5K0PuB3vz2Ei8iUKSlNBrgbOcq7pu+tcrk+sm
         ECAw==
X-Gm-Message-State: APjAAAXc6xADdWT+RUDhT38OK7m7xZNedLg00fZWO3Tx0dsnbf5cZ13z
        rmrwnVx67Ui1airqoE6EqLpa3A==
X-Google-Smtp-Source: APXvYqytSS4CaOtshhSxLAUA/SqcXHfZnGVeXdez8xfDM0v0eOvC2DS2WChVjk847i77QN6BlJ/9OA==
X-Received: by 2002:a7b:c954:: with SMTP id i20mr18655712wml.169.1564406219328;
        Mon, 29 Jul 2019 06:16:59 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id b5sm52520490wru.69.2019.07.29.06.16.58
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 29 Jul 2019 06:16:58 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     sboyd@kernel.org, jbrunet@baylibre.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/4] clk: meson: g12a: add support for DVFS
Date:   Mon, 29 Jul 2019 15:16:52 +0200
Message-Id: <20190729131656.7308-1-narmstrong@baylibre.com>
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

Neil Armstrong (4):
  clk: core: introduce clk_hw_set_parent()
  clk: meson: regmap: export regmap_div ops functions
  clk: meson: g12a: add notifiers to handle cpu clock change
  clk: meson: g12a: expose CPUB clock ID for G12B

 drivers/clk/clk.c                     |   6 +
 drivers/clk/meson/clk-regmap.c        |  10 +-
 drivers/clk/meson/clk-regmap.h        |   5 +
 drivers/clk/meson/g12a.c              | 567 +++++++++++++++++++++++---
 include/dt-bindings/clock/g12a-clkc.h |   1 +
 include/linux/clk-provider.h          |   1 +
 6 files changed, 540 insertions(+), 50 deletions(-)

-- 
2.22.0

