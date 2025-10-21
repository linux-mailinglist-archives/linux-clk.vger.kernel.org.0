Return-Path: <linux-clk+bounces-29531-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2210BF5B12
	for <lists+linux-clk@lfdr.de>; Tue, 21 Oct 2025 12:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1125F1881C6C
	for <lists+linux-clk@lfdr.de>; Tue, 21 Oct 2025 10:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A724932AAD2;
	Tue, 21 Oct 2025 10:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="B+mjJcHi"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380DB32ABF7
	for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 10:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761041244; cv=none; b=GgqG7hCUtepQcxfWCLPzReWK5zAuCkqUNEx1wGDWFTegWGFmTzAIj9+QBzvEQ0jjwRSGx+USgQH5LFhwcJ12l+AyUhJtpa3YWw5FD0F6wX7Iyq47VgOcFMTI/ulMfPUCeEaZO2XGWbDeoriKXqPlH6YH61aDtncUZ9rq/U6JseY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761041244; c=relaxed/simple;
	bh=I7DyZLJ3Iazvqmr4I8bU5Hh7eNjCwiaf/bBPAW9IEME=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=rpuocl1+82YJOFhAHV4JeeltlNIIaMsnQlm1pM5qhmTfisVEVg7sHkA5D98uU8Pa7m6yKG9w2xf+KaM/g9r/yOdpSarTETAth5EyCtJRDG8HeGoxZfepOv0ZX4fn4wf0VAW0NmgG5vlCKWeY8AjT6pad/1yJLN529QGuJtybT08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=B+mjJcHi; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b3c2db014easo1187798166b.0
        for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 03:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761041240; x=1761646040; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2yIXunPpdaKXzgAWd57qmRrCbK+tiVclGWo7FE9d4Oc=;
        b=B+mjJcHijrZznk/hfz1dt+FEng4rTlPxkAf1NJHnD9Ryd49G9NMWn9uq10oR0+hD8U
         xFElMtYhaN9yUJmW892K3qXJxsNj0dmR7Vulbh54uhr4c2eLSAhJ4kIbyDEfE2IHxKaO
         HrBVFC6/LKXukQkrrqNyWvuueNVk09/HCwaD10Y+DHvyYejhm7Z4uR8j2R6/uRmqvUo8
         UceMT0d8ajZJL8dNHJ7lqT9F7d9Oa5SeZ3oU2T36vXlS5/lyc0vDKQzrIXj5K9Cb0NEF
         2ZJM0neFS+vWw1na52hT8WYwyYjdTbrsEULoVo4ULNOAGxwhSOy17y98iMwioJPjcdEs
         44LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761041240; x=1761646040;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2yIXunPpdaKXzgAWd57qmRrCbK+tiVclGWo7FE9d4Oc=;
        b=R5ZUV4NejR2tbhgxSHzvlM6zhbB+vw/hJcLPJbJwvCQeTaZMpcUBrL8r/d3Z0qYmM8
         W/uJ3g9T+TBn1owBTg8V6kgrloz9XY5gNOfLM7QPjps6e1DKUa2NuJce7QLbQlLXAQ9p
         QsC6zvr5KXmQl8SNPhJoWwZbX2A3O5iUb75Qxq5LpFMe1H0WHQOw4MfoaqO/UgjpHH2q
         PEaS1pNvARs4r/sHnrLQbZSKbA0WR3rlGvB/PTvw6SA6gR4k6YwoJO5D826r7aN7AQrS
         CiUOs7MUUFGmhzVO2yqJKlKuKidGNizAXAbgxg20wmh/pNhqoN3yj1fLZv+MaFjwGMm3
         N30A==
X-Forwarded-Encrypted: i=1; AJvYcCUI5XmJS0nZ9lZuGkkVbtpDFhEiPa23EKV5PhbuX6G52+iD5YqwW3mBkf0WqnjzbO71r4BsRyzmDmY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGwrMn82NKnPWbDdzkj8Xnj/vwmt/7ZMamo/V8COZ+SeZPZgeI
	n5qxftvjLVzpsGLq/0LysJ6pwFLaD9vKAZ2E2UTLiE2bOEgmEPoGQnTjcAO3zSY8/9U=
