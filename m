Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3209611650A
	for <lists+linux-clk@lfdr.de>; Mon,  9 Dec 2019 03:31:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726706AbfLICbs (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 8 Dec 2019 21:31:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:41038 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726635AbfLICbs (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 8 Dec 2019 21:31:48 -0500
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 04380206DB;
        Mon,  9 Dec 2019 02:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575858707;
        bh=8+8UFXbOiRuBoUitT9o7PTg1+Ylp9ikDv43w7+HAuaI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UFVSvqL6hIAz9Bnj8X3YscVQ9gytFtuBY/+nWEzFoGz8rKa0caRA++qoRUF6z21Vk
         NzGtPPGYDopE5btAN3H0rA6QdJSZ4bQEH6WMH4i4hEv59G17r49EYQT+ck14YjY/wk
         KHq2qF8s9YXdjm3LIRSfhHCb0Os2kKYMtJrm590g=
Date:   Mon, 9 Dec 2019 10:31:35 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     sboyd@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: imx7ulp: Fix watchdog2 clock name typo
Message-ID: <20191209023134.GU3365@dragon>
References: <20191119192848.27043-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191119192848.27043-1-festevam@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Nov 19, 2019 at 04:28:48PM -0300, Fabio Estevam wrote:
> There is a typo in the watchdog2 clock name. 
> 
> Fix it by changing it to "wdg2".
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied, thanks.
