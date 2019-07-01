Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00AB3558EA
	for <lists+linux-clk@lfdr.de>; Tue, 25 Jun 2019 22:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726053AbfFYUeH (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 25 Jun 2019 16:34:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:57264 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726274AbfFYUeG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 25 Jun 2019 16:34:06 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D1C8D2085A;
        Tue, 25 Jun 2019 20:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561494845;
        bh=+odojV7RIvLw+rGgocmzwcB4oB9O4JdBqQ7XZ0k3jzw=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=2fNmV/krctjiKcMlEwlYu8UyPBCN20aTw8Zj9aE2+1v5IP2zjHCAkMUzb5wzRouD6
         YKTOgedCjZdqc/VpzlKtowDTCU32AaZGu3zmO7PSmLbs0lgTTpsqegCXCGGAP6Nibb
         CRKHxsyauZ/hWd7nJRBkmfRptGKDPP9cke/j7zO0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190624153615.GA20480@dragon>
References: <20190624153615.GA20480@dragon>
To:     Shawn Guo <shawnguo@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [GIT PULL] i.MX clock changes for 5.3
Cc:     Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
User-Agent: alot/0.8.1
Date:   Tue, 25 Jun 2019 13:34:05 -0700
Message-Id: <20190625203405.D1C8D2085A@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shawn Guo (2019-06-24 08:36:35)
> Hi Stephen,
>=20
> Here is i.MX clock driver changes I queued for 5.3.  Please keep commit
> 53c6a2ec018b ("clk: imx8m: Add GIC clock") stable, as I pulled it into
> i.MX DT tree as dependency.  Thanks!
>=20
> Shawn
>=20
>=20
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0eb=
d9:
>=20
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/i=
mx-clk-5.3
>=20
> for you to fetch changes up to 15c64ff7625513c551e2b50c1ae28f729b61c5d3:
>=20
>   clk: imx8mq: Keep uart clocks on during system boot (2019-06-24 09:43:4=
0 +0800)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

