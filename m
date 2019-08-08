Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 928BF864FD
	for <lists+linux-clk@lfdr.de>; Thu,  8 Aug 2019 17:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729925AbfHHPAf (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 8 Aug 2019 11:00:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:41188 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728380AbfHHPAf (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 8 Aug 2019 11:00:35 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6A890217D7;
        Thu,  8 Aug 2019 15:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565276434;
        bh=7ABlbrr024uC6TeWzpfCfq9aUOmdkt772JW/xbpxA4Q=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ITO6wphfn03+Nq0nJtFCyJCa9O06MVYjKZw3c6HlAztuSUSoDy/kzaxCRTZf4rbdT
         COJeEwFzkStAiTJtpokkS6AwEK4fwrvx4ebMzVcUyMLvzwCTbjdlF9i8FplNOnjAse
         eOaoygo89uORFI/foWt3HdnqkatV30mLu/7pFgIQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <29453ee8e820457d87a8faf9d496390e59c6826f.1562073871.git.leonard.crestez@nxp.com>
References: <68e96af2df96512300604d797ade2088d7e6e496.1562073871.git.leonard.crestez@nxp.com> <29453ee8e820457d87a8faf9d496390e59c6826f.1562073871.git.leonard.crestez@nxp.com>
Subject: Re: [PATCH v3 2/2] clk: Assert prepare_lock in clk_core_get_boundaries
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Leonard Crestez <leonard.crestez@nxp.com>
User-Agent: alot/0.8.1
Date:   Thu, 08 Aug 2019 08:00:33 -0700
Message-Id: <20190808150034.6A890217D7@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Leonard Crestez (2019-07-02 06:27:10)
> This function iterates the clk consumer list on clk_core so it must be
> called under prepare_lock. This is already done by all callers but add a
> lockdep assert to check anyway.
>=20
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
>=20
> ---

Applied to clk-next

