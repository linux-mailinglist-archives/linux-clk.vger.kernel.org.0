Return-Path: <linux-clk+bounces-1564-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9A68162C0
	for <lists+linux-clk@lfdr.de>; Sun, 17 Dec 2023 23:10:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33928B217AB
	for <lists+linux-clk@lfdr.de>; Sun, 17 Dec 2023 22:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEEC949F73;
	Sun, 17 Dec 2023 22:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WkVyp0mF"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9924B12B;
	Sun, 17 Dec 2023 22:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEF5EC433C7;
	Sun, 17 Dec 2023 22:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702851028;
	bh=sK8ZmC8CzyRSfhwSNN8CpPQmyAWgIHF8pDfubqjd1FM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=WkVyp0mFj4rPnscZSURqrkI3csBE55+JWIrmUhFwzN3DpdmVLgJTlvvfQsN8pFHZU
	 Jn8zql4GPONQV5NE/6DsNRWd1yjTxAQF/uLmKvSr9ACuyNPLy4baHUL/jums1pFi9T
	 azTGNB8Pn3ZvoMo4u7bzGjDTYxbYYefmBNbfC7x1dYtncEQFzD4mkNx6cl5yWKUNUJ
	 I+sof3DQqSxPC1No7zVp/cFhUQw4KtRbStDox/9LGPx16Fr8qMriuo8/fAgx9JZ+Lc
	 ILStcByfmAwOmp1IO4DnJErVnPS7O1mYu9VaVKOdCW/v0FqKeQm0vkwb2ZrKax8VOB
	 Lnf9mZ0/G8p1A==
Message-ID: <92d5fa61ef21a90e99127a3180b504ea.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231105200642.62792-1-marek.vasut+renesas@mailbox.org>
References: <20231105200642.62792-1-marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH] clk: rs9: Fix DIF OEn bit placement on 9FGV0241
From: Stephen Boyd <sboyd@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, Alexander Stein <alexander.stein@ew.tq-group.com>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
To: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-clk@vger.kernel.org
Date: Sun, 17 Dec 2023 14:10:25 -0800
User-Agent: alot/0.10

Quoting Marek Vasut (2023-11-05 12:06:15)
> On 9FGV0241, the DIF OE0 is BIT(1) and DIF OE1 is BIT(2), on the other
> chips like 9FGV0441 and 9FGV0841 DIF OE0 is BIT(0) and so on. Increment
> the index in BIT() macro instead of the result of BIT() macro to shift
> the bit correctly on 9FGV0241.
>=20
> Fixes: 603df193ec51 ("clk: rs9: Support device specific dif bit calculati=
on")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---

Applied to clk-next

