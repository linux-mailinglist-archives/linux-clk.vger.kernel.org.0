Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69202160A1F
	for <lists+linux-clk@lfdr.de>; Mon, 17 Feb 2020 06:50:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725855AbgBQFue (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 17 Feb 2020 00:50:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:56946 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725835AbgBQFue (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 17 Feb 2020 00:50:34 -0500
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6EA1C2070B;
        Mon, 17 Feb 2020 05:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581918633;
        bh=MjiPieCmyZRIzZ0W3qjRJdsz7q6ukow9JNgZCvHQULk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DnvSmgYEMsMlIYhxzZr94FjmiRqHBWTXU/6QhiRjG43Pa6/5SD2Y5Ur0/iTwTKKMJ
         wNIHG+6YYJw0XaUH+Htk4X3RGk6/wYkotG3QiyA7Ot37U4rQ4u0LVORQOIuMKt7ERS
         8jF5vyeju74lhCviC1vI+OuLXPaBr3CMyrwICO98=
Date:   Mon, 17 Feb 2020 13:50:28 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, sboyd@kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] clk: imx8mm: Fix the CLKO1 source select list
Message-ID: <20200217055027.GC6042@dragon>
References: <20200211030813.13992-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200211030813.13992-1-festevam@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Feb 11, 2020 at 12:08:12AM -0300, Fabio Estevam wrote:
> The CLKO1 clock source select list is the following as per the i.MX8MM
> Reference Manual (put in increasing order):
> 
> 000 - 24M_REF_CLK
> 001 - SYSTEM_PLL1_CLK
> 010 - None
> 011 - SYSTEM_PLL1_DIV4
> 100 - AUDIO_PLL2_CLK
> 101 - SYSTEM_PLL2_DIV2
> 110 - VPU_PLL_CLK
> 111 - SYSTEM_PLL1_DIV10
> 
> Fix it accordingly.
> 
> Fixes: ba5625c3e272 ("clk: imx: Add clock driver support for imx8mm")
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied both, thanks.
