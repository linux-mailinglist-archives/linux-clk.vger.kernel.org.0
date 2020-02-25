Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B08BA16EBD5
	for <lists+linux-clk@lfdr.de>; Tue, 25 Feb 2020 17:57:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730753AbgBYQ5j (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 25 Feb 2020 11:57:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:56176 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727983AbgBYQ5j (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 25 Feb 2020 11:57:39 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A80ED2082F;
        Tue, 25 Feb 2020 16:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582649858;
        bh=mN+4NXT9hq0vzpcYMZ5Qam3JcNxRlpUxh0JHOicfY4w=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ZJ0guP9ehOqjXHAwvWlQDTXBo2MlpIDbtuVrJdgnfqyavv/g7rjd7z7eW+QVFXljP
         nCrzlj/nBLnU5bCiJ7RYyHvSWuZrzEXLGyo0QllGzDB/f2gviD08/jGvIcou7o4Ovf
         71/d0HzIYzEYBnkR/Vj5Szu51BlFVlVoleKONq5I=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200217125759.GA3671@dragon>
References: <20200217125759.GA3671@dragon>
Subject: Re: [GIT PULL] i.MX clock fixes for 5.6
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To:     Shawn Guo <shawnguo@kernel.org>
Date:   Tue, 25 Feb 2020 08:57:37 -0800
Message-ID: <158264985790.177367.1236565584424790778@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shawn Guo (2020-02-17 04:58:01)
> The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862=
b9:
>=20
>   Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/i=
mx-clk-fixes-5.6
>=20
> for you to fetch changes up to 5eb40257047fb11085d582b7b9ccd0bffe900726:
>=20
>   clk: imx8mn: Fix incorrect clock defines (2020-02-17 15:18:00 +0800)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes.
