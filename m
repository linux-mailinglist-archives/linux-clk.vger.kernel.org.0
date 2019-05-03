Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D52C1321A
	for <lists+linux-clk@lfdr.de>; Fri,  3 May 2019 18:22:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726720AbfECQWl (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 3 May 2019 12:22:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:59390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726267AbfECQWl (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 3 May 2019 12:22:41 -0400
Received: from localhost (unknown [104.132.0.70])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E555420651;
        Fri,  3 May 2019 16:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556900561;
        bh=OF5ce0CgPYoRrlJQIiLHhqaO8z0/x5yTLqq4lE6iNdU=;
        h=In-Reply-To:References:To:Cc:From:Subject:Date:From;
        b=0RoKFWqX2evkTLZibUmSzAMJukPM6mqxSOwoxlLWf/fdwhecd0cg0M+NBcGDjeZM/
         ay21pEUQo7A9+0choeMNiSM9TTLfhbxDpxsQAeoovhCDrTzbwZWlwQk0ztjNiEHTML
         jC4Q62Ggl4hl5YhQfti/vhK+EnRYBoo0/gcOu1Rc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <alpine.DEB.2.20.1905030937270.3572@hadrien>
References: <alpine.DEB.2.20.1905030937270.3572@hadrien>
To:     Julia Lawall <julia.lawall@lip6.fr>
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        kbuild-all@01.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [clk:clk-parent-rewrite 18/78] drivers/clk/clk.c:371:11-16: WARNING: Unsigned expression compared with zero: index >= 0 (fwd)
Message-ID: <155690056016.200842.251435349483915088@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Fri, 03 May 2019 09:22:40 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Julia Lawall (2019-05-03 00:38:12)
> On line 371, index is unsigned, so it is always >=3D 0.
>=20

Awesome thanks!

