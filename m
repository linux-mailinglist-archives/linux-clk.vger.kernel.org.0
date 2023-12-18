Return-Path: <linux-clk+bounces-1609-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C57816AC0
	for <lists+linux-clk@lfdr.de>; Mon, 18 Dec 2023 11:16:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F12C281C3B
	for <lists+linux-clk@lfdr.de>; Mon, 18 Dec 2023 10:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF12913AEE;
	Mon, 18 Dec 2023 10:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aqKKm6Rq"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED6C134DF
	for <linux-clk@vger.kernel.org>; Mon, 18 Dec 2023 10:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a2366012348so18796866b.0
        for <linux-clk@vger.kernel.org>; Mon, 18 Dec 2023 02:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702894586; x=1703499386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6T4R9okteCkjAhT9eyRdC/jbk1c6KtuDD/NaJ+LcB1s=;
        b=aqKKm6Rqq8AP1UhsVlg4K0AaN30so0Zd1LW30XR+FlqwCzhCA4W0NuCaau9K4rmKfH
         KXc7mgb7W9I5v61ejxV+MWkawJao1O6V5ZaEvk9PwU3Yc/LeiIyonZjkKn36pNRPWrat
         azYaP+1DP5G1JDjKDl4FmCwZB/OR+CTc8+zd3Btm6AiHeuUugA8Z7srzru3mj156yOmQ
         6nDjLrKfOiiYamV+Dy/h1I4Mpaq4tku1xVvoDNGMTTWFou64mcDa1WccB2+3zbYB8mBh
         bdssQaVFOs90G1aPTlh7axh6kayrsJP3kG2UPXibJAweZBMZp1UAqy+lNp3Xtf++CQr8
         M/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702894586; x=1703499386;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6T4R9okteCkjAhT9eyRdC/jbk1c6KtuDD/NaJ+LcB1s=;
        b=F+0DicdgAClY4cCO8ZzYeapWzscUGHjyyYxEmI9s4jPuKd8UozG/RAWvFplR9aSmDi
         YCzNxRCHdLg5zCDOzIXAICn2IrJRo+Zr0D2MRZ+bCEWmPdW2fRwY4trol8XM5rBek6vQ
         ZTA/DTYo5XBTllzLpviU9WFUHnDinteF4u40XXDWaCgfZ2fu3uJc4DPhaxaqHkFnXeOF
         0uZan4xiLsjQJQuGHUrf5IpCfzBBeYabhMZuN8q9RA3w/7T0xODfKxmrldhPYEoym5Su
         OeXMY6AmwxMhx7avp7TAZM6bH5zGPDArHUDMf+i///grAfWXxgicYthiKSwa0pl2NopW
         wE7g==
X-Gm-Message-State: AOJu0Yyjjhvkwjofap4GX6vwMPd3PRX7xgM8Pme1jWubS2ZEl92WPj43
	S2C9YR8vgjFbROmSdZsiSwlocg==
X-Google-Smtp-Source: AGHT+IHC5w0LaR0hZtZGoebFzWjvqDk4jLHPlKNUseyRe6YfHh7xV+cN4HpsENl4UBR0EZTA8NFZ8Q==
X-Received: by 2002:a17:906:54f:b0:a23:5bfc:edf6 with SMTP id k15-20020a170906054f00b00a235bfcedf6mr531086eja.73.1702894586619;
        Mon, 18 Dec 2023 02:16:26 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id tb21-20020a1709078b9500b009ad89697c86sm14131552ejc.144.2023.12.18.02.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 02:16:25 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231218101225.27637-1-lukas.bulwahn@gmail.com>
References: <20231218101225.27637-1-lukas.bulwahn@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: adjust file entry in GOOGLE TENSOR SoC
 SUPPORT
Message-Id: <170289458489.40214.4044639674573718307.b4-ty@linaro.org>
Date: Mon, 18 Dec 2023 11:16:24 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Mon, 18 Dec 2023 11:12:25 +0100, Lukas Bulwahn wrote:
> Commit 0a910f160638 ("dt-bindings: clock: Add Google gs101 clock
> management unit bindings") adds the file google,gs101.h in
> include/dt-bindings/clock/. However, commit 9d71df3e6eb7 ("MAINTAINERS:
> add entry for Google Tensor SoC") wrongly refers to the file
> google,clk-gs101.h in that directory.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
> broken reference.
> 
> [...]

Applied, thanks!

[1/1] MAINTAINERS: adjust file entry in GOOGLE TENSOR SoC SUPPORT
      https://git.kernel.org/krzk/linux/c/d0da0de31e1d50ff905eb8f095628eea666f8c67

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


