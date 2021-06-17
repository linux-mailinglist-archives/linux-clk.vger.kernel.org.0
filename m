Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 531BA3AB287
	for <lists+linux-clk@lfdr.de>; Thu, 17 Jun 2021 13:26:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232243AbhFQL26 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 17 Jun 2021 07:28:58 -0400
Received: from mga04.intel.com ([192.55.52.120]:6166 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231265AbhFQL26 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 17 Jun 2021 07:28:58 -0400
IronPort-SDR: uOtdKrYlikTzOEWAXNvz9ijEapd5nJeO1viqsgmD6VpFiKUHW8V5Gwt4/ps7e4ZaYQE42ZcX36
 ERDq55BlOhbQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="204520883"
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; 
   d="scan'208";a="204520883"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2021 04:26:50 -0700
IronPort-SDR: MCVtgrm2DiVzFdOx5+Bo+mLVtg0nYMtiQ6IEUjPTLI8Mg4KRpFGCg+fEDc+YVzyt77qxck3t4D
 dK7oSFpY8qIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; 
   d="scan'208";a="485260138"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 17 Jun 2021 04:26:36 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1ltqAN-0001zm-Tt; Thu, 17 Jun 2021 11:26:35 +0000
Date:   Thu, 17 Jun 2021 19:25:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: renesas: fix semicolon.cocci warnings
Message-ID: <20210617112555.GA75910@efb2dc6f3522>
References: <202106171929.BBQuTUKe-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202106171929.BBQuTUKe-lkp@intel.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: kernel test robot <lkp@intel.com>

drivers/clk/renesas/renesas-rzg2l-cpg.c:299:2-3: Unneeded semicolon


 Remove unneeded semicolon.

Generated by: scripts/coccinelle/misc/semicolon.cocci

Fixes: ef3c613ccd68 ("clk: renesas: Add CPG core wrapper for RZ/G2L SoC")
CC: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c7d4c1fd91ab4a6d2620497921a9c6bf54650ab8
commit: ef3c613ccd68a78727b817c3dacf4a68d1ffc67f [8106/10489] clk: renesas: Add CPG core wrapper for RZ/G2L SoC
:::::: branch date: 22 hours ago
:::::: commit date: 7 days ago

 renesas-rzg2l-cpg.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/clk/renesas/renesas-rzg2l-cpg.c
+++ b/drivers/clk/renesas/renesas-rzg2l-cpg.c
@@ -296,7 +296,7 @@ rzg2l_cpg_register_core_clk(const struct
 		break;
 	default:
 		goto fail;
-	};
+	}
 
 	if (IS_ERR_OR_NULL(clk))
 		goto fail;
