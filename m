Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9C021E3D10
	for <lists+linux-clk@lfdr.de>; Wed, 27 May 2020 11:05:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728651AbgE0JFI (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 27 May 2020 05:05:08 -0400
Received: from out28-125.mail.aliyun.com ([115.124.28.125]:40048 "EHLO
        out28-125.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728339AbgE0JFI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 27 May 2020 05:05:08 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.3001889|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0312255-0.000216354-0.968558;FP=3299219862349010150|1|1|7|0|-1|-1|-1;HT=e02c03295;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.HeI09nX_1590570281;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.HeI09nX_1590570281)
          by smtp.aliyun-inc.com(10.147.40.2);
          Wed, 27 May 2020 17:05:04 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com, paul@crapouillou.net
Subject: [PATCH RESEND v11 0/7] Add support for the X1830 and fix bugs for X1000.
Date:   Wed, 27 May 2020 17:04:12 +0800
Message-Id: <20200527090419.56213-1-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

v10->v11:
Split [3/6] in v10 to [3/7] in v11 and [4/7] in v11.

周琰杰 (Zhou Yanjie) (7):
  clk: Ingenic: Remove unnecessary spinlock when reading registers.
  clk: Ingenic: Adjust cgu code to make it compatible with X1830.
  dt-bindings: clock: Add documentation for X1830 bindings.
  dt-bindings: clock: Add X1830 clock bindings.
  clk: Ingenic: Add CGU driver for X1830.
  dt-bindings: clock: Add and reorder ABI for X1000.
  clk: X1000: Add FIXDIV for SSI clock of X1000.

 .../devicetree/bindings/clock/ingenic,cgu.yaml     |   2 +
 drivers/clk/ingenic/Kconfig                        |  10 +
 drivers/clk/ingenic/Makefile                       |   1 +
 drivers/clk/ingenic/cgu.c                          |  28 +-
 drivers/clk/ingenic/cgu.h                          |   4 +
 drivers/clk/ingenic/jz4725b-cgu.c                  |   4 +
 drivers/clk/ingenic/jz4740-cgu.c                   |   4 +
 drivers/clk/ingenic/jz4770-cgu.c                   |   8 +-
 drivers/clk/ingenic/jz4780-cgu.c                   |   3 +
 drivers/clk/ingenic/x1000-cgu.c                    | 116 +++++-
 drivers/clk/ingenic/x1830-cgu.c                    | 443 +++++++++++++++++++++
 include/dt-bindings/clock/x1000-cgu.h              |  64 +--
 include/dt-bindings/clock/x1830-cgu.h              |  55 +++
 13 files changed, 694 insertions(+), 48 deletions(-)
 create mode 100644 drivers/clk/ingenic/x1830-cgu.c
 create mode 100644 include/dt-bindings/clock/x1830-cgu.h

-- 
2.11.0

