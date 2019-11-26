Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DAE110A3E8
	for <lists+linux-clk@lfdr.de>; Tue, 26 Nov 2019 19:09:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725895AbfKZSJc (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 26 Nov 2019 13:09:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:48434 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725870AbfKZSJc (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 26 Nov 2019 13:09:32 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3A04620727;
        Tue, 26 Nov 2019 18:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574791772;
        bh=khXt9vX/GT2fcUflwV853+ArzHccO1YSsCZHyTNOf14=;
        h=In-Reply-To:References:Subject:Cc:From:To:Date:From;
        b=maxjfUlqLWHb1VU8NztT/3JTKPyFdzVBpgBSYUG4XpF0wgSd9gQtQ/lIXZj32nBeg
         MBZf8RMoph8yWD0jjarMvGwcAtnwrLQgOVhK8PtLjTlpUpd4Cn/2QvUuAu7kKwDMhK
         Jwe9INxKKq9mIo1ykNsPYS8krk1mhzD3EExWIy/w=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573820552-21164-1-git-send-email-shubhrajyoti.datta@gmail.com>
References: <1573820552-21164-1-git-send-email-shubhrajyoti.datta@gmail.com>
Subject: Re: [PATCHv2 1/2] clk: clock-wizard: Move the clockwizard to clk
Cc:     mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com,
        shubhrajyoti.datta@gmail.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
From:   Stephen Boyd <sboyd@kernel.org>
To:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        shubhrajyoti.datta@gmail.com
User-Agent: alot/0.8.1
Date:   Tue, 26 Nov 2019 10:09:31 -0800
Message-Id: <20191126180932.3A04620727@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting shubhrajyoti.datta@gmail.com (2019-11-15 04:22:31)
> From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
>=20
> Move the clocking wizard driver from staging to clk.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
> this is moving the drivers/staging/clocking-wizard to clk
> v2:
> Added the makefile  and kconfig
>=20
>  drivers/clk/Kconfig                 |   6 +
>  drivers/clk/Makefile                |   1 +
>  drivers/clk/clk-xlnx-clock-wizard.c | 335 ++++++++++++++++++++++++++++++=
++++++

Where is the deletion of the file from staging? Has the TODO file in
staging been resolved? Please Cc Soren and Greg on these patches. Also
include a cover letter and convince us _why_ we should review these
patches in the commit text. Stating what the patch is doing, i.e.
"moving code around", is not helpful.

