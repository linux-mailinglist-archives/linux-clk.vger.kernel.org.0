Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4596C4BD499
	for <lists+linux-clk@lfdr.de>; Mon, 21 Feb 2022 05:19:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343712AbiBUEQe (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 20 Feb 2022 23:16:34 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:51342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343711AbiBUEQd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 20 Feb 2022 23:16:33 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D48E4A3E4;
        Sun, 20 Feb 2022 20:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645416971; x=1676952971;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C3+3vZZdzKJcFslxP6kVOpTXMOxoobD1WKxa2FqmAco=;
  b=EOnd3IDvHqKlqpCLUAMvgv2UvkEKqUQLPITEiP8uTskXBHeZDGB32xBf
   QBAJK4z4zwjHi/NG3DYpCBxBl6xG4SQIWe1AKQKWdJfJy3WEeJY0aIpia
   TcoC727r7UMe1znz1EXRLnJ+qGnnZFsx5PngR+THM3Mq1ynrdtFvlOFJV
   um56t2tDz/8SfYs8kWjutmoBqP7ulRuuS2uokvGn0x5EffoBjL6xqYmIn
   L2zx6ZM/YgPIWZSj4O74C482UreJ9u7N00RhS1A+0WmCCTEQVxpZU/BX6
   MxJMYkXn1KmXHOaBAnDMXpibCjSX29yBrKtr4beyzRouPsWUizqHb0Gkc
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10264"; a="337863435"
X-IronPort-AV: E=Sophos;i="5.88,384,1635231600"; 
   d="scan'208";a="337863435"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2022 20:16:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,384,1635231600"; 
   d="scan'208";a="490310988"
Received: from lkp-server01.sh.intel.com (HELO da3212ac2f54) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 20 Feb 2022 20:16:06 -0800
Received: from kbuild by da3212ac2f54 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nM07J-0001J0-JO; Mon, 21 Feb 2022 04:16:05 +0000
Date:   Mon, 21 Feb 2022 12:15:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Vinod Koul <vkoul@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     kbuild-all@lists.01.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Laetitia MARIOTTINI <laetitia.mariottini@se.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 4/8] dma: dmamux: Introduce RZN1 DMA router support
Message-ID: <202202211236.07FjzSmp-lkp@intel.com>
References: <20220218181226.431098-5-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220218181226.431098-5-miquel.raynal@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Miquel,

I love your patch! Yet something to improve:

[auto build test ERROR on geert-renesas-devel/next]
[also build test ERROR on geert-renesas-drivers/renesas-clk robh/for-next linus/master v5.17-rc5 next-20220217]
[cannot apply to vkoul-dmaengine/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Miquel-Raynal/RZN1-DMA-support/20220220-182519
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
config: ia64-allmodconfig (https://download.01.org/0day-ci/archive/20220221/202202211236.07FjzSmp-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/df0b7e58b46473e407c2c552f843d0628ad6875d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Miquel-Raynal/RZN1-DMA-support/20220220-182519
        git checkout df0b7e58b46473e407c2c552f843d0628ad6875d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=ia64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ia64-linux-ld: drivers/dma/dw/dmamux.o: in function `rzn1_dmamux_init':
>> dmamux.c:(.text+0x9c0): multiple definition of `init_module'; drivers/dma/dw/platform.o:platform.c:(.init.text+0x0): first defined here

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
