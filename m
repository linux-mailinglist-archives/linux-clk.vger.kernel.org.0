Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 164B1CC51E
	for <lists+linux-clk@lfdr.de>; Fri,  4 Oct 2019 23:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728812AbfJDVpL (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 4 Oct 2019 17:45:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:36368 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727548AbfJDVpL (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 4 Oct 2019 17:45:11 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AFDCB2133F;
        Fri,  4 Oct 2019 21:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570225510;
        bh=y1e+tgSp7e0tgbR/cUxYS8CTGmt1MsrrM3rPNUmbNm8=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=fvXMaHqwDe3inbL8LyDHoURJ/iLsvAZOaQgbKORH23nqBTlQutm9X8iavArIDK8o0
         OuXAShRE2AiGAyWCCgIQ2Lvv1eU6CHck4qWRbjNZofku9nZx4SW25vhEZs0rmE52sf
         1KBgPw2cO0RX0udKVfdHSgys5Dm0dNQR+7ybt1gw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191002085309.9473-1-m.szyprowski@samsung.com>
References: <CGME20191002085320eucas1p2e4c35fe7783deb38fbd2e9f87f4f1234@eucas1p2.samsung.com> <20191002085309.9473-1-m.szyprowski@samsung.com>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] clk: samsung: exynos5433: Fix error paths
User-Agent: alot/0.8.1
Date:   Fri, 04 Oct 2019 14:45:09 -0700
Message-Id: <20191004214510.AFDCB2133F@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Szyprowski (2019-10-02 01:53:09)
> Add checking the value returned by samsung_clk_alloc_reg_dump() and
> devm_kcalloc(). While fixing this, also release all gathered clocks.
>=20
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---

Any fixes tag?

