Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CAE931466D
	for <lists+linux-clk@lfdr.de>; Tue,  9 Feb 2021 03:34:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbhBICdn (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 8 Feb 2021 21:33:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:33676 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230320AbhBICdl (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 8 Feb 2021 21:33:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5556A64EC3;
        Tue,  9 Feb 2021 02:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612837958;
        bh=EEL7gg4cXU7aObYgp9K2pARsPdYTJanW9c/82qv+3ck=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=VDU4hBdwuItSWay16QvgJmc3uaI9KWPoaRL9Vhik8svvU0Thxwvt91x1lt2p/BhuB
         qxDebp2SzI2nhrRXIJZWFKLXwEy4YZz2NPyp4h8pGWOXwlvagRWY/IPRm0ldVPzjjm
         kP8jLJEQ87TSfXID31qCwIXE6cTflQDW+0fZ02+mHLEjmW1AaUIZcqYfQETqYUkpsB
         zBeInPd1GbRT0mcWn/QE19667e1w35cINaCeW2H9FnA9QyaAbu+d6d+FcI+74dUIUd
         0l8q5kUEU/V1GVw3eaXkB5OSmlDpOKtLMQMrp1zCko/zwG34++ZRFZ/YesQGvq5jx8
         l9DJlg8lQl90g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210121071659.1226489-7-m.tretter@pengutronix.de>
References: <20210121071659.1226489-1-m.tretter@pengutronix.de> <20210121071659.1226489-7-m.tretter@pengutronix.de>
Subject: Re: [PATCH v3 06/15] soc: xilinx: vcu: implement PLL disable
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     m.mtretter@pengutronix.de, michals@xilinx.com,
        kernel@pengutronix.de, mturquette@baylibre.com
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Date:   Mon, 08 Feb 2021 18:32:36 -0800
Message-ID: <161283795689.76967.6938401036945584265@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Michael Tretter (2021-01-20 23:16:50)
> The disabling of the PLL is not fully implemented, because according to
> the ZynqMP register reference the RESET, POR_IN and PWR_POR bits have to
> be set to bring the PLL into reset.
>=20
> Set the bits to disable the PLL.
>=20
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> Acked-by: Michal Simek <michal.simek@xilinx.com>
> ---

Applied to clk-next
