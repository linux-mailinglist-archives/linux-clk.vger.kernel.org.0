Return-Path: <linux-clk+bounces-1041-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5A3809877
	for <lists+linux-clk@lfdr.de>; Fri,  8 Dec 2023 02:13:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94F1D281F97
	for <lists+linux-clk@lfdr.de>; Fri,  8 Dec 2023 01:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 415DE10E7;
	Fri,  8 Dec 2023 01:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RpG7F/Az"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 308581715;
	Thu,  7 Dec 2023 17:13:39 -0800 (PST)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-1fb0022e6a5so1061332fac.0;
        Thu, 07 Dec 2023 17:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701998018; x=1702602818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Wg3vTVI+KNNtCZ40tO4THN1Rc/sssddRQwHLFYhkAc=;
        b=RpG7F/Az9K2luoXvevJFQvG/NLppBbh8dFmESqo7wcKp7WirwG20BA2bZEoWboA/rg
         HWyjgybttLhmGll3ndv3R2oAGB7fUb1Cq2p7uHZtpdWbbjMh7Ap7iljSJy61UjlXGgKU
         cTlqnACt5RD0zQyQWkNjTw+4JyCx5ccOaWtUdPF0KOz2uztiuUgt7Zf9W2wLgjgxdoAY
         ZDoOjSjWXhyHU8dvLeUH85lBFi80gK/WeAHCVioUC6I3p/bo8Ugjc7wP5OijiqUb/Oes
         NCBqDdnHW+uRwJquU0yMrZQXEhksM6vCM8NT0B6MFG/4zo3ANMPZWAFjxSyexba8wn16
         ewoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701998018; x=1702602818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Wg3vTVI+KNNtCZ40tO4THN1Rc/sssddRQwHLFYhkAc=;
        b=fzoLIXe22vKb0GkQKp1vk2in34pIy4466t2yDagoDzlIifeyw7kv2jPfRAnGCG4Ql1
         Jbs5Gy9arVKmf/zRJR4la2XfGPaBL1mbLLqPXEqSJQz8WCPScTt/ACziFawZ28RkbunW
         zQba6M8LBT4cK+dmIp4q4T5IQEFsMjD57P3jGSAkIO7swp+FAvcaZpe+OEgeIbvZCale
         lKGObhgPg9ZBzLK4fUhFWRt8pMR2ne/7hK8cz4p+wFnqt7gR62ioyQb0t8OBipeT9oms
         8pUb2wux2Bpgr13OCyzAfLfnwRBizPF8SpfhyfAu84d4PgwwrOg5EM6am7z4YuBH55FS
         ebBQ==
X-Gm-Message-State: AOJu0YxOHjIOEg5p6Lvi1l3ImPL87r0S02ENMjTGs7MAsHAjhjLdN2DK
	0+VDt02uEb1Xzux3pdv1tMs=
X-Google-Smtp-Source: AGHT+IHq3XNbApiW/rK14kESG46BbbOrCxC7UErCs/p6jI1ZvS2KI8wrN/V2ZOh5nu1uGZkHDIM5VA==
X-Received: by 2002:a05:6870:a798:b0:200:4d66:39ce with SMTP id x24-20020a056870a79800b002004d6639cemr19714oao.95.1701998018344;
        Thu, 07 Dec 2023 17:13:38 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id qb7-20020a056871e78700b001fac77ee907sm207493oac.33.2023.12.07.17.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 17:13:38 -0800 (PST)
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
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 1/4] dt-bindings: soc: sophgo: Add Sophgo system control module
Date: Fri,  8 Dec 2023 09:13:30 +0800
Message-Id: <b7d52351a1b68e14bf4b7101c91fe5de929bdca6.1701997033.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701997033.git.unicorn_wang@outlook.com>
References: <cover.1701997033.git.unicorn_wang@outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Wang <unicorn_wang@outlook.com>

Add documentation to describe Sophgo System Controller for SG2042.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../soc/sophgo/sophgo,sg2042-sysctrl.yaml     | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-sysctrl.yaml

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-sysctrl.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-sysctrl.yaml
new file mode 100644
index 000000000000..1ec1eaa55598
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-sysctrl.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/sophgo/sophgo,sg2042-sysctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2042 SoC system controller
+
+maintainers:
+  - Chen Wang <unicorn_wang@outlook.com>
+
+description:
+  The Sophgo SG2042 SoC system controller provides register information such
+  as offset, mask and shift that can be used by other modules, such as clocks.
+
+properties:
+  compatible:
+    const: sophgo,sg2042-sysctrl
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    system-controller@30010000 {
+        compatible = "sophgo,sg2042-sysctrl";
+        reg = <0x30010000 0x1000>;
+    };
-- 
2.25.1


