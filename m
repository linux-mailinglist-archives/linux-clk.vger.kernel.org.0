Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7B9944FA74
	for <lists+linux-clk@lfdr.de>; Sun, 14 Nov 2021 20:37:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236431AbhKNTjt (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 14 Nov 2021 14:39:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236286AbhKNTjQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 14 Nov 2021 14:39:16 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2371AC061766;
        Sun, 14 Nov 2021 11:36:21 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id br15so33785340lfb.9;
        Sun, 14 Nov 2021 11:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Nt2qbTsx4R5g/N/VYBhOrl2siDQQfrnptMwGepUXSgQ=;
        b=PY51TTFwH0m4HipJgbXsB6ZC3iVbAeFU7OTHuPPWs2KdRdQdJ9yxbm2hDqfTrs/vx2
         x9fn2xYmw1RCNX0CiHHNb6M6vO3FyySd4NJorkVJHwM5GyA0X3hj94cEwdK6I2PhTGQO
         KttOxQJLiXzdIpkIcSQzMG2jBLGzz5z2OUrRV5ApGDdoFlzQ7pkvuWFEEBRwpF2hN7Nz
         9mBtL2P2PmS46Vy6AwNo/o2zxAsQ0wuIUKxQZMYOUJlFBYlS6oTYB/5a55pJCKPfB+x4
         thfw8QxDpxgQwMEQSliDgzsYNUrG5TKKFypnKw97DLWkgXdKdkv5kyvfV6/QiQlO5ElE
         yxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Nt2qbTsx4R5g/N/VYBhOrl2siDQQfrnptMwGepUXSgQ=;
        b=q3fLh5IinUcZzV+E2Feg0JL6BpKdPgfMY2VrZ2bBqUXD2XszPewcG7M+FGiGqK7EPV
         EVYxyNvBUJx5BcV917hL3Bpbz6ejzhdOZmD8VbnJ+XRDYxgkB/wu6LcxyWIHK0x5ot6Q
         GV298NR1bcT4x/YW+PYcUJ3pj5N3qy66qWROvj+90CgGbVQ15QR+NfVqWPmYM3rEKQ7Q
         pKOTUwkcRH6v5i2iZpRUG6ztjoGtDFkaO8Xp8lZ904ojjxLfxAPfUPR3clu7zETrNvbZ
         CjcLEt2Zk4AJBqIT0L7zAGC35c0b6rlxFIoIY96KUYt2Dgh4xzIMk0GljBBMOKNpBQZB
         QZ4g==
X-Gm-Message-State: AOAM532q15wn0MJDwQC+zWKSinA1MKjdGZgVbqAYPlx4jLYK8a5l/dWu
        PP+EaOD9it+opaTMghgeuXs=
X-Google-Smtp-Source: ABdhPJyCn1mroR3QR162ws2gTrgQy+5DIqWT2a8A0Li8HEVrOthnlBlAF9Yt2RxFo3UELPlMvcm47g==
X-Received: by 2002:a05:6512:200e:: with SMTP id a14mr31017152lfb.370.1636918579528;
        Sun, 14 Nov 2021 11:36:19 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru. [46.138.46.211])
        by smtp.gmail.com with ESMTPSA id p18sm1191280lfu.127.2021.11.14.11.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 11:36:19 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Nishanth Menon <nm@ti.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-mmc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-clk@vger.kernel.org, David Heidelberg <david@ixit.cz>
Subject: [PATCH v15 24/39] media: dt: bindings: tegra-vde: Convert to schema
Date:   Sun, 14 Nov 2021 22:34:20 +0300
Message-Id: <20211114193435.7705-25-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114193435.7705-1-digetx@gmail.com>
References: <20211114193435.7705-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Convert NVIDIA Tegra video decoder binding to schema.

Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/media/nvidia,tegra-vde.txt       |  64 -----------
 .../bindings/media/nvidia,tegra-vde.yaml      | 107 ++++++++++++++++++
 2 files changed, 107 insertions(+), 64 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt
 create mode 100644 Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml

