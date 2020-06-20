Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07C0B201FD7
	for <lists+linux-clk@lfdr.de>; Sat, 20 Jun 2020 04:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731966AbgFTChy (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 19 Jun 2020 22:37:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:60374 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731846AbgFTChy (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 19 Jun 2020 22:37:54 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9945E22DBF;
        Sat, 20 Jun 2020 02:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592620673;
        bh=Vm5on1nH0ayTvuYLE/a0HWIMKRwLKeRoNDa1bDL46fU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=rCKCpLRusKTsx/GDFsZPOJJEBi2axSRfKntqjJWT9hYibWM5v5bKZWtXyu1jV/tH0
         phewX1u5F5v7/5s+vl+s2c77BEJmeWl4lpNWTYqwgPawEYybDmz3Q4gQDl4Q3lZZCg
         NS56bwe63hHWwEc2c+BXQcpuiYmMKhIXfzZPSP/4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200616202417.14376-3-dinguyen@kernel.org>
References: <20200616202417.14376-1-dinguyen@kernel.org> <20200616202417.14376-3-dinguyen@kernel.org>
Subject: Re: [PATCH 3/3] clk: socfpga: agilex: mpu_l2ram_clk should be mpu_ccu_clk
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     dinguyen@kernel.org, devicetree@vger.kernel.org,
        mturquette@baylibre.com, robh+dt@kernel.org
To:     Dinh Nguyen <dinguyen@kernel.org>, linux-clk@vger.kernel.org
Date:   Fri, 19 Jun 2020 19:37:53 -0700
Message-ID: <159262067301.62212.14526957244487353008@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dinh Nguyen (2020-06-16 13:24:17)
> Preliminary documentation documented the mpu_l2ram_clk, but since then,
> the mpu_l2ram_clk is no longer documented. It's now referred to as
> mpu_ccu_clk.
>=20
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---

Applied to clk-next
