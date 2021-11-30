Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74B4A46435A
	for <lists+linux-clk@lfdr.de>; Wed,  1 Dec 2021 00:30:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241238AbhK3XeB (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 30 Nov 2021 18:34:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345130AbhK3X1Y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 Nov 2021 18:27:24 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92162C061748;
        Tue, 30 Nov 2021 15:24:04 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id d11so44284665ljg.8;
        Tue, 30 Nov 2021 15:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o339Pud0WFJg4uNnef7+lPggeNBkDNi7xmFw3AiBijg=;
        b=plF7qXaJRR9S8fb6a/ziGnqTQoR1g8z2pg9/mrNDcq1ivCAT0OxClZtKMh8xC6pzMM
         HPutHkaOHwcKsKFz/X4R/roG+EZZogM8y4XEsM3XrEgEXXatP1m4BdhaC4kHfJMQrzmI
         l2ueZLzWEQWtcZr1/0+0loB7Zg/FyalVh6fy6MKu5xgmlvJbZ4F6AyFJ+YtoY/NJ/Iln
         17WBV5rvKQvIfDFBzJPRIKmuM/SC/zuP3V/GmgprTNiL5J2g+fqOAOeyXNuOj+ERNXoI
         VBJgSUzkuF4en171t4GpqNt/8sCg6PGC3yLmWsvFJFHw/y0ZjU7ot+U8cm5SJjT2yVvH
         4Cxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o339Pud0WFJg4uNnef7+lPggeNBkDNi7xmFw3AiBijg=;
        b=wywp2epWPI2GsDKcyo2EdKZegW374gpIIC6/zOmI+KYyANfLpaYv9dpOJa7lt/LaqL
         2D+96Nw7WbZEkPDCYdY97Ba0L3GGiA4cvHHCyMVtaU7d4FH38WAP/NmTElIYegIG2RrI
         IRutuR8VHynIciclHHttgE1hTAo+8MxSW6lvfA81lEcfbSWqMJ5ogDFbZMlVUHIXsq7P
         +gTwqVbc4TO5BMdgIthGZdT6krGn5O3BPPhQGN71V9iTS+79wfKJf2cFtCNIq+un6h/4
         oSwhDU9+dlE/awtNO9HfW0nmFUOjwUXhntKP/xoBNwKUHdUliggxZNhUJ7+l+yK2eSmb
         OT7g==
X-Gm-Message-State: AOAM532fF3Cxajsrb9Tj1NcusgWtjUmckXQGFyVeEZa1sLecE/+VbgWp
        pnAm2SWVyVSxPJisGZ/8TbY=
X-Google-Smtp-Source: ABdhPJz2X+AxLZTO+9sUOUuyMgPhDL5wGCcWkklRPooganG6O4hUuakoaG2dfpbcf2lfYyKjkcAOpg==
X-Received: by 2002:a2e:8101:: with SMTP id d1mr1877930ljg.379.1638314642894;
        Tue, 30 Nov 2021 15:24:02 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.gmail.com with ESMTPSA id x199sm1860735lff.284.2021.11.30.15.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 15:24:02 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Nishanth Menon <nm@ti.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-mmc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-clk@vger.kernel.org, David Heidelberg <david@ixit.cz>
Subject: [PATCH v16 08/40] gpu: host1x: Add initial runtime PM and OPP support
Date:   Wed,  1 Dec 2021 02:23:15 +0300
Message-Id: <20211130232347.950-9-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211130232347.950-1-digetx@gmail.com>
References: <20211130232347.950-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add runtime PM and OPP support to the Host1x driver. For the starter we
will keep host1x always-on because dynamic power management require a major
refactoring of the driver code since lot's of code paths are missing the
RPM handling and we're going to remove some of these paths in the future.

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
Tested-by: Paul Fertser <fercerpav@gmail.com> # PAZ00 T20
Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/host1x/debug.c         |  15 +++
 drivers/gpu/host1x/dev.c           | 150 +++++++++++++++++++++++------
 drivers/gpu/host1x/dev.h           |   3 +-
 drivers/gpu/host1x/hw/channel_hw.c |  44 ++++-----
 drivers/gpu/host1x/intr.c          |   3 -
 drivers/gpu/host1x/syncpt.c        |   5 +-
 6 files changed, 164 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/host1x/debug.c b/drivers/gpu/host1x/debug.c
index 8a14880c61bb..18d9c8d206e3 100644
--- a/drivers/gpu/host1x/debug.c
+++ b/drivers/gpu/host1x/debug.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/debugfs.h>
+#include <linux/pm_runtime.h>
 #include <linux/seq_file.h>
 #include <linux/uaccess.h>
 
@@ -52,6 +53,11 @@ static int show_channel(struct host1x_channel *ch, void *data, bool show_fifo)
 {
 	struct host1x *m = dev_get_drvdata(ch->dev->parent);
 	struct output *o = data;
+	int err;
+
+	err = pm_runtime_resume_and_get(m->dev);
+	if (err < 0)
+		return err;
 
 	mutex_lock(&ch->cdma.lock);
 	mutex_lock(&debug_lock);
@@ -64,6 +70,8 @@ static int show_channel(struct host1x_channel *ch, void *data, bool show_fifo)
 	mutex_unlock(&debug_lock);
 	mutex_unlock(&ch->cdma.lock);
 
+	pm_runtime_put(m->dev);
+
 	return 0;
 }
 
@@ -71,9 +79,14 @@ static void show_syncpts(struct host1x *m, struct output *o)
 {
 	struct list_head *pos;
 	unsigned int i;
+	int err;
 
 	host1x_debug_output(o, "---- syncpts ----\n");
 
+	err = pm_runtime_resume_and_get(m->dev);
+	if (err < 0)
+		return;
+
 	for (i = 0; i < host1x_syncpt_nb_pts(m); i++) {
 		u32 max = host1x_syncpt_read_max(m->syncpt + i);
 		u32 min = host1x_syncpt_load(m->syncpt + i);
@@ -101,6 +114,8 @@ static void show_syncpts(struct host1x *m, struct output *o)
 					    base_val);
 	}
 
+	pm_runtime_put(m->dev);
+
 	host1x_debug_output(o, "\n");
 }
 
diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 3d4cabdbc78d..c42ab78327e7 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -6,14 +6,18 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/of.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
+#include <soc/tegra/common.h>
+
 #define CREATE_TRACE_POINTS
 #include <trace/events/host1x.h>
 #undef CREATE_TRACE_POINTS
@@ -208,6 +212,9 @@ static void host1x_setup_sid_table(struct host1x *host)
 	const struct host1x_info *info = host->info;
 	unsigned int i;
 
+	if (!info->has_hypervisor)
+		return;
+
 	for (i = 0; i < info->num_sid_entries; i++) {
 		const struct host1x_sid_entry *entry = &info->sid_table[i];
 
@@ -365,6 +372,27 @@ static void host1x_iommu_exit(struct host1x *host)
 	}
 }
 
+static int host1x_get_resets(struct host1x *host)
+{
+	int err;
+
+	host->resets[0].id = "mc";
+	host->resets[1].id = "host1x";
+	host->nresets = ARRAY_SIZE(host->resets);
+
+	err = devm_reset_control_bulk_get_optional_exclusive_released(
+				host->dev, host->nresets, host->resets);
+	if (err) {
+		dev_err(host->dev, "failed to get reset: %d\n", err);
+		return err;
+	}
+
+	if (WARN_ON(!host->resets[1].rstc))
+		return -ENOENT;
+
+	return 0;
+}
+
 static int host1x_probe(struct platform_device *pdev)
 {
 	struct host1x *host;
@@ -442,12 +470,9 @@ static int host1x_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	host->rst = devm_reset_control_get(&pdev->dev, "host1x");
-	if (IS_ERR(host->rst)) {
-		err = PTR_ERR(host->rst);
-		dev_err(&pdev->dev, "failed to get reset: %d\n", err);
+	err = host1x_get_resets(host);
+	if (err)
 		return err;
-	}
 
 	err = host1x_iommu_init(host);
 	if (err < 0) {
@@ -462,22 +487,10 @@ static int host1x_probe(struct platform_device *pdev)
 		goto iommu_exit;
 	}
 
-	err = clk_prepare_enable(host->clk);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to enable clock\n");
-		goto free_channels;
-	}
-
-	err = reset_control_deassert(host->rst);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to deassert reset: %d\n", err);
-		goto unprepare_disable;
-	}
-
 	err = host1x_syncpt_init(host);
 	if (err) {
 		dev_err(&pdev->dev, "failed to initialize syncpts\n");
-		goto reset_assert;
+		goto free_channels;
 	}
 
 	err = host1x_intr_init(host, syncpt_irq);
@@ -486,10 +499,18 @@ static int host1x_probe(struct platform_device *pdev)
 		goto deinit_syncpt;
 	}
 
-	host1x_debug_init(host);
+	pm_runtime_enable(&pdev->dev);
+
+	err = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
+	if (err)
+		goto pm_disable;
 
