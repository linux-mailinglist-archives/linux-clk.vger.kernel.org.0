Return-Path: <linux-clk+bounces-7826-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A05C88FE8BF
	for <lists+linux-clk@lfdr.de>; Thu,  6 Jun 2024 16:10:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53213284C69
	for <lists+linux-clk@lfdr.de>; Thu,  6 Jun 2024 14:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49E8B19882E;
	Thu,  6 Jun 2024 14:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W8FTmO9o"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDF5197A9E
	for <linux-clk@vger.kernel.org>; Thu,  6 Jun 2024 14:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717682930; cv=none; b=cHBfabE/owc99U/+sVucysOfPmWD4B801GK++Er9+yk6aGGNYzgXrxAU7xHYIeTuWM+4G9DsgBekhCXcrDvl7Eca83CGes+shtZpq2QZvSRqtIIstR/S0HG3UVWjcsUUFvtXVIfXWc3xioK1ztIrtNuRFnbqRFQjBg0SouxeAm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717682930; c=relaxed/simple;
	bh=RpGnnlNwHkl9JIF7GLTjn2mJGXJPbuU0x/eYbCe04sI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t+aB4NnvoiJAxd8RZgk84a1/zsu/C+5WgnmQY8rXzqilaZZwDuYh2uE+O0Pjy6q06x35f0OjR/X1+m+ICwl7NjiBp/Mde3T/pr9IViTOcNrLJzWoiyHYwCdgYsASQ3Kt2BogMGoBTR39NDAW/1r/wjFMlfyXHNuHT//MAcLAVMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W8FTmO9o; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a6267778b3aso107092466b.3
        for <linux-clk@vger.kernel.org>; Thu, 06 Jun 2024 07:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717682927; x=1718287727; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g+cc5/YkJMxn9xduO7p9Nejvh1U53rMlObVTtnaup/8=;
        b=W8FTmO9oVWRstGVYbT7UpFgBps3YSV64AIIIQpl+89v1dAMW7+C71VHq2Ug7Yn+tUQ
         laGwNvbeXUZkW35rzsZFF06HY9NndHhWzM2zgfi5yZz/qrvpkHnB2nVguEa/5FRdJAxx
         ezxnQYltcEsd+uX9hlefUP2aidS/wRSKpq9mkHH5FJH9LQoBsFrqAHErZa8DN+tlMzzh
         E3oi5jJ43x/VyqLWWL3CWClfvg9t7erWchPOJDpBoz7kFNFGy6m3ACKSesIOifZSmt15
         1vuYAAJdFH0bntfu0eNh+hvztGQ61VBoBMNPbD4Itpfl4nyBlkhsAD7JnUzTRU2GDELH
         yelw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717682927; x=1718287727;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g+cc5/YkJMxn9xduO7p9Nejvh1U53rMlObVTtnaup/8=;
        b=i7LaokGYgrJZJBdqOGqr47ksSFEMPfy+u6fF1plMESpWO97dGYHY34sS4bxYyagA0p
         dPYTb3sJ8iY0CrVZUa0/WX4AbJDL28Mj1ZDjlXrVKWBd9IKGT8MN5LqGjK8vU7J/iVaO
         nUE3PFVQDirGa7z8BYx6gRWmX8QoxohGp9v60lpv0y2C4H3Jx7NKZG/T+LBs6GrdiQRy
         GgnrBsfkjY1+vPgUg78H+z/LlWqP0yclz5jPGtf5GX8qVbfjcuBFhj2e602KlBIRyiWo
         snQrY7AakmGCm4mrQDDaeyPHV1uorQePsmm7Aqx+1nWOGkA0eXHnIfFj+Bkmx+2o7NK6
         B7KQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVWtyUawscOkxFxNgRcyjVOL9eG8k2dCrBtywesGnxjSQYeuc8unr30ZNFPXS/61/DSRf8MLSQsrUIqamvmvgDe5hkpPsIENxC
X-Gm-Message-State: AOJu0Yxj2/QClZxmGKI1I39nxM9gkYBwRKzXRDYk1HxbNMDA+h3siNE1
	HYSNwDza3cmnH32SRNiBvGGDCkykbckbCYXj9PbEP+i5EiiXkynH2Tf91CGqK8E=
X-Google-Smtp-Source: AGHT+IFa+ockro1cArQLRQ4GHtw7t1e8h2Ycsz9C7ejmm9DBvHKuM0phsyk4sK4LaE9Py6WRFHv71g==
X-Received: by 2002:a17:907:c909:b0:a59:9cc1:7330 with SMTP id a640c23a62f3a-a69a024f0f8mr313013366b.64.1717682926890;
        Thu, 06 Jun 2024 07:08:46 -0700 (PDT)
Received: from [192.168.128.139] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c805ca035sm101684466b.57.2024.06.06.07.08.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 07:08:46 -0700 (PDT)
Message-ID: <6286a410-6faa-4996-8a9e-dc334dd9421f@linaro.org>
Date: Thu, 6 Jun 2024 16:08:43 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 7/8] clk: qcom: Add GPUCC driver support for SM4450
To: Ajit Pandey <quic_ajipan@quicinc.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Vinod Koul <vkoul@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Taniya Das <quic_tdas@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
References: <20240416182005.75422-1-quic_ajipan@quicinc.com>
 <20240416182005.75422-8-quic_ajipan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240416182005.75422-8-quic_ajipan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.04.2024 8:20 PM, Ajit Pandey wrote:
> Add Graphics Clock Controller (GPUCC) support for SM4450 platform.
> 
> Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

