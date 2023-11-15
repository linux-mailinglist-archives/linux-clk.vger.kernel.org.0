Return-Path: <linux-clk+bounces-53-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CC87E6451
	for <lists+linux-clk@lfdr.de>; Thu,  9 Nov 2023 08:30:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 930A7B20C45
	for <lists+linux-clk@lfdr.de>; Thu,  9 Nov 2023 07:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9230FDDDA;
	Thu,  9 Nov 2023 07:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="t5IRREEE"
X-Original-To: linux-clk@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B16AD535;
	Thu,  9 Nov 2023 07:30:07 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4BE2271F;
	Wed,  8 Nov 2023 23:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1699515006; x=1731051006;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Dx8D95WyzuX2IuOEFmqgA8EyOzcTDNbo1MHb8a8iwMc=;
  b=t5IRREEE2gsYWYLBrKILZzQvNOlescNtmFCd47yBJ+GtaqikQaJrjyQq
   aJQJy0cjdhwkDUVD5EOZ4iyso/TT+NMSsOSMB/dNZM3xZLEl7CNNT4rPN
   EyjgDy5VKWfrh7hAQVS6DbDtIsYYm9EJTAcfvmXQSzDpOwkrxzEp4Ky/U
   qNzx36Li3XLNaYuiDiH1B9a1U7TygvolT8E6g3ksansoOfn+clG29AtVH
   1WTKbmzCI/NlZb8WfMT4eL6S/6iNLQ0TandcDbfrBLeSfyqH7ElFmEEw2
   rDiGB9CdQVI9pWImIxJyG0JPxHzE3QlTjx4rg3Z1gvXynxHilu1GQuZQ0
   Q==;
X-CSE-ConnectionGUID: AOkFoS2YSbmlI+bSBTzDlQ==
X-CSE-MsgGUID: HdNvzHRpRXCIEC/6FVIMRg==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,288,1694761200"; 
   d="asc'?scan'208";a="11381001"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Nov 2023 00:30:05 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Nov 2023 00:29:42 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 9 Nov 2023 00:29:39 -0700
Date: Thu, 9 Nov 2023 07:29:13 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: zhangqing <zhangqing@rock-chips.com>
CC: Conor Dooley <conor@kernel.org>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <kever.yang@rock-chips.com>, <heiko@sntech.de>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<huangtao@rock-chips.com>, <andy.yan@rock-chips.com>, Sebastian Reichel
	<sebastian.reichel@collabora.com>
Subject: Re: [PATCH v5 3/4] dt-bindings: clock: rk3588: export PCLK_VO1GRF
 clk id
Message-ID: <20231109-send-pushchair-45b37551102a@wendy>
References: <20231108061822.4871-1-zhangqing@rock-chips.com>
 <20231108061822.4871-4-zhangqing@rock-chips.com>
 <20231108-donation-uncertain-c4d0f560c420@spud>
 <2e520a06-0ff1-76ef-2a72-ab6663738b45@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EOi6T8MEgEuAZcpd"
Content-Disposition: inline
In-Reply-To: <2e520a06-0ff1-76ef-2a72-ab6663738b45@rock-chips.com>

--EOi6T8MEgEuAZcpd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 09, 2023 at 02:27:38PM +0800, zhangqing wrote:
> Hi:
>=20
> =E5=9C=A8 2023/11/8 20:01, Conor Dooley =E5=86=99=E9=81=93:
> > On Wed, Nov 08, 2023 at 02:18:21PM +0800, Elaine Zhang wrote:
> > > export PCLK_VO1GRF for DT.
> > >=20
> > > Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> > > ---
> > >   include/dt-bindings/clock/rockchip,rk3588-cru.h | 3 ++-
> > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/include/dt-bindings/clock/rockchip,rk3588-cru.h b/includ=
e/dt-bindings/clock/rockchip,rk3588-cru.h
> > > index 5790b1391201..50ba72980190 100644
> > > --- a/include/dt-bindings/clock/rockchip,rk3588-cru.h
> > > +++ b/include/dt-bindings/clock/rockchip,rk3588-cru.h
> > > @@ -733,8 +733,9 @@
> > >   #define ACLK_AV1_PRE			718
> > >   #define PCLK_AV1_PRE			719
> > >   #define HCLK_SDIO_PRE			720
> > > +#define PCLK_VO1GRF			721
> > > -#define CLK_NR_CLKS			(HCLK_SDIO_PRE + 1)
> > > +#define CLK_NR_CLKS			(PCLK_VO1GRF + 1)
> > This definition is part of the ABI, if it is safe to change it, then it
> > is safe to delete it.
> The new ID is to solve the niu clock dependency problem(Used in PATCH V5
> 4/4).This new ID will also be used in DTS in the future.
>=20
> CLK_NR_CLKS represents the number of clocks used by the
> drivers/clk/rockchip/clk-rkxxx.c. It is safe to modify it, but cannot del=
ete
> it.

Then delete it from the header and move it to clk-rkxxx.c

--EOi6T8MEgEuAZcpd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZUyKRQAKCRB4tDGHoIJi
0jvaAP9Mak6fvi3NGoWSCdxsuveQthMLhtNXZWoTZA3zgzYeKwD/Vopz5b98730K
4iZE1gFvKMmD5TaOp1tn1q9khTZRVA4=
=KvXP
-----END PGP SIGNATURE-----

--EOi6T8MEgEuAZcpd--

