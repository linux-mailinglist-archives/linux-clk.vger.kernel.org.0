Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B53D64D4128
	for <lists+linux-clk@lfdr.de>; Thu, 10 Mar 2022 07:33:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239783AbiCJGdm (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 10 Mar 2022 01:33:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239826AbiCJGdk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 10 Mar 2022 01:33:40 -0500
Received: from mx1.cqplus1.com (unknown [113.204.237.245])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EC27820185
        for <linux-clk@vger.kernel.org>; Wed,  9 Mar 2022 22:32:28 -0800 (PST)
X-MailGates: (flag:4,DYNAMIC,BADHELO,RELAY,NOHOST:PASS)(compute_score:DE
        LIVER,40,3)
Received: from 172.28.114.216
        by mx1.cqplus1.com with MailGates ESMTP Server V5.0(26038:0:AUTH_RELAY)
        (envelope-from <qinjian@cqplus1.com>); Thu, 10 Mar 2022 14:29:01 +0800 (CST)
From:   Qin Jian <qinjian@cqplus1.com>
To:     robh+dt@kernel.org
Cc:     krzk@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        tglx@linutronix.de, maz@kernel.org, p.zabel@pengutronix.de,
        linux@armlinux.org.uk, broonie@kernel.org, arnd@arndb.de,
        stefan.wahren@i2se.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, Qin Jian <qinjian@cqplus1.com>
Subject: [PATCH v10 10/10] ARM: sp7021_defconfig: Add Sunplus SP7021 defconfig
Date:   Thu, 10 Mar 2022 14:28:49 +0800
Message-Id: <5a50d0eeab42823bc0fe4a51ff762f0b15fe1556.1646892811.git.qinjian@cqplus1.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1646892810.git.qinjian@cqplus1.com>
References: <cover.1646892810.git.qinjian@cqplus1.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add generic Sunplus SP7021 based board defconfig

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Qin Jian <qinjian@cqplus1.com>
---
 MAINTAINERS                         |  1 +
 arch/arm/configs/multi_v7_defconfig |  1 +
 arch/arm/configs/sp7021_defconfig   | 61 +++++++++++++++++++++++++++++
 3 files changed, 63 insertions(+)
 create mode 100644 arch/arm/configs/sp7021_defconfig

diff --git a/MAINTAINERS b/MAINTAINERS
index 0ae537a41..9340f8760 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2664,6 +2664,7 @@ F:	Documentation/devicetree/bindings/arm/sunplus,sp7021.yaml
 F:	Documentation/devicetree/bindings/clock/sunplus,sp7021-clkc.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/sunplus,sp7021-intc.yaml
 F:	Documentation/devicetree/bindings/reset/sunplus,reset.yaml
+F:	arch/arm/configs/sp7021_*defconfig
 F:	arch/arm/mach-sunplus/
 F:	drivers/clk/clk-sp7021.c
 F:	drivers/irqchip/irq-sp7021-intc.c
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index b4f74454f..585e3b5d3 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -87,6 +87,7 @@ CONFIG_MACH_SPEAR1310=y
 CONFIG_MACH_SPEAR1340=y
 CONFIG_ARCH_STI=y
 CONFIG_ARCH_STM32=y
+CONFIG_ARCH_SUNPLUS=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_TEGRA=y
 CONFIG_ARCH_UNIPHIER=y
diff --git a/arch/arm/configs/sp7021_defconfig b/arch/arm/configs/sp7021_defconfig
new file mode 100644
index 000000000..cda16d33a
--- /dev/null
+++ b/arch/arm/configs/sp7021_defconfig
@@ -0,0 +1,61 @@
+CONFIG_SYSVIPC=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_PREEMPT=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=14
+# CONFIG_RD_GZIP is not set
+# CONFIG_RD_BZIP2 is not set
+# CONFIG_RD_LZMA is not set
+# CONFIG_RD_XZ is not set
+# CONFIG_RD_LZO is not set
+# CONFIG_RD_LZ4 is not set
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_PERF_EVENTS=y
+CONFIG_SLAB=y
+CONFIG_ARCH_SUNPLUS=y
+# CONFIG_VDSO is not set
+CONFIG_SMP=y
+CONFIG_HAVE_ARM_ARCH_TIMER=y
+CONFIG_THUMB2_KERNEL=y
+CONFIG_FORCE_MAX_ZONEORDER=12
+CONFIG_VFP=y
+CONFIG_NEON=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODVERSIONS=y
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_UEVENT_HELPER=y
+CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_INPUT_SPARSEKMAP=y
+CONFIG_INPUT_EVDEV=y
+# CONFIG_INPUT_KEYBOARD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_HW_RANDOM is not set
+# CONFIG_HWMON is not set
+CONFIG_STAGING=y
+# CONFIG_IOMMU_SUPPORT is not set
+CONFIG_RESET_CONTROLLER=y
+CONFIG_EXT4_FS=y
+# CONFIG_DNOTIFY is not set
+CONFIG_FANOTIFY=y
+CONFIG_VFAT_FS=y
+CONFIG_FAT_DEFAULT_IOCHARSET="utf8"
+CONFIG_EXFAT_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+# CONFIG_MISC_FILESYSTEMS is not set
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ASCII=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_NLS_UTF8=y
+CONFIG_PRINTK_TIME=y
+CONFIG_DYNAMIC_DEBUG=y
+CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_FS=y
+CONFIG_DEBUG_USER=y
-- 
2.33.1

