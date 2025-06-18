Return-Path: <linux-clk+bounces-23163-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E17AEADEB9A
	for <lists+linux-clk@lfdr.de>; Wed, 18 Jun 2025 14:18:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 209F53ADB50
	for <lists+linux-clk@lfdr.de>; Wed, 18 Jun 2025 12:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACF392DBF62;
	Wed, 18 Jun 2025 12:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="g59TU6dB"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19CDF9CB
	for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 12:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248866; cv=none; b=boPM3Z/c8daKJdXa2AIG60K+s/VcewCk7wdhDGOE1Ewniel0zD7S3fnhFilrJfoQaRIANQGQvMmw+K7BjnUkKRVa7vdK8Td4r785RBVH996WxgItkABuGPhQyC4lVZNBk+ixaDmF/Zkg2Cs/LwoXwZ+30CjMzo3vgUWpOMH6fwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248866; c=relaxed/simple;
	bh=B3l9G9xHfhvz8EaPHO3ldfTP94vcz4sc4fSmpOQNlnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MdnPPgYpjwJWnRo8s94Z/7rKS5PRuGlopR7/wosr9eraNxy0z/TrD/Gn6G0clqhe7i3up2FMG2fF4UTSV06YPxpd1jhGH9yx2Oh/ERdaXyFmSJJgfIZUZwRteaI0P9CQhLqeGKXfA/2sbl959BErvH/xx3MSe8cOECZdblgznd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=g59TU6dB; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-747c2cc3419so5312154b3a.2
        for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 05:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750248864; x=1750853664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ziNNelNAtU8Lu0O2/2Qc6bW/trdK9/SPi3ZGrwyyiyE=;
        b=g59TU6dB9dhzahteCuj1KI+picjso2R/NBSVQ04Lh96YEjUfLr9MIXGxOU091RwnNU
         jCKjtlVvUlr8ULlw3csNhzSoH0ilb11dt0xdPW/AFQ/GsbvXY7nonalCjny35SUIK8Ws
         MRMyHnsIarnCZMN577VzTFqzat4ub+RFVkJ/8AYwrOS3koiJEGjF5G71rXMXW1lRVT3l
         RMwG3NAuxwbgCvL8at5OexPIhgS/YiHpPXWjQOZriYOZ/gyObWfs4+63ufTzHPhuD/IS
         zVsQLgo1SN60qG5q4NOKNHhf37W3IWn/Lr9uBgtUCTL4pmyOqO+izPhLC73kybO5ruuV
         9kuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248864; x=1750853664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ziNNelNAtU8Lu0O2/2Qc6bW/trdK9/SPi3ZGrwyyiyE=;
        b=brZMeQHzOQwgttM5tK9ce9BmbozRoiw+PZw/KebiDutsPkSgQt/nJRpXmD3n07OU+c
         jEWOR5AuI6owRHSQdaDGHhNjgt5izENMUENFTUCyIYvldQhZYeOVQKCpf1YEnNPhdDIM
         Hofl26O/lnfnOL8c9Xls6H/iwUZG4df+w8xIonsi2tSMFBOIB3fMz5Oyum5S3jCG6PUP
         Cgogn8PdeaB2eJ+oJitNaEMJKbUeARUm3YHsD9FKKyrC08kJI0sGgIvcw6F6fBAgD2o0
         qqGEsFIWqtFrEfUEjF38uAs9mgN/0/Psd6KqLasa9MUdRdPPZG/X8nmvFJDTnNUQtVxq
         v6cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjXMWgpSbOZHBC5FcOYe+Ds8GcOe2beVx6KiNbTDmoysz+14rETuZjdNfHbALDd65MinKnepjhnpU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTxQ7idsVB6sRkyE6sCvXQ3tADuUxGx2++5qfqCNuoHhJAokpD
	722nAKwHSRuDRMbZPVJwz9mPb8SMj9SMdgRvc83ig5gJshAxD4Dbz+xBUdGrL5xhgf4=
X-Gm-Gg: ASbGnct0My3HyUfPNaxuNKeCaX2hPx3jG4Kmnyl+HEfL426IE8HqLB1OjKUYBV2WBEH
	rMlgfQVyIJr9oeaXUgqaPGXe3dEjLxqPikF9/UpIoT6aY8oJol//vmfWabid5jXS8ftHWzpBQ0O
	AL9qiZYhajEZDT4LJF+11Bm5l9sVMZFKHIfVtM5SIRJsbT9xPv/zZmncbmOEgX98UZS2pBE6P43
	3zfJxdnKo5hx9Bek7QC6ZfZxgd12bRqhAmXu/45jG/X/jtqJUskeNQnK9dK09vQ73PnTLKyuNQO
	5m+XubG94E272MnJTRoRdsZNcEe8jBun4CRMGLwqHdUAVGSAY5YatiBAKWWoOboga6zfxYSpBuj
	a9wg61WkoBKsRljaMiQ==
