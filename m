Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEB7E1BFF34
	for <lists+linux-clk@lfdr.de>; Thu, 30 Apr 2020 16:51:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726450AbgD3Ovn (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 30 Apr 2020 10:51:43 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:33877 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726357AbgD3Ovm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Apr 2020 10:51:42 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 68D578D5;
        Thu, 30 Apr 2020 10:51:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 30 Apr 2020 10:51:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=yUFL1mVF52h7LuiXHr0MmqdXpjr
        /Do5cG5S9578N9FU=; b=flwRloM80e1YKWVVE0uunwO/B6bCRv7woEQil7ikD9o
        lRF+leVNAjXiol85Xt4jS877ZBUxSMM3zaL2LZr0D4nAgLlH8gwiAoyRpzeMBPMC
        y7AGp8KIby+tP6CvL0PIYlsSjgYBNBN0EtP8UMWN+YlDE3Hpo9LwNeo0sSP+/t5b
        4uSsoJCA53uaSg2kMg9YDTNpCny2GCupw5Finjs4GBm7U5J3xrpfnnCIuPNqZh+x
        IbPrpHpAm9Zp6JuzGpnsBsoDJGLDNmlXvojSWQLHkD600YhzRo2be5q8sThkMXid
        iEUW/Xy5bkZSnYjPnrO0wSnA0yyO6hZ4/706pr7pZbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=yUFL1m
        VF52h7LuiXHr0MmqdXpjr/Do5cG5S9578N9FU=; b=FsNBbitKk8eDiMhklBBZAA
        6uWhPPb932nl40fozzT8kBomeJztqBJC7UpGWUmlFC8P0ZQ3KW7tyiWkVG/G9cxz
        YdzozPlEJxs3k6aFZmN3qzHdmeEdrMgmHhIFrJc5muXHiinPNuszNuw7OePxHZud
        vlwUmfXkbP82FgyaE+XPuywLzW5LZRD5CwWnJ1JtpvL/f/leKCDBZ26FMMLfqfuA
        DrmCbW5AYo0ilj2TIpRtLI5AbhAZTJwaDLjXehDKn4O161uOMFNiNMQEOPdpf9wz
        m0hQ/Hn3BNbg4gAzWONhTVlhhAn1UnvAvC+O7zRAqlImA0xrW8fOqUZW90MYdPPQ
        ==
X-ME-Sender: <xms:_OWqXh7woC7d2ZzhGmFeRqlJoaykGikxCVc8txyuKlZunkFe5WJT6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrieehgdekudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:_OWqXjImDnPUO9JQ9Nq1R0mGG-HKXJhWsULspBLza0TtxaYpagh9Uw>
    <xmx:_OWqXjccGgel4Ura7pdRYyl0qZFftTKLhnAWG2WemJTscNhF-xLx_Q>
    <xmx:_OWqXud2Kj-TNx84bvJnejQUzHxi7ofXVM4ilJkrFgoJ-ZV-CIzYXw>
    <xmx:_eWqXkps6obGyXVibV8oFaG8LyJp1XAJ4f64IXNV6fion-SIRtZv0g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 4EE0D3280064;
        Thu, 30 Apr 2020 10:51:40 -0400 (EDT)
Date:   Thu, 30 Apr 2020 16:51:38 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Priit Laes <plaes@plaes.org>
Cc:     Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH v3 1/6] clk: sunxi-ng: a20: Register regmap for sun7i CCU
Message-ID: <20200430145138.lhj4y5kjfz7bwamu@gilmour.lan>
References: <20200430115702.5768-1-plaes@plaes.org>
 <20200430115702.5768-2-plaes@plaes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="veryw4obx5pow3r5"
Content-Disposition: inline
In-Reply-To: <20200430115702.5768-2-plaes@plaes.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--veryw4obx5pow3r5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2020 at 02:56:57PM +0300, Priit Laes wrote:
> On sun7i, the gmac clock is handled by the dwmac-sunxi driver, but
> its configuration register is located in the CCU register range,
> requiring proper regmap setup.
>=20
> In order to do that, we use CLK_OF_DECLARE_DRIVER to initialize
> sun7i ccu, which clears the OF_POPULATED flag, allowing the
> platform device to probe the same resource with proper device node.
>=20
> Signed-off-by: Priit Laes <plaes@plaes.org>
> ---
>  drivers/clk/sunxi-ng/ccu-sun4i-a10.c | 62 +++++++++++++++++++++++++++-
>  1 file changed, 60 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun4i-a10.c b/drivers/clk/sunxi-ng/=
ccu-sun4i-a10.c
> index f32366d9336e..fa147b8ce705 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun4i-a10.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun4i-a10.c
> @@ -8,6 +8,8 @@
>  #include <linux/clk-provider.h>
>  #include <linux/io.h>
>  #include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> =20
>  #include "ccu_common.h"
>  #include "ccu_reset.h"
> @@ -1478,5 +1480,61 @@ static void __init sun7i_a20_ccu_setup(struct devi=
ce_node *node)
>  {
>  	sun4i_ccu_init(node, &sun7i_a20_ccu_desc);
>  }
> -CLK_OF_DECLARE(sun7i_a20_ccu, "allwinner,sun7i-a20-ccu",
> -	       sun7i_a20_ccu_setup);
> +CLK_OF_DECLARE_DRIVER(sun7i_a20_ccu, "allwinner,sun7i-a20-ccu",
> +		      sun7i_a20_ccu_setup);
> +
> +/*
> + * Regmap for the GMAC driver (dwmac-sunxi) to allow access to
> + * GMAC configuration register.
> + */
> +#define SUN7I_A20_GMAC_CFG_REG 0x164
> +static bool sun7i_a20_ccu_regmap_accessible_reg(struct device *dev,
> +						unsigned int reg)
> +{
> +	if (reg =3D=3D SUN7I_A20_GMAC_CFG_REG)
> +		return true;
> +	return false;
> +}
> +
> +static struct regmap_config sun7i_a20_ccu_regmap_config =3D {
> +	.reg_bits	=3D 32,
> +	.val_bits	=3D 32,
> +	.reg_stride	=3D 4,
> +	.max_register	=3D 0x1f4, /* clk_out_b */
> +
> +	.readable_reg	=3D sun7i_a20_ccu_regmap_accessible_reg,
> +	.writeable_reg	=3D sun7i_a20_ccu_regmap_accessible_reg,
> +};
> +
> +static int sun7i_a20_ccu_probe_regmap(struct platform_device *pdev)
> +{
> +	void __iomem *reg;
> +	struct resource *res;
> +	struct regmap *regmap;
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	reg =3D devm_ioremap(&pdev->dev, res->start, resource_size(res));
> +	if (IS_ERR(reg))
> +		return PTR_ERR(reg);

You shouldn't really create a second mapping here but reuse the one you got=
 in
sun7i_a20_ccu_setup, since that code expect to be the sole user of it.

Storing the virtual address in a global variable should work fine since we =
only
ever have a single instance of the controller

Maxime

--veryw4obx5pow3r5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXqrl+gAKCRDj7w1vZxhR
xQHUAP43Ux7dIPWHzi8KIXHGURaaWzG5Si7pOOXp//+7NhsoJAD+MAMasUWFEicr
LRkb9qgrRZxckPPqU9fMC5kg2QdCTwg=
=k6DC
-----END PGP SIGNATURE-----

--veryw4obx5pow3r5--
