Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8C3D31D89B
	for <lists+linux-clk@lfdr.de>; Wed, 17 Feb 2021 12:44:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231672AbhBQLnM (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 17 Feb 2021 06:43:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231693AbhBQLkp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 Feb 2021 06:40:45 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E330C061574;
        Wed, 17 Feb 2021 03:40:05 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id r21so16989659wrr.9;
        Wed, 17 Feb 2021 03:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ht2u/94YW7KUsjTAWLC1lMxIPi46cNIzZ9TJcknhxlg=;
        b=SEVrzTIbV+nUahOO32EX4yDYzGgSeXqswDNAUjfkTDiwol1LuJFc7BwEkHqJUx0AZS
         EqWjfqnccay8zJUMQiuVQZJnf+BnucWiE/+K7EaScknotSKUX7CRPrTtavBfH8qaERkp
         GmA6npf2nBfUhbUxwNn1/fSD4jkoVkh6SZoIBNdDBKSgYLsE+WBr+wAT52d+ZFcokZ0p
         BwE+r/uaoMKANuPBKXs3IhVcmaYuufwxCWGxAqMqcS/KQr3W8QgQ7TunTIpRVRh0wgRd
         FApckiRalTWZ+kDJ+3Gguba5UWTS09NJWZa4bW6RsejNG9oVf4W+B5jyuymvDgrdYOw6
         UKvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ht2u/94YW7KUsjTAWLC1lMxIPi46cNIzZ9TJcknhxlg=;
        b=ufzl1xc+awPGhbPvrQIayX3ZC3xN5iXKSqVHUK1/QCA5qMFPnsXiUXn+cUOa4Hcexq
         HZyrhXly+EhENUBvRzDa7+BOrJuKw0CEk4eAV2GuD7W0nfgx4hPB3W+tg/8PKXaRhRpF
         m+SxZ0+FPz96rU3XDF/XJylX2+TKZudtROdCte1NaRS7SQgoZCjLpxvuxCQItf9W8VBE
         R5yC9dZMUY5rj0+dutCUa1CMeBgvgeRAWUk4Ebf4/kbbKZqD7ybgYPBQkmHr/r+S6PCb
         6RE4XDTPMowJ3kFBXt/sO6YZdkxbvf6Yk3DT4w91tSJdo7etJ10ddppuzryjiokNobxN
         hZVA==
X-Gm-Message-State: AOAM530T5EQuPkWv9MgDCu3LkixUvPdxabM6GdLE1cKT5AjG7iDCotkj
        0PceB20dbTEZ+iVtGkEh+gaAQcKNT/rkXA==
X-Google-Smtp-Source: ABdhPJxYZ71u3dJO4jcIc3yfK37rs57k4mqPnp2igt+SrocNarSJLMsmsJFGHAhZsvC+1Y1Uye2ABQ==
X-Received: by 2002:a5d:54ca:: with SMTP id x10mr28625958wrv.135.1613562003734;
        Wed, 17 Feb 2021 03:40:03 -0800 (PST)
Received: from localhost.localdomain (67.red-83-54-30.dynamicip.rima-tde.net. [83.54.30.67])
        by smtp.gmail.com with ESMTPSA id q140sm3600813wme.0.2021.02.17.03.40.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Feb 2021 03:40:03 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     sboyd@kernel.org
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        neil@brown.name
Subject: [PATCH v7 0/6] MIPS: ralink: add CPU clock detection and clock driver for MT7621
Date:   Wed, 17 Feb 2021 12:39:54 +0100
Message-Id: <20210217114000.19571-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patchset ports CPU clock detection for MT7621 from OpenWrt
and adds a complete clock plan for the mt7621 SOC.

The documentation for this SOC only talks about two registers
regarding to the clocks:
* SYSC_REG_CPLL_CLKCFG0 - provides some information about boostrapped
refclock. PLL and dividers used for CPU and some sort of BUS (AHB?).
* SYSC_REG_CPLL_CLKCFG1 - a banch of gates to enable/disable clocks for
all or some ip cores.

Registers needed for this driver to work are in two already mapped areas
in its platform's device tree. These are 'sysc' and 'memc' nodes. Most
of other drivers just make use of platform operations defined in
'asm/mach-ralink/ralink_regs.h' but this can be avoided declaring this
two nodes to be accesible through syscon. Since these are the only two
needed control interfaces for this clock driver that seems to be the
correct thing to do.

No documentation about a probably existent set of dividers for each ip
core is included in the datasheets. So we cannot make anything better,
AFAICT.

Looking into driver code, and some openWRT patched there are
another frequences which are used in some drivers (uart, sd...).
According to all of this information the clock plan for this
SoC is set as follows:
 - Main top clock "xtal" from where all the rest of the world is
   derived.
 - CPU clock "cpu" derived from "xtal" frequencies and a bunch of
   register reads and predividers.
 - BUS clock "bus" derived from "cpu" and with (cpu / 4) MHz.
 - Fixed clocks from "xtal":
    * "50m": 50 MHz.
    * "125m": 125 MHz.
    * "150m": 150 MHz.
    * "250m": 250 MHz.
    * "270m": 270 MHz.

We also have a buch of gate clocks with their parents:
 - "hsdma": "150m"
 - "fe": "250m"
 - "sp_divtx": "270m"
 - "timer": "50m"
 - "pcm": "270m"
 - "pio": "50m"
 - "gdma": "bus"
 - "nand": "125m"
 - "i2c": "50m"
 - "i2s": "270m"
 - "spi": "bus"
 - "uart1": "50m"
 - "uart2": "50m"
 - "uart3": "50m"
 - "eth": "50m"
 - "pcie0": "125m"
 - "pcie1": "125m"
 - "pcie2": "125m"
 - "crypto": "250m"
 - "shxc": "50m"

There was a previous attempt of doing this here[0] but the author
(Chuanhong Guo) did not wanted to make assumptions of a clock plan
for the platform that time. It seems that now he has a better idea of
how the clocks are dispossed for this SoC so he share code[1] where
some frequencies and clock parents for the gates are coded from a
real mediatek private clock plan.
                                                
I do really want this to be upstreamed so according to the comments
in previous attempt[0] from Oleksij Rempel and the frequencies in
code[1] I have tried to do this by myself.

All of this patches have been tested in a GNUBee PC1 resulting in a
working platform.

Changes in v7:
 - Make use of CLK_OF_DECLARE_DRIVER instead of CLK_OF_DECLARE and
   register there only the top clocks that are needed in 'of_clk_init'.
   The rest of the clocks (fixed and gates) are now registered using
   a platform driver. Because we have avoid architecture dependent stuff
   now this has sense because we can enable this driver for COMPILE_TEST.
 - Convert fixed clocks and gates related function to receive a 'struct
   device' pointer instead of 'struct device_node' one.
 - Make use of dev_ APIS in stuff related with platform driver instead
   of use device_node related stuff. 
 - Add new static global 'mt7621_clk_early' to store pointers to clk_hw
   registered at 'of_clk_init' stage. Make use of this in platform device
   probe function to properly copy this into the new required 'clk_data'
   to provide a properly hierarchy clock structure.
 - Rename 'mt7621_register_top_clocks' function into a more accurate 
   name now which is 'mt7621_register_early_clocks'.
 - Enable driver for COMPILE_TEST.

Changes in v6:
 - Rewrite bindings to properly access the registers needed for the driver
   making use of syscon for two different areas: 'sysc' and 'memc'. With
   this changes architecture dependent include 'asm/mach-ralink/ralink_regs.h'
   is not needed anymore because we access this two syscons using a phandle
   through kernel's regmap APIs. Explanation of this two areas is in [2].
 - Add new 'mt7621_clk_priv' struct to store there pointers to regmap handlers
   to be able to use regmap operations from normal clock api functions. Add
   this pointer in 'mt7621_clk' and 'mt7621_clk_gate' before register its
   related clocks to make things work.
 - Add Greg's Acked-by in patches 4 and 5.
 - Rebase this series on the top of linux-next tag 'next-20210215'.

v5 RESEND notes:
 - I am resending this as I was told to do that.
 - Please, take into account Rob's comments to DT node patch and my
   reply with explanation about how are the current device tree nodes
   for this architecture being used in [2].

Changes in v5:
 - Avoid the use of syscon. All drivers of this platform are just using
   platform operations defined in 'asm/mach-ralink/ralink_regs.h'. We also
   need them for some PLL registers that are not in the sys control area.
   Hence, since we must use this dependency avoid to define clock driver
   as a child of the sysc node in the device tree and follow current
   platform code style.
 - Update bindings documentation to don't refer the syscon and make
   remove 'clock-output-names' property from required ones.
 - Use 'asm/mach-ralink/ralink_regs.h' platform read and write operations
   instead of regmap from the syscon node.
 - Remove 'mt7621_clk_provider' and directly declare 'clk_hw_onecell_data'
   pointer in 'mt7621_clk_init' and pass from there into different register
   functions. Remove pointers to 'mt7621_clk_provider' in the rest fo structs
   used in this driver.
 - Remove MHZ macro and just pass values directly in hertzs.
 - Avoid 'CLK_IGNORE_UNUSED' flag for gates and add a new function called
   'mt7621_prepare_enable_clocks' to prepare all of them to make clocks
   referenced and don't affect current driver code.
 - Remove COMPILE_TEST from Kconfig because of the use of especific arch
   stuff.
 - Fix commit message where a typo for "frequencies" word was present.
 - Make use of parent_clk_data in 'CLK_BASE' macro.
 - Remove MODULE_* macros from code since this is not a module.
 - Remove not needed includes.
 - Hardcode "xtal" as parent in FIXED macro.
 - Change 'else if' clause into 'if' clause since a return statement was
   being used in 'mt7621_xtal_recalc_rate'.

 NOTES:
   - Driver is still being declared using 'CLK_OF_DECLARE' for all the  
     clocks. I have explored the possibility to make some of them available
     afterwards using 'CLK_OF_DECLARE_DRIVER' for top clocks and the rest
     using a platform driver. The resulting code was uglier since we only want
     to use the same device tree node and the top clocks must be copied again
     for the new platform register stuff to properly have a good hierarchy.
     New globals needs to be introduced and in this particular case I don't
     really see the benefits of doing in this way. I am totally ok to have all
     the clocks registered at early stage since from other drivers perspective
     we only really need to enable gates. So, I prefer to have them in that
     way if it is not a real problem, of course.

Changes in v4:
 - Add Acked-by from Rob Herring for binding headers (PATCH 1/6).
 - Convert bindings to not use syscon phandle and declare clock as
   a child of the syscon node. Update device tree and binding doc
   accordly.
 - Make use of 'syscon_node_to_regmap' in driver code instead of
   get this using the phandle function.
 - Properly unregister clocks for the error path of the function
   'mt7621_clk_init'.
 - Include ARRAY_SIZE of fixed clocks in the 'count' to kzalloc
   of 'clk_data'.
 - Add new patch changing invalid vendor 'mtk' in favour of 'mediatek'
   which is the one listed in 'vendor-prefixes.yaml'. Update mt7621 code
   accordly. I have added this patch inside this series because clk
   binding is referring syscon node and the string for that node was
   with not listed vendor. Hence update and have all of this correct
   in the same series.

Changes in v3:
 - Fix compilation warnings reported by kernel test robot because of
   ignoring return values of 'of_clk_hw_register' in functions
   'mt7621_register_top_clocks' and 'mt7621_gate_ops_init'.
 - Fix dts file and binding documentation 'clock-output-names'.

Changes in v2:
 - Remove the following patches:
   * dt: bindings: add mt7621-pll device tree binding documentation.
   * MIPS: ralink: add clock device providing cpu/ahb/apb clock for mt7621.
 - Move all relevant clock code to 'drivers/clk/ralink/clk-mt7621.c' and
   unify there previous 'mt7621-pll' and 'mt7621-clk' into a unique driver
   and binding 'mt7621-clk'.
 - Driver is not a platform driver anymore and now make use of 'CLK_OF_DECLARE'
   because we need clocks available in 'plat_time_init' before setting up
   the timer for the GIC.
 - Use new fixed clocks as parents for different gates and deriving from 'xtal'
   using frequencies in[1].
 - Adapt dts file and bindings header and documentation for new changes.
 - Change MAINTAINERS file to only contains clk-mt7621.c code and
   mediatek,mt7621-clk.yaml file.

[0]: https://www.lkml.org/lkml/2019/7/23/1044
[1]: https://github.com/981213/linux/commit/2eca1f045e4c3db18c941135464c0d7422ad8133
[2]: https://lkml.org/lkml/2020/12/20/47

Sergio Paracuellos (6):
  dt-bindings: clock: add dt binding header for mt7621 clocks
  dt: bindings: add mt7621-clk device tree binding documentation
  clk: ralink: add clock driver for mt7621 SoC
  staging: mt7621-dts: make use of new 'mt7621-clk'
  staging: mt7621-dts: use valid vendor 'mediatek' instead of invalid
    'mtk'
  MAINTAINERS: add MT7621 CLOCK maintainer

 .../bindings/clock/mediatek,mt7621-clk.yaml   |  66 +++
 MAINTAINERS                                   |   6 +
 arch/mips/ralink/mt7621.c                     |   6 +-
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/ralink/Kconfig                    |  14 +
 drivers/clk/ralink/Makefile                   |   2 +
 drivers/clk/ralink/clk-mt7621.c               | 532 ++++++++++++++++++
 drivers/staging/mt7621-dts/gbpc1.dts          |  11 -
 drivers/staging/mt7621-dts/mt7621.dtsi        |  87 ++-
 include/dt-bindings/clock/mt7621-clk.h        |  41 ++
 11 files changed, 708 insertions(+), 59 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
 create mode 100644 drivers/clk/ralink/Kconfig
 create mode 100644 drivers/clk/ralink/Makefile
 create mode 100644 drivers/clk/ralink/clk-mt7621.c
 create mode 100644 include/dt-bindings/clock/mt7621-clk.h

-- 
2.25.1

