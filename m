Return-Path: <linux-clk+bounces-4526-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 286AE878BBE
	for <lists+linux-clk@lfdr.de>; Tue, 12 Mar 2024 01:02:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFAFD281C0F
	for <lists+linux-clk@lfdr.de>; Tue, 12 Mar 2024 00:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B557E6;
	Tue, 12 Mar 2024 00:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bQJW+Eoh"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E087B197
	for <linux-clk@vger.kernel.org>; Tue, 12 Mar 2024 00:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710201743; cv=none; b=d/PJKjTnLOf10+/+vrn5chh/MQX7NEViRWUy+YBtaBeJugzqcRy9wNjnSu0wOxAZC/3zUc798IUJYMeCrWxK9F68PIn7waNfMGN7p4VAmwi9WHtmUV+lPX8Yiv5SFnco/fuf9LdVSF1uyI2f7xatYSici7gQ53qtMtvGps2Zk1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710201743; c=relaxed/simple;
	bh=stm9FGgtBV2ge3GNjRDSZm6tmd3vK8BCG9OQJOXsfWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JqLXyhA67SqX3NddAt5BvuFBIHIVOD39feD/gRNrM5GyMv3U21q6P0HUSzE9nTmhw1M2XSJVv40zlI5AzXWBVSZsDNI5df5qT68CW8e7F0qprOL/vTnHIrt7f5dqynUSdwXl9UpyF9xU1JEz7EQSZ8rfFBilRvs9xakY3hkznrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bQJW+Eoh; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-512ed314881so4364538e87.2
        for <linux-clk@vger.kernel.org>; Mon, 11 Mar 2024 17:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710201740; x=1710806540; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aKmks8JoDmenSi0sINdl5p06voW43We5KTvM0ksBIog=;
        b=bQJW+Eohk+8LDeMfvqAIuQT1x08/4Xx3qdJh3VzmcZgCHKCgnbk5UuyZWi1GLsDLoO
         p4tjLoJpvV4lvyyR7u/sodNW8kCXSWyfsyVazXlJMIG6VsbB6X2pMFmBYFCkYvKCFS95
         GNK8MMm452xvFa7hL4WtYA3/fJWbK/AQc1qjNuCeoI0rwxHtERhWP5h/9b5uHfXV/RvF
         grDEtzjA70P8NQks077Pu3X1WGnX9Cvu6GlyuwhyETBN3EjSXzxeOt0GMmnMGYHRWqJC
         po5cay8vNBwDSIWetPBQuW5tck7piwwsdGDCjqsmrS+F1cbmQ2Prj5eMTSIyIjG9vHgd
         MCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710201740; x=1710806540;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aKmks8JoDmenSi0sINdl5p06voW43We5KTvM0ksBIog=;
        b=ZeyFyoBJPkUzTtsi+uzvn1Z3BaN68YaZwG/t5HmJHKdvzGgQyphAxzpLxFQP65ou4w
         LiiL25lbWFTOv8R+CAS1R3l3szUKYSUqrYvE2ED1X2OZB/SKHvVujVAcEbS4RIv4vZOU
         6dtBMzI944LRQXz5LgnkgLTYU5T+axXh5NNCk7ycURwXxVNiIqgUaIHHvKbb0skijEbj
         VVjMCYHkHspHsS9qEzEWkqhNtDmTy1fLhiErwABw2FbRlDnXi5/lYM4piFwjTr2SkLgo
         BsJKL6+8IINFpRiOboZeVsCP+SDBWUw2Fky080x31CQAaSQpHt2nornGRNPYuGlSlR4W
         Ftyw==
X-Forwarded-Encrypted: i=1; AJvYcCVv9JMxjN7qQ+K1hBNhQLKsyXUbxMmBSOJFMNuTr8DF7pwcc0QtOdKS8G/GATLvDCyzmfANbGLwMx+HK7Te3yH6zRv+Lsvi1KyV
X-Gm-Message-State: AOJu0YzG7uqx4CAsRE1C3eliwBaoeF7jyiKKUDCwsAfadF8bN3+mEi7P
	zpduYpgzis25/0HBc5wZxUwr1flcZo+aCOxBR9kghIVGLd9kwXR5r9+Q3pYLjuKjLkgjlAS51kO
	vjHU=
X-Google-Smtp-Source: AGHT+IGL/R4b0JHYZrCQJFnWgkBE04O6Qt+nCajTqVhpdM9rnfO660gNoLAf2V5uXL5drRK9xoC+gw==
X-Received: by 2002:ac2:5e22:0:b0:513:2d99:f9e5 with SMTP id o2-20020ac25e22000000b005132d99f9e5mr4597639lfg.36.1710201740018;
        Mon, 11 Mar 2024 17:02:20 -0700 (PDT)
Received: from [172.30.205.61] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id n16-20020ac24910000000b00512ebe62693sm1300360lfi.255.2024.03.11.17.02.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 17:02:19 -0700 (PDT)
Message-ID: <0c3dc12e-f571-4562-95cf-3f4ca27aabd8@linaro.org>
Date: Tue, 12 Mar 2024 01:02:19 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: clk-alpha-pll: reorder Stromer register
 offsets
Content-Language: en-US
To: Gabor Juhos <j4g8y7@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Varadarajan Narayanan <quic_varada@quicinc.com>,
 Sricharan R <quic_srichara@quicinc.com>,
 Kathiravan T <quic_kathirav@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240311-alpha-pll-stromer-cleanup-v1-0-f7c0c5607cca@gmail.com>
 <20240311-alpha-pll-stromer-cleanup-v1-2-f7c0c5607cca@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240311-alpha-pll-stromer-cleanup-v1-2-f7c0c5607cca@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/11/24 19:45, Gabor Juhos wrote:
> The register offset arrays are ordered based on the register
> offsets for all PLLs but the Stromer. For consistency, reorder
> the Stromer specific array as well.
> 
> No functional changes.
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

