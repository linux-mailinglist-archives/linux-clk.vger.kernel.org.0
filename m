Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC8162DD75E
	for <lists+linux-clk@lfdr.de>; Thu, 17 Dec 2020 19:14:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731213AbgLQSJ1 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 17 Dec 2020 13:09:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731128AbgLQSJW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Dec 2020 13:09:22 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C26AC0619DD;
        Thu, 17 Dec 2020 10:07:52 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id o13so36634335lfr.3;
        Thu, 17 Dec 2020 10:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AcH1FS/cY17dY1GS/AeJ9Cc6wg6/sJS1m+8NI+VLW6c=;
        b=A/eiWrTzy624Z6SUVpbBNu2n18qIJdY5Eb7ta7XoYimzF9bE9itZS3TwXefOcE0CwO
         VuLLv6FI+f5Tisz7MYHdpbsRVGTzVJI0+PSZWYZ0hbjRnsd/5JZBmTMQA40ME9yJZJJV
         2G7HlZGPklEWcsYRfdD0dH5i12hL+dCLLtkRCBkQw0w3eBS2p8ucEHB85Jtby/AcTmVA
         uAtgew++vYSM8SMj54+2UwVVMiYlrAQmnslILrkpRq2yKBLbZRNRdG8m6pjq9evQNTTx
         zjdgSA+2yT0D0q228HIWP7xI++hWpUzNn8NBp/6YsGm3ujIljxovE+HsNK2ug4boY0nm
         DkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AcH1FS/cY17dY1GS/AeJ9Cc6wg6/sJS1m+8NI+VLW6c=;
        b=d2cKGKA6UZ21XBgoOUsiv/+cYf6dViX1j8NI0gHxOqhLdLZdCqSTsm1h9cQogz5Tc0
         dkWW4P/zIBQkttWurTK/ka/tD/Z5oPZaEc83iBrh8XXe4RzQbCOMl6h9xqqEqJo0C8Ij
         as0qwLevOF1eME5kfKg6olrTpWLyNXiM+57tiB96MhKcQ8cmXdyLDk9L/psD5myVP+1l
         9XEhcuFx9CeuvDA6gveXEp/hNOXECnGRPpivoWkdN0l0GDGBlnKXDEgph1q9Txo5BFjz
         e4EPpLCYmNmVepjKDCK0+eJ7vfrOMzkp+gGhPpizmyQPgwANKuwW52tnwNNmWqz3hDP9
         ShNQ==
X-Gm-Message-State: AOAM532+IbEoZ8jqClhCrIUmJ2E/QoJ3TvwXd7e86T1L6QODbiGcbJ8x
        cIqgM0q/3ZA11+/uErUUSJY=
X-Google-Smtp-Source: ABdhPJxDAKi/w9xlyE0C+sGYBCXZ9YXsrV/Esex76tZjt69/6MpbZ3TUi8oDE2wG4nj3u41A5rs3sw==
X-Received: by 2002:a05:6512:687:: with SMTP id t7mr14836899lfe.432.1608228471133;
        Thu, 17 Dec 2020 10:07:51 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:07:50 -0800 (PST)
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
Subject: [PATCH v2 27/48] soc/tegra: Add CONFIG_SOC_TEGRA_COMMON and select PM_OPP by default
Date:   Thu, 17 Dec 2020 21:06:17 +0300
Message-Id: <20201217180638.22748-28-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add new Kconfig SOC_TEGRA_COMMON option which selects configuration
options that are common for all Tegra SoCs. Select PM_OPP by default
since from now on OPPs will be used by Tegra drivers which present on
all SoC generations, like display controller driver for example.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/Kconfig | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
index 976dee036470..bcd61ae59ba3 100644
--- a/drivers/soc/tegra/Kconfig
+++ b/drivers/soc/tegra/Kconfig
@@ -13,6 +13,7 @@ config ARCH_TEGRA_2x_SOC
 	select PINCTRL_TEGRA20
 	select PL310_ERRATA_727915 if CACHE_L2X0
 	select PL310_ERRATA_769419 if CACHE_L2X0
