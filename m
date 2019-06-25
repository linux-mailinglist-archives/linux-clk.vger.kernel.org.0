Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDDD05205B
	for <lists+linux-clk@lfdr.de>; Tue, 25 Jun 2019 03:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727984AbfFYB2Q (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 24 Jun 2019 21:28:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:45354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727728AbfFYB2Q (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 24 Jun 2019 21:28:16 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 32ADD206DD;
        Tue, 25 Jun 2019 01:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561426095;
        bh=yWa3GEEeaBFhSUdR66rgWG5PsWdch8xEnCJY9W93pfE=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=BgR/D3L3G5W2WGtZZW7tV4QmhJa65RI5UR/pr73YRMClBKVdxBQ9OM8xXge9nB3YW
         3ym5kPhgHR8Fobg2TS9WvGidrkrvx7+jBjuN6TCApe0JVTVnMlF9oVc2o6wr2ZItQb
         /l7CwCdfKpO/oCFY3wiM5lWLuMnfwfk7hfVNKThk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <fa2e50d6-b01d-48f4-8ddf-77488f11036e.lettre@localhost>
References: <fa2e50d6-b01d-48f4-8ddf-77488f11036e.lettre@localhost>
To:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [GIT PULL] Allwinner Clock Changes for 5.3
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-clk@vger.kernel.org
User-Agent: alot/0.8.1
Date:   Mon, 24 Jun 2019 18:28:14 -0700
Message-Id: <20190625012815.32ADD206DD@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2019-06-21 01:14:35)
> Hi,
>=20
> Please pull the following changes for the next release.
>=20
> Thanks!
> Maxime
>=20
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0eb=
d9:
>=20
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/ta=
gs/sunxi-clk-for-5.3-201906210814
>=20
> for you to fetch changes up to b467ec063ec56900e1ebba4d5aeb50b0a7cb0ef8:
>=20
>   dt-bindings: clk: Convert Allwinner CCU to a schema (2019-06-05 14:32:0=
8 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

