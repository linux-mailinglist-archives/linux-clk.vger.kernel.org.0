Return-Path: <linux-clk+bounces-137-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A65C7E8AAE
	for <lists+linux-clk@lfdr.de>; Sat, 11 Nov 2023 12:28:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82FC11C2093B
	for <lists+linux-clk@lfdr.de>; Sat, 11 Nov 2023 11:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0B2213AE6;
	Sat, 11 Nov 2023 11:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WrjuV6CY"
X-Original-To: linux-clk@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3557412B70;
	Sat, 11 Nov 2023 11:28:17 +0000 (UTC)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15E8B3862;
	Sat, 11 Nov 2023 03:28:16 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6c398717726so2649646b3a.2;
        Sat, 11 Nov 2023 03:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699702095; x=1700306895; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gvo63Ap3eCN7O+5c4nuw7iFnIW0OCrKiMm64henb2qA=;
        b=WrjuV6CYIEx4LWwLG4khXzG+qmubmHG9zheAg+KlNTC61dPWJIzZag0QygZ5NR6s1d
         QDXkkMnUxonNZHOftEEUr7+s39eI25Kk8yqpcRy9Iyfy0JpUYGNIDQJazjCsSWxCfdmp
         ESu5gO8a0BnOhL+wZngCViHfGiXld/P/Vvltrl7tbnpa0vo1WjkyGPAXqAufkgCIuUb1
         ZVtnuf/YK2c/aQ6e+32T2UGnFRJd96cx9e9hLk5DMDr8cAnTGDl9IatkJkjGIkBVMLZj
         5rYGcAAakOaiG85rH+UaxguHjgCz3qcjMvl+BgTpsmTy5qHllgDWiN/IuMZmaiwPbn0R
         nVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699702095; x=1700306895;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gvo63Ap3eCN7O+5c4nuw7iFnIW0OCrKiMm64henb2qA=;
        b=BGsPASy0nDYedxHilspunUxOty0NpBw4D6fpeA37CHRtgjAwelGbuznayjmfz7rWpq
         LoQOwo51OeFibeEwVMZgy0mffUJl6xygfDaxlrRMZm4BDHAqucpKTekGD25g66t6IKe8
         xx/k4Ala7FySYT5Jn+nhoaCOb0v8jV02Onjryv0g0AXllHVJI65gaQknFqmbGNouY22J
         2ybdCAutlaohtk1sSX/p7acsTt1ur8Kr1Ubs8bgXrKWIwfzQ63bQkCl0/XMGWBEBLO9O
         V6QvkyEq0U9+sF8abyvr5qMGdkQwXctijjAG3x3IpxyTZJzDi5L9MwW0Ax5LwTw3TYpM
         NoBA==
X-Gm-Message-State: AOJu0YwApQV9IDNOcVUmzo65i2DT+1drzIc1iT9/Hzz/2Ue87gMQYKu5
	vQ5Ns0e/HEH07N1SarOesQ0X7yCOIQtdZilcmmw=
X-Google-Smtp-Source: AGHT+IENPQo0bEs3lsJTUDUbui+ftHSAimNCdluqkm5kDIhjuu1++Xf6J2i55Ho8tyFnYGVZXqxe/xrksbMNWfKQ50Q=
X-Received: by 2002:a05:6a20:4426:b0:181:16c7:6cd0 with SMTP id
 ce38-20020a056a20442600b0018116c76cd0mr1449510pzb.17.1699702095344; Sat, 11
 Nov 2023 03:28:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231025104457.628109-1-robimarko@gmail.com> <20231025104457.628109-2-robimarko@gmail.com>
 <CAOX2RU4MBvDZZ767RPS9XKj0U2L3gviVG5cyR8NKyO4LD+sfYQ@mail.gmail.com>
 <20c8cfde-3f55-45c5-bc23-21979ac9680d@linaro.org> <CAOX2RU5-XFZhGzjigNtu-qFnPWDd2XkpGpY=HXWigRa5SXw4TA@mail.gmail.com>
 <ef377506-4132-4805-a76e-18f241afe319@linaro.org> <CAOX2RU4K67evm10giQvF1rcfqTfR+e--KQT3ZePoHQoqASv_fg@mail.gmail.com>
 <bdf6be0b-c137-48ce-8a3f-ab74bced6f87@linaro.org>
