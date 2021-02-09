Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC37731468B
	for <lists+linux-clk@lfdr.de>; Tue,  9 Feb 2021 03:38:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230466AbhBIChi (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 8 Feb 2021 21:37:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:34364 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229968AbhBICgj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 8 Feb 2021 21:36:39 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC0E464EC4;
        Tue,  9 Feb 2021 02:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612838149;
        bh=DuhMN6Wox4InMmo/5qe2SWgz4CAp6D0VfYxWRrvj95g=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=q3shuHXAFZPgkmlT6wxp9Xf8Cejyx0kZciyzWvlWJQY9LW/FnAZBuJc++3SRpRoik
         DNVFjF+JVDakCPu9XSaRETfM+riyWlD0KNg0KwhjjdqM3UA3FdflQsxgPH+5VxoSjD
         WcO4FMQnzPsYGUDN+QHV/AuBiQgMKYFKOgtYD+Ika2rWIZC4pCwyvHKT1aMmWx1EIM
         zZoYW/52eOtXEf2a8Z1FKJzAyeaYGQI2D5sg5JgYmwajd54MIuL1BVALWwpiIPylyL
         VfCI4jOeeIu8cWUc9fFlD+vKT1x2a4lMVVshreRz6zLgs1WTf3UjGwqpWkc2yz0iHs
         BaKFP0K3UDTDA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210121071659.1226489-16-m.tretter@pengutronix.de>
References: <20210121071659.1226489-1-m.tretter@pengutronix.de> <20210121071659.1226489-16-m.tretter@pengutronix.de>
Subject: Re: [PATCH v3 15/15] clk: xilinx: move xlnx_vcu clock driver from soc
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     m.mtretter@pengutronix.de, michals@xilinx.com,
        kernel@pengutronix.de, mturquette@baylibre.com
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Date:   Mon, 08 Feb 2021 18:35:48 -0800
Message-ID: <161283814859.76967.9828356895386919409@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Michael Tretter (2021-01-20 23:16:59)
> The xlnx_vcu driver is actually a clock controller driver which provides
> clocks that can be used by a driver for the encoder/decoder units. There
> is no reason to keep this driver in soc. Move the driver to clk.
>=20
> NOTE: The register mapping actually contains registers for AXI
> performance monitoring, but these are not used by the driver.
>=20
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> Acked-by: Michal Simek <michal.simek@xilinx.com>
> ---

Applied to clk-next
