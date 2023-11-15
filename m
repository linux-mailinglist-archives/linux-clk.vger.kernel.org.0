Return-Path: <linux-clk+bounces-200-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D23E7EB5A7
	for <lists+linux-clk@lfdr.de>; Tue, 14 Nov 2023 18:40:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53B441F2528B
	for <lists+linux-clk@lfdr.de>; Tue, 14 Nov 2023 17:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB2F32C19E;
	Tue, 14 Nov 2023 17:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YPq+NIId"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F0F2C180;
	Tue, 14 Nov 2023 17:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8121AC433C8;
	Tue, 14 Nov 2023 17:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699983624;
	bh=z9PwBTSGVM1q27ATk+TMybFpQRzzSFtVdprhH4R8Ytk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YPq+NIIdBj7YLws2oaM2krjeCUtZ8V97BQueGz5nDfeAhkmKi1uaZYlzsRhy5NHZi
	 7bqwW0XHxgaJpVaRgO6JMzf9dKNS2PupqbmwnOHIEPs5MMedPu1wGSSO2w1e4fWRQ8
	 tPQLX3t8fs2p+Te3m95wj0suqTypCdHLGWW4/x8ftNwXylBPvc/zXsmwF3vXFvA8Uy
	 4BGyuCgWCPfUYDTk1TJ/e2eu+rjkZqcNFcdlILrzE/nWc3b2Ozrs2m75OG51ZbBapX
	 5j7bpSe/UuErrJ7VwU+PfylJT8w2bJhqMbHbEJR1g8nbyUiH+rzjjiupwRF79scyVe
	 jHCZj+Y4QXARQ==
Date: Tue, 14 Nov 2023 17:40:20 +0000
From: Conor Dooley <conor@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com,
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
	palmer@dabbelt.com, paul.walmsley@sifive.com,
	richardcochran@gmail.com, robh+dt@kernel.org, sboyd@kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com,
	Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH 2/5] dt-bindings: soc: sophgo: Add Sophgo syscon module
Message-ID: <20231114-timid-habitat-a06e52e59c9c@squawk>
References: <cover.1699879741.git.unicorn_wang@outlook.com>
 <3c286171af30101b88f0aaf645fb0a7d5880ac0a.1699879741.git.unicorn_wang@outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7x2SPF0LZcIrRSv8"
Content-Disposition: inline
In-Reply-To: <3c286171af30101b88f0aaf645fb0a7d5880ac0a.1699879741.git.unicorn_wang@outlook.com>


--7x2SPF0LZcIrRSv8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 13, 2023 at 09:19:02PM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
>=20
> Add documentation to describe Sophgo System Controller Registers for
> SG2042.
>=20
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  .../soc/sophgo/sophgo,sg2042-syscon.yaml      | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,s=
g2042-syscon.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-s=
yscon.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-sys=
con.yaml
> new file mode 100644
> index 000000000000..829abede4fd5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-syscon.y=
aml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/sophgo/sophgo,sg2042-syscon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo SG2042 SoC system controller
> +
> +maintainers:
> +  - Chen Wang <unicorn_wang@outlook.com>
> +
> +description:
> +  The Sophgo SG2042 SoC system controller provides register information =
such
> +  as offset, mask and shift to configure related modules.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - sophgo,sg2042-syscon
> +          - const: syscon

THere's only one option here, so the oneOf should be removed. Similarly,
since there's only one SoC, and it sounds like the next large sophgo
system is going to be using an entirely different core provider, I think
should just simplify this to a pair of "const:" entries.

> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    syscon@30010000 {
> +        compatible =3D "sophgo,sg2042-syscon", "syscon";
> +        reg =3D <0x30010000 0x1000>;
> +    };

Per my comments elsewhere, I think the clock controller should be a
child of this node, rather than an unrelated node, linked by a phandle.

Cheers,
Conor.

--7x2SPF0LZcIrRSv8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVOxAAAKCRB4tDGHoIJi
0iTVAP4xqsqRPb18xDpU2gdHBpqavoQRucplJdovfCUwjpJR5gD/cxDZbzW9yvV+
GQOC1Uef/4CbdqURfao9Zf5pzfrisgo=
=lwGH
-----END PGP SIGNATURE-----

--7x2SPF0LZcIrRSv8--

