Return-Path: <linux-clk+bounces-9181-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA98928328
	for <lists+linux-clk@lfdr.de>; Fri,  5 Jul 2024 09:52:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 724521C220D6
	for <lists+linux-clk@lfdr.de>; Fri,  5 Jul 2024 07:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E9331448C6;
	Fri,  5 Jul 2024 07:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ZmHU9K3s"
X-Original-To: linux-clk@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1E51411FD
	for <linux-clk@vger.kernel.org>; Fri,  5 Jul 2024 07:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720165844; cv=none; b=OG1EBHbZvAB2osUQjPN4QgTwdXt7UPmcFjJ02bOsxAMLlsHOWrqziRZzs1rPtClHNj6xDqQSvuqpLDPpsmgw3hob2+WWzO6wFjRzwWQqFud0eCW+qzwj0HOKonX+p6162/Efc3o9XbE4AwFY3Y5YoEGemNt24QsXE6ACA99ZC6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720165844; c=relaxed/simple;
	bh=MMVTLAVubIbYiEHwabXP4l+cQEWDqi9C2DuEC2dIrVc=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=TwN5mtKjrqbjYwEYz7H42w4fNc6CCiP7vuCteuUIE+wKV3uvMCkDn5CRbCY0z/pQIGWDaUq3p3uYD8SCpR4pGKFU7ug+k9m0ZY3PlveYTA9fYGNc77OMHMA/utlbIuFGZR63hmEoeqZbIduUbZ8JKCBRjKtvm+Ubu8K7GHH2rmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ZmHU9K3s; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20240705075039epoutp045eb12782088c21326ea625ec57fdbc03~fQbeCmpRK0264502645epoutp04Y
	for <linux-clk@vger.kernel.org>; Fri,  5 Jul 2024 07:50:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20240705075039epoutp045eb12782088c21326ea625ec57fdbc03~fQbeCmpRK0264502645epoutp04Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1720165839;
	bh=csMb2MY47N1/AKiDIqhcJHPOZbKTKiqWJQiltE8sVvg=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=ZmHU9K3sbqhjO1fn+KG9DGpahI/ROB6MAyDeqDAm4f4BrqqNtCqxYhIV+TBe2Yn4f
	 FAAE2vIYlWjFQoM3gjh37D+HIfcbPJKyNEonAritSEkHqzh1og038cpi8bwxLgQeTt
	 McMSEiEcuoFZJ0h7tt2Gwvb9fGw8xVN3FkYioX8Q=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20240705075038epcas2p411a2d139c67266058eb7b4928e1714bd~fQbdlGY1L2856628566epcas2p4A;
	Fri,  5 Jul 2024 07:50:38 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.90]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4WFm0G241Gz4x9Pr; Fri,  5 Jul
	2024 07:50:38 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	05.CA.09806.EC5A7866; Fri,  5 Jul 2024 16:50:38 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20240705075037epcas2p2b25139952de4e4ec5582d2942024c6d2~fQbcXaIKk2847628476epcas2p2Z;
	Fri,  5 Jul 2024 07:50:37 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240705075037epsmtrp2807a1b8b494f8b913682028e7efacc16~fQbcWnp7R0839308393epsmtrp2_;
	Fri,  5 Jul 2024 07:50:37 +0000 (GMT)
