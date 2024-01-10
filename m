Return-Path: <linux-clk+bounces-2188-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE0F82732A
	for <lists+linux-clk@lfdr.de>; Mon,  8 Jan 2024 16:31:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8B741C22908
	for <lists+linux-clk@lfdr.de>; Mon,  8 Jan 2024 15:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED1C151C4D;
	Mon,  8 Jan 2024 15:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lY+6josP"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FA4524BA
	for <linux-clk@vger.kernel.org>; Mon,  8 Jan 2024 15:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7831be84f4eso136993385a.0
        for <linux-clk@vger.kernel.org>; Mon, 08 Jan 2024 07:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704727812; x=1705332612; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Yzw/cgm0NqSiQjobJ8Qq3PX7WH99Q7opW3VxmOxNOVc=;
        b=lY+6josP6BMPTp4bR4tvGbsOd6mdEgpAadcly5LWlQadAqv6cgoWlDr1tW6WjcSzx4
         8LJjvz5HGluFQ0FN41mX1Yp5TllNoVBMfmkk8vVk1uRD0eFdE1CRQlLww8khbgECZT/M
         ZUe0pUl94wXOhjV3ZRpGVvXnQRpAHuflMTF+doZODKjId3G5F+kngjf/2VEnqb+LSsw2
         qdXpPL+y5mI+XhilGbmtg1lBd5A8ZM39V6Y8F52TAmkTAnU88dA4fHiukhCxpZ/wBo4O
         pXzLM6jfTQnIXtur4UnVsr/B0980TDais4VYwzfJJ7LH/7gT10mysYfvkpYKTS6oQWv7
         3Hng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704727812; x=1705332612;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yzw/cgm0NqSiQjobJ8Qq3PX7WH99Q7opW3VxmOxNOVc=;
        b=KNBTI40P5PtuWOdf7WUVoniC95PxAUprSTeru7vk6VgmPOXdRkwf9NjHT55tq+wtrL
         U/hx55kL91hUNBaXJeYvRWgbgxGdk5msi+oQwWRRfCb8a5sMJUf620rnVzQMcp5ggxPG
         t0iJ4hYjgbMyfIcs584Sk/hqBi3hXVoZz8BRQch6irw1jlJNa1cvjhmIeE/7KWX1Ad3Q
         YtkcUjz795iDcnyfiXn5VE/SDU6KZmfl0uQipVj/d6W25fpj0pXbqMkMxMOSgrjOOsAR
         N8UkZTuGKuFNIhk7I/ABlnckicCgu3O+D9qQcd/4roj0tyoYnmvIaj1MJP8Js7Ki1Tvs
         gsMg==
X-Gm-Message-State: AOJu0Ywh0jNDpB2KgCA6NxWglv95pJYSuO3qbZM42DOEziqqjd+Uewwa
	iBqCxuJ8p2iqqb3Tn2Z8V3lIip0XUH8gtnCvz4gRFS89+7O57A==
X-Google-Smtp-Source: AGHT+IFYKrhFgbRYAiEyPYoqEve1qSR2GT6wdqvLM/UdItQ5yRGST7HVQm+lQQheC7taXe1ZY76iPAlFAoLAEnpj6vY=
X-Received: by 2002:a05:6214:1302:b0:67a:96c7:4c90 with SMTP id
 pn2-20020a056214130200b0067a96c74c90mr4913500qvb.38.1704727812403; Mon, 08
 Jan 2024 07:30:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231228125805.661725-1-tudor.ambarus@linaro.org> <20231228125805.661725-9-tudor.ambarus@linaro.org>
In-Reply-To: <20231228125805.661725-9-tudor.ambarus@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 8 Jan 2024 15:30:00 +0000
Message-ID: <CADrjBPoBPrQh+73eqk_oc0VXFqJrLhY+BH4m9dFN=65QnpB4DA@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] arm64: dts: exynos: gs101: remove reg-io-width
 from serial
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, sboyd@kernel.org, conor+dt@kernel.org, 
	andi.shyti@kernel.org, alim.akhtar@samsung.com, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com, 
	cw00.choi@samsung.com, arnd@arndb.de, semen.protsenko@linaro.org, 
	andre.draszik@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-serial@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

Hi Tudor,

On Thu, 28 Dec 2023 at 12:58, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> Remove the reg-io-width property in order to comply with the bindings.
>
> The entire bus (PERIC) on which the GS101 serial resides only allows
> 32-bit register accesses. The reg-io-width dt property is disallowed
> for the "google,gs101-uart" compatible and instead the iotype is
> inferred from the compatible.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

