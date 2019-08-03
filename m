Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 417A8805B6
	for <lists+linux-clk@lfdr.de>; Sat,  3 Aug 2019 12:29:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388429AbfHCK3N (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 3 Aug 2019 06:29:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:37186 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388201AbfHCK3N (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 3 Aug 2019 06:29:13 -0400
Received: from X250.getinternet.no (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B30AD2166E;
        Sat,  3 Aug 2019 10:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564828152;
        bh=Hxnc5GyLr0im/KCz9iGwtaayj36GKPyIDYYJ7KeLgzo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b6psH8+CzeQ1Md0YRG5KEv+/hiUGWVyVZfnfpXGYPsveee27yXMMHQvmCTJyME84C
         /Me78je3xPfkkqdyGbL4BtCp+zTpRocnDuIXdemeDJcdEDUX9Vw9sTGJz7E/zbKeGi
         bEGYqvPnwTKiXK9w+yQiTaibdB7qM3LV/55hnSPg=
Date:   Sat, 3 Aug 2019 12:29:05 +0200
From:   Shawn Guo <shawnguo@kernel.org>
To:     Leonard Crestez <leonard.crestez@nxp.com>
Cc:     Daniel Baluta <daniel.baluta@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>, Li Jun <jun.li@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jacky Bai <ping.bai@nxp.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: imx8mm: Fix boot hang at clk init
Message-ID: <20190803102855.GJ8870@X250.getinternet.no>
References: <718c781b77081d6974fd91d5dff7b0f8737757b0.1564048197.git.leonard.crestez@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <718c781b77081d6974fd91d5dff7b0f8737757b0.1564048197.git.leonard.crestez@nxp.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jul 25, 2019 at 12:50:53PM +0300, Leonard Crestez wrote:
> The assigned-clock-rates property is incorrect (4 elements while
> assigned-clocks has length 5) and boot hangs while assigning some
> unexpected rates.
> 
> Fix by inserting another <400000000>, the intention is to assign both
> IMX8MM_CLK_AUDIO_AHB and IMX8MM_CLK_IPG_AUDIO_ROOT 400mhz.
> 
> Fixes: df1703896a17 ("arm64: dts: imx8mm: Init rates and parents configs for clocks")
> 
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
> 
> ---
> Changes since v1:
> * Insert and 400mhz instead of <0>
> Link to v1: https://patchwork.kernel.org/patch/11057515/
> 
> Should probably be squashed into df1703896a17

Done, thanks.
