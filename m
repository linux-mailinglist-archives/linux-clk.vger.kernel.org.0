Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CF14855C1
	for <lists+linux-clk@lfdr.de>; Thu,  8 Aug 2019 00:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389207AbfHGW03 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 7 Aug 2019 18:26:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:53532 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388881AbfHGW03 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 7 Aug 2019 18:26:29 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DAC4D214C6;
        Wed,  7 Aug 2019 22:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565216789;
        bh=bXSGmINCGVeaEdO2en4+gg4xORpvlIWdUVJahgFgocw=;
        h=In-Reply-To:References:From:Cc:To:Subject:Date:From;
        b=qnIdJwOuTFz8IRQm9XhLwtAU1lyGg0wg4dBAjgS8hCT7VsuOXuLX3VaC4whhYTULK
         gAC28LBiRVNOuXjRk1dSujLMG4N5qV8rUbAbILq/ITMh/IyGRapcD5pcbSA+jki0vU
         QSMwyyuaSwTNPRF2yhRIawwTXJ2K5zl8qP7UYk1w=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190804162824.6338-1-nishkadg.linux@gmail.com>
References: <20190804162824.6338-1-nishkadg.linux@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>, david@lechnology.com,
        linux-clk@vger.kernel.org, mturquette@baylibre.com, nsekhar@ti.com
Subject: Re: [PATCH] clk: davinci: pll: Add of_node_put() in of_davinci_pll_init()
User-Agent: alot/0.8.1
Date:   Wed, 07 Aug 2019 15:26:28 -0700
Message-Id: <20190807222628.DAC4D214C6@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Nishka Dasgupta (2019-08-04 09:28:24)
> The variable child in the function of_davinci_pll_init takes the value
> of of_get_child_by_name, which gets a node but does not put it. If child
> is not put before the function returns it may cause a memory leak. Hence
> put child before two return statements.
> Issue found with Coccinelle.
>=20
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---

Applied to clk-next

