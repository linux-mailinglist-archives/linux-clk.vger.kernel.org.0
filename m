Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B4E48EA2B
	for <lists+linux-clk@lfdr.de>; Thu, 15 Aug 2019 13:26:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730808AbfHOL0S (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 15 Aug 2019 07:26:18 -0400
Received: from mail-wr1-f99.google.com ([209.85.221.99]:42844 "EHLO
        mail-wr1-f99.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726865AbfHOL0S (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 15 Aug 2019 07:26:18 -0400
Received: by mail-wr1-f99.google.com with SMTP id b16so1902785wrq.9
        for <linux-clk@vger.kernel.org>; Thu, 15 Aug 2019 04:26:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nXAyjVHn0p+4CAgtCNYorSwp/PP+/ZyXWDDK+y7KYL4=;
        b=hRJXfy0LQRjMjQTg11paX04IYYBsK9sNeptx/TkzekKjf0KRo4FdKLQlCwULu9bwsx
         y7ZnENcD1O3sdjb9S1ncfTkbTmzdhSabs+UKnzfhffim4XKFa/qmhVEHR7NqzE+1Eoau
         KUd/Ln/v9pjSlf680p2UhnjJLxouaxucdvHnYLZ+JLuRGShngYj+N3N6MTdMkFkVbjci
         KsEtIAbhZDbAvQlSP16wqSerwj9dkZREKYqTR9w7iMK4bFocF+4s7fM/B0+dUJ0fcMKS
         m0dS0L5IRYvgoKVDhK2VX5GlzO8WiXXLJODmsl8Ls/Vxu27SvW4H4xIAcyvMgFMrzXgO
         vOzg==
X-Gm-Message-State: APjAAAWfYRVrN1XWpvzC81efwIgPvEvASJLWNw788Vv5+pud1fLBaLdM
        V0uiRcA8WTTYGApChHkRK1cxuqjiJxK9CzWcf+3PxUdh8/G/VsKcNIxlGXZMXWAw4w==
X-Google-Smtp-Source: APXvYqwE8AmkN+3MXDrwKQaFOiSfludhujVv2awbLexD+71rwuqfo/tkaDpNPzNDAfUOBE6TTmh7ETRU8D4R
X-Received: by 2002:a5d:5543:: with SMTP id g3mr5069751wrw.166.1565868376359;
        Thu, 15 Aug 2019 04:26:16 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk. [2a01:7e01::f03c:91ff:fed4:a3b6])
        by smtp-relay.gmail.com with ESMTPS id n3sm41979wru.48.2019.08.15.04.26.16
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 15 Aug 2019 04:26:16 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1hyDtX-0003HY-Th; Thu, 15 Aug 2019 11:26:15 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 033DD2742A76; Thu, 15 Aug 2019 12:26:14 +0100 (BST)
Date:   Thu, 15 Aug 2019 12:26:14 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     "kernelci.org bot" <bot@kernelci.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        enric.balletbo@collabora.com, guillaume.tucker@collabora.com,
        khilman@baylibre.com, matthew.hart@linaro.org,
        mgalka@collabora.com, tomeu.vizoso@collabora.com,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: clk/clk-next boot bisection: v5.3-rc1-79-g31f58d2f58cb on
 sun8i-h3-libretech-all-h3-cc
Message-ID: <20190815112614.GA4841@sirena.co.uk>
References: <5d54d2fd.1c69fb81.e13e5.7422@mx.google.com>
 <20190815040221.DE28F2067D@mail.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Content-Disposition: inline
In-Reply-To: <20190815040221.DE28F2067D@mail.kernel.org>
X-Cookie: MIT:
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 14, 2019 at 09:02:20PM -0700, Stephen Boyd wrote:
> Quoting kernelci.org bot (2019-08-14 20:35:25)

> > clk/clk-next boot bisection: v5.3-rc1-79-g31f58d2f58cb on sun8i-h3-libretech-all-h3-cc

> If this is the only board that failed, great! Must be something in a
> sun8i driver that uses the init structure after registration.

The infrastructure suppresses duplicate-seeming bisections so I'd not
count on it, check the reports on the web site.

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1VQVQACgkQJNaLcl1U
h9CXxggAhQAYqpIA036IQyAKgnQ2F/AJYfCXVuQIqvyJUzJcymafEwN1LN7ZCTGO
OYXotEHUAo0yWqEZHGYRT80yqKRDeaVSUYJ33xCHJEZXIuMULFRie3d5Qa62BejZ
kc1DtLpAWExTsK5KJA/vUAIFqiISlVFSU/XXQGx+nc1kEYMeobT6IkkZLxZhyEZ5
ft2eUwlXieQEtNHFQo2B8OmJMfjGeBTUkeSb/A8XYrAPmyvDxxBf01kyLSclZmvs
Q9ddNUKGQdhwsMlr216GOhBxtPDl6fXaKxvNaX37lzYKbTVZjYjcVfvhR1AeCJ7a
59WliRvBt6vgidBtATvY/5bgJaQY1Q==
=4B/b
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
