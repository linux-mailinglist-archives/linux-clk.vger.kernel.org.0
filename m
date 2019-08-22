Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1A5199CC8
	for <lists+linux-clk@lfdr.de>; Thu, 22 Aug 2019 19:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392563AbfHVRg6 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 22 Aug 2019 13:36:58 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37599 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404298AbfHVRYm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Aug 2019 13:24:42 -0400
Received: by mail-pg1-f194.google.com with SMTP id d1so4049341pgp.4
        for <linux-clk@vger.kernel.org>; Thu, 22 Aug 2019 10:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=MF3rEeHYTUUv66jVOAxgim3ss6TORCYiUQPquvwjq/w=;
        b=T9ASLZ5H74R8EU3DNbNPmIhAyCpFblFUW358Ua0N6C7yqOpNGuiNzAsJYkCUeO7nRP
         rHGVPRqBC44PjSsFCVQnOQXOehBDh4tH5gwlPTBab4mK0uz3FBobBeUH/JAkt5rf9Gdk
         kcgjpC1QmqDSpll1BIIr+bXpTVQxLwJ+2lOu+jI8kdf4AULzH7GFRIUbQHB9mJQ+VVDP
         Dl3lwHnVuvseHJlOePUKuh95yuihDeaqoS9QOKCHvXOAm5E1HIxaOH15jKFCj4neDd9c
         lj64achj6Q3F+xMUqPrkExrblamN3MX4s92m9ky46WzHfGtbfdA9EDVi6kZ1fQsUgbQr
         fEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=MF3rEeHYTUUv66jVOAxgim3ss6TORCYiUQPquvwjq/w=;
        b=T8doAXO8m3laj6m1BZ+dCF0gCBtyTL9c9Aq7krBzajU6vTZaCSQ2Xh1HHixb8UJAAh
         CD9HaUaVf+6sjDtkfJsFvq3C3G9AGuv5uxx72eOQ7h/Tzpu1JEqx3n7lMqaBesWFslu0
         jTia4flnkr/j2u2sC/T2IUuvPh0FSKY3OJFJk5KzLuqOof24LFd8bWzEWs2etosqTqri
         AsMy6XUx4CEUDyufWN7xdOnp7yAJ2e2Th+AsmW2ftFpns4KXfAzXg8rQ+M3mf3T6koUM
         tJe507NPq2y6abF75oDqsOs27wYD+7eAlUQMJ7pW+SbjFFrtRORhsJSauoycOZ9rAV2/
         rq6w==
X-Gm-Message-State: APjAAAXyOv1nW4oB5Ib93mQHTZZNsKmFIsf/C83pDM0PxPOcAm9HqWZm
        0b5pdk7TRVCA/PKBITZTbeF0
X-Google-Smtp-Source: APXvYqx7kYtYjdmxnhOrl1gFD7IsOVakbGUR1RKgLNPTbutbHQR9wpV3+h7cJenEiWUeTrvSKOZxWA==
X-Received: by 2002:a65:6406:: with SMTP id a6mr256662pgv.393.1566494681681;
        Thu, 22 Aug 2019 10:24:41 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:71cc:5738:24ad:193e:4b59:8a76])
        by smtp.gmail.com with ESMTPSA id r12sm31705798pgb.73.2019.08.22.10.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2019 10:24:40 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        haitao.suo@bitmain.com, darren.tsao@bitmain.com,
        fisher.cheng@bitmain.com, alec.lin@bitmain.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 0/8] Add Bitmain BM1880 clock driver
Date:   Thu, 22 Aug 2019 22:54:18 +0530
Message-Id: <20190822172426.25879-1-manivannan.sadhasivam@linaro.org>
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

Changes in v4:

* Fixed devicetree binding issue
* Added ARCH_BITMAIN as the default for the clk driver

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

 .../bindings/clock/bitmain,bm1880-clk.yaml    |  74 ++
 MAINTAINERS                                   |   2 +
 .../boot/dts/bitmain/bm1880-sophon-edge.dts   |   9 -
 arch/arm64/boot/dts/bitmain/bm1880.dtsi       |  28 +
 drivers/clk/Kconfig                           |   7 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-bm1880.c                      | 966 ++++++++++++++++++
 drivers/clk/clk-composite.c                   |  13 +-
 drivers/clk/clk-divider.c                     |   2 +-
 drivers/clk/clk-fixed-rate.c                  |   2 +-
 drivers/clk/clk-gate.c                        |   2 +-
 drivers/clk/clk-mux.c                         |   2 +-
 drivers/clk/clk.c                             |   8 +
 include/dt-bindings/clock/bm1880-clock.h      |  82 ++
 14 files changed, 1184 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/bitmain,bm1880-clk.yaml
 create mode 100644 drivers/clk/clk-bm1880.c
 create mode 100644 include/dt-bindings/clock/bm1880-clock.h

-- 
2.17.1

