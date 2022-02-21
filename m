Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A17F4BD371
	for <lists+linux-clk@lfdr.de>; Mon, 21 Feb 2022 03:09:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245555AbiBUB7U (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 20 Feb 2022 20:59:20 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232564AbiBUB7T (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 20 Feb 2022 20:59:19 -0500
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3253A517D3;
        Sun, 20 Feb 2022 17:58:56 -0800 (PST)
X-UUID: dbe1d2847c304ffcbcd8cc4eb1e2eaa5-20220221
X-UUID: dbe1d2847c304ffcbcd8cc4eb1e2eaa5-20220221
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <chun-jie.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 368339440; Mon, 21 Feb 2022 09:58:53 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Mon, 21 Feb 2022 09:58:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Feb 2022 09:58:51 +0800
From:   Chun-Jie Chen <chun-jie.chen@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 00/15] Mediatek MT8186 clock support
Date:   Mon, 21 Feb 2022 09:52:43 +0800
Message-ID: <20220221015258.913-1-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

this patch series is based on 5.17-rc1 and depends on
[1]"clk: mediatek: Cleanups and Improvements - Part 1"

changes since v1:
- combine dt-binding documents as a single patch
- remove redundant example in binding document
- change to dual license in binding document
- add more clock error handle based on interface provided in [1]

[1]https://patchwork.kernel.org/project/linux-mediatek/list/?series=612171

Chun-Jie Chen (15):
  dt-bindings: ARM: Mediatek: Add new document bindings of MT8186 clock
  clk: mediatek: Add MT8186 mcusys clock support
  clk: mediatek: Add MT8186 topckgen clock support
  clk: mediatek: Add MT8186 infrastructure clock support
  clk: mediatek: Add MT8186 apmixedsys clock support
  clk: mediatek: Add MT8186 imp i2c wrapper clock support
  clk: mediatek: Add MT8186 mfgsys clock support
  clk: mediatek: Add MT8186 mmsys clock support
  clk: mediatek: Add MT8186 wpesys clock support
  clk: mediatek: Add MT8186 imgsys clock support
  clk: mediatek: Add MT8186 vdecsys clock support
  clk: mediatek: Add MT8186 vencsys clock support
  clk: mediatek: Add MT8186 camsys clock support
  clk: mediatek: Add MT8186 mdpsys clock support
  clk: mediatek: Add MT8186 ipesys clock support

 .../arm/mediatek/mediatek,mt8186-clock.yaml   |  56 ++
 .../mediatek/mediatek,mt8186-sys-clock.yaml   |  54 ++
 drivers/clk/mediatek/Kconfig                  |   8 +
 drivers/clk/mediatek/Makefile                 |   5 +
 drivers/clk/mediatek/clk-mt8186-apmixedsys.c  | 133 +++
 drivers/clk/mediatek/clk-mt8186-cam.c         |  90 ++
 drivers/clk/mediatek/clk-mt8186-img.c         |  68 ++
 .../clk/mediatek/clk-mt8186-imp_iic_wrap.c    |  67 ++
 drivers/clk/mediatek/clk-mt8186-infra_ao.c    | 216 +++++
 drivers/clk/mediatek/clk-mt8186-ipe.c         |  55 ++
 drivers/clk/mediatek/clk-mt8186-mcu.c         | 106 +++
 drivers/clk/mediatek/clk-mt8186-mdp.c         |  80 ++
 drivers/clk/mediatek/clk-mt8186-mfg.c         |  48 ++
 drivers/clk/mediatek/clk-mt8186-mm.c          | 111 +++
 drivers/clk/mediatek/clk-mt8186-topckgen.c    | 780 ++++++++++++++++++
 drivers/clk/mediatek/clk-mt8186-vdec.c        |  88 ++
 drivers/clk/mediatek/clk-mt8186-venc.c        |  51 ++
 drivers/clk/mediatek/clk-mt8186-wpe.c         |  51 ++
 include/dt-bindings/clock/mt8186-clk.h        | 445 ++++++++++
 19 files changed, 2512 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-sys-clock.yaml
 create mode 100644 drivers/clk/mediatek/clk-mt8186-apmixedsys.c
 create mode 100644 drivers/clk/mediatek/clk-mt8186-cam.c
 create mode 100644 drivers/clk/mediatek/clk-mt8186-img.c
 create mode 100644 drivers/clk/mediatek/clk-mt8186-imp_iic_wrap.c
 create mode 100644 drivers/clk/mediatek/clk-mt8186-infra_ao.c
 create mode 100644 drivers/clk/mediatek/clk-mt8186-ipe.c
 create mode 100644 drivers/clk/mediatek/clk-mt8186-mcu.c
 create mode 100644 drivers/clk/mediatek/clk-mt8186-mdp.c
 create mode 100644 drivers/clk/mediatek/clk-mt8186-mfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt8186-mm.c
 create mode 100644 drivers/clk/mediatek/clk-mt8186-topckgen.c
 create mode 100644 drivers/clk/mediatek/clk-mt8186-vdec.c
 create mode 100644 drivers/clk/mediatek/clk-mt8186-venc.c
 create mode 100644 drivers/clk/mediatek/clk-mt8186-wpe.c
 create mode 100644 include/dt-bindings/clock/mt8186-clk.h

-- 
2.18.0