-	if (host->info->has_hypervisor)
-		host1x_setup_sid_table(host);
+	/* the driver's code isn't ready yet for the dynamic RPM */
+	err = pm_runtime_resume_and_get(&pdev->dev);
+	if (err)
+		goto pm_disable;
+
+	host1x_debug_init(host);
 
 	err = host1x_register(host);
 	if (err < 0)
@@ -505,13 +526,14 @@ static int host1x_probe(struct platform_device *pdev)
 	host1x_unregister(host);
 deinit_debugfs:
 	host1x_debug_deinit(host);
+
+	pm_runtime_put_sync_suspend(&pdev->dev);
+pm_disable:
+	pm_runtime_disable(&pdev->dev);
+
 	host1x_intr_deinit(host);
 deinit_syncpt:
 	host1x_syncpt_deinit(host);
-reset_assert:
-	reset_control_assert(host->rst);
-unprepare_disable:
-	clk_disable_unprepare(host->clk);
 free_channels:
 	host1x_channel_list_free(&host->channel_list);
 iommu_exit:
@@ -526,20 +548,94 @@ static int host1x_remove(struct platform_device *pdev)
 
 	host1x_unregister(host);
 	host1x_debug_deinit(host);
+
+	pm_runtime_force_suspend(&pdev->dev);
+
 	host1x_intr_deinit(host);
 	host1x_syncpt_deinit(host);
-	reset_control_assert(host->rst);
-	clk_disable_unprepare(host->clk);
 	host1x_iommu_exit(host);
 	host1x_bo_cache_destroy(&host->cache);
 
 	return 0;
 }
 
+static int __maybe_unused host1x_runtime_suspend(struct device *dev)
+{
+	struct host1x *host = dev_get_drvdata(dev);
+	int err;
+
+	host1x_intr_stop(host);
+	host1x_syncpt_save(host);
+
+	err = reset_control_bulk_assert(host->nresets, host->resets);
+	if (err) {
+		dev_err(dev, "failed to assert reset: %d\n", err);
+		goto resume_host1x;
+	}
+
+	usleep_range(1000, 2000);
+
+	clk_disable_unprepare(host->clk);
+	reset_control_bulk_release(host->nresets, host->resets);
+
+	return 0;
+
+resume_host1x:
+	host1x_setup_sid_table(host);
+	host1x_syncpt_restore(host);
+	host1x_intr_start(host);
+
+	return err;
+}
+
+static int __maybe_unused host1x_runtime_resume(struct device *dev)
+{
+	struct host1x *host = dev_get_drvdata(dev);
+	int err;
+
+	err = reset_control_bulk_acquire(host->nresets, host->resets);
+	if (err) {
+		dev_err(dev, "failed to acquire reset: %d\n", err);
+		return err;
+	}
+
+	err = clk_prepare_enable(host->clk);
+	if (err) {
+		dev_err(dev, "failed to enable clock: %d\n", err);
+		goto release_reset;
+	}
+
+	err = reset_control_bulk_deassert(host->nresets, host->resets);
+	if (err < 0) {
+		dev_err(dev, "failed to deassert reset: %d\n", err);
+		goto disable_clk;
+	}
+
+	host1x_setup_sid_table(host);
+	host1x_syncpt_restore(host);
+	host1x_intr_start(host);
+
+	return 0;
+
+disable_clk:
+	clk_disable_unprepare(host->clk);
+release_reset:
+	reset_control_bulk_release(host->nresets, host->resets);
+
+	return err;
+}
+
+static const struct dev_pm_ops host1x_pm = {
+	SET_RUNTIME_PM_OPS(host1x_runtime_suspend, host1x_runtime_resume,
+			   NULL)
+	/* TODO: add system suspend-resume once driver will be ready for that */
+};
+
 static struct platform_driver tegra_host1x_driver = {
 	.driver = {
 		.name = "tegra-host1x",
 		.of_match_table = host1x_of_match,
+		.pm = &host1x_pm,
 	},
 	.probe = host1x_probe,
 	.remove = host1x_remove,
diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
index 5b7fdea5d169..ca4b082f0cd4 100644
--- a/drivers/gpu/host1x/dev.h
+++ b/drivers/gpu/host1x/dev.h
@@ -118,7 +118,8 @@ struct host1x {
 	struct host1x_syncpt_base *bases;
 	struct device *dev;
 	struct clk *clk;
-	struct reset_control *rst;
+	struct reset_control_bulk_data resets[2];
+	unsigned int nresets;
 
 	struct iommu_group *group;
 	struct iommu_domain *domain;
diff --git a/drivers/gpu/host1x/hw/channel_hw.c b/drivers/gpu/host1x/hw/channel_hw.c
index 1999780a7203..6b40e9af1e88 100644
--- a/drivers/gpu/host1x/hw/channel_hw.c
+++ b/drivers/gpu/host1x/hw/channel_hw.c
@@ -159,6 +159,27 @@ static void host1x_channel_set_streamid(struct host1x_channel *channel)
 #endif
 }
 
+static void host1x_enable_gather_filter(struct host1x_channel *ch)
+{
+#if HOST1X_HW >= 6
+	struct host1x *host = dev_get_drvdata(ch->dev->parent);
+	u32 val;
+
+	if (!host->hv_regs)
+		return;
+
+	val = host1x_hypervisor_readl(
+		host, HOST1X_HV_CH_KERNEL_FILTER_GBUFFER(ch->id / 32));
+	val |= BIT(ch->id % 32);
+	host1x_hypervisor_writel(
+		host, val, HOST1X_HV_CH_KERNEL_FILTER_GBUFFER(ch->id / 32));
+#elif HOST1X_HW >= 4
+	host1x_ch_writel(ch,
+			 HOST1X_CHANNEL_CHANNELCTRL_KERNEL_FILTER_GBUFFER(1),
+			 HOST1X_CHANNEL_CHANNELCTRL);
+#endif
+}
+
 static int channel_submit(struct host1x_job *job)
 {
 	struct host1x_channel *ch = job->channel;
@@ -190,6 +211,7 @@ static int channel_submit(struct host1x_job *job)
 	}
 
 	host1x_channel_set_streamid(ch);
+	host1x_enable_gather_filter(ch);
 
 	/* begin a CDMA submit */
 	err = host1x_cdma_begin(&ch->cdma, job);
@@ -249,27 +271,6 @@ static int channel_submit(struct host1x_job *job)
 	return err;
 }
 
