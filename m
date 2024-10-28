Return-Path: <linux-clk+bounces-13924-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D92A9B329D
	for <lists+linux-clk@lfdr.de>; Mon, 28 Oct 2024 15:07:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AC43282EE0
	for <lists+linux-clk@lfdr.de>; Mon, 28 Oct 2024 14:07:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 048B81DDC30;
	Mon, 28 Oct 2024 14:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HzHP2ebm"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661741DDA15
	for <linux-clk@vger.kernel.org>; Mon, 28 Oct 2024 14:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730124441; cv=none; b=AmpKfGWA4xrVVk750o6/dnzFmsdGwOnez8XND/DE3buoHRRHnWnCRPCoO0AVn4z8fyCoaIq3LiNQcmBsOCLHysvjS33SSTkLGvIf/Rt6zryy0pFFEsl3R64XvgdraiuOsB//+u6SLLPsBPI5+oEMR/R+5vnRdr0bDfsiYreQEnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730124441; c=relaxed/simple;
	bh=mwYCVz6D8W9HmTW7vYsdq2zwOKnDl5x6fvHqNEXkl+g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h/p7VJGcAC8rhmvNKTiWFv0b6IqJoWZRAMm9FIGJUAlWkviP4Opd17z8xMoN12Tkt21aPHXaUT/P2k9wjxE7QCATOOPTXRGj7cfYq4LA1ldwBvJooidT8SLN808sFvCrAyfKFbPSZchNA9MRHvCQoueNt9rGfAERhs8Ktp5rLYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HzHP2ebm; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-a9a26a5d6bfso667343466b.1
        for <linux-clk@vger.kernel.org>; Mon, 28 Oct 2024 07:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730124437; x=1730729237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3nL/aNuqQ0jfU5YRKIpGycLGZhiHvfbk6boSP0gW7YU=;
        b=HzHP2ebmGsVcef/b6mjh2ZvckZ/+gQpiyPr48oR3HsnrleZDdShSUlT5uNBnxdSpBM
         e+CA5smuGKZjCpK5Tkaw0bGRs0NvAXPoNu4OERM/t9kb03eaCiW5C3LvhSDrrewODR8Y
         MpHclY8xqXSMH3Z7zQnEKzPNgV5Omq8J4U1slzB2jyRIL04zn1HwIXIFB7IKzIbHsnDb
         Fdo/amtUDZn3AdT35c+Hea1YWf0nW8eclGvf9Fw547k1/lb+QAtyOeLTYuwHcuX5wURG
         1BEny8RW9AIlk+LvxfAjM5lvzBUHGDpBQUk6AxLE4FtblVLAAeSCW2NnzPfPtCWrQFOh
         vQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730124437; x=1730729237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3nL/aNuqQ0jfU5YRKIpGycLGZhiHvfbk6boSP0gW7YU=;
        b=fwyNrbl/PF6Ge0GSl/50GV1fE/GCvobaM7pJV28rs+G6lySuYSLjJYwpwC8HD/oDU2
         Sfie4PuQC/aON+S/CHmUmzvSd1wz2nGsmYGNOXsNcS1a1vCH9pzdSkQwYfL74ZsJMu42
         7wx2H5IVRgpdjU3vv1Sn216JMpufNd36FtVpzlW36GcN4sX+CU1DfY2HFdjMHCMhHcud
         DuBu2cvTwXRMgL4rj/VTqvhm5gBOaCzVvIhL7G67HsmslaI/dw1nJwHPP/u+R1BmupHZ
         KH6wvBXTTAzKKsyAkZjBUSm0JwQ+KNInDEuaM7syU82uNgTuF0Cu4rY2RGUu/DaHSB2Y
         JDgg==
X-Forwarded-Encrypted: i=1; AJvYcCVK1kGYL1YqFB6QcDoDWtxsV0x3pvMN5uMhvzQBgyW0qs0Gcb5N/ds3HcRC6SeO0Lb8zj4fy0D1tik=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzt3mhN0jGPhIqjN4M2wYJ1+T/SOp6YTyhF5EWbRZux744JNmR
	DDoyaBs6txinBUHA7R3GH/RM156KmGlrqigmxemL1BK7EGS7evsTdSMH+nriOAg=
X-Google-Smtp-Source: AGHT+IERr8XivDBajebydtWIWIIvd/nwOj10Iu4gpEnGicX7BoMfI323yDnTaPBK5OXEFfYVNbe1Fg==
X-Received: by 2002:a17:907:7f29:b0:a9a:c57f:964f with SMTP id a640c23a62f3a-a9de5cea097mr747130466b.16.1730124436319;
        Mon, 28 Oct 2024 07:07:16 -0700 (PDT)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b30d6fdc5sm381023066b.163.2024.10.28.07.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 07:07:15 -0700 (PDT)
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
Subject: [PATCH v3 02/12] dt-bindings: pinctrl: Add RaspberryPi RP1 gpio/pinctrl/pinmux bindings
Date: Mon, 28 Oct 2024 15:07:19 +0100
Message-ID: <9a02498e0fbc135dcbe94adc7fc2d743cf190fac.1730123575.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1730123575.git.andrea.porta@suse.com>
References: <cover.1730123575.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for the gpio/pin/mux controller that is part of
the RP1 multi function device, and relative entries in MAINTAINERS file.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../pinctrl/raspberrypi,rp1-gpio.yaml         | 163 ++++++++++++++++++
 MAINTAINERS                                   |   2 +
 2 files changed, 165 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
