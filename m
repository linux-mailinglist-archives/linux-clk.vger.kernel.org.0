Return-Path: <linux-clk+bounces-23167-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9897FADEB96
	for <lists+linux-clk@lfdr.de>; Wed, 18 Jun 2025 14:17:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E4BD1743FC
	for <lists+linux-clk@lfdr.de>; Wed, 18 Jun 2025 12:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 487B92E3B1B;
	Wed, 18 Jun 2025 12:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="YqJNPnLU"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCA32DFF28
	for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 12:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248902; cv=none; b=ix/ZDwTAIRZTAgCrdmpa0PznR3J6TCBYk/9Zhm7cSWRFqcNiaqpHj3Xx24F8DyLKt7fjGacAXq1WMY1emmPmh0DWdYlEOFF2iOzEoVOlOxmwUqRHt4V9sS80h/WDTTx3JOksqHtXc7NTmHYu7fWc93xF8ihFK1Wd7DC19BhLwy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248902; c=relaxed/simple;
	bh=115z1pTXXxT946hC2JDmyPKJdeuOWCSKp1HjxeLHuWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GP6MaNpgLcs04fo6G7s5MrElRZA3cLZnbc0tzJWQ+EwXDNWuP9DmtqBrA98ZZPMEH+3LdxrSrjZ3qel+WHP3ZgXHugYd0cCqmBWyyH1zrFPo6X4j8zx9IErc9xBZV6qx+cgLZvhacYl5KVe4et6e69ttOVOHJmQ68IgPu1aLCx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=YqJNPnLU; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso5734376b3a.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 05:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750248898; x=1750853698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wkfFwagA4Ur7x2+0SaDRm7VG4duXccUrfMB72AIUWQc=;
        b=YqJNPnLUVHYsjWqWLdfvb+aUkZxWdS907VbHMHI4fdBP32B94ki5YUVXV/dRXna4yv
         RCZ0noC/y1X04mSCt6LuPEmDp3zxrisXpZsPwEXwnX9Ybdv0BOyrbXXuCUDwDyiDSEZx
         WyfbbqCaeb9XbXWhGYOVNvsoHuLhqZmBnBMX57E6nZeaLulXzw7n8x8YElSPEApgvF8f
         gyT1FjJAK8Snn44bj2QrjkEvytW9Jo1in+8GLpw0WDs+d9nP5QscD6bAX0TbxXUnC66R
         6hnG5b+ARcRp6RvpQ/K0lyBF90GYeOzr08qvYdKsihH82z6HbFwc0fRnhV0vFPIeYRoM
         KlRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248898; x=1750853698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wkfFwagA4Ur7x2+0SaDRm7VG4duXccUrfMB72AIUWQc=;
        b=NW54QrFR1LmnJeC1iCXfTGGa7qsdhS2PyN9hlN6afklcQBn947tYfWkrSWjfD3Y4wV
         eus6+EvBWlMyUqEV8dQkO4JdwJP816BSVCxXZXjGddxne80ivT/NtOJXi/arf8/PvpYr
         I7Y0De1FDrADwpjbaB666nrCYY9/qjvFD8wznq74TfV/IgT8v4Qe3k5zS9rcltqCHhew
         26WAsfigtCiJvdMjaOqEHrdbVl8L5sPBiYI+qjYvTbBJq6zWYcWAUjXTPtpkxzJ44DgX
         d01+iIvXL73Vz5gxFz2rlRipQeDhqLmplDFkbMxBOmOtPHQ5uOmNPjrFn8Ioh/oUkGr8
         6Nhg==
X-Forwarded-Encrypted: i=1; AJvYcCVZwL6pLCXMmXpnTDP+1yM9mF2llFaaXyjV8vRdoEQ6bMch13kga3EeDyowDby3r9rZ1p1e5VLPW3M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyK2ZG56EMsRIhuqXo5ELGFe9T7sBWHbfvXuPEmAQfdlP8AtYtF
	2pHJWP1e/ycSqmAlhAM7nInMBo3q9W9NgMaK1G4CcCT3sjzc8nU07+fiDfyslTEFSNo=
