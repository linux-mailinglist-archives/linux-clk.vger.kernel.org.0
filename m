Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2264E8F4BC
	for <lists+linux-clk@lfdr.de>; Thu, 15 Aug 2019 21:36:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728927AbfHOTga (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 15 Aug 2019 15:36:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:33452 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728547AbfHOTga (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 15 Aug 2019 15:36:30 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2C1EB20656;
        Thu, 15 Aug 2019 19:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565897789;
        bh=EW0TSpgRvmluEEbkBDw/BeuuXW6cPt71WV5w74ebqrg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=dNlzOMvcy/GqjHHKA+gBnz7GlvSplNcldf6dGBVNeqVLShEGKF5uN9e27kiTUr2R5
         pClxyDelehLdhTpVScj3Q2l1kVV6e09YEG2TbPlivD7nkWZjZH1w4VTI28rIsss71Q
         6f4gRhHyznQQ4YDf6zHR2urAhGi2qMrq1Wu6DC+A=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1565715590.git.leonard.crestez@nxp.com>
References: <cover.1565715590.git.leonard.crestez@nxp.com>
Subject: Re: [PATCH 0/4] clk: imx8m: Fix incorrect parents
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Anson Huang <Anson.Huang@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        linux-clk@vger.kernel.org, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
To:     Abel Vesa <abel.vesa@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>
User-Agent: alot/0.8.1
Date:   Thu, 15 Aug 2019 12:36:28 -0700
Message-Id: <20190815193629.2C1EB20656@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Leonard Crestez (2019-08-13 10:05:27)
> No checks are made to ensure the parents in the _sels arrays actually
> exist and it turns out that several are incorrect.
>=20
> I found the errors using a hack to clk core, is there a better way?
> Link: https://github.com/cdleonard/linux/commit/da32c2e76eb373e8a03aec905=
af2eef28a7997a7

Maybe you can make it into some sort of Kconfig option that's behind a
debug flag. Or you can use the possible parent debugfs files and check
for parents from userspace with some script.

