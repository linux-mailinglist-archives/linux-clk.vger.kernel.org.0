Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F83D55A52
	for <lists+linux-clk@lfdr.de>; Tue, 25 Jun 2019 23:54:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbfFYVyc (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 25 Jun 2019 17:54:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:57316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725914AbfFYVyc (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 25 Jun 2019 17:54:32 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9ED6A2080C;
        Tue, 25 Jun 2019 21:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561499671;
        bh=dztdrZPzf7vyV4Xy6KCFp9Vc0IyqRQ3F7G6u1wNJE9M=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=nlEQHXhMxxE+g/R3LryK8Clyd4JwHRYeLZECcK+r9B3MfJt+2ERzecWVoYkHNNzSZ
         I2xkm+UbtRRpi1zczZJGggytqfCpRjhMLbBM5CNG/GyHZw2W6QWBsVD8ZTKa2Yz/R2
         gK6yD9I7OhthE+2G2TinIGN7yq95tUb2vVP919f4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <82d6e1d63959ecb23bdcd363e93a27d08eee6859.1560164542.git.leonard.crestez@nxp.com>
References: <82d6e1d63959ecb23bdcd363e93a27d08eee6859.1560164542.git.leonard.crestez@nxp.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Leonard Crestez <leonard.crestez@nxp.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2] clk: Add clk_parent entry in debugfs
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
User-Agent: alot/0.8.1
Date:   Tue, 25 Jun 2019 14:54:30 -0700
Message-Id: <20190625215431.9ED6A2080C@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Leonard Crestez (2019-06-10 04:06:38)
> This allows to easily determine the parent in shell scripts without
> parsing more complex files.
>=20
> Add the clk_parent file for all clks which can have a parent, not just
> muxes. This way it can be used to determine the clk tree structure
> without parsing more complex files.
>=20
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
>=20
> ---

Applied to clk-next

