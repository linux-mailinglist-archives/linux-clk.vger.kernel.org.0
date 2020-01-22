Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 416E81448C2
	for <lists+linux-clk@lfdr.de>; Wed, 22 Jan 2020 01:11:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728816AbgAVALC (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 21 Jan 2020 19:11:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:57442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726876AbgAVALC (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 21 Jan 2020 19:11:02 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9C6B821734;
        Wed, 22 Jan 2020 00:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579651861;
        bh=vEaqaO0ZcgQH7QRTWO7WivXhD85tdQhgAO8L6q7FUzs=;
        h=In-Reply-To:References:Cc:To:Subject:From:Date:From;
        b=YKLC0q86QMjCp4RUxuzkhxpgzXzpPwMSQ03q5Ku+91131UdMYiV5ddfz6Jk4zB6Op
         OsgdFyBV8vQ9i+z3tpf6zDvuKYVEyaUkiDKlTDKtZUHfcrLIS+3K4oA18p+ZUvLdgC
         fQyFrcmfBlut70VdCaSiGL4bZK44bAEP3J3auPiw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1j5zhj70ld.fsf@starbuckisacylon.baylibre.com>
References: <1j5zhj70ld.fsf@starbuckisacylon.baylibre.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
        linux-amlogic@lists.infradead.org
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: [GIT PULL]: Amlogic clock updates for v5.6
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Tue, 21 Jan 2020 16:11:00 -0800
Message-Id: <20200122001101.9C6B821734@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jerome Brunet (2020-01-10 08:11:42)
> Hi Stephen
>=20
> Here are the updates for the amlogic clocks for this cycle.
> The bulk of it is a clean up of the 32bits SoC clock controllers by
> Martin.
>=20
> Cheers
> Jerome
>=20
> The following changes since commit e42617b825f8073569da76dc4510bfa019b1c3=
5a:
>=20
>   Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.6-1
>=20
> for you to fetch changes up to 64c76b31774db5a0c0ce8df13aef618912136e32:
>=20
>   clk: clarify that clk_set_rate() does updates from top to bottom (2020-=
01-07 11:31:47 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

