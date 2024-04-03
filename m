Return-Path: <linux-clk+bounces-5378-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEBC896C11
	for <lists+linux-clk@lfdr.de>; Wed,  3 Apr 2024 12:21:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B0CE1C251CB
	for <lists+linux-clk@lfdr.de>; Wed,  3 Apr 2024 10:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4493F136989;
	Wed,  3 Apr 2024 10:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GY9YnPLK"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7898813666A
	for <linux-clk@vger.kernel.org>; Wed,  3 Apr 2024 10:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712139671; cv=none; b=G1BlQccNkotwuJ99on7U3DPHazUp+YuLq5G2D9oOncagi/h0jt8wUXr+ROdV91a3jIFzLvM2Gmn+QR/Kf2Vpe3YBPPJCn9HvJdyfuiX9Khg1xeRVw8sGhDCkFOamyJGCLF3I1UOZcB272xd0mrwcykiV1DOeFUu+YpaIIf4XtSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712139671; c=relaxed/simple;
	bh=j9OWD1Egg+9iI5w7d3WeI7AlB92++uzCxocuqyXnMNk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F1ILjgOpbA66PwSsz8XvQEHEUwYERS86YUIeBWiNNR0M2or36/JP2oBPsEizjLK2VgVXQaKKDInRp7u/reL5XbvzNui2F8wY2JBh3bMwRNS5BNq7g2r7EroxWJOIgSjcrKEXxj9KfegCGx66B8OqTDG6QKO8WaF6D6thBh6zdCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GY9YnPLK; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a472f8c6a55so799018766b.0
        for <linux-clk@vger.kernel.org>; Wed, 03 Apr 2024 03:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712139668; x=1712744468; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4lrg9u1DWO3N7iNCPwEbpDmzDHx9LenQFb2AaTvmxYY=;
        b=GY9YnPLKZXBE+iUca2K7y4lMCLid4LK3ssU/bWG/X5IppxYMAHeSQGNpCUStDGl8II
         gL0dFi9tyJLVZPPfUc27RrezDkWeXIXiKaySQyJHGXW5LzRQiBCSqPPemmQd4qeGxh3j
         6G/bBM4mUUowbAGHvPyEBDEiCP7dG9tMcFmUfpMvDOSiFEODSozogYBcG+/+gkiGMEnP
         qSrgncD1zXdRaZY0A0uniplIviabsc0syHr2bGJv3gRs4BlSrZ1jDmLfcoIA0CfxBsbu
         5k/LbFLKlmUri56mLUy8F/A2m1zmQKPrPFsET5HzIJD7d4LD0gCMIcz5xrm4sLZ8rleZ
         liDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712139668; x=1712744468;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lrg9u1DWO3N7iNCPwEbpDmzDHx9LenQFb2AaTvmxYY=;
        b=XTq1T+oq4e/GwAyyvP0znBllkQ6glaGBR5/VscGEgLtyfqvFdjAzxdgqKwiWm5yXgN
         4mNqOu6oqfSvhqcK0Bwa5tKjUOB+1MZxwzkGF6a8p5rpg5z43STF+WWpGmHDbmGlomFv
         BrJopl+ZfH71xH42Cp6AQeN5ewGP8u3cXhjureF1BE6gkRCBDCJyqlPibFusn6Wm+E6E
         WFC9C8L2GtIlD4wt928VKGluhgJOtzg8z3u+HGRF/C/p3olxCdEgH0AI+2dTZ4MB3Bpf
         YkQ7YF/nFtM7s1bzsKknkPEbODh+Qe25rWC0Xz15yf1FQV4xEevV03ZECmsxOtT+2pmW
         yzLw==
X-Forwarded-Encrypted: i=1; AJvYcCVOzioEvAyEX0sX4TfQKS1C7JLtMdyNFUodbrUuH/Sn78HONTLJWRuEK6lRk+jFjffl2BGFHLamZbsfUQQiHkAEVnFjnA3AXktb
X-Gm-Message-State: AOJu0Ywrnu6LJ+SxQ3W3no6U3oLiH2Zla3DEXZNnbTQzAItaoe8G/idG
	CnNTDtj3mq/azMT3jQOk4yvP/GX0PkrBgnHbUzzR8C0YN0nDgM6hlqiPr/yVtOY=
X-Google-Smtp-Source: AGHT+IEP4Gm/j49EiS5w8Osi5IxulbUu7dmYZSs8UZrCWXoYjgFHKV6WkLihgHu5HCaYyGuLMqf+SQ==
X-Received: by 2002:a17:907:11cd:b0:a4e:2d1e:6914 with SMTP id va13-20020a17090711cd00b00a4e2d1e6914mr9439566ejb.11.1712139667716;
        Wed, 03 Apr 2024 03:21:07 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id bj7-20020a17090736c700b00a4e696e613esm3583799ejc.153.2024.04.03.03.21.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 03:21:07 -0700 (PDT)
Message-ID: <a2f88176-b4e1-4202-843c-a00c5a2b1622@linaro.org>
Date: Wed, 3 Apr 2024 12:21:05 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] Add Synopsys DesignWare HDMI RX Controller
To: Shreeya Patel <shreeya.patel@collabora.com>, mchehab@kernel.org,
 hverkuil@xs4all.nl, hverkuil-cisco@xs4all.nl
Cc: heiko@sntech.de, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, shawn.wen@rock-chips.com, kernel@collabora.com,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm@lists.infradead.org
References: <20240327225057.672304-1-shreeya.patel@collabora.com>
 <35e566-660d2080-1-7eb9eb00@16488675>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <35e566-660d2080-1-7eb9eb00@16488675>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/04/2024 11:24, Shreeya Patel wrote:
> On Thursday, March 28, 2024 04:20 IST, Shreeya Patel <shreeya.patel@collabora.com> wrote:
> 
>> This series implements support for the Synopsys DesignWare
>> HDMI RX Controller, being compliant with standard HDMI 1.4b
>> and HDMI 2.0.
>>
> 
> Hi Mauro and Hans,
> 
> I haven't received any reviews so far. Hence, this is just a gentle reminder to review this patch series.

Why did you put clk changes here? These go via different subsystem. That
might be one of obstacles for your patchset.

Also, you sent it just a week ago and you already ping. Please relax,
and help out by reviewing other patches on the mailing lists in order to
relieve the burden of maintainers and move your patches higher up the list.


Best regards,
Krzysztof


