Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E5413149A1
	for <lists+linux-clk@lfdr.de>; Tue,  9 Feb 2021 08:44:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbhBIHo3 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 9 Feb 2021 02:44:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:36890 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229472AbhBIHo3 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 9 Feb 2021 02:44:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id ADCF064EBD;
        Tue,  9 Feb 2021 07:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612856628;
        bh=Sx76Jzk9brW9rJfrAFO5rxqahZQnDqjIPtUninurdM8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=F6wVo1TmQYrME1P3WSnYHTws6S9tl8ekHqUmZC98xY/Ccmbl6LNt0t9JtIuvY1EBw
         ZZwlhdPIzk/YYxlKdexgzl9JI5XcXRqT+Y3pkUjwjeptR07tg19/RKjJk8+n4GS94U
         TCG16vijfyIehIm14TvdlT6pVSS8MIsvcT62QKZSGiQYQW/rM9DDT1zzZQxRaC149c
         c8mXipHfobI6VKjXSrPtzhyhBzaQ6x4Dnjwzu6/uCpMex/urNZuYrlo0UenqMi5NWA
         RHnopclgQWLwefYZ12vX3QVF8eEbT/3NYsG4ii9nTqDUK3GdpCG9ysYzgKCCQE7okO
         DTnGHd9kO01rw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210120131026.1721788-4-arnd@kernel.org>
References: <20210120131026.1721788-1-arnd@kernel.org> <20210120131026.1721788-4-arnd@kernel.org>
Subject: Re: [PATCH 3/4] clk: remove sirf prima2/atlas drivers
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Barry Song <baohua@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Date:   Mon, 08 Feb 2021 23:43:47 -0800
Message-ID: <161285662750.418021.5751732708411532186@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Arnd Bergmann (2021-01-20 05:10:25)
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The CSR SiRF prima2/atlas platforms are getting removed, so this driver
> is no longer needed.
>=20
> Cc: Barry Song <baohua@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Applied to clk-next
