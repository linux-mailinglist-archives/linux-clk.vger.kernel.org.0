Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5266492412
	for <lists+linux-clk@lfdr.de>; Mon, 19 Aug 2019 15:02:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727524AbfHSNB7 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 19 Aug 2019 09:01:59 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40969 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727301AbfHSNB7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Aug 2019 09:01:59 -0400
Received: by mail-pf1-f194.google.com with SMTP id 196so1137374pfz.8
        for <linux-clk@vger.kernel.org>; Mon, 19 Aug 2019 06:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=ro8NKFkgruYUmO3tKNMvPEE1StisH9qvZFC7x6V6Dyo=;
        b=uhcA35N59KiYak0FvJjaWA0JqdakHYRgV6udX5bKaVu2FDZ/jyGdZf/xD07iEIzxPr
         Rek11IDX2I/K530tekaf8eUX26/KRrB2BxoSdpym84viDhBcmw5C7LwHhPGOLRLypYhZ
         mHOzkzjnk4RLJh1pJa4wDOaY/8kK6XMfeTzN0ymvzEsIkCj0GqCr+36J6S4izQ/qeB3g
         +H08Pv2/SBzDAJccPaJ7St511RS7JB1ZuPmjhHSy4BQUswfxndPWftka8HBiVjmUwq2k
         yzIL21ejhxM+sU0E6ss7bxhu7BGfcS3U2O6os7QSuIN2nCJsU6FdDWCZgmkkWP/WqSvE
         9tMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ro8NKFkgruYUmO3tKNMvPEE1StisH9qvZFC7x6V6Dyo=;
        b=atwbG1FkiSpkjqsIGGdio+zfUm/Vk/6E7dlqlAK4JNjNVje/hugSNQq9eIOU4czGJS
         K8McnRF8DL0SKbz/wj/8EPMOTt7EWPxTHzz4sYwWXxXz8bv8ng3EfSc5TwRZ6cbr0UqB
         tXgPCZt+qOp0kI079JcQtqhfGQGY6PEqFghR7nlvXIEBDPP3KApYRuQ87keBv0WPIuEH
         F+Teu5qeMUrQZYWVP4yP+hkCxBEIzKWApALg+qWpAAqNJkJb/Vka9/xl70+Jxkt/b2OE
         fTVxUPyvS/yEWJNqtZ7UrX8PovwCFnQNJVs63jBCilkDqdvPDdnsWZMlac4tDLovXNEv
         4Qlg==
X-Gm-Message-State: APjAAAUDMp9yqPI7cLeaOqJH2R94ZVSzzvvN/Iq8LhzljS9r6iAYr8hu
        Qbhlz01OejK6Q3OeBLRP1LE8
X-Google-Smtp-Source: APXvYqzsUBOFxMEmt52Se2k/zQQ92PZSTwH/Xijj4LZlyCnpj925m8T8I5xgjlepjNv5jH4kugl9Cw==
X-Received: by 2002:a63:5b52:: with SMTP id l18mr19716563pgm.21.1566219718474;
        Mon, 19 Aug 2019 06:01:58 -0700 (PDT)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id l123sm20626464pfl.9.2019.08.19.06.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 06:01:57 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        haitao.suo@bitmain.com, darren.tsao@bitmain.com,
        fisher.cheng@bitmain.com, alec.lin@bitmain.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 0/8] Add Bitmain BM1880 clock driver
Date:   Mon, 19 Aug 2019 18:31:35 +0530
Message-Id: <20190819130143.18778-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello,

This patchset adds common clock driver for Bitmain BM1880 SoC clock
controller. The clock controller consists of gate, divider, mux
and pll clocks with different compositions. Hence, the driver uses
composite clock structure in place where multiple clocking units are
combined together.

This patchset also removes UART fixed clock and sources clocks from clock
controller for Sophon Edge board where the driver has been validated.

Thanks,
Mani

Changes in v3:

* Switched to clk_hw_{register/unregister} APIs
* Returned clk_hw from the in-driver registration helpers

Changes in v2:

* Converted the dt binding to YAML
* Incorporated review comments from Stephen (majority of change is switching
  to new way of specifying clk parents)

Manivannan Sadhasivam (8):
  clk: Zero init clk_init_data in helpers
  clk: Warn if clk_init_data is not zero initialized
  clk: Add clk_hw_unregister_composite helper function definition
  dt-bindings: clock: Add devicetree binding for BM1880 SoC
  arm64: dts: bitmain: Add clock controller support for BM1880 SoC
  arm64: dts: bitmain: Source common clock for UART controllers
  clk: Add common clock driver for BM1880 SoC
  MAINTAINERS: Add entry for BM1880 SoC clock driver

 .../bindings/clock/bitmain,bm1880-clk.yaml    |  83 ++
 MAINTAINERS                                   |   2 +
 .../boot/dts/bitmain/bm1880-sophon-edge.dts   |   9 -
 arch/arm64/boot/dts/bitmain/bm1880.dtsi       |  28 +
 drivers/clk/Kconfig                           |   6 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-bm1880.c                      | 966 ++++++++++++++++++
 drivers/clk/clk-composite.c                   |  13 +-
 drivers/clk/clk-divider.c                     |   2 +-
 drivers/clk/clk-fixed-rate.c                  |   2 +-
 drivers/clk/clk-gate.c                        |   2 +-
 drivers/clk/clk-mux.c                         |   2 +-
 drivers/clk/clk.c                             |   8 +
 include/dt-bindings/clock/bm1880-clock.h      |  82 ++
 14 files changed, 1192 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/bitmain,bm1880-clk.yaml
 create mode 100644 drivers/clk/clk-bm1880.c
 create mode 100644 include/dt-bindings/clock/bm1880-clock.h

-- 
2.17.1

