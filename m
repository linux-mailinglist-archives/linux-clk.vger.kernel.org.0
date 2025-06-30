Return-Path: <linux-clk+bounces-23774-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F508AED3BB
	for <lists+linux-clk@lfdr.de>; Mon, 30 Jun 2025 07:17:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1D621726EB
	for <lists+linux-clk@lfdr.de>; Mon, 30 Jun 2025 05:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6431A1A0B0E;
	Mon, 30 Jun 2025 05:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="mqxqIjYr"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3375227
	for <linux-clk@vger.kernel.org>; Mon, 30 Jun 2025 05:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751260665; cv=none; b=hmxI1wnAHcrYoJrbIVoHG58fKP6ay02/+y8enxDYEw+DhlOhh3BTdlLd+4wfNYIrlF428bJBRc7/6rCQQkM32c7mckeDevqkFqVlUv75q/WII+wxvyOxY5GLeXeRr+Xqqsavin6Nffs3d6OQRak+F8SHUgHGJdwxuRXT61AdTZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751260665; c=relaxed/simple;
	bh=j0+utyg3WdFVd9h3Luv7yRhQ04bPtA+ySwD2/SbLX/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l26D/bXqHJDt+S11COVLQnFUn38FajxzBftVwcIUPh28DgoQSf9OWUvpknr5R4EB67wcQhuzOy+GHxrTGXsLeaqgITv1n1TW9xkBzhu8Ryt5lip4wHjkrGOJzJerImwk3zYktb+tClhrhW7W0icHCE10vYvWCEg2HM0UTGtYkDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=mqxqIjYr; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-747c2cc3419so3917877b3a.2
        for <linux-clk@vger.kernel.org>; Sun, 29 Jun 2025 22:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751260663; x=1751865463; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CHPtwkORxYza8f0AQe4trY9Wlzmo7dC+e4hGrz5TZ/8=;
        b=mqxqIjYryhA+0zr9tTzyIr/Gcpvgpp/1zYKFkeUD0l7Kb8GxhEsslHPUnrHDeAdm16
         w4DtFymjm8fm1ZQBYlRRujx4qLkDKc+krNVHFywEuyfpPgZeij5EhNdpUIqIXqgkd3cB
         c7hazZBdvI5w2fRLfZUYnDKVd3D1XsvRz/rBz1fbvaLu7zfhysD5Nmuqs1bZ1oEUY8hg
         LBMc6Q6NDL6VrvwpcOgqpHKj793qgZhTRCppZb22hVI79j8peejBGCgcYJNmqrB5iUo4
         +yezLi9pCJXdX2d2aK5F9ducCt94lR1J5r2g9BQ7DPGIXZQhh2UVH+8fiklLepIjC+Lp
         d8vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751260663; x=1751865463;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHPtwkORxYza8f0AQe4trY9Wlzmo7dC+e4hGrz5TZ/8=;
        b=YJ9OG5kbNPgFWFRoKjdnV72HWng5D9bhYm7vLaj0fYrixjTlenSNQWSIdUfKUrrpKK
         JcSX+FoilVY8tY11IctF/Bz2Ahy10TEv4F46zLjhVYxckGvf/I2ZP1QZmatPpuF2EALZ
         UtJwErdsM/1HOfw5oMLLY8Ya+pj+XDaJAG9686ksTNltQb1+PPRrOCHHD4vyMCR/+iPL
         l6uyt4LvBtyscrpJ29Gyq7MaWoQSAMbPvKPAhTNllR7h43M4KdRmXqyRcfDI37abXqSg
         6xNbHHq8fzHkqWtgCcLK9b37l7UuDIkLXhZEbb58Jv2oXaCLp6i08oXK70OH9nScvrEP
         AK3w==
