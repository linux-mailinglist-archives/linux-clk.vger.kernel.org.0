Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B299C2D7528
	for <lists+linux-clk@lfdr.de>; Fri, 11 Dec 2020 13:00:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405851AbgLKMAD (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 11 Dec 2020 07:00:03 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:9430 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726015AbgLKL7y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 11 Dec 2020 06:59:54 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Csq7N6nK7zhqV6;
        Fri, 11 Dec 2020 19:58:40 +0800 (CST)
Received: from huawei.com (10.151.151.249) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Fri, 11 Dec 2020
 19:58:59 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <vkoul@kernel.org>,
        <dan.j.williams@intel.com>, <p.zabel@pengutronix.de>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <gengdongjiu@huawei.com>
Subject: [PATCH RESEND v6 0/4] Enable Hi3559A SOC clock and HiSilicon Hiedma Controller
Date:   Sat, 12 Dec 2020 13:11:11 +0000
Message-ID: <20201212131115.569-1-gengdongjiu@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.151.151.249]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

v5->v6:
1. Drop #size-cells and #address-cell in the hisilicon,hi3559av100-clock.yaml
2. Add discription for #reset-cells in the hisilicon,hi3559av100-clock.yaml
3. Remove #clock-cells in hisilicon,hiedmacv310.yaml 
4. Merge property misc_ctrl_base and misc_regmap together for hiedmacv310 driver

v4->v5:
1. change the patch author mail name

v3->v4:
1. fix the 'make dt_binding_check' issues.
2. Combine the 'Enable HiSilicon Hiedma Controller' series patches to this series.
3. fix the 'make dt_binding_check' issues in 'Enable HiSilicon Hiedma Controller' patchset


v2->v3:
1. change dt-bindings documents from txt to yaml format.
2. Add SHUB clock to access the devices of m7

Dongjiu Geng (4):
  dt-bindings: Document the hi3559a clock bindings
  clk: hisilicon: Add clock driver for hi3559A SoC
  dt: bindings: dma: Add DT bindings for HiSilicon Hiedma Controller
  dmaengine: dma: Add Hiedma Controller v310 Device Driver

 .../clock/hisilicon,hi3559av100-clock.yaml    |   59 +
 .../bindings/dma/hisilicon,hiedmacv310.yaml   |   94 ++
 drivers/clk/hisilicon/Kconfig                 |    7 +
 drivers/clk/hisilicon/Makefile                |    1 +
 drivers/clk/hisilicon/clk-hi3559a.c           |  865 ++++++++++
 drivers/dma/Kconfig                           |   14 +
 drivers/dma/Makefile                          |    1 +
 drivers/dma/hiedmacv310.c                     | 1442 +++++++++++++++++
 drivers/dma/hiedmacv310.h                     |  136 ++
 include/dt-bindings/clock/hi3559av100-clock.h |  165 ++
 10 files changed, 2784 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/hisilicon,hi3559av100-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/dma/hisilicon,hiedmacv310.yaml
 create mode 100644 drivers/clk/hisilicon/clk-hi3559a.c
 create mode 100644 drivers/dma/hiedmacv310.c
 create mode 100644 drivers/dma/hiedmacv310.h
 create mode 100644 include/dt-bindings/clock/hi3559av100-clock.h

-- 
2.17.1

