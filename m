Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05BFF2A7461
	for <lists+linux-clk@lfdr.de>; Thu,  5 Nov 2020 02:05:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388033AbgKEBFc (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 4 Nov 2020 20:05:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:55148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732802AbgKEBFb (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 4 Nov 2020 20:05:31 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1CEDD20867;
        Thu,  5 Nov 2020 01:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604538331;
        bh=n1UDwnjtdtl0wxMFMaZLmjEJcrELCPsEEzJBEY7dlfY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=XPd1WDPjxw5WcFWNemCYbt8S2tR56IfUjipN1+Pi0rY7KFjwUQX/bmA24vhqjOcOw
         7SqDUMsWWTA9dwafZMYlw9pxYyllikWhXqjpY7bc/zjT4dxf8oNGR3Y0qvJvf0p65b
         mnwGl4uNbqNX5WC8JBTBi8lkyCBYrtPWATr/nZb0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1604402306-5348-3-git-send-email-abel.vesa@nxp.com>
References: <1604402306-5348-1-git-send-email-abel.vesa@nxp.com> <1604402306-5348-3-git-send-email-abel.vesa@nxp.com>
Subject: Re: [PATCH v5 02/14] dt-bindings: reset: imx8mp: Add audio blk_ctl reset IDs
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@nxp.com>
To:     Abel Vesa <abel.vesa@nxp.com>, Adam Ford <aford173@gmail.com>,
        Anson Huang <anson.huang@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Marek Vasut <marek.vasut@gmail.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Peng Fan <peng.fan@nxp.com>, Rob Herring <robh@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>
Date:   Wed, 04 Nov 2020 17:05:29 -0800
Message-ID: <160453832991.3965362.5979648643060653589@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Abel Vesa (2020-11-03 03:18:14)
> These will be used by the imx8mp for blk_ctl driver.
>=20
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
