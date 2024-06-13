Return-Path: <linux-clk+bounces-7994-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6648D905E39
	for <lists+linux-clk@lfdr.de>; Thu, 13 Jun 2024 00:06:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 019A71F223E5
	for <lists+linux-clk@lfdr.de>; Wed, 12 Jun 2024 22:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D8D0127E0F;
	Wed, 12 Jun 2024 22:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rxn08QA6"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE32D8288C
	for <linux-clk@vger.kernel.org>; Wed, 12 Jun 2024 22:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718230004; cv=none; b=KfR6qGi3Kn63wxAMPWZUD7AlFTcpiaBvEoDJdqjEhVeupfqC1oJWAPSthaTquLXYpS8u7EoRpA5CSj5tArq0rt209kF8xY3zfVjm2js/V5g34NctvMhBMwiRNXZg4yzUs3/n0DDJQf0QRR/jJ452JKGMeH83R2sXX6fsL7nH4+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718230004; c=relaxed/simple;
	bh=nWQB0cxwpb5Nyp9W2Aj2B6qiyQPIg/qKQY5yKA+03K8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pVd2NBVWw+wADE0B5Fq3w1SNSUAPLOnGrCZf89hBRNPeUd3Dw5jiCdb/8dceErp6vcIbFtVVz2Ry0y/5O6EmtJN13baEh7MvMztFmCeoXwObp7AXmn5pT5ryOouEAa7WlVpvQNDCOrMs6+okz5/DSrPpTPo0GS4/AiXWELNfPbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rxn08QA6; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52c83f21854so53679e87.2
        for <linux-clk@vger.kernel.org>; Wed, 12 Jun 2024 15:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718230001; x=1718834801; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VHMkWh1GJqApt9wvbkQjpRZMa0KcRsUTuqWe6P4okXg=;
        b=Rxn08QA6bw+Rp/CPNBTBe1zTm9vXDUWsV7Uby7e1oF4TyL17o/CeJV0ALs+/t7PeWv
         pwugLXNreBY8DyBo7jOcqWzqDVBmgXhlIFgZeUW0t2bMjv+iZmjTUzjwkAsHgVJnaX9p
         UL9DY7b7MxtWgrVIUntHyQq6dfSAFOsev3QSajDrozf111aWRJjatg70HNVZpTo/pyMZ
         9MfwthRMHWmgIi5exv5WiXdArtV+beTr9NurrBqA6bFF59SJuWpPnWMmkdnSfOmkpG0r
         tdhRnpR0+q7wroUVHQuy8uJBIS6Xk6MnuI3/WIO086mIYe2ByKuHaSdI1WN7TGWeJqnl
         pYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718230001; x=1718834801;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VHMkWh1GJqApt9wvbkQjpRZMa0KcRsUTuqWe6P4okXg=;
        b=UAxLUVr783QvQYwfuMrLpsgG1Xca1upT23GwdLWlOGJZdjPRN8oWv061kxOtl41FtA
         DqjTCZESwCPwk3yy/PzFyJFbbgzEOQEnSeo21+TOLqjBoDC7leCXMfhnrkhb0J0YEazr
         DwpdGaywBAAvJypSksxVjIRLYkKSyEqCTqsRSO2pRz/dhe4wUM39Sf1f7czYHdMYcgV8
         LZa7pgY1TE9att+R+9YrUEl5GSinNrhAGfzVO91koCOR4fhIcOVC0dgVDalkGSYYaH6a
         Zls0a9lcMcFz25JvCodRNGkdlPjGHZjBWxxl5lVOmLey3mEXFvR7yrEVaMAm53ESUjwQ
         LKRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDJH72qyzBNe12ffZnr7fVcfB1VKtVAKIOOaebBGtRnsZhsV6XBsNdNg8J+tqAvNOm5POWUREJDDt+ozip+g9BYtKTqUIiR+1h
X-Gm-Message-State: AOJu0Yz/uw0GdpVMufNSL33VmkagdDvcCTiB0sHnlwcQUMFQybpRJHUD
	2dixaKLLRa/0CzAJUnV7T9GUXDDdCkfHHvqwMpnw8LxlsMgWj/uoW3ZwNuK6ZKE=
X-Google-Smtp-Source: AGHT+IFGBDcnsnGgnH57GdtLyI7Cp/okDgOWixyNLiELylSt9euObSqVLA0Bs7EZsFFRS0f0ffmkBA==
X-Received: by 2002:a2e:22c5:0:b0:2ec:2f8:f4b0 with SMTP id 38308e7fff4ca-2ec02f8f645mr4542301fa.0.1718230001010;
        Wed, 12 Jun 2024 15:06:41 -0700 (PDT)
Received: from [192.168.1.3] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c78556sm76301fa.85.2024.06.12.15.06.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 15:06:40 -0700 (PDT)
Message-ID: <e974477c-f451-4c9c-83d6-31437c52f1bd@linaro.org>
Date: Thu, 13 Jun 2024 01:06:39 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 2/8] dt-bindings: clock: qcom: Add SM8650 video clock
 controller
Content-Language: en-US
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240602114439.1611-1-quic_jkona@quicinc.com>
 <20240602114439.1611-3-quic_jkona@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240602114439.1611-3-quic_jkona@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jagadeesh,

On 6/2/24 14:44, Jagadeesh Kona wrote:
> SM8650 video clock controller has most clocks same as SM8450,
> but it also has few additional clocks and resets. Add device tree
> bindings for the video clock controller on Qualcomm SM8650 platform
> by defining these additional clocks and resets on top of SM8450.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

thank you for the change.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

