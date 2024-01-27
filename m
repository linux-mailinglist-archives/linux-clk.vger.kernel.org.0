Return-Path: <linux-clk+bounces-2973-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8417283E9F5
	for <lists+linux-clk@lfdr.de>; Sat, 27 Jan 2024 03:43:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 17919B2441F
	for <lists+linux-clk@lfdr.de>; Sat, 27 Jan 2024 02:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 888BD9475;
	Sat, 27 Jan 2024 02:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V/XJEUnm"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF5C11707
	for <linux-clk@vger.kernel.org>; Sat, 27 Jan 2024 02:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706323411; cv=none; b=NOpEjugPuuyXy0s8zvi8seQiYo7Kbb6Gf16tZqh/ALSRRXWNBxfUuI7IPWm8bV+6TgQ4s9+vn+8aofvh/tShSjPo9umeWw/T9pNQcCf/Trrhezl/joSQhXfPMReydQWpftIZop0zj/x2p2ayaU4TKfi0CnE1DGkls2KkPKI90G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706323411; c=relaxed/simple;
	bh=J83cGtBp27ayZDyo/vtlJCIGI1RJIiUwBxfYHghGR+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rEip6P6OGi5Y6wep5RFy/rPrwwRlvuGUT5J+VLSS761DlbeosJyckGyCL5Pvz0RZ917ykEw7YotVKNCSgENvi/D9W4FtMWdVCJpha91E7QI2D0dHVy9vMyHn3TWXz+rEkakQF5lY3cHuPC/50pMzPdgbBuSgElv6UL4XvoOk/Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V/XJEUnm; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-595ac2b6c59so637351eaf.2
        for <linux-clk@vger.kernel.org>; Fri, 26 Jan 2024 18:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706323409; x=1706928209; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RyfKTninr//YcXdmOl6ikrOzMr02DwwXqiLooW8dVos=;
        b=V/XJEUnmJ9mWN2PX/j3PLfikIw4+o93DDV6PMaNj3zAWJbYaZmHxHezHm1nZ8oIyRp
         2MUQDtqLAGC9sUPjKwY01f1PX6G/6UPF9l2BMpYlUa9GdMjHb+SIl/gPEpGfX7j3l2B4
         T92LWex/aIvVa6oDi+lSa8QzaiYs39NWkKsQpKnQMK/7YFMTBFL5ifIdmZLB5RhJOX4y
         wuAvn3rlkhIf/u9eS58HeVWJW7aTvsUjRkGgeDKwytZbKjeSpfi/QxhnAUeEUQ6Wfpfp
         g8segA8ghUlMYqy3tWLY5/cwDqFpeMRIcToHq+fR+Dkv14gXFSFBDK2U8wMKjtBzo4Da
         tUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706323409; x=1706928209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RyfKTninr//YcXdmOl6ikrOzMr02DwwXqiLooW8dVos=;
        b=ekk72XBHVK0vmdROhrm1f7+9FpggKXM0qcTGjvOcBqOnIDrk9mxparzT8GCYsM5Kg+
         3WZfRz7WpBu82O1+mmEHCM56HQfu+wsr9yTnuD4CXOB2tZnAniAb6muMMuY8K355zeCa
         WJcb4o6p5uj8aQ2/JbTxUaP2x88R7y1sOYKWPbxI+yzShNMyeQ9o6CRJWyqU3qHUt9Q8
         q3Qeb08tX8Uh07GEK01T7RvMXHriHGJLlXOJW5sNAaYb80HlewO0+dSxXwFPZ3EZm8kj
         N7he6IvPmgS99nLd8NMGl8OKf0kFfQ/buExnThl7pTWOuG8boXj5QtAcGDdwpN4tOAu/
         VujA==
X-Gm-Message-State: AOJu0YwA4PVn4oqaBHzMabnMJBO1o0iEnq1EomEesBego+FXgual2XbC
	PaJokvP6scq5g9ZT0gVwc64F43bSiccESC8SPYQb0yj0wIX4i8RP0WE7OZYVcZofuzo1nq/M/A6
	SCuJU5Qca7FiQ+5RrUWG04K0Q0XihZtRA4QHsRQ==
X-Google-Smtp-Source: AGHT+IEkKB2QGZKiNjAvXXH6n/PcZozMYAW4AsJBipNdXovvgdJy3/oFIt22t48sGdYch0IDB1RqphlBj23SyagKhCk=
X-Received: by 2002:a05:6358:60c4:b0:176:b156:f69d with SMTP id
 i4-20020a05635860c400b00176b156f69dmr656246rwi.31.1706323408911; Fri, 26 Jan
 2024 18:43:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240127001926.495769-1-andre.draszik@linaro.org>
In-Reply-To: <20240127001926.495769-1-andre.draszik@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 26 Jan 2024 20:43:17 -0600
Message-ID: <CAPLW+4=3o6kGQcQhzo=1JwPFp+qF7GpuVYuZ_Jvh_7o9d0Mbbw@mail.gmail.com>
Subject: Re: gs101 oriole: peripheral block 1 (peric1) and i2c12 support
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	tudor.ambarus@linaro.org, willmcvicker@google.com, alim.akhtar@samsung.com, 
	s.nawrocki@samsung.com, tomasz.figa@gmail.com, cw00.choi@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 6:19=E2=80=AFPM Andr=C3=A9 Draszik <andre.draszik@l=
inaro.org> wrote:
>
> Hi,
>
> This patch series implements support for the 2nd connectivity
> peripheral block on gs101.
> This block contains an additional 6 USI, 1 I3C and 1 PWM
> interfaces/busses.
>
> i2cdetect shows all expected devices on the one i2c bus that this patch
> series enables.
> Everything that's in scope in this series works also without the
> clk_ignore_unused kernel command line argument.
>
> While working on this, I noticed the existing peric0 support for gs101
> has a couple issues. That explains why there are differences compared
> to it and a separate patch series will be sent to fix up peric0
> support.
>
> Cheers,
> Andre'
>

Looks like PATCH [00/xx] is missing in the subject.

>  .../bindings/clock/google,gs101-clock.yaml    |   9 +-
>  .../soc/samsung/samsung,exynos-sysreg.yaml    |   2 +
>  .../boot/dts/exynos/google/gs101-oriole.dts   |   9 +
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi  |  42 ++
>  drivers/clk/samsung/clk-gs101.c               | 347 ++++++++++++++++-
>  include/dt-bindings/clock/google,gs101.h      |  48 +++
>

