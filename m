Return-Path: <linux-clk+bounces-140-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB177E8B7D
	for <lists+linux-clk@lfdr.de>; Sat, 11 Nov 2023 17:08:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07F59B20B29
	for <lists+linux-clk@lfdr.de>; Sat, 11 Nov 2023 16:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD1218E1B;
	Sat, 11 Nov 2023 16:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="v2N6u4Wj";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="eARE8DLi"
X-Original-To: linux-clk@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A5518AE7;
	Sat, 11 Nov 2023 16:08:30 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91D183A8D;
	Sat, 11 Nov 2023 08:08:28 -0800 (PST)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4SSLG13vSkz9sl1;
	Sat, 11 Nov 2023 17:08:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1699718905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=THFzGgVQc4ntN9P7VC/aZKmxHiRSLWP038efWlg/W8s=;
	b=v2N6u4WjsWxb+yxEViiAqRNmSJUDI0z5QDtbanChomCNYY6rRGEkRW7zwvSTeeewWh1wsf
	oGZoyRIJ4zzuhrAmCULe7et/nyUNrb9tdr2pdTwUcnZ1l6kSQAZUYDSBnzC15rljXfCTz8
	GY3atyyeDSOydXdar9DBUlG/cq8PvmVm23XOkxmU6I4WHPYOF4FfvieiftGXrVoQXlmD2t
	9cSu92XSotx0NGHpjTXB4a8hESOfeWHkohnk6j3Sl532mpfcr2XkAzBP/t/aeEPfM7cfug
	2QcubxZ35gSCUVjfZVOw+0BDhpJyK8eNBFu74YEDc/WnnJI8cDW4yLwJBWml8w==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1699718903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=THFzGgVQc4ntN9P7VC/aZKmxHiRSLWP038efWlg/W8s=;
	b=eARE8DLi/T6veLpspYaRKmvMRxSwvyY858xYgiRjOO75s14bAbR3Bt+inz93QhsoFEFxdm
	u30/BgHMtENh71T6zI/NDFYvE0gEf0XbLpbdiEXVU7B47XtMa+L6F0jni2o1wy2KG9a0oV
	Ye5V+TvhgTuQ6O37Z+6UxuQAbGpIzpibcozrkE46/i18ufiKqs3G4Yp4TQw0YKN5kiKqJ8
	q3n1/LuNH4ln5LYOrBl1xA9er+UVn8w6UowAkf2nJXIEliBXd7WLLuUf8S1aF+2q4hiwM3
	pe6MNf+2QUXzXlDFEUc0QV3TwZRMWbufPpt4PZaiX46i+BP9fKQTWSXmadRLmg==
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: clk: rs9: Add 9FGV0841
Date: Sat, 11 Nov 2023 17:06:59 +0100
Message-ID: <20231111160806.32954-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 3d233b5fff2168a1c82
X-MBO-RS-META: xkah6ukywhykd831kcn4qk9z4kemaddy

This is an 8-channel variant of 9FGV series.

Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: Add AB from Alexander and Conor
---
 .../devicetree/bindings/clock/renesas,9series.yaml     | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/renesas,9series.yaml b/Documentation/devicetree/bindings/clock/renesas,9series.yaml
index 3afdebdb52ad..af6319697b1c 100644
--- a/Documentation/devicetree/bindings/clock/renesas,9series.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,9series.yaml
@@ -21,6 +21,15 @@ description: |
     1 -- DIF1
     2 -- DIF2
     3 -- DIF3
+  - 9FGV0841:
+    0 -- DIF0
+    1 -- DIF1
+    2 -- DIF2
+    3 -- DIF3
+    4 -- DIF4
+    5 -- DIF5
+    6 -- DIF6
+    7 -- DIF7
 
 maintainers:
   - Marek Vasut <marex@denx.de>
@@ -30,6 +39,7 @@ properties:
     enum:
       - renesas,9fgv0241
       - renesas,9fgv0441
+      - renesas,9fgv0841
 
   reg:
     description: I2C device address
-- 
2.42.0


