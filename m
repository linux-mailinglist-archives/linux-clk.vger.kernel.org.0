Return-Path: <linux-clk+bounces-217-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 252D17EC53B
	for <lists+linux-clk@lfdr.de>; Wed, 15 Nov 2023 15:28:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD5D4281471
	for <lists+linux-clk@lfdr.de>; Wed, 15 Nov 2023 14:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 431DE2E633;
	Wed, 15 Nov 2023 14:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="GTiDcY7E"
X-Original-To: linux-clk@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8429C2E64B
	for <linux-clk@vger.kernel.org>; Wed, 15 Nov 2023 14:28:52 +0000 (UTC)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54D151A7
	for <linux-clk@vger.kernel.org>; Wed, 15 Nov 2023 06:28:50 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9f282203d06so124855166b.0
        for <linux-clk@vger.kernel.org>; Wed, 15 Nov 2023 06:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700058528; x=1700663328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7BLPZlgwgjU+FePQlHgbIPG2vCl4SCwWgBdjofWn3nU=;
        b=GTiDcY7Evokh/YNFmkHahykayS3MqmdOIxkeiWrCOmbH0IZfLiJvep+PxxjlGQl8qq
         MYL1YDlX6mltmD60ld79LLnbR6L2O3YkCer5qbEQa0n0fxnWZDEt/p7WlJsS3k5rFOtT
         T5ELGkn3DT44hR55koeZs03GSsn5GLs8utLTDPw41x1LaD9fLCIOmkD8ymYazKjDrBw9
         O9bVTS5mUvfdQcPkNZIOTtkywYDKZhj6CTz16qw4jJgcUbDS11DaxM2JqlDkeRTa/JId
         xZ9nua20tGDdOq8Ho9WOvxQjZQZGS+VBUiB08ViK8oYCphEHQxLaGFmqyasCJ2kgrovW
         EL5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700058528; x=1700663328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7BLPZlgwgjU+FePQlHgbIPG2vCl4SCwWgBdjofWn3nU=;
        b=TtwCIBeeMqDjt26ap34EMXx3H+i7875TYuckk736F3CP3MiS6nWaLJP+LKtTqxWRHw
         4m9Ql5LGc7o5OAgKRNIlaUn0rxTOEkHrbPkoGAIYWUlsvDx8nLBeH9lZ3inLLre7czgo
         xxbeQlqCtHZBFCBnUsMTniIIx+vTRPablLc/NGbaglBhxLB11kqAvEFXmbT0ZTEUPK4A
         r3jw5j1B1R4FY63HokNYDIOTWnYpq7EFqL3kjQVmcreT6ahsDebxZ6+vVPMMo/1K5Y9b
         NNhoid9hekmrFIxpweF0sNLMC/bUiB0bivHdYHshiqFaczNiNvWCQ+8EXF8F1JNycnsK
         Voeg==
X-Gm-Message-State: AOJu0YziT0j8/KX7cKX5P7JJS4wVON2XyCS8UNvg9MRj9Be3cJ7ugFLw
	ZepIRZzXGWh4pIYi4tBwpfC4+A==
X-Google-Smtp-Source: AGHT+IF1ZSqG8f1Zf5qwEMpfqdt3g/bOQBZ51KMUPdAwD12httJ7B1Tbtqe/CwwiAYcusAXO/YlahA==
X-Received: by 2002:a17:907:b9d5:b0:9be:705:d7d0 with SMTP id xa21-20020a170907b9d500b009be0705d7d0mr9460977ejc.0.1700058528710;
        Wed, 15 Nov 2023 06:28:48 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.119])
        by smtp.gmail.com with ESMTPSA id i11-20020a170906264b00b0099bd5d28dc4sm7186394ejc.195.2023.11.15.06.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 06:28:48 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: tglx@linutronix.de,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 8/9] irqchip/renesas-rzg2l: Add support for suspend to RAM
Date: Wed, 15 Nov 2023 16:27:48 +0200
Message-Id: <20231115142749.853106-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231115142749.853106-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231115142749.853106-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

