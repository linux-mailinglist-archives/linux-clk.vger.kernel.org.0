Return-Path: <linux-clk+bounces-8809-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5393591B997
	for <lists+linux-clk@lfdr.de>; Fri, 28 Jun 2024 10:13:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07DCF1F20FD9
	for <lists+linux-clk@lfdr.de>; Fri, 28 Jun 2024 08:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77ADF14373A;
	Fri, 28 Jun 2024 08:13:50 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476F279F2;
	Fri, 28 Jun 2024 08:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719562430; cv=none; b=lTRueV0yfYHZkeXeaXH1dUs90jmXD34vSPTPulpN3/QyiezfsEP/GLKcZkJhISj0dLWZsMXEyqXvjd0w07xqHP/p83pQ4QQwYdb9GfOVUEahPyIXhgjb2S5f5BUta2mpzQbnBCyD+SHVV954DpHcPw5upcNAfsFlCqXrVkNgoNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719562430; c=relaxed/simple;
	bh=tJeWcjDdgCOFLM/KUzyBopTlFKoW7JsKxlQG8SfkSb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TYqj54BlS9j2rr3qtz+CDxoMfBWi3E+qCjxioW5/88jqrxkUTPlVgrtoUBtBknt2QVy3EJ1+LGcPYV7oefuqb7GpdzYShiSSb2ecLlMJwZJDJJJB2nvv8AkHd58alkZllpz8i+boX/KeU8oiXicKQcLCLQhoMymVPNvdMyObA+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875b6a.versanet.de ([83.135.91.106] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sN6jh-00027A-Kl; Fri, 28 Jun 2024 10:13:37 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Johan Jonker <jbx6244@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v1] dt-bindings: clock: rk3188-cru-common: remove CLK_NR_CLKS
Date: Fri, 28 Jun 2024 10:13:35 +0200
Message-ID: <2016066.NnIJQXNAa5@diego>
In-Reply-To: <d8df3cd5-c602-4693-b78a-63a963aa6522@kernel.org>
References:
 <6f21c09b-e8d2-4749-aca6-572c79df775d@gmail.com>
 <d8df3cd5-c602-4693-b78a-63a963aa6522@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Krzysztof,

Am Freitag, 28. Juni 2024, 09:27:14 CEST schrieb Krzysztof Kozlowski:
> On 27/06/2024 23:17, Johan Jonker wrote:
> > CLK_NR_CLKS should not be part of the binding.
> > Remove since the kernel code no longer uses it.
> 
> Please wrap neither too early nor over the limit. Not one sentence per line.
> 
> 
> 
> > 
> > Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> > ---
> >  include/dt-bindings/clock/rk3188-cru-common.h | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/include/dt-bindings/clock/rk3188-cru-common.h b/include/dt-bindings/clock/rk3188-cru-common.h
> > index afad90680fce..01e14ab252a7 100644
> > --- a/include/dt-bindings/clock/rk3188-cru-common.h
> > +++ b/include/dt-bindings/clock/rk3188-cru-common.h
> > @@ -132,8 +132,6 @@
> >  #define HCLK_VDPU		472
> >  #define HCLK_HDMI		473
> > 
> > -#define CLK_NR_CLKS		(HCLK_HDMI + 1)
> 
> I still see it as being used in linux-next. Some explanation is missing.

I think me applying Johan's patch [0] removing the constant's usage, simply
overlapped with yesterday's next-creation.



[0] https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/commit/?h=for-next&id=ec2265dc91307622e43a7d602c3ea425da6f5de1



