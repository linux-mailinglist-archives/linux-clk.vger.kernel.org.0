Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 441362DD733
	for <lists+linux-clk@lfdr.de>; Thu, 17 Dec 2020 19:14:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730771AbgLQSJB (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 17 Dec 2020 13:09:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730712AbgLQSJA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Dec 2020 13:09:00 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF875C0619DE;
        Thu, 17 Dec 2020 10:07:53 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id a12so59838649lfl.6;
        Thu, 17 Dec 2020 10:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bHniUYIC3s+k3bu1Qnu+MOLqvOW7d/pOGBAO2KOC4eA=;
        b=uyTPt3dTAOtio3Q4NAJ4Z0YybbATSRHTCh8HpAY/Eu4LK4PUhsPlGKqW4dJnhb+IDP
         tW2Y1Q/Lll+p5BwmipqU1EzkYsJXtiQcqoOKiOXvdTX8EGyfDHXBhkVwvaSmMiyp7oHj
         AzoYD+oyTadKTv8y2n0hVlHEPKPgL7CQ7H5EitqIHdqwB+7vXmeSA20EExoZDou/rk8/
         3pszAgXm5Tr/JXw7+pzEp6uQinGjYJSFk2KpAvdUl/JA01IMqiubTo0hcAO+KuKl3FGn
         KhJHFzblBETwHb+X0VkTDTsdbUebrRCpSSajZUC0hLBVby5icXfuSLAkJ2AOMEw6szBz
         dEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bHniUYIC3s+k3bu1Qnu+MOLqvOW7d/pOGBAO2KOC4eA=;
        b=iji4sE0IX2Dboy6x16rdMWKKvFkX94psuhIcGdzJdFBhJGDiJuPVIAuzxXAaAMeeHV
         uDgpVUcNxhp6wTeN84MhUxgDQyCujY0Q3x7ZZ/N250dN3UKhGHBsmehfsxzDJJGUHLyy
         ISl3zzqIwKBRjjPM0o64lMm0wDMnJ5lJeNbmT/46Mvg9R9CMj13N4RxYo8skFXqrDW2B
         etPnr/08jDlFgVX831S+cX84ovpJYIrxMMVFL0cCNXB+ubH2LaJ7bs3bBysiSfajRsiv
         kH1ooc0DHT0acH7BDSf3MGlrSYp6iPEwjwCali7GmQb/mnzrcM7ZDU1siHJmjPiqF+zV
         a3OA==
X-Gm-Message-State: AOAM530cW5VZ99US85rywB57SvG0NBTsgcc4W2OpdBZcLoefnnu3lYEd
        6xBhehqiMR0AfsUPRWfRzf0=
X-Google-Smtp-Source: ABdhPJwV7p2vBwRldveNzj95D69TS6C2l85vxj9Rch0UjiklDD/asa0D4/HG83X80kUYfR0+2BJxCA==
X-Received: by 2002:a2e:b012:: with SMTP id y18mr212347ljk.396.1608228472293;
        Thu, 17 Dec 2020 10:07:52 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:07:51 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 28/48] soc/tegra: Introduce core power domain driver
Date:   Thu, 17 Dec 2020 21:06:18 +0300
Message-Id: <20201217180638.22748-29-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

NVIDIA Tegra SoCs have multiple power domains, each domain corresponds
to an external SoC power rail. Core power domain covers vast majority of
hardware blocks within a Tegra SoC. The voltage of a power domain should
be set to a value which satisfies all devices within a power domain. Add
driver for the core power domain in order to manage the voltage state of
the domain. This allows us to support a system-wide DVFS on Tegra.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/Kconfig             |   6 ++
 drivers/soc/tegra/Makefile            |   1 +
 drivers/soc/tegra/core-power-domain.c | 125 ++++++++++++++++++++++++++
 include/soc/tegra/common.h            |   6 ++
 4 files changed, 138 insertions(+)
 create mode 100644 drivers/soc/tegra/core-power-domain.c

diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
index bcd61ae59ba3..fccbc168dd87 100644
--- a/drivers/soc/tegra/Kconfig
+++ b/drivers/soc/tegra/Kconfig
@@ -16,6 +16,7 @@ config ARCH_TEGRA_2x_SOC
 	select SOC_TEGRA_COMMON
 	select SOC_TEGRA_FLOWCTRL
 	select SOC_TEGRA_PMC
+	select SOC_TEGRA_CORE_POWER_DOMAIN
 	select SOC_TEGRA20_VOLTAGE_COUPLER
 	select TEGRA_TIMER
 	help
@@ -31,6 +32,7 @@ config ARCH_TEGRA_3x_SOC
 	select SOC_TEGRA_COMMON
 	select SOC_TEGRA_FLOWCTRL
 	select SOC_TEGRA_PMC
+	select SOC_TEGRA_CORE_POWER_DOMAIN
 	select SOC_TEGRA30_VOLTAGE_COUPLER
 	select TEGRA_TIMER
 	help
@@ -170,3 +172,7 @@ config SOC_TEGRA20_VOLTAGE_COUPLER
 config SOC_TEGRA30_VOLTAGE_COUPLER
 	bool "Voltage scaling support for Tegra30 SoCs"
 	depends on ARCH_TEGRA_3x_SOC || COMPILE_TEST
+
+config SOC_TEGRA_CORE_POWER_DOMAIN
+	bool
+	select PM_GENERIC_DOMAINS
diff --git a/drivers/soc/tegra/Makefile b/drivers/soc/tegra/Makefile
index 9c809c1814bd..8f1294f954b4 100644
--- a/drivers/soc/tegra/Makefile
+++ b/drivers/soc/tegra/Makefile
@@ -7,3 +7,4 @@ obj-$(CONFIG_SOC_TEGRA_PMC) += pmc.o
 obj-$(CONFIG_SOC_TEGRA_POWERGATE_BPMP) += powergate-bpmp.o
 obj-$(CONFIG_SOC_TEGRA20_VOLTAGE_COUPLER) += regulators-tegra20.o
 obj-$(CONFIG_SOC_TEGRA30_VOLTAGE_COUPLER) += regulators-tegra30.o
