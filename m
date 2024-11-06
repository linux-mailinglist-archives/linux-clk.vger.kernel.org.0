Return-Path: <linux-clk+bounces-14234-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B222F9BDAD8
	for <lists+linux-clk@lfdr.de>; Wed,  6 Nov 2024 02:04:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69A4C1F21502
	for <lists+linux-clk@lfdr.de>; Wed,  6 Nov 2024 01:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D025313C918;
	Wed,  6 Nov 2024 01:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K5P7VrIx"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A015C6088F;
	Wed,  6 Nov 2024 01:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730855040; cv=none; b=XNHk5W0tWt9sJtsgis++TBPR5l5Jy87WpiNas/nwiUsAiq9EblMNRXhKpUN0x2aAXdpuI8ZoYi+H3RnC31YR/YZRqYj61dTrpOC9hXM6dzfBszTBgO33h4PyWlq2CerjqhfTMSBbzt1Z7wVATTRcH464vhDfpERQrkIAR+6sNEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730855040; c=relaxed/simple;
	bh=zhM6vqHjfi+pftDL2hfAzLwcx4gXUVTO4LT/M1Ol9Bg=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=ObMxZZtv1RnHsOlqW+bIDAJ0QhjSLEddnHuVvt3GZupqs9cox2UYarPLC+k9m1B23ypRlDLaTbOxI5h4WYgLgt1bSZKjw96W6Ib6N5yN2cVQnQ/ugXhZmhQmqsksUS46veiv611N0PFk/k4jAzdUj9EFb+sv2cDy3nFwY84hIDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K5P7VrIx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDE90C4CECF;
	Wed,  6 Nov 2024 01:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730855040;
	bh=zhM6vqHjfi+pftDL2hfAzLwcx4gXUVTO4LT/M1Ol9Bg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=K5P7VrIxhkuDTsCWr5HRnTQ6CGxUuSmMICcukT57bBx3SHaSXL1jB2UleNPcNzetY
	 1F0KNV3nfe57Fv448Bn5QsvWOcF6ikg28GxxeTvDrDaDFJ/czsJxpv2pF//eeKQSIZ
	 CdOV5g1La5tzrW04ZTlkT1Bh3TN+qRLJLWY0Wg0EzaX9irf+XIGaDBGz0nw59OAmTR
	 Y0WzgfH2nOPOJMnnUrZoI66jG53z6HV91YO7JdI8+vlD5ix2M87lAukPFabJ1W45qE
	 X5CNqn2NyQ+mDb7TfwDF3QG7nXE6RW7WNYTqUP7LTfQqEcwX/fgdGmyfv5n5Avtv4L
	 BY+KTBIL2WAkw==
Message-ID: <063709c4c06e230055134a115ee91e14.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <b6a264f8175f7c825b97aed63fb277a9.sboyd@kernel.org>
References: <20241104153108.3053932-1-ivo.ivanov.ivanov1@gmail.com> <20241104-lend-lark-ab46a268213a@spud> <0198082e-19a2-48e8-ada1-a7edaeddb73c@gmail.com> <b6a264f8175f7c825b97aed63fb277a9.sboyd@kernel.org>
Subject: Re: [PATCH v1] dt-bindings: clock: actions,owl-cmu: convert to YAML
From: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andreas =?utf-8?q?F=C3=A4rber?= <afaerber@suse.de>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-actions@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Conor Dooley <conor@kernel.org>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Date: Tue, 05 Nov 2024 17:03:57 -0800
User-Agent: alot/0.10

Quoting Stephen Boyd (2024-11-05 17:02:20)
> Quoting Ivaylo Ivanov (2024-11-04 12:19:57)
> >=20
> >=20
> >=20
> > On 11/4/24 21:03, Conor Dooley wrote:
> > > On Mon, Nov 04, 2024 at 05:31:08PM +0200, Ivaylo Ivanov wrote:
> > >> +    soc {
> > >> +        #address-cells =3D <2>;
> > >> +        #size-cells =3D <2>;
> > > FWIW, you could drop these two if...
> >=20
> > I see, although the point of this was to keep it the example as close
> > to the original usage in s900.dtsi as possible. Anyways, if a v2 is
> > needed, I can do that.
>=20
> Please resend with the fix.
>=20

Just drop the entire soc node as well because it doesn't help.

