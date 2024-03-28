Return-Path: <linux-clk+bounces-4890-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5CC88732C
	for <lists+linux-clk@lfdr.de>; Fri, 22 Mar 2024 19:31:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C864B24706
	for <lists+linux-clk@lfdr.de>; Fri, 22 Mar 2024 18:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A614D67C52;
	Fri, 22 Mar 2024 18:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bpjpb3Bh"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E2E664D6
	for <linux-clk@vger.kernel.org>; Fri, 22 Mar 2024 18:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711132283; cv=none; b=ResTBkVw1cpJCkwHAqtghzksR/qt7i03fgB9o7Jb5hUMwp1OMc7udDbj6WGxBWvMlrTStaer0f3uE2bCRxgFH54wOufzuvJzMMMW9H5drmfIzAus82jSuoN2tZpDeKwG04SFsYnvcOgMYnwqr4EgKPjl3FDw7WNQyGjJwCv1uok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711132283; c=relaxed/simple;
	bh=OfI+oHjE9rUKzFb07eVefp1yp9j5dONH7Mr311yeSmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RiGE9BTZRilv2x9CRZL3fx/d5TL/RNal/rN8IThYiTwHSjXaXVI5LIbnEgVMn4S27bli4/auOg49B/frYW0r4B0IfMVBAtHkYSClJvIhhR2CYKVXXrCrm1FtI7kKkYyi6eKjfzBp5CUtZ7pq4BPxPtJPYnJp2lzyYiX5VybCl70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bpjpb3Bh; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a4715d4c2cbso289396466b.1
        for <linux-clk@vger.kernel.org>; Fri, 22 Mar 2024 11:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711132280; x=1711737080; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vbXGMFum/bc9Q5xBJXwJXkTK07xU0LwMz7UoxPP6Z0E=;
        b=Bpjpb3BhadmiKyUyfjBhUkYwCZWoEXIZcsKYuRVJKgG2YcqpUb/zr5lfd9J3qWoVzx
         sfAPlhX3Rct47m5YNodF9OWTxpiB5DNlCdoq4MbmCqyM7Lv8uw/gIWeAS/OG6iozrPFo
         72TtQtVDlX9QQIAZMFWEc1EtPkdP5c7H/ba8FipTXxNlcRBzFM2uihrLWeWZPz0dxjcA
         9ltWQ36Dyky12YKj+hEZiYUWMizMPdzvEq73UhK0QbZNsDGmzxPZ3NfsrrEZYKSbLjbE
         9JeeCJGLBtt/FaoXISEyC9YOcB56hYNRVqSGnpPXFfkeLyN4D034vpSWg6WMzZGmr6ra
         /LoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711132280; x=1711737080;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vbXGMFum/bc9Q5xBJXwJXkTK07xU0LwMz7UoxPP6Z0E=;
        b=HV9NE6uKPkyAFN2ARxCN0u9/nDR6jgkJ/YDQEeKiHloKxeVJmFJYLoxNheyHFVqONt
         Rc0YdaUUrbb8IxeXSSDmiBifhQU06o9jSMxD8pohvcop+WBbjq3q4qANMN2FLnH1aPPM
         +l99Pk/KTWHmy4JHaqcNFAz2tkHUioMUWQdgwEwuhkFq9pf27oPB4lAt5guRULPn1zrZ
         YAiNFZ1TNnY7bl1+x/ssKms1u0VuZDsYTdtTYGO2vB4hrn6u+veYE74os9Ug7HyMRS/7
         SUGYLJ6cIZa4QJV22JgwP3w2DDdS482exMXsOfcaN09LpQdNXKMMufg8vDJHUqoH+SLH
         PH/A==
X-Forwarded-Encrypted: i=1; AJvYcCUuWUh6fArciCzZhgYGeAugUv/XH3j3gT52GYIsg2kXjGP3IcMIEvhzgt+FzNzdhTqzUEvXWnVNuVAb5J6kvspWQEqBB2Xocke4
X-Gm-Message-State: AOJu0YxubcfTMQUuVghpAmZxrC2POPKV+2jFAaYamXWI1Zj7ka/cR/ft
	wBHEUK9CpHSLcT13yiogwJOPxaE4mtDZ3PxWYzdwWH7VVaFnNe0MhTczGuhzm9E=
X-Google-Smtp-Source: AGHT+IEMBz/n6i5scGsvQhKf0agafDOjhO7vlhTQiZYrQnjuhlJdN5K2vf1RR57EWBZM4my6yZUPVg==
X-Received: by 2002:a17:906:22d9:b0:a47:322d:7e3d with SMTP id q25-20020a17090622d900b00a47322d7e3dmr360870eja.75.1711132280417;
        Fri, 22 Mar 2024 11:31:20 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id m21-20020a17090679d500b00a4739efd7cesm92418ejo.60.2024.03.22.11.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 11:31:20 -0700 (PDT)
Message-ID: <d0e893c6-a1ee-4079-a822-8ad9a30f856a@linaro.org>
Date: Fri, 22 Mar 2024 19:31:19 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] clk: qcom: apss-ipq-pll: constify clk_init_data
 structures
Content-Language: en-US
To: Gabor Juhos <j4g8y7@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240321-apss-ipq-pll-cleanup-v2-0-201f3cf79fd4@gmail.com>
 <20240321-apss-ipq-pll-cleanup-v2-5-201f3cf79fd4@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240321-apss-ipq-pll-cleanup-v2-5-201f3cf79fd4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.03.2024 08:49, Gabor Juhos wrote:
> The clk_init_data structures are never modified, so add const
> qualifier to the ones where it is missing.
> 
> No functional changes.
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

