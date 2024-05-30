Return-Path: <linux-clk+bounces-7474-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C78EB8D4725
	for <lists+linux-clk@lfdr.de>; Thu, 30 May 2024 10:35:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13232B2224B
	for <lists+linux-clk@lfdr.de>; Thu, 30 May 2024 08:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11A4C1527BE;
	Thu, 30 May 2024 08:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eCjv9PPz"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E81815218D
	for <linux-clk@vger.kernel.org>; Thu, 30 May 2024 08:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717058126; cv=none; b=Rb/MRJZ7ELynSYgDa+B9X6Y/hc2WHidlTpCEuCGj513iSibRdq8x2ZC2LKtHHGV77abnChpGKQbphplEKy9xkvRk7OoEn1UPbr6qq6nkrOGt5yOFSpc+iS7G+t3rrqe+bQdjap2ztxumBmEb8n4tSsVpGKR3w2AcIjygXcRLMn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717058126; c=relaxed/simple;
	bh=x5EytMBOecORfel70Q1gecPB643ydiviHuoTOcu4sX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YCxAM0kjFLp6CjXq5lSLFAzQpU4Vyk75+pS/YD7RBMisf8jFJOWQRQW+/omnxKXetBEDEgXRu0oCKQc+w+s6H9p886gTSJsgZsvFySoFCXW+PBE8csT8bKMqasKzH9I8BZPxoODSRVDU1gjtrNnstnQA7Yn1Kw6/JIuktehaQfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eCjv9PPz; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1f4a52b94c3so5017805ad.3
        for <linux-clk@vger.kernel.org>; Thu, 30 May 2024 01:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717058124; x=1717662924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ojWQ0b2MWifneyP6SWllMlL0oJitBi3xbuigAJTyN5g=;
        b=eCjv9PPzuc4vWCcuzMq3CQ07RXwp7jDT4Nj2+g3Fh36uUINnFRuZ43LLd5EUR9LS2Q
         RbMARwcDSktA5lOVcl9WvJmMBBGJSZ/fegP3vzfXWIXAUK4CODEHR6t80DU5786kpE36
         KXqGOrOmX2b4pkNIw06IeeSbzsTQ5pvnr/sUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717058124; x=1717662924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ojWQ0b2MWifneyP6SWllMlL0oJitBi3xbuigAJTyN5g=;
        b=NRSHZQDnWmk8rkeqznJEyJxVGtAnBTAwgZuk2MrQJ6ft6khULlrg25UXGtpjVuqPza
         9bBcXCJl22f/tBcWTwmOZV2+5gC27JD/YlQNOZH2QZszCnjn3kKSUWLSIUuZ0L+N7mwt
         rWEBn4Hkiw6M62fpc89Gibvj8A8Omk43ohcR4bbOn89V6/M1Zo1qAN3d9WSmKnazyQmN
         SX8dlT04gGgmMO4B8c2VpPPQS7wSH0pnsdL7a9PlWoMk4y7UixN8Vviw1SQFjCFKRxzp
         nQTUpB3cWb/SVFBp4XSBE/25U5F0/gqwhNQNnWWNX39T1LVFUnWg9FjYsxNk/Bvd1dgT
         /JEg==
X-Forwarded-Encrypted: i=1; AJvYcCVdQjNZx/8Sr+Cr0SHJH3JAcu4YFYdnqrmP0uEQ3YU1SpeMU7W4W++CycFfhFWQjV2FWMsejR6bAq7b6NfiKX3T9VurJaelsPQs
X-Gm-Message-State: AOJu0YxHkVONhP5z8OovU9eydO1mOrxh2cOswZahgxPYSRjI+z1GbI3Z
	pwyITLBOA1nDj6gTQfvuhI8v1J/MLRiQdUcXRr6NkcYIFfF0zqqdDVpQYkZU2w==
X-Google-Smtp-Source: AGHT+IGtD/EP0lwVmYxNyzuz01IBLVY6csgHPTcXqWU5CemCG3sK1VS5I0qtjDvBKandh/VKDc1VCA==
X-Received: by 2002:a17:902:e810:b0:1e4:9c2f:d343 with SMTP id d9443c01a7336-1f6193fad6fmr15805455ad.7.1717058123772;
        Thu, 30 May 2024 01:35:23 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:65f0:63a9:90bb:50b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f617390fe7sm10950635ad.146.2024.05.30.01.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 01:35:23 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] dt-bindings: clock: mediatek: Add mt8173 mfgtop
Date: Thu, 30 May 2024 16:35:00 +0800
Message-ID: <20240530083513.4135052-2-wenst@chromium.org>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
In-Reply-To: <20240530083513.4135052-1-wenst@chromium.org>
References: <20240530083513.4135052-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MFG (GPU) block on the MT8173 has a small glue layer, named MFG_TOP
in the datasheet, that contains clock gates, some power sequence signal
delays, and other unknown registers that get toggled when the GPU is
powered on.

The clock gates are exposed as clocks provided by a clock controller,
while the power sequencing bits are exposed as one singular power domain.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../clock/mediatek,mt8173-mfgtop.yaml         | 71 +++++++++++++++++++
 include/dt-bindings/clock/mt8173-clk.h        |  7 ++
 2 files changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml
new file mode 100644
index 000000000000..03c3c1f8cf75
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/clock/mediatek,mt8173-mfgtop.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT8173 MFG TOP controller
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MFG TOP glue layer controls various signals going to the MFG (GPU)
+  block on the MT8173.
+
+properties:
+  compatible:
+    const: mediatek,mt8173-mfgtop
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 4
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: sys
+      - const: mem
+      - const: core
+      - const: clk26m
+
+  power-domains:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#power-domain-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+  - '#clock-cells'
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+        #include <dt-bindings/clock/mt8173-clk.h>
+        #include <dt-bindings/power/mt8173-power.h>
+
+        mfgtop: clock-controller@13fff000 {
+            compatible = "mediatek,mt8173-mfgtop";
+            reg = <0x13fff000 0x1000>;
+            clocks = <&topckgen CLK_TOP_AXI_MFG_IN_SEL>,
+                     <&topckgen CLK_TOP_MEM_MFG_IN_SEL>,
+                     <&topckgen CLK_TOP_MFG_SEL>,
+                     <&clk26m>;
+            clock-names = "sys", "mem", "core", "clk26m";
+            power-domains = <&spm MT8173_POWER_DOMAIN_MFG>;
+            #clock-cells = <1>;
+            #power-domain-cells = <0>;
+        };
diff --git a/include/dt-bindings/clock/mt8173-clk.h b/include/dt-bindings/clock/mt8173-clk.h
index 3d00c98b9654..89e982f771db 100644
--- a/include/dt-bindings/clock/mt8173-clk.h
+++ b/include/dt-bindings/clock/mt8173-clk.h
@@ -243,6 +243,13 @@
 #define CLK_IMG_FD			7
 #define CLK_IMG_NR_CLK			8
 
+/* MFG_SYS */
+
+#define CLK_MFG_AXI			0
+#define CLK_MFG_MEM			1
+#define CLK_MFG_G3D			2
+#define CLK_MFG_26M			3
+
 /* MM_SYS */
 
 #define CLK_MM_SMI_COMMON		1
-- 
2.45.1.288.g0e0cd299f1-goog