X-Gm-Gg: ASbGncuOCu0wWkBFUouB27ygHBWm6/Am9/HTLLoYRpVz7Moqmgj1KXoeASjH12lz6An
	aN39eGFWrHNln81A1IhvZ831BMrIVnffPdfhQS0ik48a5I4hTvAgdciiXoxTq90dumXLzWBV1qt
	SCOAOoOkDPZZ54Ac29BJ6cNJpQxdeNHMkD1ZVtRGl5gPjO7vD3yjOA94Yld/CxZlyfsJUlYD4vu
	o+nHnVeyxUsHXnqa70cIlWwbFfUHTLQIaHQPqrtPDyi70jdX4bOTv7/my/HkX39oUzQB0nkd4j3
	RulyS0a7CjURsTl0kvZbdwvBPT+Z/pHdZvFrD3wt5D1iKPlolpoonHzc5v4rKDxX9eFV3v3iLvC
	5rHnaEAgPiqGhmocUJ1FCaeNilWttahhDGbuIrVus0ddN3px+EvvQp13O+EHZuEWjuj8g3m5OfM
	pOuItSoZILY75E+m3o6DjIS6VSwwECBQwvV8XwfmQK++gy2jOjc6sMx8+X/xgiUWwtGr4AZhobF
	VM6QJSJwdWcn+w=
X-Google-Smtp-Source: AGHT+IGT5O0EwwTgQI5biVWMTarEM6XRRzXUYCaml46RmNq5/SgxDGRQZI+WycdQafTWSW008s1Q0w==
X-Received: by 2002:a17:907:86a2:b0:b41:1657:2b15 with SMTP id a640c23a62f3a-b6472b5ed07mr1694075266b.6.1761041240395;
        Tue, 21 Oct 2025 03:07:20 -0700 (PDT)
