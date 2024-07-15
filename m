Return-Path: <linux-clk+bounces-9590-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D5D931080
	for <lists+linux-clk@lfdr.de>; Mon, 15 Jul 2024 10:49:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C76CC28273E
	for <lists+linux-clk@lfdr.de>; Mon, 15 Jul 2024 08:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F856186E37;
	Mon, 15 Jul 2024 08:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B/SerU87"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40330185627
	for <linux-clk@vger.kernel.org>; Mon, 15 Jul 2024 08:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721033031; cv=none; b=Rllqhv72VPUkaSZvZv+cdbda7VVlM15gKBSOt/Lhg5OvAjjxR92BGLH/NZfWybBs9TTSzK3Xjx3I1YlW1aMJAU6wN5AbuU8jaQ3wPa1nl7W9lyBLYhrxxEeof66XGWQ68JgvTFO1NH8XUdU2ucgXEur2ygBK8g1bRJIq96gbjSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721033031; c=relaxed/simple;
	bh=S6vkVSNbhG89L370XvJhZTmegxYe3oPBTnuAUQ0eJrI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HOmU8zRcUOXTEBwIdgOkI3Q2r0dw+pSY0QcwSsYgWZPb3T6/QrV+csKIC4KQ1uIA/cvFty8n7Fx4fgp03rfpE9sDI07A2tm4myLkldWN32eDmy8Fq1KLYMpiyjxxmdSka7nLf+S/cLZZokaFE+IUbRnqSAFbQpOAPs5cAcwwz5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B/SerU87; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52ea5dc3c79so5635884e87.1
        for <linux-clk@vger.kernel.org>; Mon, 15 Jul 2024 01:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721033027; x=1721637827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EsdzpTRLXnS6olUqpcfoyueExAl5OEraVlLDAUpRwyY=;
        b=B/SerU870wcbZokm85hUBUHwM+9z6ZL7qOIDyFTS43Wc3xw5Id9ydGmQ99eJkCkep5
         iO9NtuD9iTSNFJENzvyIwv+69hz8JjbPLH35lqpPuyHKlRZxInOTM9gsCAbocD9rKvvl
         2gikCfDvdnWfwfBWC/PumTOelhnXcxkos0rZuS5xehTl8477ogd3CGJ6nQHy6iUCbg05
         WAsDRspgyn8oKdhrLgaN7XI3bwohymNQ5udHvNQWjqeXUd9GQQAUw5padNCk6kCZk+iS
         eszqwMJu35bf/qM0XsimphjUKzHQBEeB6tJU8mal9YyCZm7hZf2J/SL5eSsGjaI5wGrn
         Oshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721033027; x=1721637827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EsdzpTRLXnS6olUqpcfoyueExAl5OEraVlLDAUpRwyY=;
        b=o64iQHcrtA0pHNPA2gfU2Zi2ltk54sO8+M+eabIjn18pXrZftxKQJOAol1h6COASh5
         zE1wwDpXikz4yhSbPvFnRs+R73Gqb9kAl4ku3Y05b66oZDS7kvpyc/VOnccuM1vujGDw
         fZEkB1Hl2ULJwFHkfa/0ELTLjBpbYtrlndxMS8QezZZxGwj9rGssfpyAtRbNX/hxXjij
         RPCF6OshTmPcMctFHOQQTdUszGMLT5dJDNsLq4iGdZNkFQYBUXLR/0w+urIzn2FtBEoN
         9J3b/Fz3cBb76p9H0U2L8H4VzifjlP6J8WVoL/6m19y6JyUKkVh2bvHyNY1k3UQOycyZ
         ZwPg==
X-Forwarded-Encrypted: i=1; AJvYcCVKtvhVK783W6WLfWeK/OPPKWG/xicEcRp1ChClg/37r0m9Dvt5Kl3qTmkRoQI0flQpVf0upTae5gJTGsJ577YTLC6wqodg20rk
X-Gm-Message-State: AOJu0YwiG6EpmrGJmuxHM2Y0CBllZc4CIPdhxxLCTJyMKZ7nAWB45zho
	k/2Mv9/8CdwGPx3Q+u/As/vMtf8sGVvHU6EMsRBZyGWDY+tfD/ZGGN/GaLZe0o0=
X-Google-Smtp-Source: AGHT+IFZ06GISOlCShv8E0xL7DUeyBRRoifs+3mdHj6HmVdE1N6FRa5TrRxeP5KnzTakGhRCH+kIzw==
X-Received: by 2002:a05:6512:3f0c:b0:52c:de00:9c04 with SMTP id 2adb3069b0e04-52eb99d338amr14103866e87.48.1721033027358;
        Mon, 15 Jul 2024 01:43:47 -0700 (PDT)
Received: from rayyan-pc.broadband ([2a0a:ef40:ee7:2401:197d:e048:a80f:bc44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5edb489sm77226925e9.37.2024.07.15.01.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 01:43:46 -0700 (PDT)
From: Rayyan Ansari <rayyan.ansari@linaro.org>
To: devicetree@vger.kernel.org
Cc: Rayyan Ansari <rayyan.ansari@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: qcom,turingcc: convert to dtschema
Date: Mon, 15 Jul 2024 09:43:10 +0100
Message-ID: <20240715084313.14098-1-rayyan.ansari@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the bindings for the Turing Clock Controller, currently only
used for QCS404, from the old text format to yaml.

Signed-off-by: Rayyan Ansari <rayyan.ansari@linaro.org>
---
 .../bindings/clock/qcom,turingcc.txt          | 19 --------
 .../bindings/clock/qcom,turingcc.yaml         | 47 +++++++++++++++++++
 2 files changed, 47 insertions(+), 19 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,turingcc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,turingcc.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,turingcc.txt b/Documentation/devicetree/bindings/clock/qcom,turingcc.txt
deleted file mode 100644
index 126517de5f9a..000000000000
--- a/Documentation/devicetree/bindings/clock/qcom,turingcc.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-Qualcomm Turing Clock & Reset Controller Binding
-------------------------------------------------
-
-Required properties :
-- compatible: shall contain "qcom,qcs404-turingcc".
-- reg: shall contain base register location and length.
-- clocks: ahb clock for the TuringCC
-- #clock-cells: from common clock binding, shall contain 1.
-- #reset-cells: from common reset binding, shall contain 1.
-
-Example:
-	turingcc: clock-controller@800000 {
-		compatible = "qcom,qcs404-turingcc";
-		reg = <0x00800000 0x30000>;
-		clocks = <&gcc GCC_CDSP_CFG_AHB_CLK>;
-
-		#clock-cells = <1>;
-		#reset-cells = <1>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/qcom,turingcc.yaml b/Documentation/devicetree/bindings/clock/qcom,turingcc.yaml
new file mode 100644
index 000000000000..0a57e42fb4d9
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,turingcc.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,turingcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Turing Clock & Reset Controller
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+
+properties:
+  compatible:
+    const: qcom,qcs404-turingcc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-qcs404.h>
+    turingcc: clock-controller@800000 {
+        compatible = "qcom,qcs404-turingcc";
+        reg = <0x00800000 0x30000>;
+        clocks = <&gcc GCC_CDSP_CFG_AHB_CLK>;
+
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
-- 
2.45.2


