Return-Path: <linux-clk+bounces-174-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C82D37EA5EF
	for <lists+linux-clk@lfdr.de>; Mon, 13 Nov 2023 23:20:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 688ACB207EA
	for <lists+linux-clk@lfdr.de>; Mon, 13 Nov 2023 22:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1290A2D608;
	Mon, 13 Nov 2023 22:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="NDuqezJ3";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hLyoiPN7"
X-Original-To: linux-clk@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3EC2E626;
	Mon, 13 Nov 2023 22:20:21 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [IPv6:2001:67c:2050:0:465::201])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6800D10C;
	Mon, 13 Nov 2023 14:20:16 -0800 (PST)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4STkQ32QQ1z9sW2;
	Mon, 13 Nov 2023 23:20:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1699914011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fQv89aV+4ByK+wlmAgbHMFA8qk3Yc+TtNwQpfJj2H4M=;
	b=NDuqezJ37fA1/mXtLkuJrKae5GgwCpVLstdfRVaXgmscq20gfoHSw0iRw+x8Ndla/xmAMH
	hwXSAPITQq9cZWBJIF59adABv/gcmdCH0oZLkj816kiPk5ui7CBkTKc+Lu86VPz/BmO5TX
	YURai94PeTJLaiTRUCT4hkYG/KO/q4tWQs0wR+XkOcJ8N9SLAIXkXWT1WxObAFAritIQ9E
	5nzIDV3svs1iJCtiqS/LAdehriJT4/KdzZmW5x8tgN+flNgwMMpudaBc8s4Dhk6327Tora
	kfHzRf6loquyzoYXBrtmq906+6d48VY5K1+SFCA9qevYRtGaglcilHkFNOiX9Q==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1699914009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fQv89aV+4ByK+wlmAgbHMFA8qk3Yc+TtNwQpfJj2H4M=;
	b=hLyoiPN7E/yNP6/F2Yw//DNhUqF9Uct8ME5d9RE9gIojenoSj9a6KvUrvyb2M03d5pqwXy
	4EnZuYwZWfYTkq94Piodd+Ec6Fqua3LoiZGTLlkD9aBsU8mYAc+nubS8IzS4/PycC2QsZO
	MoCpMzI22hFYI3VlL6bOuqZMVcvHyZ8kkBLDGs5UMkkqO2pY4ers/rq0sPtTbyjUCDp6+j
	lAOL6WcOGQOXmFQWSSMy91/N02jibUrGw1k5AgeMe58flQt7Y5X0xRi1V2M8TPbhoYW0XQ
	4mByO0FeVe8vJzy6xmsxraC/YAzrUkMt3fmk2oyLdLfzNkyiDpfE8vMHvd/L/w==
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
Subject: [PATCH v3 1/4] dt-bindings: clk: rs9: Add 9FGV0841
Date: Mon, 13 Nov 2023 23:18:51 +0100
Message-ID: <20231113221949.111964-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 30fe3d2de739b463a51
X-MBO-RS-META: nr7cwmi15zdoqhwf6tbza5pmh4fpxm7z
X-Rspamd-Queue-Id: 4STkQ32QQ1z9sW2

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
V3: No change
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


