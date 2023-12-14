Return-Path: <linux-clk+bounces-1449-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB89081355A
	for <lists+linux-clk@lfdr.de>; Thu, 14 Dec 2023 16:55:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68415282D04
	for <lists+linux-clk@lfdr.de>; Thu, 14 Dec 2023 15:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14D635E0AC;
	Thu, 14 Dec 2023 15:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bF/zNNVU"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8E85E0A0;
	Thu, 14 Dec 2023 15:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E15FC433C7;
	Thu, 14 Dec 2023 15:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702569316;
	bh=WYeqYCErkROHKuIRZn/pMD0415jC0WdcK3S4UMGNdjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bF/zNNVUDSEC8MIkmwGiaywCrvo0qBDa6seF/LBNNQJIDSDx1RDK7kxhJWpS+eXjH
	 KyA2SubRXyuRShSKDkvPIh6mtdQEFOUGSr2XkGeFSFcreOkFb04oBl8Vo4Gcd5Pson
	 M8aZ52nzmMYIyC9zInCOSB1BSsFKrl2X21HSy+FhoGwtqCFz/ycU2xxzkGxGBwnOCc
	 q4M/rbJNSdPYF9pORujaImibLYrA4nahCHvrkxMjiw7ZKktj9XfUN0ycrcFSPnyh60
	 c20tCQxtRw/iPhp5mSqEGCNq+P8BZrgu9gSYbyYJ01TPkdvzEH7QofS4lyLDx/4OxH
	 7EmugigJSrS1Q==
Date: Thu, 14 Dec 2023 15:55:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
	sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 01/16] dt-bindings: phy: qmp-ufs: Fix PHY clocks
Message-ID: <20231214-aqueduct-occupy-53b9d650dfc4@spud>
References: <20231214091101.45713-1-manivannan.sadhasivam@linaro.org>
 <20231214091101.45713-2-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="65gDSZnx9nzEjrit"
Content-Disposition: inline
In-Reply-To: <20231214091101.45713-2-manivannan.sadhasivam@linaro.org>


--65gDSZnx9nzEjrit
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 02:40:46PM +0530, Manivannan Sadhasivam wrote:
> All QMP UFS PHYs except MSM8996 require 3 clocks:
>=20
> * ref - 19.2MHz reference clock from RPMh
> * ref_aux - Auxiliary reference clock from GCC
> * qref - QREF clock from GCC or TCSR (since SM8550)
>=20
> MSM8996 only requires 'ref' and 'qref' clocks. Hence, fix the binding to
> reflect the actual clock topology.
>=20
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--65gDSZnx9nzEjrit
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXslXwAKCRB4tDGHoIJi
0l7YAQCxHh+VuMFNf8M6bIbeG5yD+E8OPm4XNyqEpRK3LhhWoQEA54PMCR8Cq5ds
Zn5wnvBY4oYT5Rw7lm6D9DShWy+npgI=
=u2wx
-----END PGP SIGNATURE-----

--65gDSZnx9nzEjrit--