diff --git a/Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt b/Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt
deleted file mode 100644
index 602169b8aa19..000000000000
--- a/Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt
+++ /dev/null
@@ -1,64 +0,0 @@
-NVIDIA Tegra Video Decoder Engine
-
-Required properties:
-- compatible : Must contain one of the following values:
-   - "nvidia,tegra20-vde"
-   - "nvidia,tegra30-vde"
-   - "nvidia,tegra114-vde"
-   - "nvidia,tegra124-vde"
-   - "nvidia,tegra132-vde"
-- reg : Must contain an entry for each entry in reg-names.
-- reg-names : Must include the following entries:
-  - sxe
-  - bsev
-  - mbe
-  - ppe
-  - mce
-  - tfe
-  - ppb
-  - vdma
-  - frameid
-- iram : Must contain phandle to the mmio-sram device node that represents
-         IRAM region used by VDE.
-- interrupts : Must contain an entry for each entry in interrupt-names.
-- interrupt-names : Must include the following entries:
-  - sync-token
-  - bsev
-  - sxe
-- clocks : Must include the following entries:
-  - vde
-- resets : Must contain an entry for each entry in reset-names.
-- reset-names : Should include the following entries:
-  - vde
-
-Optional properties:
-- resets : Must contain an entry for each entry in reset-names.
-- reset-names : Must include the following entries:
-  - mc
-- iommus: Must contain phandle to the IOMMU device node.
-
-Example:
-
-video-codec@6001a000 {
-	compatible = "nvidia,tegra20-vde";
-	reg = <0x6001a000 0x1000 /* Syntax Engine */
-	       0x6001b000 0x1000 /* Video Bitstream Engine */
-	       0x6001c000  0x100 /* Macroblock Engine */
-	       0x6001c200  0x100 /* Post-processing Engine */
-	       0x6001c400  0x100 /* Motion Compensation Engine */
-	       0x6001c600  0x100 /* Transform Engine */
-	       0x6001c800  0x100 /* Pixel prediction block */
-	       0x6001ca00  0x100 /* Video DMA */
-	       0x6001d800  0x300 /* Video frame controls */>;
-	reg-names = "sxe", "bsev", "mbe", "ppe", "mce",
-		    "tfe", "ppb", "vdma", "frameid";
-	iram = <&vde_pool>; /* IRAM region */
-	interrupts = <GIC_SPI  9 IRQ_TYPE_LEVEL_HIGH>, /* Sync token interrupt */
-		     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>, /* BSE-V interrupt */
-		     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>; /* SXE interrupt */
-	interrupt-names = "sync-token", "bsev", "sxe";
-	clocks = <&tegra_car TEGRA20_CLK_VDE>;
-	reset-names = "vde", "mc";
-	resets = <&tegra_car 61>, <&mc TEGRA20_MC_RESET_VDE>;
-	iommus = <&mc TEGRA_SWGROUP_VDE>;
-};
diff --git a/Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml b/Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml
new file mode 100644
index 000000000000..c143aaa06346
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/nvidia,tegra-vde.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra Video Decoder Engine
+
+maintainers:
+  - Dmitry Osipenko <digetx@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+  - Thierry Reding <thierry.reding@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - nvidia,tegra132-vde
+              - nvidia,tegra124-vde
+              - nvidia,tegra114-vde
+      - items:
+          - const: nvidia,tegra30-vde
+          - const: nvidia,tegra20-vde
+      - items:
+          - const: nvidia,tegra20-vde
+
+  reg:
+    maxItems: 9
+
+  reg-names:
+    items:
+      - const: sxe
+      - const: bsev
+      - const: mbe
+      - const: ppe
+      - const: mce
+      - const: tfe
+      - const: ppb
+      - const: vdma
+      - const: frameid
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: vde
+      - const: mc
+
+  interrupts:
+    maxItems: 3
+
+  interrupt-names:
+    items:
+      - const: sync-token
+      - const: bsev
+      - const: sxe
+
+  iommus:
+    maxItems: 1
+
+  iram:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle of the SRAM MMIO node.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - resets
+  - reset-names
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    video-codec@6001a000 {
+      compatible = "nvidia,tegra20-vde";
+      reg = <0x6001a000 0x1000>, /* Syntax Engine */
+            <0x6001b000 0x1000>, /* Video Bitstream Engine */
+            <0x6001c000  0x100>, /* Macroblock Engine */
+            <0x6001c200  0x100>, /* Post-processing Engine */
+            <0x6001c400  0x100>, /* Motion Compensation Engine */
+            <0x6001c600  0x100>, /* Transform Engine */
+            <0x6001c800  0x100>, /* Pixel prediction block */
+            <0x6001ca00  0x100>, /* Video DMA */
+            <0x6001d800  0x300>; /* Video frame controls */
+      reg-names = "sxe", "bsev", "mbe", "ppe", "mce",
+                  "tfe", "ppb", "vdma", "frameid";
+      iram = <&iram>; /* IRAM MMIO region */
+      interrupts = <0  9 4>, /* Sync token */
+                   <0 10 4>, /* BSE-V */
+                   <0 12 4>; /* SXE */
+      interrupt-names = "sync-token", "bsev", "sxe";
+      clocks = <&clk 61>;
+      reset-names = "vde", "mc";
+      resets = <&rst 61>, <&mem 13>;
+      iommus = <&mem 15>;
+    };
-- 
2.33.1