X-Gm-Gg: ASbGncv2PKtyndJIP7nsLDyu1bspjYwQOMhZW3AqqUjYIPjZ9fLf7AYAa1D1Gih3ftI
	jDfiNtryolxbkfFz62Ub+FPtpdoa7zHffuUgsFw75xax4091vFMLHPIhx/IlbCNd8MgPf0EfE5l
	YR/1cVXY1jRiVVaefqkdWro4gnKllzig/YOIAb65NoAVcZ0V3TpB8KownbCZheiaD0kJFMGihe5
	9lRvqwzhVxUIzbVta3Ipt9lPS33uEwdbcqdvWdQ/cAn35EgKSWzuMuoeApCPBTMHjZ/bpQIvjh/
	csUiXw8hxJWEW4ScHcc6bPhDl/Yhj6RJ4WqzLH0oZg4Qe7/9CehXRrhlQEK+woSyugpUacWUuiu
	u59ZWe8OvK8bSTSsTjQ==
X-Google-Smtp-Source: AGHT+IH0wyg3jplUforDQ98lVCdk3NyNM8MpAgccygk4W/PFT18QngdHfPNSKseV5l6JKzH3qjOhXg==
X-Received: by 2002:a05:6a00:92a8:b0:742:a5f2:9c51 with SMTP id d2e1a72fcca58-7489cfeb010mr23697698b3a.16.1750248897717;
        Wed, 18 Jun 2025 05:14:57 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:14:57 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Len Brown <lenb@kernel.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v6 05/23] mailbox: Allow controller specific mapping using fwnode
Date: Wed, 18 Jun 2025 17:43:40 +0530
Message-ID: <20250618121358.503781-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618121358.503781-1-apatel@ventanamicro.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce optional fw_node() callback which allows a mailbox controller
driver to provide controller specific mapping using fwnode.

The Linux OF framework already implements fwnode operations for the
Linux DD framework so the fw_xlate() callback works fine with device
tree as well.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/mailbox/mailbox.c          | 65 ++++++++++++++++++------------
 include/linux/mailbox_controller.h |  3 ++
 2 files changed, 43 insertions(+), 25 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 5cd8ae222073..6a96cb6af8c1 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/property.h>
 #include <linux/spinlock.h>
 
 #include "mailbox.h"