X-Google-Smtp-Source: AGHT+IGXJCt45JA8Kk+8fi1w9C8bhM0wZ3jUDLtHZkAxqg9JTLBDj52rpbXs5JE5zyvxDRUbYLbnRw==
X-Received: by 2002:a05:6a21:6012:b0:203:becd:f9ce with SMTP id adf61e73a8af0-21fbd668ecbmr26172423637.39.1750248864090;
        Wed, 18 Jun 2025 05:14:24 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:14:23 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Len Brown <lenb@kernel.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 01/23] dt-bindings: mailbox: Add bindings for RPMI shared memory transport
Date: Wed, 18 Jun 2025 17:43:36 +0530
Message-ID: <20250618121358.503781-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618121358.503781-1-apatel@ventanamicro.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for the common RISC-V Platform Management
Interface (RPMI) shared memory transport as a mailbox controller.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../mailbox/riscv,rpmi-shmem-mbox.yaml        | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml b/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
new file mode 100644
index 000000000000..3aabc52a0c03
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/riscv,rpmi-shmem-mbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V Platform Management Interface (RPMI) shared memory mailbox
+
+maintainers:
+  - Anup Patel <anup@brainfault.org>
+
+description: |
+  The RISC-V Platform Management Interface (RPMI) [1] defines a common shared
+  memory based RPMI transport. This RPMI shared memory transport integrates as
+  mailbox controller in the SBI implementation or supervisor software whereas
+  each RPMI service group is mailbox client in the SBI implementation and
+  supervisor software.
+
+  ===========================================
+  References
+  ===========================================
+
+  [1] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+properties:
+  compatible:
+    const: riscv,rpmi-shmem-mbox
+
+  reg:
+    minItems: 2
+    items:
+      - description: A2P request queue base address
+      - description: P2A acknowledgment queue base address
+      - description: P2A request queue base address
+      - description: A2P acknowledgment queue base address
+      - description: A2P doorbell address
+
+  reg-names:
+    minItems: 2
+    items:
+      - const: a2p-req
+      - const: p2a-ack
+      - enum: [ p2a-req, a2p-doorbell ]
+      - const: a2p-ack
+      - const: a2p-doorbell
+
+  interrupts:
+    maxItems: 1
+    description:
+      The RPMI shared memory transport supports P2A doorbell as a wired
+      interrupt and this property specifies the interrupt source.
+
+  msi-parent:
+    description:
+      The RPMI shared memory transport supports P2A doorbell as a system MSI
+      and this property specifies the target MSI controller.
+
+  riscv,slot-size:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 64
+    description:
+      Power-of-2 RPMI slot size of the RPMI shared memory transport.
+
+  riscv,a2p-doorbell-value:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0x1
+    description:
+      Value written to the 32-bit A2P doorbell register.
+
+  riscv,p2a-doorbell-sysmsi-index:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The RPMI shared memory transport supports P2A doorbell as a system MSI
+      and this property specifies system MSI index to be used for configuring
+      the P2A doorbell MSI.
+
+  "#mbox-cells":
+    const: 1
+    description:
+      The first cell specifies RPMI service group ID.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - riscv,slot-size
+  - "#mbox-cells"
+
+anyOf:
+  - required:
+      - interrupts
+  - required:
+      - msi-parent
+
+additionalProperties: false
+
+examples:
+  - |
+    // Example 1 (RPMI shared memory with only 2 queues):
+    mailbox@10080000 {
+        compatible = "riscv,rpmi-shmem-mbox";
+        reg = <0x10080000 0x10000>,
+              <0x10090000 0x10000>;
+        reg-names = "a2p-req", "p2a-ack";
+        msi-parent = <&imsic_mlevel>;
+        riscv,slot-size = <64>;
+        #mbox-cells = <1>;
+    };
+  - |
+    // Example 2 (RPMI shared memory with only 4 queues):
+    mailbox@10001000 {
+        compatible = "riscv,rpmi-shmem-mbox";
+        reg = <0x10001000 0x800>,
+              <0x10001800 0x800>,
+              <0x10002000 0x800>,
+              <0x10002800 0x800>,
+              <0x10003000 0x4>;
+        reg-names = "a2p-req", "p2a-ack", "p2a-req", "a2p-ack", "a2p-doorbell";
+        msi-parent = <&imsic_mlevel>;
+        riscv,slot-size = <64>;
+        riscv,a2p-doorbell-value = <0x00008000>;
+        #mbox-cells = <1>;
+    };
-- 
2.43.0


