Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA352C0D4
	for <lists+linux-clk@lfdr.de>; Tue, 28 May 2019 10:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbfE1IIF (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 28 May 2019 04:08:05 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51659 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbfE1IIF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 May 2019 04:08:05 -0400
Received: by mail-wm1-f65.google.com with SMTP id f10so1752059wmb.1
        for <linux-clk@vger.kernel.org>; Tue, 28 May 2019 01:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ieWxa3W4BA8q2H3D0T8EoXTx0zcolQkck6xLMl469g8=;
        b=fXMVIE25gFBZkltfmyi30Hdm7oNXRGCg36Ue8AqJIKTu7Br2JjltL2l6mx1/y9zSXq
         1DejqGZzDgEzZyrh+mASa0IfJnMPwCxnXK2yhf+1DD/jfIl0ZaZPNeobIIjpHbFtBjM9
         WAXIZQsvFdNREA+ApsFE5hFbklJhY0xqsYn8k9wwPCOo5divimvO5v5w8OPFAE+xqb+6
         mwcLS4ym6FxvQRYnVWJHcNrE2CbFvL4drdq/mdoRamgIX6KNQpc0lm22lWBlQ9i8C3vg
         CcdPHA187hf3LD7qFqVVPbDHqo0L/BOjomOsOzcMaL84toLnN+ckxsZ0JYhUyqhVJtBV
         1F+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ieWxa3W4BA8q2H3D0T8EoXTx0zcolQkck6xLMl469g8=;
        b=QPBoHViY+VP05fdvJnIn9TutoVdAvT7rnPEIAH/cLNAdEhH6sgqdwavxxE/9Wr2dQV
         0bi08oDfMbbWa33FkRDvbsyo1jPDNMml8/QU/s04W93eWy6EI6XNnDGV0CgoLyue4j3F
         VGaPBhOFup036bD2OFc+chzZj52KKpTgG5i/WOPu7lPz3BNc4c7XPUENuGnJIUu6eLF2
         tErQ1risBioiDLa7J3aE4SusAWez3RX8O1MA4MEeM9oGdYhANnJdQWAPUDI7yXOxKHqI
         Rx+hEwizL8s6Umiqw18UmwuUzVY3eLSh/AvzbyakeKRUHbr3+YEJehF6D26+OhAD6Zyl
         GDpg==
X-Gm-Message-State: APjAAAWNz5POSsXmVB3Wq90Kyr4WGClLnPj9ZekvhiSOGYqmc44zwas/
        o+bUYkMatapiwB56hbSE5u3s21TW1iIYoA==
X-Google-Smtp-Source: APXvYqyfEAM5t74+Aid/26YokQ5XGUc9ooC3hQavU+b4VuiimllFa2MwkUoKeGaKLZR6X11GoMK3tg==
X-Received: by 2002:a1c:f413:: with SMTP id z19mr2191165wma.145.1559030883029;
        Tue, 28 May 2019 01:08:03 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id z74sm2456121wmc.2.2019.05.28.01.08.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 28 May 2019 01:08:02 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] clk: meson: add support for Amlogic G12B
Date:   Tue, 28 May 2019 10:07:55 +0200
Message-Id: <20190528080758.17079-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Amlogic G12B SoC is very similar with the G12A SoC, sharing
most of the features and architecture.
G12B clock tree is very close, the main differences are :
- SYS_PLL is used for the second cluster (otherwise used fir the first on G12a)
- SYS_PLL1 is used for the first cluster (instead of SYS_PLL on G12a)
- A duplicate CPU tree is added for the second cluster
- G12B has additional clocks like for CSI an other components, not handled yet

Dependencies :
- Patch 1, 3 : None
- Patch 2 : Depends on Guillaume's Temperature sensor Clock patches at [1]

This patchset is a spinoff of the v2 Odroid-N2 megapatchset at [2]

Changes since v1 at [3]:
- Added the cpub_clk div2..8 and replaces the ahb/atb/axi/trace divs by muxes
- Added the CLK_GATE_SET_TO_DISABLE flag to ahb/atb/axi/trace gates
- Fixed all the G12A typos
- Added martin's reviewed by on patch 1

Changes since original patchset :
- Added missing sys1_pll div16, cpub div16 and cpub atb/axi/ahb/trace clocks
- Rewrote "This patch .." in commit messages

[1] https://lkml.kernel.org/r/20190412100221.26740-1-glaroque@baylibre.com
[2] https://lkml.kernel.org/r/20190423091503.10847-1-narmstrong@baylibre.com
[3] https://lkml.kernel.org/r/20190521150130.31684-1-narmstrong@baylibre.com

Neil Armstrong (3):
  dt-bindings: clk: meson: add g12b periph clock controller bindings
  clk: meson: g12a: Add support for G12B CPUB clocks
  clk: meson: g12a: mark fclk_div3 as critical

 .../bindings/clock/amlogic,gxbb-clkc.txt      |   1 +
 drivers/clk/meson/g12a.c                      | 772 ++++++++++++++++++
 drivers/clk/meson/g12a.h                      |  40 +-
 3 files changed, 812 insertions(+), 1 deletion(-)

-- 
2.21.0

