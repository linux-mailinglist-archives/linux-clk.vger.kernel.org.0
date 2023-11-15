Return-Path: <linux-clk+bounces-38-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8229B7E5052
	for <lists+linux-clk@lfdr.de>; Wed,  8 Nov 2023 07:28:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23B9C281444
	for <lists+linux-clk@lfdr.de>; Wed,  8 Nov 2023 06:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 298C9D266;
	Wed,  8 Nov 2023 06:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="bh2hlNo6"
X-Original-To: linux-clk@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F08BCA78;
	Wed,  8 Nov 2023 06:27:57 +0000 (UTC)
X-Greylist: delayed 528 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 07 Nov 2023 22:27:55 PST
Received: from mail-m24125.xmail.ntesmail.com (mail-m24125.xmail.ntesmail.com [45.195.24.125])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E31CF10C9;
	Tue,  7 Nov 2023 22:27:55 -0800 (PST)
DKIM-Signature: a=rsa-sha256;
	b=bh2hlNo6dzyFmNLEY6Na8IWWjLLQXYbndw6ZHcePa12yHuT2KCYfH5SD6iQj2v7T6azGJ+uLJjyy4GkXqwPpinXAI9vflBOb33rpld1pef/xpPXP6jnEmfLxL0zxixKdvdYg8SDv7daMhNfnMTTTsDibnfQ4FnCnzk5Wkh9IXHs=;
	c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=EYhFm8KYEzG2CppS6J9WJJh+A9TxGzlWeRtoXCRJa+4=;
	h=date:mime-version:subject:message-id:from;
Received: from localhost.localdomain (unknown [58.22.7.114])
	by mail-m11877.qiye.163.com (Hmail) with ESMTPA id 518AB4002F3;
	Wed,  8 Nov 2023 14:18:27 +0800 (CST)
From: Elaine Zhang <zhangqing@rock-chips.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	kever.yang@rock-chips.com,
	zhangqing@rock-chips.com,
	heiko@sntech.de,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	huangtao@rock-chips.com,
	andy.yan@rock-chips.com
Subject: [PATCH v5 0/4] rockchip: add GATE_LINK
Date: Wed,  8 Nov 2023 14:18:18 +0800
Message-Id: <20231108061822.4871-1-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.17.1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGhlMGlZKQkwfTkwZT0oZTBhVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlOQ1VJSVVMVUpKT1lXWRYaDxIVHRRZQVlPS0hVSk1PSU5JVUpLS1VKQl
	kG
X-HM-Tid: 0a8bad9509af2eb3kusn518ab4002f3
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MU06Njo4MTw0MQpNFikPSEM3
	MRBPFAlVSlVKTUJCT0lPSEtDSElKVTMWGhIXVQETGhUcChIVHDsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQU1PSks3Bg++
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Recent Rockchip SoCs have a new hardware block called Native Interface
Unit (NIU), which gates clocks to devices behind them. These effectively
need two parent clocks.
Use GATE_LINK to handle this.

