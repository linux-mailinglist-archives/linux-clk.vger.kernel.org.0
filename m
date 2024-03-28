Return-Path: <linux-clk+bounces-4582-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F13EB87BF60
	for <lists+linux-clk@lfdr.de>; Thu, 14 Mar 2024 15:57:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 11BD0B22A38
	for <lists+linux-clk@lfdr.de>; Thu, 14 Mar 2024 14:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D22571732;
	Thu, 14 Mar 2024 14:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="I000Ktnl"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974C26F06E
	for <linux-clk@vger.kernel.org>; Thu, 14 Mar 2024 14:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710428220; cv=none; b=u9u8ClxHhPlCEDXYqTDY9/VBj9XPLvCu7RklDPoR6JuU+7TUhG1uX1B4UqtPDgc5i6R0AP2fHM2nN7DBk80NW5JAL1Q/Gkr3PKLD0QQSD6xg7Fwrvx9EBfe4M/Z+oMTb+RyXiUZobgAauefBYve0VaeeHCn+FbiYKGhyNyMdzGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710428220; c=relaxed/simple;
	bh=mEjE8q+E2HjRI9XzAhQ/CrCkar6G2FE6iHbSsPc+Gyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VStdCtd14Lh3xp5CG9MQXBdiq/r1nySiG6Ohs+lS+Ry/fGRolAEB0+DQoWTDVKlkgHqodR5wwNi0t3f0CXLXdfCMn9Ljjua1WKWEU9x4v0WLGr3vtkbg5bxpx8mZAcG3j9k86PyTSL9MN17BZoz1X3M1TvAA22xlUd6GDP0t3aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=I000Ktnl; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-690b24973beso16952496d6.0
        for <linux-clk@vger.kernel.org>; Thu, 14 Mar 2024 07:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710428216; x=1711033016; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lxoX+O1GlcPWe1RQwrLpQvGT+Ve/nhPsRMUh8z8RZIw=;
        b=I000KtnlC+WQPyt2sorMY+b4lwHBUhE//+e65JTuH3bh7+kKKHwHsplZctFU44KbvN
         MhwUpij8VB2qQ5pTUELjtdJKi9WCtnDIRRLs5jXRXPjM0nzB1NxvhrKybvOs1vITArdE
         /hbcQQyaoJFIglEtcD/4bHRGr78L1/6nxEXfuhv9FW25xuwLd/bY/R9OIFeQj2AvSU33
         QnKhDEm3gHxflRvyIhPJdBtH9yI3MZgPOd4EwqzSJ9qAym/C3xP+q53sTyO0PTAQ3xXd
         U8qkc3mya5+Bd869q3x3skwHmVujYfHbfECs9ABpBht/yg0Hc1aVEN+A2PRW2gNRbfMP
         Mwjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710428216; x=1711033016;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lxoX+O1GlcPWe1RQwrLpQvGT+Ve/nhPsRMUh8z8RZIw=;
        b=jGszJ1n6npxrInHUifh7LePrDMkJO+o70S6iNVrGVTPWzVibhxANv9sIYl6iA8z+Bc
         aUzPR2ob4NIJupmSMxlEcrqdChrNcWMgvkXxv8x3Z4TpAj5PKpa/7E5MhLUa8xHDfAfr
         +kzNxWLzcebhot6Dq0p6KPrayYXcgy7NNNYSDFhGd/o01/nbBdJOdpeRB2MdGXXbBwCK
         kX+2gKxjWTaHGrhCC3c1Wbpe7mBm+6xofe3F8OnlxS5+JndF6noypC0Z9zh9TozPFy4i
         w5TYYKSo90a1sdifrQa1cCP+lIUjHTpvpze9eVIWT4wVcsvAbFgjKkBueZeXVBxESzwb
         a7qA==
X-Forwarded-Encrypted: i=1; AJvYcCUTpEH8eVHRGS4TMTsJnOXjQv2HFjCMDBlPLheE2wKHJKdEeaG7YeLum2IX6+soFueikNMKPVV1LlwKeSMJ7a6SThUjAdcWufdt
X-Gm-Message-State: AOJu0Yy6a7TootbuEacCnlW54aNDDUnQznMsVddz7VYfR55b29EikoNh
	H3S/2JT8FsuNP451+XV3Jj4UnZ+b/wRxRij/R1t32wo1YEFJrK32VeTWQsj476g=
