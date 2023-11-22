Return-Path: <linux-clk+bounces-464-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A646B7F48D3
	for <lists+linux-clk@lfdr.de>; Wed, 22 Nov 2023 15:23:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4BFDB20D7E
	for <lists+linux-clk@lfdr.de>; Wed, 22 Nov 2023 14:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9064E1AB;
	Wed, 22 Nov 2023 14:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-clk@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 954C5101;
	Wed, 22 Nov 2023 06:23:17 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,219,1695654000"; 
   d="scan'208";a="183887047"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 22 Nov 2023 23:23:16 +0900
Received: from localhost.localdomain (unknown [10.226.92.150])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id BDB0D4280549;
	Wed, 22 Nov 2023 23:23:13 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/5] Versa3 clock driver enhancements
Date: Wed, 22 Nov 2023 14:23:05 +0000
Message-Id: <20231122142310.203169-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series aims to improve Versa3 clock driver.

The first patch avoids divide by zero operation
The second patch avoid unnecessary structure padding.
The third patch makes return type of callback same as return type of
struct member.
The fourth and fifth patch are cleanup patches.

Biju Das (5):
  clk: versaclock3: Update vc3_get_div() to avoid divide by zero
  clk: versaclock3: Avoid unnecessary padding
  clk: versaclock3: Use u8 return type for get_parent() callback
  clk: versaclock3: Add missing space between ')' and '{'
  clk: versaclock3: Drop ret variable

 drivers/clk/clk-versaclock3.c | 88 ++++++++++++++++-------------------
 1 file changed, 40 insertions(+), 48 deletions(-)

-- 
2.25.1


