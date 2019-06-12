Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5449842E9A
	for <lists+linux-clk@lfdr.de>; Wed, 12 Jun 2019 20:26:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727249AbfFLSZk (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 12 Jun 2019 14:25:40 -0400
Received: from mx2.suse.de ([195.135.220.15]:35380 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727087AbfFLSZV (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 12 Jun 2019 14:25:21 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id B2C7DB01E;
        Wed, 12 Jun 2019 18:25:19 +0000 (UTC)
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     stefan.wahren@i2se.com, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     mbrugger@suse.de, sboyd@kernel.org, eric@anholt.net,
        f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        ptesarik@suse.com, linux-rpi-kernel@lists.infradead.org,
        ssuloev@orpaltech.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com,
        linux-pm@vger.kernel.org,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/7] cpufreq: add driver for Raspberry Pi
Date:   Wed, 12 Jun 2019 20:24:56 +0200
Message-Id: <20190612182500.4097-5-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190612182500.4097-1-nsaenzjulienne@suse.de>
References: <20190612182500.4097-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Raspberry Pi's firmware offers and interface though which update it's
performance requirements. It allows us to request for specific runtime
frequencies, which the firmware might or might not respect, depending on
the firmware configuration and thermals.

As the maximum and minimum frequencies are configurable in the firmware
there is no way to know in advance their values. So the Raspberry Pi
cpufreq driver queries them, builds an opp frequency table to then
launch cpufreq-dt.

Also, as the firmware interface might be configured as a module, making
the cpu clock unavailable during init, this implements a full fledged
driver, as opposed to most drivers registering cpufreq-dt, which only
make use of an init routine.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Acked-by: Eric Anholt <eric@anholt.net>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
---

Changes since v3:
  - Fix spelling error in commit's subject

Changes since v2:
  - Round OPP tables

Changes since v1:
  - Remove compatible checks
  - Add module support, now full fledged driver
  - Use NULL in clk_get()

 drivers/cpufreq/Kconfig.arm           |  8 +++
 drivers/cpufreq/Makefile              |  1 +
 drivers/cpufreq/raspberrypi-cpufreq.c | 97 +++++++++++++++++++++++++++
 3 files changed, 106 insertions(+)
 create mode 100644 drivers/cpufreq/raspberrypi-cpufreq.c

diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
index 6f65b7f05496..56c31a78c692 100644
--- a/drivers/cpufreq/Kconfig.arm
+++ b/drivers/cpufreq/Kconfig.arm
@@ -142,6 +142,14 @@ config ARM_QCOM_CPUFREQ_HW
 	  The driver implements the cpufreq interface for this HW engine.
 	  Say Y if you want to support CPUFreq HW.
 
+config ARM_RASPBERRYPI_CPUFREQ
+	tristate "Raspberry Pi cpufreq support"
+	depends on CLK_RASPBERRYPI || COMPILE_TEST
+	help
+	  This adds the CPUFreq driver for Raspberry Pi
+
+	  If in doubt, say N.
+
 config ARM_S3C_CPUFREQ
 	bool
 	help
diff --git a/drivers/cpufreq/Makefile b/drivers/cpufreq/Makefile
index 7bcda2273d0c..5a6c70d26c98 100644
--- a/drivers/cpufreq/Makefile
+++ b/drivers/cpufreq/Makefile
@@ -65,6 +65,7 @@ obj-$(CONFIG_ARM_PXA2xx_CPUFREQ)	+= pxa2xx-cpufreq.o
 obj-$(CONFIG_PXA3xx)			+= pxa3xx-cpufreq.o
 obj-$(CONFIG_ARM_QCOM_CPUFREQ_HW)	+= qcom-cpufreq-hw.o
 obj-$(CONFIG_ARM_QCOM_CPUFREQ_KRYO)	+= qcom-cpufreq-kryo.o
+obj-$(CONFIG_ARM_RASPBERRYPI_CPUFREQ) 	+= raspberrypi-cpufreq.o
 obj-$(CONFIG_ARM_S3C2410_CPUFREQ)	+= s3c2410-cpufreq.o
 obj-$(CONFIG_ARM_S3C2412_CPUFREQ)	+= s3c2412-cpufreq.o
 obj-$(CONFIG_ARM_S3C2416_CPUFREQ)	+= s3c2416-cpufreq.o
diff --git a/drivers/cpufreq/raspberrypi-cpufreq.c b/drivers/cpufreq/raspberrypi-cpufreq.c
new file mode 100644
index 000000000000..2bc7d9734272
--- /dev/null
+++ b/drivers/cpufreq/raspberrypi-cpufreq.c
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Raspberry Pi cpufreq driver
+ *
+ * Copyright (C) 2019, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
+ */
+
+#include <linux/clk.h>
+#include <linux/cpu.h>
+#include <linux/cpufreq.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_opp.h>
+
+#define RASPBERRYPI_FREQ_INTERVAL	100000000
+
+static struct platform_device *cpufreq_dt;
+
+static int raspberrypi_cpufreq_probe(struct platform_device *pdev)
+{
+	struct device *cpu_dev;
+	unsigned long min, max;
+	unsigned long rate;
+	struct clk *clk;
+	int ret;
+
+	cpu_dev = get_cpu_device(0);
+	if (!cpu_dev) {
+		pr_err("Cannot get CPU for cpufreq driver\n");
+		return -ENODEV;
+	}
+
+	clk = clk_get(cpu_dev, NULL);
+	if (IS_ERR(clk)) {
+		dev_err(cpu_dev, "Cannot get clock for CPU0\n");
+		return PTR_ERR(clk);
+	}
+
+	/*
+	 * The max and min frequencies are configurable in the Raspberry Pi
+	 * firmware, so we query them at runtime.
+	 */
+	min = roundup(clk_round_rate(clk, 0), RASPBERRYPI_FREQ_INTERVAL);
+	max = roundup(clk_round_rate(clk, ULONG_MAX), RASPBERRYPI_FREQ_INTERVAL);
+	clk_put(clk);
+
+	for (rate = min; rate <= max; rate += RASPBERRYPI_FREQ_INTERVAL) {
+		ret = dev_pm_opp_add(cpu_dev, rate, 0);
+		if (ret)
+			goto remove_opp;
+	}
+
+	cpufreq_dt = platform_device_register_simple("cpufreq-dt", -1, NULL, 0);
+	ret = PTR_ERR_OR_ZERO(cpufreq_dt);
+	if (ret) {
+		dev_err(cpu_dev, "Failed to create platform device, %d\n", ret);
+		goto remove_opp;
+	}
+
+	return 0;
+
+remove_opp:
+	dev_pm_opp_remove_all_dynamic(cpu_dev);
+
+	return ret;
+}
+
+static int raspberrypi_cpufreq_remove(struct platform_device *pdev)
+{
+	struct device *cpu_dev;
+
+	cpu_dev = get_cpu_device(0);
+	if (cpu_dev)
+		dev_pm_opp_remove_all_dynamic(cpu_dev);
+
+	platform_device_unregister(cpufreq_dt);
+
+	return 0;
+}
+
+/*
+ * Since the driver depends on clk-raspberrypi, which may return EPROBE_DEFER,
+ * all the activity is performed in the probe, which may be defered as well.
+ */
+static struct platform_driver raspberrypi_cpufreq_driver = {
+	.driver = {
+		.name = "raspberrypi-cpufreq",
+	},
+	.probe          = raspberrypi_cpufreq_probe,
+	.remove		= raspberrypi_cpufreq_remove,
+};
+module_platform_driver(raspberrypi_cpufreq_driver);
+
+MODULE_AUTHOR("Nicolas Saenz Julienne <nsaenzjulienne@suse.de");
+MODULE_DESCRIPTION("Raspberry Pi cpufreq driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:raspberrypi-cpufreq");
-- 
2.21.0

