Return-Path: <linux-clk+bounces-2373-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F8B829EB0
	for <lists+linux-clk@lfdr.de>; Wed, 10 Jan 2024 17:36:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 120081F22AC7
	for <lists+linux-clk@lfdr.de>; Wed, 10 Jan 2024 16:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88ED04D123;
	Wed, 10 Jan 2024 16:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="Ipsgq+d+"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E1F4CE09
	for <linux-clk@vger.kernel.org>; Wed, 10 Jan 2024 16:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-1d427518d52so31894245ad.0
        for <linux-clk@vger.kernel.org>; Wed, 10 Jan 2024 08:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1704904561; x=1705509361; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rV4VviNybAyJrbJYiFxfyVRSktZd+2itH3SH5tA+DwI=;
        b=Ipsgq+d+0ODCuk6g4o7g+mqAo+9/sUvQRQcG8F3k5e14f/SfU6njkLw0726AK281dc
         EYdOFgdeGzQXTxXMBOV1278wUCW84bnqRglCGK2+YQ8hqzlkQD2LMzKTa9xIlstEYRze
         Df7zs1NtoYYjob/RdYDd5lkdZd1aiF7QwoQSGkIDZyjXbVYxc79G7+CQvpa+FxaIMWX0
         tjemBdDxQznRrfqUXIN1ya/y6Dv2djak6mjdHY5o6Ry1STuM9CFbyCCbyU48AoxcCDtS
         fViarSB7ZMAeVLqBnufhot6YimN2fTTCXQgFrV8Wg1rzYXYAZJovKdn2sxzDVUq+taO9
         NL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704904561; x=1705509361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rV4VviNybAyJrbJYiFxfyVRSktZd+2itH3SH5tA+DwI=;
        b=czFa9SPRcx4Bd+SVZFpEINlJZxYr/seB+PI8UsvqxEqmlsqoXHymO678gmRToUiU04
         YkMQOgbgpqPjCg8GoV5nOHJb+NkJdLtNsFOKnB+Q4x9ncCf1PQgwXlc5fSaS7BBx9KuG
         Pgat8ZkkRFSfmsE9kEYln9LbzwcNhHjCB2H4FrPIgMWXBqgPpWofgyW7+g30ONYhKP2i
         2hY7aaTIZ7N15XFoIHD6SILdGIhlKF9HUp8So1bJgm5uvgviYmyRG0wWoy/B5Wsstr5T
         KQRz6FfAIhW4ELfI9tFDv98HMftneNTwHELDqhthYuqHGdQOOh0WLhNfflfiNnMOQE28
         i6BA==
X-Gm-Message-State: AOJu0YywMejjUQ7PFCrDcctEO5DlNch1NszVzMMnA5R8ATRByNJDZqOt
	N9pKbBLgkeGPrVZCkSYYfq/yDpXdUYlOsg==
X-Google-Smtp-Source: AGHT+IFr2FFXH1tHkcmvts5zPq5Xs6NJU6JAKAieMzlBbWvjuk3lHw4ghOJ3q0yGDq0qMDjrW9Zlzg==
X-Received: by 2002:a17:902:680d:b0:1cf:e9b5:90ee with SMTP id h13-20020a170902680d00b001cfe9b590eemr256182plk.24.1704904560880;
        Wed, 10 Jan 2024 08:36:00 -0800 (PST)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:858a:4f95:cb29:907c])
        by smtp.gmail.com with ESMTPSA id p20-20020a170903249400b001d4b5e444d2sm3872265plw.48.2024.01.10.08.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 08:35:59 -0800 (PST)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Wed, 10 Jan 2024 08:35:16 -0800
Subject: [PATCH RFC 2/3] dt-bindings: clock: Document T-Head TH1520 AP
 clock controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240110-clk-th1520-v1-2-8b0682567984@tenstorrent.com>
References: <20240110-clk-th1520-v1-0-8b0682567984@tenstorrent.com>
In-Reply-To: <20240110-clk-th1520-v1-0-8b0682567984@tenstorrent.com>
To: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yangtao Li <frank.li@vivo.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Han Gao <gaohan@iscas.ac.cn>, Xi Ruoyao <xry111@xry111.site>, 
 Robert Nelson <robertcnelson@beagleboard.org>, 
 Jason Kridner <jkridner@beagleboard.org>, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704904555; l=2723;
 i=dfustini@tenstorrent.com; s=20230430; h=from:subject:message-id;
 bh=XQC8E91B1tHAiQL1JvSAmvew8theXOsFefzGYD4oHj8=;
 b=D6T8YeF2X73hPXm6YEdEYCJdL9qgsHM1/jphSVLyFTtebWsFxlb7hFhtvGGEA+22LTR29dZpk
 1Trjkwbhx0KBQHXG6RsBS514zrGzG5oT6ciC5gipEXS6/QZwgTLr5pb
X-Developer-Key: i=dfustini@tenstorrent.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=

From: Yangtao Li <frank.li@vivo.com>

Document devicetree bindings for the T-HEAD TH1520 AP sub-system
clock controller.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
[add link to reference manual]
[fixed dt_binding_check warnings]
[revised commit description]
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 .../bindings/clock/thead,th1520-clk-ap.yaml        | 65 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 66 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml b/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
new file mode 100644
index 000000000000..53e7802a4ad7
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/thead,th1520-clk-ap.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: T-HEAD TH1520 AP sub-system clock controller
+
+description: |
+  The T-HEAD TH1520 AP sub-system clock controller configures the
+  CPU, DPU, GMAC and TEE PLLs.
+
+  SoC reference manual
+  https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf
+
+maintainers:
+  - Jisheng Zhang <jszhang@kernel.org>
+  - Wei Fu <wefu@redhat.com>
+  - Yangtao Li <frank.li@vivo.com>
+
+properties:
+  compatible:
+    const: thead,th1520-clk-ap
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: main oscillator (24MHz)
+
+  clock-names:
+    items:
+      - const: osc
+
+  "#clock-cells":
+    const: 1
+    description:
+      See <dt-bindings/clock/thead,th1520-clk.h> for valid indices.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/thead,th1520-clk.h>
+    soc {
+
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      clk: clock-controller@ffef010000 {
+        compatible = "thead,th1520-clk-ap";
+        reg = <0xff 0xef010000 0x0 0x1000>;
+        clocks = <&osc>;
+        clock-names = "osc";
+        #clock-cells = <1>;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index a52dbf3c5606..dd2398512fc0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18856,6 +18856,7 @@ M:	Guo Ren <guoren@kernel.org>
 M:	Fu Wei <wefu@redhat.com>
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
 F:	arch/riscv/boot/dts/thead/
 F:	include/dt-bindings/clock/thead,th1520-clk.h
 

-- 
2.34.1


