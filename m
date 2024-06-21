Return-Path: <linux-clk+bounces-8445-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F0C912613
	for <lists+linux-clk@lfdr.de>; Fri, 21 Jun 2024 14:56:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A086B26C44
	for <lists+linux-clk@lfdr.de>; Fri, 21 Jun 2024 12:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 286A114D45A;
	Fri, 21 Jun 2024 12:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="F0dZIvhJ"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D731E4AB
	for <linux-clk@vger.kernel.org>; Fri, 21 Jun 2024 12:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718974298; cv=none; b=UwpsoPmV51rzR0x3baIamNPmUg5ZfVrZVg8UTYze8/OOu9kLDrY/O8B9cvZ6vKqBpj55pI2RMUHXdc2zu2frPHLlVUWciAQfXBMOAHS8JvqYuoIEUbpBe75uSTJK6CaDVlqP2qoixO4l3ahP/JoCZXzqvPMTRfh2F+7HYERK+8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718974298; c=relaxed/simple;
	bh=oJhNKSiOdLm70pBsH/9KJGUC8653wDVYRRmce2De8Bg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KZFkTBSIZnrFF/qBKO5EXPYKMI5L0vVNiDOzT5FmxE7+DXRcvlZRf0bmGOHxr+mLij2TU3BG4CAHS/Gap0OwWBPna5VaqQohBPqM04ygGBWZ2MLl/zaeo93YfGdsNthh52WqhiSyh2Kjux4nasGZ/JKWu1pHFNYX8hYJys3s7JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=F0dZIvhJ; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52c82101407so3377028e87.3
        for <linux-clk@vger.kernel.org>; Fri, 21 Jun 2024 05:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718974293; x=1719579093; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FWAkuQtQbhgbJxkwJNkctDpDNqgcetuxscd31qCmfLE=;
        b=F0dZIvhJpOCGe4xldY+ZYegvpouhxyghVn5/vNu96mXxPlMDcUqH9dy6OKGPlQNwT4
         +oBVU6pxz16AlG00wX8Z01/U9b2lkVM+KE8pUbUt7QchJ1jcAAQxVHVQJIzKie29IDFd
         0ubL0NBLjzybnktvGU9N7cC/3ILhrsZh9lsv/mCji3ekcFuYwB+GGQTTA2GakuaqKJtB
         CBLxjcSNDza8perAqeDJf0dBRat2q0B+ZkQqfAoEjwUJPpALqKnfLVZVLVNT6pDZdf73
         L0h5hMh9zBX56sB/nLOKVT33cP24/PusfjvBoeZbprt9hyjGswhNAcNq1RNYW1HfozXs
         5FMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718974293; x=1719579093;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FWAkuQtQbhgbJxkwJNkctDpDNqgcetuxscd31qCmfLE=;
        b=ok3rknZLmlaq0IsXDMC96Xm6O7iIBs1mbYEjPsByFqs4fyXzF1zdScJaRGt9KGZ291
         NavBS9WvLU/bcM8FwF8DbUE1vg9CP1KFn9NqwF4XCYJkQZ22ws3aEVUeGxTKtT3spICF
         oV6CJoiq03sP0kAsc+TMG3mQcVQf8kGjZzuWN3HWoR5qiXsiPPhpghO08VGUqAq2+P10
         0OigYcEmOv2hDealKN/5NorZEiStcNRU4bW/SdQssoqi7ASWe5EYsYuYN8ZQRXBhr7f+
         Ey7mlHpCtuxIVeI9G8p+O3scb8jcKr5GzGKKcvZxge+HnONAwRwII5G0IeQVqGuJ/Xwl
         Rl6w==
X-Forwarded-Encrypted: i=1; AJvYcCXMyoC41cY6GzufaPO89Hs2bfbEyuQoz7weI8m4b/jBj2hw93BeStUhDRJLjBOh7T3XfIyErWUxzLKWJ+kurgGyzqF4A1ZJHMXO
X-Gm-Message-State: AOJu0YwEF3yv/wquNVq29LVMRilD97aCQa3z/jiAfwlIs6ii2mbuPmsH
	inDvz30BcYUw16ACFtK9q702ORX9kt46XcDckQKfbWpGGHDUEBeD/5yj0Thd1Lk=
