Return-Path: <linux-clk+bounces-3371-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C7F84BDB5
	for <lists+linux-clk@lfdr.de>; Tue,  6 Feb 2024 20:03:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF3CD283C0A
	for <lists+linux-clk@lfdr.de>; Tue,  6 Feb 2024 19:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F6C11429A;
	Tue,  6 Feb 2024 19:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GkLsDS9i"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75234171AB
	for <linux-clk@vger.kernel.org>; Tue,  6 Feb 2024 19:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707246168; cv=none; b=RSGyo1lPQctUJfHTG1Yvew4ROuwEtqGt05UCXRjbFH5L1Tdk0u/ynz2w2d9n6/qU4unSLdDfE0DUX07H6wBhcpkTtncKrWZ1DvK+F0oTYuB6oIPtkhKXV7I7XPF0B7jxI/UWHrP9V9J8BcO9GOybD3j5JJgFsR7joDvTxL3hDnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707246168; c=relaxed/simple;
	bh=MayJ12Q1OdC43+lmG+sL1paIdgLMT0ulGG6KdUKOcgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e4JRiJoAux44ODhdQY7ujXO5+rZwARveQkx2JfjwRv0/94vWyfxc6ZMNnKbQOUStEDznoe8bDze4Jgez72306JN3SdNxaiwyRxMtGEXj6lySKCxtQDVXURX9epxVwfKIlVHuuzzZDpL7Zf+3XSTsxXoUKse+jHopciEk1Owmvi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GkLsDS9i; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-51160efad36so820099e87.1
        for <linux-clk@vger.kernel.org>; Tue, 06 Feb 2024 11:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707246164; x=1707850964; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eAewVpB1rXB6xa78/8SQ0Z6/8PFB3iQ6y6Pf6fJMJTE=;
        b=GkLsDS9ir86FjlCxOMNAv023dgrIBw2NPuDB1hQekK0jLXWGyDDnfnt+smgwpWBroL
         7fqlHagTwxjzVdNdyZBwbqHcIvvF4N5n1jB8nKw6rHjh6zRWb/BTNzyH6cU1780ztfIu
         il5nI3iW3pNLNnFdhXABWHYjmmRgb19V7vYRnxIRl6T5iCfLldPVsMHdIt0TcdfArL2h
         cbTd/Ui0PSv8w8xW1CvfJ2PEbbuoA3ek5uLR1lSZH3coK/FYt4DxjpaHHNYO2uBXC+Ex
         TabUzie4+8a99WWlhHaFeT8KmKwjLFPoZCFdDm0uKz1uCtMKVdY6CxX2Xdv+ouTVHuKM
         8x+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707246164; x=1707850964;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eAewVpB1rXB6xa78/8SQ0Z6/8PFB3iQ6y6Pf6fJMJTE=;
        b=JpSztwkkYtGbbLMi3yDrfqWwqh+Xc9WVWv62csIDhw9R2yc5zq1jxwQ09qh+qQ49NG
         88WJlU03xPvGZA9aFRLHRfK4zjXwwSrP7aR5RUp9wgm8oo9ZeEHxFIil3AWJfvuFtxQO
         KnVoaqOoJxLQ6shq1Oh7DH05SIHqUQNLElsfek3OTO8u0QIYYw7pvic+SAET7qMaVlyN
         cmm+7U3UoZ2BXo3yY4KBffUinCITb+4BNDIPFsYnkgc+Zs6bhxHR8ORvvV73K5SKLRml
         B03ii+uorjN4DG1KkuvCF4Z8NBsGaG3Wr8j6XGVopa/VQ0x8anvDHiT9DkWPqkMTE37/
         ULBg==
X-Gm-Message-State: AOJu0Ywz6HS/VVe9X39kweFkKgTFTlXdAK1T+0rdRi1f/FjgdGbgPkfc
	h0L9h6DzgPAdFDtSOOOLHY1LG0L6PT7sM3lCzZ9uRvLc5ghe5oOuAmNzO6Gew+k=
X-Google-Smtp-Source: AGHT+IF77WvoeJb/GzRc7IXJ56q08XIG+hT5ljo/3Z0OncYrZ2d8xMTttywQXEVp7SXYigLraEaG3w==
X-Received: by 2002:a05:6512:550:b0:511:529e:b54e with SMTP id h16-20020a056512055000b00511529eb54emr2411129lfl.30.1707246164330;
        Tue, 06 Feb 2024 11:02:44 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU3SKJk+migPd1kssy/WZYKn1GbyO3nvp+sM7k8zGu+Rs27WpMDQCe6YJfO0X2I41Vxj9SfhH6F74IhBADwcgaTp7lVR5hQfckPNT7l9qPpPzHRok8NHui1jy7jL6uIJx1CZkPTIOk7sQJ6TZrXJT0XQe4Lbe7Pczzj9qZQ2SBsGCbbaLoi/UFXY2OJDCWWmptRcTxrns7K94wgW/GYZ5Q4IPVbNROAz+I6mn+G1YzMsGKwZ1K0SH75Zl2EL6JIud9dCbuiON0UR+voycQ0q51OyvOAoMmSsQWjyFoHD1gdhgG7Fu9rmaGsJX/BGPzqCryNCNk437XSHFsyF8cArEjNVLTtxNLm4oiIncEbbDdjqBR7jv3AACHDCUIDJ38Pd1sKLJS4kHbDrFlOw3tAp0NluaEWKwKmMLhO4NW6DN76Dz4HBxdBfHSOcdiX0/P7ojxZKg3ujGKBCq7+dFlYQEN1cWW1WI7QxelL/E2/Uo9sklUQpVUyJwqgZITbiQIy9FIl98exgzO6CSQrlUtCkgIInKyiVICZHo1Yf8bE2bSIBaHDeTH/jwsQPBrgL/s=
Received: from [192.168.192.207] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id h16-20020a17090619d000b00a385535a02asm224018ejd.171.2024.02.06.11.02.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 11:02:43 -0800 (PST)
Message-ID: <cd582d8a-d90e-43f0-b735-c2c00dbaa964@linaro.org>
Date: Tue, 6 Feb 2024 20:02:41 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/10] clk: qcom: Add GPU clock driver for x1e80100
Content-Language: en-US
To: Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 Rajendra Nayak <quic_rjendra@quicinc.com>
References: <20240129-x1e80100-clock-controllers-v3-0-d96dacfed104@linaro.org>
 <20240129-x1e80100-clock-controllers-v3-8-d96dacfed104@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240129-x1e80100-clock-controllers-v3-8-d96dacfed104@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.01.2024 23:52, Abel Vesa wrote:
> From: Rajendra Nayak <quic_rjendra@quicinc.com>
> 
> Add Graphics Clock Controller (GPUCC) support for X1E80100 platform.
> 
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Pretty sure you want pm_clk and runtime PM for the GX vote

Konrad

