Return-Path: <linux-clk+bounces-1490-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E8B814415
	for <lists+linux-clk@lfdr.de>; Fri, 15 Dec 2023 09:59:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87CEA1C2284E
	for <lists+linux-clk@lfdr.de>; Fri, 15 Dec 2023 08:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD53171BA;
	Fri, 15 Dec 2023 08:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="M6z/mau1"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750FB171C1
	for <linux-clk@vger.kernel.org>; Fri, 15 Dec 2023 08:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40c3ceded81so4305165e9.1
        for <linux-clk@vger.kernel.org>; Fri, 15 Dec 2023 00:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1702630751; x=1703235551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z4WNnW1NOB+fO7Mg7VbmdWzZX8Gi/hj8/iQQVYrLkFo=;
        b=M6z/mau1nGCcxKJBD1JweSODuXuRgGkipmmYS+u1Eejlmd4pT883VU91Fkata1Rnmj
         nLC2HS4xJDuQalTpzTlmwZqfogyMF1TkST+Q/JobaHUF6ofqbsAHSFKx/l/6df+a4m2L
         u58bOP83ZqxuPg7Z6bUUdOsIwAX+Jdb2IYnegIAfrcptlWHriL7veQfRlBuiyNxDa0kB
         wJNxobJ3E+L35CDOrQyY1SmqIwHfWbpuG6+AYeKWTyjIHsVBbE40+UvtwF515bxU1X6J
         pBwaJepPUXwonixPC7Z/fjyref1ktmg7jIWDVRKLA/B4VYRsGIGxUTtYsjN7nnFcAlDe
         RoYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702630751; x=1703235551;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z4WNnW1NOB+fO7Mg7VbmdWzZX8Gi/hj8/iQQVYrLkFo=;
        b=pudcOr2ucXEYmDsWB9eFVXfpFt4wjociUWWRY7rAhP13ZwK1jr6vMfjYoJRlWqqlw0
         k4ih+nF6LEhxNXz8AwiipTwDwKCr8dfo79YH3d5QVGoMXnkO0yR3yD62tGc8BJQuNjmh
         FYz+BNTdkD5GMuhz7nGEyobW/PG+I9LHNP09jl4X5eX0vsWlkdVdlf3v8zLuxFNjy9SD
         2WmIEa0GRw2KYF2AYPXBQE/7A961gRZqQEa1L+UYZD7Ez+2F0QoINtxZi8PINXalEEPu
         1etFALcIHdWs7+HlNh298V6Mk7tgiV1KtMZkTUnc2Rl0/5tDD8PY45rrPoyu4vbmTHYe
         brdw==
X-Gm-Message-State: AOJu0YwLycVGM3C7TvgF+0e0lilDpxcvR/VVV66ptJPKy4U9nNVR7cwI
	PX4Vekllh4rbQQE4NjLz7Qztyw==
X-Google-Smtp-Source: AGHT+IEboGQxDSRvg+eZ0u566TMxgE1PRMgtXrg9o17xozQrBEwE5qf8IjdFQqOGaJQkmuVK10ixdQ==
X-Received: by 2002:a7b:c8c2:0:b0:40c:279d:31a3 with SMTP id f2-20020a7bc8c2000000b0040c279d31a3mr5769544wml.176.1702630751467;
        Fri, 15 Dec 2023 00:59:11 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:95b3:332a:9768:b3f2])
        by smtp.gmail.com with ESMTPSA id j8-20020a05600c190800b0040c58e410a3sm10914972wmq.14.2023.12.15.00.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 00:59:11 -0800 (PST)
References: <cover.1702400947.git.u.kleine-koenig@pengutronix.de>
 <ki5n3rz5n4oxj2hhc3rj6xpn3e2tdi7fcp2q7exjbzilrlqflp@przautvhuy4g>
User-agent: mu4e 1.10.8; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Russell King
 <linux@armlinux.org.uk>, linux-clk@vger.kernel.org, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob
 Herring <robh@kernel.org>, linux-tegra@vger.kernel.org, Johan Hovold
 <johan+linaro@kernel.org>, Georgi Djakov <djakov@kernel.org>,
 kernel@pengutronix.de
Subject: Re: [PATCH 0/5] clk: Make clk_rate_exclusive_get() return void
Date: Fri, 15 Dec 2023 09:41:59 +0100
In-reply-to: <ki5n3rz5n4oxj2hhc3rj6xpn3e2tdi7fcp2q7exjbzilrlqflp@przautvhuy4g>
Message-ID: <1jedfnq1sx.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Wed 13 Dec 2023 at 08:16, Maxime Ripard <mripard@kernel.org> wrote:

> [[PGP Signed Part:Undecided]]
> Hi,
>
> On Tue, Dec 12, 2023 at 06:26:37PM +0100, Uwe Kleine-K=C3=B6nig wrote:
>> Hello,
>>=20
>> clk_rate_exclusive_get() returns zero unconditionally. Most users "know"
>> that and don't check the return value. This series fixes the four users
>> that do error checking on the returned value and then makes function
>> return void.
>>=20
>> Given that the changes to the drivers are simple and so merge conflicts
>> (if any) should be easy to handle, I suggest to merge this complete
>> series via the clk tree.
>
> I don't think it's the right way to go about it.
>
> clk_rate_exclusive_get() should be expected to fail.

Yes, at some point it might. That is why the API returns an error code.
What CCF (or any other framework) should be no concern to the consummer.

Driver not checking the return are taking there chances, and that is up
to them. It is like regmap. Most calls can return an error code but the
vast majority of driver happily ignore that.

> For example if
> there's another user getting an exclusive rate on the same clock.
>
> If we're not checking for it right now, then it should probably be
> fixed, but the callers checking for the error are right to do so if they
> rely on an exclusive rate. It's the ones that don't that should be
> modified.
>

I'm not sure that would be right. For sure, restricting a to single user
was not my intent when I wrote the thing.

The intent was for a consumer to state that it cannot tolerate a rate
change of the clock it is using. It is fine for several consumers to
state that for a single clock, as long as they 'agree' on the rate. Two
instances of the same device could be a good example of that.

Those consumers should use 'clk_set_rate_exclusive()' to set the rate
and protect it atomically. Calling 'clk_exclusive_get()' then
'clk_set_rate()' is racy as both instance could effectively lock the
rate without actually getting the rate they want :/

Admittingly, the API naming is terrible when it comes to this ...

> Maxime
>
> [[End of PGP Signed Part]]


--=20
Jerome

