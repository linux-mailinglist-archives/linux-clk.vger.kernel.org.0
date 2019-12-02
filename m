Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C78C10EBB8
	for <lists+linux-clk@lfdr.de>; Mon,  2 Dec 2019 15:45:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727431AbfLBOp6 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 2 Dec 2019 09:45:58 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33740 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727362AbfLBOp5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 2 Dec 2019 09:45:57 -0500
Received: by mail-pf1-f193.google.com with SMTP id y206so9927219pfb.0
        for <linux-clk@vger.kernel.org>; Mon, 02 Dec 2019 06:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=fJpLrIKsRo/M1XWJlbsmJmsiB/P3shBmUrGcXBt0E3Y=;
        b=rf9zlynl+gcMhKb8zaMF6LyV6oUiMNYwjKJ0UzuhhTDGKhPUTpuLHAqCpD4pqDfoYh
         uTkQY/Gfw/czj204LMmW+421HzaHPDxIQCOaVnHTZA1ClqYyHODXciAUVYQZAbTKkVSU
         wEFvCRikYR7fO1QWQwQbU2KsRLmFwQTKVaWSoU4QzdAHFWzzTANTaZPbUlcom+L0i6K9
         MrfZG4b+ZkkaNS/lVTcZMYTShxG8VjcCelraSvr+AqnyVUO1LTMzNTyZfBZm98A5HauX
         XyFLsHB0p9t789HF7DKj9R5J5s26HJ19x+6G2UG4RHqVMKGblVQDYHyuLelOppQLhFA6
         S5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=fJpLrIKsRo/M1XWJlbsmJmsiB/P3shBmUrGcXBt0E3Y=;
        b=e4hWF4CDepdXUyERYdzyDU1GCzMHbbJ/pTdg9eJAq4AF6QMsQEzspYTgjrDNZNHVW4
         5txvJeZeHP/NmwEHtIm1+JIpVTly8LIpHIHjp/K76m1/cg/TcVfel/DcfMvr7O6x9A3C
         0NX6wiYbXFGEsfWY/lCn2R7kdqGsHGE/0cM2Y9pVAS9wt/Bqd7bJAK94159AV2laE28Y
         p0/Y0uTek5bvFI8wo8qmh1jZQbzG2L40KzUVcmLlgvQ0FXPxgO34+SZX0VWJ+LBvXGGb
         YizE6/ehAWlfuSE1R/U4JWGO45p2b5a3hWv4bPaepr6qcfuLYlL44+6w3zTilAIj1266
         jtsA==
X-Gm-Message-State: APjAAAX2Xmw952zubNy/2WRbRaK76dEsi6JVGi2wVCXBvfkqfnKvn2Lg
        DNRyFo4nV73PcgUhn9Gmy2Pj1g==
X-Google-Smtp-Source: APXvYqwJCZ21DKyImsmF0S/wnVl9c6YsYBKSqJeJZEgJNXB/++3Nefh5ZWK6cylIY/MouTEgV/5M7w==
X-Received: by 2002:a63:101f:: with SMTP id f31mr32208521pgl.410.1575297956733;
        Mon, 02 Dec 2019 06:45:56 -0800 (PST)
Received: from localhost.localdomain (li519-153.members.linode.com. [66.175.222.153])
        by smtp.gmail.com with ESMTPSA id f10sm34347813pfd.28.2019.12.02.06.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 06:45:56 -0800 (PST)
From:   Jun Nie <jun.nie@linaro.org>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, xuwei5@hisilicon.com, p.zabel@pengutronix.de,
        opensource@jilayne.com, swinslow@gmail.com, jun.nie@linaro.org,
        allison@lohutok.net, yuehaibing@huawei.com, tglx@linutronix.de,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, xuejiancheng@hisilicon.com
Subject: [PATCH 2/3] reset: hisilicon: Extend reset operation type
Date:   Mon,  2 Dec 2019 22:45:23 +0800
Message-Id: <20191202144524.5391-3-jun.nie@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191202144524.5391-1-jun.nie@linaro.org>
References: <20191202144524.5391-1-jun.nie@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Extend reset operations to support combination of three type flags:
ASSERT/DEASSERT SET/CLEAR POLL.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/clk/hisilicon/reset.c | 58 ++++++++++++++++++++++++++++++++---
 1 file changed, 53 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/hisilicon/reset.c b/drivers/clk/hisilicon/reset.c
index 93cee17db8b1..de7d186b0894 100644
--- a/drivers/clk/hisilicon/reset.c
+++ b/drivers/clk/hisilicon/reset.c
@@ -2,20 +2,25 @@
 /*
  * Hisilicon Reset Controller Driver
  *
- * Copyright (c) 2015-2016 HiSilicon Technologies Co., Ltd.
+ * Copyright (c) 2015-2019 HiSilicon Technologies Co., Ltd.
  */
 
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+
+#include <dt-bindings/reset/hisilicon-resets.h>
 #include "reset.h"
 
 #define	HISI_RESET_BIT_MASK	0x1f
 #define	HISI_RESET_OFFSET_SHIFT	8
 #define	HISI_RESET_OFFSET_MASK	0xffff00
