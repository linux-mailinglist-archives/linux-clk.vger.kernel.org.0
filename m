Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22D10332BCA
	for <lists+linux-clk@lfdr.de>; Tue,  9 Mar 2021 17:21:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231180AbhCIQVP (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 9 Mar 2021 11:21:15 -0500
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:55418 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230075AbhCIQUs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 Mar 2021 11:20:48 -0500
X-Greylist: delayed 362 seconds by postgrey-1.27 at vger.kernel.org; Tue, 09 Mar 2021 11:20:47 EST
X-Halon-ID: 8ae1d8b5-80f2-11eb-b73f-0050569116f7
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de [84.172.85.33])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 8ae1d8b5-80f2-11eb-b73f-0050569116f7;
        Tue, 09 Mar 2021 17:14:43 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-clk@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 0/2] clk: renesas: r8a779a0: Add clocks to support thermal
Date:   Tue,  9 Mar 2021 17:14:13 +0100
Message-Id: <20210309161415.2592105-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello,

This series aims to add enough clocks to enable proper operation of the
thermal IP block for V3U. The series have been tested on target together
with other thermal enablement patches to prove operation of thermal.

Based and tested on-top of v5.12-rc2.

Niklas Söderlund (2):
  clk: renesas: r8a779a0: Add CL16M clock
  clk: renesas: r8a779a0: Add TSC clock

 drivers/clk/renesas/r8a779a0-cpg-mssr.c       | 3 +++
 include/dt-bindings/clock/r8a779a0-cpg-mssr.h | 1 +
 2 files changed, 4 insertions(+)

-- 
2.30.1

