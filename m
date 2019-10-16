Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 111E0DA1CC
	for <lists+linux-clk@lfdr.de>; Thu, 17 Oct 2019 00:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391484AbfJPW6x (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 16 Oct 2019 18:58:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:50692 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726965AbfJPW6x (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 16 Oct 2019 18:58:53 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 83D5F207FF;
        Wed, 16 Oct 2019 22:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571266732;
        bh=elH7+aHXNlJ2ye9AfFU/AXw75b+MBbTNCbo6rpbqtnQ=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=QohKsXiJZslhg3jp+X4A5JVUwnLSIPMo36ArrQ+2mPwm6mPi2JpSuD1EshP+G80zw
         r0zi9zda9V+DxXgPgRluuEw3E7K6/Baozd4UMeAqN+7n3CFSG8oAKSjTy+7EtpyLuH
         dLamvDNp4LLdN3PBUE3rIbYRRd/tZ5raoeWFwYcE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1jzhibaeaz.fsf@starbuckisacylon.baylibre.com>
References: <1jzhibaeaz.fsf@starbuckisacylon.baylibre.com>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [GIT PULL] clk: meson: fixes for v5.4
User-Agent: alot/0.8.1
Date:   Wed, 16 Oct 2019 15:58:51 -0700
Message-Id: <20191016225852.83D5F207FF@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jerome Brunet (2019-10-08 00:26:12)
> Hi Stephen,
>=20
> Please pull these few fixes for the current release.
>=20
> Thanks
> Jerome
>=20
> The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c=
5c:
>=20
>   Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://github.com/BayLibre/clk-meson.git tags/clk-meson-fixes-v5.4-1
>=20
> for you to fetch changes up to 90b171f6035688236a3f09117a683020be45603a:

Thanks. Pulled into fixes and merged up to next.

