Return-Path: <linux-clk+bounces-23164-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D03ADEB8A
	for <lists+linux-clk@lfdr.de>; Wed, 18 Jun 2025 14:16:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E660A16B54E
	for <lists+linux-clk@lfdr.de>; Wed, 18 Jun 2025 12:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 479E12DF3D1;
	Wed, 18 Jun 2025 12:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="m7qAjYLT"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD93E2DF3CC
	for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 12:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248875; cv=none; b=nWvVcZmS48YX73viTfgahxrxPNuaOMRAxajT6HJdcDeeIkiEiCNS0utOLefCj/uCw1/h5Mfs22bUHOy3h6L3msdJT8vOL2hXmUDqNQrprAuNJVP1xGpKk1FITOHp0pIxG0+ywDBvzzjICDpb1ZphGsjnY2VOiXlKfM84gXdS+I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248875; c=relaxed/simple;
	bh=wpGteD02sLvwEnKA7TBa2+SX4iYwOSU082ERtl6/Vjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XcV26fsO5DrIR1CIEmG708ZrPQlszqHCRO6eeNT07CK9qb5NCIoLs1tT9DyZQyUtz5wApr/oQZVZfikwe4WHP1J2mdutq6uLnYVt24CLsRQ3sqhbSBp4d1ZK5EwqFrkZKJSmWADpHdzAwTlbwe4ak5/8L37LvjXz08pL8hu7ouo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=m7qAjYLT; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b2f62bbb5d6so5534944a12.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 05:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750248873; x=1750853673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGFMyHcY75Un2ey32rj/OGQJrYLrfBUEB3tHZxTx41w=;
        b=m7qAjYLTh6k29aCxkuSZxb5uMIACvXHfgr+RTjkRgpEHC7ielO7QuwOlyB40+60NFO
         4NB3OEZ3eNpFMfOn9LNrSHouyUHbIpmce3uaYEO87rZmISpdUsg7P0iy1ZsYR8fo/I73
         BA+WnNxdgGJ7qgrYcHrSZ7WmiPir3p2tLI7twXy1+yuBXTGU/B0RPO1ZUNejDhm72tHy
         t4vmXAZQ3V9KcXCARnzGxbDVSvHiFbmwTp2kzuhx+vrO7SVu+bPN9h4j2NJybiZca1MI
         nT9dDHwK5Q/MrnW4oAzmICJlmaOcOM0YjeR9lzwjkMS8TJnzEbBbp2wCSm6XZ+x1gthN
         T3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248873; x=1750853673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EGFMyHcY75Un2ey32rj/OGQJrYLrfBUEB3tHZxTx41w=;
        b=qA1JFHX0iGiTMc+yaua4AQhpvXVhPzt7SUMPv0XkeE8rJ9qKYSQKGGb4uzB7fxzeoF
         M6poHq/tflCyG1qiugxTaj1gnx39u3x/ua97mAB418fAfuygYnTi7StN+JGNZkIJA8AW
         MEhWt8bBoSfZ9q0bDb54IvdDL7WY/RpzqYrqgAzkSmzkSD9GAt4tOkYOqEUn8594ULRx
         wZxLgFhcf/vmBxBsPgiSVJRvPH+Qdl+kwXxewGSG1vKLiEOsKp2YI/AE004kHgP4mTTY
         bdUD8Ww4Il1oiExRfxjIzpcKL4omw4lwGAbJ1DFIvOo8u8GKo6JMe6L2hdFWud2/HLd3
         0Rhg==
X-Forwarded-Encrypted: i=1; AJvYcCXWCYIGfVxvzMOrx8myiGIZIg0TApFCe6yBx7bLyPUTvePDGwVlLUkhWR1GTn4FV9hm+L3thKGpphI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRoWPu69aKSA+OW9KBtgzVeIT/Tb5rFN8MnZ3+dbBPJ9ypSgxu
	ZrfZG1sLsyFUyh8cnNHMwLmgYEb+v0ZtpvrdRiG5d1EHkZbRxFfcH76/61fLzOE/F/M=
X-Gm-Gg: ASbGncsxIyHkbH+cSwmpCTKTd1wf/O7rV1zvRY5n+obHnwiPSB7AwcGJ0dVjrd8ugCT
	25pJYi6xxWJo+6g4tB8JtIGeycGZ7vMjZdqUZaGpgqC+zmdXYAvkX+xMe8M/UwF3Y9u5Nesk9g5
	IG6UgmYKJ+CcSpYUOavICJGKpEDj4Xbtj6a+ltJWegJEXMJrtMN/OoHkFGTCQ2rg9+1+burtJ42
	aKXH6AVB3B8JC5ZMRjd2+Z50sDpfnFWWSR7JcHIZzipZ9y/LUld+Uz14l0v0x09GAM7JCTbhEy2
	bf8PWnlrg9NJqhVgo0Ir2QKl/dsUH/nPvkL2X6WZjWEEceLFGfQGvTB0S+0M4QD1m/RPxfzTf1a
	rcRJvrbL6G5JvqAHBng==
X-Google-Smtp-Source: AGHT+IH19wLzq9wlb/kctuWR26QQIpePLbUfQ1snatAUiGKbTDh1UHVaygrkai5UEeU6wLpNf8lJYQ==
X-Received: by 2002:a05:6a21:648b:b0:21f:53e4:1925 with SMTP id adf61e73a8af0-21fbd523a1dmr22715391637.10.1750248872883;
        Wed, 18 Jun 2025 05:14:32 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:14:32 -0700 (PDT)
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
Subject: [PATCH v6 02/23] dt-bindings: mailbox: Add bindings for RISC-V SBI MPXY extension
Date: Wed, 18 Jun 2025 17:43:37 +0530
Message-ID: <20250618121358.503781-3-apatel@ventanamicro.com>
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

Add device tree bindings for the RISC-V SBI Message Proxy (MPXY)
extension as a mailbox controller.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../bindings/mailbox/riscv,sbi-mpxy-mbox.yaml | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml b/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
new file mode 100644
index 000000000000..061437a0b45a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/riscv,sbi-mpxy-mbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V SBI Message Proxy (MPXY) extension based mailbox
+
+maintainers:
+  - Anup Patel <anup@brainfault.org>
+
+description: |
+  The RISC-V SBI Message Proxy (MPXY) extension [1] allows supervisor
+  software to send messages through the SBI implementation (M-mode
+  firmware or HS-mode hypervisor). The underlying message protocol
+  and message format used by the supervisor software could be some
+  other standard protocol compatible with the SBI MPXY extension
+  (such as RISC-V Platform Management Interface (RPMI) [2]).
+
+  ===========================================
+  References
+  ===========================================
+
+  [1] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
+
+  [2] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+properties:
+  compatible:
+    const: riscv,sbi-mpxy-mbox
+
+  "#mbox-cells":
+    const: 2
+    description:
+      The first cell specifies channel_id of the SBI MPXY channel,
+      the second cell specifies MSG_PROT_ID of the SBI MPXY channel
+
+required:
+  - compatible
+  - "#mbox-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    mailbox {
+          compatible = "riscv,sbi-mpxy-mbox";
+          #mbox-cells = <2>;
+    };
-- 
2.43.0


