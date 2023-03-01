Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 124166A7399
	for <lists+linux-clk@lfdr.de>; Wed,  1 Mar 2023 19:38:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbjCASi1 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 1 Mar 2023 13:38:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229942AbjCASiZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Mar 2023 13:38:25 -0500
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C694C2D67;
        Wed,  1 Mar 2023 10:38:22 -0800 (PST)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
        by mx.sberdevices.ru (Postfix) with ESMTP id CA8F75FD78;
        Wed,  1 Mar 2023 21:38:19 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
        s=mail; t=1677695899;
        bh=Q7bkAuXQpSbuVUCgoDA0jmxc5cabY8gnRQJbhBQm3vk=;
        h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
        b=mfBF8sxL58ntXKDAqsxiPIc/8oNFQs4Z1+VOTFNlnXKfIg48oatqLrbMRXyGZ2yWa
         1f9t4c+wQi9S42RweMQBYSBdga2YGOXCPrbBodsAayY23p7q0JB46lCSjiN6M2TJC+
         e/4F1jkUrS3da4mZ2SYLfp/tAsTKessh+vPGFHR8j6ivWrPUBuhAUwn7bN6fpPScBC
         eOlE8NfJ3uJlweROJ8IhsdcxWS7i1pzJhzeL84qgvdwtXZBp4Eyz5IAWgwL/PrJmJV
         7jM2Qazaq5xdr8axfniQayauU80KjS7iU2sXa4puWQUoiqN5/jE7kd/UyGrp6bbV1f
         ih0rS+XNd4lIA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
        by mx.sberdevices.ru (Postfix) with ESMTP;
        Wed,  1 Mar 2023 21:38:17 +0300 (MSK)
From:   Dmitry Rokosov <ddrokosov@sberdevices.ru>
To:     <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <khilman@baylibre.com>, <martin.blumenstingl@googlemail.com>
CC:     <jian.hu@amlogic.com>, <kernel@sberdevices.ru>,
        <rockosov@gmail.com>, <linux-amlogic@lists.infradead.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Dmitry Rokosov <ddrokosov@sberdevices.ru>
Subject: [PATCH v9 0/5] add Amlogic A1 clock controller drivers
Date:   Wed, 1 Mar 2023 21:37:54 +0300
Message-ID: <20230301183759.16163-1-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/01 14:15:00 #20905952
X-KSMG-AntiVirus-Status: Clean, skipped
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

A1 SoC has four clock controllers on the board: PLL, Peripherals, CPU,
and Audio. The audio clock controller is different from others, but the
rest are very similar from a functional and regmap point of view.
This patch series add support for Amlogic A1 PLL and Peripherals clock
drivers.
It blocks all A1 peripherals mainline support and a couple of patch series,
which were already reviewed and acked, but weren't merged due to pending
clock controller drivers series, e.g.
https://lore.kernel.org/linux-amlogic/7hd09cw9oh.fsf@baylibre.com/

TODO: CPU and Audio clock controllers are not included in this patch
series, it will be sent later. The following clks from these controllers
are not supported for now:
* Audio clks - vad, mclk_vad, mclk_d, resample_a, locker_in, mclk_b,
   pdmdclk, pdmsysclk, eqdrc, spdifin, mclk_a, audio2_toaudiotop,
   audio2_tovad, audio2_toddr_vad, audio2_tdmin_vad, audio2_pdm,
   audio2_ddr_arb, audio_audiolocker, audio_eqdrc, audio_resamplea,
   audio_spdifin, audio_toddrb, audio_toddra, audio_frddrb, audio_frddra,
   audio_tdmoutb, audio_tdmouta, audio_loopbacka, audio_tdminlb,
   audio_tdminb, audio_tdmina, audio_ddr_arb, mclk_c

* CPU clks: cpu_fixed_source_sel0, cpu_fixed_source_div0,
            cpu_fixed_source_sel1, cpu_fixed_source_div1, cpu_clk

Validation:
* to double check all clk flags run below helper script:
    pushd /sys/kernel/debug/clk
    for f in *; do
        if [[ -f "$f/clk_flags" ]]; then
            flags="$(cat $f/clk_flags | awk '{$1=$1};1' | sed ':a;N;$!ba;s/\n/ | /g')"
            echo -e "$f: $flags"
        fi
    done
    popd
* to trace current clks state use '/sys/kernel/debug/clk/clk_dump' node
  with jq post-processing:
    cat /sys/kernel/debug/clk/clk_dump | jq '.' > clk_dump.json

Changes v9 since v8 at [9]:
    - remove common a1-clkc driver for the first version of a1 clock
      controllers as Jerome suggested (it will be discussed after s4 and
      a1 clks landed, hope so)
    - replace inherited a1-pll clk_pll_ops with common ops and
      introduce custom A1 PLL logic under MESON_PARM_APPLICABLE()
      conditions
    - rename xtal depended clocks in PLL and Peripherals domains
    - remove 'a1_' prefix for all clocks, because they are already
      inside A1 driver, it's redundant
    - change udelay() to usleep_range() as preferred for small msec
      amount
    - purge all double quotes from the yaml schemas
    - use proper dt node names following kernel guidelines
      https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
    - use devm_platform_ioremap_resource() instead of simple
      devm_ioremap_resource()
    - mark all dspX clocks as CLK_IGNORE_UNUSED, because we do not want
      to touch these clocks during CCF initialization due to possible
      workload execution on it started from bootloader; in this case
      bootloader already made all initialization stuff for dspX
    - also mark all dspX with NO_REPARENT tag, because from dspX clocks
      we want to select proper clk source from device tree

