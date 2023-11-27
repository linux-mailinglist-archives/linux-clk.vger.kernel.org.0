Return-Path: <linux-clk+bounces-568-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF29E7F96F8
	for <lists+linux-clk@lfdr.de>; Mon, 27 Nov 2023 01:59:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A3C5280DD6
	for <lists+linux-clk@lfdr.de>; Mon, 27 Nov 2023 00:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1B19A3C;
	Mon, 27 Nov 2023 00:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FDPiC3hJ"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 099B99C;
	Sun, 26 Nov 2023 16:59:05 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3b8382b8f5aso2393336b6e.0;
        Sun, 26 Nov 2023 16:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701046744; x=1701651544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tlbXLStT9Yzi3MnsBsStbxN6rymsbOLs17hYyIxF/KU=;
        b=FDPiC3hJdMnVxP7oRNN8ALW3SH9G6LHrsnqSeuV1lwWvMeFkrhyAws1/4c9yP7gWZl
         l7Ej+cSbprDsAYQkYPG5AAJ9Od/nRQNh1jXOlEFAsuyjQX15I+gdEHvTDxrY9eQevGo2
         3I1pqD0cFKrLFxHihlV3KfAi/uuUfZSmPCc0NJa6WfVkklS4lec7RTwbVFCNw1r53xxH
         0J9WZm670Oxn5ZdVTdKY8+e6GeRYmD/gwwt+uVazqwSQ3uY4Oh7c5SLGVbY0rFgXlpq6
         6JD5tcA2Kl0fOS8FnipnvIlsRjIF0HlbAey34Pg6t4aBpLveaWPuuRAT9qCvjnzwRvce
         RgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701046744; x=1701651544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tlbXLStT9Yzi3MnsBsStbxN6rymsbOLs17hYyIxF/KU=;
        b=KJW7FuNAn3THrwkSt5sZuE8e1Up87fJydeXK+MSZtsXstbsMGWpOk0LyxvfKmTeWyF
         u2SEeByDop8sbEHOSzYGa0txNguMNczAuHFmxxr5m3fiw+2Pv+nVWBBLWUcr4pmiImQJ
         vxP0lwoEkHPIwWjyAcP/QkabAWxnAb0eFeIj62X+CJ3VSoYxPrTrsGrdVVUZeXk/5gFI
         f89qEt6pH66riJynq/bz+CsLkS8vAoz416v58ZYFr8AybkQVubWKB1O3PUvHm0P9AnSx
         WUYK5wIGvRmBTFQ+HjXbNjh5mWhHVy+/9mIMCxlefiec3Dbwvo99rTAtQ2nkT9lbrSOZ
         FGmA==
X-Gm-Message-State: AOJu0Yzq24+R7C4op2f7DuGwod7Kv2DdVr/45Z9pt22BwLyyAs5nHfA4
	Pf2Pu6fzwaEDKRk+ml7b9Q4=
X-Google-Smtp-Source: AGHT+IEOHGPYpq8xKiYClAuavGogKA68qGd2W4TI8bWaSZhQ+hgMr+x/Oldd6BLyBMVKqO5xGXN1Pw==
X-Received: by 2002:a05:6808:3024:b0:3ae:251b:5552 with SMTP id ay36-20020a056808302400b003ae251b5552mr13085224oib.12.1701046744290;
        Sun, 26 Nov 2023 16:59:04 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 2-20020aca0f02000000b003b2e536a96dsm1307697oip.24.2023.11.26.16.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 16:59:04 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	richardcochran@gmail.com,
	robh+dt@kernel.org,
	sboyd@kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	guoren@kernel.org,
	jszhang@kernel.org,
	inochiama@outlook.com,
	samuel.holland@sifive.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH v2 2/4] dt-bindings: soc: sophgo: Add Sophgo syscon module
Date: Mon, 27 Nov 2023 08:58:56 +0800
Message-Id: <6ff37629458cde4549067e0caddeb5cb640ca7f9.1701044106.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701044106.git.unicorn_wang@outlook.com>
References: <cover.1701044106.git.unicorn_wang@outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Wang <unicorn_wang@outlook.com>

Add documentation to describe Sophgo System Controller Registers for
SG2042.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../soc/sophgo/sophgo,sg2042-syscon.yaml      | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-syscon.yaml

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-syscon.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-syscon.yaml
new file mode 100644
index 000000000000..329d645091b4
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-syscon.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/sophgo/sophgo,sg2042-syscon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2042 SoC system controller
+
+maintainers:
+  - Chen Wang <unicorn_wang@outlook.com>
+
+description:
+  The Sophgo SG2042 SoC system controller provides register information such
+  as offset, mask and shift to configure some modules, such as clocks, reset
+  signals and pinctrl.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - sophgo,sg2042-syscon
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  clock-controller:
+    # Child node
+    type: object
+    $ref: ../../clock/sophgo/sophgo,sg2042-clkgen.yaml
+    description:
+      Clock controller for the SoC clocks. This child node definition
+      should follow the bindings specified in
+      Documentation/devicetree/bindings/clock/sophgo/sophgo,sg2042-clkgen.yaml
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@30010000 {
+        compatible = "sophgo,sg2042-syscon", "syscon";
+        reg = <0x30010000 0x1000>;
+    };
+
+    syscon@30020000 {
+        compatible = "sophgo,sg2042-syscon", "syscon";
+        reg = <0x30020000 0x1000>;
+
+        clock-controller {
+            compatible = "sophgo,sg2042-clkgen";
+            clocks = <&osc>;
+            #clock-cells = <1>;
+        };
+    };
-- 
2.25.1