X-Google-Smtp-Source: AGHT+IFH2laVemU8OwQ32YK+QaEsKZgxeEvMnGkMRQp09IuyzZ5ZeOZGACdxlplPgoNSEue7cq6fGw==
X-Received: by 2002:ad4:4ea1:0:b0:68f:dde4:fb12 with SMTP id ed1-20020ad44ea1000000b0068fdde4fb12mr4915051qvb.9.1710428216556;
        Thu, 14 Mar 2024 07:56:56 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.8.192])
        by smtp.gmail.com with ESMTPSA id s12-20020a05622a018c00b0042f068d3d8asm871706qtw.43.2024.03.14.07.56.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 07:56:56 -0700 (PDT)
Message-ID: <42c3d591-abe5-4343-9a94-f1705430dcea@sifive.com>
Date: Thu, 14 Mar 2024 09:56:54 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: starfive: jh7100: Use provided clocks instead of
 hardcoded names
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Emil Renner Berthing <kernel@esmil.dk>, Hal Feng
 <hal.feng@starfivetech.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
References: <898aa0925a9598d44721d00145015b215434cb3b.1710414195.git.geert@linux-m68k.org>
 <695ebdde-3dc3-41b1-b20b-f02c4ba1ae5d@sifive.com>
 <CAMuHMdURtL1u-MDXBhiwOfX+zBnuunZYvjt+3GMOp6Y6pj1Efw@mail.gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <CAMuHMdURtL1u-MDXBhiwOfX+zBnuunZYvjt+3GMOp6Y6pj1Efw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Geert,

On 2024-03-14 9:48 AM, Geert Uytterhoeven wrote:
> On Thu, Mar 14, 2024 at 3:32 PM Samuel Holland
> <samuel.holland@sifive.com> wrote:
>> On 2024-03-14 6:05 AM, Geert Uytterhoeven wrote:
>>> The Starfive JH7100 clock driver does not use the DT "clocks" property
>>> to find its external input clocks, but instead relies on the names of
>>> the actual external clock providers.  This is fragile, and caused
>>> breakage when sanitizing clock names in DT.
>>>
>>> Fix this by obtaining the external input clocks through the DT "clocks"
>>> property, and using their clk_hw objects or corresponding name.
>>>
>>> Fixes: f03606470886 ("riscv: dts: starfive: replace underscores in node names")
>>> Fixes: 4210be668a09ee20 ("clk: starfive: Add JH7100 clock generator driver")
>>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> 
>>> --- a/drivers/clk/starfive/clk-starfive-jh7100.c
>>> +++ b/drivers/clk/starfive/clk-starfive-jh7100.c
> 
>>> @@ -298,13 +311,23 @@ static int __init clk_starfive_jh7100_probe(struct platform_device *pdev)
>>>       if (IS_ERR(priv->base))
>>>               return PTR_ERR(priv->base);
>>>
>>> +     for (idx = 0; idx < EXT_NUM_CLKS; idx++) {
>>> +             clk = devm_clk_get(&pdev->dev, jh7100_ext_clk[idx]);
>>> +             if (IS_ERR(clk))
>>> +                     return PTR_ERR(clk);
>>> +
>>> +             priv->ext[idx] = __clk_get_hw(clk);
>>> +     }
>>> +
>>> +     osc_sys = clk_hw_get_name(priv->ext[EXT_CLK_OSC_SYS]);
>>> +
>>>       priv->pll[0] = devm_clk_hw_register_fixed_factor(priv->dev, "pll0_out",
>>> -                                                      "osc_sys", 0, 40, 1);
>>> +                                                      osc_sys, 0, 40, 1);
>>>       if (IS_ERR(priv->pll[0]))
>>>               return PTR_ERR(priv->pll[0]);
>>>
>>>       priv->pll[1] = devm_clk_hw_register_fixed_factor(priv->dev, "pll1_out",
>>> -                                                      "osc_sys", 0, 64, 1);
>>> +                                                      osc_sys, 0, 64, 1);
>>
>> These should use devm_clk_hw_register_fixed_factor_parent_hw(). (Or you could
> 
> Thanks, I didn't know about that function!
> 
>> define a devm_clk_hw_register_fixed_factor_fw_name() and drop the other changes.)
> 
> Sorry, I don't understand what you mean here?

In the loop below, the parents are already referenced via .fw_name. That means
the string is the DT clock-names property value, not the Linux-internal clock
name (see clk_core_get()). These two function calls are the only ones that
depend on the internal clock name. If you change them to use .fw_name as well,
the clk_core_get() will do the right thing, and you don't need to manually call
devm_clk_get().

Regards,
Samuel


