Return-Path: <linux-clk+bounces-1174-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B1C80C479
	for <lists+linux-clk@lfdr.de>; Mon, 11 Dec 2023 10:24:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 837A0280DD8
	for <lists+linux-clk@lfdr.de>; Mon, 11 Dec 2023 09:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C59EB21353;
	Mon, 11 Dec 2023 09:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W/CiEJ6Z"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43AEB116
	for <linux-clk@vger.kernel.org>; Mon, 11 Dec 2023 01:24:35 -0800 (PST)
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-462e70f1c20so1196774137.0
        for <linux-clk@vger.kernel.org>; Mon, 11 Dec 2023 01:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702286674; x=1702891474; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ioYDubYP3iKfHKMHSy5gra3AJi2J9HK+LXY7uK+G2MA=;
        b=W/CiEJ6Zrane0oOjE//4FGj+YzLPdrKB2GGEh0/4qccXwnJPHTc2FRUqAZ9euJ8Vzz
         PsymlVpHxUW0Jg+3GeXkEYPaIO9cN5k7ebupTeRd67qS8LRJ0ayHcYNUqncJqkP9NRgU
         c4RMyWxrbOBFiJV+e2Zo2IJZocsJgFB/ioo4DQhqoEEmEPmDU/twikraVG553CPIeQQa
         ZhWIvzOfZPEXnxbfRNfAKhvn8N5sJxwrCXDrZjtVenGE0DYFMj7gz2PmfcbCzcuz7uoZ
         zTNp/zaZgfl2ZrxAya4f1llynoJgQ7yAzDqiKaRRoBjJT4QxeaEi/Vguc+rHSYYbwHIA
         0JYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702286674; x=1702891474;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ioYDubYP3iKfHKMHSy5gra3AJi2J9HK+LXY7uK+G2MA=;
        b=FP9kJXnd4SvqYJfcMkAWchJE8zshNL3v1IOK3LeUc+OUhH0/KWmKxnqA8dUvXI7jTK
         A7flQfFGlDCAm+jgqyuv4fnKy7E+oqSBlX5tq8XJ5NWcSB5mYHGuI5YN67QkzWCUniHn
         plXL9NLleqIjQFTnIfKCXL/X+xKYyVaQpNX9gvEuubBlff/vgljioVx4REYA0N+uDAO/
         wtYacaXplFhFL9CA+Y9MZ3IQ+azi6qgD6t35P1Oemrp4EnrTDff0RNxXfqxmm0F8QklW
         HhX/Sr5+SupX3MU9YfpKlXv2Hu4ZcDcfETMxUj2jRYKLPSHymU9guiaKJ9zPnHQLDLtb
         c6Hg==
X-Gm-Message-State: AOJu0YwnLrqFF2/4CfWagd178/+xodI9EuPvGpF+61KqxeWSIM3FAOyf
	fgaeHM+EbJm+3nCULxfDe/o2zDp+bSdzf5qjGxN6bw==
X-Google-Smtp-Source: AGHT+IFmqVBB1S6PPILmZng6sUl4gnE7B/ENtukMPc8F2U+pjJRlhmvt8Xvk382O4/Rc8AUY2sPYgeEL53IrvFfBTZs=
X-Received: by 2002:a05:6102:3e90:b0:464:82c0:7ed9 with SMTP id
 m16-20020a0561023e9000b0046482c07ed9mr2131634vsv.20.1702286674338; Mon, 11
 Dec 2023 01:24:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231209233106.147416-1-peter.griffin@linaro.org>
 <20231209233106.147416-5-peter.griffin@linaro.org> <e70d516d-db24-4d79-bbd8-bb5b497a4391@linaro.org>
In-Reply-To: <e70d516d-db24-4d79-bbd8-bb5b497a4391@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 11 Dec 2023 09:24:22 +0000
Message-ID: <CADrjBPrhO42-7TY0iNuRcyWj_YUwpNMWROY_6waLoVtmp7uwrg@mail.gmail.com>
Subject: Re: [PATCH v6 04/20] dt-bindings: watchdog: Document Google gs101
 watchdog bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Sun, 10 Dec 2023 at 14:23, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 10/12/2023 00:30, Peter Griffin wrote:
> > Add the "google,gs101-wdt" compatible to the dt-schema documentation.
> >
> > gs101 SoC has two CPU clusters and each cluster has its own dedicated
> > watchdog timer (similar to exynos850 and exynosautov9 SoCs).
> >
> > These WDT instances are controlled using different bits in PMU
> > registers.
> >
> > Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  .../devicetree/bindings/watchdog/samsung-wdt.yaml         | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> > index 8fb6656ba0c2..57468c2c5ece 100644
> > --- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> > +++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> > @@ -17,6 +17,7 @@ description: |+
> >  properties:
> >    compatible:
> >      enum:
> > +      - google,gs101-wdt                      # for Google gs101
>
> I think you did not rebase on linux-next. The hunk differs.

It was re-based off 'next-20231130'. I will re-base off the current
day's linux-next for v7.

Thanks,

Peter.

