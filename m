Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0A867DBE4A
	for <lists+linux-clk@lfdr.de>; Mon, 30 Oct 2023 17:53:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231789AbjJ3Qx5 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 30 Oct 2023 12:53:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbjJ3Qx5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 30 Oct 2023 12:53:57 -0400
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C25C1B3;
        Mon, 30 Oct 2023 09:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698684835; x=1730220835;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0MNp78TBktcSSvD5TYdlbWZXz2ANgvZ0t7h0WBasLSk=;
  b=R6Ubol4riWJamMMhV6SwAjIYR5ZyB2caGHWIkxWoiUUIF9mOWJq6X07T
   /o9UIs1Tdq04h+QM3Z1eR9oOtC8NHiBmPYayrbh01AdzG4nE4BRISRDe9
   VDnf4tNKCmLCfvT2X0s/v4wPrfRDsXwJXXcoK4uvySx8nYK07D/qFR71r
   xpeDNnUNJtqes0sO87FhbLoNLe+/ECly7tjDkIa5pwV/+uf66P8cXeH1p
   9wjDs5iWUBvDPIdnqGp3vha4q1KytSl9ovLygfBUK2q+nAJQmxz2wknKW
   pEaWMnPmMLtPzCnkIrShf4R2w5Dp7YDRFHd+ioT6gXO21KJmmMr6zBmYt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="990052"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="990052"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 09:53:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="933829289"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="933829289"
Received: from mmichali-devpc.igk.intel.com ([10.211.235.239])
  by orsmga005.jf.intel.com with ESMTP; 30 Oct 2023 09:53:50 -0700
From:   Michal Michalik <michal.michalik@intel.com>
To:     netdev@vger.kernel.org
Cc:     vadim.fedorenko@linux.dev, jiri@resnulli.us,
        arkadiusz.kubalewski@intel.com, jonathan.lemon@gmail.com,
        pabeni@redhat.com, poros@redhat.com, milena.olech@intel.com,
        mschmidt@redhat.com, linux-clk@vger.kernel.org, bvanassche@acm.org,
        kuba@kernel.org, davem@davemloft.net, edumazet@google.com,
        Michal Michalik <michal.michalik@intel.com>
Subject: [PATCH RFC net-next v2 0/2] selftests/dpll: DPLL subsystem integration tests
Date:   Mon, 30 Oct 2023 17:53:24 +0100
Message-Id: <20231030165326.24453-1-michal.michalik@intel.com>
X-Mailer: git-send-email 2.9.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The recently merged common DPLL interface discussed on a newsletter[1]
is introducing new, complex subsystem which requires proper integration
testing - this patch adds core for such framework, as well as the
initial test cases. Framework does not require neither any special
hardware nor any special system architecture.

To properly test the DPLL subsystem this patch adds fake DPLL devices and it's
pins implementation to netdevsim. Creating netdevsim devices and adding ports
to it register new DPLL devices and pins. First port of each netdevsim device
acts as a entitiy which registers two DPLL devices: EEC and PPS DPLLs. First
port also register the common pins: PPS and GNSS. Additionally each port
register also RCLK (recovered clock) pin for itself. That allow us to check
mutliple scenarios which might be problematic in real implementations (like
different ordering etc.)

Patch adds few helper scripts, which are:
1) tools/testing/selftests/dpll/run_dpll_tests.sh
    Script is checking for all dependencies, creates temporary
    environment, installs required libraries and run all tests - can be
    used standalone
2) tools/testing/selftests/dpll/ynlfamilyhandler.py˙
    Library for easier ynl use in the pytest framework - can be used
    standalone

[1] https://lore.kernel.org/netdev/169494842736.21621.10730860855645661664.git-patchwork-notify@kernel.org/

Changelog:
v1 -> v2:
- moved from separate module to implementation in netdevsim

Michal Michalik (2):
  netdevsim: implement DPLL for subsystem selftests
  selftests/dpll: add DPLL system integration selftests

 drivers/net/Kconfig                              |   1 +
 drivers/net/netdevsim/Makefile                   |   2 +-
 drivers/net/netdevsim/dpll.c                     | 438 +++++++++++++++++++++++
 drivers/net/netdevsim/dpll.h                     |  81 +++++
 drivers/net/netdevsim/netdev.c                   |  20 ++
 drivers/net/netdevsim/netdevsim.h                |   4 +
 tools/testing/selftests/Makefile                 |   1 +
 tools/testing/selftests/dpll/Makefile            |   8 +
 tools/testing/selftests/dpll/__init__.py         |   0
 tools/testing/selftests/dpll/config              |   2 +
 tools/testing/selftests/dpll/consts.py           |  34 ++
 tools/testing/selftests/dpll/dpll_utils.py       | 109 ++++++
 tools/testing/selftests/dpll/requirements.txt    |   3 +
 tools/testing/selftests/dpll/run_dpll_tests.sh   |  75 ++++
 tools/testing/selftests/dpll/test_dpll.py        | 414 +++++++++++++++++++++
 tools/testing/selftests/dpll/ynlfamilyhandler.py |  49 +++
 16 files changed, 1240 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/netdevsim/dpll.c
 create mode 100644 drivers/net/netdevsim/dpll.h
 create mode 100644 tools/testing/selftests/dpll/Makefile
 create mode 100644 tools/testing/selftests/dpll/__init__.py
 create mode 100644 tools/testing/selftests/dpll/config
 create mode 100644 tools/testing/selftests/dpll/consts.py
 create mode 100644 tools/testing/selftests/dpll/dpll_utils.py
 create mode 100644 tools/testing/selftests/dpll/requirements.txt
 create mode 100755 tools/testing/selftests/dpll/run_dpll_tests.sh
 create mode 100644 tools/testing/selftests/dpll/test_dpll.py
 create mode 100644 tools/testing/selftests/dpll/ynlfamilyhandler.py

-- 
2.9.5

base-commit: 55c900477f5b3897d9038446f72a281cae0efd86
