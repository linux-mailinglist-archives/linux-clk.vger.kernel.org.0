Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A1753B6840
	for <lists+linux-clk@lfdr.de>; Mon, 28 Jun 2021 20:21:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234457AbhF1SXY (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 28 Jun 2021 14:23:24 -0400
Received: from out28-49.mail.aliyun.com ([115.124.28.49]:50243 "EHLO
        out28-49.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233351AbhF1SXU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Jun 2021 14:23:20 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.09155044|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0147751-0.000601563-0.984623;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047207;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.KZOO9TY_1624904444;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KZOO9TY_1624904444)
          by smtp.aliyun-inc.com(10.147.42.253);
          Tue, 29 Jun 2021 02:20:49 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org
Cc:     linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        paul@crapouillou.net, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sihui.liu@ingenic.com, jun.jiang@ingenic.com,
        sernia.zhou@foxmail.com
Subject: [PATCH v5 00/11] Add new clocks and fix bugs for Ingenic SoCs.
Date:   Tue, 29 Jun 2021 02:20:33 +0800
Message-Id: <1624904444-2618-1-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

v4->v5:
1.modify the CGU PLL correlation code to make it compatible with I2S PLL.
2.Change X1000's I2S clock to CGU_CLK_PLL as Paul Cercueil's suggestion.
3.Add documentation for JZ4775 and X2000 bindings.
4.Add JZ4775 and X2000 clock bindings.
5.Add CGU driver for JZ4775 and X2000.

周琰杰 (Zhou Yanjie) (11):
  clk: JZ4780: Add function for disable the second core.
  clk: Ingenic: Adjust cgu code to make it compatible with I2S PLL.
  dt-bindings: clock: Add missing clocks for Ingenic SoCs.
  clk: Ingenic: Fix problem of MAC clock in Ingenic X1000 and X1830.
  clk: Ingenic: Add missing clocks for Ingenic SoCs.
  clk: Ingenic: Clean up and reformat the code.
  dt-bindings: clock: Add documentation for JZ4775 and X2000 bindings.
  dt-bindings: clock: Add JZ4775 clock bindings.
  dt-bindings: clock: Add X2000 clock bindings.
  clk: Ingenic: Add CGU driver for JZ4775.
  clk: Ingenic: Add CGU driver for X2000.

 .../devicetree/bindings/clock/ingenic,cgu.yaml     |   4 +
 drivers/clk/ingenic/Kconfig                        |  20 +
 drivers/clk/ingenic/Makefile                       |   2 +
 drivers/clk/ingenic/cgu.c                          | 118 +++-
 drivers/clk/ingenic/cgu.h                          |   1 +
 drivers/clk/ingenic/jz4725b-cgu.c                  |  48 +-
 drivers/clk/ingenic/jz4740-cgu.c                   |  48 +-
 drivers/clk/ingenic/jz4760-cgu.c                   | 106 ++-
 drivers/clk/ingenic/jz4770-cgu.c                   |  83 +--
 drivers/clk/ingenic/jz4775-cgu.c                   | 571 +++++++++++++++
 drivers/clk/ingenic/jz4780-cgu.c                   | 148 ++--
 drivers/clk/ingenic/x1000-cgu.c                    | 209 ++++--
 drivers/clk/ingenic/x1830-cgu.c                    | 209 ++++--
 drivers/clk/ingenic/x2000-cgu.c                    | 783 +++++++++++++++++++++
 include/dt-bindings/clock/jz4775-cgu.h             |  59 ++
 include/dt-bindings/clock/x1000-cgu.h              |   5 +
 include/dt-bindings/clock/x1830-cgu.h              |   5 +
 include/dt-bindings/clock/x2000-cgu.h              |  88 +++
 18 files changed, 2189 insertions(+), 318 deletions(-)
 create mode 100644 drivers/clk/ingenic/jz4775-cgu.c
 create mode 100644 drivers/clk/ingenic/x2000-cgu.c
 create mode 100644 include/dt-bindings/clock/jz4775-cgu.h
 create mode 100644 include/dt-bindings/clock/x2000-cgu.h

-- 
2.7.4

