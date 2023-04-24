Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D45B66DDB60
	for <lists+linux-clk@lfdr.de>; Tue, 11 Apr 2023 14:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbjDKM7c (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 11 Apr 2023 08:59:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230073AbjDKM73 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Apr 2023 08:59:29 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3222A4C1F
        for <linux-clk@vger.kernel.org>; Tue, 11 Apr 2023 05:59:16 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id eo6-20020a05600c82c600b003ee5157346cso5973431wmb.1
        for <linux-clk@vger.kernel.org>; Tue, 11 Apr 2023 05:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1681217954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gVuMmsSUuik77Ijx/8EU9TNPivGbNCZ9khKZD4i9/BM=;
        b=ZNuwfNHT1p/L4mQ0ZKMicW8hWuIsz23tQW+92LtMGchp7cQfdHi55p/378Z65ZNORl
         5wA/raAbIQ+z7XxlNbE65524TZQE9Z7dvQO/hs7lHAunBYZlFFMxcS2O2WUpETnnO9UH
         oW7yjNgm8VW/3XEBEEriKW4GSpvJzu+VxGvT+I3t9yMlDKn7wOAKBanGiWijKhshS8yw
         du040ueDH5DdkeR1iCqcuXOtzN2i5OE/oNryHRwqzcCdi4dUNYJbF+lYwe8gZ7o9vZ50
         iL7ilCvX306s+8CeSaQxzTH4TfcmyD2iP70nIj51mqqbIIgk0FiCtKfiaVB/NeRc66HP
         RWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681217954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gVuMmsSUuik77Ijx/8EU9TNPivGbNCZ9khKZD4i9/BM=;
        b=rKFhwqdr6esEU8IQ5mA0kRUmyzdc6cRlHAYNKnb3EoazDW5x0WjG2yi8d5eoRLQ3+2
         jDqJn2ryEqjvEHoSQvaJ6AMtsDXj4UF7mlPStLdQCUncowfSvoC4XCKTtaGe+c5d2syb
         pyV6qXJaMc6y1zD8q/r1TymhYKrG+YcfhROIhqoPV/5p5cKwZtRk4z5yL8asU2uqC7kK
         UFfcDjOc/s74XPWgf4EJC6fpDA8TgrDh8vX0vyiXcWfbG04SYkkqNBv1R1eCalTQeUxB
         aTEi+Jt/8wSStggDjafuvKMIYOPhhfTgUqvR4oDnjvWvpxb0ATcf9EHgBex+h+H1koE8
         kmjw==
X-Gm-Message-State: AAQBX9fr4Q3/+TMWbS4ouXI+Zxlr6sl8i9FG81yBfBpfATNn88Xvv2OU
        z/LWYPPJ5AV0Ylu4xKqGzkg5xw==
X-Google-Smtp-Source: AKy350ZFwGmF0uWrr2tG/BrpiE90COQA60InF2b3iXCaBkZ98ODQnmuu5K1WHIogyJwqSY4ZJbpkTQ==
X-Received: by 2002:a7b:ca54:0:b0:3eb:39c3:8844 with SMTP id m20-20020a7bca54000000b003eb39c38844mr9829158wml.12.1681217954605;
        Tue, 11 Apr 2023 05:59:14 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a099:fc1d:c99a:bfc3])
        by smtp.gmail.com with ESMTPSA id e24-20020a05600c219800b003eae73f0fc1sm16944591wme.18.2023.04.11.05.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 05:59:14 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 0/7] arm64: dts: qcom: sa8775p: add more IOMMUs
Date:   Tue, 11 Apr 2023 14:59:03 +0200
Message-Id: <20230411125910.401075-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the GPU and PCIe IOMMUs for sa8775p platforms as well as the required
GPU clock controller driver.

NOTE: I didn't pick up Krzysztof's tag for patch 4/7 as the patch changed
significantly.

v2 -> v3:
- select QCOM_GDSC in Kconfig for the GPUCC module
- the GPU SMMU is actually an adreno SMMU so describe it as such and
  fix the DT
- fix the mapped memory size for the PCIe SMMU

v1 -> v2:
- remove unused include in the GPUCC driver
- remove unused clock from the GPUCC driver and make it compatible
  with the generic QCom GPUCC bindings
- put the new defconfig option in the right place (as per savedefconfig)
  and make the GPUCC driver a module rather than built-in
- describe the smmu clocks for sa8775p in dt-bindings

Bartosz Golaszewski (6):
  dt-bindings: clock: qcom: describe the GPUCC clock for SA8775P
  arm64: defconfig: enable the SA8775P GPUCC driver
  arm64: dts: qcom: sa8775p: add the pcie smmu node
  arm64: dts: qcom: sa8775p: add the GPU clock controller node
  dt-bindings: iommu: arm,smmu: enable clocks for sa8775p Adreno SMMU
  arm64: dts: qcom: sa8775p: add the GPU IOMMU node

Shazad Hussain (1):
  clk: qcom: add the GPUCC driver for sa8775p

 .../devicetree/bindings/clock/qcom,gpucc.yaml |   2 +
 .../devicetree/bindings/iommu/arm,smmu.yaml   |   6 +-
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 125 ++++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/clk/qcom/Kconfig                      |   9 +
 drivers/clk/qcom/Makefile                     |   1 +
 drivers/clk/qcom/gpucc-sa8775p.c              | 625 ++++++++++++++++++
 .../dt-bindings/clock/qcom,sa8775p-gpucc.h    |  50 ++
 8 files changed, 817 insertions(+), 2 deletions(-)
 create mode 100644 drivers/clk/qcom/gpucc-sa8775p.c
 create mode 100644 include/dt-bindings/clock/qcom,sa8775p-gpucc.h

-- 
2.37.2

