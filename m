Return-Path: <linux-clk+bounces-9683-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A3D932664
	for <lists+linux-clk@lfdr.de>; Tue, 16 Jul 2024 14:17:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF285B22805
	for <lists+linux-clk@lfdr.de>; Tue, 16 Jul 2024 12:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30D7E199221;
	Tue, 16 Jul 2024 12:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="axDj7KFv"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D886617B031
	for <linux-clk@vger.kernel.org>; Tue, 16 Jul 2024 12:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721132255; cv=none; b=Z1WdzEXp8Aj5A9ihdhT/FqgKwHzf+OmYtJYA8QjzE+kqEG1k0zvI26ZhAaOx7XzDrg5aNaYBvJjBNAiOIQhfs8EYFPKWWpWNFfpRVVaGpitSRhArJXXxmKGn5kMFos/egpKsAF26AuAjiqTYXEEMiiBTVQHzOCBY1ipYzOJ03Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721132255; c=relaxed/simple;
	bh=3va6R3ZZDZxoqHLA+PQX1kiONoNUXEoXT6Gk7c/J2Ow=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=roqQ5pJ7TBTus58MAy4EvnMwCaG2jKKEkb7tqD0NTsN7MPnodBh+bP3UqQGZvJR7QhIbTJ7IiPzjkY6svhf4mR9aryV40HrFoGvUk97qIk9WHlIbPvqWnI0kl/FS/ZC6ns9g9eNtUXr+2GkVxFypwaE2cMSxCAtZmAlRcZoXoSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=axDj7KFv; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4266b1f1b21so37092305e9.1
        for <linux-clk@vger.kernel.org>; Tue, 16 Jul 2024 05:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721132249; x=1721737049; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FCyvorohijdRKm4vXZWOZPoWQcguYD1LDURxXWUj1WE=;
        b=axDj7KFvCiHQJa66XkZMsZ9cUca9/MuF/SmaiJ14Ljzzk/KGOqTbI0HiNpE0R0STUe
         4x5IPBXN5V2j/fXY6nvI1oOHJeicBdGnErY6hDTUgUlX8dJepzPUoFbl8iNjRaTtpN2p
         dhFZQZZxdX3XvqqsCNwn5Afbwr72uUBu9lfz/lMIe4uDWT/iHDM7OvIv6Hq97nrnXSka
         btoJ0Pv4WIK/y9QgVAkKOm5qinHUv0bMLkMhFyVo8cfP4LnvFKAzXuOtGON6KtWhg/IG
         /A7hF34cEnH+SbHyybBLCJ5RuC8Whh/hEbhSwtbfvUvMW98wnIP4nOmDGwhnhBW5OFuE
         Sl6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721132249; x=1721737049;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FCyvorohijdRKm4vXZWOZPoWQcguYD1LDURxXWUj1WE=;
        b=CKYRyrLKO5W8sQvouXl7FbYF/l9croe6y0PJRi9ku0Xy4/d891XGQVNVoX306Mz/dK
         0C5tFQcBV0gwMJ93t89ofZaIX9070JCKX100L6HyPeQ4RFKHzMI7sg7tA6AeR/ygmyaV
         QieGzGF4+LPYvSqfQu++EqhKFjXSh1LEACsLktjqiFcA7SeZ+RPtzHhw//9XFFq2ZuwS
         +lhPDJbueFqedFKN5aiUfC1KMZ2CnqjCuhcM2AQYPknGRQWQHQdlo0LrJeLe3kPmCczd
         r8h3yKWp749LNS2r96U+H7XkDq2lLSsVqGVz5UesufZhjy+OEphTE20xGYs1ByMUNPjE
         aC9Q==
X-Forwarded-Encrypted: i=1; AJvYcCX7SRAZPlzkotB5zODhrw7mBrTyLNQshI1RtbkQ2rjYLnsrXKhj7n43NYwwY/dEivUwk5DsoMgbUchBgZtPu1LbmIeHE+cTaUUV
X-Gm-Message-State: AOJu0YzRHdL/q3z5Ul5hH2IM25CAPmmbN3KhvRltdAYT6rk+ov1n3Z7w
	lDfOtMSVBG2gdbwubY4XWZfF7+AsKM17CAIjDdrkLS9V/4PHs36Y1i74IPyk9bI=
X-Google-Smtp-Source: AGHT+IH4yigp1gkjcQxeAeOLYjio+1QZ5295mCJAsZNF/cho9G7FBybV0wRa9cSEe7GhaXwmooof4Q==
X-Received: by 2002:a05:600c:46c9:b0:425:69b7:3361 with SMTP id 5b1f17b1804b1-427ba696a81mr12199525e9.18.1721132249171;
        Tue, 16 Jul 2024 05:17:29 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e816:4889:4177:9f12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f2cc27asm159281425e9.34.2024.07.16.05.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 05:17:28 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,  Stephen Boyd
 <sboyd@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>,
  <linux-kernel@vger.kernel.org>,  <linux-amlogic@lists.infradead.org>,
  <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 3/8] reset: amlogic: split the device and platform probe
