Return-Path: <linux-clk+bounces-222-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 540C77EC8EA
	for <lists+linux-clk@lfdr.de>; Wed, 15 Nov 2023 17:49:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F01C281308
	for <lists+linux-clk@lfdr.de>; Wed, 15 Nov 2023 16:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC8F92FC32;
	Wed, 15 Nov 2023 16:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AhM0lJtr"
X-Original-To: linux-clk@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E56D3EA6F
	for <linux-clk@vger.kernel.org>; Wed, 15 Nov 2023 16:48:59 +0000 (UTC)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CBA911D
	for <linux-clk@vger.kernel.org>; Wed, 15 Nov 2023 08:48:57 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c83d37a492so55470481fa.3
        for <linux-clk@vger.kernel.org>; Wed, 15 Nov 2023 08:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700066935; x=1700671735; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1JFVW100N4q4TU3demIcnNlFQYmXCxWuiTOcydzmEwY=;
        b=AhM0lJtrT1HgzWsbK7Dg+nDqwOr72BNlirOuLbYXGOaKBO3QOAQjfZiKfczd2K8qld
         GrK/FbKGo1QQEjm8h2uBrM5eL3pW0bFmNNZhc3oXbMsGgzIlGcJ93pe+6I63YjtYkwg7
         SKFqMijsnbqTs+xG5pARwyNOOi7NQNDNpSydkctMw56kJSW5KKJmm6PjiCBN0brH3c0F
         cYXGV5ax1WvywdwtQLrXg7sqDBLDxEwe5Bip+ISuxcvHW59oQ+xzMEXwUWh14kvFDCF1
         aOV7X4ukAI2N34vvz9X3xY+zPOXiJnH3gapW0LX4WcQoS+DXMQVJOv6E+i3cvgVtL7hc
         OCZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700066935; x=1700671735;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1JFVW100N4q4TU3demIcnNlFQYmXCxWuiTOcydzmEwY=;
        b=ir6xR7KW6PbJEsamiXbj8IRhgY3hZwlIo9/fWGqc1MMGPfAJckCyJvpfO1W0+Gl24M
         gCPYJu41Mcj9Pigh0Qy6Km2lH6rt1IPW4WlwwK98xN11ePlF8vM03rUyNlvYZ5Lykwrs
         0p7UOWZ8h52lSxjigeZRmBxuHw7pxDhkAy2xfldpl829+U4u7HPULiia2mGQWoIIpZNp
         GiYl7B16wzSgGGpS3ITk16r0jGjp0PgaewWedPGfFfNLRpD6prHc7z5FZYVwVNEIqFO0
         VahN+iV8V02ciXHQ31mgGwB64qAHg+kFHVP4xjfYp73sN9PaJ1N7yJCooJgXf8p842gt
         Uk2Q==
X-Gm-Message-State: AOJu0YzIiLyGAbyDOnX7oQSArQvXyDWnRVS53OCv91xkTFY9qGKNjPVV
	dpmMR5+0WUFwXm2RcaDRhoUHkQ==
X-Google-Smtp-Source: AGHT+IF//qea0b+ScHEr5OSH8aWRS+7t3/vcP/3QNs+mv/50Xc927AFTs4UtGj0Lcu0WmYl0eoSMmg==
X-Received: by 2002:a2e:82cd:0:b0:2b9:3684:165 with SMTP id n13-20020a2e82cd000000b002b936840165mr4070474ljh.8.1700066935560;
        Wed, 15 Nov 2023 08:48:55 -0800 (PST)
Received: from [172.30.204.150] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id a13-20020a2ebe8d000000b002c12c2094e4sm1705775ljr.74.2023.11.15.08.48.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 08:48:55 -0800 (PST)
Message-ID: <2c5dae0f-5bd4-4fed-ba47-1175eba07207@linaro.org>
Date: Wed, 15 Nov 2023 17:48:52 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: videocc-sm8150: Update the videocc resets
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Andy Gross <agross@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20231110065029.2117212-1-quic_skakitap@quicinc.com>
 <20231110065029.2117212-3-quic_skakitap@quicinc.com>
 <31dac823-cc46-401e-85f8-d04544bd38c3@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <31dac823-cc46-401e-85f8-d04544bd38c3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: *



On 11/10/23 12:49, Bryan O'Donoghue wrote:
> On 10/11/2023 06:50, Satya Priya Kakitapalli wrote:
>> Add all the available resets for the video clock controller
>> on sm8150.
>>
>> Fixes: 5658e8cf1a8a ("clk: qcom: add video clock controller driver for SM8150")
>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>> ---
>>   drivers/clk/qcom/videocc-sm8150.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/videocc-sm8150.c b/drivers/clk/qcom/videocc-sm8150.c
>> index 1afdbe4a249d..6a5f89f53da8 100644
>> --- a/drivers/clk/qcom/videocc-sm8150.c
>> +++ b/drivers/clk/qcom/videocc-sm8150.c
>> @@ -214,6 +214,10 @@ static const struct regmap_config video_cc_sm8150_regmap_config = {
>>   static const struct qcom_reset_map video_cc_sm8150_resets[] = {
>>       [VIDEO_CC_MVSC_CORE_CLK_BCR] = { 0x850, 2 },
>> +    [VIDEO_CC_INTERFACE_BCR] = { 0x8f0 },
>> +    [VIDEO_CC_MVS0_BCR] = { 0x870 },
>> +    [VIDEO_CC_MVS1_BCR] = { 0x8b0 },
>> +    [VIDEO_CC_MVSC_BCR] = { 0x810 },
> 
> Are you sure this shouldn't be
> 
> +    [VIDEO_CC_INTERFACE_BCR] = { 0x9ac },
> +    [VIDEO_CC_MVS0_BCR] = { 0x870 },
> +    [VIDEO_CC_MVS1_BCR] = { 0x8b0 },
> +    [VIDEO_CC_MVSC_BCR] = { 0x810 },
FWIW this seems to be a copypaste from

https://git.codelinaro.org/clo/la/kernel/msm-5.4/-/blame/92b31370d31d22e910120f6a875bf0919b3f1773/drivers/clk/qcom/videocc-sm8150.c

so if it's an issue, it should probably be fixed downstream too

Konrad

