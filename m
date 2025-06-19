Return-Path: <linux-clk+bounces-23240-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C45ADFAE7
	for <lists+linux-clk@lfdr.de>; Thu, 19 Jun 2025 03:41:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAEA45A18E9
	for <lists+linux-clk@lfdr.de>; Thu, 19 Jun 2025 01:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7508E1A23B0;
	Thu, 19 Jun 2025 01:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DWQTn1mr"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDF619D07B;
	Thu, 19 Jun 2025 01:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750297256; cv=none; b=CUGQPVF/+z1umM2OrJQw4pNyopUQeBhpUyqPQ7XWl4KR7cf/ztn3FI0xe5co6qmMPXy5rioWtbjKeQrmWkMaMBdLd7PlZYgAhHTxLu+Vf31mjeqSlHmk0T97lrNcok+/r0frqAB85Y4D6XnQI3Q3JVV3aY7qFR5R1KAMdG82EpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750297256; c=relaxed/simple;
	bh=OJn9kd1ng9OM2nVpqRi3Cf3ZuU4I+AAOFghjU+BzbYk=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=VVoQhKaeCIzIsKL5XD9Iag7B6j8FZwrtKUvOdpoKlwhjvvzPwe4OSWT6HJOw1lWd9/3ts4mTMLpVKORU60Qwl0Ifxw0bxP2+9oRUe+RH0RxR1njLsJ+KtLJjeBoDcMvPnjOPs2teGAfRdc0JpGGXOCWZf/aDrFm7Mzxqd5B1YOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DWQTn1mr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B406CC4CEE7;
	Thu, 19 Jun 2025 01:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750297255;
	bh=OJn9kd1ng9OM2nVpqRi3Cf3ZuU4I+AAOFghjU+BzbYk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=DWQTn1mrhrroapz5DprVqjrVYltbYptEduoRfh3DGu14CPhtUoRbnPi4PkQozH3K9
	 ZfmRORp/wO96n5mCbawtW/CJTKA6mr8JFJQHnywbBOf3V8DmiFgCAoqUUvdS8ujbVh
	 NKIeUkdG6l8VbtIihdWKpLW7YHKQEERF4hOwSZ3P/nUVepPQql4weE/mr2ntphYUNe
	 cEoVlDRGFwcWRb8uBtumH/TDjF+PuUYppihg8LmN8c6IzqE06VbxvTkjsf+5xkpr5v
	 iA9KB7J/+fHc/6vOiJm63WFLBpqTKRoOwH3uJ7RI9ff8d1ksqpjCK5cIW4cW25ZtgV
	 VwFXRb9XW9TxA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250521210832.62177-1-robh@kernel.org>
References: <20250521210832.62177-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: Convert marvell,dove-divider-clock to DT schema
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring (Arm) <robh@kernel.org>
Date: Wed, 18 Jun 2025 18:40:55 -0700
Message-ID: <175029725500.4372.16824726807803452010@lazor>
User-Agent: alot/0.11

Quoting Rob Herring (Arm) (2025-05-21 14:08:31)
> Convert the Marvell Dove PLL divider clock binding to DT schema format.
> It's a straight forward conversion.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to clk-next