X-Google-Smtp-Source: AGHT+IGGZCHswcYDLs1QtSATkylyIC1UJHcz54PWiA9XC+0LCqDJPsD4911wb1Jx40wbuOCUR3XASw==
X-Received: by 2002:a05:6512:3706:b0:52b:be6b:d16a with SMTP id 2adb3069b0e04-52ccaa36508mr5286238e87.31.1718974293312;
        Fri, 21 Jun 2024 05:51:33 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf560627sm82273966b.148.2024.06.21.05.51.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 05:51:32 -0700 (PDT)
Message-ID: <4a693c1f-15ec-43b4-8f53-ab0a6bd4d7dc@tuxon.dev>
Date: Fri, 21 Jun 2024 15:51:28 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] i2c: riic: Add suspend/resume support
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Chris Brandt <Chris.Brandt@renesas.com>,
 "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240621112303.1607621-1-claudiu.beznea.uj@bp.renesas.com>
 <20240621112303.1607621-7-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB113468CF1B6652524A2D101D686C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB113468CF1B6652524A2D101D686C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 21.06.2024 15:30, Biju Das wrote:
> Hi Claudiu,
> 
> Thanks for the patch
> 
>> -----Original Message-----
>> From: Claudiu <claudiu.beznea@tuxon.dev>
>> Sent: Friday, June 21, 2024 12:23 PM
>> Subject: [PATCH 06/12] i2c: riic: Add suspend/resume support
>>
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Add suspend/resume support for the RIIC driver. This is necessary for the Renesas RZ/G3S SoC which
>> support suspend to deep sleep state where power to most of the SoC components is turned off. As a
>> result the I2C controller needs to be reconfigured after suspend/resume. For this, the reset line
>> was stored in the driver private data structure as well as i2c timings.
>> The reset line and I2C timings are necessary to re-initialize the controller after resume.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>  drivers/i2c/busses/i2c-riic.c | 66 +++++++++++++++++++++++++++++------
>>  1 file changed, 55 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c index
>> 00fb09786e48..f9b9e92570d8 100644
>> --- a/drivers/i2c/busses/i2c-riic.c
>> +++ b/drivers/i2c/busses/i2c-riic.c
>> @@ -105,6 +105,8 @@ struct riic_dev {
>>  	struct completion msg_done;
>>  	struct i2c_adapter adapter;
>>  	struct clk *clk;
>> +	struct reset_control *rstc;
>> +	struct i2c_timings i2c_t;
>>  };
>>
>>  struct riic_irq_desc {
>> @@ -306,11 +308,12 @@ static const struct i2c_algorithm riic_algo = {
>>  	.functionality	= riic_func,
>>  };
>>
>> -static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
>> +static int riic_init_hw(struct riic_dev *riic)
>>  {
>>  	int ret;
>>  	unsigned long rate;
>>  	int total_ticks, cks, brl, brh;
>> +	struct i2c_timings *t = &riic->i2c_t;
>>  	struct device *dev = riic->adapter.dev.parent;
>>
>>  	if (t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ) { @@ -429,8 +432,6 @@ static int
>> riic_i2c_probe(struct platform_device *pdev)
>>  	struct device *dev = &pdev->dev;
>>  	struct riic_dev *riic;
>>  	struct i2c_adapter *adap;
>> -	struct i2c_timings i2c_t;
>> -	struct reset_control *rstc;
>>  	int i, ret;
>>
>>  	riic = devm_kzalloc(dev, sizeof(*riic), GFP_KERNEL); @@ -447,16 +448,16 @@ static int
>> riic_i2c_probe(struct platform_device *pdev)
>>  		return PTR_ERR(riic->clk);
>>  	}
>>
>> -	rstc = devm_reset_control_get_optional_exclusive(dev, NULL);
>> -	if (IS_ERR(rstc))
>> -		return dev_err_probe(dev, PTR_ERR(rstc),
>> +	riic->rstc = devm_reset_control_get_optional_exclusive(dev, NULL);
>> +	if (IS_ERR(riic->rstc))
>> +		return dev_err_probe(dev, PTR_ERR(riic->rstc),
>>  				     "Error: missing reset ctrl\n");
>>
>> -	ret = reset_control_deassert(rstc);
>> +	ret = reset_control_deassert(riic->rstc);
>>  	if (ret)
>>  		return ret;
>>
>> -	ret = devm_add_action_or_reset(dev, riic_reset_control_assert, rstc);
>> +	ret = devm_add_action_or_reset(dev, riic_reset_control_assert,
>> +riic->rstc);
>>  	if (ret)
>>  		return ret;
>>
>> @@ -485,13 +486,13 @@ static int riic_i2c_probe(struct platform_device *pdev)
>>
>>  	init_completion(&riic->msg_done);
>>
>> -	i2c_parse_fw_timings(dev, &i2c_t, true);
>> +	i2c_parse_fw_timings(dev, &riic->i2c_t, true);
>>
>>  	pm_runtime_set_autosuspend_delay(dev, 0);
>>  	pm_runtime_use_autosuspend(dev);
>>  	pm_runtime_enable(dev);
>>
>> -	ret = riic_init_hw(riic, &i2c_t);
>> +	ret = riic_init_hw(riic);
>>  	if (ret)
>>  		goto out;
>>
>> @@ -501,7 +502,7 @@ static int riic_i2c_probe(struct platform_device *pdev)
>>
>>  	platform_set_drvdata(pdev, riic);
>>
>> -	dev_info(dev, "registered with %dHz bus speed\n", i2c_t.bus_freq_hz);
>> +	dev_info(dev, "registered with %dHz bus speed\n",
>> +riic->i2c_t.bus_freq_hz);
>>  	return 0;
>>
>>  out:
>> @@ -561,6 +562,48 @@ static const struct riic_of_data riic_rz_v2h_info = {
>>  	},
>>  };
>>
>> +static int riic_i2c_suspend(struct device *dev) {
>> +	struct riic_dev *riic = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	ret = pm_runtime_resume_and_get(dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	i2c_mark_adapter_suspended(&riic->adapter);
>> +
>> +	/* Disable output on SDA, SCL pins. */
>> +	riic_clear_set_bit(riic, ICCR1_ICE, 0, RIIC_ICCR1);
>> +
>> +	pm_runtime_mark_last_busy(dev);
>> +	pm_runtime_put_sync(dev);
>> +
>> +	return reset_control_assert(riic->rstc); }
>> +
>> +static int riic_i2c_resume(struct device *dev) {
>> +	struct riic_dev *riic = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	ret = reset_control_deassert(riic->rstc);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = riic_init_hw(riic);
>> +	if (ret)
>> +		return ret;
> 
> On error case we need to assert back??

Yes, it would be better as we cannot recover though other paths anymore, if
that happens.

> 
> Cheers,
> Biju
> 
>> +
>> +	i2c_mark_adapter_resumed(&riic->adapter);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct dev_pm_ops riic_i2c_pm_ops = {
>> +	SYSTEM_SLEEP_PM_OPS(riic_i2c_suspend, riic_i2c_resume) };
>> +
>>  static const struct of_device_id riic_i2c_dt_ids[] = {
>>  	{ .compatible = "renesas,riic-rz", .data = &riic_rz_a_info },
>>  	{ .compatible = "renesas,riic-r9a09g057", .data = &riic_rz_v2h_info }, @@ -573,6 +616,7 @@
>> static struct platform_driver riic_i2c_driver = {
>>  	.driver		= {
>>  		.name	= "i2c-riic",
>>  		.of_match_table = riic_i2c_dt_ids,
>> +		.pm	= pm_ptr(&riic_i2c_pm_ops),
>>  	},
>>  };
>>
>> --
>> 2.39.2
>>
> 

