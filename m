Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55EF613015F
	for <lists+linux-clk@lfdr.de>; Sat,  4 Jan 2020 09:18:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbgADISV (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 4 Jan 2020 03:18:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:58350 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725970AbgADISV (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 4 Jan 2020 03:18:21 -0500
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F1581215A4;
        Sat,  4 Jan 2020 08:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578125900;
        bh=0A4dYUm+wB5rRAeqsjOu0EBX637B2iRBxWYFB+f+3qE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yhM7AMQfCNSdN0NkExGDFjn+1YoowXcHmHJEDJy0/pTFVoUeIxBSstsQtx4mjvTVf
         Ck74dcyJ9w3auhxnUXdXkTnOd3ELL9SOewnCRdKj5+03DLbvUIroE3td2doT7Q8HNb
         aNPe9xTyu6zq/99FiUhda3NzO7c+M+VxqgZ7gXbo=
Date:   Sat, 4 Jan 2020 09:18:18 +0100
From:   Maxime Ripard <mripard@kernel.org>
To:     Vasily Khoruzhick <anarsoul@gmail.com>
Cc:     Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: sunxi-ng: a64: export CLK_CPUX clock for DVFS
Message-ID: <20200104081818.ufby6w24vtawyfz3@gilmour.lan>
References: <20200104063505.219030-1-anarsoul@gmail.com>
 <20200104063505.219030-3-anarsoul@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="z27dgjuuap73pkx2"
Content-Disposition: inline
In-Reply-To: <20200104063505.219030-3-anarsoul@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--z27dgjuuap73pkx2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 03, 2020 at 10:35:04PM -0800, Vasily Khoruzhick wrote:
> Export CLK_CPUX so we can reference it in CPU node.
>
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>

Applied, thanks!
Maxime

--z27dgjuuap73pkx2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXhBKSgAKCRDj7w1vZxhR
xat1AP9yaZlJNjEXQz2ZyUGPPDc9qiGYflrWBkOvankU4ag/KQD/QNoVXsnaSSeA
v4fjU5R73baPNupd9QJ4lYCHhyzZ8wg=
=4xGB
-----END PGP SIGNATURE-----

--z27dgjuuap73pkx2--