irqchip-renesas-rzg2l driver is used on RZ/G3S SoC. RZ/G3S could go to deep
sleep states where power to different SoC's parts are cut off and RAM is
switched to self-refresh. The resume from these states is done with the
help of bootloader.

IA55 IRQ controller needs to be reconfigured when resuming from deep sleep
state. For this the IA55 registers are cached in suspend and restored in
resume.

The IA55 IRQ controller is connected to GPIO controller and GIC as follows:

                                      ┌──────────┐          ┌──────────┐
                                      │          │ SPIX     │          │
                                      │          ├─────────►│          │
                                      │          │          │          │
                                      │          │          │          │
              ┌────────┐IRQ0-7        │  IA55    │          │  GIC     │
 Pin0 ───────►│        ├─────────────►│          │          │          │
              │        │              │          │ PPIY     │          │
 ...          │  GPIO  │              │          ├─────────►│          │
              │        │GPIOINT0-127  │          │          │          │
 PinN ───────►│        ├─────────────►│          │          │          │
              └────────┘              └──────────┘          └──────────┘

where:
- Pin0 is the first GPIO controller pin
- PinN is the last GPIO controller pin
- SPIX is the SPI interrupt with identifier X
- PPIY is the PPI interrupt with identifier Y

Suspend/resume functionality was implemented with syscore_ops to be able
to cache/restore the registers after/before GPIO controller suspend/resume
was called. As suspend/resume function members of syscore_ops doesn't take
any argument, to be able to access the cache data structure and
controller's base address from within suspend/resume functions, the driver
private data structure was declared as static in file, named
rzg2l_irqc_data and driver has been adjusted accordingly for this.

Because IA55 IRQC is resumed before GPIO controller and different GPIO
pins could be in unwanted state for IA55 IRQC (e.g. HiZ) when IA55
reconfiguration is done on resume path, to avoid spurious interrupts
the IA55 resume configures only interrupt type on resume. The interrupt
enable operation will be done at the end of GPIO controller resume.
The interrupt type reconfiguration was kept in IA55 driver to minimize
the number of subsystems interactions on suspend/resume b/w GPIO and
IA55 drivers (as the IRQ reconfiguration from GPIO driver is done with
IRQ specific APIs).

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- improved commit description
- use uppercase letter after ":" in patch title
- implemented review comments: used tabs to align initialized structures
  members, use proper naming for driver's private data structure
- use local variable for controller's base address in suspend/resume
  functions 

 drivers/irqchip/irq-renesas-rzg2l.c | 68 +++++++++++++++++++++++------
 1 file changed, 55 insertions(+), 13 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 45b696db220f..bd0dd9fcd68a 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -18,6 +18,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/spinlock.h>
+#include <linux/syscore_ops.h>
 
 #define IRQC_IRQ_START			1
 #define IRQC_IRQ_COUNT			8
@@ -55,17 +56,29 @@
 #define TINT_EXTRACT_HWIRQ(x)		FIELD_GET(GENMASK(15, 0), (x))
 #define TINT_EXTRACT_GPIOINT(x)		FIELD_GET(GENMASK(31, 16), (x))
 
+/**
+ * struct rzg2l_irqc_reg_cache - registers cache (necessary for suspend/resume)
+ * @iitsr: IITSR register
+ * @titsr: TITSR registers
+ */
+struct rzg2l_irqc_reg_cache {
+	u32	iitsr;
+	u32	titsr[2];
+};
+
 /**
  * struct rzg2l_irqc_priv - IRQ controller private data structure
  * @base: controller's base address
  * @fwspec: IRQ firmware specific data
  * @lock: lock to protect concurrent access to hardware registers
+ * @cache: registers cache (necessary for suspend/resume)
  */