In-Reply-To: <66ef4ff5-b472-44ee-a4fc-a68ceacea159@salutedevices.com> (Jan
	Dakinevich's message of "Tue, 16 Jul 2024 01:48:18 +0300")
References: <20240710162526.2341399-1-jbrunet@baylibre.com>
	<20240710162526.2341399-4-jbrunet@baylibre.com>
	<66ef4ff5-b472-44ee-a4fc-a68ceacea159@salutedevices.com>
Date: Tue, 16 Jul 2024 14:17:27 +0200
Message-ID: <1j34o9pm3s.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue 16 Jul 2024 at 01:48, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> On 7/10/24 19:25, Jerome Brunet wrote:
>> To prepare the addition of the auxiliary device support, split
>> out the device probe from the probe of the platform device.
>> 
>> The device probe will be common to both the platform and auxiliary
>> driver.
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/reset/reset-meson.c | 55 +++++++++++++++++++++++--------------
>>  1 file changed, 34 insertions(+), 21 deletions(-)
>> 
>> diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
>> index 59126c9f194a..fec55321b52b 100644
>> --- a/drivers/reset/reset-meson.c
>> +++ b/drivers/reset/reset-meson.c
>> @@ -87,6 +87,27 @@ static const struct reset_control_ops meson_reset_ops = {
>>  	.deassert	= meson_reset_deassert,
>>  };
>>  
>> +static int meson_reset_probe(struct device *dev, struct regmap *map,
>> +			     const struct meson_reset_param *param)
>> +{
>> +	unsigned int stride = regmap_get_reg_stride(map);
>> +	struct meson_reset *data;
>> +
>> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>> +	if (!data)
>> +		return -ENOMEM;
>> +
>> +	data->param = param;
>> +	data->map = map;
>> +	data->rcdev.owner = dev->driver->owner;
>> +	data->rcdev.nr_resets = param->reg_count * BITS_PER_BYTE
>> +		* stride;
>> +	data->rcdev.ops = &meson_reset_ops;
>> +	data->rcdev.of_node = dev->of_node;
>
> It will be good to add here something like this. Later it would help in
> reset debugging.
>
> data->rcdev.dev = dev;

That is not the purpose of this change.
I'm merely re-organizing exiting code, not changing it.

Plus, if you refering to rcdev_name(), we already populate
rcdev->of_node, so a name is provided.

>
>> +
>> +	return devm_reset_controller_register(dev, &data->rcdev);
>> +}
>> +
>>  static const struct meson_reset_param meson8b_param = {
>>  	.reg_count	= 8,
>>  	.reset_offset	= 0x0,
>> @@ -125,46 +146,38 @@ static const struct regmap_config regmap_config = {
>>  	.reg_stride = 4,
>>  };
>>  
>> -static int meson_reset_probe(struct platform_device *pdev)
>> +static int meson_reset_pltf_probe(struct platform_device *pdev)
>>  {
>> +
>> +	const struct meson_reset_param *param;
>>  	struct device *dev = &pdev->dev;
>> -	struct meson_reset *data;
>> +	struct regmap *map;
>>  	void __iomem *base;
>>  
>> -	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>> -	if (!data)
>> -		return -ENOMEM;
>> -
>>  	base = devm_platform_ioremap_resource(pdev, 0);
>>  	if (IS_ERR(base))
>>  		return PTR_ERR(base);
>>  
>> -	data->param = of_device_get_match_data(dev);
>> -	if (!data->param)
>> +	param = of_device_get_match_data(dev);
>> +	if (!param)
>>  		return -ENODEV;
>>  
>> -	data->map = devm_regmap_init_mmio(dev, base, &regmap_config);
>> -	if (IS_ERR(data->map))
>> -		return dev_err_probe(dev, PTR_ERR(data->map),
>> +	map = devm_regmap_init_mmio(dev, base, &regmap_config);
>> +	if (IS_ERR(map))
>> +		return dev_err_probe(dev, PTR_ERR(map),
>>  				     "can't init regmap mmio region\n");
>>  
>> -	data->rcdev.owner = THIS_MODULE;
>> -	data->rcdev.nr_resets = data->param->reg_count * BITS_PER_BYTE
>> -		* regmap_config.reg_stride;
>> -	data->rcdev.ops = &meson_reset_ops;
>> -	data->rcdev.of_node = dev->of_node;
>> -
>> -	return devm_reset_controller_register(dev, &data->rcdev);
>> +	return meson_reset_probe(dev, map, param);
>>  }
>>  
>> -static struct platform_driver meson_reset_driver = {
>> -	.probe	= meson_reset_probe,
>> +static struct platform_driver meson_reset_pltf_driver = {
>> +	.probe	= meson_reset_pltf_probe,
>>  	.driver = {
>>  		.name		= "meson_reset",
>>  		.of_match_table	= meson_reset_dt_ids,
>>  	},
>>  };
>> -module_platform_driver(meson_reset_driver);
>> +module_platform_driver(meson_reset_pltf_driver);
>>  
>>  MODULE_DESCRIPTION("Amlogic Meson Reset Controller driver");
>>  MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");

-- 
Jerome

