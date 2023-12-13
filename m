Return-Path: <linux-clk+bounces-1352-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 371D3811EA2
	for <lists+linux-clk@lfdr.de>; Wed, 13 Dec 2023 20:16:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A8F81C2141B
	for <lists+linux-clk@lfdr.de>; Wed, 13 Dec 2023 19:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D085D68269;
	Wed, 13 Dec 2023 19:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sAb05010"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDCF5DC
	for <linux-clk@vger.kernel.org>; Wed, 13 Dec 2023 11:16:33 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-50bfa7f7093so9487979e87.0
        for <linux-clk@vger.kernel.org>; Wed, 13 Dec 2023 11:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702494992; x=1703099792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fxr+fjlAkMW1BoUJOkEvhkSbaf/iRruRVLO4t551dxY=;
        b=sAb05010NwRzNJQLWeUpuaZTGB0Nao9mmLkWQm3J1nuMoCjuvqnwv0WAl7ArwAHRa8
         1t0JoPLk0w4GISQR8aPNl7LhYbSaQOCtcEFB9oci7jI25uh0SHVKQLOf3zmao1oM1cYX
         UVjcl2xZUgA9cHiI6Sm9RC86ajvsPDxnjWnVIuAcMsnnSlU9AVGk9RvbHBga+tZBDjxC
         MNhbrRFZe+fLLzBsWt/pEBHlgF2NtuSad3JQQXkreFCfXy3Pi6XmsY0mQNh419nbcJg/
         bikk3V3Ug4KvxnTrciOe0xTfc3Y4kKBW7hvh/Z06lvw6kqUJ8Bpff+xbIfD14iI9lfkQ
         E/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702494992; x=1703099792;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fxr+fjlAkMW1BoUJOkEvhkSbaf/iRruRVLO4t551dxY=;
        b=H3fbMbXuiuAelaWIB3nS0EQZxVmoEk2mORZfjGoDEIcg/6uD46PyIYjxZm2qsGIS15
         p/a7UqK3Dgix/2Gcwni+ta5xORNne8b8/OdeZGVyD6Z3qRvWNRF/rN/ZN6Si4J0UEeCz
         SFw6Cy0eJjv4JPNz5lhw9V1uBTrzVwlD/H9SH4ztDSxYPcgAiVUw56Lz6AoNAU/ugRLJ
         w8NId5l2kAZRXJxC2BNqLHZzkDwlZW+3zRnmCec9fIjukPcp01pz48TUYWFUACzZvSEB
         z23ct287zySjuRYZWS24FpR8GOwKNu9+FPjlyxJqhexjgSUM/33rlijqyopv4rqEAN7w
         YwZQ==
X-Gm-Message-State: AOJu0YwTcFuQvs4fNQ60tUDQaprXFV7/100/JlHiUoij9e1Mj2wWDL0D
	/v1JdFurBVx/biC2RBmqg5SDrQ==
X-Google-Smtp-Source: AGHT+IH7A7P8cAat4Pmc2C5Ik3HbVVkGH1myXeoFgv50CExTJyQx5Ka2M3v3P34rdn6oHqbjrqU7Rw==
X-Received: by 2002:a2e:8447:0:b0:2c9:f68f:541f with SMTP id u7-20020a2e8447000000b002c9f68f541fmr3880477ljh.10.1702494992083;
        Wed, 13 Dec 2023 11:16:32 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id v12-20020a05600c470c00b0040b37f107c4sm20190085wmo.16.2023.12.13.11.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 11:16:31 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
 tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
 wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
 will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
 jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
 semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com, 
 soc@kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, kernel-team@android.com, 
 linux-serial@vger.kernel.org
In-Reply-To: <20231211162331.435900-17-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org>
 <20231211162331.435900-17-peter.griffin@linaro.org>
Subject: Re: (subset) [PATCH v7 16/16] MAINTAINERS: add entry for Google
 Tensor SoC
Message-Id: <170249498967.308886.12609033691141279701.b4-ty@linaro.org>
Date: Wed, 13 Dec 2023 20:16:29 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Mon, 11 Dec 2023 16:23:31 +0000, Peter Griffin wrote:
> Add maintainers entry for the Google tensor SoC based
> platforms.
> 
> 

Applied, thanks!

[16/16] MAINTAINERS: add entry for Google Tensor SoC
        https://git.kernel.org/krzk/linux/c/9d71df3e6eb773f23d6f1f3f8790bae6aba1a088

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


