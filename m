Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08F4A1F3B65
	for <lists+linux-clk@lfdr.de>; Tue,  9 Jun 2020 15:07:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbgFINHx (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 9 Jun 2020 09:07:53 -0400
Received: from mga03.intel.com ([134.134.136.65]:24329 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726083AbgFINHx (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 9 Jun 2020 09:07:53 -0400
IronPort-SDR: 4xn6z4oullBCYgzLxsZdeD98kS+uGPcEkgM3TmRSGPnXMtmzQHhjvUd9pDXzDjykkjbl22+W9C
 jGj92f1ahkug==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2020 06:07:52 -0700
IronPort-SDR: TEuW1Xzwv7LvQlrm3uAFU5jjG9vOH8wVK7BYT6A6fDw6np9eqHLEufj7FQrWa3ck3rBQDnxcyZ
 9eYZLvD0p78A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,492,1583222400"; 
   d="scan'208";a="260103954"
Received: from lkp-server01.sh.intel.com (HELO 4a187143b92d) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 09 Jun 2020 06:07:49 -0700
Received: from kbuild by 4a187143b92d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jidym-00001B-RX; Tue, 09 Jun 2020 13:07:48 +0000
Date:   Tue, 9 Jun 2020 21:07:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     Lars Povlsen <lars.povlsen@microchip.com>,
        Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     kbuild-all@lists.01.org, Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Olof Johansson <olof@lixom.net>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [RFC PATCH] pinctrl: ocelot: ocelot_pinconf_set() can be static
Message-ID: <20200609130730.GA6525@70ce5749704d>
References: <20200609080709.9654-5-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200609080709.9654-5-lars.povlsen@microchip.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


Signed-off-by: kernel test robot <lkp@intel.com>
---
 pinctrl-ocelot.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
index c2f8e35616278f..c5f94402d963fb 100644
--- a/drivers/pinctrl/pinctrl-ocelot.c
+++ b/drivers/pinctrl/pinctrl-ocelot.c
@@ -782,7 +782,7 @@ static int ocelot_pinconf_get(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-noinline int ocelot_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
+static noinline int ocelot_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			      unsigned long *configs, unsigned int num_configs)
 {
 	struct ocelot_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