Received: from localhost (2001-1c00-3b8a-ea00-4b34-6694-d9bd-5210.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b8a:ea00:4b34:6694:d9bd:5210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb035bafsm1045122866b.42.2025.10.21.03.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 03:07:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Oct 2025 12:07:19 +0200
Message-Id: <DDNX0OY5X26T.1K2YOKTW49RDP@fairphone.com>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss" <luca.weiss@fairphone.com>,
 "Taniya Das" <taniya.das@oss.qualcomm.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Vladimir Zapolskiy"
 <vladimir.zapolskiy@linaro.org>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Jagadeesh
 Kona" <quic_jkona@quicinc.com>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8550: Additionally manage MXC
 power domain in camcc
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
 <20250303225521.1780611-3-vladimir.zapolskiy@linaro.org>
 <dbxvzgqs5slrl5edqunal3wplg5jiszqv46dr4nzgowwlhkhxa@qwtfq7nfjwfo>
 <3210a484-b9c3-4399-bee1-9f5bbc90034c@linaro.org>
 <CAA8EJprP9Z181VDCT=xfyrBipzgiB0tfb8M_XZ4H=yOrvEnB0w@mail.gmail.com>
 <f41061a2-cf45-4588-8df7-22270c936ee2@quicinc.com>
 <D8EZ47Z557OX.37FDVYA5AHET0@fairphone.com>
 <d64c0776-0b12-42d3-aed3-4e6a13487f51@quicinc.com>
 <DDKNL43NWFMA.1S03T0SUYFVMY@fairphone.com>
 <85bf3468-24bf-4f14-afcd-28878ad84dc9@oss.qualcomm.com>
 <a3943a95-b232-4534-bd70-6d1bd405c4bd@linaro.org>
In-Reply-To: <a3943a95-b232-4534-bd70-6d1bd405c4bd@linaro.org>

On Mon Oct 20, 2025 at 3:00 PM CEST, Bryan O'Donoghue wrote:
> On 20/10/2025 13:21, Konrad Dybcio wrote:
>> On 10/17/25 4:05 PM, Luca Weiss wrote:
>>> Hi Taniya,
>>>
>>> On Thu Mar 13, 2025 at 12:57 PM CET, Taniya Das wrote:
>>>>
>>>>
>>>> On 3/13/2025 1:22 PM, Luca Weiss wrote:
>>>>> Hi Taniya,
>>>>>
>>>>> On Thu Mar 13, 2025 at 5:39 AM CET, Taniya Das wrote:
>>>>>>
>>>>>>
>>>>>> On 3/4/2025 2:10 PM, Dmitry Baryshkov wrote:
>>>>>>> On Tue, 4 Mar 2025 at 09:37, Vladimir Zapolskiy
>>>>>>> <vladimir.zapolskiy@linaro.org> wrote:
>>>>>>>>
>>>>>>>> On 3/4/25 01:53, Dmitry Baryshkov wrote:
>>>>>>>>> On Tue, Mar 04, 2025 at 12:55:21AM +0200, Vladimir Zapolskiy wrot=
e:
>>>>>>>>>> SM8550 Camera Clock Controller shall enable both MXC and MMCX po=
wer
>>>>>>>>>> domains.
>>>>>>>>>
>>>>>>>>> Are those really required to access the registers of the cammcc? =
Or is
>>>>>>>>> one of those (MXC?) required to setup PLLs? Also, is this applica=
ble
>>>>>>>>> only to sm8550 or to other similar clock controllers?
>>>>>>>>
>>>>>>>> Due to the described problem I experience a fatal CPU stall on SM8=
550-QRD,
>>>>>>>> not on any SM8450 or SM8650 powered board for instance, however it=
 does
>>>>>>>> not exclude an option that the problem has to be fixed for other c=
lock
>>>>>>>> controllers, but it's Qualcomm to confirm any other touched platfo=
rms,
>>>>>>>
>>>>>>> Please work with Taniya to identify used power domains.
>>>>>>>
>>>>>>
>>>>>> CAMCC requires both MMCX and MXC to be functional.
>>>>>
>>>>> Could you check whether any clock controllers on SM6350/SM7225 (Bitra=
)
>>>>> need multiple power domains, or in general which clock controller use=
s
>>>>> which power domain.
>>>>>
>>>>> That SoC has camcc, dispcc, gcc, gpucc, npucc and videocc.
>>>>>
>>>>> That'd be highly appreciated since I've been hitting weird issues the=
re
>>>>> that could be explained by some missing power domains.
>>>>>
>>>>
>>>> Hi Luca,
>>>>
>>>> The targets you mentioned does not have any have multiple rail
>>>> dependency, but could you share the weird issues with respect to clock
>>>> controller I can take a look.
>>>
>>> Coming back to this, I've taken a shot at camera on SM6350 (Fairphone 4=
)
>>> again, but again hitting some clock issues.
>>>
>>> For reference, I am testing with following change:
>>> https://lore.kernel.org/linux-arm-msm/20250911011218.861322-3-vladimir.=
zapolskiy@linaro.org/
>>>
>>> Trying to enable CAMCC_MCLK1_CLK - wired up to the IMX576 camera sensor
>>> on this phone - results in following error.
>>>
>>> [    3.140232] ------------[ cut here ]------------
>>> [    3.141264] camcc_mclk1_clk status stuck at 'off'
>>> [    3.141276] WARNING: CPU: 6 PID: 12 at drivers/clk/qcom/clk-branch.c=
:87 clk_branch_toggle+0x170/0x190
>>>
>>> Checking the driver against downstream driver, it looks like the RCGs
>>> should be using clk_rcg2_shared_ops because of enable_safe_config in
>>> downstream, but changing that doesn't really improve the situation, but
>>> it does change the error message to this:
>>>
>>> [    2.933254] ------------[ cut here ]------------
>>> [    2.933961] camcc_mclk1_clk_src: rcg didn't update its configuration=
.
>>> [    2.933970] WARNING: CPU: 7 PID: 12 at drivers/clk/qcom/clk-rcg2.c:1=
36 update_config+0xd4/0xe4
>>>
>>> I've also noticed that some camcc drivers take in GCC_CAMERA_AHB_CLK as
>>> iface clk, could something like this be missing on sm6350?
>>>
>>> I'd appreciate any help or tips for resolving this.
>>=20
>> Is CAMCC_PLL2 online?
>>=20
>> Konrad
>
> Usually if you can't switch on a clock its because a power-domain is off=
=20
> or a GDSC is off.
>
> I'd guess one of the power-domains is missing.
>
> Looks...
>
> @Luca Is this actually right ?
>
> camcc: clock-controller@ad00000 {
>           compatible =3D "qcom,sm6350-camcc";
>           reg =3D <0x0 0x0ad00000 0x0 0x16000>;
>           clocks =3D <&rpmhcc RPMH_CXO_CLK>;
>           #clock-cells =3D <1>;
>           #reset-cells =3D <1>;
>           #power-domain-cells =3D <1>;
> };
>
> Isn't this clock controller missing at least one power-domain ?
>
> camcc: clock-controller@ad00000 {
>           compatible =3D "qcom,sm6350-camcc";
>           reg =3D <0x0 0x0ad00000 0x0 0x16000>;
>           clocks =3D <&rpmhcc RPMH_CXO_CLK>;
> +        power-domains =3D <&rpmhpd SM6350_CX>;
>           #clock-cells =3D <1>;
>           #reset-cells =3D <1>;
>           #power-domain-cells =3D <1>;
> };
>
> Hmm but CX should already be on realistically..

Downstream does reference both CX and MX in the camcc-lagoon.c driver

static DEFINE_VDD_REGULATORS(vdd_cx, VDD_NUM, 1, vdd_corner);
static DEFINE_VDD_REGULATORS(vdd_mx, VDD_NUM, 1, vdd_corner);

I'd expect both to be enabled at boot though, CX and MX is at least both
used for display (which is already on from bootloader).

Also adding "power-domains =3D <&rpmhpd SM6350_MX>;" to camcc
unsurprisingly doesn't change anything.

Regards
Luca

>
> ---
> bod