-struct rzg2l_irqc_priv {
+static struct rzg2l_irqc_priv {
 	void __iomem			*base;
 	struct irq_fwspec		fwspec[IRQC_NUM_IRQ];
 	raw_spinlock_t			lock;
-};
+	struct rzg2l_irqc_reg_cache	cache;
+} rzg2l_irqc_data;
 
 static struct rzg2l_irqc_priv *irq_data_to_priv(struct irq_data *data)
 {
@@ -246,6 +259,38 @@ static int rzg2l_irqc_set_type(struct irq_data *d, unsigned int type)
 	return irq_chip_set_type_parent(d, IRQ_TYPE_LEVEL_HIGH);
 }
 
+static int rzg2l_irqc_irq_suspend(void)
+{
+	struct rzg2l_irqc_reg_cache *cache = &rzg2l_irqc_data.cache;
+	void __iomem *base = rzg2l_irqc_data.base;
+
+	cache->iitsr = readl_relaxed(base + IITSR);
+	for (u8 i = 0; i < 2; i++)
+		cache->titsr[i] = readl_relaxed(base + TITSR(i));
+
+	return 0;
+}
+
+static void rzg2l_irqc_irq_resume(void)
+{
+	struct rzg2l_irqc_reg_cache *cache = &rzg2l_irqc_data.cache;
+	void __iomem *base = rzg2l_irqc_data.base;
+
+	/*
+	 * Restore only interrupt type. TSSRx will be restored at the
+	 * request of pin controller to avoid spurious interrupts due
+	 * to invalid PIN states.
+	 */
+	for (u8 i = 0; i < 2; i++)
+		writel_relaxed(cache->titsr[i], base + TITSR(i));
+	writel_relaxed(cache->iitsr, base + IITSR);
+}
+
+static struct syscore_ops rzg2l_irqc_syscore_ops = {
+	.suspend	= rzg2l_irqc_irq_suspend,
+	.resume		= rzg2l_irqc_irq_resume,
+};
+
 static const struct irq_chip irqc_chip = {
 	.name			= "rzg2l-irqc",
 	.irq_eoi		= rzg2l_irqc_eoi,
@@ -331,7 +376,6 @@ static int rzg2l_irqc_init(struct device_node *node, struct device_node *parent)
 	struct irq_domain *irq_domain, *parent_domain;
 	struct platform_device *pdev;
 	struct reset_control *resetn;
-	struct rzg2l_irqc_priv *priv;
 	int ret;
 
 	pdev = of_find_device_by_node(node);
@@ -344,15 +388,11 @@ static int rzg2l_irqc_init(struct device_node *node, struct device_node *parent)
 		return -ENODEV;
 	}
 
-	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
+	rzg2l_irqc_data.base = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 0, NULL);
+	if (IS_ERR(rzg2l_irqc_data.base))
+		return PTR_ERR(rzg2l_irqc_data.base);
 
-	priv->base = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 0, NULL);
-	if (IS_ERR(priv->base))
-		return PTR_ERR(priv->base);
-
-	ret = rzg2l_irqc_parse_interrupts(priv, node);
+	ret = rzg2l_irqc_parse_interrupts(&rzg2l_irqc_data, node);
 	if (ret) {
 		dev_err(&pdev->dev, "cannot parse interrupts: %d\n", ret);
 		return ret;
@@ -375,17 +415,19 @@ static int rzg2l_irqc_init(struct device_node *node, struct device_node *parent)
 		goto pm_disable;
 	}
 
-	raw_spin_lock_init(&priv->lock);
+	raw_spin_lock_init(&rzg2l_irqc_data.lock);
 
 	irq_domain = irq_domain_add_hierarchy(parent_domain, 0, IRQC_NUM_IRQ,
 					      node, &rzg2l_irqc_domain_ops,
-					      priv);
+					      &rzg2l_irqc_data);
 	if (!irq_domain) {
 		dev_err(&pdev->dev, "failed to add irq domain\n");
 		ret = -ENOMEM;
 		goto pm_put;
 	}
 
+	register_syscore_ops(&rzg2l_irqc_syscore_ops);
+
 	return 0;
 
 pm_put:
-- 
2.39.2


