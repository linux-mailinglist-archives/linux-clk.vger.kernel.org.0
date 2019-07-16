Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 087706AD7A
	for <lists+linux-clk@lfdr.de>; Tue, 16 Jul 2019 19:13:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728573AbfGPRN6 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 16 Jul 2019 13:13:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:44460 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728124AbfGPRN6 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 16 Jul 2019 13:13:58 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 48DDB206C2;
        Tue, 16 Jul 2019 17:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563297237;
        bh=OMDVh4bAc08rVB18Se9IY+Dgw/527+md7p/KtELkBvw=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=xNnc4wQgQDZfQ+oxnkr6wJPXn1JgvSlYtW73olG09ASJEwRJEMNbufaEZIDbDWw21
         vGqjr1LzxS9bVwRfcbxjohKBIY895PlLv7xtgOvBDmlQIdzrpYZ1aXOMPxgeNTI6Rw
         uw3WOrWLLkL/Z8BcYEfHNvkd34PpQolp+FL0V1Hk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <VI1PR04MB5055F2D2C814BA8C83ACF273EECE0@VI1PR04MB5055.eurprd04.prod.outlook.com>
References: <VI1PR04MB5055F2D2C814BA8C83ACF273EECE0@VI1PR04MB5055.eurprd04.prod.outlook.com>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Leonard Crestez <leonard.crestez@nxp.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 1/2] clk: Add clk_min/max_rate entries in debugfs
User-Agent: alot/0.8.1
Date:   Tue, 16 Jul 2019 10:13:56 -0700
Message-Id: <20190716171357.48DDB206C2@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Leonard Crestez (2019-07-16 03:32:44)
> Gentle ping.
>=20
> This patch shows up on patchwork but not in my inbox so maybe it was=20
> lost in spam filters somehow?
>=20
> Geert offered a reviewed-by in v2 but I forgot to add it.
>=20

I see v3 on the list and in my inbox.

