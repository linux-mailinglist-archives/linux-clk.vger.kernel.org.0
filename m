Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E7E726A9B8
	for <lists+linux-clk@lfdr.de>; Tue, 15 Sep 2020 18:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727558AbgIOQ0n (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 15 Sep 2020 12:26:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:34486 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727683AbgIOQZ5 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 15 Sep 2020 12:25:57 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E8A36206DC;
        Tue, 15 Sep 2020 16:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600186719;
        bh=VmW8lZD7LvpBfANZxb+zDdbjY9lqQJ3ymVYLD4oTWB0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=KrWIZ8CUc0gmVlYBF7vDvtu4LvcRHOUOd+EITli70EKCv6B/SsYUm+n+twPwa1AOx
         u67IpT18uB5XUlQVkiProDBqvDYwHuI95t4dTNgnfd/weuKAIWqAQxkYMIhGaRB5rD
         txStvD+sk9YSHpSW0moqe9RbRWaVg1mJQCUYhznM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <858cd4a0-af7c-2004-cce6-0763557bf45f@samsung.com>
References: <CGME20200915123631eucas1p1d9652c48aa3f22e0e7d88c361c2280ab@eucas1p1.samsung.com> <858cd4a0-af7c-2004-cce6-0763557bf45f@samsung.com>
Subject: Re: [GIT PULL] clk/samsung fixes for v5.9
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Date:   Tue, 15 Sep 2020 09:18:37 -0700
Message-ID: <160018671784.4188128.12584752804183109370@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Sylwester Nawrocki (2020-09-15 05:36:29)
> Hi Stephen, Mike,
>=20
> The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bb=
f5:
>=20
>   Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git tags/=
v5.9-clk-samsung-fixes
>=20
> for you to fetch changes up to 0212a0483b0a36cc94cfab882b3edbb41fcfe1cd:
>=20
>   clk: samsung: Keep top BPLL mux on Exynos542x enabled (2020-09-15 13:56=
:51 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes.
