Return-Path: <linux-clk+bounces-17761-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2F7A2CF91
	for <lists+linux-clk@lfdr.de>; Fri,  7 Feb 2025 22:34:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66F077A115C
	for <lists+linux-clk@lfdr.de>; Fri,  7 Feb 2025 21:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04A2E224AEE;
	Fri,  7 Feb 2025 21:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="E2I+Mjbd"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F229C1BFE10
	for <linux-clk@vger.kernel.org>; Fri,  7 Feb 2025 21:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738963864; cv=none; b=YXQP1127AoPauwEI4l3rRY+a7Qn+JzQUPowLXdMC+tKV0RUModiWxbtgLx0PnRWf4yGXJweACIMMv8TXexKwrPgnXWAaQ00cu/oaQpKfgqOfcz+/lyoRqS3nPW8T9xTA3DDSjqZzsykz27qKHeNkqsDlnRS/b24LNK7OA4w6ork=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738963864; c=relaxed/simple;
	bh=Vqxs+kVJieo41BNTbOy151OA7a/+v8UhSPwA2cgLeBc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vEstxbIxl0m1Mis3IHiqAByn3znV+LiGA8hPnICAuwXgPu95ZcDTe66l4ZEQFWDfcVQPJHAYGvau4zhPtrZCONoxJStfdUhlNkgKFVbf5vVBmDGgX3nzN4YRO6EUYjWbeZC6ssulZy+Kv4UlwscMEuB0ovSuRCiJbkxStZ63lR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=E2I+Mjbd; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-aa68b513abcso472769866b.0
        for <linux-clk@vger.kernel.org>; Fri, 07 Feb 2025 13:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738963860; x=1739568660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rsdeUn09NQu1XAwKNFzWW9JkORXiQHI3/S6RPw7u+/c=;
        b=E2I+Mjbdf003hBpMrLq3+7v9iwKtf6YNePzJS972aosEZfbwTngNaJke1Wfaqq+qUr
         OraSd3G6COHOX7SlLefjuhEsYblyZNS3yCtUREzGg2yABl6JXg7UWrLKQDPKoRbCfcUM
         HTncV+YsK7JdFyFwf1LsSiEyYl49+gdTe1HjLYU/NDDx2V9mjPSRMRffAIkXQunDYzVq
         DRCuUwlAUnFEHK8RnjWMJdcbLlCAicwlHHu2m2IDY+GLg3WdlB5ZsEGHttiKBRndwU+q
         NheCVRuc2gnObnDingmi0awhDCAIZM15PPmVxbG/X4/1GmkBG3krtnZiOdr3s2K5mIFa
         fiXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738963860; x=1739568660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rsdeUn09NQu1XAwKNFzWW9JkORXiQHI3/S6RPw7u+/c=;
        b=pW4gMCueWtc5KxY51i2v8oIIICYFFuEazE5yMS8SiKK1UTknF4TR0NjTc4cJOFvyAe
         RWfwQ2K38a1TWh7iHT0rK0PXaQ+61unpsa5ZwNBFw7mKCkm7Udyg3OI1KDFREYAkruE1
         pcBlI+KoXLl1M4Ip4K194KhrqPpElxVjgr8uwS5tsmQvZtLGPRfFqrrtt6/TpCRfeOrz
         f+DnOFpN0qoalZY8UQjoRDn75QQJuaN21rhBBpnylWjZebx3n5yMM6+wxGnXDhmDQ9g/
         nlKbgZ045rYLWFKDdjVRJJmV5heBRaCFLBeMMuTggPSu1ZL/fDSyERYSslhhEJqCtVn3
         Ypzg==
X-Forwarded-Encrypted: i=1; AJvYcCWzS1EaJY3LnOWtqnosRctWGBfd0R2Wnd3sTNrw7SNlTWhZ3w/XDPqNimpK3eKbi4sujiNjFve2Cjc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgIT/jBwz0TmdB8hSQwkMmiRRo+B0/sqQbz23yJAFMcmDqgNu7
	9CuSOCEH6ft9fsmu7fWmSjTEHU4LyaPj2YM9k5nEvD8D1vFK6eGcBJCPSWsg4UQ=
