Return-Path: <linux-clk+bounces-17766-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D09A2CFA5
	for <lists+linux-clk@lfdr.de>; Fri,  7 Feb 2025 22:36:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CB531881B65
	for <lists+linux-clk@lfdr.de>; Fri,  7 Feb 2025 21:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93E9622F16D;
	Fri,  7 Feb 2025 21:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IsguQlAY"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61390226557
	for <linux-clk@vger.kernel.org>; Fri,  7 Feb 2025 21:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738963872; cv=none; b=EprJBKK9SOPsHI/1Btw/ge11vVy3WvkAw3njdLDZrtEwGBI2PA6WH9WlVpT+IBi4DKQF/ym1h9c4VBR1O+XuoKl6bgof5i/NV/4rg9toeW/TqTdRh1j6dLehSwYfWpiYf1/4xOeCF8z9Ksv+HlOyXsf6wGqw1qd+j/Q2efDxfCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738963872; c=relaxed/simple;
	bh=TZUicfeAMILEnwIxb9xEAO04I+RmJCZPazH+xJUDDoY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k6AMw4w3822WQ7Go6rV4uG0EAT8YsZsEDzyx8yhs1kg1ysBe6K6+3V465lxXcl5+7UK+o2ZXSAavQOij1f1gb1RRoLLKyUJvgN+oDB+kTCCuxFh/1WqgWJ03I/jTWjjgkZR6vtV1Y7cUMKxJo0NqLsTmAVf1QbcbNVGi53wN23g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IsguQlAY; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so460206066b.3
        for <linux-clk@vger.kernel.org>; Fri, 07 Feb 2025 13:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738963866; x=1739568666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aMUvbtsA5DsEuCVaRQsEVedbOqoTRGmICjeOt7R2GgQ=;
        b=IsguQlAYC283eGQbuQwmsxax2Idetel8fX/5JEN8vGsiUDw3BTSjHHoi0KtpwBXXLN
         Evz0nkGXpTrGPGt5WybKU1dHbUcq9HeQxP1rVTS8hXbN8XV0UfJ6HeumbcAjV0lcdSVz
         NYwIaEXaai0KXrsyb7QhB7+bTJEBdSdOgL6j8Aa5+FAfIm+XdsMc7j5LNiMt4e+CwnHO
         GitauW7yzX1uR4KU2gUgNgCyrmoka38SfZsXx7YAwsuYxO/YZuxxJYTu4YCxdhAl3zFB
         Ku+R1bLCnfk9iz/ceWamJiav1c0NmpDezy+7gLWYwbUHvf6/8Uk9s1hbQZo9H2Dw+K03
         zQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738963866; x=1739568666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aMUvbtsA5DsEuCVaRQsEVedbOqoTRGmICjeOt7R2GgQ=;
        b=Eoz+xJozFA1DJ2VTbdIuW/ScFPkJY6JcEEnYeFLueAZIv8sweWUfUMK3pAkXBZhKL8
         hk7f7KNe0gdYHlTtajqKPAoRcPebk6qcC1RwkY8jdDKLeIYUQWDgHHaUA1jhg9YATEpu
         H5Gs3NXFmY9kFVBiXi+CgNHAGI6h10vwPlHzW0RvRqBLzcdZ5D6jbkMQR+Jdz760d3bx
         4VyKeXFHq10oW+mX/5Y0SU9zWmNUmIx+xdM7yN87saF6BfYEtdufOIKrzREpTOyu0Mmx
         OH3Rqvcd4v3k2HqWbE/d4A7XnbhOincnlLqlAlucQEPXEEC0EJQtVj2d29/yWcR1GhIc
         O2Gg==
X-Forwarded-Encrypted: i=1; AJvYcCWej3iApFQkhxH+0EzoUtsaej6RFL6pxLargiprdwsI0VSdlUYHddLLLR55uX7iI+aP+9bzYmhaVck=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgNkZAAtJmyAUGOTjStGuS9xOJG+9niLYEGy7oRyxj19x7AXe5
	dCtSMnijBl9qYb07Na8QRNxhFej1Pl5MqgHvONmLa07JAA7ptvydnvAduJVvapg=
X-Gm-Gg: ASbGnctZiDcrrn1Sxu98iAYaKreanTdKS91lWuewCNZhLwXGOByDHvWSpU1GuX/PJey
	F+wI13gfiKv9UnEoLxdwg1BZWzMqFwKskdHrxFuGS7oboxDzEwZOpQMQlPpvYNG9hG5YN39JgFT
	fk7CAnWoGZ8HXHNkGV4OdFYZXBaU3nMxMV5Vt7h2hR/+Syma1uXppR1gb2GvPQA3EE0hnpCMxmk
	a98SiGBjiy5y5Fe7W1ttBquR+00r22kjPogYEWnkHPFN2Grd1Ow7TkCJoOhMr8lPUcxYS9728zJ
	SjjJNQkruON0rwTcNeD6h35CJsHRHJvTo+QN4tKI1MX4WHcSrmFTqW7wNog=
