Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1749B11CD98
	for <lists+linux-clk@lfdr.de>; Thu, 12 Dec 2019 13:55:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729277AbfLLMzD (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 12 Dec 2019 07:55:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:50896 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729257AbfLLMzD (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 12 Dec 2019 07:55:03 -0500
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DC38922527;
        Thu, 12 Dec 2019 12:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576155302;
        bh=q22ys+7yEejNl95SUh3b+v8OPqjuQuiXy3OCNG1U4zA=;
        h=Date:From:To:Cc:Subject:From;
        b=cL8iUT9zMdfomDvmoiHYfeh7GCl6Y+cJttQhltrKT9SaI80y5NcmH8pXYEPiFcza4
         zaVhwpopscnTIpZOyY2yiOR/ct2u6FtLVHjgs/g51Sry3Nu0tQm/BTi/gZ87Byp89f
         WWoE0iKB5N7dfLh5Ib8t361ZK/sF7DGsDAgggV1A=
Date:   Thu, 12 Dec 2019 20:54:48 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX clock fixes for 5.5
Message-ID: <20191212125447.GL15858@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-clk-fixes-5.5

for you to fetch changes up to c3a5fd15ed0c1494435e4e35fbee734ae46b5073:

  clk: imx: pll14xx: fix clk_pll14xx_wait_lock (2019-12-11 15:07:06 +0800)

----------------------------------------------------------------
i.MX clock fixes for 5.5:
 - Add missing lock to divider in the composite driver for exclusive
   register access.
 - Add missing sentinel for ulp_div_table in clk-imx7ulp driver.
 - Fix clk_pll14xx_wait_lock() function which calls into
   readl_poll_timeout() with incorrect parameter.

----------------------------------------------------------------
Peng Fan (3):
      clk: imx: clk-composite-8m: add lock to gate/mux
      clk: imx: clk-imx7ulp: Add missing sentinel of ulp_div_table
      clk: imx: pll14xx: fix clk_pll14xx_wait_lock

 drivers/clk/imx/clk-composite-8m.c | 2 ++
 drivers/clk/imx/clk-imx7ulp.c      | 1 +
 drivers/clk/imx/clk-pll14xx.c      | 2 +-
 3 files changed, 4 insertions(+), 1 deletion(-)