In-Reply-To: <bdf6be0b-c137-48ce-8a3f-ab74bced6f87@linaro.org>
From: Robert Marko <robimarko@gmail.com>
Date: Sat, 11 Nov 2023 12:28:04 +0100
Message-ID: <CAOX2RU4z1Dcs7ct0BAaS7wicYVmQEiSe74=w_grFDKQv22uoFg@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: qcom: ipq6018: add USB GDSCs
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, 
	Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Nov 2023 at 22:51, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 10/31/23 10:01, Robert Marko wrote:
> > On Mon, 30 Oct 2023 at 22:12, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> >>
> >> On 30.10.2023 21:37, Robert Marko wrote:
> >>> On Mon, 30 Oct 2023 at 20:37, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> >>>>
> >>>> On 29.10.2023 12:04, Robert Marko wrote:
> >>>>> On Wed, 25 Oct 2023 at 12:45, Robert Marko <robimarko@gmail.com> wrote:
> >>>>>>
> >>>>>> IPQ6018 has GDSC-s for each of the USB ports, so lets define them as such
> >>>>>> and drop the curent code that is de-asserting the USB GDSC-s as part of
> >>>>>> the GCC probe.
> >>>>>>
> >>>>>> Signed-off-by: Robert Marko <robimarko@gmail.com>
> >>>>>
> >>>>> Unfortunately, after testing on multiple devices I hit the same GDSC
> >>>>> issue I had a long time ago
> >>>>> that was the reason I did not send this upstream.
> >>>>> It seems that USB3 port GDSC (USB0 GDSC in code) works just fine,
> >>>>> however the USB2 one
> >>>>> (USB1 GDSC in code) it is stuck off and USB2 port will fail due to this:
> >>>>>      1.607531] ------------[ cut here ]------------
> >>>>> [    1.607559] usb1_gdsc status stuck at 'off'
> >>>>> [    1.607592] WARNING: CPU: 0 PID: 35 at gdsc_toggle_logic+0x16c/0x174
> >>>>> [    1.615120] Modules linked in:
> >>>> Can you dump GDSCR (the entire 32-bit register) at boot and when toggling?
> >>>
> >>> Sure, here it is:
> >>> [    0.023760] qcom,gcc-ipq6018 1800000.gcc: reg: 0x3e078 val: 0x8222004 init
> >>> [    0.023782] qcom,gcc-ipq6018 1800000.gcc: reg: 0x3f078 val: 0x8222004 init
> >>> [    0.988626] qcom,gcc-ipq6018 1800000.gcc: reg: 0x3f078 val:
> >>> 0x8282000 before toggle
> >>> [    1.202506] qcom,gcc-ipq6018 1800000.gcc: reg: 0x3f078 val:
> >>> 0x8282000 after toggle
> >>> [    1.207208] qcom,gcc-ipq6018 1800000.gcc: reg: 0x3e078 val:
> >>> 0xa0282000 before toggle
> >> Any chance
> >>
> >> .en_few_wait_val = 0x2
> >>
> >> (turning BIT(19) into BIT(17))
> >>
> >> will make a difference?
> >
> > Sadly, it makes no difference and GDSC status bit newer comes up which is
> > rather weird as USB0 one seems to work just fine.
> What if you add clk_ignore_unused?

To the USB1 master clock or?

There is definitively something broken regarding the GDSC as
GDSC_STATE bits (30-27)
change from 0 to something on the USB0 GDSC but on GDSC1 they are 0 even after
SW_OVERRIDE BIT(2) is set to 1, and the POWER BIT(31) newer changes to 1.

However, if you manually set BIT(2) to 1 then the USB1 master clock
can come up so
GDSC seems to work.
USB1 (The USB2.0 HS) port is still broken after this if USB mass storage is used
but that was present before the GDSC changes as well and I still need
to figure out
which quirk is missing for this.

Regards,
Robert

>
> Konrad

