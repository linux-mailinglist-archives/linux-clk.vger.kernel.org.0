Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A08C4F5C53
	for <lists+linux-clk@lfdr.de>; Sat,  9 Nov 2019 01:39:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728080AbfKIAjj (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 8 Nov 2019 19:39:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:55698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726227AbfKIAjj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 8 Nov 2019 19:39:39 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9406021019;
        Sat,  9 Nov 2019 00:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573259978;
        bh=PkbmG8SyLOdrqjgY6Pqa++Dmk9EPJSwTtjnzeuigXVg=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=b7ZRTTqNUV8Yq5Xx020oNTXoBk1mJQLz+Fuz3eKuV9MPKRX9xLoAKFJfp70F6H1II
         3g5q6RJGPlaAaN3Ds4JqQqNwCah9/QCuVy4PDXtmOp5GQWT4LuS8GMhBkF0SxoXNGd
         YdBFFOgTVuA2LVT5m4R5oFfUctMP3bV3/pgjMEhY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191016125919.1773898-5-thierry.reding@gmail.com>
References: <20191016125919.1773898-1-thierry.reding@gmail.com> <20191016125919.1773898-5-thierry.reding@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/5] clk: tegra: Reimplement SOR clock on Tegra124
User-Agent: alot/0.8.1
Date:   Fri, 08 Nov 2019 16:39:37 -0800
Message-Id: <20191109003938.9406021019@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Thierry Reding (2019-10-16 05:59:18)
> From: Thierry Reding <treding@nvidia.com>
>=20
> In order to allow the display driver to deal uniformly with all SOR
> generations, implement the SOR clocks in a way that is compatible with
> Tegra186 and later.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

