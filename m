Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A76F533E640
	for <lists+linux-clk@lfdr.de>; Wed, 17 Mar 2021 02:37:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbhCQBgx (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 16 Mar 2021 21:36:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:59866 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230217AbhCQBgk (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 16 Mar 2021 21:36:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EF29D64F99;
        Wed, 17 Mar 2021 01:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615945000;
        bh=Sc97qhhpJZEboCOxPhj04eeJ/fGLVXl1L3DyhupBQJc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=jVb6urGcVHcBQTAoM/5siv6wYgCE6Aapy2KqcHi1yL0d+PWtdhuBBEMJ+lgnesdFd
         lhvkzm3NAp7n/FE2EtFy94ZQYZSD5tZJ/EaSZ1jCmkMA/oY0lk8PwOtW9DZzdYlXz3
         7NWFmPrQOQNHhQMbz8zIPMzUBxSaJ5E9vJ4RmPEwVObR/kgDUuIFh7ka/A5xiahnku
         +J5cY/aw4R44WkEVyGEX6wreKRYyMaEazOU3JgGgCW/KNPkpO7/+z3uwZrJARzyb9n
         QFD2thYFoybH41pW9ehFo9iRQWGXe11TXkD68yUAlRBGogkkuPFBoU6J/gZYUroPgI
         /AwOFa9XCrrGw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210315112502.343699-2-heiko@sntech.de>
References: <20210315112502.343699-1-heiko@sntech.de> <20210315112502.343699-2-heiko@sntech.de>
Subject: Re: [PATCH 2/2] clk: rockchip: drop MODULE_ALIAS from rk3399 clock controller
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, zhangqing@rock-chips.com,
        mturquette@baylibre.com, linux-rockchip@lists.infradead.org
To:     heiko@sntech.de
Date:   Tue, 16 Mar 2021 18:36:38 -0700
Message-ID: <161594499885.1478170.3779535512987411515@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Heiko Stuebner (2021-03-15 04:25:02)
> As suggested by Stephen during the rk3568 clock review, the MOUDLE_ALIAS
> doesn't serve any meaningful purpose, so drop it from the rk3399 as well.
>=20
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
