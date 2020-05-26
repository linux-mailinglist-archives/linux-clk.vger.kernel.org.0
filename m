Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88C9A1C6513
	for <lists+linux-clk@lfdr.de>; Wed,  6 May 2020 02:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728642AbgEFA2p (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 5 May 2020 20:28:45 -0400
Received: from gloria.sntech.de ([185.11.138.130]:34992 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728609AbgEFA2p (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 5 May 2020 20:28:45 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1jW7vV-0005g9-E9; Wed, 06 May 2020 02:28:41 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock fix for 5.7
Date:   Wed, 06 May 2020 02:28:40 +0200
Message-ID: <2256140.alkMTrVvHO@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Mike, Stephen,

please find below a rockchip clock fix for 5.7
Please pull

Thanks
Heiko

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.7-rockchip-clk-fixes1

for you to fetch changes up to cec9d101d70a3509da9bd2e601e0b242154ce616:

  clk: rockchip: fix incorrect configuration of rk3228 aclk_gpu* clocks (2020-04-13 09:35:24 +0200)

----------------------------------------------------------------
Fix for wrongly defines rk3228 aclk_gpu*

----------------------------------------------------------------
Justin Swartz (1):
      clk: rockchip: fix incorrect configuration of rk3228 aclk_gpu* clocks

 drivers/clk/rockchip/clk-rk3228.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)



