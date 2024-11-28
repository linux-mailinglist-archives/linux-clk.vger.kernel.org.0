Return-Path: <linux-clk+bounces-15113-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAA09DB844
	for <lists+linux-clk@lfdr.de>; Thu, 28 Nov 2024 14:08:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C62EE163C7D
	for <lists+linux-clk@lfdr.de>; Thu, 28 Nov 2024 13:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74B01A286D;
	Thu, 28 Nov 2024 13:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w1d9PUJp"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7E71A0B04
	for <linux-clk@vger.kernel.org>; Thu, 28 Nov 2024 13:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732799258; cv=none; b=pDpRG72VzW7X30zAyMQUuZHswDuuVcxh5ZrLd9bNxkvaQKlnj9RQo754TbEykZiYaq4E7tFYuD07sNG14v2Xh069pA7uD+OKZxPkAGNa6Xrrexpx3UcU0QP1Z5O7nR5eFmCL6y+8pMMLZ8+ncMK/RPaVyiwUklwoJd01EZyGi+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732799258; c=relaxed/simple;
	bh=TXaQzQ0BiAaroehXp2SHXJ2Y2paPRhigmiwEFz+r+eY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rbNYGRjUoS6qIuaoc9mftJX/3+aZLwdyYeux+Vi/YeGkfYr0J8WN7tc1dPjoVJoqrixbZk/NjLTL9+omGd03fAu0l191r9kkONgxh++gfvz7tPPYOcQgls8bo42BHTTU3cSljg5a2m+C9CmrpFkV4MqRMFLIJYt/93B14d7ZIO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w1d9PUJp; arc=none smtp.client-ip=209.85.208.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f195.google.com with SMTP id 38308e7fff4ca-2ffcd3c2b46so505641fa.2
        for <linux-clk@vger.kernel.org>; Thu, 28 Nov 2024 05:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732799255; x=1733404055; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kP1bCAckSI/OkKwT28rFJsMYm5pGH3l6UtaR38jv7E8=;
        b=w1d9PUJpdzTTURWaD+E/vYH2go3sP9ffahxV07HZA/E8sUxcKhHpt/zY5E9lKNn0TR
         BAAEaW0qZ0LtkFBqJyOnhHxBV/UdzO7movr8uKTe0VT1bLLzRyi8MlCkCtoE4BZKRGJs
         F2YiG1PgHYf6Csbs2Z/BjHK0FGg5/6a66OvytsJSq0Le4Y8+iJoWgv2+8cS7h/qC3tvO
         fvHgSVQyjzsJ6RGz8GMeFPU8oysEePddOvQ/4z0sDfjpgS5LK6aBl0z+NoF7iXkjVEs9
         i/3hzY2D5siodwMqeDf1nk38OU9Q8fuyGBT/fA5ovJgLY/Kb7tu8xPpvIy373Xr3ureI
         eamQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732799255; x=1733404055;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kP1bCAckSI/OkKwT28rFJsMYm5pGH3l6UtaR38jv7E8=;
        b=jwpIT+MBi7yXwZuiG2RH7PGZ71VuccKXA49v0MPlfgJicSqcNMmqhPRJR21q7OUbRK
         T9h13Fj7Liik47Y+RtS5IJYfFc2w6Kcqo83f8oqX8hFw3Scdba92HDmAl6I1kvLPQ1g/
         adW7ZM80pVO+lnri4N0bwo6MGbeiCRaL4szsUpCj9yFh1nrf+nnk0QpgYiajQrKVN/LW
         3QinIIOguS3bMvIQzX/jBbwWYNzqb0v/rEQigeZVyPpv/MoEIKw8g+GCmiC5ny8KmhO9
         gzx5hCe+Pc0aPSoRQMHL3RZuD1fqseAAIfOgqsPhOz0EdxOrNXRsTdQyp9gcnyEFqeBn
         lbBg==
X-Forwarded-Encrypted: i=1; AJvYcCWkUjZU0UZS6BLU/ccb5/e3Jw5ZMn7JJ+zrVMANUW3bta6IMnbwIXXZrcbf5Z5OnU0MpgnwaK0nKQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyxF2avaLeARwa9b45A9xGbMCgROqGsK3XSO2knVF6xaQjgyDg
	M+RHYTtuzjR303xYW3pKfQRzb0BEjdHXvC1JRUAZWiocjxZcOq0H5cYqNwdhcAg=
X-Gm-Gg: ASbGnctznxOqUegbqRMN4+RIu7ZjiFwO7yqLf+YUJ7hpFgmKrBBowwMOT2qKKWYR6C7
	GiP5H17QRCw3HGZH6ps5ncWQQuKIinP51OBTUaAiM4sEQaEqlwgPxUIaCmrAPrW6Z2zEkZM85Jo
	v2u11j1ygTRl3n1qXelAwDEOYdlIH+NhBbS2MNSiDC+yT1gvtOWZ9DDCal9bxJMmuwDUAUcGD4M
	T9BwYhPSRSYZQ+GSYX9znOYu9WfDOma81aPR1uwY8SnQ/eMifnIoBN6zvONFYLm2OjcEdsnlfRW
	Mo3XfVDyNd9JbGGZnbBW9/NRIoSt
X-Google-Smtp-Source: AGHT+IHLbzOfKgwnDlfh/55yxsap6kH/uHe5qjnZfubg3vSAG78tinN8zIUWjCGzLLDWYe9ztol14g==
X-Received: by 2002:a2e:be87:0:b0:2fb:4ad6:a5fb with SMTP id 38308e7fff4ca-2ffd6007b89mr10008391fa.6.1732799254974;
        Thu, 28 Nov 2024 05:07:34 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfc751ecsm1909141fa.87.2024.11.28.05.07.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 05:07:33 -0800 (PST)
Message-ID: <4997c6d8-fa9f-48e9-bb5a-f88946059462@linaro.org>
Date: Thu, 28 Nov 2024 15:07:31 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] clk: qcom: common: Add support for power-domain
 attachment
Content-Language: en-US
To: Bryan O'Donoghue <pure.logic@nexus-software.ie>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241127-b4-linux-next-24-11-18-clock-multiple-power-domains-v4-0-4348d40cb635@linaro.org>
 <20241127-b4-linux-next-24-11-18-clock-multiple-power-domains-v4-2-4348d40cb635@linaro.org>
 <a73a3b5a-cd83-4f87-876d-ea99ef8bbd70@linaro.org>
 <ec5faeb0-2cfd-4634-b772-80197c1b9092@nexus-software.ie>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <ec5faeb0-2cfd-4634-b772-80197c1b9092@nexus-software.ie>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/28/24 14:16, Bryan O'Donoghue wrote:
> On 28/11/2024 12:09, Vladimir Zapolskiy wrote:
>> Please simplify this change, please do not ignore patch reviews, if you
>> find it possible.
>>
>> https://lore.kernel.org/all/8a33c0ff-0c6d-4995-
>> b239-023d2a2c2af5@linaro.org/
> 
> You want this inlined ?

Yes, please. A simpler version should be preferred, by any metrics 3 lines
of code are better than 20 lines of code plus a new added function.

Thank you for understanding.

--
Best wishes,
Vladimir

