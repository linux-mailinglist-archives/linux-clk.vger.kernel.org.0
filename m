Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7527DB53C8
	for <lists+linux-clk@lfdr.de>; Tue, 17 Sep 2019 19:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725927AbfIQRQE (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 17 Sep 2019 13:16:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:60984 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725881AbfIQRQE (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 17 Sep 2019 13:16:04 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E48D92053B;
        Tue, 17 Sep 2019 17:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568740564;
        bh=UByg773s8eCQWvtEpZEne9RljL76s1OhhtTLu/7PT5g=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=SAqE2Pc1Cktz6bj9D9yt7iqb6BtI/uK0UpRr4SHzx5Uauv1HAd/Ds3yMQgSaVc1wU
         CLMBtCTtsctlaemGSt8oWdMrHeq6dxiU9M6v6BbMpVJ4mTfFAZgR4IvZBEXWrsEEkU
         t72oDD1gVAqbzTKbini8EgzktnI4u4n7k2B8eBHo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1566145424-3186-2-git-send-email-wahrenst@gmx.net>
References: <1566145424-3186-1-git-send-email-wahrenst@gmx.net> <1566145424-3186-2-git-send-email-wahrenst@gmx.net>
Cc:     linux-clk@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Ray Jui <rjui@broadcom.com>, Rob Herring <robh+dt@kernel.org>,
        Scott Branden <sbranden@broadcom.com>,
        Stefan Wahren <wahrenst@gmx.net>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: bcm2835-cprman: Add bcm2711 support
User-Agent: alot/0.8.1
Date:   Tue, 17 Sep 2019 10:16:02 -0700
Message-Id: <20190917171603.E48D92053B@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Stefan Wahren (2019-08-18 09:23:41)
> The new BCM2711 supports an additional clock for the emmc2 block.
> So we need an additional compatible.
>=20
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> Acked-by: Eric Anholt <eric@anholt.net>
> Reviewed-by: Eric Anholt <eric@anholt.net>
> ---

Applied to clk-next

