Return-Path: <linux-clk+bounces-14419-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C70F9C19ED
	for <lists+linux-clk@lfdr.de>; Fri,  8 Nov 2024 11:07:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F7781C22596
	for <lists+linux-clk@lfdr.de>; Fri,  8 Nov 2024 10:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D8D1E47D1;
	Fri,  8 Nov 2024 10:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="eZ5AsxDn"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1321F1E3795
	for <linux-clk@vger.kernel.org>; Fri,  8 Nov 2024 10:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731060343; cv=none; b=psrwvkfdukuCQMOF+g4AZdRMbpJ2PXZCnlu8bn0kStsHaF60ukuObNczN8CGmQWM6oFxqPYF+d+1U3kkF2/McaiEAARe+SYZW34Er98XFREdLeHgEQP/DeIWy2NQY6sJAoZflXs+1LtSWp37Qwtjz12nY+yn9d2tH7D3KGDi5FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731060343; c=relaxed/simple;
	bh=iS4YhpIy3CXjMYWmuHDYc8XpbjiHC1FYXeViz/2PurM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jpeFKQ0skDmSbli4DLQtPIzjY+Jymxi0QAbZUJfPrD5z8wVOh5MpF5K4tIICmV5EKgR93/lTqFdcd0/FJBha80KKDMrivjpQxGp4tQm9Jrkt7yHBc5E8TFvgQo/BtRsm1dVIcIeoicd0F+zk5byxNb4mmeqsZMtsrTvtpnZhs0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=eZ5AsxDn; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5ceca7df7f0so2269962a12.1
        for <linux-clk@vger.kernel.org>; Fri, 08 Nov 2024 02:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731060338; x=1731665138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39hZMJu6Jb8W5Z8tLGOBPgwWiBv/C6HY49AbdW1iCro=;
        b=eZ5AsxDnZHvZ33kZcTbfJR3T3IMFc54EGgqWceCKJsEtgLp+41wHHVTHQy+AlB1zNw
         W4MOPWD8yLqg2US2oqkSATZpf23+l5blLgg8xwIWD7glMwwcnBZgcwMAy8W5DZRnkc9S
         q1akq5OzbGoJdtjjeV5+Ncz39hOQEy95Yevy7oyTcn3g/c4+vIJFR7NM8z9CL8K5YZ30
         5uTaW4CtYDGiAgh28Dac2+gctYjDF71PKuZpL3Dnfd59tI/524x7ir4G4dGiwY3hS8ok
         KZlonv3AUG8VSXzPEzDzRBbeNHPcVbF6HLUUwmROFETFYK8hZVIuixvv1yWi0TqqcW+T
         zSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731060338; x=1731665138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=39hZMJu6Jb8W5Z8tLGOBPgwWiBv/C6HY49AbdW1iCro=;
        b=jR74vmOxC5GYRZIGZQ1BW39+zmiZUUmxP4boe1rBAKrOjVXbw+2+v/Uzs4THuyDoSL
         wKLzQC1Gy3UvOiBR4x+fbGDBseykG3lx9Tc1e5J0YHdIzysat2571pJYnB6aAZ09YU53
         MOCBTxqYunfY1a5TutRn6qukmFKDCl8lxlbelZCWTfUfekJTN+83Co7DVHwH35GPAMVC
         4113QdEXREyGz08Np1qgR2FwnM5wsI2nMbpkbsFGlyCdKyyTtmxdXCzxEXMOYIWdBtTQ
         d2/SdGKOseBcxP0Yw+m9XmqNOByMtgYDIwk+oHFDhH2t2r9bV9ePs8xAvxpct7CReer5
         upwA==
X-Forwarded-Encrypted: i=1; AJvYcCUfyrLB6M2ZIRkNd48/2R3/3/v+NtVMh/RbFntU0Yz1AlvBM7yL/T060HbM4XoxG0Rqt4FR1lPejfI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1vCRCSuHx5Fxnwslw8TOkndigdJhCr25TLAomfl94d+0zhnyD
	/D5at8ibOzSbvg5Ee/D2FEJaFaDeF0E+c3vbBDI4XhWtV3pifI4o4PfgUomYo3I=
