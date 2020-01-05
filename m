Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 606E313069F
	for <lists+linux-clk@lfdr.de>; Sun,  5 Jan 2020 08:27:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725785AbgAEH14 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 5 Jan 2020 02:27:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:48718 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725535AbgAEH1z (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 5 Jan 2020 02:27:55 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 57C3C21582;
        Sun,  5 Jan 2020 07:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578209275;
        bh=818sT8Q/kcTwrM21x8NYcjO+DZqeefsjoHHemvA30ms=;
        h=In-Reply-To:References:Cc:Subject:To:From:Date:From;
        b=Bx35cPaJyIANTZZCSev/4p5x1oHx86/4/Kh3t7VH4VxSbgfHDCGWsJiX7qbEKYvOD
         wuax2bZ0mBu6G5AKaagxd/+hQrvNfcq5biLmmVdWF+NXaOqcSBvQyEYmQ8VyYlVfeA
         +3Xn3uOxD0XKWeBMV9HfcaR/uAh/sInfheX0j+B4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191217210504.27888-1-linus.walleij@linaro.org>
References: <20191217210504.27888-1-linus.walleij@linaro.org>
Cc:     linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH] clk: ux500: Fix up the SGA clock for some variants
To:     Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Sat, 04 Jan 2020 23:27:54 -0800
Message-Id: <20200105072755.57C3C21582@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Linus Walleij (2019-12-17 13:05:04)
> Some of the special PRCMU firmware variants were not
> properly detected in the Ux500 clock driver, resulting
> in the wrong clock for the SGA.
>=20
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied to clk-next

