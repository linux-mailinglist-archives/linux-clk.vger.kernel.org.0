Return-Path: <linux-clk+bounces-7558-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EDD8D610B
	for <lists+linux-clk@lfdr.de>; Fri, 31 May 2024 13:56:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F1472843FA
	for <lists+linux-clk@lfdr.de>; Fri, 31 May 2024 11:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39E6D157E93;
	Fri, 31 May 2024 11:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w4BCKKTE"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4D614B084
	for <linux-clk@vger.kernel.org>; Fri, 31 May 2024 11:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717156555; cv=none; b=lF07e+G/ksjwMS7PQgQUsqNlh10gEdWp9dsrlB+/zrh+ZX4DACsB5enrDe+bImPORWoHaQ9xVyMUvTqP/+lfOoOJA+rJISKkZm4szZIKvDN4OyUHUdSgxitEyQAo0X8QowRMY77L1iLgKivp/aHRXIMm9KrbeGl4VPX+fJlvaX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717156555; c=relaxed/simple;
	bh=MTwwBV2T5cVxGloQBIIu8tZJst21kS52eDYdXv08W78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qWv8hg+iKAB4xsKLQRNafwZ7pPvxC8cYh7krqpPHVIT8LpHYmQH0OBFjPy0ebFfCxpHFyrbG0Sv2I8JR2b2nSsOvgq3Uj7g37522RYDuLgN/LzeCh49dgsgNHKFCNMrdRn50AkKwq6/nestlIHVpe81DDsoLZDXloELix3btSgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w4BCKKTE; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-57a2406f951so1860416a12.1
        for <linux-clk@vger.kernel.org>; Fri, 31 May 2024 04:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717156552; x=1717761352; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MTwwBV2T5cVxGloQBIIu8tZJst21kS52eDYdXv08W78=;
        b=w4BCKKTEIFROBX2zBoqFw+WPVN30ZB9yETNZPQOSsREam0/dTsQY6rdUQv3nwDa8jx
         dKEjhNI5BAW2YUjnxe3P7K5nSDMccjZZqTvpx4+HH+eWY5lqlblOO4FRGrLwu7BXI/lc
         PWmupmDmHCNs5bboA1qeyOKnywLvrgtDsijXRFwvhr5eEkcUCidbx4erivA1+dRm70Bq
         Lxo2uJ6IkFvuLuuIDG/kEH74Lf+jGidO25T06RZotjem2OIsie1SLIwJBvyZssRQTWB7
         wKr+PCB7kgea1Olvsk9pX3sH//tqJ21kNaVnUrgBJcUEp/THaBE8eunt1rMsWZ63NObi
         pJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717156552; x=1717761352;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MTwwBV2T5cVxGloQBIIu8tZJst21kS52eDYdXv08W78=;
        b=uSf9KNVw/iztUC+3FwFEUmPzheCp0Kq16hhsmIAD3Cy9dUnAOuvyVheN4+zkrp/6Ih
         SK87Ry4T2PTcX6ikkUbOb44WDeL8uxeU5cIZfHAN+ofhnJbGKafhMpKHjP7mlbKDLfNu
         TXzvTEITsCrQ3nuRoTdXlyhGYglakNAAZGx+QeZLlANkPr9HFfxLgcjVH8KFWUAhQhJF
         LNgFYLFcHcHiMZqC2CMMm7GTXlkrWNcySehQ7xal9HqB7AiNvxoeilQD97zpQtfBb14j
         HrP7Xtyd0eWIcM9X6tV9jVq0lLbxI2rcX+SbGW9xzAMQW/fwz+/33a1b5DcavGywyrgP
         sm1A==
X-Forwarded-Encrypted: i=1; AJvYcCUfdBKO9YQeiED+TsPjNmK7vp10MR7julsukx4m/pY2sLfG70G2/WCzqnbWDGS7HMIMtQ3F1EEAI8e4Sa06U5zYKFVaVUZzN9SI
X-Gm-Message-State: AOJu0YxHkEFIvhd5Pd8MKjbOr+tPlNlyR1zLJmypP/mKRyCdggH0G/BA
	FEhIMEBYf7Q43MKCoZ4kH72+dNv2cr9m3j+ft/qzYyVtgdRGpi+G9gxd0vSAKJM=
X-Google-Smtp-Source: AGHT+IHocPLIN+ojTku/nwSK4uiv5CIu5ToaTHs7R9ZMZ7XNlrQDXD32rVzSuLvxytyaUDULDp4eWA==
X-Received: by 2002:a50:aa93:0:b0:57a:2537:a730 with SMTP id 4fb4d7f45d1cf-57a36382342mr1270321a12.4.1717156551670;
        Fri, 31 May 2024 04:55:51 -0700 (PDT)
Received: from [192.168.128.139] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31c6d4absm914236a12.72.2024.05.31.04.55.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 04:55:51 -0700 (PDT)
Message-ID: <7fb5511e-e20b-47dd-8cc3-fb2975db7c63@linaro.org>
Date: Fri, 31 May 2024 13:55:49 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Fix halt_check for all 3 USB PHY
 pipe clocks
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rajendra Nayak <quic_rjendra@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240530-x1e80100-clk-gcc-fix-halt-check-for-usb-phy-pipe-clks-v1-1-16c6f4dccbd5@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240530-x1e80100-clk-gcc-fix-halt-check-for-usb-phy-pipe-clks-v1-1-16c6f4dccbd5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.05.2024 6:48 PM, Abel Vesa wrote:
> Since the pipe clocks are fed by the QMP PHYs, they are not under the
> GCC control, therefore the halt bit might not get. This will lead to
> the clock driver reporting the clock as stuck, but that is inaccurate.
> So instead of waiting for the halt bit to get set, just use the
> HALT_DELAY flag.

I can see this being a good fix, however the commit message could use
some massaging.

The issue you're facing is that you can't toggle these branch clocks before
the QMPPHY has been fully initialized (as that initialization sequence
contains, among other things, setting up the internal PLL). We're doing the
HALT_SKIP thing to hack away the complexity of coming back to this. In a
perfect world, we'd "defer" the toggle requests and all code that makes
these, but it sounds overly complex for what it is. So in essence, the
clock could really be stuck.

And FWIW, you missed gcc_usb3_mp_phy_pipe_[01]_clk, and these are orphans
which could use some fixing up as well.

Konrad

