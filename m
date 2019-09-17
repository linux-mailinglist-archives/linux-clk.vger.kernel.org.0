Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30236B53C9
	for <lists+linux-clk@lfdr.de>; Tue, 17 Sep 2019 19:16:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726553AbfIQRQI (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 17 Sep 2019 13:16:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:32864 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725881AbfIQRQI (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 17 Sep 2019 13:16:08 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 518F82053B;
        Tue, 17 Sep 2019 17:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568740568;
        bh=/8lwFXsgd2McEynp3iAw9yC6Sg4qYrWNvazX5f1jjNo=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=P5Ohj/8AOSGB6J9MdOoX0c4OaGfUFHM30cqHvtS0wRQ6v/TEBthATTfrqP5n5K1t+
         antdB2sffHqyqIzWKmwgFN6+aAQh0XTzTlXygtYshyglCqirKOF4q0jRh1Jn8c8rGD
         puTXrGaby+B3PuJK8PIjWU5NQhSJZ8/Lb7xhppVc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1566145424-3186-3-git-send-email-wahrenst@gmx.net>
References: <1566145424-3186-1-git-send-email-wahrenst@gmx.net> <1566145424-3186-3-git-send-email-wahrenst@gmx.net>
Cc:     linux-clk@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Ray Jui <rjui@broadcom.com>, Rob Herring <robh+dt@kernel.org>,
        Scott Branden <sbranden@broadcom.com>,
        Stefan Wahren <wahrenst@gmx.net>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/4] clk: bcm2835: Introduce SoC specific clock registration
User-Agent: alot/0.8.1
Date:   Tue, 17 Sep 2019 10:16:07 -0700
Message-Id: <20190917171608.518F82053B@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Stefan Wahren (2019-08-18 09:23:42)
> In order to support SoC specific clocks (e.g. emmc2 for BCM2711), we
> extend the description with a SoC support flag. This approach avoids long
> and mostly redundant lists of clock IDs. Since PLLH is specific to
> BCM2835, we register only rest of the clocks as common to all SoC.
>=20
> Suggested-by: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> Reviewed-by: Matthias Brugger <mbrugger@suse.com>
> Acked-by: Eric Anholt <eric@anholt.net>
> Reviewed-by: Eric Anholt <eric@anholt.net>
> ---

Applied to clk-next

