Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FEB7855BD
	for <lists+linux-clk@lfdr.de>; Thu,  8 Aug 2019 00:25:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387999AbfHGWZc (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 7 Aug 2019 18:25:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:53314 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387536AbfHGWZc (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 7 Aug 2019 18:25:32 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A4B79214C6;
        Wed,  7 Aug 2019 22:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565216731;
        bh=7DN7jQLFmk0JqhPULilD+Tp18e5zp+WZCZbei5vkoz8=;
        h=In-Reply-To:References:From:Cc:To:Subject:Date:From;
        b=tJSapUW1WcpXXWvfFttc/q7bxqeDSm5QApEJYgP8XBpUrq0Qb83eFk/5ZAKDxGQiu
         waJiFIkk9eRKyuaQZGk6v8sAZOBnryqFEzsOs/VQ/iJeXIygzr9WxCZwkH50YQi4G6
         y2fDFQoa5Vrzbl6iWoQFO1nbXqNGbVzmnw1YiRHM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190804163445.6862-1-nishkadg.linux@gmail.com>
References: <20190804163445.6862-1-nishkadg.linux@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>,
        linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, mturquette@baylibre.com
Subject: Re: [PATCH] clk: versatile: Add of_node_put() in cm_osc_setup()
User-Agent: alot/0.8.1
Date:   Wed, 07 Aug 2019 15:25:30 -0700
Message-Id: <20190807222531.A4B79214C6@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Nishka Dasgupta (2019-08-04 09:34:44)
> In function cm_osc_setup, variable parent takes the value returned by
> of_get_parent, which gets a node but does not put it. If parent is not
> put before it goes out of scope, it may cause a memory leak.
> Hence put parent before the function terminates.
> Issue found with Coccinelle.
>=20
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---

Applied to clk-next