X-Forwarded-Encrypted: i=1; AJvYcCW/37/L+A0cvVKLbu9gLKrYCcBF6vRhtB56p2m2qxEgLMjt8nUiBqET5FVBKkg2WUwRhr6tB6kW+kE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG6YHiFykPPvJe9JJUHQZUp1MxUP/K6fpoEHb+v8B8OVe0Tlxp
	fXR+Nxru1H+tAfNb0Iaakyhrt9+OwshyeBbVE2LPNStE7dyajyZmcpa30MxlSOTCIpw=
X-Gm-Gg: ASbGnctFYSDQJGO/zTNKH+O5DCf5XKX6nnYqQcRa7YwbxyYl3xhH9KQ4Rhg0l++h9iS
	jN1Qod3oovOlBsH6YbtFpnMJGcjNyy8ZifFb8mLQ3n7QJ5RealZX7jP15C8r63FtNXpq3jRq3lz
	vmA+ahLuMLAYCI9MdiiwI3+XfTMU/vOPWawstEtk08sX5ZvPUulz+vl9wE43oKF+8UILI3ctasX
	POBo8oPfcQj+JznV9dGIRbIJD6TxuWVuShqolCQ8OY8zMjqr/uAVK/ty2kvw/T6Edw2Z+mgj1+b
	r+5WYUnxGdjG1OJMjbu+R6+cHo7dvVvfNR3uNo9XZIkoqx6tpeEmZKdHf8KQMU93GGiR8S4mIrR
	ZvlWa
X-Google-Smtp-Source: AGHT+IEHPxZf5K+6rB6h+G22ROpgqRBCwgyhaeWghhTRXeAPT0VUHYSFlG21O4cgJMdUdvOxbVQ28Q==
X-Received: by 2002:a05:6a00:3e17:b0:748:33f3:8da3 with SMTP id d2e1a72fcca58-74af6f2f9d7mr18261164b3a.19.1751260663025;
        Sun, 29 Jun 2025 22:17:43 -0700 (PDT)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af56e3ac1sm8021982b3a.145.2025.06.29.22.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 22:17:42 -0700 (PDT)
Date: Mon, 30 Jun 2025 10:47:28 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Anup Patel <apatel@ventanamicro.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Len Brown <lenb@kernel.org>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 14/23] ACPI: property: Add support for cells property
Message-ID: <aGId6M_0D0qERUu_@sunil-laptop>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
 <20250618121358.503781-15-apatel@ventanamicro.com>
 <aFka3y1494LIzyUA@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFka3y1494LIzyUA@smile.fi.intel.com>

On Mon, Jun 23, 2025 at 12:14:07PM +0300, Andy Shevchenko wrote:
> On Wed, Jun 18, 2025 at 05:43:49PM +0530, Anup Patel wrote:
> > From: Sunil V L <sunilvl@ventanamicro.com>
> > 
> > Currently, ACPI doesn't support cells property when
> > fwnode_property_get_reference_args() is called. ACPI always expects
> > the number of arguments to be passed. However, the above mentioned
> > call being a common interface for OF and ACPI, it is better to have
> > single calling convention which works for both. Hence, add support
> > for cells property on the reference device to get the number of
> > arguments dynamically.
> 
> ...
> 
> > +static unsigned int acpi_fwnode_get_args_count(const struct acpi_device *device,
> > +					       const char *nargs_prop)
> > +{
> > +	const union acpi_object *obj;
> 
> > +	if (!nargs_prop)
> > +		return 0;
> 
> This check is implied by the call. No need to duplicate.
> 
> > +	if (acpi_dev_get_property(device, nargs_prop, ACPI_TYPE_INTEGER, &obj))
> > +		return 0;
> > +
> > +	return obj->integer.value;
> > +}
> 
> ...
> 
> > +			if (nargs_prop)
> 
> Again, if you don't won't to reassign the existing value, it's better to have
> this data be collected in the temporary variable of the same semantics. Then
> you will choose one when it's needed, no need to have this dup check (again!).
> 
Okay. Let me update in the next version.

Thanks!
Sunil

