Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E13E1C4D91
	for <lists+linux-clk@lfdr.de>; Tue,  5 May 2020 07:10:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725830AbgEEFKA (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 5 May 2020 01:10:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:33160 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725320AbgEEFKA (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 5 May 2020 01:10:00 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 132BA206E6;
        Tue,  5 May 2020 05:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588655400;
        bh=SXbbgm7JowSfxiWmwGv7Z8Q2AXlRiuO+6V5M9KxoZeA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=PuVd6ONdgRi1l/0enQFaazGGRj6Quz7U/Zh2sEeGgZkhI0qyiwT8CZk9DHHYkqpnN
         D0oBFbt16yvFKt+JBrN+jyk9oeQhNZn3jDNPturL9izjAG5A8MDilQzgRdw8/T74o/
         m+QwsaR1YKOBW9eRAiNnoZnasOXkVh6ZJpV6y6+c=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1584279836-29825-6-git-send-email-aisheng.dong@nxp.com>
References: <1584279836-29825-1-git-send-email-aisheng.dong@nxp.com> <1584279836-29825-6-git-send-email-aisheng.dong@nxp.com>
Subject: Re: [PATCH V6 05/12] clk: imx: scu: allow scu clk to take device pointer
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com,
        shawnguo@kernel.org, fabio.estevam@nxp.com, linux-imx@nxp.com,
        kernel@pengutronix.de, Dong Aisheng <aisheng.dong@nxp.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org
Date:   Mon, 04 May 2020 22:09:59 -0700
Message-ID: <158865539933.11125.5732308113699998738@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dong Aisheng (2020-03-15 06:43:49)
> Used to support runtime pm.
>=20
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
