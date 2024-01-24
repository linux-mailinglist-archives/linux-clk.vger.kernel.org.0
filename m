Return-Path: <linux-clk+bounces-2831-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF98683A9EF
	for <lists+linux-clk@lfdr.de>; Wed, 24 Jan 2024 13:36:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1181E1C20956
	for <lists+linux-clk@lfdr.de>; Wed, 24 Jan 2024 12:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4043277F00;
	Wed, 24 Jan 2024 12:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mixDwAe9"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C57063103
	for <linux-clk@vger.kernel.org>; Wed, 24 Jan 2024 12:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706099754; cv=none; b=BozWmosIZPQaxiKcsuFif7MvCljCvF3nZkSCdW6X9gIHS20mv44Qg+kcPLGAwvgNiw2mGLSmJ+0WAFP25Y3H0EXv2JL/sE6f3v3HdcmoV4pNO+zyOjEwj2OA+MM3W8ZU2AHGBhp51xZnWrVPEkVY4R3VboetJ+P3eS+nyd1Yc28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706099754; c=relaxed/simple;
	bh=pLgVD7WyIgCYs/WnD6GmQ3oHmu+7tZfoy04+P4DpDZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uIh/tq1bGXvuXHbW9A/d+pGGox7yUptiJEFxTy2knYcE7qm2HCZigrFYeaWw8Fb7TUZbrb96wJmp4m1BM1/3o6heJNGUF3PuJ7zEDold7VXRbVOipyylfXD98Oi6xgoZEYkBhsam2uJXfcYDzUU9ynfDPlvjK6HB/LOJKz9cY/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mixDwAe9; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5100cb64e7dso1483835e87.0
        for <linux-clk@vger.kernel.org>; Wed, 24 Jan 2024 04:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706099750; x=1706704550; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MTNcfdZ46DhDQS1PfdxwvcCFPFv6QbUHhAVtqKGltxk=;
        b=mixDwAe9HfZecm2AU9y0GLnrya598wpZ+qQbWRfZ8eYZ2Cyk4igjkNsa383L5fWMZg
         o0Na2rSWd9BEe2HYfoASbFAQM5cNtSQxX5FMgLjZzTYdSeFB9qQdWQIxg8rE32FpuJRw
         6nIAzT4aZ3Tot+yeWtEWD+6DoWNGq9QM7ES/IUlFmO0d6QjWVcnTFzr4gaa9KSyjX539
         cpLFf3NXdZkwjb1l0SN4JR7QqLTGHQtFGisiWg3BUQlGJytOnA2xKZn0brqB/MK6bYCj
         E1WrXIYOZNpNaKDktEg3vkbJxUZCeHfRocMungmJu14m0e2a0F7SSQxfLXeHNL52i6Ck
         fGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706099750; x=1706704550;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MTNcfdZ46DhDQS1PfdxwvcCFPFv6QbUHhAVtqKGltxk=;
        b=UeJhZrMm6amy09EuNyxJnoqJT56EZlui6Jwm737W0uKQAxQ4lFFIpVyQN2/8F3D901
         NBZ3UeavIDp18n+O8GkSG5E702TMvlDFwWYBuNCMSmSQuY1bwR1+AZgpiCpIViQ8fisz
         IvJaFkFj8TksRkTmGbX7UQ6TNJbzkPle21T9QI55zpj5z3qyxbbTwzZPRHIbCs+hc5eB
         2o+JJe+fw0Hx2xrkuS/fX1pf4KFeLEUPeJxtQEW1fBMNoWbyCazWsFz7L2ZeV1dQX6Z6
         ynKf8HI6cL/9KlmKeMkK8MOlJjFIyLFf2qJdRYIgi+ZMuj8gkAcsrXmhh9+/wSO5t9Z2
         S+rA==
X-Gm-Message-State: AOJu0YyPG6qWxiiRaoJkTNY0/6dRbI+5EorKb7U/AMs2aaiZjrvPjN7Q
	140tN0mWgmC7o7m2k8uzqFkkQ6kmFPrru5Gm5MHoiG448NefxdUGidQ8/Rv5Rio=
X-Google-Smtp-Source: AGHT+IEm7tXXCAhpWSFvaPOrGruncb0eF+DHMJ82djxJSAgDaATGdy90bGKiUrTnBBvihqISw7Xd7g==
X-Received: by 2002:ac2:558d:0:b0:50e:9a0d:d3fb with SMTP id v13-20020ac2558d000000b0050e9a0dd3fbmr1407083lfg.273.1706099750766;
        Wed, 24 Jan 2024 04:35:50 -0800 (PST)
Received: from [172.30.205.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id p26-20020a19f01a000000b005100ed58b76sm207756lfc.308.2024.01.24.04.35.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jan 2024 04:35:50 -0800 (PST)
Message-ID: <7d9d14ce-7db6-4796-98c9-60d1f72fff6a@linaro.org>
Date: Wed, 24 Jan 2024 13:35:49 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] arm64: defconfig: Enable MAX20411 regulator driver
Content-Language: en-US
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 Johan Hovold <johan+linaro@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240123-sa8295p-gpu-v3-0-d5b4474c8f33@quicinc.com>
 <20240123-sa8295p-gpu-v3-8-d5b4474c8f33@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240123-sa8295p-gpu-v3-8-d5b4474c8f33@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/24/24 05:25, Bjorn Andersson wrote:
> The Qualcomm SA8295P ADP board uses a max20411 to power the GPU
> subsystem.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