+#define	HISI_RESET_FLAG_SHIFT	24
+#define	HISI_RESET_FLAG_MASK	0xff000000
 
 struct hisi_reset_controller {
 	spinlock_t	lock;
@@ -30,14 +35,17 @@ struct hisi_reset_controller {
 static int hisi_reset_of_xlate(struct reset_controller_dev *rcdev,
 			const struct of_phandle_args *reset_spec)
 {
+	unsigned long flags;
 	u32 offset;
 	u8 bit;
 
+	flags = (reset_spec->args[2] << HISI_RESET_FLAG_SHIFT)
+		& HISI_RESET_FLAG_MASK;
 	offset = (reset_spec->args[0] << HISI_RESET_OFFSET_SHIFT)
 		& HISI_RESET_OFFSET_MASK;
 	bit = reset_spec->args[1] & HISI_RESET_BIT_MASK;
 
-	return (offset | bit);
+	return (flags | offset | bit);
 }
 
 static int hisi_reset_assert(struct reset_controller_dev *rcdev,
@@ -48,13 +56,33 @@ static int hisi_reset_assert(struct reset_controller_dev *rcdev,
 	u32 offset, reg;
 	u8 bit;
 
+	flags = (id & HISI_RESET_FLAG_MASK) >> HISI_RESET_FLAG_SHIFT;
+	if (flags & HISI_ASSERT_NONE)
+		return -ENOTSUPP; /* assert not supported for this reset */
+
 	offset = (id & HISI_RESET_OFFSET_MASK) >> HISI_RESET_OFFSET_SHIFT;
 	bit = id & HISI_RESET_BIT_MASK;
 
+	pr_devel("%s %s to %s 0x%x:bit[%d]\n", __func__,
+		flags & HISI_ASSERT_POLL ? "poll" : "",
+		flags & HISI_ASSERT_SET ? "set":"clear", offset, bit);
+
+	if (flags & HISI_ASSERT_POLL) {
+		if (flags & HISI_ASSERT_SET)
+			return readl_poll_timeout(rstc->membase + offset,
+						  reg, reg & BIT(bit), 0, 5000);
+		else
+			return readl_poll_timeout(rstc->membase + offset,
+						  reg, !(reg & BIT(bit)),
+						  0, 5000);
+	}
+
 	spin_lock_irqsave(&rstc->lock, flags);
 
 	reg = readl(rstc->membase + offset);
-	writel(reg | BIT(bit), rstc->membase + offset);
+	/* Default is setting to assert for no flag case. */
+	reg = (flags & HISI_ASSERT_CLEAR) ? reg & ~BIT(bit) : reg | BIT(bit);
+	writel(reg, rstc->membase + offset);
 
 	spin_unlock_irqrestore(&rstc->lock, flags);
 
@@ -69,13 +97,33 @@ static int hisi_reset_deassert(struct reset_controller_dev *rcdev,
 	u32 offset, reg;
 	u8 bit;
 
+	flags = (id & HISI_RESET_FLAG_MASK) >> HISI_RESET_FLAG_SHIFT;
+	if (flags & HISI_DEASSERT_NONE)
+		return -ENOTSUPP; /* deassert not supported for this reset */
+
 	offset = (id & HISI_RESET_OFFSET_MASK) >> HISI_RESET_OFFSET_SHIFT;
 	bit = id & HISI_RESET_BIT_MASK;
 
+	pr_devel("%s %s to %s 0x%x:bit[%d]\n", __func__,
+		flags & HISI_DEASSERT_POLL ? "poll" : "",
+		flags & HISI_DEASSERT_SET ? "clear":"set", offset, bit);
+
+	if (flags & HISI_DEASSERT_POLL) {
+		if (flags & HISI_DEASSERT_SET)
+			return readl_poll_timeout(rstc->membase + offset,
+						  reg, reg & BIT(bit), 0, 5000);
+		else
+			return readl_poll_timeout(rstc->membase + offset,
+						  reg, !(reg & BIT(bit)),
+						  0, 5000);
+	}
+
 	spin_lock_irqsave(&rstc->lock, flags);
 
 	reg = readl(rstc->membase + offset);
-	writel(reg & ~BIT(bit), rstc->membase + offset);
+	/* Default is clearing to deasseart for no flag case. */
+	reg = (flags & HISI_DEASSERT_SET) ? reg | BIT(bit) : reg & ~BIT(bit);
+	writel(reg, rstc->membase + offset);
 
 	spin_unlock_irqrestore(&rstc->lock, flags);
 
@@ -103,7 +151,7 @@ struct hisi_reset_controller *hisi_reset_init(struct platform_device *pdev)
 	rstc->rcdev.owner = THIS_MODULE;
 	rstc->rcdev.ops = &hisi_reset_ops;
 	rstc->rcdev.of_node = pdev->dev.of_node;
-	rstc->rcdev.of_reset_n_cells = 2;
+	rstc->rcdev.of_reset_n_cells = 3;
 	rstc->rcdev.of_xlate = hisi_reset_of_xlate;
 	reset_controller_register(&rstc->rcdev);
 
-- 
2.17.1

