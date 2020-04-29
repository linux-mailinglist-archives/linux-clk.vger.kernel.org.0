Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18C4E1BE95A
	for <lists+linux-clk@lfdr.de>; Wed, 29 Apr 2020 22:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727123AbgD2U6t (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 29 Apr 2020 16:58:49 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37488 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727122AbgD2U6t (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Apr 2020 16:58:49 -0400
Received: by mail-ot1-f68.google.com with SMTP id z17so2992545oto.4;
        Wed, 29 Apr 2020 13:58:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wAYzoo9E1tE9/2iVETbtMyzd0WgUqutI/YsP481agIY=;
        b=i3Lzizl9eCcNwqzzw/qzoEvuMjgZsCyeqYyHnNX9D6uEs2KR/0olRlBZ6W+Za/JB7Z
         IAm/+zr8szknqlSCQQ0ANRIrP0TtbkaERazsKma6epC44S17ZH3Em395xHgbBH+f5lb4
         zEbDVVKBYT1UZuf5DNqdD+gg7DHIIIPSOfPF7uBvcI/8Z5esJfJjG3Pzbf7acIQaSM3/
         O9ZS1tQZWAe0FZWZLJy/kk2d87HABwYqWr4cetySjH/sfLCWHZvGU9c0nTbKf4nSGCIa
         NuWAVg72qdAcRK6jQWIUrNoWX5gVOnnagTE5Mj91uatEPdGGCuXkIrh5YMAzNxga1weV
         JLWA==
X-Gm-Message-State: AGi0PuYbZPJiztzN83pE4dbuuif1/SNON/FUltbW7QFzYSff2LOqH2hj
        U7weNqJcifgUNpCPhIbWxw==
X-Google-Smtp-Source: APiQypL6VMfh9STdhdq0lWJ41mOtjkhlel+T1nIUlLAUcZ1DqzRqoySLlrrZMv9KLPtPI0GvIu3yNg==
X-Received: by 2002:a9d:569:: with SMTP id 96mr2850246otw.59.1588193928178;
        Wed, 29 Apr 2020 13:58:48 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id z13sm653162oth.10.2020.04.29.13.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 13:58:47 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>
Cc:     Kevin Brodsky <Kevin.Brodsky@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lee Jones <lee.jones@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: [PATCH v2 14/16] vexpress: Move setting master site to vexpress-config bus
Date:   Wed, 29 Apr 2020 15:58:23 -0500
Message-Id: <20200429205825.10604-15-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200429205825.10604-1-robh@kernel.org>
References: <20200429205825.10604-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

There's only a single caller of vexpress_config_set_master() from
vexpress-sysreg.c. Let's just make the registers needed available to
vexpress-config and move all the code there. The registers needed aren't
used anywhere else either. With this, we can get rid of the private API
between these 2 drivers.

Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Acked-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
  - Reword subject
---
 drivers/bus/vexpress-config.c | 37 +++++++++++++++++++++++++++++++----
 drivers/mfd/vexpress-sysreg.c | 25 +----------------------
 include/linux/vexpress.h      |  9 ---------
 3 files changed, 34 insertions(+), 37 deletions(-)

diff --git a/drivers/bus/vexpress-config.c b/drivers/bus/vexpress-config.c
index 43deb4df140b..caa35a4cb34d 100644
--- a/drivers/bus/vexpress-config.c
+++ b/drivers/bus/vexpress-config.c
@@ -14,9 +14,17 @@
 #include <linux/slab.h>
 #include <linux/vexpress.h>
 
-#define SYS_CFGDATA		0x0
+#define SYS_MISC		0x0
+#define SYS_MISC_MASTERSITE	(1 << 14)
 
-#define SYS_CFGCTRL		0x4
+#define SYS_PROCID0		0x24
+#define SYS_PROCID1		0x28
+#define SYS_HBI_MASK		0xfff
+#define SYS_PROCIDx_HBI_SHIFT	0
+
+#define SYS_CFGDATA		0x40
+
+#define SYS_CFGCTRL		0x44
 #define SYS_CFGCTRL_START	(1 << 31)
 #define SYS_CFGCTRL_WRITE	(1 << 30)
 #define SYS_CFGCTRL_DCC(n)	(((n) & 0xf) << 26)
@@ -25,10 +33,14 @@
 #define SYS_CFGCTRL_POSITION(n)	(((n) & 0xf) << 12)
 #define SYS_CFGCTRL_DEVICE(n)	(((n) & 0xfff) << 0)
 
-#define SYS_CFGSTAT		0x8
+#define SYS_CFGSTAT		0x48
 #define SYS_CFGSTAT_ERR		(1 << 1)
 #define SYS_CFGSTAT_COMPLETE	(1 << 0)
 
+#define VEXPRESS_SITE_MB		0
+#define VEXPRESS_SITE_DB1		1
+#define VEXPRESS_SITE_DB2		2
+#define VEXPRESS_SITE_MASTER		0xf
 
 struct vexpress_syscfg {
 	struct device *dev;
@@ -59,7 +71,7 @@ static DEFINE_MUTEX(vexpress_config_mutex);
 static u32 vexpress_config_site_master = VEXPRESS_SITE_MASTER;
 
 
-void vexpress_config_set_master(u32 site)
+static void vexpress_config_set_master(u32 site)
 {
 	vexpress_config_site_master = site;
 }
@@ -340,6 +352,8 @@ static int vexpress_syscfg_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct vexpress_config_bridge *bridge;
 	struct device_node *node;
+	int master;
+	u32 dt_hbi;
 
 	syscfg = devm_kzalloc(&pdev->dev, sizeof(*syscfg), GFP_KERNEL);
 	if (!syscfg)
@@ -361,6 +375,21 @@ static int vexpress_syscfg_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(&pdev->dev, bridge);
 
+	master = readl(syscfg->base + SYS_MISC) & SYS_MISC_MASTERSITE ?
+			VEXPRESS_SITE_DB2 : VEXPRESS_SITE_DB1;
+	vexpress_config_set_master(master);
+
+	/* Confirm board type against DT property, if available */
+	if (of_property_read_u32(of_root, "arm,hbi", &dt_hbi) == 0) {
+		u32 id = readl(syscfg->base + (master == VEXPRESS_SITE_DB1 ?
+				 SYS_PROCID0 : SYS_PROCID1));
+		u32 hbi = (id >> SYS_PROCIDx_HBI_SHIFT) & SYS_HBI_MASK;
+
+		if (WARN_ON(dt_hbi != hbi))
+			dev_warn(&pdev->dev, "DT HBI (%x) is not matching hardware (%x)!\n",
+					dt_hbi, hbi);
+	}
+
 	for_each_compatible_node(node, NULL, "arm,vexpress,config-bus") {
 		struct device_node *bridge_np;
 
diff --git a/drivers/mfd/vexpress-sysreg.c b/drivers/mfd/vexpress-sysreg.c
index eeeeb1d26d5d..aaf24af287dd 100644
--- a/drivers/mfd/vexpress-sysreg.c
+++ b/drivers/mfd/vexpress-sysreg.c
@@ -14,7 +14,6 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/stat.h>
-#include <linux/vexpress.h>
 
 #define SYS_ID			0x000
 #define SYS_SW			0x004
@@ -37,11 +36,6 @@
 #define SYS_CFGCTRL		0x0a4
 #define SYS_CFGSTAT		0x0a8
 
-#define SYS_HBI_MASK		0xfff
-#define SYS_PROCIDx_HBI_SHIFT	0
-
-#define SYS_MISC_MASTERSITE	(1 << 14)
-
 /* The sysreg block is just a random collection of various functions... */
 
 static struct bgpio_pdata vexpress_sysreg_sys_led_pdata = {
@@ -94,7 +88,7 @@ static struct mfd_cell vexpress_sysreg_cells[] = {
 		.name = "vexpress-syscfg",
 		.num_resources = 1,
 		.resources = (struct resource []) {
-			DEFINE_RES_MEM(SYS_CFGDATA, 0xc),
+			DEFINE_RES_MEM(SYS_MISC, 0x4c),
 		},
 	}
 };
@@ -104,8 +98,6 @@ static int vexpress_sysreg_probe(struct platform_device *pdev)
 	struct resource *mem;
 	void __iomem *base;
 	struct gpio_chip *mmc_gpio_chip;
-	int master;
-	u32 dt_hbi;
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!mem)
@@ -115,21 +107,6 @@ static int vexpress_sysreg_probe(struct platform_device *pdev)
 	if (!base)
 		return -ENOMEM;
 
-	master = readl(base + SYS_MISC) & SYS_MISC_MASTERSITE ?
-			VEXPRESS_SITE_DB2 : VEXPRESS_SITE_DB1;
-	vexpress_config_set_master(master);
-
-	/* Confirm board type against DT property, if available */
-	if (of_property_read_u32(of_root, "arm,hbi", &dt_hbi) == 0) {
-		u32 id = readl(base + (master == VEXPRESS_SITE_DB1 ?
-				 SYS_PROCID0 : SYS_PROCID1));
-		u32 hbi = (id >> SYS_PROCIDx_HBI_SHIFT) & SYS_HBI_MASK;
-
-		if (WARN_ON(dt_hbi != hbi))
-			dev_warn(&pdev->dev, "DT HBI (%x) is not matching hardware (%x)!\n",
-					dt_hbi, hbi);
-	}
-
 	/*
 	 * Duplicated SYS_MCI pseudo-GPIO controller for compatibility with
 	 * older trees using sysreg node for MMC control lines.
diff --git a/include/linux/vexpress.h b/include/linux/vexpress.h
index 65096c792d57..2f9dd072f11f 100644
--- a/include/linux/vexpress.h
+++ b/include/linux/vexpress.h
@@ -10,15 +10,6 @@
 #include <linux/device.h>
 #include <linux/regmap.h>
 
-#define VEXPRESS_SITE_MB		0
-#define VEXPRESS_SITE_DB1		1
-#define VEXPRESS_SITE_DB2		2
-#define VEXPRESS_SITE_MASTER		0xf
-
-/* Config infrastructure */
-
-void vexpress_config_set_master(u32 site);
-
 /* Config regmap API */
 
 struct regmap *devm_regmap_init_vexpress_config(struct device *dev);
-- 
2.20.1

