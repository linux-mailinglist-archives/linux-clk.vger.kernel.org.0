Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E3F3493742
	for <lists+linux-clk@lfdr.de>; Wed, 19 Jan 2022 10:29:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353089AbiASJ2s (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 19 Jan 2022 04:28:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352766AbiASJ2r (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Jan 2022 04:28:47 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07F30C06173E
        for <linux-clk@vger.kernel.org>; Wed, 19 Jan 2022 01:28:47 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id i8-20020a17090a138800b001b3936fb375so5824916pja.1
        for <linux-clk@vger.kernel.org>; Wed, 19 Jan 2022 01:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xYaHkfldf5uPCSUjnhPt95Y5AOgvL7MhuAVKFyO9WEo=;
        b=OTdKJak1FstRf5XNWu2Zq++mjOF6p3G5dnhOMDp7RxYJNjsgkUkThbfiUANBPfz4ll
         VJIzg/Cg/RUDMeZ7+VOqxVYgpyMY2zvdEpfLLj3nexZmRt74SYzzvbDnSA9TagJfe2Ej
         JbahF9nEWUT8EFZ7xDjSmLo9i3vQjPtA6sthRtQIDN4PRmv5DhGOv3C72HmPMAcXkIZQ
         jxOOoEonJjCYQXyQIy8COMnLDzd8kD05t3iglE4c8TUXdyucPo57fbD0SKMwU6GIsOo1
         aA8yLB5EBcbfpW1sZZiF72uJeQXVXddrUObiSgY6drodLgQ8hxteuBtFJUr1zMuo/t52
         nZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xYaHkfldf5uPCSUjnhPt95Y5AOgvL7MhuAVKFyO9WEo=;
        b=Uck5VQMsYKuFqdo/x2ei42tMeVrUSawtU5XXcemPX4+GlcGT5NEECyZ+vigS576NZy
         tQh5SmiPTgS10wGwpGQiSTBbHe66JgV2UW29Z/69+8ZnZV/MKjuiYX5YhaLkell2l3UV
         1f/o6914MyuTWELSM6Z8i01U7/TpIMG2hhgfz0a6FNJG9nHDf6u02x3qnrplUqincg2s
         UgTuUijoarMUdxlwn3S8XBy32h0u8csTxwnvH2byANrBtDozwPyckclZgxZemkdpaqEM
         SNJ9Y8ZXj/21pg3yViq+c3t9X0J9LQ2fEyt9E4NYieWs8Bl/23EePJxUgnWexoEQJb+Q
         nzSw==
X-Gm-Message-State: AOAM533rgvJObe16kQeBTy5JCgbViHAurckpwvG3s7ncSbKUO9mNygm4
        zn2l6fbS1X94nWA479FLetqxkQ==
X-Google-Smtp-Source: ABdhPJzsxtRCTepH1juuMMGcQnZffvU8vYhmzkIPrcY8DDRbnCRTHcZeVOEhrIIu4iJbV01YYewpwg==
X-Received: by 2002:a17:902:e80f:b0:14a:43d9:c91 with SMTP id u15-20020a170902e80f00b0014a43d90c91mr31950005plg.160.1642584526507;
        Wed, 19 Jan 2022 01:28:46 -0800 (PST)
Received: from hsinchu16.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id y8sm1415894pfl.207.2022.01.19.01.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 01:28:45 -0800 (PST)
From:   Zong Li <zong.li@sifive.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, palmer@dabbelt.com,
        paul.walmsley@sifive.com, lee.jones@linaro.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Zong Li <zong.li@sifive.com>
Subject: [PATCH 0/4] Refactor the PRCI driver to reduce the complexity
Date:   Wed, 19 Jan 2022 17:28:37 +0800
Message-Id: <cover.1642582832.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch set tries to improve the PRCI driver to reduce the
complexity, we remove the SoCs C files by putting putting all stuff in
each SoCs header file, and include these SoCs-specific header files in
core of PRCI. It can also avoid the W=1 kernel build warnings about
variable defined but not used [-Wunused-const-variable=], like 'commit
487dc7bb6a0c ("clk: sifive:fu540-prci: Declare static const variable
'prci_clk_fu540' where it's used")' does.

This patch set also contains the dt-bindings and dts change, because
we change the macro name for fu540 and fu740 by adding the prefix
respectively.

Thanks all for your review and suggestions.

Zong Li (4):
  dt-bindings: change the macro name of prci in header files and example
  riscv: dts: Change the macro name of prci in each device node
  clk: sifive: Add SoCs prefix in each SoCs-dependent data
  clk: sifive: Move all stuff into SoCs header files from C files

 .../devicetree/bindings/gpio/sifive,gpio.yaml |   2 +-
 .../bindings/pci/sifive,fu740-pcie.yaml       |   2 +-
 .../bindings/serial/sifive-serial.yaml        |   2 +-
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi    |  22 +--
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi    |  26 ++--
 drivers/clk/sifive/Makefile                   |   2 +-
 drivers/clk/sifive/fu540-prci.c               |  89 ------------
 drivers/clk/sifive/fu540-prci.h               |  91 +++++++++++-
 drivers/clk/sifive/fu740-prci.c               | 134 ------------------
 drivers/clk/sifive/fu740-prci.h               | 130 ++++++++++++++++-
 drivers/clk/sifive/sifive-prci.c              |   5 -
 include/dt-bindings/clock/sifive-fu540-prci.h |   8 +-
 include/dt-bindings/clock/sifive-fu740-prci.h |  18 +--
 13 files changed, 254 insertions(+), 277 deletions(-)
 delete mode 100644 drivers/clk/sifive/fu540-prci.c
 delete mode 100644 drivers/clk/sifive/fu740-prci.c

-- 
2.31.1