new file mode 100644
index 000000000000..465a53a6d84f
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
@@ -0,0 +1,163 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/raspberrypi,rp1-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RaspberryPi RP1 GPIO/Pinconf/Pinmux Controller submodule
+
+maintainers:
+  - Andrea della Porta <andrea.porta@suse.com>
+
+description:
+  The RP1 chipset is a Multi Function Device containing, among other sub-peripherals,
+  a gpio/pinconf/mux controller whose 54 pins are grouped into 3 banks. It works also
+  as an interrupt controller for those gpios.
+
+properties:
+  compatible:
+    const: raspberrypi,rp1-gpio
+
+  reg:
+    maxItems: 3
+    description: One reg specifier for each one of the 3 pin banks.
+
+  '#gpio-cells':
+    description: The first cell is the pin number and the second cell is used
+      to specify the flags (see include/dt-bindings/gpio/gpio.h).
+    const: 2
+
+  gpio-controller: true
+
+  gpio-ranges:
+    maxItems: 1
+
+  gpio-line-names:
+    maxItems: 54
+
+  interrupts:
+    maxItems: 3
+    description: One interrupt specifier for each one of the 3 pin banks.
+
+  '#interrupt-cells':
+    description:
+      Specifies the Bank number [0, 1, 2] and Flags as defined in
+      include/dt-bindings/interrupt-controller/irq.h.
+    const: 2
+
+  interrupt-controller: true
+
+additionalProperties:
+  anyOf:
+    - type: object
+      additionalProperties: false
+      allOf:
+        - $ref: pincfg-node.yaml#
+        - $ref: pinmux-node.yaml#
+
+      description:
+        Pin controller client devices use pin configuration subnodes (children
+        and grandchildren) for desired pin configuration.
+        Client device subnodes use below standard properties.
+
+      properties:
+        pins:
+          description:
+            A string (or list of strings) adhering to the pattern 'gpio[0-5][0-9]'
+        function: true
+        bias-disable: true
+        bias-pull-down: true
+        bias-pull-up: true
+        slew-rate:
+          description: 0 is slow slew rate, 1 is fast slew rate
+          enum: [ 0, 1 ]
+        drive-strength:
+          enum: [ 2, 4, 8, 12 ]
+
+    - type: object
+      additionalProperties:
+        $ref: "#/additionalProperties/anyOf/0"
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+required:
+  - reg
+  - compatible
+  - '#gpio-cells'
+  - gpio-controller
+  - interrupts
+  - '#interrupt-cells'
+  - interrupt-controller
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    rp1 {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        rp1_gpio: pinctrl@c0400d0000 {
+            reg = <0xc0 0x400d0000  0x0 0xc000>,
+                  <0xc0 0x400e0000  0x0 0xc000>,
+                  <0xc0 0x400f0000  0x0 0xc000>;
+            compatible = "raspberrypi,rp1-gpio";
+            gpio-controller;
+            #gpio-cells = <2>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            interrupts = <0 IRQ_TYPE_LEVEL_HIGH>,
+                         <1 IRQ_TYPE_LEVEL_HIGH>,
+                         <2 IRQ_TYPE_LEVEL_HIGH>;
+            gpio-line-names =
+                   "ID_SDA", // GPIO0
+                   "ID_SCL", // GPIO1
+                   "GPIO2", "GPIO3", "GPIO4", "GPIO5", "GPIO6",
+                   "GPIO7", "GPIO8", "GPIO9", "GPIO10", "GPIO11",
+                   "GPIO12", "GPIO13", "GPIO14", "GPIO15", "GPIO16",
+                   "GPIO17", "GPIO18", "GPIO19", "GPIO20", "GPIO21",
+                   "GPIO22", "GPIO23", "GPIO24", "GPIO25", "GPIO26",
+                   "GPIO27",
+                   "PCIE_RP1_WAKE", // GPIO28
+                   "FAN_TACH", // GPIO29
+                   "HOST_SDA", // GPIO30
+                   "HOST_SCL", // GPIO31
+                   "ETH_RST_N", // GPIO32
+                   "", // GPIO33
+                   "CD0_IO0_MICCLK", // GPIO34
+                   "CD0_IO0_MICDAT0", // GPIO35
+                   "RP1_PCIE_CLKREQ_N", // GPIO36
+                   "", // GPIO37
+                   "CD0_SDA", // GPIO38
+                   "CD0_SCL", // GPIO39
+                   "CD1_SDA", // GPIO40
+                   "CD1_SCL", // GPIO41
+                   "USB_VBUS_EN", // GPIO42
+                   "USB_OC_N", // GPIO43
+                   "RP1_STAT_LED", // GPIO44
+                   "FAN_PWM", // GPIO45
+                   "CD1_IO0_MICCLK", // GPIO46
+                   "2712_WAKE", // GPIO47
+                   "CD1_IO1_MICDAT1", // GPIO48
+                   "EN_MAX_USB_CUR", // GPIO49
+                   "", // GPIO50
+                   "", // GPIO51
+                   "", // GPIO52
+                   ""; // GPIO53
+
+            rp1-uart0-14-15 {
+                pin_txd {
+                    function = "uart0";
+                    pins = "gpio14";
+                    bias-disable;
+                };
+
+                pin_rxd {
+                    function = "uart0";
+                    pins = "gpio15";
+                    bias-pull-up;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 75a66e3e34c9..c55d12550246 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19384,7 +19384,9 @@ RASPBERRY PI RP1 PCI DRIVER
 M:	Andrea della Porta <andrea.porta@suse.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
+F:	Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
 F:	include/dt-bindings/clock/rp1.h
+F:	include/dt-bindings/misc/rp1.h
 
 RC-CORE / LIRC FRAMEWORK
 M:	Sean Young <sean@mess.org>
-- 
2.35.3


