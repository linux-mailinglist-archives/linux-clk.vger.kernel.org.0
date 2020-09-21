Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6858E27346A
	for <lists+linux-clk@lfdr.de>; Mon, 21 Sep 2020 22:55:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727131AbgIUUz5 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 21 Sep 2020 16:55:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:33478 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726427AbgIUUz5 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 21 Sep 2020 16:55:57 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 887CC206CA;
        Mon, 21 Sep 2020 20:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600721756;
        bh=4joeFJWOTNntmp3iJpQdeNUdFN+4suvKjk6mVMMtpWY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=mU6NDWTNfDVIQIsXA9FCYtp/TIQTaalqcndSebCd26hraYvwXBZyBodcZ9DvgM7vd
         TE4cwjZGO5MQP2wBLFYq/7605R1ra2hY33MYoYHTp4GuM/dlgW+X8xnS5ZiM76sk0R
         1CfsHaNnZWJS2ybZ6u6GLPkp4xOytZ2znYUegnJY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <81c9baac-823c-498a-9131-d71349379cf2.lettre@localhost>
References: <81c9baac-823c-498a-9131-d71349379cf2.lettre@localhost>
Subject: Re: [GIT PULL] Allwinner Clock Changes for 5.10
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>
To:     Maxime Ripard <mripard@kernel.org>,
        Mike Turquette <mturquette@baylibre.com>
Date:   Mon, 21 Sep 2020 13:55:55 -0700
Message-ID: <160072175532.4188128.12076329888229927543@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2020-09-21 08:52:22)
> Hi Mike, Stephen,
>=20
> Please pull the following changes for the next release.
>=20
> Thanks!
> Maxime
>=20
> The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bb=
f5:
>=20
>   Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/ta=
gs/sunxi-clk-for-5.10-1
>=20
> for you to fetch changes up to a3ba99a24b36bc4eee5413a820e2c4f3d81593fa:
>=20
>   clk: sunxi-ng: sun8i: r40: Use sigma delta modulation for audio PLL (20=
20-08-25 16:42:55 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
