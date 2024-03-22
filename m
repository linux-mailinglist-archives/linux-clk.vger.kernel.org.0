Return-Path: <linux-clk+bounces-4889-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27055887328
	for <lists+linux-clk@lfdr.de>; Fri, 22 Mar 2024 19:31:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9224DB243D3
	for <lists+linux-clk@lfdr.de>; Fri, 22 Mar 2024 18:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0A0F67754;
	Fri, 22 Mar 2024 18:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vICnEeIm"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E27C5917D
	for <linux-clk@vger.kernel.org>; Fri, 22 Mar 2024 18:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711132272; cv=none; b=pUDxv1azEa/nKIUYdrOsV/ftfH3m39Is/rcvyOcvHn2fhTB/79BizC9HxJWeuHnXxCeATpoeG1R0lYzt76W9PD98Sa6fDzLWqQVPtS1jt+GD2mOopLbfgbwoSNHy/DtAQ1zMstUtzLfZcHo9t2+v6yLknzACafV+LysV/MnU+qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711132272; c=relaxed/simple;
	bh=TH6oD7I6inmzqGijmczCzgULqsJ3NZi5DvqJ3stVTYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OkIu7aGZmnDagIwuZnGvF2eTrHOCtGfD571pXe/PewmPveAxSpprYSAoOj7IEBDngFVoDbu96r79LuhodHApjNHmfvnYbnIUCTlVuVByxYkKzHKT9o6aY+LMh77t4ZSFA8g3WESAOz5Xf9Fuj3pUIDOl0foR35Z62v9zpaBq1Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vICnEeIm; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-513d3746950so3045365e87.1
        for <linux-clk@vger.kernel.org>; Fri, 22 Mar 2024 11:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711132269; x=1711737069; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4bSqd3XjR5uMZiGQ+kP/8/gEZGleVLJ05v9ecahAfsw=;
        b=vICnEeImQ6ScAqH4Kg2o/dopfYDaz3xsgYR0Y1UoUYrmnMWzenl6w8kNc0eQ3Ye8Ao
         ZMxsCPCAGkP6dytDuYtMus9HRMpaSMir30Q3YPuNsTnAiIYDdEuNOvCQCEYgAmvxqV6I
         4o4Q+ZeC2f3fVfNQBF+GPvvL2zdqBQLy4R26ehAlROupbtcZfLKYcq1NcPXgprRmlKie
         GP3p9Hu33l9lIvJn2vqhmHzXfMVHCi2xk+IH3iIPZsqL0p93hh+GDgSOEX8htb/ggteP
         WCrKBYy0YsvuG5+4nyZHS6uaCblfGdgdEjBlmbEk6pTe1IJvC1SfujxqpyTQzFbvkKMr
         lWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711132269; x=1711737069;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4bSqd3XjR5uMZiGQ+kP/8/gEZGleVLJ05v9ecahAfsw=;
        b=PZDV1w+YIde16aCaHrQhIY4I/WlAKM1QVoOQ6UlT8mZkP1FUp8Jwef/xWu46q5Lmou
         hjTYq8m9PYduglJtJdGuLVG3PvyMOaCZOsC/GQg2YjYztRmHVSOvfvxdi50M3hiWAVSh
         OMPvSihkEEi9qPFpTZbebS2hpsssaXC6CuHUGBfAlR+78nFwEff+nLQ2jRDHevV5IlTv
         6B2+LRoggWTbhuWZnhREG9fxP7vwpztDtvmxgO3L7p+RGVPGY2ecuSBohR8ChzOnWuG0
         IhNBdePp3FPnOPB28wbSmaDa3QNClIhzK7tjBN3dFqXnXd7sOR+AxxZKUBfA6K3q/O7m
         GLhg==
X-Forwarded-Encrypted: i=1; AJvYcCXylVa1V21e8uQNt8Bb/D5H2DAxbUOVVLnZdrj84DJnYZ0waeGuJvZVqsSTtg3vJWQmtUp+WiSAFFkVH4vNlmPAg9I4hZWKzp56
X-Gm-Message-State: AOJu0YzEXo0fkRVAEQEJk1AQyodRhYd3JFrJoHi1BqyMXHrEcyeKMB2M
	VxFBak50JP60VG8UG8TpFWIcja4bcutL4IGQfnEF5NCqID3Lf4zQmp8i/JbHMWo=
X-Google-Smtp-Source: AGHT+IHOA+Yt5IyPgB60AVea5Dj730WmvYr+gpa29g/vN2BZI1svdYQvLoWaboX7xy6AWNrsj8EPOw==
X-Received: by 2002:ac2:5586:0:b0:513:d94a:670f with SMTP id v6-20020ac25586000000b00513d94a670fmr159157lfg.31.1711132269260;
        Fri, 22 Mar 2024 11:31:09 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id m21-20020a17090679d500b00a4739efd7cesm92418ejo.60.2024.03.22.11.31.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 11:31:08 -0700 (PDT)
Message-ID: <49b2079e-f365-472c-b910-92c3631b005f@linaro.org>
Date: Fri, 22 Mar 2024 19:31:07 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] clk: qcom: apss-ipq-pll: constify match data
 structures
Content-Language: en-US
To: Gabor Juhos <j4g8y7@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240321-apss-ipq-pll-cleanup-v2-0-201f3cf79fd4@gmail.com>
 <20240321-apss-ipq-pll-cleanup-v2-4-201f3cf79fd4@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240321-apss-ipq-pll-cleanup-v2-4-201f3cf79fd4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.03.2024 08:49, Gabor Juhos wrote:
> The match data structures are used only by the apss_ipq_pll_probe()
> function and are never modified so mark those as constant.
> 
> No functional changes.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

