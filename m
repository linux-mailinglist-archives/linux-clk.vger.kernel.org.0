Return-Path: <linux-clk+bounces-21651-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E84AB13BA
	for <lists+linux-clk@lfdr.de>; Fri,  9 May 2025 14:45:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CBF452256E
	for <lists+linux-clk@lfdr.de>; Fri,  9 May 2025 12:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2FF29114A;
	Fri,  9 May 2025 12:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="hsrITmlC"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF2528F52A
	for <linux-clk@vger.kernel.org>; Fri,  9 May 2025 12:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746794727; cv=none; b=ZnB/bAl18Orj7ZSX9El+wv54cW8rv4x0EzP6ZmOsudcFMSIUT6nLQ3NsVtOBKiESdzvM4UpYfCyXDRMu9YVWjcW78u/zI+UTSrV7ysDDPnpSHVTHmN+O6d1qB8bjSXtuWSA72gaBEQKaiF8keM8YV4gjh9bautZe5xSxoaHaQrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746794727; c=relaxed/simple;
	bh=8NSBwkR/zU9DvjRNqknsrKz0iNJhVJvXcYxWAeswOCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FWIP6KpnLrxj23eGfcqwytSjdervVycCMSrfPdIXwvQ/w5uAOPsYm4V1x1pFWH2lFfgUbjU7O7EbcM66vY5pnvqdrwtPuyPichnRNfNgN1p7xdfLA/9lV15XI4PXvoy7uNzJcfD1NzSfXoaX5xLIlqPhfknUA1G++Ku0nG1CCxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=hsrITmlC; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-70811611315so16994067b3.1
        for <linux-clk@vger.kernel.org>; Fri, 09 May 2025 05:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1746794725; x=1747399525; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UptzkckGGe6JRswL/8UtUucPFjfcOJ9lUow8fGoTkk=;
        b=hsrITmlCJMITj5ZIaEQpj5r0jUDmVlA8TzFbrwYnQWgTe3obJCta8s730myIjkNMg9
         0kBeJ3byULVQUZfaj27cgcd0A0L0PmaDUqIeBLEPNGgkTusPzHfuayrzVHYHot37n3QS
         9akdjGEWqho7sby3hmKk3nUPRptY2TuMhPFS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746794725; x=1747399525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5UptzkckGGe6JRswL/8UtUucPFjfcOJ9lUow8fGoTkk=;
        b=wQOdS49HHRD50B1ch9bPBpsbOxWi1+bc8xOQmY6eH6G8OMGN5Uwz6bh0viPRNtoacB
         A4+Zm2ViUBNdL8GxyyPXfTaQ8KL+mWEcOKJldOqp63pPgj1FpYM5XfOUJGaIBxzNDWNF
         EzE2dDXpVzU/JL1mY7/9THUMmT/RHIR9D8moH8cxN9Wz2nehRG1LjOCuQmHQ/A9OQxgE
         L+XXP6cpej91/3l7U5cfCEi7OauD4yWd6OdxKMhTwdIqBvzQ0g8cxHe6Zsx4346JCZq5
         qjts1CwszLVz77Vzc406UHKI6z7SrKpWWtI0MTJcOGrfIT6KSEqa4LvWrTpXKxkpwrRA
         6b6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWx+Nz/zZhJliAMBLTfD7s+2Bywdv21Z50mgT9vWAlTFg5oXBmnB3bjSNU+A7Zf4Kbyv3YpB1/7PQY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3PfHApF34zVeO/BsaXglJETLTWIOZ247u5n/rgnFbJX0m0obq
	N/ZWU61UngXZzTi+QExwWEyrXHtwqmjYLcSni+HSa94f9K7qtservpRSJl14lAleHtkuDuU8C4U
	75/UHXTKCatOrD0wZwcebVpz4XWKNPdy+ajZziA==
X-Gm-Gg: ASbGncsoskOrF5ato8oMInkKyeUgRjJCRSHQB14LRP/k0CXgim8WtJvUsXbRduT0zdh
	k+PTtdUTLFnx1cLkcjMXa7spsi0Y0WQsv8QuslpHZzcXjFJ4on98StaoKAlD6xo+LCWzIH89gwE
	R5fnqESoo9277WJ+LD/w==
X-Google-Smtp-Source: AGHT+IE+ZAuLmkz1arQbVX0YZvJVLhQ7nxcEKZcFN7pYHPM6BXlBBzNkNPkqSg4yVC9lFIj68cGkI7vjB1r4wxAuYWQ=
X-Received: by 2002:a05:690c:2506:b0:708:11c7:d200 with SMTP id
 00721157ae682-70a3f9e3f61mr40837627b3.4.1746794724940; Fri, 09 May 2025
 05:45:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
 <20250424062154.2999219-12-dario.binacchi@amarulasolutions.com>
 <aB1f74ufYoNmXfEn@finisterre.sirena.org.uk> <CABGWkvqySQugJpaj1s_jqGHkA5BONALJY5jn7JjZe=iLc5x60Q@mail.gmail.com>
 <aB3EIxfwTbpQw7Eo@finisterre.sirena.org.uk>
In-Reply-To: <aB3EIxfwTbpQw7Eo@finisterre.sirena.org.uk>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 9 May 2025 14:45:14 +0200
X-Gm-Features: AX0GCFsMhC-bZIQbroR-iMbqMxImzouNrdaQ9uRaQFjqPmIkXBI_CX0YvsjmbY0
Message-ID: <CABGWkvq+FQZ2A9vpv2XfDmbHgpNOSnZhCMdkKaeqhCcvdjzdAg@mail.gmail.com>
Subject: Re: [PATCH v12 11/19] clk: imx: add support for i.MX8MM anatop clock driver
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	linux-amarula@amarulasolutions.com, Abel Vesa <abelvesa@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 11:00=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Fri, May 09, 2025 at 10:34:38AM +0200, Dario Binacchi wrote:
>
> > From the log I see that you are testing a board with i.MX8MP, but it's
> > probing the anatop for i.MX8MM.
> > Is it possible that you have the CONFIG_CLK_IMX8MM option enabled?
>
> This is an arm64 defconfig so whatever that has set, including the
> above.  Note that arm64 is supposed to be single kernel build for all
> platforms so we shouldn't explode due to config options for other
> platforms.

Ok. I'll fix it asap.

Thanks and regards,
Dario

>
> Current -next defconfig:
>
>    https://builds.sirena.org.uk/f48887a98b78880b7711aca311fbbbcaad6c4e3b/=
arm64/defconfig/config
>
> > I have personally tested the patches on i.MX8MN and i.MX8MP
> > architectures, with only
> > CONFIG_CLK_IMX8MN and CONFIG_CLK_IMX8MP enabled respectively, and I
> > didn't encounter any issues.
>
> Given it's wide use for CI the defconfig really needs covering, any
> random combination of options that can be set ought to work though.



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

