Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12A1C332BCD
	for <lists+linux-clk@lfdr.de>; Tue,  9 Mar 2021 17:21:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231853AbhCIQVP (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 9 Mar 2021 11:21:15 -0500
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:57473 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231768AbhCIQUt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 Mar 2021 11:20:49 -0500
X-Halon-ID: 909720ff-80f2-11eb-b73f-0050569116f7
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de [84.172.85.33])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 909720ff-80f2-11eb-b73f-0050569116f7;
        Tue, 09 Mar 2021 17:14:46 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-clk@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 2/2] clk: renesas: r8a779a0: Add TSC clock
Date:   Tue,  9 Mar 2021 17:14:15 +0100
Message-Id: <20210309161415.2592105-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309161415.2592105-1-niklas.soderlund+renesas@ragnatech.se>
References: <20210309161415.2592105-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Implement support for the TSC clock on V3U.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index 52452eff1fbed169..7d8fe3644e8bd3af 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -233,6 +233,7 @@ static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
 	DEF_MOD("pfc1",		916,	R8A779A0_CLK_CP),
 	DEF_MOD("pfc2",		917,	R8A779A0_CLK_CP),
 	DEF_MOD("pfc3",		918,	R8A779A0_CLK_CP),
+	DEF_MOD("tsc",		919,	R8A779A0_CLK_CL16M),
 	DEF_MOD("vspx0",	1028,	R8A779A0_CLK_S1D1),
 	DEF_MOD("vspx1",	1029,	R8A779A0_CLK_S1D1),
 	DEF_MOD("vspx2",	1030,	R8A779A0_CLK_S1D1),
-- 
2.30.1

