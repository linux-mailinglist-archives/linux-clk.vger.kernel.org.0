Return-Path: <linux-clk+bounces-166-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB7F7E9CFA
	for <lists+linux-clk@lfdr.de>; Mon, 13 Nov 2023 14:19:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1990AB208B1
	for <lists+linux-clk@lfdr.de>; Mon, 13 Nov 2023 13:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C62911F618;
	Mon, 13 Nov 2023 13:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dLtb6C7M"
X-Original-To: linux-clk@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF221F614;
	Mon, 13 Nov 2023 13:19:12 +0000 (UTC)
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0033171A;
	Mon, 13 Nov 2023 05:19:10 -0800 (PST)
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-581f78a0206so2500723eaf.2;
        Mon, 13 Nov 2023 05:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699881550; x=1700486350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cILQpOBvb+TfKiK6ZQZxVGfG6yumttRB0ZdBq3qtuMo=;
        b=dLtb6C7MSvk0qWMQjorUwfkypOwTsYwHlBu/JrMTn16wfNFT6ArS6CWxUk+LfmpjXt
         pQ3HLxlX+ksOGcz2nisGoQn05ieTyWqQ8I3DvRCM6FkogLgRjyP5Q2YEiZwmSyE4LfCL
         tf+E5uUXsaEbSBXaxBaqOaXvttW4+9r9YpfxoXfNfu5PnbiKzVNKNQ5dsxVXDAjBCXNh
         20a0dVm1ACttH21gVfkhiqbM602ibJTw1NxG0algFwZJy7uIC+XkESsnewM+OxlqlNV2
         +3HYVNhYn/Em8jTKL/ucoclzauCMEzqDrSnDUDoWREFUonBPMZFAv6zdIBevkJeD2Kso
         aShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699881550; x=1700486350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cILQpOBvb+TfKiK6ZQZxVGfG6yumttRB0ZdBq3qtuMo=;
        b=C8PpwN87uKqrrxMcgeBRi3Gko8HSBoIiiRjinLajC1tCoXI2qlcTRfDOo/y37WLYqb
         6E9KDj0KZc8sGQHf64GVA+Iq4Nzjx1sKXuPanJzXhkD72AoSf/J4lByJT9TGcyp9z2b6
         DlNCecqGA51iZFJQtK/zpGUeUB0tK0hv8g1/POubAfiRiiAiZb5Q9+dU3qE8fXUx1ZAr
         kgVLYMiSjBr63BPPgHRyoihcmQhJ8uOHpY5vj64ef7S8J4dYXxDm1v3eMly4jhciinhq
         nXfNaIQOfiU+ZniJdzCcDswtutHczcq8yPQqOGEsaFHXw82NT8cHjbUntnIfKQp+eGJ4
         TRNA==
X-Gm-Message-State: AOJu0YwVu9u6F+9Bs8FLWNGfvx/Cj+HcqZOBuhba5eN1hP8qcuOApwab
	FCi08JqikORtVTxpMididoo=
X-Google-Smtp-Source: AGHT+IHGu08XC660yZ66f68Mmebro0V2bn0R5bRMPD2XBiV2hiZPo8vFmbjyr+ZUlNTWZ4ylkZhGwg==
X-Received: by 2002:a4a:851d:0:b0:581:d922:e7f3 with SMTP id k29-20020a4a851d000000b00581d922e7f3mr6288302ooh.9.1699881550098;
        Mon, 13 Nov 2023 05:19:10 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id j15-20020a4aab4f000000b0057327cecdd8sm908572oon.10.2023.11.13.05.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 05:19:09 -0800 (PST)
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
	xiaoguang.xing@sophgo.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH 2/5] dt-bindings: soc: sophgo: Add Sophgo syscon module
Date: Mon, 13 Nov 2023 21:19:02 +0800
Message-Id: <3c286171af30101b88f0aaf645fb0a7d5880ac0a.1699879741.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699879741.git.unicorn_wang@outlook.com>
References: <cover.1699879741.git.unicorn_wang@outlook.com>
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
 .../soc/sophgo/sophgo,sg2042-syscon.yaml      | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-syscon.yaml

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-syscon.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-syscon.yaml
new file mode 100644
index 000000000000..829abede4fd5
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-syscon.yaml
@@ -0,0 +1,38 @@
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
+  as offset, mask and shift to configure related modules.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - sophgo,sg2042-syscon
+          - const: syscon
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
+    syscon@30010000 {
+        compatible = "sophgo,sg2042-syscon", "syscon";
+        reg = <0x30010000 0x1000>;
+    };
-- 
2.25.1