X-Gm-Gg: ASbGnctNha+IFyKDvR9I45yvn+YZwACirhnJdH/jmLMrnuVW4BgcRcE7Cn0nBm/hHze
	dxEw84JUgA9G/RHHFpaxXKlLPWeYPqWOPU0w4b0NJloQ1f8nUl+cjwc6aAiothj8JR7/46xTq4k
	/9GJNepbzaTtF6g0hmb85CuLkLG2Y+8n/k+kEHC1FPlHX1I9pe1QR5MN6Xrfm7nUqj9Uipl48GL
	trcOgRGjDxTDEloGHDCGetEbHmohFFcBUyqZjP6FzRRonQkIQNjIax4l+qFbKjOvdz0Bdq4Jul9
	3i/I66tomt7mbnZxnlMdlD/VFFh4525b25yr0sRNvQubj6hYRNTjX+DNsv8=
X-Google-Smtp-Source: AGHT+IGMX5NVZzU8MUKeI0fjcjMv6fPf4JZi6tiL/AaJTBGa/B1TUhbWJvYJKAyCpuBEQJ9WjWWDMw==
X-Received: by 2002:a17:906:ef0b:b0:ab2:d8e7:682c with SMTP id a640c23a62f3a-ab789c630c2mr614943366b.38.1738963860387;
        Fri, 07 Feb 2025 13:31:00 -0800 (PST)
Received: from localhost (host-79-41-239-37.retail.telecomitalia.it. [79.41.239.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab79668f32esm69327666b.176.2025.02.07.13.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 13:31:00 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v7 03/11] dt-bindings: pci: Add common schema for devices accessible through PCI BARs
Date: Fri,  7 Feb 2025 22:31:43 +0100
Message-ID: <c0acc51a7210fb30cae7b26f4ad1f0449beed95e.1738963156.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1738963156.git.andrea.porta@suse.com>
References: <cover.1738963156.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Common YAML schema for devices that exports internal peripherals through
PCI BARs. The BARs are exposed as simple-buses through which the
peripherals can be accessed.

This is not intended to be used as a standalone binding, but should be
included by device specific bindings.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../devicetree/bindings/pci/pci-ep-bus.yaml   | 58 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/pci-ep-bus.yaml

diff --git a/Documentation/devicetree/bindings/pci/pci-ep-bus.yaml b/Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
new file mode 100644
index 000000000000..33479a5b40c6
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/pci-ep-bus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common Properties for PCI MFD EP with Peripherals Addressable from BARs
+
+maintainers:
+  - Andrea della Porta  <andrea.porta@suse.com>
+
+description:
+  Define a generic node representing a PCI endpoint which contains several sub-
+  peripherals. The peripherals can be accessed through one or more BARs.
+  This common schema is intended to be referenced from device tree bindings, and
+  does not represent a device tree binding by itself.
+
+properties:
+  '#address-cells':
+    const: 3
+
+  '#size-cells':
+    const: 2
+
+  ranges:
+    minItems: 1
+    maxItems: 6
+    items:
+      maxItems: 8
+      additionalItems: true
+      items:
+        - maximum: 5  # The BAR number
+        - const: 0
+        - const: 0
+
+patternProperties:
+  '^pci-ep-bus@[0-5]$':
+    type: object
+    description:
+      One node for each BAR used by peripherals contained in the PCI endpoint.
+      Each node represent a bus on which peripherals are connected.
+      This allows for some segmentation, e.g. one peripheral is accessible
+      through BAR0 and another through BAR1, and you don't want the two
+      peripherals to be able to act on the other BAR. Alternatively, when
+      different peripherals need to share BARs, you can define only one node
+      and use 'ranges' property to map all the used BARs.
+
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: simple-bus
+
+    required:
+      - compatible
+
+additionalProperties: true
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index d45c88955072..af2e4652bf3b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19752,6 +19752,7 @@ RASPBERRY PI RP1 PCI DRIVER
 M:	Andrea della Porta <andrea.porta@suse.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
+F:	Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
 F:	Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
 F:	include/dt-bindings/clock/rp1.h
 F:	include/dt-bindings/misc/rp1.h
-- 
2.35.3


