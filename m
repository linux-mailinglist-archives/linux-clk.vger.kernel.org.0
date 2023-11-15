Return-Path: <linux-clk+bounces-90-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E37137E7479
	for <lists+linux-clk@lfdr.de>; Thu,  9 Nov 2023 23:42:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 457B52812BE
	for <lists+linux-clk@lfdr.de>; Thu,  9 Nov 2023 22:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 945071DDE2;
	Thu,  9 Nov 2023 22:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="2L4JpmeS"
X-Original-To: linux-clk@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70941C684
	for <linux-clk@vger.kernel.org>; Thu,  9 Nov 2023 22:42:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5086C4206;
	Thu,  9 Nov 2023 14:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=nlxtm8iPjIlU6MpliGoSH8MTvH0ZUVGjRXOD+O+7QtQ=; b=2L4JpmeSdAm2UL2l6hsrZkpXgB
	ILdYhYoiutv77BSZkY7wr4cSyaoH3ZvCisq52HcdTdz6+YgcWUIuV9doQzOBKmIX6XUlqnd68+G/V
	EfHzJ/emt9tgkUOkgYROqzKc7RCazIrPBQptgsV5nf7VOU7MVgYwXbQ8JQ6ts+/ErCB7bha2Vnq8I
	4ScN3wcvdsWvqFTr7tQ7ufJe/tLk/SziJfXEwr5E7lLsGjGezB3Lju91HZ1eixAAUvZR+/FuSKBox
	m7rwiG0howk7jsghlneEqtMdBDD088WCIeJbgOBcYLr7GaiBc/edb9uxn3SMoiRxyNGJyI18QrMQj
	LUngoBqQ==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1r1DjJ-007Md1-0j;
	Thu, 09 Nov 2023 22:42:29 +0000
Message-ID: <cc37a0a9-8329-4b46-9349-e36844092e0b@infradead.org>
Date: Thu, 9 Nov 2023 14:42:28 -0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: samsung: Improve kernel-doc comments
Content-Language: en-US
To: Sam Protsenko <semen.protsenko@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231109190925.2066-1-semen.protsenko@linaro.org>
 <20231109190925.2066-2-semen.protsenko@linaro.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231109190925.2066-2-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/9/23 11:09, Sam Protsenko wrote:
> Unify and improve the style of kernel-doc comments in Samsung CCF
> framework. Resemble more idiomatic style described in [1] and commonly
> used throughout most of the kernel code.
> 
> [1] Documentation/doc-guide/kernel-doc.rst
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  drivers/clk/samsung/clk-cpu.h |  30 +++----
>  drivers/clk/samsung/clk.h     | 158 ++++++++++++++++++----------------
>  2 files changed, 100 insertions(+), 88 deletions(-)
> 

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

thanks.

-- 
~Randy

