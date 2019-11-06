Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58224F21A8
	for <lists+linux-clk@lfdr.de>; Wed,  6 Nov 2019 23:26:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727328AbfKFW0f (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 6 Nov 2019 17:26:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:43260 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727295AbfKFW0f (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 6 Nov 2019 17:26:35 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D65492166E;
        Wed,  6 Nov 2019 22:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573079195;
        bh=Eljxv5tFJDXPMkasGIno/S6TX6cXXFcNrBqdDP15Iss=;
        h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
        b=yQZoDNk6sfNklQW5PbW67AOitQE12j17qP7JKyDMwXlhIVq+ofygzk6M/2BTzlRRE
         q5u4t1P7YH2tlJz90Z8JbdqMemMLx4ynRAPl71OnfSwtGafDi1Bt9ojziw242DM5wU
         MhmhSUQkAlpE124wIImM8qxESK+ww1Z+we2rb1V8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191104110856.GX24620@dragon>
References: <20191104110856.GX24620@dragon>
Subject: Re: [GIT PULL] i.MX clock changes for 5.5
From:   Stephen Boyd <sboyd@kernel.org>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
User-Agent: alot/0.8.1
Date:   Wed, 06 Nov 2019 14:26:34 -0800
Message-Id: <20191106222634.D65492166E@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shawn Guo (2019-11-04 03:08:57)
> The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c=
5c:
>=20
>   Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/i=
mx-clk-5.5
>=20
> for you to fetch changes up to bceed71ba13116de4b1459c2c6db47d927b48e68:
>=20
>   clk: imx: imx8mq: fix sys3_pll_out_sels (2019-11-04 09:10:49 +0800)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