Changes v8 since v7 at [8]:
    - introduced a1-clkc common driver for all A1 clock controllers
    - exported meson_clk_pll_wait_lock symbol
    - supported meson-a1-clkc common driver in the a1-pll and a1 clkc
    - inherited a1-pll from the base clk-pll driver, implemented own
      version of init/enable/disable/enabled routines; rate calculating
      logic is fully the same
    - aligned CLKID-related definitions with CLKID list from order
      perspective to remove holes and permutations
    - corrected Kconfig dependencies and types
    - provided correct MODULE_AUTHORs()
    - optimized and fixed up some clock relationships
    - removed unused register offset definitions
    - fixed up A1 PLL and Peripherals clkc dtb_check errors
    - fixed clk_summary kernel panic due to missing a1_pad_ctrl
      clk_regmap definition
    - included PLL and Peripherals clk controllers to the base a1 dts
    - The previous v7 version [8] had several logic and style problems,
      all of them are resolved in this version. Original Jian Hu v7 patches
      are not touched, and all additional fixes are implemented in separate
      patches. Patch "clk: meson: add support for A1 PLL clock ops" is
      removed, because a1-pll clk driver inherits all stuff from clk-pll
      base driver, just implements custom init/enable/disable/is_enabled
      callbacks.

Changes v7 since v6 at [7]:
    - fix 'dt_binding_check' compiling error
    - add acked-by

Changes v6 since v5 at [6]:
    - fix yaml file
    - add rst/current_en/l_detect parm detection
    - remove 'meson_eeclkc_data' in a1.c and a1-pll.c

Changes v5 since v4 at [5]:
    - change yaml GPL
    - drop meson-eeclk.c patch, add probe function in each driver
    - add CLK_IS_CRITICAL for sys_clk clock, drop the flag for sys_a
      and sys_b
    - add new parm for pll, add protection for rst parm
    - drop flag for a1_fixed_pll
    - remove the same comment for fclk_div, add "refer to"
    - add critical flag for a1_sys_clk
    - remove rtc table
    - rename a1_dspa_en_dspa and a1_dspb_en_dspb
    - remove useless comment

Changes v4 since v3 at [3]:
    - fix reparenting orphan failed, it depends on jerome's patch [4]
    - fix changelist in v3 about reparenting orphan
    - remove the dts patch 

Changes v3 since v2 at [2]:
    - add probe function for A1
    - separate the clock driver into two patch
    - change some clock flags and ops
    - add support for a1 PLL ops
    - add A1 clock node
    - fix reparenting orphan clock failed, registering xtal_fixpll
      and xtal_hifipll after the provider registration, it is not
      a best way.

Changes v2 since v1 at [1]:
    - place A1 config alphabetically
    - add actual reason for RO ops, CLK_IS_CRITICAL, CLK_IGNORE_UNUSED
    - separate the driver into two driver: peripheral and pll driver
    - delete CLK_IGNORE_UNUSED flag for pwm b/c/d/e/f clock, dsp clock
    - delete the change in Kconfig.platforms, address to Kevin alone
    - remove the useless comments
    - modify the meson pll driver to support A1 PLLs

[1] https://lkml.kernel.org/r/1569411888-98116-1-git-send-email-jian.hu@amlogic.com
[2] https://lkml.kernel.org/r/1571382865-41978-1-git-send-email-jian.hu@amlogic.com
[3] https://lkml.kernel.org/r/20191129144605.182774-1-jian.hu@amlogic.com
[4] https://lkml.kernel.org/r/20191203080805.104628-1-jbrunet@baylibre.com
[5] https://lkml.kernel.org/r/20191206074052.15557-1-jian.hu@amlogic.com
[6] https://lkml.kernel.org/r/20191227094606.143637-1-jian.hu@amlogic.com
[7] https://lkml.kernel.org/r/20200116080440.118679-1-jian.hu@amlogic.com
[8] https://lore.kernel.org/linux-amlogic/20200120034937.128600-1-jian.hu@amlogic.com/
[9] https://lore.kernel.org/linux-amlogic/20221201225703.6507-1-ddrokosov@sberdevices.ru/

Dmitry Rokosov (4):
  clk: meson: a1: add Amlogic A1 PLL clock controller driver
  dt-bindings: clock: meson: add A1 PLL clock controller bindings
  clk: meson: a1: add Amlogic A1 Peripherals clock controller driver
  dt-bindings: clock: meson: add A1 Peripherals clock controller
    bindings

Jian Hu (1):
  clk: meson: add support for A1 PLL clock ops

 .../bindings/clock/amlogic,a1-clkc.yaml       |   73 +
 .../bindings/clock/amlogic,a1-pll-clkc.yaml   |   59 +
 MAINTAINERS                                   |    1 +
 drivers/clk/meson/Kconfig                     |   18 +
 drivers/clk/meson/Makefile                    |    2 +
 drivers/clk/meson/a1-pll.c                    |  365 +++
 drivers/clk/meson/a1-pll.h                    |   47 +
 drivers/clk/meson/a1.c                        | 2291 +++++++++++++++++
 drivers/clk/meson/a1.h                        |  116 +
 drivers/clk/meson/clk-pll.c                   |   47 +-
 drivers/clk/meson/clk-pll.h                   |    2 +
 include/dt-bindings/clock/a1-clkc.h           |  102 +
 include/dt-bindings/clock/a1-pll-clkc.h       |   20 +
 13 files changed, 3136 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
 create mode 100644 drivers/clk/meson/a1-pll.c
 create mode 100644 drivers/clk/meson/a1-pll.h
 create mode 100644 drivers/clk/meson/a1.c
 create mode 100644 drivers/clk/meson/a1.h
 create mode 100644 include/dt-bindings/clock/a1-clkc.h
 create mode 100644 include/dt-bindings/clock/a1-pll-clkc.h

-- 
2.36.0

