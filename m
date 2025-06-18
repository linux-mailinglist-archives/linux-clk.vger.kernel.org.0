Return-Path: <linux-clk+bounces-23170-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA0EADEB95
	for <lists+linux-clk@lfdr.de>; Wed, 18 Jun 2025 14:17:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 138091891F4E
	for <lists+linux-clk@lfdr.de>; Wed, 18 Jun 2025 12:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F9192E54CF;
	Wed, 18 Jun 2025 12:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="TAgH1ZP3"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28D8285056
	for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 12:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248926; cv=none; b=bZMULjS+K/fypqV9HNVxOL7eMNlW+p6jj9s/9KdRkWEFJHeXGb6aqkVll32Cl8EYb705mSnemYWRt+RqTktPlVNs+2u2WRJkXNszhiZNsQLYTZHaus04UgORTWFRI7o/et9IXRG56Ksnc9EuDEA2WJKNTo0KxNEecC/U9uO1ipc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248926; c=relaxed/simple;
	bh=g/mEKxnduPVnA4j2RQ4xuGgcCbhqHJCjD2NPYnMDHj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OcapycBFvhsk5YrqAlctQJJKbhU8ifbVh/ZXSiwmLIxvDxOJBVb8q37L3BVgYOf7CXsNXGot6hfK9oJF+LibN1Uz1Hf35em7IeF6N+kW0psJAiDAzS5iEUjHOg7a4WEzQat5Khb5Rol4hneviTvpHhWEa+g4K36Ks0v0q4oZycI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=TAgH1ZP3; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-748a42f718aso3289861b3a.2
        for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 05:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750248923; x=1750853723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBBfxF5Fj3S5/9YMcAuYqu1Hni5U+f+rs2XZF3KHDuE=;
        b=TAgH1ZP3kKhsNGODsyXeNli9EXQ7PGogpHnoXEhZzA/8fl2ylqm5bvWwUI8NXeE4Mj
         +IAq6jWCh3PI9egHf+u1I6try050Czonj/apiB8KgZbzA1tX+3EjnUMDuIy9LYXWJadK
         mW6FMuHExilfKdzTqDpHlEFCpl0owJzZXuz7LBxyf68yQlls+dKJWeJZ0wjRufE4U0Ol
         p2cTgP20pk6jpcNM0n9p3b9Am9pnYyJRx8Nk0sXadqhambZDHVD7JVcMVSkuhRCZpaNE
         9le297HeZji7cfXrdTJNSf/0YD0KXv2LbVWXmo/5QMcE8F7M6mEEM/QgFpO4iSo5tjlM
         BB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248923; x=1750853723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OBBfxF5Fj3S5/9YMcAuYqu1Hni5U+f+rs2XZF3KHDuE=;
        b=bhN00WnwfqVv55bYSm1kVAgx6lhSZb9Mw3YChjMi24MpYSDTeDIL85I3tezfzng8C5
         VcgP/QxpSQDIFWFwp9QbIVBbQQ+9TEe0KCl+I3kODROPWgtLb2gYNRadctbI9x6ahz3h
         0d1uSqmeO1E3aGwYSPcQaLBAJAG2RZD4qtR0DXSus8SzUx1YrMyKM1YhHVOJrcXEcYfO
         Hf3HHl+YipGictbPu3H+FtwGEjdY7ODJiAMRlE9JZLXFyKsVVYeZfN+6IhEYUt/Movi3
         vhrtqWEwU2nrF2Bz97327HJK/pSUJWLVYAnTTJdx7nxEVxcgtH0tIn+1VPCwiH0qygbr
         LR5w==
X-Forwarded-Encrypted: i=1; AJvYcCVPOZcSO6dIVvcVlDr5ihToG/wFI1JRmHSpgNVmOGfOT2DNoCZj9zMDnHdoFlhbfwt36+F34tLA1UI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKtkS9LaiyajCIuWQ0upXm1oZM3WNy6gq3zFXXMf8TfHPeHBKP
	45dWMwnzvFsGV9OTTRR9eYWm/toi2z18cEgPJRsZOT52vQ7RF0Gk7+giPlxlfFV6IqI=
X-Gm-Gg: ASbGncut2mnwVfr2mB6rlXiLl2RLWc2Ekl8OOuzj9CuuPF32GW5PpU4Tkm6Ych8+RfU
	rpa1NnVDm97xNcNUGW2zM/Atxtuau7HFtzTPRjYpdqXz7SyhPmhsPofqlU12EYOu6KVSEHY2xeX
	kdLSPUAakbuOZEoXPHcR8dYELDPbsGtpZ97LKpJk4PJ7W7wsrxC+Ehea7v72ZjcNKBFLCKxNZYJ
	wgJHbzcwLWOovxxLLfjQVGhL7rLYrxApsi1mLaS5pZbfi8gzHa+SCl/4Z5m12Dp0ghQsSzSGBqG
	rBWjrzzWOqvQ2YCDKbgTOD7pNtw+WwOraLfxWztn2sIb5PsNtGmYXwTJN8XH+c0RQB1FjAhzsmH
	0OrgMALDoFIggqO+CMAB3/wg/XPjx
X-Google-Smtp-Source: AGHT+IFMKwBOWWxohctdj1ZfYXunjODSapma1HKAoKx1zL6qjMZuHVAg90lx4/8R5CLCW9migGeDbg==
X-Received: by 2002:a05:6a00:b4b:b0:742:a91d:b2f5 with SMTP id d2e1a72fcca58-7489cffc1d9mr21468139b3a.13.1750248922660;
        Wed, 18 Jun 2025 05:15:22 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:15:22 -0700 (PDT)
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
Subject: [PATCH v6 08/23] dt-bindings: clock: Add RPMI clock service controller bindings
Date: Wed, 18 Jun 2025 17:43:43 +0530
Message-ID: <20250618121358.503781-9-apatel@ventanamicro.com>
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

Add device tree bindings for the RPMI clock service group based
controller for the supervisor software.

The RPMI clock service group is defined by the RISC-V platform
management interface (RPMI) specification.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../bindings/clock/riscv,rpmi-clock.yaml      | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
new file mode 100644
index 000000000000..5d62bf8215c8
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/riscv,rpmi-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V RPMI clock service group based clock controller
+
+maintainers:
+  - Anup Patel <anup@brainfault.org>
+
+description: |
+  The RISC-V Platform Management Interface (RPMI) [1] defines a
+  messaging protocol which is modular and extensible. The supervisor
+  software can send/receive RPMI messages via SBI MPXY extension [2]
+  or some dedicated supervisor-mode RPMI transport.
+
+  The RPMI specification [1] defines clock service group for accessing
+  system clocks managed by a platform microcontroller. The supervisor
+  software can access RPMI clock service group via SBI MPXY channel or
+  some dedicated supervisor-mode RPMI transport.
+
+  ===========================================
+  References
+  ===========================================
+
+  [1] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+  [2] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
+
+properties:
+  compatible:
+    description:
+      Intended for use by the supervisor software.
+    const: riscv,rpmi-clock
+
+  mboxes:
+    maxItems: 1
+    description:
+      Mailbox channel of the underlying RPMI transport or SBI message proxy channel.
+
+  "#clock-cells":
+    const: 1
+    description:
+      Platform specific CLOCK_ID as defined by the RISC-V Platform Management
+      Interface (RPMI) specification.
+
+required:
+  - compatible
+  - mboxes
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller {
+        compatible = "riscv,rpmi-clock";
+        mboxes = <&mpxy_mbox 0x1000 0x0>;
+        #clock-cells = <1>;
+    };
+...
-- 
2.43.0


