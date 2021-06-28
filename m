Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 059533B5DE0
	for <lists+linux-clk@lfdr.de>; Mon, 28 Jun 2021 14:19:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233007AbhF1MWK (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 28 Jun 2021 08:22:10 -0400
Received: from mga12.intel.com ([192.55.52.136]:13464 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232802AbhF1MWJ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 28 Jun 2021 08:22:09 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10028"; a="187627583"
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; 
   d="gz'50?scan'50,208,50";a="187627583"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2021 05:19:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; 
   d="gz'50?scan'50,208,50";a="643315268"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 Jun 2021 05:19:41 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lxqEn-0008Xn-5y; Mon, 28 Jun 2021 12:19:41 +0000
Date:   Mon, 28 Jun 2021 20:19:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Liam Beguin <lvb@xiphos.com>
Cc:     kbuild-all@lists.01.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stephen Boyd <sboyd@kernel.org>
Subject: [clk:clk-lmk04832 2/3] clk-lmk04832.c:undefined reference to
 `spi_get_device_id'
Message-ID: <202106282032.Nu4qxPkD-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="X1bOJ3K7DJ5YkBrT"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-lmk04832
head:   6181baa177d417211ea28de793524ec3d13b256d
commit: 3bc61cfd6f4a57de32132075b15b0ac8987ced1d [2/3] clk: add support for the lmk04832
config: s390-randconfig-c023-20210628 (attached as .config)
compiler: s390-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/?id=3bc61cfd6f4a57de32132075b15b0ac8987ced1d
        git remote add clk https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
        git fetch --no-tags clk clk-lmk04832
        git checkout 3bc61cfd6f4a57de32132075b15b0ac8987ced1d
        # save the attached .config to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/clk/clk-lmk04832.o: in function `lmk04832_check_vco_ranges.isra.0':
>> clk-lmk04832.c:(.text+0x1668): undefined reference to `spi_get_device_id'
   s390-linux-ld: drivers/clk/clk-lmk04832.o: in function `lmk04832_probe':
   clk-lmk04832.c:(.text+0x198c): undefined reference to `spi_get_device_id'
   s390-linux-ld: drivers/clk/clk-lmk04832.o: in function `lmk04832_driver_init':
>> clk-lmk04832.c:(.init.text+0x5e): undefined reference to `__spi_register_driver'
   s390-linux-ld: drivers/dma/idma64.o: in function `idma64_platform_probe':
   idma64.c:(.text+0xe90): undefined reference to `devm_ioremap_resource'
   s390-linux-ld: drivers/dma/qcom/hidma.o: in function `hidma_probe':
   hidma.c:(.text+0x1484): undefined reference to `devm_ioremap_resource'
   s390-linux-ld: hidma.c:(.text+0x14ca): undefined reference to `devm_ioremap_resource'
   s390-linux-ld: drivers/base/regmap/regmap-spi.o: in function `regmap_spi_read':
   regmap-spi.c:(.text+0x42): undefined reference to `spi_write_then_read'
   s390-linux-ld: drivers/base/regmap/regmap-spi.o: in function `regmap_spi_async_write':
   regmap-spi.c:(.text+0x172): undefined reference to `spi_async'
   s390-linux-ld: drivers/base/regmap/regmap-spi.o: in function `regmap_spi_gather_write':
   regmap-spi.c:(.text+0x224): undefined reference to `spi_sync'
   s390-linux-ld: drivers/base/regmap/regmap-spi.o: in function `spi_sync_transfer.constprop.0':
   regmap-spi.c:(.text+0x2a6): undefined reference to `spi_sync'
   s390-linux-ld: drivers/input/keyboard/samsung-keypad.o: in function `samsung_keypad_probe':
   samsung-keypad.c:(.text+0x620): undefined reference to `devm_ioremap'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for REGMAP_SPI
   Depends on SPI
   Selected by
   - LMK04832 && COMMON_CLK

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--X1bOJ3K7DJ5YkBrT
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
8/wHucP2eJzBAAA=

--X1bOJ3K7DJ5YkBrT--
