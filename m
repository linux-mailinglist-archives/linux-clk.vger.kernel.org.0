Return-Path: <linux-clk+bounces-19915-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9715DA7362A
	for <lists+linux-clk@lfdr.de>; Thu, 27 Mar 2025 16:58:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C21913ABAF3
	for <lists+linux-clk@lfdr.de>; Thu, 27 Mar 2025 15:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC3251A0BD6;
	Thu, 27 Mar 2025 15:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bdCtqeDj"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F136C19E7FA
	for <linux-clk@vger.kernel.org>; Thu, 27 Mar 2025 15:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743091096; cv=none; b=U3vZvBm0+tll2jpIxOTPpuc0QhL4uVvnSd2potzyUIMVpkQxdxS06LZMa+R4AgY3v+3SUhPv9axsuZz38QYeUSHbq2Lymii/YQxwgCB3L0i2Bqtj5KsTY0jgpRuJJG7bvCZ6yJ+P2kkLk0O1AVTmr6gindbmZY2yehLgY9vPyes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743091096; c=relaxed/simple;
	bh=62dvcPos5ihceHF+L4p/AkidVrabWcrJTC+kLST021w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=osfacM8PpHdPmGy0CfNhDuShq/8QvE3wXuYb1aVFwjd7baXPJZG0QFxbLRG+ciGTiiOQJqX/j9RLPpBy9/ngAgvWhbr0pog8k07Sc15BhR6hjuDSRjguZ6FE9xpyp9IhA4odwNmToeiDtC09R83M8g6I2pWI0rGEw2VZWpDUEQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bdCtqeDj; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-399744f74e9so804032f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 27 Mar 2025 08:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743091093; x=1743695893; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6HKdTwdl8TGxIL8t8Lj0CMiRVJonmqGWdrgR8+tODvE=;
        b=bdCtqeDj2cv9y5psk3g1GMfu/YBw3rOO7/P9q0lFTo3pqEgH/5g0tFC4fDPkjGQR5b
         +P9OY+yFU9pRdi4SolgFPUnaXRSik5z22pJwuyg6VTn6pb64FkSi4rChq5sVVupXo9Pt
         Z1w/V+cQij4GIEzuKF9NBIIJv2lSfxJWTFyWeEfD8C5OSUF3r1A/59mEnoknYMnJMBXt
         SBOZG35K06fo/JjOLtGk90hMRgZbOSqZ+li9va2HS+7KZrn1V6uSZDpuurDCsPPk14w0
         KP8HOW0/Y1ElFbOnsbyv/ia10QjuZXgGD4wkvRwOXz/Ajda+CO2xjt2vBePYFn87WvGr
         sR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743091093; x=1743695893;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6HKdTwdl8TGxIL8t8Lj0CMiRVJonmqGWdrgR8+tODvE=;
        b=GSkyNDDiQGY9cCN641Iwi3WKJvS8n4jnfuHWlO5f98nZD+DflgcawlZVl+7YoIIWi2
         TEUi7xFFXOvWKdVUVwRRFTDj3XOqVN8Oiv1UsNGs4go/DXftqfH0nkrbXrYTNtZgKPF1
         GyJ3rLa3AEHKbUcHuidx1S+g639zi9WTO/mz2E5/Qidit42IrUFXgg/io1awE0TcE6j8
         C03SZ2GsOn5Z76mMtTccm349e02XJ5RcgrleLYRIS8W7D1rRiDxXGkg0ARtJCX75P5A7
         ThaQffxVp+ol6ar7JtiFs5DCTJUn0LSX6Shg9GxeSNCPLgk8hAMekPLh28oGBcPWoE4+
         NRrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXB95rH+UzFv4VXRSrxf5lMW7W2XqRyt0pXqL6eHgaRd2LUZRagmGtJgbUB+Ndw3EGZ4iQiNjeHcvo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEOc+Pv6gSEX4RweqVrkzYI2QSGaZ9G4GkBBk6o81TN7ST5PxC
	4BxCYInTRKD+dJg/+A+nYQp2evZqdD8nT9Tg1W55Xlm8UuQym7c5nSs0djiNa80=
X-Gm-Gg: ASbGncttGetrGz50oBqQEQqK4JumsyDm+X3YLuejJD9PkHk9NGo8cmHKBAwhyeRJRuT
	N9LZ6uR128urYkBrFxvAi1sRPcuyKiXN5/jX7TGpGFxlacbLFd0dlkvKyKnRXX47akd5QGQ5z1K
	bEYN4BYB65dNGzzog3bQo3AAhonavwUC4yhU1qesWGdIp2KoYK+RI6gofij7WXy/jNUp+xYhZM8
	yyDoiIDaRGcxS6qq3MtCRubM4rRbAg8uWYozQVArLGM5xu7f2XKS8w517benVj59lWtRshrLVnT
	eX3q7+82pgG386p9/O/wRao6CyEMB50TRl3cjOHu0awExUXixKR+LEF+9iQRkdf0e/jbPn3o6fr
	LEr7H+KmByA==
X-Google-Smtp-Source: AGHT+IFkFyIJlToRG/+HBeQSZWc6JEkWWRkbsOVXttweEBRHe7pfRt7UyfAjtF97SdSKZ7a2YDySMQ==
X-Received: by 2002:a5d:5847:0:b0:390:d6ab:6c49 with SMTP id ffacd0b85a97d-39ad176bc4emr5053689f8f.35.1743091093192;
        Thu, 27 Mar 2025 08:58:13 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d830f5708sm43269915e9.32.2025.03.27.08.58.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 08:58:12 -0700 (PDT)
Message-ID: <db2566c3-d9e4-4c16-9389-0406de288d7d@linaro.org>
Date: Thu, 27 Mar 2025 15:58:11 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/18] clk: qcom: common: Handle runtime power
 management in qcom_cc_really_probe
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
 <20250327-videocc-pll-multi-pd-voting-v3-5-895fafd62627@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250327-videocc-pll-multi-pd-voting-v3-5-895fafd62627@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/03/2025 09:52, Jagadeesh Kona wrote:
> -		return ret;
> +		goto put_rpm;
> +
> +	ret = qcom_cc_icc_register(dev, desc);
> +
> +put_rpm:
> +	if (desc->use_rpm)
> +		pm_runtime_put(dev);
>   
> -	return qcom_cc_icc_register(dev, desc);
> +	return ret;
>   }
>   EXPORT_SYMBOL_GPL(qcom_cc_really_probe);

Doesn't look right you're missing the put if register goes wrong

	ret = qcom_cc_icc_register(dev, desc);

	if (ret)
		goto put_rpm;

	return 0;

put_rpm:
	if (desc->us_rpm)
		pm_runtime_put();

	return ret;

