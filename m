Return-Path: <linux-clk+bounces-23908-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 39678AF0A5D
	for <lists+linux-clk@lfdr.de>; Wed,  2 Jul 2025 07:16:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DEB84E30DF
	for <lists+linux-clk@lfdr.de>; Wed,  2 Jul 2025 05:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F5E21FF50;
	Wed,  2 Jul 2025 05:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="LfWGNmog"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD86202C2A
	for <linux-clk@vger.kernel.org>; Wed,  2 Jul 2025 05:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751433317; cv=none; b=YeOozVhi4NPRTcgn0+zjWWSZVkVDnC0Zv/mkWQHw2G2gk/AZxHTqTHmy143Bz2h8dlgbfpjYSj0+KdaeG9X4oh9SyqJ0+LKpWcKmJ5war+wc07wc0ah0z+WAwCSXHDK3QMIH7Mv+/8Inqr4Z355p7c5P9BkYzRGrt4Ozeam1DdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751433317; c=relaxed/simple;
	bh=gqZpMXPd6DL/+kfXUibwUL8SSmPMehps7IgssTY7RG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pt7VSeJo9isZ+LS8bO9LrCTQZOOipDv1RPidSkYq8UCA45KX4IRWDvk9jHyX2dfiZnqWAMtQzBkcSzkXx0ltFAAQkMShxCwe3JVwB1kNjX/iUuv/4qVby1iMpBCQp/nWERHwzgra67gJUWMuCcKaJ7NA6+7/lqmlY3lljxSJfTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=LfWGNmog; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-235a3dd4f0dso40027445ad.0
        for <linux-clk@vger.kernel.org>; Tue, 01 Jul 2025 22:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433315; x=1752038115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMRC5c9xXUgo6eKv4jcoCHH6TENqo9cqAPQxW1Kbofo=;
        b=LfWGNmoghu3Bb7eWP2OvvY6iiv3SYTuDDT97/PY7/Iqj88voxp1xqd337LhPMSFzLc
         Bac6ZqEwr+aigw+NpuMb76b/s0MoLrXXBcUGs8WIgQzj0hp3TUOQuzfh8XwdYCt1XevP
         lhR3rtiozkdgONLTB1sMJX/dmYVZ8CG1VAiyO7MxufyRYNcglBZGfoFTANNL5eEl5H5P
         WohHTTHf5l6kowFaPSdnmQdg7A8Lb/TveV3Y4mbi6vauzodJ3AEYZm4LgYaCO7nN67yc
         6KixI1TBL5PN/Qf9vJ4GC1iQoFqahqorC2NBIUkvMwWbgRtdMnVcDUADqm+LBBG+PFf6
         Pl2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433315; x=1752038115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zMRC5c9xXUgo6eKv4jcoCHH6TENqo9cqAPQxW1Kbofo=;
        b=psl+7aqwOOSPDhJtmVLbyshic6trd/+6OdB5TQUkbT5lgSmvuZX1RznPrrIUR6QhlU
         pxfrDQgDVzUdhW+Ksipn6aAgnC4VG60ooIJ22YM5dSEFC1lyYFFMHvueNJMfsPwb2yQA
         /zMIdi5hraV3H6LyOAeucLj0688+BZBNwnCUQceZqejf9NygyEuQtrqAxcxVpeCH3NOI
         kLjBDWGIDaJ8NV9eAP3mrzIxtD0QQsEoIRLdhO/HK94IwAey8xfUsgtwXaRwTvTEkjiX
         uHDW5d5NAl/YfJ4CEXHtpArGp4tDisLeK814nr2Te/4ieRkjC1GD+G4cLGS37D8zzO3A
         0m/w==
X-Forwarded-Encrypted: i=1; AJvYcCWImqy2S2qy+710ORx4G4i9XhEb++hBzI8LSCoSZo+18dYiayV1tUnwEFA0LUmQY2jtK35cbZYCUMc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyEVgb4yU5uxzac9DVwd3oHwwHXrYK/jsyinRcnb2cLS1AlvlF
	9a3y+SGSZcP1qiySZOGh6r+w6y91MkVvzTTn3ixoBGT4hgPg26CIbKfGXB5njp2txdY=
X-Gm-Gg: ASbGnctFPWRFK/WAS9R8sNgJ9Zh253FeLk1UXCUoR6qiM16jZztGUBLqOIeoLfA/cZ6
	DY8uc/uvrA2bvuoxeGRp5Ko+BjRrirLVWHU6ZXhzejh+Pe5pZyxIZaW+A9hGzFIm8/UY/r+63Dp
	PjYN03l/Q/gQVYVDyuv2d7bBfbvKkTQZ1Jh7rSu0e5F8YruBSTqPxfecJ0dGg44wV+f+sLEz8+s
	EcqrzwTE6fhDjjCFG6ZRNESrnYURrxgYTEfrFGOpEJbJ3Qagh8fzmNVyO1ZjXGB5yaTWCIE890C
	OyUQmjW++SzFjc0abQMq8uljq0B4wYZTHTh4H5vYYAw5d2nUmmcZmW40OVpeZS29H/zLYk6sv4Q
	bGHrBU+51bYWxPnML
X-Google-Smtp-Source: AGHT+IGMgggDnrWmfF/y7sLrYD7q8r2h5NmHNdzY2iKqbrQlHfhi5a/4jD0kNAv2DXNo1e1e/iX9VQ==
X-Received: by 2002:a17:902:f792:b0:224:c46:d167 with SMTP id d9443c01a7336-23c6e501a07mr21381315ad.16.1751433315023;
        Tue, 01 Jul 2025 22:15:15 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c6fe31933sm4719595ad.220.2025.07.01.22.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:15:14 -0700 (PDT)
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
	Alexandre Ghiti <alex@ghiti.fr>,
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
	linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v7 09/24] dt-bindings: clock: Add RPMI clock service controller bindings
Date: Wed,  2 Jul 2025 10:43:30 +0530
Message-ID: <20250702051345.1460497-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702051345.1460497-1-apatel@ventanamicro.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
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
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
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


