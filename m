Return-Path: <linux-clk+bounces-10057-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC68593DA04
	for <lists+linux-clk@lfdr.de>; Fri, 26 Jul 2024 22:50:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE28E1C221FA
	for <lists+linux-clk@lfdr.de>; Fri, 26 Jul 2024 20:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC98149C5A;
	Fri, 26 Jul 2024 20:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Od3TB5DT"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAFA748A
	for <linux-clk@vger.kernel.org>; Fri, 26 Jul 2024 20:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722027033; cv=none; b=rxKX1T56GE8ZTmEPIarW1xm0FcwJ8v3pfA/2g+NRfzD8FQd0BzR8NBpijCKA9oV+inWJdzo6VXZvm7GA8W2QBjpM3buepVHdVetoIPEAlfHDRyfmMHz1zsNCSmDF8qZLjhA9du+50pQ5WhkFld5xcxBmSMSc1JNtQ2/QjxB3naM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722027033; c=relaxed/simple;
	bh=KogmYRFSz2W2+mhD6V6jG3/dYCuZTqrU9wdwTpVNdWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ee2aXTzn2IX6zKTPzJ9sHXrA18VoHgG8bytliJobv+X16xeAF2kFTeRBA+je0VUgw/rgTpbYn2008y6V4H76jFMpVnXpC/pvjGoRmz3kcutVn6XPYKrtx7WR7AXdqSWD8QAz5WbkgS26nagfZOQ+rA3hEAL5U1kaI40XHvrj+0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Od3TB5DT; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52f01993090so2493067e87.2
        for <linux-clk@vger.kernel.org>; Fri, 26 Jul 2024 13:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722027030; x=1722631830; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sW23BR/or2MMuYF31lJOR7RMa4C6ZEhZGo6Oj9/Pb3Q=;
        b=Od3TB5DT1KbNLDO4XyQzumnKCWM80b/szVLnruv8B/gqtD8Kza5DQe3OA2yHGHRzm4
         nfKK0heMXTSckqurOqxkGxISsPtmPKZp7XkQjnYxURKXcmEGvOQOuG94cfAiMN8xhiLP
         zqgCUN9+9wO8Zw279XHYJECa6ej/0MtWniQ2XbQp9utEPKdl8DsnPVX4b0h75VntJxst
         LbwzhIMJmE0h8TP/bD4Ag8CfmPEWSWX7dhBi446lp2P/FaBd2aY7meHIZ5xNzNWnh+Bx
         n4GRIXwreAWUrajAkE2DUQ1IAkAPtr/hZ9rVmN2qPy1xxrw7tAO2W7TeUDwnH+9irlEY
         opKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722027030; x=1722631830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sW23BR/or2MMuYF31lJOR7RMa4C6ZEhZGo6Oj9/Pb3Q=;
        b=YWrrQB0N+D/AbGEYCTEXSWYzBdGh/ho++VChN1bZkSjJbz4NMj7dAkEjZqkdvBWoH1
         ZvtfBbchA4j4Lsj3ovAQLjfhkf+EMwTq6o5XtZaINj0RJZO658Q1Fr4L4Di+OEzfmrkK
         WiXTXNQBt4w7yl9H3wJawGKdiLW+Ht6JfiKqsjKFHm6teouRyoFVo1SDZHyBkaUzxdQS
         SmmFBM52Bw0M0xFcZK9j/l16x8WmauCpZuVNUrcMXu36nD3sMRCpFgtQMIaac6pA2rF0
         YpbN3PSJgyUbvbYLZDjeldCEyaGgiJsQds5XUDDGSana/5psOFzbgFvFdKSCQmPy4QCd
         Bu1A==
X-Forwarded-Encrypted: i=1; AJvYcCWCtkxhFhb8B2u2QEBLVXGhhpaZ0mRUNBQwciDdgj62n+oW/8eBYjuSEUtg6ZnZabXsPB1cKtvirWd5dUmD/vtmj2sLCI+47QI6
X-Gm-Message-State: AOJu0YxT39UJB9deAeG6sSCmSGn/Z9mx849n9vYU9jFhaFNjA9Q774lz
	I5XFGJ0oVfmYWnDI+8zTcbIJ3vpJBe/yWW1dtiRDvuNwE7esSZIJc4twyceAfOYl8PwKY+6vzJe
	ZQXB+lN1TddAQDTPnEbCtXbKngF92fyL4d5K3UQ==
X-Google-Smtp-Source: AGHT+IFX49EtxpZmo3lCBvR7LAjeTkZmE2Z3kScGsck8eI7LPC1PBQoOA3czp83TviYDk42LHWvS4Ey6OgvmOSAZBX8=
X-Received: by 2002:a05:6512:32b6:b0:52e:9762:2ba4 with SMTP id
 2adb3069b0e04-5309b274931mr464874e87.25.1722027030326; Fri, 26 Jul 2024
 13:50:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240722160022.454226-1-valentin.caron@foss.st.com> <20240722160022.454226-4-valentin.caron@foss.st.com>
In-Reply-To: <20240722160022.454226-4-valentin.caron@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 26 Jul 2024 22:50:19 +0200
Message-ID: <CACRpkdZTntS7K4aLqoXKbfdO2xumx9nLnA7CXysuYML=ptTCzQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] rtc: stm32: add Low Speed Clock Output (LSCO) support
To: Valentin Caron <valentin.caron@foss.st.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Amelie Delaunay <amelie.delaunay@foss.st.com>, linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Valentin,

On Mon, Jul 22, 2024 at 6:02=E2=80=AFPM Valentin Caron
<valentin.caron@foss.st.com> wrote:

> RTC is able to output on a pin the "LSE" internal clock.
>
> STM32 RTC is now registered as a clock provider.
> It provides rtc_lsco clock, that means RTC_LSCO is output on either
> RTC_OUT1 or RTC_OUT2_RMP, depending on pinmux DT property.
> The clock is marked as CLK_IGNORE_UNUSED and CLK_IS_CRITICAL because
> RTC_LSCO can be early required by devices needed it to init.
>
> Add LSCO in pinmux functions.
>
> Add "stm32_rtc_clean_outs" to disable LSCO. As RTC is part of "backup"
> power domain, it is not reset during shutdown or reboot. So force LSCO
> disable at probe.
>
> Co-developed-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
(...)

> @@ -1928,6 +1928,7 @@ config RTC_DRV_STM32
>         select PINMUX
>         select PINCONF
>         select GENERIC_PINCONF
> +       depends on COMMON_CLK

Just
select COMMON_CLK

Why not, it will with 100% certainty be needed anyway by the system
clock controller.

Yours,
Linus Walleij

