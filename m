Return-Path: <linux-clk+bounces-4971-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D5288AC46
	for <lists+linux-clk@lfdr.de>; Mon, 25 Mar 2024 18:49:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 106B6324DBB
	for <lists+linux-clk@lfdr.de>; Mon, 25 Mar 2024 17:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1BEE3F9E0;
	Mon, 25 Mar 2024 17:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j4TDEOJp"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C8B18638
	for <linux-clk@vger.kernel.org>; Mon, 25 Mar 2024 17:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711386135; cv=none; b=gAzUnni+qfZq3s1VQJqLOJQ95z+LrqA8jM4LuqYl5ydK1kTtAtJ9kV3Gsrpe6ntcpcgiNybRc9CncZ/gWuLn4rWrtLZUP+txnnARCj6piPKxtIvyxpsCZgAcshyoJLW09YuErI2NdbrbBaMLQYTnnEH1QGszP+pHz0WPAKSW12w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711386135; c=relaxed/simple;
	bh=m7fd1//5IrrtHgWOoWmDIMhE55eFKjHMazQpwfZnFEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UHRrgtRUj1AS8IyG6cr2rmxM8fTF5C6f/CqrpqlPN5cT1XPfrLslk5+Ngml3B15Iinrfjv7MXkNx4hUDSrsYSZC1faOHR16Ed34YoAhFwa9tds7PuH1yHN7ozX5IriUtpRqxr771E8FT4yCUwmT7QVtBM3ET46ArlheL0l3YWzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j4TDEOJp; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1e0411c0a52so33217785ad.0
        for <linux-clk@vger.kernel.org>; Mon, 25 Mar 2024 10:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711386133; x=1711990933; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vah2WWF295ZE3+NJIAmiLCanZHCiZpOAIq/DGlaX/m0=;
        b=j4TDEOJpgZPlK1iGd3bAtEv718O0qwIIWD4PsFVpNJB5j16SDAU/485RxdV/Xel6LN
         Yj2+QVTww+LvWAdVDPgwgNWNdAQvROp4BWt062JSFXiubP/mszpAN1sJNmQnYJengAoa
         qypBq9dfIOajy48eUpaYQn+FIJlnnVIeKRRx1HMMdZ+BUqCY1HiI5kZ9njgi9abEEaT0
         5Y9jJXLnuff5QbeBIBXLfLu95anTWBcIkdmE7BLatuxwF761nKB92e+OfgYd72jHRjlS
         ZgiRtNV3TOnZrrSRveA3WQQIKokMknFL8fgdmqUiIZ/ILdgIz50Y4I3b8UfrDDMcxIMd
         DBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711386133; x=1711990933;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vah2WWF295ZE3+NJIAmiLCanZHCiZpOAIq/DGlaX/m0=;
        b=cZ+vJD5JNsT1OrOWW3cWoQj+39qH/PgAAoHEPq1iIG9YuvKqOg2Y9wkAZ/eKbiNBbZ
         OgVHroPXJNvCD3mcPJU1eTfLq2F2h5b10bPA1xDCrLXW01+4Zt87SMyJdcz6JtD3WoVc
         Qn/ev6vXI5TvYAUHKSa0tfmf8O6SpRC7An6H/iZN37mL/OosZM1q5rXWnxBgFrbJOXBV
         5rtPilJgpBabGtV2nHDWTsOIujnCSGZVhP11ka+/bcF6HGgja1B94lZGP8Ef79OJu5XX
         mXXuQ5k/x5eSSyKldu/ZbooXrvFclXns/v/Zq//oZYjk2hYeDZx70enVROJTLCMLKI2Q
         2FNw==
X-Forwarded-Encrypted: i=1; AJvYcCXrWvDTDpK55KA1Wo4WBFo5lfm7ySvokdJD6UhqdB6x3vGuZri5etEHWJADB9bZ8mK2LEmWj80d5YBkH8TpkEEmgxsrs7qN/3ei
X-Gm-Message-State: AOJu0YwUQI/qZTFYfCT17Ww+Pf2Dhzd0NZGpgCirokDPdL9GTf33Ag5V
	wfR4545XlWh8gFTt3Ww3yJ2jypjahrnDJdXYQJM2OOiEuToiBEtX/s7Ez4aj4w0=
X-Google-Smtp-Source: AGHT+IFJQtr9KLesreEA+rN5I4oDbq/kaNwSDF9SvVqoxxKVyxbnhcLw/w3S4d4CON2KX2+9wkYT0g==
X-Received: by 2002:a17:902:eb8d:b0:1e0:115c:e03c with SMTP id q13-20020a170902eb8d00b001e0115ce03cmr7194945plg.53.1711386133516;
        Mon, 25 Mar 2024 10:02:13 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id p2-20020a170902780200b001deeac592absm4983213pll.180.2024.03.25.10.02.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 10:02:13 -0700 (PDT)
Message-ID: <3bac1efe-ad49-4d13-8a50-0726b568a9d6@linaro.org>
Date: Mon, 25 Mar 2024 17:02:08 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: qcom: Fix x1e80100 camcc
 power-domain declaration
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, Rajendra Nayak <quic_rjendra@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240313-linux-next-camcc-fixes-v2-0-9426da94ae37@linaro.org>
 <20240313-linux-next-camcc-fixes-v2-1-9426da94ae37@linaro.org>
 <20240315151613.GA1256230-robh@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240315151613.GA1256230-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/03/2024 15:16, Rob Herring wrote:
> Add new entries onto the end of existing ones. IOW, MMCX should always
> be 1st. Then you can move the descriptions to the top level and just put
> minItems or maxItems as appropriate here.

So for the CAMCC MXC should be switched on first per spec but, TBH I 
don't think that's a real dependency that matters.

I can probably make this change with no functional impact.

---
bod

