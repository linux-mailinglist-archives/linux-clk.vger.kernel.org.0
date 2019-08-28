Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A81C9A0D54
	for <lists+linux-clk@lfdr.de>; Thu, 29 Aug 2019 00:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726725AbfH1WPa (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 28 Aug 2019 18:15:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:52720 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726658AbfH1WP3 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 28 Aug 2019 18:15:29 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 026C522DA7;
        Wed, 28 Aug 2019 22:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567030529;
        bh=WaS7EWeJ3XuqZ+t3BTqCw1KcVapxDI0am0Bcmciu7Ww=;
        h=In-Reply-To:References:Cc:Subject:To:From:Date:From;
        b=wvw9f3ZHg9Rwv/wgwZPyvmRxCLZMkbvDHNX3fOtbIaChIL5RPa+Lv0EXNu3gJkqez
         7iz2BK+siyRe3io8n+7ZNAU5aGp5V9Dpnya77nqSvidFMzhJzCIKvH+ltQIttwJwKn
         dIS2XZfuuBaDvHRpL2uc5qLjQlgBV+BjASw6yVhE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190828102012.4493-5-jbrunet@baylibre.com>
References: <20190828102012.4493-1-jbrunet@baylibre.com> <20190828102012.4493-5-jbrunet@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH RFC 4/5] clk: add placeholder for clock internal data
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Wed, 28 Aug 2019 15:15:28 -0700
Message-Id: <20190828221529.026C522DA7@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jerome Brunet (2019-08-28 03:20:11)
> Add placeholder in clock core to save per clock data.
> Such placeholder could use for clock doing memory allocation in .init().
> It may also be useful for the save/restore_context() callbacks.
>=20
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/clk.c            | 13 +++++++++++++
>  include/linux/clk-provider.h |  2 ++
>  2 files changed, 15 insertions(+)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index c703aa35ca37..aa77a2a98ea4 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -83,6 +83,7 @@ struct clk_core {
>         struct hlist_node       debug_node;
>  #endif
>         struct kref             ref;
> +       void                    *priv;

Why? We have container structures around clk_hw that can be used to
store data and clk_ops that should know to deref said clk_hw pointer in
some way to access that data.
