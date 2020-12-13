Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA292D8BDA
	for <lists+linux-clk@lfdr.de>; Sun, 13 Dec 2020 06:48:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730347AbgLMFsU (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 13 Dec 2020 00:48:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:46860 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730275AbgLMFsU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 13 Dec 2020 00:48:20 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607838459;
        bh=emJscVaJcn5wfYYYNdfyVgZfAMxyUjS4Sx47UpFCBN4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=F8YZpDyZxJmiWjGhxVq9VgeErhrB0eJa0UZD4lnrAUFIaqBDZIBp3mUdHwk1eGsoR
         uGHdR1nqQNjmwAct5XhepDBp7yKkB1LYSK3Tf7zpB4yeyrD1JulYGhDOl+95n4KQCz
         pdFhf+ql+ZtyBk/L/nUDN8qgtGQU1gJE4Xke2m/1MwPPulhekZhV3QxqMEiW7zF3J+
         Kga3LTCjZlOY9ME++UlfuOtuaiWmGZBgZv5nMhl07OjHkwK/uEIP8ZK5SrES5SYMaZ
         5qU1cy1EebfS6+siwXdXDzZvB+miwJ8quid9vKuQJqD6TyUdwCVj12gCdvhpubg1TL
         jT2t0mDlYW+mg==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201116075532.4019252-13-m.tretter@pengutronix.de>
References: <20201116075532.4019252-1-m.tretter@pengutronix.de> <20201116075532.4019252-13-m.tretter@pengutronix.de>
Subject: Re: [PATCH 12/12] soc: xilinx: vcu: use bitfields for register definition
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     rajanv@xilinx.com, tejasp@xilinx.com, dshah@xilinx.com,
        rvisaval@xilinx.com, michals@xilinx.com, kernel@pengutronix.de,
        robh+dt@kernel.org, mturquette@baylibre.com,
        Michael Tretter <m.tretter@pengutronix.de>
To:     Michael Tretter <m.tretter@pengutronix.de>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
Date:   Sat, 12 Dec 2020 21:47:38 -0800
Message-ID: <160783845805.1580929.2120756228823538685@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Michael Tretter (2020-11-15 23:55:32)
> This makes the register accesses more readable and is closer to what is
> usually used in the kernel.
>=20
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
