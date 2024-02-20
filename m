Return-Path: <linux-clk+bounces-3839-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C037F85B9EB
	for <lists+linux-clk@lfdr.de>; Tue, 20 Feb 2024 12:07:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 607CA1F23FCB
	for <lists+linux-clk@lfdr.de>; Tue, 20 Feb 2024 11:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58B5365BCC;
	Tue, 20 Feb 2024 11:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H1nvO3mV"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7491629FD
	for <linux-clk@vger.kernel.org>; Tue, 20 Feb 2024 11:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708427274; cv=none; b=B9M08bmqYBjrgVrVh5sGhurTDm7Um2u19DfaCF9EL8rnA30C7tHQ5Ju9N/5aQPQNsPpp5JpARtBhmosDLIRBxE54IBH69SlO/rW2GiKktNlF0sThAJg4RQZ1Ic1pDtoYw3qwPRUiglSbbjJKYH4if6vbY1P7gnq2M67OD7Z06EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708427274; c=relaxed/simple;
	bh=w+U78aAyr+GxLW8D6Pd4rXTRFQHzOfhZ7xorOcFz4pw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hx1RxwGbuOhMBar6MlzgjYRPLmj583pi08lSr+S74IMqWkZiS6P/NW4i6M0PooZ3gLHo3ObR2zKAk2tO7C+OL0ghs3i0ra4dzu5929QN90ljHocm7AZvR7aT6RSqbvAUT4ix4ncVbjOcSNL4FouYi5t67YitjcG0IRzzYLtzSJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H1nvO3mV; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3bbbc6b4ed1so4000730b6e.2
        for <linux-clk@vger.kernel.org>; Tue, 20 Feb 2024 03:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708427272; x=1709032072; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aCwrWqu6dmY4jhGhU4hmRfiLZPbuUs4daaHXgDNL3Sg=;
        b=H1nvO3mVqdTjd77k7zdNjtisptU1X8DlWKRRyiTf/gXMhE+3gaWqaV6wlpFCgD8uBr
         N7jT2pLth8OLRFhXw1JTxccS3spNkS9yBsS39ycASl8kyBDBEbO83u7eok4l7JSlZovd
         XuE7vLvM94vwtPVGRo6LXH763ReMfGo1eVWiyu20X3GCwJLOnkoFjckp9eFnd9rUmmAE
         K7MUHPldoySkujj9ROu53wSsFKalcloxEtxLf+VQf9Xd5r3VzAa1jE+wW3YyK4HfAYzy
         Vk4/asc+y5OxoCyE5Py8xTIXe2vxIWFcFohQHS6cZny2HIwZJJG4157AJmi+TWKd+qw8
         9OEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708427272; x=1709032072;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aCwrWqu6dmY4jhGhU4hmRfiLZPbuUs4daaHXgDNL3Sg=;
        b=a+NmYtVBZAG5e4/4YtFpC1BOl9sMLnUyrbLwbf/JU4yKaJKCJNqpCQvfCT1HGSn/PG
         /Er1cIDhLHA/Mf8Zr6B6FWWWglML2XR3Hc0+4++QO+4Iud2BqzXP3A2Ok+FRYvx0yLGl
         0s8DfLVLmmaUFmAWDpKSgjuPwz5O0Hm10S1LX9VETdRyszym+Ukajk27Yli2kkQ3X45c
         Ca5LBrUtg/ImfypkoPeWtTwoMt+OzkuxyF0pWVCQBRR8VHWYqJtXK7RkokGjEMlbJgeP
         U41SpsJq9++Ki4/l0I/Das+BcJiv9FJY0HBKI49hSAWH5Pk45YWafgeUvc1ebzfDitlZ
         6N/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvYIjfi5l5E0m7vJ2BrXI0ZduLIs6S6TdWPU29ViBhC/n2lxqjeOYytLvQB94y08+7R8UOn6fRDeI1sslX9Attr9K5plz2BIvb
X-Gm-Message-State: AOJu0Yw/QP/xxpeYDk9EOUkjukldZAyemZ5p8XDGfNRdLNG16NPGntf9
	Mrm269pvrLFggxre1Cx/WyQYf+FlCIct5M1f0zmVE/7DuRfvDkG1/eOH8p+soDs=
X-Google-Smtp-Source: AGHT+IFATL7bdlm1sDTq5XkZ+Qc3YWK3WmDDH2tmoEi3d8w8TNZhPEB6lvsWp3xemkp4HPSbSm2RJQ==
X-Received: by 2002:a05:6808:1597:b0:3c1:5f2c:bba2 with SMTP id t23-20020a056808159700b003c15f2cbba2mr4282514oiw.26.1708427271945;
        Tue, 20 Feb 2024 03:07:51 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id v15-20020a056808004f00b003c15ac41417sm615011oic.39.2024.02.20.03.07.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 03:07:51 -0800 (PST)
Message-ID: <29090d97-9118-4765-a4fd-3bbe271a39bd@linaro.org>
Date: Tue, 20 Feb 2024 12:07:46 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/16] clk: samsung: Add CPU clocks for Exynos850
Content-Language: en-US
To: Sam Protsenko <semen.protsenko@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240216223245.12273-1-semen.protsenko@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240216223245.12273-1-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/02/2024 23:32, Sam Protsenko wrote:
> The series implements CPU clock support for Exynos850, adds CPU CMUs to
> the clock driver and enables those in dts. This is the first step
> towards cpufreq implementation.
> 
> The breakup by patch:
> 
>   * Patch 01: Add bindings
>   * Patches 02..12: Prepare clk-cpu.c for Exynos850 support
>   * Patch 13: Add Exynos850 support
>   * Patch 14: Init PLLs to be in manual mode
>   * Patch 15: Add CPU CMUs in Exynos850 clock driver
>   * Patch 16: Add CPU CMUs and clocks in Exynos850 dtsi

This crossed the threshold for a patch bomb, which is in general fine
for me, but then please put v2 changelog in each patch's changelog. If
the patch did not change, annotate it as well. It's not possible to keep
jumping between cover letter and individual patches.

Best regards,
Krzysztof


