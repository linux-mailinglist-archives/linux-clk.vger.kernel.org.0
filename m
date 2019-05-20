Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E484C22DB2
	for <lists+linux-clk@lfdr.de>; Mon, 20 May 2019 10:06:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730928AbfETIFk (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 20 May 2019 04:05:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:36818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730912AbfETIFj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 20 May 2019 04:05:39 -0400
Received: from wens.tw (mirror2.csie.ntu.edu.tw [140.112.30.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4FA19214D8;
        Mon, 20 May 2019 08:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558339539;
        bh=6+akfErrwx3uqOmYn6NMEDAtSDfjRxA5DKpRQP1iwL0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ERi5NMf3u4+8VqMq1mfMAiFsfwcvJUqLiCWdmMP4GYnaqA5bWYEHi0yikU9RaIF1O
         P6TXpWgR6NaeLmLUlCeIXBD6zVRK4zrflNDcjr4BPFnOMzyHp0huIstzd+s/yJY537
         MretW/YxeXndJ5ydnvBcHMMqPe5fjjV+Yj7nD9M4=
Received: by wens.tw (Postfix, from userid 1000)
        id BF6B265827; Mon, 20 May 2019 16:05:32 +0800 (CST)
From:   Chen-Yu Tsai <wens@kernel.org>
To:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 19/25] clk: sunxi-ng: f1c100s: Use local parent references for CLK_FIXED_FACTOR
Date:   Mon, 20 May 2019 16:04:15 +0800
Message-Id: <20190520080421.12575-20-wens@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190520080421.12575-1-wens@kernel.org>
References: <20190520080421.12575-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>

With the new clk parenting code and CLK_FIXED_FACTOR_{HW,FW_NAME}
macros, we can reference parents locally via pointers to struct clk_hw
or DT clock-names.

Convert existing CLK_FIXED_FACTOR definitions to either the _HW or
_FW_NAME variant based on whether the parent clock is internal or
external to the CCU.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c | 29 ++++++++++++++++--------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c b/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c
index e748b8a6f3c5..f6b776ca8e49 100644
--- a/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c
+++ b/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c
@@ -374,16 +374,25 @@ static struct ccu_common *suniv_ccu_clks[] = {
 	&avs_clk.common,
 };
 
-static CLK_FIXED_FACTOR(pll_audio_clk, "pll-audio",
-			"pll-audio-base", 4, 1, CLK_SET_RATE_PARENT);
-static CLK_FIXED_FACTOR(pll_audio_2x_clk, "pll-audio-2x",
-			"pll-audio-base", 2, 1, CLK_SET_RATE_PARENT);
-static CLK_FIXED_FACTOR(pll_audio_4x_clk, "pll-audio-4x",
-			"pll-audio-base", 1, 1, CLK_SET_RATE_PARENT);
-static CLK_FIXED_FACTOR(pll_audio_8x_clk, "pll-audio-8x",
-			"pll-audio-base", 1, 2, CLK_SET_RATE_PARENT);
-static CLK_FIXED_FACTOR(pll_video_2x_clk, "pll-video-2x",
-			"pll-video", 1, 2, 0);
+static const struct clk_hw *clk_parent_pll_audio[] = {
+	&pll_audio_base_clk.common.hw
+};
+
+static CLK_FIXED_FACTOR_HWS(pll_audio_clk, "pll-audio",
+			    clk_parent_pll_audio
+			    4, 1, CLK_SET_RATE_PARENT);
+static CLK_FIXED_FACTOR_HWS(pll_audio_2x_clk, "pll-audio-2x",
+			    clk_parent_pll_audio
+			    2, 1, CLK_SET_RATE_PARENT);
+static CLK_FIXED_FACTOR_HWS(pll_audio_4x_clk, "pll-audio-4x",
+			    clk_parent_pll_audio
+			    1, 1, CLK_SET_RATE_PARENT);
+static CLK_FIXED_FACTOR_HWS(pll_audio_8x_clk, "pll-audio-8x",
+			    clk_parent_pll_audio
+			    1, 2, CLK_SET_RATE_PARENT);
+static CLK_FIXED_FACTOR_HW(pll_video0_2x_clk, "pll-video0-2x",
+			   &pll_video0_clk.common.hw,
+			   1, 2, 0);
 
 static struct clk_hw_onecell_data suniv_hw_clks = {
 	.hws	= {
-- 
2.20.1

