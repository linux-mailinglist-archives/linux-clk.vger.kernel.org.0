Return-Path: <linux-clk+bounces-2222-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F52827C0D
	for <lists+linux-clk@lfdr.de>; Tue,  9 Jan 2024 01:30:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3E1A1C2082C
	for <lists+linux-clk@lfdr.de>; Tue,  9 Jan 2024 00:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96FB9370;
	Tue,  9 Jan 2024 00:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kq0GoNqY"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57140322A
	for <linux-clk@vger.kernel.org>; Tue,  9 Jan 2024 00:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40e47dc8b0eso11710545e9.3
        for <linux-clk@vger.kernel.org>; Mon, 08 Jan 2024 16:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704760194; x=1705364994; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0J1uTjP4T5i87y9V75kLS5+vNGLsSeJpj0F2CvV3VIg=;
        b=Kq0GoNqYltwFC1kfEcx2qk4/8DLj699+Tlx32OGiJfJ29tG4blUu5DtdKECw9z3R3g
         YWX+AUS/WcPSIwIp119jzlks9pCuyss/VT4mMWPg/AeqBwmGxI6BFgNt6UGH0FJTIbWn
         AGGQ+6HH08x499nHZigdLKdCNt9uP8d4jlrqI01QWCXxUv0hIAGfJawLb+IbzEH0XREg
         OPi3WjNaQEAvBoV4GE1ZyubYCQd8CKzapZDx1JypAX33BIxQfZjddzUwJvE/zaVY+3sU
         nM24eb8Zz6sZXGjweZgSBClq0gm+GMUKgo0vp8eETPZ2XuYQ4/tOLqzRScYggYdYPjb0
         +tVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704760194; x=1705364994;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0J1uTjP4T5i87y9V75kLS5+vNGLsSeJpj0F2CvV3VIg=;
        b=BEWQLf5wjXz9fvTTBXhBh93+FLo1gP7G93SeD4zrp/J+4Vby0iaxPdXkEDjToSflRR
         6BT0pdmFD+uZRBBiXrS+TEu9ATiznvy42+f2iNcg1gDiLD0gUCt+MPbz1puuRv6p1YPK
         QoEWINGyJlNiWDiI9iiloo8EaoPjL3JdWaKDePWyf8C8RgLZKLcj+sIY66u1fztnPtm+
         ps4a0Sv9a0HJ77Ik7SaOI4W1fxFKDzcoTE5nfKlkIPKbisQXLShn2rwCifG8onGCezUA
         zBJ0X+HFvKqNgdrWqu3nUALECJOawkjTWT5ArZ9/BjXSwzCvbRWghnxhfzuzrIFP2Qni
         VQXg==
X-Gm-Message-State: AOJu0YzVTI9ZgNU6YL/GH81hKarNDlOIo3uUJVQXc/E7ASqz1UfZ8yTI
	kAs8EToQwaUisWxYYJZu8LuSrxeFHH51UQ==
X-Google-Smtp-Source: AGHT+IG6pKHKNm9SEpobDgG0EQXxqKzqgSa4oz6eSwveXy1/QNrJCSYUhTA1gKvGu/FkeCzIN92eRQ==
X-Received: by 2002:a05:600c:ac5:b0:40d:376b:c640 with SMTP id c5-20020a05600c0ac500b0040d376bc640mr2589517wmr.102.1704760194586;
        Mon, 08 Jan 2024 16:29:54 -0800 (PST)
Received: from [192.168.100.86] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id p11-20020adfcc8b000000b003372b8ab19asm904114wrj.64.2024.01.08.16.29.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jan 2024 16:29:53 -0800 (PST)
Message-ID: <dcd80eba-e00e-4e29-b46f-9c972bf018f3@linaro.org>
Date: Tue, 9 Jan 2024 00:29:52 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/18] clk: qcom: reset: Commonize the de/assert functions
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Manivannan Sadhasivam <mani@kernel.org>
References: <20240105-topic-venus_reset-v1-0-981c7a624855@linaro.org>
 <20240105-topic-venus_reset-v1-2-981c7a624855@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240105-topic-venus_reset-v1-2-981c7a624855@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/01/2024 12:32, Konrad Dybcio wrote:
> -static int
> -qcom_reset_assert(struct reset_controller_dev *rcdev, unsigned long id)
> +static int qcom_reset_set_assert(struct reset_controller_dev *rcdev, unsigned long id,
> +			     bool assert)

Personally I'd not elongate the function declaration.

>   {
>   	struct qcom_reset_controller *rst;
>   	const struct qcom_reset_map *map;
> @@ -33,21 +33,17 @@ qcom_reset_assert(struct reset_controller_dev *rcdev, unsigned long id)
>   	map = &rst->reset_map[id];
>   	mask = map->bitmask ? map->bitmask : BIT(map->bit);
>   
> -	return regmap_update_bits(rst->regmap, map->reg, mask, mask);
> +	return regmap_update_bits(rst->regmap, map->reg, mask, assert ? mask : 0);

and I'd probably do

u32 bits = 0;

if (assert)
     bits = mask;

regmap_update_bits(rst->regmap, map->reg, mask, bits);

because I prefer for aesthetic reasons not to do ternary inputs like that.

However its up to you to change or not.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

