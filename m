Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62EA6FE2B5
	for <lists+linux-clk@lfdr.de>; Fri, 15 Nov 2019 17:29:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727552AbfKOQ3N (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 15 Nov 2019 11:29:13 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43090 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727543AbfKOQ3M (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Nov 2019 11:29:12 -0500
Received: by mail-pl1-f193.google.com with SMTP id a18so4986963plm.10
        for <linux-clk@vger.kernel.org>; Fri, 15 Nov 2019 08:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=3XT/nLG3xpNr361wlgEfm3508OHRkJv7ggspM9qj6fM=;
        b=tj5frAAfuA+MTShJ5+0l80OMXjtbw082FDfq/rA8bY1A3dWturu5e1zJmLDWbnvrXJ
         iGSNJqubAcqELVVZo2SfEw2GnW4MVCEZP5t8bjMdRr3tEgEfyyybafB+MSiK+aRVINq7
         cgR60rt2GtCGEt/ffaVAEExBI5o0ce/+pVQ0q2dd6q6G/gWkBt9cfQHLlsHMC6Oqkq1F
         i5r7gP0+yfqLVsI4ssLVVB/9JN4HQ/Kn93r2pNfCeftl4gWIOIxkyo6y/YU04dpu6j7l
         hICTbb4ORXJF2tZs879Y5IjGD62IZkpDfYhHyTJ1822+CR4O+6xpPmRMpisnAEuK/Mmw
         GXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=3XT/nLG3xpNr361wlgEfm3508OHRkJv7ggspM9qj6fM=;
        b=fDM4UFU9w5qIBDUbc1gtXZS0rSzbM2hWZE/Xb4jMAJKKYy6EHZ0pSn/08bpW3eU4SR
         B/u9DyhvEdWZA9g7+cQG5Ybhl0GYupFzQxfWA6muAlO2m32mFdgYY1r+hDIL7JBJOmJj
         VA1N80lNbbtZgOxjZGq6C+l1TXMSPSJtc4YYSXu5wbvArNlWL4A3XIfhTKXxLb6YBMef
         Ec2XOPkNaVnteSnyPtlYFHAqX6xpuOZiE/ZOHJXKU3+wHYAjMMVojoDedWCBRLQ5Wr7x
         bGqlc8qxG/RxPKUoq2WZloUGpVBYmLNvvA1YkO8rmrijUX3gkS36e16ogrukH94rylV/
         KKxA==
X-Gm-Message-State: APjAAAVIDHCgIpvKY3IUsruEIhGOhX9085IM/VM0cwjLaewUDOc29JM2
        I1wjtqF/qUJUDeFPjumgQrX+
X-Google-Smtp-Source: APXvYqwimP7JI1pnz9yCWsM+bKNEZAPTI0UZ1+a3yXspAKR7FXS9hRU58T4IQjJ/o7Dc92EJdHGhbA==
X-Received: by 2002:a17:902:744b:: with SMTP id e11mr15625825plt.208.1573835351821;
        Fri, 15 Nov 2019 08:29:11 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6183:6d55:8418:2bbc:e6d8:2b4])
        by smtp.gmail.com with ESMTPSA id y24sm12295288pfr.116.2019.11.15.08.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 08:29:11 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        haitao.suo@bitmain.com, darren.tsao@bitmain.com,
        fisher.cheng@bitmain.com, alec.lin@bitmain.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v7 0/7] Add Bitmain BM1880 clock driver
Date:   Fri, 15 Nov 2019 21:58:54 +0530
Message-Id: <20191115162901.17456-1-manivannan.sadhasivam@linaro.org>
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

Changes in v7:

* Fixed the do_div() issue detected by kbuild test bot

Changes in v6:

* Dropped 'clk: Warn if clk_init_data is not zero initialized' patch
* Added fixes tag to the patch adding 'clk_hw_unregister_composite'
  definition
* Reworked the use of CLK_IS_CTITICAL flag from clk driver
* Removed the use of CLK_DIVIDER_HIWORD_MASK flag from driver
* Some misc cleanups to the driver
* Added Rob's reviewed tag for the binding

Changes in v5:

* Incorporated review comments from Rob on dt binding

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

Manivannan Sadhasivam (7):
  clk: Zero init clk_init_data in helpers
  clk: Add clk_hw_unregister_composite helper function definition
  dt-bindings: clock: Add devicetree binding for BM1880 SoC
  arm64: dts: bitmain: Add clock controller support for BM1880 SoC
  arm64: dts: bitmain: Source common clock for UART controllers
  clk: Add common clock driver for BM1880 SoC
  MAINTAINERS: Add entry for BM1880 SoC clock driver

 .../bindings/clock/bitmain,bm1880-clk.yaml    |  76 ++
 MAINTAINERS                                   |   2 +
 .../boot/dts/bitmain/bm1880-sophon-edge.dts   |   9 -
 arch/arm64/boot/dts/bitmain/bm1880.dtsi       |  28 +
 drivers/clk/Kconfig                           |   7 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-bm1880.c                      | 969 ++++++++++++++++++
 drivers/clk/clk-composite.c                   |  13 +-
 drivers/clk/clk-divider.c                     |   2 +-
 drivers/clk/clk-fixed-rate.c                  |   2 +-
 drivers/clk/clk-gate.c                        |   2 +-
 drivers/clk/clk-mux.c                         |   2 +-
 include/dt-bindings/clock/bm1880-clock.h      |  82 ++
 13 files changed, 1181 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/bitmain,bm1880-clk.yaml
 create mode 100644 drivers/clk/clk-bm1880.c
 create mode 100644 include/dt-bindings/clock/bm1880-clock.h

-- 
2.17.1

