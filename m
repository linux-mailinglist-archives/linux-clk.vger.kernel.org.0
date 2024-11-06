Return-Path: <linux-clk+bounces-14233-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E85D9BDAD4
	for <lists+linux-clk@lfdr.de>; Wed,  6 Nov 2024 02:02:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F4601C22E92
	for <lists+linux-clk@lfdr.de>; Wed,  6 Nov 2024 01:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06C221311AC;
	Wed,  6 Nov 2024 01:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AJkhPL6u"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF59D3A1DB;
	Wed,  6 Nov 2024 01:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730854942; cv=none; b=OEZ5OVHK5b9aAZ2b1Ann3mn1I5mpmYDUNxzloImbErgJBoR2bUl1cnb5mHGco6NMyhkyXc4ABZMXbre19d+WmJPnW3qT1cNz8zE6r8XPgl+d++g1M1GRLfR02JSgF6Q/2zfvSeZ6IimxtUFpQqX06GpItT1fIB1zIpGkRSfXO4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730854942; c=relaxed/simple;
	bh=BttNn7lXrePS44BuRpIBKpxxgxgRnihX4x4/xHR5B6Q=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=UCdly1uq5yMaBMwnxQ87zgiPX04NcJ19zcK8QWS4E27rwH+1AEZ9qH9AZHCaI+Q1cRXWyhM5Tr7XBeWJvQL1q320UQKO5xfnJ/wtfhUnFGxmgGBJ46iii/2oEqN2huacsgkGoz7dXsnpVJMPOgKnZaZLjAnHLRtZ7jtkmCsf+lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AJkhPL6u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AFB2C4CECF;
	Wed,  6 Nov 2024 01:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730854942;
	bh=BttNn7lXrePS44BuRpIBKpxxgxgRnihX4x4/xHR5B6Q=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=AJkhPL6uPdCqeqLuI16M5ep55k+r1gEdp4rhIPV6b8lwChZZ37QjqZWZFkCvYqZWG
	 TJt4Sa11pwClk4YiXMa5fx++QF/15BSgSHjQqyBmRvLKoPScvWP7U7HSS/JnkSGfwT
	 plXEFvqg25WJU/YMCrLr7zhf6bFVUpGidHP1SYjc6nJL+htaY+aA/Zh8AgkVYxj60O
	 s6JB+mm2qozmb1cLk35Wi/nCamezdirmc6CTR8LBsy9gV38Va3PoSu1uOP3bOJJ4/g
	 l26DlJXx9dizk9H1Zxu9/22+l/8tm75gYW5aeZ5eUiF+IUnbqlE/auPfHFMDjDa0G2
	 9YM3JqVbSJZrQ==
Message-ID: <b6a264f8175f7c825b97aed63fb277a9.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0198082e-19a2-48e8-ada1-a7edaeddb73c@gmail.com>
References: <20241104153108.3053932-1-ivo.ivanov.ivanov1@gmail.com> <20241104-lend-lark-ab46a268213a@spud> <0198082e-19a2-48e8-ada1-a7edaeddb73c@gmail.com>
Subject: Re: [PATCH v1] dt-bindings: clock: actions,owl-cmu: convert to YAML
From: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andreas =?utf-8?q?F=C3=A4rber?= <afaerber@suse.de>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-actions@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Conor Dooley <conor@kernel.org>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Date: Tue, 05 Nov 2024 17:02:20 -0800
User-Agent: alot/0.10

Quoting Ivaylo Ivanov (2024-11-04 12:19:57)
>=20
>=20
>=20
> On 11/4/24 21:03, Conor Dooley wrote:
> > On Mon, Nov 04, 2024 at 05:31:08PM +0200, Ivaylo Ivanov wrote:
> >> +    soc {
> >> +        #address-cells =3D <2>;
> >> +        #size-cells =3D <2>;
> > FWIW, you could drop these two if...
>=20
> I see, although the point of this was to keep it the example as close
> to the original usage in s900.dtsi as possible. Anyways, if a v2 is
> needed, I can do that.

Please resend with the fix.