change in v5:
[PATCH v5 1/4]: No change
[PATCH v5 2/4]: Fix the:
Oct 20 18:25:04 rk3588-evb1 kernel: clk: Disabling unused clocks
Oct 20 18:25:04 rk3588-evb1 kernel: ------------[ cut here ]------------
Oct 20 18:25:04 rk3588-evb1 kernel: hclk_rkvenc0 already disabled
Oct 20 18:25:04 rk3588-evb1 kernel: WARNING: CPU: 4 PID: 1 at drivers/clk/clk.c:1090 clk_core_disable+0x1b0/0x1e0
Oct 20 18:25:04 rk3588-evb1 kernel: Modules linked in:
Oct 20 18:25:04 rk3588-evb1 kernel: CPU: 4 PID: 1 Comm: swapper/0 Not tainted 6.6.0-rc6-00044-g31c3dbd16ca1 #1120
Oct 20 18:25:04 rk3588-evb1 kernel: Hardware name: Rockchip RK3588 EVB1 V10 Board (DT)
Oct 20 18:25:04 rk3588-evb1 kernel: pstate: 604000c9 (nZCv daIF +PAN-UAO -TCO -DIT -SSBS BTYPE=--)
Oct 20 18:25:04 rk3588-evb1 kernel: pc : clk_core_disable+0x1b0/0x1e0
Oct 20 18:25:04 rk3588-evb1 kernel: lr : clk_core_disable+0x1b0/0x1e0
Oct 20 18:25:04 rk3588-evb1 kernel: sp : ffff8000846fbbf0
Oct 20 18:25:04 rk3588-evb1 kernel: x29: ffff8000846fbbf0 x28:ffff8000833a0008 x27: ffff8000830e0130
Oct 20 18:25:04 rk3588-evb1 kernel: x26: ffff800082ffcff0 x25:ffff8000830b9be8 x24: ffff800083236100
Oct 20 18:25:04 rk3588-evb1 kernel: x23: 000000000000104a x22:0000000000000000 x21: ffff800084669000
Oct 20 18:25:04 rk3588-evb1 kernel: x20: ffff00040087ca00 x19:ffff00040087ca00 x18: ffffffffffffffff
Oct 20 18:25:04 rk3588-evb1 kernel: x17: ffff80008435d050 x16:ffff80008435cfe0 x15: 0720072007200720
Oct 20 18:25:04 rk3588-evb1 kernel: x14: 0720072007200720 x13:0720072007200720 x12: 0720072007200720
Oct 20 18:25:04 rk3588-evb1 kernel: x11: 0720072007200720 x10:ffff800084079890 x9 : ffff800080128a78
Oct 20 18:25:04 rk3588-evb1 kernel: x8 : 00000000ffffefff x7 :ffff800084079890 x6 : 80000000fffff000
Oct 20 18:25:04 rk3588-evb1 kernel: x5 : 0000000000000000 x4 :0000000000000000 x3 : 0000000000000000
Oct 20 18:25:04 rk3588-evb1 kernel: x2 : 0000000000000000 x1 :0000000000000000 x0 : ffff000400a08000
Oct 20 18:25:04 rk3588-evb1 kernel: Call trace:
Oct 20 18:25:04 rk3588-evb1 kernel:  clk_core_disable+0x1b0/0x1e0
Oct 20 18:25:04 rk3588-evb1 kernel:  clk_disable+0x38/0x60
Oct 20 18:25:04 rk3588-evb1 kernel:  clk_gate_link_disable+0x2c/0x48
Oct 20 18:25:04 rk3588-evb1 kernel:  clk_disable_unused_subtree+0x104/0x270
Oct 20 18:25:04 rk3588-evb1 kernel:  clk_disable_unused_subtree+0x34/0x270
Oct 20 18:25:04 rk3588-evb1 kernel:  clk_disable_unused_subtree+0x34/0x270
Oct 20 18:25:04 rk3588-evb1 kernel:  clk_disable_unused_subtree+0x34/0x270
Oct 20 18:25:04 rk3588-evb1 kernel:  clk_disable_unused_subtree+0x34/0x270
Oct 20 18:25:04 rk3588-evb1 kernel:  clk_disable_unused_subtree+0x34/0x270
Oct 20 18:25:04 rk3588-evb1 kernel:  clk_disable_unused+0x54/0x148
Oct 20 18:25:04 rk3588-evb1 kernel:  do_one_initcall+0x48/0x2a8
Oct 20 18:25:04 rk3588-evb1 kernel:  kernel_init_freeable+0x1ec/0x3d8
Oct 20 18:25:04 rk3588-evb1 kernel:  kernel_init+0x2c/0x1f8
Oct 20 18:25:04 rk3588-evb1 kernel:  ret_from_fork+0x10/0x20
Oct 20 18:25:04 rk3588-evb1 kernel: ---[ end trace 0000000000000000 ]---
Oct 20 18:25:04 rk3588-evb1 kernel: ------------[ cut here ]------------

[PATCH v5 3/4]: Rollback to pacth v3.
[PATCH v5 4/4]: Fix the:
Oct 20 19:22:37 rk3588-evb1 kernel: pclk_vo0grf clk_register field
Oct 20 19:22:37 rk3588-evb1 kernel: rockchip_clk_register_branches:failed to register clock pclk_vo0grf: -17
Oct 20 19:22:37 rk3588-evb1 kernel: pclk_vo1grf clk_register field
Oct 20 19:22:37 rk3588-evb1 kernel: rockchip_clk_register_branches:failed to register clock pclk_vo1grf: -17

change in v4:
[PATCH v4 1/4]: No change
[PATCH v4 2/4]: No change
[PATCH v4 3/4]: dropping CLK_NR_CLKS,reword commit message
[PATCH v4 4/4]: No change

change in V3:
[PATCH v3 1/4]: new, export clk_gate_endisable for PATCH2.
[PATCH v3 2/4]: reuse clk_gate_endisable and clk_gate_is_enabled.
                add prepare and unprepare ops.
[PATCH v3 3/4]: No change
[PATCH v3 4/4]: reword commit message

change in V2:
[PATCH v2 1/3]: fix reported warnings
[PATCH v2 2/3]: Bindings submit independent patches
[PATCH v2 3/3]: fix reported warnings

Elaine Zhang (4):
  clk: gate: export clk_gate_endisable
  clk: rockchip: add support for gate link
  dt-bindings: clock: rk3588: export PCLK_VO1GRF clk id
  clk: rockchip: rk3588: Adjust the GATE_LINK parameter

 drivers/clk/clk-gate.c                        |   3 +-
 drivers/clk/rockchip/Makefile                 |   1 +
 drivers/clk/rockchip/clk-gate-link.c          | 120 ++++++++++++++++++
 drivers/clk/rockchip/clk-rk3588.c             | 114 +++++++++--------
 drivers/clk/rockchip/clk.c                    |   7 +
 drivers/clk/rockchip/clk.h                    |  22 ++++
 .../dt-bindings/clock/rockchip,rk3588-cru.h   |   3 +-
 include/linux/clk-provider.h                  |   1 +
 8 files changed, 214 insertions(+), 57 deletions(-)
 create mode 100644 drivers/clk/rockchip/clk-gate-link.c

-- 
2.17.1


