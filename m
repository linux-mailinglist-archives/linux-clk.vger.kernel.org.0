Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F02601E31CE
	for <lists+linux-clk@lfdr.de>; Tue, 26 May 2020 23:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390380AbgEZV7q (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 26 May 2020 17:59:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:46898 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389342AbgEZV7q (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 26 May 2020 17:59:46 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B875220707;
        Tue, 26 May 2020 21:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590530385;
        bh=CqEePuCnvpK/iCyz9I9YqYh+lBmX3OXhgdferK/hSKU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=IU7kgLij8ZcqwO0sU0VmkMnUFKHYDUhquSIj9NpuV5pqZLLAIDxwcos/dxFWmR+5k
         8DVuM6xonLwwcWB8RGCYuz6/UIf/zjyFNyLxarrpl1BZ1U5/QMWm9NVOuMTmmk68JH
         pGptfBNUHy64Iii5FVkN27iU2FfcmC9bHY0ymHN0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200515142730.1573945-1-thierry.reding@gmail.com>
References: <20200515142730.1573945-1-thierry.reding@gmail.com>
Subject: Re: [GIT PULL] clk: tegra: Changes for v5.8-rc1
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>
Date:   Tue, 26 May 2020 14:59:44 -0700
Message-ID: <159053038496.88029.2137294571210435375@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Thierry Reding (2020-05-15 07:27:30)
> Hi Mike, Stephen,
>=20
> The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f31=
36:
>=20
>   Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-=
5.8-clk
>=20
> for you to fetch changes up to dec396322d25ca5ce2f307b6da897060fdf9a782:
>=20
>   clk: tegra: Add Tegra210 CSI TPG clock gate (2020-05-12 22:48:43 +0200)
>=20
> Thanks,
> Thierry
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
