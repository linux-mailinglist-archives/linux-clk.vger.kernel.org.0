Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83DE03D4C2
	for <lists+linux-clk@lfdr.de>; Tue, 11 Jun 2019 19:58:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406771AbfFKR6x (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 11 Jun 2019 13:58:53 -0400
Received: from mx2.suse.de ([195.135.220.15]:59802 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2406765AbfFKR6w (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 11 Jun 2019 13:58:52 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 9685EABE1;
        Tue, 11 Jun 2019 17:58:50 +0000 (UTC)
From:   Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To:     stefan.wahren@i2se.com, linux-kernel@vger.kernel.org
Cc:     mbrugger@suse.de, viresh.kumar@linaro.org, rjw@rjwysocki.net,
        sboyd@kernel.org, eric@anholt.net, f.fainelli@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, ptesarik@suse.com,
        linux-rpi-kernel@lists.infradead.org, ssuloev@orpaltech.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        mturquette@baylibre.com, linux-pm@vger.kernel.org,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: [PATCH v3 0/7] cpufreq support for Raspberry Pi
Date:   Tue, 11 Jun 2019 19:58:32 +0200
Message-Id: <20190611175839.28351-1-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi all,
this aims at adding cpufreq support to the Raspberry Pi family of
boards.

The series first factors out 'pllb' from clk-bcm2385 and creates a new
clk driver that operates it over RPi's firmware interface[1]. We are
forced to do so as the firmware 'owns' the pll and we're not allowed to
change through the register interface directly as we might race with the
over-temperature and under-voltage protections provided by the firmware.

Next it creates a minimal cpufreq driver that populates the CPU's opp
table, and registers cpufreq-dt. Which is needed as the firmware
controls the max and min frequencies available.

This was tested on a RPi3b+ and RPI2b, both using multi_v7_defconfig and
arm64's defconfig.

That's all,
kind regards,
Nicolas

[1] https://github.com/raspberrypi/firmware/wiki/Mailbox-property-interface

---

Changes since v2:
  - Fixed configs to match Stefan's comments
  - Round OPP frequencies
  - Rebase onto linux-next
  - Minor cleanups & checkpatch.pl

Changes since v1:
  - Enabled by default on the whole family of devices
  - Added/Fixed module support
  - clk device now registered by firmware driver
  - raspberrypi-cpufreq device now registered by clk driver
  - Reimplemented clk rounding unsing determine_rate()
  - Enabled in configs for arm and arm64

Changes since RFC:
  - Move firmware clk device into own driver

Nicolas Saenz Julienne (7):
  clk: bcm2835: remove pllb
  clk: bcm283x: add driver interfacing with Raspberry Pi's firmware
  firmware: raspberrypi: register clk device
  cpufreq: add driver for Raspbery Pi
  clk: raspberrypi: register platform device for raspberrypi-cpufreq
  ARM: defconfig: enable cpufreq driver for RPi
  arm64: defconfig: enable cpufreq support for RPi3

 arch/arm/configs/bcm2835_defconfig    |   9 +
 arch/arm/configs/multi_v7_defconfig   |   2 +
 arch/arm64/configs/defconfig          |   2 +
 drivers/clk/bcm/Kconfig               |   7 +
 drivers/clk/bcm/Makefile              |   1 +
 drivers/clk/bcm/clk-bcm2835.c         |  28 +--
 drivers/clk/bcm/clk-raspberrypi.c     | 315 ++++++++++++++++++++++++++
 drivers/cpufreq/Kconfig.arm           |   8 +
 drivers/cpufreq/Makefile              |   1 +
 drivers/cpufreq/raspberrypi-cpufreq.c |  97 ++++++++
 drivers/firmware/raspberrypi.c        |  10 +
 11 files changed, 456 insertions(+), 24 deletions(-)
 create mode 100644 drivers/clk/bcm/clk-raspberrypi.c
 create mode 100644 drivers/cpufreq/raspberrypi-cpufreq.c

-- 
2.21.0

