Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D6EB191EDD
	for <lists+linux-clk@lfdr.de>; Wed, 25 Mar 2020 03:15:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727259AbgCYCPU (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 24 Mar 2020 22:15:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:32794 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727253AbgCYCPU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 24 Mar 2020 22:15:20 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 704BD20722;
        Wed, 25 Mar 2020 02:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585102519;
        bh=DTVC9Eq+T8arWygfFiwZJdrVB6KsK12aRrpzogcXNoM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=BUWfJyuKNPocZ0DOw7gLDU/o78KNkj3uZ2Q4DK2iUDy+pK6S97KvwhMBktsybTCE9
         7v1+Isi321opHdcf4NUX5gMk+8BPf4i1mXlse1qbGP8kYbu4hnS9IvLPlRlkCrmWN4
         SyPdMiVuFCroWsp9lPoqdxDN5YCWRVpm5EEdAC/Y=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200313170409.2922165-1-thierry.reding@gmail.com>
References: <20200313170409.2922165-1-thierry.reding@gmail.com>
Subject: Re: [GIT PULL] clk: tegra: Changes for v5.7-rc1
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>
Date:   Tue, 24 Mar 2020 19:15:18 -0700
Message-ID: <158510251862.125146.817128239532333832@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Thierry Reding (2020-03-13 10:04:09)
> Hi Mike, Stephen,
>=20
> The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862=
b9:
>=20
>   Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-=
5.7-clk
>=20
> for you to fetch changes up to efdd205ccbfaa80bd932bc2fba498026c09db502:
>=20
>   clk: tegra: Remove audio clocks configuration from clock driver (2020-0=
3-12 12:10:49 +0100)
>=20
> Thanks,
> Thierry
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
