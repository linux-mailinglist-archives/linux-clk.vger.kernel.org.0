Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1977C20471B
	for <lists+linux-clk@lfdr.de>; Tue, 23 Jun 2020 04:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731415AbgFWCHq (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 22 Jun 2020 22:07:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:44664 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730804AbgFWCHq (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 22 Jun 2020 22:07:46 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9DDA120720;
        Tue, 23 Jun 2020 02:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592878065;
        bh=YNrYfuA6FZhhsYSAt455rW8cI8ui18M08tk4z9xdIfA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=PWdoT00y42kPQeOWu4jBqlvPq0QkDKnsHPHGcLGpxOjSU8C/owNL+VfPuUpnN7MXa
         6jTS7IS+Bu2gLY8ShVyotzyvNCtqHajnWJFTRZhvn4t2D+k07zYoRncex1ueOARuBl
         /bk/OgDnEZNM6vlfsgJmVP6hZlAjZtdjCLvMY2qg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200603111923.3545261-1-thierry.reding@gmail.com>
References: <20200603111923.3545261-1-thierry.reding@gmail.com>
Subject: Re: [PATCH 1/2] clk: tegra: Capitalization fixes
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        LABBE Corentin <clabbe@baylibre.com>,
        Dmitry Osipenko <digetx@gmail.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org
To:     Thierry Reding <thierry.reding@gmail.com>
Date:   Mon, 22 Jun 2020 19:07:45 -0700
Message-ID: <159287806503.62212.1465425499140080735@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Thierry Reding (2020-06-03 04:19:22)
> From: Thierry Reding <treding@nvidia.com>
>=20
> HW, XUSB and PLL are abbreviations and should be all-uppercase.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
