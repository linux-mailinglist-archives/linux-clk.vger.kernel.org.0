Return-Path: <linux-clk+bounces-2096-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7236C82452B
	for <lists+linux-clk@lfdr.de>; Thu,  4 Jan 2024 16:41:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E9A41C21F4C
	for <lists+linux-clk@lfdr.de>; Thu,  4 Jan 2024 15:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE7924210;
	Thu,  4 Jan 2024 15:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sczJVuWo"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A31124207
	for <linux-clk@vger.kernel.org>; Thu,  4 Jan 2024 15:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a28d25253d2so72560966b.0
        for <linux-clk@vger.kernel.org>; Thu, 04 Jan 2024 07:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704382891; x=1704987691; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F7/ShbpEf54yAHHl4FpslzJHf7YewK4v2kQSkVZU+B4=;
        b=sczJVuWo22scTW0OzGAoAX0PBt16+MkVIMR4nN3OaE3+AoSnpO4HKdFpGWINe13jrK
         ziYPu4yBpgnEV0QLX8sjyXVW1det+AGO6K8TWccQNL50A+ySoRpEui9bmUf/g3UB+3WS
         9HJY2gHtJdEqZoW/FNMZTqetYt2Fq8TdOVHdMff1Xm8vhelUAW6kVIVChhJHdDKo4xgp
         W9OREhYs7SIoQw7N3yEBMkuliQArACRKbdjuutr5dPDyzk4J0DKOZcELOdx2TDAhsSCh
         nr9khGz5XoXwf0TOyoycQP3WVLKv6AvYsS6VopvonvWdN0oysriAdPOhlAiJu3zyF4Fv
         b8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704382891; x=1704987691;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F7/ShbpEf54yAHHl4FpslzJHf7YewK4v2kQSkVZU+B4=;
        b=O881JO7k/wTZixCBkHVT9HQoKOWEMEHxfiKEMfhx1Ye1K5E75HPPqKWC2Ae0r8zpxe
         z8KbAqlnjaZVa/LHQtPZ6tMADZMUjo+Ngs1jW5GrTZ2gse3a4VW6cf+CC/p3CN/2JfYA
         r3FC6Tyo41xdhRYEIoOuq3s7lyDX00e9b8YDH5bPJlSyF8u7gk5p+mjoOd6GcCv6DxQ2
         V9xx9KgIclUUtwO5TmWYHSy0ZBxjYUqB5CoEf86hTfOMKKiwA79FCbiFFXCibEnQMRv3
         NB1Whi9V22Zf/yob4rhuSJ35ZVA2P9CQttV+RQj21nuc1kz/GK2X0duwKcxCBJ1LCsMI
         zspA==
X-Gm-Message-State: AOJu0Yy4uWJY+76MGW4aphAxYcqJE/IVUfQgXn3Z2MWrdISja/1vWk0T
	6/SRAPRjmRDl9Ozw8norJw45qWFeYyaHAQ==
X-Google-Smtp-Source: AGHT+IEah0e7M2KrNungIWa3+GEmC8D68fB1t4UAkc0BcqWffzA+XwCkKbcFVX1Hg/VoQkLod6TmbQ==
X-Received: by 2002:a17:906:3a09:b0:a26:a245:9cef with SMTP id z9-20020a1709063a0900b00a26a2459cefmr351361eje.64.1704382891320;
        Thu, 04 Jan 2024 07:41:31 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id c15-20020a170906d18f00b00a28ba0c3821sm1132678ejz.101.2024.01.04.07.41.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jan 2024 07:41:30 -0800 (PST)
Message-ID: <a3a9df6a-4270-4076-9e9b-ce2fc7284d54@linaro.org>
Date: Thu, 4 Jan 2024 15:41:28 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] tty: serial: samsung: prepare for different IO
 types
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: peter.griffin@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 sboyd@kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org,
 alim.akhtar@samsung.com, jirislaby@kernel.org, s.nawrocki@samsung.com,
 tomasz.figa@gmail.com, cw00.choi@samsung.com, arnd@arndb.de,
 semen.protsenko@linaro.org, andre.draszik@linaro.org, saravanak@google.com,
 willmcvicker@google.com, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
 kernel-team@android.com
References: <20231228125805.661725-1-tudor.ambarus@linaro.org>
 <20231228125805.661725-5-tudor.ambarus@linaro.org>
 <2024010432-taco-moneyless-53e2@gregkh>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <2024010432-taco-moneyless-53e2@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/4/24 15:32, Greg KH wrote:
> On Thu, Dec 28, 2023 at 12:57:57PM +0000, Tudor Ambarus wrote:
>> GS101's Connectivity Peripheral blocks (peric0/1 blocks) which
>> include the I3C and USI (I2C, SPI, UART) only allow 32-bit
>> register accesses. If using 8-bit register accesses, a SError
>> Interrupt is raised causing the system unusable.
>>
>> Instead of specifying the reg-io-width = 4 everywhere, for each node,
>> the requirement should be deduced from the compatible.
>>
>> Prepare the samsung tty driver to allow IO types different than
>> UPIO_MEM. ``struct uart_port::iotype`` is an unsigned char where all
>> its 8 bits are exposed to uapi. We can't make NULL checks on it to
>> verify if it's set, thus always set it from the driver's data.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>> v2: new patch
>>
>>  drivers/tty/serial/samsung_tty.c | 9 ++++++++-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
>> index 66bd6c090ace..97ce4b2424af 100644
>> --- a/drivers/tty/serial/samsung_tty.c
>> +++ b/drivers/tty/serial/samsung_tty.c
>> @@ -72,6 +72,7 @@ struct s3c24xx_uart_info {
>>  	const char		*name;
>>  	enum s3c24xx_port_type	type;
>>  	unsigned int		port_type;
>> +	unsigned char		iotype;
>>  	unsigned int		fifosize;
>>  	unsigned long		rx_fifomask;
>>  	unsigned long		rx_fifoshift;
> 
> Is there a reason you are trying to add unused memory spaces to this
> structure for no valid reason?  I don't think you could have picked a
> more incorrect place in there to add this :)
> 
> Please fix.
> 

Will put it after "const char *name".
Thanks,
ta

