Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6AC7B53CC
	for <lists+linux-clk@lfdr.de>; Tue, 17 Sep 2019 19:16:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727262AbfIQRQP (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 17 Sep 2019 13:16:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:32986 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725881AbfIQRQP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 17 Sep 2019 13:16:15 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A9C592053B;
        Tue, 17 Sep 2019 17:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568740574;
        bh=cmYq2t10Iakv4FO8fWw38yiioM7tpHkZMyQY25+TQCw=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=QAJkfg3FmEPxJLld/vLSfrGFBUMtLqhurDs62NU9xur4TOelRwD4ViMKS6BB2W8Sb
         9VYI2bY+Q5yRkka4TD2ePT62NBV1x0T63ai3ju4wBbwZYT1TwGaFPA7tNMfzJwXr6A
         1bevF7XbinfY3XtKrzjWOl3QMs0a+bfTlg7fZSwc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1566145424-3186-4-git-send-email-wahrenst@gmx.net>
References: <1566145424-3186-1-git-send-email-wahrenst@gmx.net> <1566145424-3186-4-git-send-email-wahrenst@gmx.net>
Cc:     linux-clk@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Ray Jui <rjui@broadcom.com>, Rob Herring <robh+dt@kernel.org>,
        Scott Branden <sbranden@broadcom.com>,
        Stefan Wahren <wahrenst@gmx.net>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 3/4] clk: bcm2835: Add BCM2711_CLOCK_EMMC2 support
User-Agent: alot/0.8.1
Date:   Tue, 17 Sep 2019 10:16:13 -0700
Message-Id: <20190917171614.A9C592053B@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Stefan Wahren (2019-08-18 09:23:43)
> The new BCM2711 supports an additional clock for the emmc2 block.
> So add a new compatible and register this clock only for BCM2711.
>=20
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> Reviewed-by: Matthias Brugger <mbrugger@suse.com>
> Acked-by: Eric Anholt <eric@anholt.net>
> Reviewed-by: Eric Anholt <eric@anholt.net>
> ---

Applied to clk-next

