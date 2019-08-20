Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB7FD95D5E
	for <lists+linux-clk@lfdr.de>; Tue, 20 Aug 2019 13:32:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729308AbfHTLcC (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 20 Aug 2019 07:32:02 -0400
Received: from inva021.nxp.com ([92.121.34.21]:48590 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729564AbfHTLcC (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 20 Aug 2019 07:32:02 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 349C320028C;
        Tue, 20 Aug 2019 13:32:00 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E64DC20006A;
        Tue, 20 Aug 2019 13:31:55 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 65B0B402B7;
        Tue, 20 Aug 2019 19:31:50 +0800 (SGT)
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH V4 00/11] clk: imx8: add new clock binding for better pm support
Date:   Tue, 20 Aug 2019 07:13:14 -0400
Message-Id: <1566299605-15641-1-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This is a follow up of this patch series.
https://patchwork.kernel.org/cover/10924029/
[V2,0/2] clk: imx: scu: add parsing clocks from device tree support

This patch series is a preparation for the MX8 Architecture improvement.
As for IMX SCU based platforms like MX8QM and MX8QXP, they are comprised
of a couple of SS(Subsystems) while most of them within the same SS
can be shared. e.g. Clocks, Devices and etc.

However, current clock binding is using SW IDs for device tree to use
which can cause troubles in writing the common <soc>-ss-xx.dtsi file for
different SoCs.

This patch series aims to introduce a new binding which is more close to
hardware and platform independent and can makes us write a more general
drivers for different SCU based SoCs.

Another important thing is that on MX8, each Clock resource is associated
with a power domain. So we have to attach that clock device to the power
domain in order to make it work properly. Further more, the clock state
will be lost when its power domain is completely off during suspend/resume,
so we also introduce the clock state save&restore mechanism.

ChangeLog:
v2->v3:
 * change scu clk into two cells binding
 * add clk pm patches to ease the understand of the changes
v1->v2:
 * SCU clock changed to one cell clock binding inspired by arm,scpi.txt
   Documentation/devicetree/bindings/arm/arm,scpi.txt
 * Add required power domain property
 * Dropped PATCH 3&4 first, will send the updated version accordingly
   after the binding is finally determined,

Dong Aisheng (11):
  dt-bindings: firmware: imx-scu: new binding to parse clocks from
    device tree
  dt-bindings: clock: imx-lpcg: add support to parse clocks from device
    tree
  clk: imx: scu: add two cells binding support
  clk: imx: scu: bypass cpu power domains
  clk: imx: scu: allow scu clk to take device pointer
  clk: imx: scu: add runtime pm support
  clk: imx: scu: add suspend/resume support
  clk: imx: imx8qxp-lpcg: add parsing clocks from device tree
  clk: imx: lpcg: allow lpcg clk to take device pointer
  clk: imx: clk-imx8qxp-lpcg: add runtime pm support
  clk: imx: lpcg: add suspend/resume support

 .../devicetree/bindings/arm/freescale/fsl,scu.txt  |  12 +-
 .../devicetree/bindings/clock/imx8qxp-lpcg.txt     |  36 +++-
 drivers/clk/imx/clk-imx8qxp-lpcg.c                 | 124 ++++++++++++
 drivers/clk/imx/clk-imx8qxp.c                      |   9 +-
 drivers/clk/imx/clk-lpcg-scu.c                     |  41 +++-
 drivers/clk/imx/clk-scu.c                          | 216 ++++++++++++++++++++-
 drivers/clk/imx/clk-scu.h                          |  50 ++++-
 include/dt-bindings/clock/imx8-lpcg.h              |  14 ++
 include/dt-bindings/firmware/imx/rsrc.h            |  23 +++
 9 files changed, 495 insertions(+), 30 deletions(-)
 create mode 100644 include/dt-bindings/clock/imx8-lpcg.h

-- 
2.7.4

