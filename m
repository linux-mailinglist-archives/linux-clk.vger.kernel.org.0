Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 801AF131CB
	for <lists+linux-clk@lfdr.de>; Fri,  3 May 2019 18:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728278AbfECQEk (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 3 May 2019 12:04:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:40008 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725809AbfECQEj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 3 May 2019 12:04:39 -0400
Received: from localhost (unknown [104.132.0.70])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 221332087F;
        Fri,  3 May 2019 16:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556899479;
        bh=JdlBvbpgwTZwWsD4guYUIZYoCxCR4OIhqQOaiWx5q10=;
        h=In-Reply-To:References:To:Cc:From:Subject:Date:From;
        b=ayT7lgAQTwFDo4HPf18Lohoa8Jwp7Z4gxW3Rlho4mK60JePpKgeniW0QLNfYsG3nj
         rnEZIaJ2W+pHv8Ra9FH3nDq6TJ/6zVyvEN6rAZeFcRyIFGzDYsMsaNdp0Yk8QHkLGF
         5iUcphZytFuVA+iC7TyaqpJoBRFu2LJy8X3l/HJU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <201905031619.nJ5l01Tg%lkp@intel.com>
References: <201905031619.nJ5l01Tg%lkp@intel.com>
To:     Paul Walmsley <paul.walmsley@sifive.com>,
        kbuild test robot <lkp@intel.com>
Cc:     kbuild-all@01.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [clk:clk-sifive-fu540 3/3] drivers/clk/sifive/fu540-prci.c:534:41-42: WARNING: Use ARRAY_SIZE
Message-ID: <155689947835.200842.14950816155129185642@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Fri, 03 May 2019 09:04:38 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting kbuild test robot (2019-05-03 01:21:21)
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk=
-sifive-fu540
> head:   85ed1c299cca9beb5df6006361cf18bfa2305836
> commit: 85ed1c299cca9beb5df6006361cf18bfa2305836 [3/3] clk: sifive: add a=
 driver for the SiFive FU540 PRCI IP block
>=20
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>=20
>=20
> coccinelle warnings: (new ones prefixed by >>)
>=20
> >> drivers/clk/sifive/fu540-prci.c:534:41-42: WARNING: Use ARRAY_SIZE

I had a review comment about this on the previous version... I'll go fix
it myself.

