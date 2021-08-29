Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B1063FA9AB
	for <lists+linux-clk@lfdr.de>; Sun, 29 Aug 2021 09:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234757AbhH2HCo (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 29 Aug 2021 03:02:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:50290 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229889AbhH2HCo (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 29 Aug 2021 03:02:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 69EE760F36;
        Sun, 29 Aug 2021 07:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630220512;
        bh=FmUxoheZoNtNtNDqj+uo9+D5K8o2tO+Z192DVFt5imA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=E6Lk6Q/GjH4EuPZFUu7bG7cmmnFbYB2nbaALkPT1O2l5Dv6dlnQQFyucuAzxmeFml
         0x9JeNyH8sh65z3Z51du1atvrai2rCLoRPD22qquPOmVXR9b5tCM+PMUsLPkGbv2jP
         Zme1JOeKYua1/4eGAqKU2wIHD7t3tZ0luoTZ23ufoHIdR1Vh72JsW3bvPVfmtXIa9p
         GGHeX4Hake8DBWBB0QyoiSi8ynk/ilMtLmYtCme7JbmcCPTunHi5QHqsjn/W0wikv/
         UZzdtPcFjobEaD/O9Las7NVVt7UfQOfcKED3yjho3kuy+I6Iuawj0+EVHlCGGGjGad
         HY0X7Z6QuY71g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210809223813.3766204-3-sean.anderson@seco.com>
References: <20210809223813.3766204-1-sean.anderson@seco.com> <20210809223813.3766204-3-sean.anderson@seco.com>
Subject: Re: [PATCH v7 3/3] clk: vc5: Add properties for configuring SD/OE behavior
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Sean Anderson <sean.anderson@seco.com>
To:     Luca Ceresoli <luca@lucaceresoli.net>,
        Sean Anderson <sean.anderson@seco.com>,
        linux-clk@vger.kernel.org
Date:   Sun, 29 Aug 2021 00:01:50 -0700
Message-ID: <163022051045.2676726.13908721428564429973@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Sean Anderson (2021-08-09 15:38:13)
> The SD/OE pin may be configured to enable output when high or low, and
> to shutdown the device when high. This behavior is controller by the SH
> and SP bits of the Primary Source and Shutdown Register (and to a lesser
> extent the OS and OE bits). By default, both bits are 0 (unless set by
> OTP memory), but they may need to be configured differently, depending
> on the external circuitry controlling the SD/OE pin.
>=20
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> ---

Applied to clk-next
