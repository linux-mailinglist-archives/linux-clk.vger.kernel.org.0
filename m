Return-Path: <linux-clk+bounces-1294-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 620F480F8D9
	for <lists+linux-clk@lfdr.de>; Tue, 12 Dec 2023 22:05:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B3AD1F214E3
	for <lists+linux-clk@lfdr.de>; Tue, 12 Dec 2023 21:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A728465A7A;
	Tue, 12 Dec 2023 21:05:07 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFA50AD
	for <linux-clk@vger.kernel.org>; Tue, 12 Dec 2023 13:05:01 -0800 (PST)
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1rD9w2-0006qK-SQ; Tue, 12 Dec 2023 22:04:58 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock changes for 6.8 #1
Date: Tue, 12 Dec 2023 22:04:58 +0100
Message-ID: <2913962.e9J7NaK4W3@phil>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Mike, Stephen,

please find below a pull-request with some small Rockchip stuff.

Please pull.

Thanks
Heiko


The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.8-rockchip-clk1

for you to fetch changes up to 721bf080f249ab2adcc4337abe164230bfb8594f:

  clk: rockchip: rk3568: Mark pclk_usb as critical (2023-12-05 10:45:55 +0100)

----------------------------------------------------------------
Two new pll rates and an additional critical clock on rk3568.

----------------------------------------------------------------
Chris Morgan (3):
      clk: rockchip: rk3568: Add PLL rate for 115.2MHz
      clk: rockchip: rk3568: Add PLL rate for 126.4MHz
      clk: rockchip: rk3568: Mark pclk_usb as critical

 drivers/clk/rockchip/clk-rk3568.c | 3 +++
 1 file changed, 3 insertions(+)