+obj-$(CONFIG_SOC_TEGRA_CORE_POWER_DOMAIN) += core-power-domain.o
diff --git a/drivers/soc/tegra/core-power-domain.c b/drivers/soc/tegra/core-power-domain.c
new file mode 100644
index 000000000000..7c0cec8c79fd
--- /dev/null
+++ b/drivers/soc/tegra/core-power-domain.c
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * NVIDIA Tegra SoC Core Power Domain Driver
+ */
+
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_opp.h>
+#include <linux/slab.h>
+
+#include <soc/tegra/common.h>
+
+static struct lock_class_key tegra_core_domain_lock_class;
+static bool tegra_core_domain_state_synced;
+
+static int tegra_genpd_set_performance_state(struct generic_pm_domain *genpd,
+					     unsigned int level)
+{
+	struct dev_pm_opp *opp;
+	int err;
+
+	opp = dev_pm_opp_find_level_ceil(&genpd->dev, &level);
+	if (IS_ERR(opp)) {
+		dev_err(&genpd->dev, "failed to find OPP for level %u: %pe\n",
+			level, opp);
+		return PTR_ERR(opp);
+	}
+
+	err = dev_pm_opp_set_voltage(&genpd->dev, opp);
+	dev_pm_opp_put(opp);
+
+	if (err) {
+		dev_err(&genpd->dev, "failed to set voltage to %duV: %d\n",
+			level, err);
+		return err;
+	}
+
+	return 0;
+}
+
+static unsigned int
+tegra_genpd_opp_to_performance_state(struct generic_pm_domain *genpd,
+				     struct dev_pm_opp *opp)
+{
+	return dev_pm_opp_get_level(opp);
+}
+
+static int tegra_core_domain_probe(struct platform_device *pdev)
+{
+	struct generic_pm_domain *genpd;
+	struct opp_table *opp_table;
+	const char *rname = "power";
+	int err;
+
+	genpd = devm_kzalloc(&pdev->dev, sizeof(*genpd), GFP_KERNEL);
+	if (!genpd)
+		return -ENOMEM;
+
+	genpd->name = pdev->dev.of_node->name;
+	genpd->set_performance_state = tegra_genpd_set_performance_state;
+	genpd->opp_to_performance_state = tegra_genpd_opp_to_performance_state;
+
+	opp_table = devm_pm_opp_set_regulators(&pdev->dev, &rname, 1);
+	if (IS_ERR(opp_table))
+		return dev_err_probe(&pdev->dev, PTR_ERR(opp_table),
+				     "failed to set OPP regulator\n");
+
+	err = pm_genpd_init(genpd, NULL, false);
+	if (err) {
+		dev_err(&pdev->dev, "failed to init genpd: %d\n", err);
+		return err;
+	}
+
+	/*
+	 * We have a "PMC -> Core" hierarchy of the power domains where
+	 * PMC needs to resume and change performance (voltage) of the
+	 * Core domain from the PMC GENPD on/off callbacks, hence we need
+	 * to annotate the lock in order to remove confusion from the
+	 * lockdep checker when a nested access happens.
+	 */
+	lockdep_set_class(&genpd->mlock, &tegra_core_domain_lock_class);
+
+	err = of_genpd_add_provider_simple(pdev->dev.of_node, genpd);
+	if (err) {
+		dev_err(&pdev->dev, "failed to add genpd: %d\n", err);
+		goto remove_genpd;
+	}
+
+	return 0;
+
+remove_genpd:
+	pm_genpd_remove(genpd);
+
+	return err;
+}
+
+bool tegra_soc_core_domain_state_synced(void)
+{
+	return tegra_core_domain_state_synced;
+}
+
+static void tegra_core_domain_sync_state(struct device *dev)
+{
+	tegra_core_domain_state_synced = true;
+
+	dev_pm_opp_sync_regulators(dev);
+}
+
+static const struct of_device_id tegra_core_domain_match[] = {
+	{ .compatible = "nvidia,tegra20-core-domain", },
+	{ .compatible = "nvidia,tegra30-core-domain", },
+	{ }
+};
+
+static struct platform_driver tegra_core_domain_driver = {
+	.driver = {
+		.name = "tegra-core-power",
+		.of_match_table = tegra_core_domain_match,
+		.suppress_bind_attrs = true,
+		.sync_state = tegra_core_domain_sync_state,
+	},
+	.probe = tegra_core_domain_probe,
+};
+builtin_platform_driver(tegra_core_domain_driver);
diff --git a/include/soc/tegra/common.h b/include/soc/tegra/common.h
index 57b56793a9e5..6c2ccbbbf073 100644
--- a/include/soc/tegra/common.h
+++ b/include/soc/tegra/common.h
@@ -27,6 +27,7 @@ struct tegra_core_opp_params {
 
 #ifdef CONFIG_ARCH_TEGRA
 bool soc_is_tegra(void);
+bool tegra_soc_core_domain_state_synced(void);
 int devm_tegra_core_dev_init_opp_table(struct device *dev,
 				       struct tegra_core_opp_params *cfg);
 #else
@@ -35,6 +36,11 @@ static inline bool soc_is_tegra(void)
 	return false;
 }
 
+static inline bool tegra_soc_core_domain_state_synced(void)
+{
+	return false;
+}
+
 static inline int
 devm_tegra_core_dev_init_opp_table(struct device *dev,
 				   struct tegra_core_opp_params *cfg)
-- 
2.29.2