X-Google-Smtp-Source: AGHT+IHCKuShyBLYUaSNRjOJi/AwsIWesxGTAj6K0+n35l2geAvDpqqD8UzDqCcqkG+0+JCuN2pmiw==
X-Received: by 2002:a05:6402:1e8c:b0:5ce:b1da:3003 with SMTP id 4fb4d7f45d1cf-5cf0a324b64mr1611311a12.20.1731060338404;
        Fri, 08 Nov 2024 02:05:38 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf03c4f0bdsm1775959a12.56.2024.11.08.02.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:05:37 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	p.zabel@pengutronix.de,
	g.liakhovetski@gmx.de,
	lethal@linux-sh.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-serial@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 6/8] arm64: dts: renesas: rzg3s-smarc-switches: Add a header to describe different switches
Date: Fri,  8 Nov 2024 12:05:11 +0200
Message-Id: <20241108100513.2814957-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241108100513.2814957-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241108100513.2814957-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

There are different switches available on both the RZ/G3S SMARC Module and
RZ SMARC Carrier II boards. These switches are used to route different SoC
signals to different parts available on board.

These switches are described in device trees through macros. These macros
are set accordingly such that the resulted compiled dtb to describe the
on-board switches states.

Based on the SW_CONFIG3 switch state (populated on the module board), the
SCIF3 SoC interface is routed or not to an U(S)ART pin header available on
the carrier board. As the SCIF3 is accessible through the carrier board,
the device tree enables it in the carrier DTS. To be able to cope with
these type of configurations, add a header file where all the on-board
switches can be described and shared accordingly between module and carrier
board.

Commit prepares the code to enable SCIF3 on the RZ/G3S carrier device
tree.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     | 20 +-----------
 .../boot/dts/renesas/rzg3s-smarc-switches.h   | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+), 19 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/rzg3s-smarc-switches.h

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 55c72c8a0735..5c88e130c89e 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -9,25 +9,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
 
-/*
- * On-board switches' states:
- * @SW_OFF: switch's state is OFF
- * @SW_ON:  switch's state is ON
- */
-#define SW_OFF		0
-#define SW_ON		1
-
-/*
- * SW_CONFIG[x] switches' states:
- * @SW_CONFIG2:
- *	SW_OFF - SD0 is connected to eMMC
- *	SW_ON  - SD0 is connected to uSD0 card
- * @SW_CONFIG3:
- *	SW_OFF - SD2 is connected to SoC
- *	SW_ON  - SCIF1, SSI0, IRQ0, IRQ1 connected to SoC
- */
-#define SW_CONFIG2	SW_OFF
-#define SW_CONFIG3	SW_ON
+#include "rzg3s-smarc-switches.h"
 
 / {
 	compatible = "renesas,rzg3s-smarcm", "renesas,r9a08g045s33", "renesas,r9a08g045";
diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-switches.h b/arch/arm64/boot/dts/renesas/rzg3s-smarc-switches.h
new file mode 100644
index 000000000000..e2d9b953f627
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-switches.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * On-board switches for the Renesas RZ/G3S SMARC Module and RZ SMARC Carrier II
+ * boards.
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ */
+
+#ifndef __RZG3S_SMARC_SWITCHES__
+#define __RZG3S_SMARC_SWITCHES__
+
+/*
+ * On-board switches' states:
+ * @SW_OFF: switch's state is OFF
+ * @SW_ON:  switch's state is ON
+ */
+#define SW_OFF		0
+#define SW_ON		1
+
+/*
+ * SW_CONFIG[x] switches' states:
+ * @SW_CONFIG2:
+ *	SW_OFF - SD0 is connected to eMMC
+ *	SW_ON  - SD0 is connected to uSD0 card
+ * @SW_CONFIG3:
+ *	SW_OFF - SD2 is connected to SoC
+ *	SW_ON  - SCIF3, SSI3, IRQ0, IRQ1 connected to SoC
+ */
+#define SW_CONFIG2	SW_OFF
+#define SW_CONFIG3	SW_ON
+
+#endif /* __RZG3S_SMARC_SWITCHES__ */
-- 
2.39.2


