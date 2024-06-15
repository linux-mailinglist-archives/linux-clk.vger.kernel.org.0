Return-Path: <linux-clk+bounces-8090-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 414DC90991B
	for <lists+linux-clk@lfdr.de>; Sat, 15 Jun 2024 19:05:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4F7D1F217D5
	for <lists+linux-clk@lfdr.de>; Sat, 15 Jun 2024 17:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BFBA4D5AA;
	Sat, 15 Jun 2024 17:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="VsgaFdxQ"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [167.172.40.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567A126ADB
	for <linux-clk@vger.kernel.org>; Sat, 15 Jun 2024 17:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=167.172.40.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718471101; cv=none; b=QE4VyxyRW0b5pZKaMFwxcnu7Bu7cTI24bv0hsTYapPu1KZj2Hfp0wjete6iqhVToCCiEpUV2F1O0od0T98CqNfYU87nkSbgJnbh41anZxpFgNXixxF0W7qGZWkvuZRyZLHVY5TmK7u+zNbURM7wtDA0zD4OJKGEPnR2tiSPdMMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718471101; c=relaxed/simple;
	bh=+JK/6pCydtVENjy0w54yyF6arAWMss13Dw95qeW20GI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qno4fqui+o8zrgmrfG8vKrsSv7JNJFlBRNswQ+QqJTS3lsUn6qVCaGjtBjqBw/pzNKQHJsDyaK0mqIa2pEwkkFzWaNVcIascdhsO92bu8IBcc7Eirl/yaTlvSpG34ubNFFD2iX0kuWil15TUQSpkEM8N6of1JhtViYKWTnS8Zl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=VsgaFdxQ; arc=none smtp.client-ip=167.172.40.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1718471077; bh=Bcu9b3VrUd6qIU98W1LB1PWRhdR9Skrn32v3O+4jLys=;
 b=VsgaFdxQZVdNXIhi2U8zovuoyfyqq6MS8Pvmv8oeEMZteMpcVA0byLeJASQdB0fefyWcHfouS
 8J0K1NeJi7BO9oPpRIAvtXWw/1lQ8k4UBpBk8IpaEs5m17UmQxhVLEcntfSscw5TsllSZ0QdL6Q
 05rH8LmtsNXzy2K80jiMBpelMTwo1Yc0GwyNIpdghb36GKGWcV1sFYDg/XRhnr5FCykL4moQqI8
 ra+OVnxmOvKsgydSgHmx6kFiV5fX8jPaoHEHlPXGJB14e6aNNH5GW3kVNApEkLXvn30m1Mmu4gX
 F5IsXxVrA5xqwgNVTQGlyXbGhLCRhkOKk50YmFvd6Gow==
From: Jonas Karlman <jonas@kwiboo.se>
To: dri-devel@lists.freedesktop.org, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Yakir Yang <kuankuan.y@gmail.com>, Jeffy Chen
 <jeffy.chen@rock-chips.com>
Cc: linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Jonas
 Karlman <jonas@kwiboo.se>, linux-clk@vger.kernel.org
Subject: [PATCH 02/13] clk: rockchip: Set parent rate for DCLK_VOP clock on RK3228
Date: Sat, 15 Jun 2024 17:03:53 +0000
Message-ID: <20240615170417.3134517-3-jonas@kwiboo.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240615170417.3134517-1-jonas@kwiboo.se>
References: <20240615170417.3134517-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 167.172.40.54
X-ForwardEmail-ID: 666dc9a024e0254b39803ff3

Similar to DCLK_LCDC on RK3328, the DCLK_VOP on RK3228 is typically
parented by the hdmiphy clk and it is expected that the DCLK_VOP and
hdmiphy clk rate are kept in sync.

Use CLK_SET_RATE_PARENT and CLK_SET_RATE_NO_REPARENT flags, same as used
on RK3328, to make full use of all possible supported display modes.

Fixes: 0a9d4ac08ebc ("clk: rockchip: set the clock ids for RK3228 VOP")
Fixes: 307a2e9ac524 ("clk: rockchip: add clock controller for rk3228")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/clk/rockchip/clk-rk3228.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3228.c b/drivers/clk/rockchip/clk-rk3228.c
index a24a35553e13..7343d2d7676b 100644
--- a/drivers/clk/rockchip/clk-rk3228.c
+++ b/drivers/clk/rockchip/clk-rk3228.c
@@ -409,7 +409,7 @@ static struct rockchip_clk_branch rk3228_clk_branches[] __initdata = {
 			RK2928_CLKSEL_CON(29), 0, 3, DFLAGS),
 	DIV(0, "sclk_vop_pre", "sclk_vop_src", 0,
 			RK2928_CLKSEL_CON(27), 8, 8, DFLAGS),
-	MUX(DCLK_VOP, "dclk_vop", mux_dclk_vop_p, 0,
+	MUX(DCLK_VOP, "dclk_vop", mux_dclk_vop_p, CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
 			RK2928_CLKSEL_CON(27), 1, 1, MFLAGS),
 
 	FACTOR(0, "xin12m", "xin24m", 0, 1, 2),
-- 
2.45.2


