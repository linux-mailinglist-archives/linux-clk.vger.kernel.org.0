Return-Path: <linux-clk+bounces-23343-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 963B4AE340D
	for <lists+linux-clk@lfdr.de>; Mon, 23 Jun 2025 05:46:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C5D6189142C
	for <lists+linux-clk@lfdr.de>; Mon, 23 Jun 2025 03:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 257E68F58;
	Mon, 23 Jun 2025 03:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="pmbsGm+5"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408532FB2
	for <linux-clk@vger.kernel.org>; Mon, 23 Jun 2025 03:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750650374; cv=none; b=fBNtClDCJSIlh2Y2mB1UNVaqzJ7ux8G4+f7uIFhHj/sYIB98TmZOBivL+KQjy1KioIePh4lopLtst/+e+3/gQE568l0/2x4r+nBH+UrjRmoMuLlypF7e45QLYuTyE+iCARSa+XTME2TuV4gYW40+EA8ZMTc+Gvi7RqekwUe5lyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750650374; c=relaxed/simple;
	bh=ulYSEjpBN4splYt8fIcoHLxT6OWXfZLBf4RXhizV6pE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gsQEiwaBZEKXYhB/3GmS65JOT6ICbRq0EPqpREgOagH7cLQbhBrSy/m1JcF+pJhFvjPf6FwY045/cbYvwt7EULJJ/6ywzXngcFhhbOYCa19f9dAicMseQn879wosNOzklFgwRWY9V0Mr4CAf13vQQ3tdIHa02t0P9Id4rNBj8Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=pmbsGm+5; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553b9eb2299so4089227e87.0
        for <linux-clk@vger.kernel.org>; Sun, 22 Jun 2025 20:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750650370; x=1751255170; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EoqSulrN5L9yXszHfbntSe8zEg3j5zVN4faitdl+3Ao=;
        b=pmbsGm+5EDKCMB0NOkVIKYZ90Moz/WeMWBRFQ8epbUTMutcCmczOlynsB0LAtursOT
         ZDsOUSwJfFNpGX6g9tOP52P5onv2jKDLiGUJGMz7NMbJvl/ZbwxAcUMTGJRWVBaA6QmL
         tFNFa/XjEAzLprvpgTFHcvct6sJwJMNJfHciEJYzD3FDlosx+/JO5EFZKTHDNYvzpuhN
         gkePAtcZZlFbem9Czuc21COJcLOTPKhocTmCSyWYS27GC2e9HOWMUqSzv6jZCIk53DCo
         RcVqvxNwq+TU0RrUFMy3+Bc/sK+GrUXGiHqOU7CgJ6CQlpB+vY2eGa2yumGGxq0qoYCD
         ztlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750650370; x=1751255170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EoqSulrN5L9yXszHfbntSe8zEg3j5zVN4faitdl+3Ao=;
        b=I6ZdSEwmpqK4wC0MrjZTXQY2MnkWq9Nsb7ykAbpTqRUlLQm0VhlNsDrNCY1LVWZ1mY
         pzJfjhDzkg5zeQ/sYCI+bzMSyovKQkep1rWtn6ff9qlS6kfcQ7BnEdUSX3odImWh3jXZ
         oqjVfeh3c40efa8O6ALqD9/B8lA/H8+WqHJFfVscdJAqBZ2m0E3MFVZV8ELZNzYu15sj
         LgEWvuyttfWXTv5oTHbxpKmvF/sWT55pKYzLLy0MDoYCMy5lV54X4p+OOd3f6cSg0Hn+
         vxYbYG1i/qaukbRXHJImPBuAsisYHA3UlZB1TuOYOm63in7+ztvHqfDGesV+qRRkwspL
         AWMw==
X-Forwarded-Encrypted: i=1; AJvYcCVOyMnj9pE8lbw38Xh69gBtPRd/E6VwcHYeCQ+tS9zWC4OrRzG1Uqv4/3/qM6QrIQjBbptVXS8BeTI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwD4q1FQ7+CrhIXX5Fj7DfVu2nQgfEmJgeqDR+oxrGEJ8MTCMaz
	CQN0F86pZDrd3GLLyxIsl/U4UExc0VEChlR6BL0I7Re1J3/OO/10GfYSXZ8q4/SEmcAkZet3fVD
	6gxJ3B/9qMms5f7wW/JCqxuELpZhF0/KITIX5Yrd+Ew==
X-Gm-Gg: ASbGncsKSic9M1vdWT/O63ixLuccAmqvhEa1AONIc0JVgxkTNq0PhRdX3VFDenHxx8f
	8LJDJ0ZwTGiXvKfwC0N7xAgVE8dA74LW/A5+W4lt5t90ybzqT0rJXsfeMcE2W6bbfxN24nNBNJW
	jcfFuZZOFSxNw7Mzmjz0ujysM4G4WRqdTZSshptRKufc9/E/yFJIC2AA==
X-Google-Smtp-Source: AGHT+IE0Jkesv6pAtTAvnI4YAZPll7TdweNoY+w50jD3bpHSeBhHHCGGisCxbc8QIYILMjmd8O72zuctCezkc0bAqvQ=
X-Received: by 2002:a05:6512:a8e:b0:552:21b9:8bae with SMTP id
 2adb3069b0e04-553e4fe12c4mr3138959e87.7.1750650370384; Sun, 22 Jun 2025
 20:46:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618121358.503781-1-apatel@ventanamicro.com>
 <20250618121358.503781-8-apatel@ventanamicro.com> <175053960304.4372.5933123695583752824@lazor>
In-Reply-To: <175053960304.4372.5933123695583752824@lazor>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 23 Jun 2025 09:15:59 +0530
X-Gm-Features: AX0GCFvKul9rLlA0ewcROor8dZBLyfCt2SyRm-GbcQtvCrJAULk_IJwmPLxWSvQ
Message-ID: <CAK9=C2WutH5+3eNvMpD89WhXdNaJAJVz=h5r6c_Jc39nBx9NEw@mail.gmail.com>
Subject: Re: [PATCH v6 07/23] dt-bindings: clock: Add RPMI clock service
 message proxy bindings
To: Stephen Boyd <sboyd@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>, 
	Rahul Pathak <rpathak@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 22, 2025 at 2:30=E2=80=AFAM Stephen Boyd <sboyd@kernel.org> wro=
te:
>
> Quoting Anup Patel (2025-06-18 05:13:42)
> > diff --git a/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-cl=
ock.yaml b/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.ya=
ml
> > new file mode 100644
> > index 000000000000..70ffc88d0110
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yam=
l
> > @@ -0,0 +1,64 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/riscv,rpmi-mpxy-clock.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> [...]
> > +
> > +examples:
> > +  - |
> > +    clock-controller {
> > +        compatible =3D "riscv,rpmi-mpxy-clock";
> > +        mboxes =3D <&rpmi_shmem_mbox 0x8>;
> > +        riscv,sbi-mpxy-channel-id =3D <0x1000>;
>
> Why aren't there any #clock-cells in this clock controller node?

This binding is intended for M-mode firmware (OpenSBI) and not
for S-mode OS (Linux) where the firmware will use this binding to
probe a message proxy driver which in-turn will allows the Linux
RPMI clock driver to access RPMI clocks via SBI calls.

Regards,
Anup