@@ -383,34 +384,56 @@ EXPORT_SYMBOL_GPL(mbox_bind_client);
  */
 struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index)
 {
-	struct device *dev = cl->dev;
+	struct fwnode_reference_args fwspec;
+	struct fwnode_handle *fwnode;
 	struct mbox_controller *mbox;
 	struct of_phandle_args spec;
 	struct mbox_chan *chan;
+	struct device *dev;
+	unsigned int i;
 	int ret;
 
-	if (!dev || !dev->of_node) {
-		pr_debug("%s: No owner device node\n", __func__);
+	dev = cl->dev;
+	if (!dev) {
+		pr_debug("No owner device\n");
 		return ERR_PTR(-ENODEV);
 	}
 
-	ret = of_parse_phandle_with_args(dev->of_node, "mboxes", "#mbox-cells",
-					 index, &spec);
+	fwnode = dev_fwnode(dev);
+	if (!fwnode) {
+		dev_dbg(dev, "No owner fwnode\n");
+		return ERR_PTR(-ENODEV);
+	}
+
+	ret = fwnode_property_get_reference_args(dev_fwnode(dev), "mboxes",
+						 "#mbox-cells", 0, index, &fwspec);
 	if (ret) {
-		dev_err(dev, "%s: can't parse \"mboxes\" property\n", __func__);
+		dev_err(dev, "%s: can't parse \"%s\" property\n", __func__, "mboxes");
 		return ERR_PTR(ret);
 	}
 
+	spec.np = to_of_node(fwspec.fwnode);
+	spec.args_count = fwspec.nargs;
+	for (i = 0; i < spec.args_count; i++)
+		spec.args[i] = fwspec.args[i];
+
 	scoped_guard(mutex, &con_mutex) {
 		chan = ERR_PTR(-EPROBE_DEFER);
-		list_for_each_entry(mbox, &mbox_cons, node)
-			if (mbox->dev->of_node == spec.np) {
-				chan = mbox->of_xlate(mbox, &spec);
-				if (!IS_ERR(chan))
-					break;
+		list_for_each_entry(mbox, &mbox_cons, node) {
+			if (device_match_fwnode(mbox->dev, fwspec.fwnode)) {
+				if (mbox->fw_xlate) {
+					chan = mbox->fw_xlate(mbox, &fwspec);
+					if (!IS_ERR(chan))
+						break;
+				} else if (mbox->of_xlate) {
+					chan = mbox->of_xlate(mbox, &spec);
+					if (!IS_ERR(chan))
+						break;
+				}
 			}
+		}
 
-		of_node_put(spec.np);
+		fwnode_handle_put(fwspec.fwnode);
 
 		if (IS_ERR(chan))
 			return chan;
@@ -427,15 +450,8 @@ EXPORT_SYMBOL_GPL(mbox_request_channel);
 struct mbox_chan *mbox_request_channel_byname(struct mbox_client *cl,
 					      const char *name)
 {
-	struct device_node *np = cl->dev->of_node;
-	int index;
-
-	if (!np) {
-		dev_err(cl->dev, "%s() currently only supports DT\n", __func__);
-		return ERR_PTR(-EINVAL);
-	}
+	int index = device_property_match_string(cl->dev, "mbox-names", name);
 
-	index = of_property_match_string(np, "mbox-names", name);
 	if (index < 0) {
 		dev_err(cl->dev, "%s() could not locate channel named \"%s\"\n",
 			__func__, name);
@@ -470,9 +486,8 @@ void mbox_free_channel(struct mbox_chan *chan)
 }
 EXPORT_SYMBOL_GPL(mbox_free_channel);
 
-static struct mbox_chan *
-of_mbox_index_xlate(struct mbox_controller *mbox,
-		    const struct of_phandle_args *sp)
+static struct mbox_chan *fw_mbox_index_xlate(struct mbox_controller *mbox,
+					     const struct fwnode_reference_args *sp)
 {
 	int ind = sp->args[0];
 
@@ -523,8 +538,8 @@ int mbox_controller_register(struct mbox_controller *mbox)
 		spin_lock_init(&chan->lock);
 	}
 
-	if (!mbox->of_xlate)
-		mbox->of_xlate = of_mbox_index_xlate;
+	if (!mbox->fw_xlate && !mbox->of_xlate)
+		mbox->fw_xlate = fw_mbox_index_xlate;
 
 	scoped_guard(mutex, &con_mutex)
 		list_add_tail(&mbox->node, &mbox_cons);
diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
index ad01c4082358..80a427c7ca29 100644
--- a/include/linux/mailbox_controller.h
+++ b/include/linux/mailbox_controller.h
@@ -66,6 +66,7 @@ struct mbox_chan_ops {
  *			no interrupt rises. Ignored if 'txdone_irq' is set.
  * @txpoll_period:	If 'txdone_poll' is in effect, the API polls for
  *			last TX's status after these many millisecs
+ * @fw_xlate:		Controller driver specific mapping of channel via fwnode
  * @of_xlate:		Controller driver specific mapping of channel via DT
  * @poll_hrt:		API private. hrtimer used to poll for TXDONE on all
  *			channels.
@@ -79,6 +80,8 @@ struct mbox_controller {
 	bool txdone_irq;
 	bool txdone_poll;
 	unsigned txpoll_period;
+	struct mbox_chan *(*fw_xlate)(struct mbox_controller *mbox,
+				      const struct fwnode_reference_args *sp);
 	struct mbox_chan *(*of_xlate)(struct mbox_controller *mbox,
 				      const struct of_phandle_args *sp);
 	/* Internal to API */
-- 
2.43.0


