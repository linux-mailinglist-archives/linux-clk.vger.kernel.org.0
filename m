Return-Path: <linux-clk+bounces-6790-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 857208BE969
	for <lists+linux-clk@lfdr.de>; Tue,  7 May 2024 18:42:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6DF21C242A1
	for <lists+linux-clk@lfdr.de>; Tue,  7 May 2024 16:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 579C016F836;
	Tue,  7 May 2024 16:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a0AsDGEz"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E0016DEC5
	for <linux-clk@vger.kernel.org>; Tue,  7 May 2024 16:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715099746; cv=none; b=GhZ0vScNawTRkCW5myK/VBfLua9S4pSDoTXKghtLszDmggGHZM/QC/9dEfTuQQVMofleB8YNQFqrXBh876+RkXBLM4VoXKZWGwmeK8fUY7NrFFbxRj1qf2yLT9oewkVxi0yOkcEbXDxQyGnooq10cd583XEvfeU+arTVRbbArps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715099746; c=relaxed/simple;
	bh=XerfGCvQBLxAD+jV7USIjvv0r3O3fMyoQLRDmfzroSE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:Content-Type:
	 MIME-Version; b=cOoGfGiv7Z+CRmfeVvi1XUZlBUIiHycPU95AQTw8wy3oWUPmnmRYcJTJd/Zvjht5ko3DpNRmvTuY96Lzd6N2HrmrXIFgPMmgzCGarUz34Rc5SJUNSHYDxFeyewJKmv/tFkL9u8CREnIt2i0WDUIgB6nHWiLu5NEyOkLg+f2A+2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a0AsDGEz; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-51f174e316eso3755606e87.0
        for <linux-clk@vger.kernel.org>; Tue, 07 May 2024 09:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715099743; x=1715704543; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:in-reply-to:date
         :cc:to:from:subject:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3b3JcB4jVVvpbe94/7RIYBwM5yodY4uezn7CZ5MUGh8=;
        b=a0AsDGEzQKmAzk0PcrXByRi7ywHDwGNfvp2B8De+nAwgQrQaR7WTWOQpYeIhy2ar9O
         9VWLrdDSiKnwW7zoyVU2w4dijzFfCWkxXKC+lx+QkfLjdFWgEOkvMU/NFvVUalWpy7Od
         WHWIBKKIMD3HBy+b2HCFW1xJY7rYwJ8NsCoGiT57vAd/XVImQAVeI16OavYt4ME/F6Iw
         6AUoGbO9Myh73Ol/AzudaG+iAFC2C1kNw+1dA+eNr1nT1hB1w9vIQ1ryvQh5itvlMu49
         unue9UI0iYDUIr6o/3Vjdx3MrFbjrlxEW9l+i3X0hlDnZSA3Foy3PK4E9t3VQEIRwlYW
         SyyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715099743; x=1715704543;
        h=mime-version:user-agent:content-transfer-encoding:in-reply-to:date
         :cc:to:from:subject:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3b3JcB4jVVvpbe94/7RIYBwM5yodY4uezn7CZ5MUGh8=;
        b=tyeRo6zwH5N/XYIU28d3XcEGvL/dR7W6E5nseMmwpHOUIlcmtTROLSjC2oQKH4MUYO
         ZYZXVRemU0ok9q3U5ShNCYWaK/slJCPnqgYvJ6vRQNgz9Gftj/GiRo9zMGfcQDYXF692
         W7pn6mBiVauPYl/mim7QPR5+4ebvGeGEiLe+B9z1GoPyUeaX6Bl3Iu/3sFotUqpiHUzD
         ZiCZqceFtMU1GVIEnxSZJclgf7ZwSLbjAz9rzenjVEtogv9x0XOgqV+bH09em9tWdFgg
         hFl0zy3hBfki5jArmCGZxqZceB+79tLFH2TKSjJPUBnSujsyLDGkQg4/75QE7KrLdYa0
         TlSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNkckI1CzLOlXcaHngHr3vq8t+0R199Cm8jlQ1lN9dJkVSnj0dvqWsiwoya6DmF1xgIGF81i6V/6ZW6pD70iYYu2BJnTkr1wrr
X-Gm-Message-State: AOJu0Ywj3ur0A9kf2pQlqUndfGS59zId1DBr9Bm+KZ8RGlUltosoL8LF
	+MJ2qiyVdwj+lsuUSPSaXmI+noDUpMelGruhr/A/N6BWFQhxzu5l6Bz+egxhhng=
X-Google-Smtp-Source: AGHT+IHX7X1gVehuBdCEcnWbVY0I6JH8hCJ94H9IbdJ4fwiaepF1483cylE+qjfHRu/AM5LH7a5Q1Q==
X-Received: by 2002:a05:6512:3ec:b0:51e:25d2:453f with SMTP id 2adb3069b0e04-5217cd48db1mr23279e87.68.1715099742895;
        Tue, 07 May 2024 09:35:42 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id g1-20020a5d6981000000b0034d8b0b5329sm13288792wru.87.2024.05.07.09.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 09:35:42 -0700 (PDT)
Message-ID: <d6b694cdfc1db1abf230e546453d55248a0fb439.camel@linaro.org>
Subject: Re: [PATCH] clk: samsung: Don't register clkdev lookup for the
 fixed rate clocks
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: m.szyprowski@samsung.com
Cc: alim.akhtar@samsung.com, cw00.choi@samsung.com, krzk@kernel.org, 
	linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	mturquette@baylibre.com, s.nawrocki@samsung.com, sboyd@kernel.org
Date: Tue, 07 May 2024 17:35:41 +0100
In-Reply-To: <20240507065317.3214186-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3-1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

> Commit 4d11c62ca8d7 ("clkdev: report over-sized strings when creating
> clkdev entries") revealed that clock lookup is registered for all fixed
> clocks. The mentioned commit added a check if the registered name is not
> too long. This fails for some clocks registered for Exynos542x SoCs famil=
y.
> This lookup is a left-over from early common clock framework days, not
> really needed nowadays, so remove it to avoid further issues.
>=20
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> Here is the fix for the mentioned 4d11c62ca8d7 commit, which fixes
> booting of Exynos542x SoCs:
> https://lore.kernel.org/all/20240507064434.3213933-1-m.szyprowski@samsung=
.com/
>=20
> This change is independent fix. I've tested it on all Exynos based boards
> I have in my test lab. It would be great if someone could test it on
> s3c64xx and s3c24xx based boards.
> ---
>  drivers/clk/samsung/clk.c | 9 ---------
>  1 file changed, 9 deletions(-)

I've boot tested this on gs101 / Pixel6, which now completes again successf=
ully on
this Exynos-based SoC.

Tested-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

