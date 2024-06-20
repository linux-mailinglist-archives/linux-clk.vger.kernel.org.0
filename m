Return-Path: <linux-clk+bounces-8352-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 425A1911011
	for <lists+linux-clk@lfdr.de>; Thu, 20 Jun 2024 20:06:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9D5B1F23673
	for <lists+linux-clk@lfdr.de>; Thu, 20 Jun 2024 18:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 197C31CB337;
	Thu, 20 Jun 2024 17:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b="cFhihpqE"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAFC1BA073
	for <linux-clk@vger.kernel.org>; Thu, 20 Jun 2024 17:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718906304; cv=none; b=GK5aNyX8A8beV3Xm8Dye5ZVeDP3khZb3zMkGOVzh3pHeLyMFjzRfjLcfs/LzO28eDA0ROCJb9Oov2hnrWZOcdHocfV/KvITBWsqck+nJDvgS25slqv2uq0/q1+7zwzlFjOSnGPz+YLyi3YTtxcrMvTkQNcLbPotcegyAilteMWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718906304; c=relaxed/simple;
	bh=qFS8dbUIltaliP34b4s9iOYNBl/H/n7Qhca0kv+Esfk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FiajSVk8zDi+3BSeZdEJZc6bhlmapb8mFfGelcGNFflefVuYecxtprY2sXLqbdVM7nDsHDBaWtkPlvuwQM1M6Tte9K/4AljhlXL4mkimpeIjSc+RjMYRz6HILgkdKy5rTZStNdriOQkAf7Gv9zj5abUq92gAPxYV9LlXRlH2JxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com; spf=pass smtp.mailfrom=timesys.com; dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b=cFhihpqE; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timesys.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a6f7b785a01so126234766b.1
        for <linux-clk@vger.kernel.org>; Thu, 20 Jun 2024 10:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718906300; x=1719511100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dj3DX12QYavc1OOQJN+Lhj+prqOyJf9zJxwWhTZ5aE8=;
        b=cFhihpqEGSNaDlRMjYIJJTJjiUfXMDt8wlISE1cdQN6o8aLt7JcEnbBwLJYm+MzkjB
         aMRm9e2UVA2H0OcRC/SXhT1JbDDQZLt2PdAwqORJ4GQTwimbp8fd4Y3hnpe0ImpJlICU
         KsLyycXIsU0m1O9wegcwMXBPUMwH99id/ixXP1LZC7xvWb5B1BmJSSEX+0OD3/fIBe4a
         M3fHOCAIWgzazbcTTsce+XJAgqvzbR4pn7pkvGslaytZB/LtQhyYEcx/OXb6RUOT/4JY
         c32cltnnt4RhIo8A8Gas6qRcvWv7hE6rFo651SmNsqjJoCnkGmcxxqCqaqealzbUQTfl
         l69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718906300; x=1719511100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dj3DX12QYavc1OOQJN+Lhj+prqOyJf9zJxwWhTZ5aE8=;
        b=g3oGIAjb2Mk4wNr7OPW3vHq4ncp259TCc6b0r7yqwQVGqzV3D8vVzCYOsfC1GmH7q0
         ugb2JAFtBKiXwedHB44Py5Nb/7/Dn71e0XEa0BPKTQQVmIqQR7cotiYwGUIHfIK8Cr+V
         Nx6Mrvg6TOjSq3Tzpyln2o0xQFCTlLzzngKkC8VEvH1q0GfYzSH/Y2tE7RqRHVFGR/1Y
         7uxrgNr/N73oSKv5fZgGNn7wC+d/Agvx9734vOZAYu+hZ0j0IaL7qcnrtT69NnHKlCa3
         vxoApimU5eDCCBWlp2Sf4jXVV4bTi+Qz5TFSbrbTtmmIWEXqAISXLgeirWBFHrPMymcj
         zVyw==
X-Forwarded-Encrypted: i=1; AJvYcCWwO8xKXy3ChNuSEf6blMcum0dMZaA6N66oIjrvAENKDP2+ViFfaue4mckEpTRBMhtB6nGFQ7vqPfGN1A1WBqr/4A6Y9Kzl+rAo
X-Gm-Message-State: AOJu0YxKgaWy3rhja4SLpdC1DSr+nEtHB8mciMVJUY2iDhLDuOV0lgeK
	HJxeVJKdzGFHzTZqH7bzZXkpgRt5iEDP9/oLby8BDQlG/S0Zx+uJxEkPajof9zs=
X-Google-Smtp-Source: AGHT+IEhPPFEKagTHzQMOwX7NrYh9+xyhRsxpQErqvlswtZC5Lb/tm5y+kINO8slxfzNDjQFWUOp4Q==
X-Received: by 2002:a17:907:a646:b0:a6f:5192:6f4d with SMTP id a640c23a62f3a-a6fab60321fmr428721866b.8.1718906299800;
        Thu, 20 Jun 2024 10:58:19 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f42e80sm781370766b.186.2024.06.20.10.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 10:58:19 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yangtao Li <frank.li@vivo.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Li Zetao <lizetao1@huawei.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Chancel Liu <chancel.liu@nxp.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Markus Elfring <Markus.Elfring@web.de>
Subject: [Patch v4 02/10] dt-bindings: dma: Add lpc32xx DMA mux binding
Date: Thu, 20 Jun 2024 19:56:33 +0200
Message-Id: <20240620175657.358273-3-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LPC32XX SoCs use pl080 dma controller which have few request signals
multiplexed between peripherals. This binding describes how devices can
use the multiplexed request signals.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v4:
- This patch is new in v4

 .../bindings/dma/nxp,lpc3220-dmamux.yaml      | 56 +++++++++++++++++++
 MAINTAINERS                                   |  9 +++
 2 files changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml

diff --git a/Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml b/Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
new file mode 100644
index 000000000000..a5384b6c67fc
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/nxp,lpc3220-dmamux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DMA multiplexer for LPC32XX SoC (DMA request router)
+
+maintainers:
+  - J.M.B. Downing <jonathan.downing@nautel.com>
+  - Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
+
+allOf:
+  - $ref: dma-router.yaml#
+
+properties:
+  "#dma-cells":
+    const: 3
+    description: |
+      First two cells same as for device pointed in dma-masters.
+      Third cell represents mux value for the request.
+
+  compatible:
+    const: nxp,lpc3220-dmamux
+
+  dma-masters:
+    description: phandle to a dma node compatible with arm,pl080
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - dma-masters
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@40004000 {
+      compatible = "nxp,lpc3220-creg", "syscon", "simple-mfd";
+      reg = <0x40004000 0x114>;
+      ranges = <0 0x40004000 0x114>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      dma-router@7c {
+        compatible = "nxp,lpc3220-dmamux";
+        reg = <0x7c 0x8>;
+        #dma-cells = <3>;
+        dma-masters = <&dma>;
+      };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index aacccb376c28..f7adf9f66dfa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2396,6 +2396,15 @@ F:	drivers/usb/host/ohci-nxp.c
 F:	drivers/watchdog/pnx4008_wdt.c
 N:	lpc32xx
 
+ARM/LPC32XX DMAMUX SUPPORT
+M:	J.M.B. Downing <jonathan.downing@nautel.com>
+M:	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
+R:	Vladimir Zapolskiy <vz@mleia.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
+N:	lpc32xx
+
 ARM/Marvell Dove/MV78xx0/Orion SOC support
 M:	Andrew Lunn <andrew@lunn.ch>
 M:	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
-- 
2.25.1


