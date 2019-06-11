Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1D1B3D504
	for <lists+linux-clk@lfdr.de>; Tue, 11 Jun 2019 20:07:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406778AbfFKSHS (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 11 Jun 2019 14:07:18 -0400
Received: from mx2.suse.de ([195.135.220.15]:33932 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2406739AbfFKSHS (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 11 Jun 2019 14:07:18 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id D0194AD85;
        Tue, 11 Jun 2019 18:07:16 +0000 (UTC)
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     stefan.wahren@i2se.com, Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com
Cc:     mbrugger@suse.de, viresh.kumar@linaro.org, rjw@rjwysocki.net,
        sboyd@kernel.org, ptesarik@suse.com,
        linux-rpi-kernel@lists.infradead.org, ssuloev@orpaltech.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        mturquette@baylibre.com, linux-pm@vger.kernel.org,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Russell King <linux@armlinux.org.uk>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/7] ARM: defconfig: enable cpufreq driver for RPi
Date:   Tue, 11 Jun 2019 19:58:44 +0200
Message-Id: <20190611175839.28351-7-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190611175839.28351-1-nsaenzjulienne@suse.de>
References: <20190611175839.28351-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This enables on both multi_v7_defconfig and bcm2835_defconfig the new
firmware based clock and cpufreq drivers for the Raspberry Pi platform.

In the case of bcm2835_defconfig, as the cpufreq subsystem was disabled,
the conservative governor was selected as default since it better
handles the high frequency transition latency.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---

Changes since v2:
  - Change default governor to conservative in bcm2835_defconfig
  - Set all as builtin in bcm2835_defconfig

 arch/arm/configs/bcm2835_defconfig  | 9 +++++++++
 arch/arm/configs/multi_v7_defconfig | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm/configs/bcm2835_defconfig b/arch/arm/configs/bcm2835_defconfig
index dcf7610cfe55..519ff58e67b3 100644
--- a/arch/arm/configs/bcm2835_defconfig
+++ b/arch/arm/configs/bcm2835_defconfig
@@ -37,6 +37,14 @@ CONFIG_CMA=y
 CONFIG_SECCOMP=y
 CONFIG_KEXEC=y
 CONFIG_CRASH_DUMP=y
+CONFIG_CPU_FREQ=y
+CONFIG_CPU_FREQ_STAT=y
+CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE=y
+CONFIG_CPU_FREQ_GOV_POWERSAVE=y
+CONFIG_CPU_FREQ_GOV_USERSPACE=y
+CONFIG_CPU_FREQ_GOV_ONDEMAND=y
+CONFIG_CPUFREQ_DT=y
+CONFIG_ARM_RASPBERRYPI_CPUFREQ=y
 CONFIG_VFP=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 # CONFIG_SUSPEND is not set
@@ -132,6 +140,7 @@ CONFIG_DMA_BCM2835=y
 CONFIG_STAGING=y
 CONFIG_SND_BCM2835=m
 CONFIG_VIDEO_BCM2835=m
+CONFIG_CLK_RASPBERRYPI=y
 CONFIG_MAILBOX=y
 CONFIG_BCM2835_MBOX=y
 # CONFIG_IOMMU_SUPPORT is not set
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 6b748f214eae..0fd60a83f768 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -102,6 +102,7 @@ CONFIG_CPU_FREQ_GOV_CONSERVATIVE=m
 CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y
 CONFIG_CPUFREQ_DT=y
 CONFIG_ARM_IMX6Q_CPUFREQ=y
+CONFIG_ARM_RASPBERRYPI_CPUFREQ=y
 CONFIG_QORIQ_CPUFREQ=y
 CONFIG_CPU_IDLE=y
 CONFIG_ARM_CPUIDLE=y
@@ -899,6 +900,7 @@ CONFIG_STAGING_BOARD=y
 CONFIG_COMMON_CLK_MAX77686=y
 CONFIG_COMMON_CLK_RK808=m
 CONFIG_COMMON_CLK_S2MPS11=m
+CONFIG_CLK_RASPBERRYPI=y
 CONFIG_COMMON_CLK_QCOM=y
 CONFIG_QCOM_CLK_RPM=y
 CONFIG_APQ_MMCC_8084=y
-- 
2.21.0