X-Google-Smtp-Source: AGHT+IGxw8RmkdWRiBOE+V4K6YhzQQBZN/f/qODYZupDZrZmgY7l+ROzD9QDKgrRus5KdQsC+ufcWg==
X-Received: by 2002:a17:907:2d13:b0:ab7:6d4a:a746 with SMTP id a640c23a62f3a-ab789c87f67mr561681666b.51.1738963865621;
        Fri, 07 Feb 2025 13:31:05 -0800 (PST)
Received: from localhost (host-79-41-239-37.retail.telecomitalia.it. [79.41.239.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab78cd15ac3sm173925766b.126.2025.02.07.13.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 13:31:05 -0800 (PST)
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
Subject: [PATCH v7 07/11] arm64: dts: rp1: Add support for RaspberryPi's RP1 device
Date: Fri,  7 Feb 2025 22:31:47 +0100
Message-ID: <a3e6dc47b87a5e5ef64b03a54bc518eecd90ac4d.1738963156.git.andrea.porta@suse.com>
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

RaspberryPi RP1 is a multi function PCI endpoint device that
exposes several subperipherals via PCI BAR.
Add a dtb overlay that will be compiled into a binary blob
and linked in the RP1 driver.
This overlay offers just minimal support to represent the
RP1 device itself, the sub-peripherals will be added by
future patches.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 MAINTAINERS                           |  1 +
 arch/arm64/boot/dts/broadcom/rp1.dtso | 58 +++++++++++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1.dtso

diff --git a/MAINTAINERS b/MAINTAINERS
index f2ba6f565d30..4cb38064694e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19751,6 +19751,7 @@ F:	drivers/media/platform/raspberrypi/rp1-cfe/
 RASPBERRY PI RP1 PCI DRIVER
 M:	Andrea della Porta <andrea.porta@suse.com>
 S:	Maintained
+F:	arch/arm64/boot/dts/broadcom/rp1.dtso
 F:	Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
 F:	Documentation/devicetree/bindings/misc/pci1de4,1.yaml
 F:	Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
diff --git a/arch/arm64/boot/dts/broadcom/rp1.dtso b/arch/arm64/boot/dts/broadcom/rp1.dtso
new file mode 100644
index 000000000000..cdff061e2750
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/rp1.dtso
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/raspberrypi,rp1-clocks.h>
+
+/dts-v1/;
+/plugin/;
+
+/ {
+	fragment@0 {
+		target-path="";
+		__overlay__ {
+			compatible = "pci1de4,1";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			pci_ep_bus: pci-ep-bus@1 {
+				compatible = "simple-bus";
+				ranges = <0x00 0x40000000  0x01 0x00 0x00000000  0x00 0x00400000>;
+				dma-ranges = <0x10 0x00000000  0x43000000 0x10 0x00000000  0x10 0x00000000>;
+				#address-cells = <2>;
+				#size-cells = <2>;
+
+				rp1_clocks: clocks@40018000 {
+					compatible = "raspberrypi,rp1-clocks";
+					reg = <0x00 0x40018000 0x0 0x10038>;
+					#clock-cells = <1>;
+					clocks = <&clk_rp1_xosc>;
+					assigned-clocks = <&rp1_clocks RP1_PLL_SYS_CORE>,
+							  <&rp1_clocks RP1_PLL_SYS>,
+							  <&rp1_clocks RP1_PLL_SYS_SEC>,
+							  <&rp1_clocks RP1_CLK_SYS>;
+					assigned-clock-rates = <1000000000>, // RP1_PLL_SYS_CORE
+							       <200000000>,  // RP1_PLL_SYS
+							       <125000000>,  // RP1_PLL_SYS_SEC
+							       <200000000>;  // RP1_CLK_SYS
+				};
+
+				rp1_gpio: pinctrl@400d0000 {
+					compatible = "raspberrypi,rp1-gpio";
+					reg = <0x00 0x400d0000  0x0 0xc000>,
+					      <0x00 0x400e0000  0x0 0xc000>,
+					      <0x00 0x400f0000  0x0 0xc000>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					interrupt-controller;
+					#interrupt-cells = <2>;
+					interrupts = <0 IRQ_TYPE_LEVEL_HIGH>,
+						     <1 IRQ_TYPE_LEVEL_HIGH>,
+						     <2 IRQ_TYPE_LEVEL_HIGH>;
+				};
+			};
+		};
+	};
+};
-- 
2.35.3


