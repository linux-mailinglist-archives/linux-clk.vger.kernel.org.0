Return-Path: <linux-clk+bounces-22203-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70361AC202D
	for <lists+linux-clk@lfdr.de>; Fri, 23 May 2025 11:51:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D74C87AA30E
	for <lists+linux-clk@lfdr.de>; Fri, 23 May 2025 09:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 204DB22576E;
	Fri, 23 May 2025 09:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WxCZWFr5"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520B222370F
	for <linux-clk@vger.kernel.org>; Fri, 23 May 2025 09:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747993859; cv=none; b=XzN2dl4lWEUPHAdklHey+BEu3nKABRLK4XwBTS+4Ip/YxeAhe6tdHF+0JSclQcjw47o/ZcxISRxdYRxPPd8EGP0Y/XbvQSDMY9Pcy3okK2+s304cm+genjrzVjpJwDUha+y/2EQ3tfmwlf+za5ZD3e3fPb113LmtYIEPI3HZJ8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747993859; c=relaxed/simple;
	bh=AW43RwLwOmrl4rpbbbN2XAtRXZBN1bmhD8swbRBxMOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fWQ0LxA9X+T4eiHnYDSXcEsYUpe2IgqAaLnasehB4Zbtv2EeYnCCiOxyd9XNgSMpfAnxONkGcx71tOmnGCIS/FKlkxYBVzKyFTHBgQXyTXg1VUiDuDvp8PNkpbjuKv3z7sowfU0QpZ07rXdFHSyxV871HHLHYaLOp0PUkYkXYaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WxCZWFr5; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a36210dbe4so1003143f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 23 May 2025 02:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747993855; x=1748598655; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HY4ZgUXsyVdmMvzWCBHX/kKastlwpiiCBGCBj2Rck9E=;
        b=WxCZWFr5p5hmBebTiCKxu4bBkS2cit5ZSZ4VL944m4x1E30hjPV2UaEZ6jv/DJMjUU
         ul7mT48Hk2ISknv/J0ZJ0nBhOmfaFY3OZ0Noy0fmDdfzHrTzuiFklf8QmWWVpy8nDbkk
         xv8ZROcCWPJrmBENobqOKEQItTl2+mLwpV4wJc2tbhqc/ZR/e7/AQinJvAIQyjxAJxZ0
         1+mFxM58tC5ifntRPX3leKFFfu64O/j2fc0W/UISD05bPm0gPQjc5jY+eypDbqau3URb
         ulValqL3IRfICtT9Ahs0l5a+nOojY9pGOq2WN01XAI+eBw8j6Wrsb5AppsqTQj9tCfs+
         0U4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747993855; x=1748598655;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HY4ZgUXsyVdmMvzWCBHX/kKastlwpiiCBGCBj2Rck9E=;
        b=O9bwMud0iMQbLHmVZe3HXKS7CX7T/yCGZD1zICH2TqsMN/6f6Jxv8/e+VAUWG5T7G0
         zGNVUDpEizyaOt9JWVAGU8V5bZbxgTgQZkJuascnjCsliY2xncvrE73V0tRD5xqFANbB
         Qq7ggLM/xRba3GtPGLLPDd7lQm0JpTVpsKYzaDrWhw24+x1QynJ+8lx8er9u0jj0cluG
         bszBpPH2T/YO+oEJ4dB3EWX6QUhqOdX1aBSToEmL8CdF902v/POYVEjy1ISngIPRJuXg
         Ah4Im2u0rJogCKphsNOqe8mihnQ2ouIuJfuNyQWD7ESs8cGfqfG/Hgjz8wiPlZXFqsck
         vmGg==
X-Forwarded-Encrypted: i=1; AJvYcCUnwxxhltrkNUaIdxY9HtDvPcAPk6jzgjB++CmgxB3wERKViUSodlvLwS9VpDlvnhEUB9KeEfrZLPg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5B30HaAo9LdCZX8LWUo1bOQNFLeUshkwSs9nFUqnSo93pvpP9
	7gObKV1MqQsYVDnJJz4+hzxugdLv0iMWlFjScCw41vQCVEjT9W6ACsQD2X6MEQiM8nQ=
X-Gm-Gg: ASbGncvPP4KHHNnPGUghhv/Mp92HgA3cvUNZBTe82Lc5IMkm0Ek0mLPpdpIBrCn0yIF
	HW06uj1X4OvybU0j7bWq+Z31iG3jAm9Dktzl+L5n2FXUTa2UTdyezTHVzut5iGL2Yjc7DCHmcHi
	LuebOkUcrawWgAPcmABhwSST4LKkIVKeKDgqsXf8jd+yWtdXR9RPyKk7AXav26q+BSWqGXMpMmJ
	h4I8vLqhE3Jukp1IUybQJmp/O7pUKtGbjR1TUYsTPTruvYtpnuNREB9hP173UKB4frhiR6d8Tqe
	cgI/vC82o4pN4NloFvvLSdZFm7khX49qIsDLrWo41rCFvXk8dDsEaCXalIo6TQJluWeoYUI=
X-Google-Smtp-Source: AGHT+IHLsU9tv3YRIwmvHOcU1vW70gGI1NXC5VhNjyd6s34jrQf3fJpxo0TRChZUDx2i0DZeJYCiAQ==
X-Received: by 2002:a5d:5385:0:b0:3a3:5e77:436a with SMTP id ffacd0b85a97d-3a35e774456mr6839479f8f.15.1747993855484;
        Fri, 23 May 2025 02:50:55 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d204sm26289437f8f.10.2025.05.23.02.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 02:50:54 -0700 (PDT)
Message-ID: <1adc727c-ff4e-454f-9424-453d49bf610a@linaro.org>
Date: Fri, 23 May 2025 11:50:52 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 21/24] drm/msm/dpu: Implement 10-bit color alpha for
 v12.0 DPU
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-21-8cab30c3e4df@linaro.org>
 <aDAbxAnCN1lGGcGH@linaro.org> <aDAdax7xdeDsvQHB@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <aDAdax7xdeDsvQHB@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/05/2025 09:02, Abel Vesa wrote:
>>>  static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
>>> -		struct dpu_plane_state *pstate, const struct msm_format *format)
>>> +				      struct dpu_plane_state *pstate,
>>> +				      const struct msm_format *format,
>>> +				      const struct dpu_mdss_version *mdss_ver)
>>>  {
>>>  	struct dpu_hw_mixer *lm = mixer->hw_lm;
>>>  	uint32_t blend_op;
>>> -	uint32_t fg_alpha, bg_alpha;
>>> +	uint32_t fg_alpha, bg_alpha, max_alpha;
>>>  
>>>  	fg_alpha = pstate->base.alpha >> 8;
>>
>> For the 10-bit alpha, you need to shift here by 5 instead of 8.
> 
> Typo. "6 instead of 8".
> 
Thanks, this indeed fixes the darkness!

Best regards,
Krzysztof

