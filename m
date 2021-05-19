Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12DE33897AA
	for <lists+linux-clk@lfdr.de>; Wed, 19 May 2021 22:16:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231948AbhESURV (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 19 May 2021 16:17:21 -0400
Received: from mail.bugwerft.de ([46.23.86.59]:37548 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230176AbhESURU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 19 May 2021 16:17:20 -0400
Received: from hq-00021.Speedport_W_724V_01011603_07_002 (p200300d83f181d7939130a2764e31627.dip0.t-ipconnect.de [IPv6:2003:d8:3f18:1d79:3913:a27:64e3:1627])
        by mail.bugwerft.de (Postfix) with ESMTPSA id EE98E4E406D;
        Wed, 19 May 2021 20:15:58 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, kuninori.morimoto.gx@renesas.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH v2 0/3] clk: cs2000-cp: make aux output pin configurable
Date:   Wed, 19 May 2021 22:15:48 +0200
Message-Id: <20210519201551.690654-1-daniel@zonque.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

v2:
 * Address review comments from Rob Herring on the dt bindings

Daniel Mack (3):
  dt-bindings: clock: convert cs2000-cp bindings to yaml
  dt-bindings: clock: cs2000-cp: Document aux-output-source
  clk: cs2000-cp: Make aux output function controllable

 .../bindings/clock/cirrus,cs2000-cp.yaml      | 73 +++++++++++++++++++
 .../devicetree/bindings/clock/cs2000-cp.txt   | 22 ------
 drivers/clk/clk-cs2000-cp.c                   |  9 +++
 include/dt-bindings/clock/cirrus,cs2000-cp.h  | 14 ++++
 4 files changed, 96 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/cs2000-cp.txt
 create mode 100644 include/dt-bindings/clock/cirrus,cs2000-cp.h

-- 
2.31.1

