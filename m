Return-Path: <linux-clk+bounces-11662-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2FC969E8B
	for <lists+linux-clk@lfdr.de>; Tue,  3 Sep 2024 15:00:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D18D71C23CB0
	for <lists+linux-clk@lfdr.de>; Tue,  3 Sep 2024 13:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4AA81A7277;
	Tue,  3 Sep 2024 12:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G2X19rdg"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4A91A7247
	for <linux-clk@vger.kernel.org>; Tue,  3 Sep 2024 12:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725368399; cv=none; b=qpIJnnRSHEguJaZTrwOYU4liI4xMX1cIbb66JUZ8RB5yBxxMXHmECrwJ53780C30Gysb+JFVpJPXb98f+6E+E1pRVQL1UCZhOe9PmE9I+Ns4xzgb76+TdPdg1IYjtdCefysjvRyJSMal6sxYhUmQS+N0TF5MTIjaTcBmk75BlrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725368399; c=relaxed/simple;
	bh=CaQWK3/MKgAfGTpC1WNs9oH35h7YSGKTyxDREsV2AYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CXLJqPBVABJ1m/QGbtU4fmEFOdmPngi+hmdl5T1Rght+wQ4b9B1uAuuhHL5z+Dvzkei36DuBpML7osLQAhgbcO6WTAtdNuLwNtWiO3Ik4NRkrmIS0c+Q+qxW7oTKbmbA0sjZ0Aj5bDHBQry9UjJy81beAjWc/eITL5n/tDnOqWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G2X19rdg; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42bbaf45044so6061205e9.1
        for <linux-clk@vger.kernel.org>; Tue, 03 Sep 2024 05:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725368396; x=1725973196; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4ticPy03thsBH7ST9+X7W0xyzfsW4H8uwPQTOMcFMVw=;
        b=G2X19rdgkVDCAfgOHjn81vXMgyGCdwc/YB0Cc3ZJoC2kAIjs2ko144vSq+n+0aMXJD
         ncObOyWHzVQfkvF9Jb4eBCBUD9FwGTFp/EVd795goliqw5k+JrDvk169m51uUIEMP2R6
         jgGE8yrLPp8UwaK+PoIdlXLyyhSF5WRGeCCmxfgtZHrzjXrIXQKShSo/Bq4fphXhh8nc
         F9BjV/G7Z6fWxMdAVwojxTKmPqmE585m3yvVjTKPYtnHI32CK+eZMlrKSLS3EKcaQmTG
         MQhomxe4DvBjiWMk4lGBmp/AbGcv2veE33feI0yRz47pvupWLpO10jyYxmMk3GzmuQIa
         CMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725368396; x=1725973196;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ticPy03thsBH7ST9+X7W0xyzfsW4H8uwPQTOMcFMVw=;
        b=OSXfFwdp9+Sj9MwKVQr6exS3ZJwM4czyGZut5W0oTd2Sm4jF201AG8qsQP1bANLARJ
         73mFGJtqBFq4z29jaL2zT6B7RoRCpflGh2FUkZzbRpsdE78ITX95rmIZfwdwQcj8Q4fJ
         cTiFfda0Ulf5IYwQBGCq6W5OiO66GdfeeLBxMx6JcnljW8Zr+3quYYNM2UqxKhPPVwK1
         U5Fur2xVYl+dYg/mDFU8oiEEE4vrOtz9mRMbcP9cSTbqoF9xTWvJ977KFswl0aM3ctHB
         OwKEWaIKIsqSfjjBHPdEiYkUdKafqCR0haHbcxjQDfqR4OAcGEU6HA1KpGk3tXKaAFHZ
         X6QQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBwzYvMBsgEfTbbtSyZ0IBk5+JRXGq0ffMYhsNukclcyl3il8HwFAaB4aPrDcOddE3r1EYA52oNwI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6pTPeFJzEk5gfdPVRZAG1cju15j7bUWa49agWidlyRlXgT1j0
	E663eB2VkMWE4UkIuDBzK3t/HzEK9OzgIcLNsyrH1ha7+nL/nWBB91A0Knqaelw=
X-Google-Smtp-Source: AGHT+IEOgYAm2eOPwfCXmdl3+PEV3b+3SYiUJ7bXnR/2KKvL28COE2Azttmj/iZ1kGZacGmJ4ClczA==
X-Received: by 2002:a5d:588e:0:b0:374:d088:476f with SMTP id ffacd0b85a97d-374d0884b17mr2005909f8f.5.1725368395964;
        Tue, 03 Sep 2024 05:59:55 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374ba3da654sm10556671f8f.89.2024.09.03.05.59.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 05:59:55 -0700 (PDT)
Message-ID: <5712ca1f-8570-4f2f-bba2-beb2968bb5bb@linaro.org>
Date: Tue, 3 Sep 2024 14:59:53 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: clock: nxp,imx95-blk-ctl: Add
 compatible string for i.MX95 HSIO BLK CTRL
To: Richard Zhu <hongxing.zhu@nxp.com>, abelvesa@kernel.org,
 peng.fan@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, imx@lists.linux.dev, kernel@pengutronix.de
References: <1725350397-19527-1-git-send-email-hongxing.zhu@nxp.com>
 <1725350397-19527-2-git-send-email-hongxing.zhu@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <1725350397-19527-2-git-send-email-hongxing.zhu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/09/2024 09:59, Richard Zhu wrote:
> Add compatible string "nxp,imx95-hsio-blk-ctl" for iMX95.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---

<form letter>
Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC. It might happen, that command when run on an older
kernel, gives you outdated entries. Therefore please be sure you base
your patches on recent Linux kernel.

Tools like b4 or scripts/get_maintainer.pl provide you proper list of
people, so fix your workflow. Tools might also fail if you work on some
ancient tree (don't, instead use mainline) or work on fork of kernel
(don't, instead use mainline). Just use b4 and everything should be
fine, although remember about `b4 prep --auto-to-cc` if you added new
patches to the patchset.

You missed at least devicetree list (maybe more), so this won't be
tested by automated tooling. Performing review on untested code might be
a waste of time.

Please kindly resend and include all necessary To/Cc entries.
</form letter>

Best regards,
Krzysztof


