Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AF6512D3B8
	for <lists+linux-clk@lfdr.de>; Mon, 30 Dec 2019 20:06:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727577AbfL3TG5 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 30 Dec 2019 14:06:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:39022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727278AbfL3TG5 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 30 Dec 2019 14:06:57 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 869962053B;
        Mon, 30 Dec 2019 19:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577732816;
        bh=amHJ3V8VY49awvnFzBQckNdcZQlngO4oOAhvrvKvXvc=;
        h=In-Reply-To:References:From:Cc:To:Subject:Date:From;
        b=QCYOal0vGfypOs41/Of7RCc1ZfFTPz69uWYRGfbYSTb6gPqDOytdtlWbft3JAO1Qf
         Cy25zqMi+/U2DMQ/cTYGyCq/D4wdKDQORHw5aMW9bus2nwdbL4xBBNa6NXo8oo+t0i
         vo69H0jz2y/pMZ6jGZKaSjoJPur8Q+zoMZSdh6PI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191204081859.19454-5-zhangqing@rock-chips.com>
References: <20191204081859.19454-1-zhangqing@rock-chips.com> <20191204081859.19454-5-zhangqing@rock-chips.com>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        xxx@rock-chips.com, xf@rock-chips.com, huangtao@rock-chips.com,
        Elaine Zhang <zhangqing@rock-chips.com>
To:     Elaine Zhang <zhangqing@rock-chips.com>, heiko@sntech.de
Subject: Re: [PATCH v4 4/5] clk: rockchip: add pll up and down when change pll freq
User-Agent: alot/0.8.1
Date:   Mon, 30 Dec 2019 11:06:55 -0800
Message-Id: <20191230190656.869962053B@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Elaine Zhang (2019-12-04 00:18:58)
> set pll sequence:
>         ->set pll to slow mode or other plls
>         ->set pll down
>         ->set pll params
>         ->set pll up
>         ->wait pll lock status
>         ->set pll to normal mode
>=20
> To slove the system error:

s/slove/solve/

> wait_pll_lock: timeout waiting for pll to lock
> pll_set_params: pll update unsucessful,
>                 trying to restore old params
>=20
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
