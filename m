Return-Path: <linux-clk+bounces-7675-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C038FA662
	for <lists+linux-clk@lfdr.de>; Tue,  4 Jun 2024 01:25:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC932286379
	for <lists+linux-clk@lfdr.de>; Mon,  3 Jun 2024 23:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95ACB13D244;
	Mon,  3 Jun 2024 23:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XM7juh57"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9C213CFA2;
	Mon,  3 Jun 2024 23:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717457088; cv=none; b=RepCnZYRqAYs/JdWG/0y/e2lv5WL8yV8KjKaQB620JT2qhufBTtZbxUMM6GusMGXEZ9YMzDLM48uoDH9r3hL6BYzqpx3khLs5fLtml4OWgLUC3Qj5U+sI9a6XXAZQbKRkYPl2JiPZli7FCdxASrXX9wiMfNIo8G4Eu0SvajUeGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717457088; c=relaxed/simple;
	bh=38Xpy1RQYAEE/bLMyyOQflCsEozhARLqUIkUOJC0DDE=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=JxwjSbCI9G1Ha1wb60UtU6Tz2djzRyQXo3K1r4q3OwPrnVD5ZIslB217UHXN4REkyjcMQrjRs2b0GDQcU5H9+A6MYqp8W20PTtqfqbXUj6DIfqRduOGa7v/idhgKqAsD9urOdRyY54z+/QJ6o4N22a0MfRlq1NI2lrNO4BYPzXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XM7juh57; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4195C4AF0A;
	Mon,  3 Jun 2024 23:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717457087;
	bh=38Xpy1RQYAEE/bLMyyOQflCsEozhARLqUIkUOJC0DDE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=XM7juh575+BwlBcZ8fp0bRiLLzJusRPi2ixOuV8ODfzek8cJ6RKz+wuTOZmOmjtsY
	 ayk82edDK3SMswNr1QDSCDH8UgiADMfwfA/I9mS373pboLmUh750GXVyNWPHC262Sq
	 J7oUmQ6s3jgUETrSbg3UE9MmsEDyiflWnj2RWfKtt4fuOsjriSoVUDJc1V6XRIhDV7
	 iYfOQkiTvUykOoVlAAsNe0j50b4O1HQ/jPI+k2VRR+KXmrZWRTWoHRpE6MZ8era807
	 WXyeNS9vtdFM0BMWG9x8rLTISFtfbgGaLDC0urP2hMcE6siaoevG5wyLUDWZO+2ZVP
	 iGAElybhs37Ag==
Message-ID: <d0c692c2b78e2e562dfe5df6388aaf8e.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240528121320.160685-1-angelogioacchino.delregno@collabora.com>
References: <20240528121320.160685-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] clk: mediatek: Add a module description where missing
From: Stephen Boyd <sboyd@kernel.org>
Cc: quic_jjohnson@quicinc.com, mturquette@baylibre.com, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, kernel@collabora.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Mon, 03 Jun 2024 16:24:45 -0700
User-Agent: alot/0.10

Quoting AngeloGioacchino Del Regno (2024-05-28 05:13:13)
> Add a MODULE_DESCRIPTION() on all drivers that miss it to avoid
> modpost warnings.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---

Applied to clk-next