-static void enable_gather_filter(struct host1x *host,
-				 struct host1x_channel *ch)
-{
-#if HOST1X_HW >= 6
-	u32 val;
-
-	if (!host->hv_regs)
-		return;
-
-	val = host1x_hypervisor_readl(
-		host, HOST1X_HV_CH_KERNEL_FILTER_GBUFFER(ch->id / 32));
-	val |= BIT(ch->id % 32);
-	host1x_hypervisor_writel(
-		host, val, HOST1X_HV_CH_KERNEL_FILTER_GBUFFER(ch->id / 32));
-#elif HOST1X_HW >= 4
-	host1x_ch_writel(ch,
-			 HOST1X_CHANNEL_CHANNELCTRL_KERNEL_FILTER_GBUFFER(1),
-			 HOST1X_CHANNEL_CHANNELCTRL);
-#endif
-}
-
 static int host1x_channel_init(struct host1x_channel *ch, struct host1x *dev,
 			       unsigned int index)
 {
@@ -278,7 +279,6 @@ static int host1x_channel_init(struct host1x_channel *ch, struct host1x *dev,
 #else
 	ch->regs = dev->regs + index * 0x100;
 #endif
-	enable_gather_filter(dev, ch);
 	return 0;
 }
 
diff --git a/drivers/gpu/host1x/intr.c b/drivers/gpu/host1x/intr.c
index 45b6be927ec4..965ba21818b1 100644
--- a/drivers/gpu/host1x/intr.c
+++ b/drivers/gpu/host1x/intr.c
@@ -297,14 +297,11 @@ int host1x_intr_init(struct host1x *host, unsigned int irq_sync)
 			 "host1x_sp_%02u", id);
 	}
 
-	host1x_intr_start(host);
-
 	return 0;
 }
 
 void host1x_intr_deinit(struct host1x *host)
 {
-	host1x_intr_stop(host);
 }
 
 void host1x_intr_start(struct host1x *host)
diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
index d198a10848c6..e08e331e46ae 100644
--- a/drivers/gpu/host1x/syncpt.c
+++ b/drivers/gpu/host1x/syncpt.c
@@ -143,6 +143,8 @@ void host1x_syncpt_restore(struct host1x *host)
 	for (i = 0; i < host1x_syncpt_nb_bases(host); i++)
 		host1x_hw_syncpt_restore_wait_base(host, sp_base + i);
 
+	host1x_hw_syncpt_enable_protection(host);
+
 	wmb();
 }
 
@@ -366,9 +368,6 @@ int host1x_syncpt_init(struct host1x *host)
 	host->syncpt = syncpt;
 	host->bases = bases;
 
-	host1x_syncpt_restore(host);
-	host1x_hw_syncpt_enable_protection(host);
-
 	/* Allocate sync point to use for clearing waits for expired fences */
 	host->nop_sp = host1x_syncpt_alloc(host, 0, "reserved-nop");
 	if (!host->nop_sp)
-- 
2.33.1

