Return-Path: <linux-clk+bounces-7688-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CAF8FAC48
	for <lists+linux-clk@lfdr.de>; Tue,  4 Jun 2024 09:41:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 434C1282700
	for <lists+linux-clk@lfdr.de>; Tue,  4 Jun 2024 07:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08ECA140E50;
	Tue,  4 Jun 2024 07:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wSnxjDas"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB421EB30
	for <linux-clk@vger.kernel.org>; Tue,  4 Jun 2024 07:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717486889; cv=none; b=YUaXgZMQNcz2r7kGuS7IDi9lgcgjJrNg0KX2AyUcwHijNsoYx2CtlV7RGtwnuAegGM9+FvIB/8vncBYeAZc8m88l7dHBovTdDe7iHeFss/pBUi/leWyTQSqYNJ00zzKG2XA0DQ4H4vEiYblajFnlRamFHb5JTOuAMQqyJkpkuxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717486889; c=relaxed/simple;
	bh=tmcgcR9eSjyJNc7+Z1zOD3YatJVXTRq6amEYUD5PjAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FT4Y1/k4GVBsWAMUb9h4LgNy/EaSKiphCIlUmceBIze2FgGBU1C5uDryv5z7MAd6sEvEfZkPedzXOFPGXVDhITxgEOaRwnxsIaNh2z93hPKAcKRTVojcTbEzLHm7RX5Am6jQ+1aLNB/n8MLJna5zjXcV2gA5B8jbxJVXCskC1CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wSnxjDas; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-35a264cb831so4778031f8f.2
        for <linux-clk@vger.kernel.org>; Tue, 04 Jun 2024 00:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717486887; x=1718091687; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=k/fyK01CtXlKOCABa51w5GhkqhvenntmUXoPDgC90SU=;
        b=wSnxjDas0Xkz2R/wwboEnqWytyi6GgG1FZQyj7qIHc+ClvH57uWHvu/fTf+fSew/0m
         fM7aB7/QzjZtVQY8IAqrL+7UQ6AOPdsisr1hD9tfGzX2Pab0oJbQkpa9X5C4q6Ud+krI
         yj+4g4jZVnZvKq/4AkKgXC4hqS8okX2tasFes7JaRTERRhEIleCQzJ54MDpmxv8T2ooq
         HP+k1AHGxC1A4lPXX/t1CZhMtsmO8dD+WbNoxhieNNhovvPoIMguHJcoc9qTgJVSjvLe
         cHLB+uQPhHKeFE5nl1Q/zntBOxx5HrQn+V2y9NY7FYqdsPTN0tGABIrI/gCjHCN+J3aN
         WPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717486887; x=1718091687;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k/fyK01CtXlKOCABa51w5GhkqhvenntmUXoPDgC90SU=;
        b=R/Hc/+HHJqWM99hVBYu6fPVCNHMPYMlp3iDCReX7BJTSKp+R3++znqlt4/ikgVnX8d
         hTr/RPC8heM86h6Wy3sLFrURmFPdrTlYJUJcDc4HyTqWA77bhJP3PxBasODUGt756+vY
         4CFGK99C1XZgGrcb8wnHuUUQtZn9yYXIa8hb/GM2BIO+gl4iQRuF2VVsbGi1z+zDclVf
         DC/JBXwOqzCRzXUEoRP8ikS53X6yPI8SiNXmsH6mmoYcF4Te6s901+5O8SznQr0L4pnY
         tec89JFAI6L7JIDAqvDcet8CbRMUpnLXb0Q8lR5WcTDNy59yoLMgK9rDLbSopOolC5j+
         ltKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaw5iW0nTjVYGQ9TL1lLI1xce5uCMM8KPQegOSVqyExhfq1BcwkbYtpos5dS8dVR6gKNKyTZ0Rm/6hdKbHi9dD2MCL9LhJpYRq
X-Gm-Message-State: AOJu0YyTxvVlyHsG568U7lAGNRplrpm+59tm1xjuTYd56tdbKM/jJgyg
	CVV39LB1NN4EmKZfguAW4H+Lr190LdyrPnFKIOnf5ETHQ+EmI1guCm00+LvzdeA=
X-Google-Smtp-Source: AGHT+IH7hOs6i2v2VDPD6VM0WILawPnTyjTTVxATYM+U7cXh3twmYqtzjpGT7A9MCq3TgVbqDlbjXA==
X-Received: by 2002:a05:6000:8c:b0:35d:cf2b:9101 with SMTP id ffacd0b85a97d-35e0f271a6bmr8508765f8f.15.1717486886735;
        Tue, 04 Jun 2024 00:41:26 -0700 (PDT)
Received: from [192.168.2.24] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04d94f1sm10581446f8f.49.2024.06.04.00.41.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 00:41:26 -0700 (PDT)
Message-ID: <522a363b-f746-45f1-8ac0-21ae2468d88b@linaro.org>
Date: Tue, 4 Jun 2024 09:41:24 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 6/8] dt-bindings: clock: qcom: Add SM8650 camera clock
 controller
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>
References: <20240602114439.1611-1-quic_jkona@quicinc.com>
 <20240602114439.1611-7-quic_jkona@quicinc.com>
 <9fdf4c46-a07e-4dfc-9992-4dd94d8dab5f@linaro.org>
 <88b683c8-56c8-493c-8f22-832cd6d13279@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <88b683c8-56c8-493c-8f22-832cd6d13279@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/06/2024 15:26, Jagadeesh Kona wrote:
>> Just squash the other patch here or drop it completely.
>>
>> Best regards,
>> Krzysztof
>>
> 
> Sure, will squash it to this patch in next series.
> 

Nah, I mixed it up. It's fine.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