X-AuditID: b6c32a47-c6bff7000000264e-a8-6687a5ceb545
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	60.1C.29940.DC5A7866; Fri,  5 Jul 2024 16:50:37 +0900 (KST)
Received: from KORCO118965 (unknown [10.229.18.201]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20240705075037epsmtip16a1929880f30fdc922968a609b0a2d01~fQbcHTMDT2267022670epsmtip1U;
	Fri,  5 Jul 2024 07:50:37 +0000 (GMT)
From: "sunyeal.hong" <sunyeal.hong@samsung.com>
To: "'Jaewon Kim'" <jaewon02.kim@samsung.com>, "'Krzysztof Kozlowski'"
	<krzk@kernel.org>, "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
	"'Chanwoo Choi'" <cw00.choi@samsung.com>, "'Alim Akhtar'"
	<alim.akhtar@samsung.com>, "'Michael	Turquette'" <mturquette@baylibre.com>,
	"'Stephen Boyd'" <sboyd@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <494ac55c-7bd0-79a9-8a56-21aaf0611f81@samsung.com>
Subject: RE: [PATCH 2/5] dt-bindings: clock: add clock binding definitions
 for Exynos Auto v920
Date: Fri, 5 Jul 2024 16:50:36 +0900
Message-ID: <01b801daceb0$05dd0df0$119729d0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIPebKt0SL2hL1PGxWEYogtVpy49QFdVAxIAswtgRoCP1wtuLFLJS1A
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAJsWRmVeSWpSXmKPExsWy7bCmqe65pe1pBhe6eSwezNvGZnH9y3NW
	ix0NR1gtzp/fwG7xseceq8XlXXPYLGac38dkcfGUq8XhN+2sFv+ubWRx4PJ4f6OV3WPTqk42
	j74tqxg9Pm+SC2CJyrbJSE1MSS1SSM1Lzk/JzEu3VfIOjneONzUzMNQ1tLQwV1LIS8xNtVVy
	8QnQdcvMAbpHSaEsMacUKBSQWFyspG9nU5RfWpKqkJFfXGKrlFqQklNgXqBXnJhbXJqXrpeX
	WmJlaGBgZApUmJCdMf/OCfaCxXwVu7b9ZW5gvMzdxcjJISFgIjGhbyJrFyMXh5DADkaJTWdn
	soMkhAQ+MUr8u20NkfjGKLFiyVQ2mI6Tl5sZIRJ7GSWmtH1ig3BeMkrMeD+dEaSKTUBfYnX3
	bbAOEYE9TBIL3taD2MwCaRIrTm0BW8EpYC/RducFC4gtLJAoMf3DFFYQm0VAReLOlxlgcV4B
	S4mna7cwQ9iCEidnPmGBmCMvsf3tHGaIixQkfj5dxgqxy01i/7J7bBA1IhKzO9uYQY6TEFjK
	ITFl2z8WiAYXif6t/6CahSVeHYc4SEJASuLzu71Qb+ZLTL7+lgmiuYFR4tq/bqgGe4lFZ34C
	NXAAbdCUWL9LH8SUEFCWOHIL6jY+iY7Df9khwrwSHW1CEI1qEp+uXIYaIiNx7MQz5gmMSrOQ
	fDYLyWezkHwwC2HXAkaWVYxiqQXFuempxUYFxvDITs7P3cQITqpa7jsYZ7z9oHeIkYmD8RCj
	BAezkgiv1PvmNCHelMTKqtSi/Pii0pzU4kOMpsCwnsgsJZqcD0zreSXxhiaWBiZmZobmRqYG
	5krivPda56YICaQnlqRmp6YWpBbB9DFxcEo1MMV927hr8unQ6arHb7zfcbBuybyVhyqZBGOO
	sl7fbKO8VUDk2qvzbpt7K27znfq14/ycbfw8ZsWHOXmW/m+eKxW/I+6f+Ed1+3N5Hpcv6RmH
	J0674W4ZeMZdcBfbhn3P74TOXHaaNVzdZ+evC7f45izpSN9VxLHE3ypVVmhTzIdDW/i5Xhz9
	bfN/89OyFmO5njWz0pfoTQu6OLu9uT166eHzb2xPTn7jmb15R5h2f+IKha1OS6akvaz9oywk
	ZCLXq9j+ZPrU7ze35szPfKBy8+nybM9C7cdTHy8UbHuq7bf9heqmpRm9mT8uXc4MSv2sc3XD
	l3XOIV+FT6h8vj47MvdrVdQsV60Hhuu/z3leryldq8RSnJFoqMVcVJwIALPc5f0zBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeLIzCtJLcpLzFFi42LZdlhJTvfs0vY0g12fOC0ezNvGZnH9y3NW
	ix0NR1gtzp/fwG7xseceq8XlXXPYLGac38dkcfGUq8XhN+2sFv+ubWRx4PJ4f6OV3WPTqk42
	j74tqxg9Pm+SC2CJ4rJJSc3JLEst0rdL4MqYf+cEe8Fivopd2/4yNzBe5u5i5OSQEDCROHm5
	mbGLkYtDSGA3o8T5/guMEAkZiY0N/9khbGGJ+y1HWCGKnjNKbP+3nAkkwSagL7G6+zYbSEJE
	4ACTxLMze5lBEswCGRKHrr1ng+j4wSjx48tBFpAEp4C9RNudF0A2B4ewQLxE71N7kDCLgIrE
	nS8zwEp4BSwlnq7dwgxhC0qcnPmEBWKmtsTTm0+hbHmJ7W/nMENcpyDx8+kyVhBbRMBNYv+y
	e2wQNSISszvbmCcwCs9CMmoWklGzkIyahaRlASPLKkbJ1ILi3PTcYsMCw7zUcr3ixNzi0rx0
	veT83E2M4BjT0tzBuH3VB71DjEwcjIcYJTiYlUR4pd43pwnxpiRWVqUW5ccXleakFh9ilOZg
	URLnFX/RmyIkkJ5YkpqdmlqQWgSTZeLglGpgmvfmcZhWzMtG37BH+qws6VfPbLp4/qPNDt6q
	m4dlCj3cE97f25r4Z1pvY+KKrfOX/p7T2GYadeJnlqDXDA+ta7k5Rzefi5u8+36Pwf67cvfy
	/v1eWVt3K0xcqrL17LNkr/1p4pc1n+xfkdMyteJRsY5/dt79pp+hazj+BES/vXxqQrpYrLx6
	mq5UxpyQoI91D4OebZNJKWEPnluS/mKB7KbFSzwyAxgfab4qOCjhHXA4OqJdx9zCNb7lc2dY
	366VlywsGA/vc/lRsHF72TKWWr9fEXkJNe5XPqk8+dF4xOWoweQ7Lxv67Q+qOvGzhj2Y+H3t
	jNdv5u3u+F8Wu/Ouy+3JzJs/b+uoqJotWnSqUYmlOCPRUIu5qDgRAKWFqzcgAwAA
X-CMS-MailID: 20240705075037epcas2p2b25139952de4e4ec5582d2942024c6d2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240705021200epcas2p273ca089c2cb9882f121e864ec8407367
References: <20240705021110.2495344-1-sunyeal.hong@samsung.com>
	<CGME20240705021200epcas2p273ca089c2cb9882f121e864ec8407367@epcas2p2.samsung.com>
	<20240705021110.2495344-3-sunyeal.hong@samsung.com>
	<494ac55c-7bd0-79a9-8a56-21aaf0611f81@samsung.com>

Hello Jaewon,

> -----Original Message-----
> From: Jaewon Kim <jaewon02.kim@samsung.com>
> Sent: Friday, July 5, 2024 12:08 PM
> To: Sunyeal Hong <sunyeal.hong@samsung.com>; Krzysztof Kozlowski
> <krzk@kernel.org>; Sylwester Nawrocki <s.nawrocki@samsung.com>; Chanwoo
> Choi <cw00.choi@samsung.com>; Alim Akhtar <alim.akhtar@samsung.com>;
> Michael Turquette <mturquette@baylibre.com>; Stephen Boyd
> <sboyd@kernel.org>
> Cc: linux-samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH 2/5] dt-bindings: clock: add clock binding definitions
> for Exynos Auto v920
> 
> Hi Sunyeal,
> 
> 
> On 7/5/24 11:11, Sunyeal Hong wrote:
> > Add device tree clock binding definitions for below CMU blocks.
> >
> > - CMU_TOP
> > - CMU_PERIC0
> >
> > Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
> > ---
> >   .../clock/samsung,exynosautov920.h            | 191 ++++++++++++++++++
> >   1 file changed, 191 insertions(+)
> >   create mode 100644 include/dt-bindings/clock/samsung,exynosautov920.h
> >
> > diff --git a/include/dt-bindings/clock/samsung,exynosautov920.h
> b/include/dt-bindings/clock/samsung,exynosautov920.h
> > new file mode 100644
> > index 000000000000..bbddf7583e61
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/samsung,exynosautov920.h
> > @@ -0,0 +1,191 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +/*
> > + * Copyright (c) 2024 Samsung Electronics Co., Ltd.
> > + * Author: Sunyeal Hong <sunyeal.hong@samsung.com>
> > + *
> > + * Device Tree binding constants for Exynos Auto V209 clock controller.
> 
> Typo : V209 -> V920
> 
> 
> Thanks
> 
> Jaewon Kim
> 

There was a typo for the SoC name. I will revise it as you mentioned. 
Thank you.

Sunyeal Hong


