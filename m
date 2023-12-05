Return-Path: <linux-clk+bounces-823-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FEF804326
	for <lists+linux-clk@lfdr.de>; Tue,  5 Dec 2023 01:12:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CD0F1F2134E
	for <lists+linux-clk@lfdr.de>; Tue,  5 Dec 2023 00:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5270A37E;
	Tue,  5 Dec 2023 00:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AmC28SNF"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E59377;
	Tue,  5 Dec 2023 00:12:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D15FC433C7;
	Tue,  5 Dec 2023 00:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701735126;
	bh=2iTQKirVNUBg06GK1JZ7wTeQR/IHLTgtzqTTACPj3yY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=AmC28SNFqL8TUk0zLsxaTkq/9vGBVrwUE9GZW9oj4t5Baq8z9pByDUCracfq0bvkt
	 yhvLa1pNvYxICgH/6tVCCzmTFLRWttrEX8vMKs21swn+gAt2tfT1zsJ3tH6/N2v1St
	 d+CelEkagYTq4iPPJzBzBJaaRg5OsIGI4/tv0KcAOuX29zIzUODcGmWsbnq/pq+IuQ
	 TRaUgEgJKhal0njc8vGbAyLba8EJVlBAyKofjwzGq0O6XfI4y3fJMU7YLweRMSu8kf
	 0DIK/fjR/YZmI5XAFv7OVwaGzAn+n4J6MN5i9zJW2/6G62ZxADmisF1txVvV+TUF32
	 063Uo0aMZHROw==
Message-ID: <bf2561f8ba9946d40793bcfcc09f29b0.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cover.1701434100.git.geert+renesas@glider.be>
References: <cover.1701434100.git.geert+renesas@glider.be>
Subject: Re: [GIT PULL] clk: renesas: Updates for v6.8
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
Date: Mon, 04 Dec 2023 16:12:04 -0800
User-Agent: alot/0.10

Quoting Geert Uytterhoeven (2023-12-01 04:41:40)
>         Hi Mike, Stephen,
>=20
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa=
86:
>=20
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-clk-for-v6.8-tag1
>=20
> for you to fetch changes up to 5f9e29b9159a41fcf6733c3b59fa46a90ce3ae20:
>=20
>   clk: renesas: rzg2l-cpg: Reuse code in rzg2l_cpg_reset() (2023-11-27 11=
:09:53 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