+	select SOC_TEGRA_COMMON
 	select SOC_TEGRA_FLOWCTRL
 	select SOC_TEGRA_PMC
 	select SOC_TEGRA20_VOLTAGE_COUPLER
@@ -27,6 +28,7 @@ config ARCH_TEGRA_3x_SOC
 	select ARM_ERRATA_764369 if SMP
 	select PINCTRL_TEGRA30
 	select PL310_ERRATA_769419 if CACHE_L2X0
+	select SOC_TEGRA_COMMON
 	select SOC_TEGRA_FLOWCTRL
 	select SOC_TEGRA_PMC
 	select SOC_TEGRA30_VOLTAGE_COUPLER
@@ -40,6 +42,7 @@ config ARCH_TEGRA_114_SOC
 	select ARM_ERRATA_798181 if SMP
 	select HAVE_ARM_ARCH_TIMER
 	select PINCTRL_TEGRA114
+	select SOC_TEGRA_COMMON
 	select SOC_TEGRA_FLOWCTRL
 	select SOC_TEGRA_PMC
 	select TEGRA_TIMER
@@ -51,6 +54,7 @@ config ARCH_TEGRA_124_SOC
 	bool "Enable support for Tegra124 family"
 	select HAVE_ARM_ARCH_TIMER
 	select PINCTRL_TEGRA124
+	select SOC_TEGRA_COMMON
 	select SOC_TEGRA_FLOWCTRL
 	select SOC_TEGRA_PMC
 	select TEGRA_TIMER
@@ -66,6 +70,7 @@ if ARM64
 config ARCH_TEGRA_132_SOC
 	bool "NVIDIA Tegra132 SoC"
 	select PINCTRL_TEGRA124
+	select SOC_TEGRA_COMMON
 	select SOC_TEGRA_FLOWCTRL
 	select SOC_TEGRA_PMC
 	help
@@ -77,6 +82,7 @@ config ARCH_TEGRA_132_SOC
 config ARCH_TEGRA_210_SOC
 	bool "NVIDIA Tegra210 SoC"
 	select PINCTRL_TEGRA210
+	select SOC_TEGRA_COMMON
 	select SOC_TEGRA_FLOWCTRL
 	select SOC_TEGRA_PMC
 	select TEGRA_TIMER
@@ -99,6 +105,7 @@ config ARCH_TEGRA_186_SOC
 	select TEGRA_BPMP
 	select TEGRA_HSP_MBOX
 	select TEGRA_IVC
+	select SOC_TEGRA_COMMON
 	select SOC_TEGRA_PMC
 	help
 	  Enable support for the NVIDIA Tegar186 SoC. The Tegra186 features a
@@ -115,6 +122,7 @@ config ARCH_TEGRA_194_SOC
 	select TEGRA_BPMP
 	select TEGRA_HSP_MBOX
 	select TEGRA_IVC
+	select SOC_TEGRA_COMMON
 	select SOC_TEGRA_PMC
 	help
 	  Enable support for the NVIDIA Tegra194 SoC.
@@ -125,6 +133,7 @@ config ARCH_TEGRA_234_SOC
 	select TEGRA_BPMP
 	select TEGRA_HSP_MBOX
 	select TEGRA_IVC
+	select SOC_TEGRA_COMMON
 	select SOC_TEGRA_PMC
 	help
 	  Enable support for the NVIDIA Tegra234 SoC.
@@ -132,6 +141,10 @@ config ARCH_TEGRA_234_SOC
 endif
 endif
 
+config SOC_TEGRA_COMMON
+	bool
+	select PM_OPP
+
 config SOC_TEGRA_FUSE
 	def_bool y
 	depends on ARCH_TEGRA
-- 
2.29.2

