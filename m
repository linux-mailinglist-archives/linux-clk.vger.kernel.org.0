Return-Path: <linux-clk+bounces-6847-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D29A8C0C4F
	for <lists+linux-clk@lfdr.de>; Thu,  9 May 2024 10:11:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9BB61F21B0E
	for <lists+linux-clk@lfdr.de>; Thu,  9 May 2024 08:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B35C149C6D;
	Thu,  9 May 2024 08:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="R+ToGNNH"
X-Original-To: linux-clk@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7113A1A2C37
	for <linux-clk@vger.kernel.org>; Thu,  9 May 2024 08:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715242278; cv=none; b=fjRy7b4NY6dFTgv+G4N3le/+oyPLRRTtjBiJH2aJlGvhRy+PBEKkVkHScO8CXfHs4VeZPkhbgDljhXYcz7M7Uj7iXEXkzunLk0bUMxykxUj2jcodsZCT//ZUV7djbGa++kUyVpC7tDEZesQjdckh1K/tqqIC1XlkRVmP49zm9Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715242278; c=relaxed/simple;
	bh=0ZFH4dlr6IWMylOJWeI16vKERqCC+bBYalFdqB7GxjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=O7KL+hMhmkkmLKI+Ik10kNron1mRCBTlyeZP2DO7l6GApnLJ93rvTMn9y0IBJG73PZxaXoE0/Z7NMoGKEeKmT0rDvDAJdtuXgFQmUXKTeICLhUxXyp5nIeDCPZkQkA1M3/e3cahnCyz1EjgZOsTLPI1CWaOZsobEeqIpjGLmWqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=R+ToGNNH; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20240509081113euoutp012b7e76a9fc4a500bdcf21676ab7f3eed~Nw8KItpiJ0239302393euoutp017
	for <linux-clk@vger.kernel.org>; Thu,  9 May 2024 08:11:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20240509081113euoutp012b7e76a9fc4a500bdcf21676ab7f3eed~Nw8KItpiJ0239302393euoutp017
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1715242273;
	bh=VnaCj/QoXKHZlvEzBXbABmSPgNRsKSZ+UQEw4PzKI9c=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=R+ToGNNHrQbDmZwRJZA4RnnReyjbU27KTUoESOIcFbmBOIm2tLeakpyYL8+5tMzlg
	 XiN7kec+AA2XsroEz16yw96Y9T9Eutjr5m144eATX0cpDD+zzSsijFPwagy+cbnsks
	 0tSXg3DyQTcZbBQ3GY4ih4RJRAr0S9n2HCZit7fg=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20240509081112eucas1p2c04e3541436f1b4b3a975a7ecdb3d252~Nw8JskhdK2028820288eucas1p2o;
	Thu,  9 May 2024 08:11:12 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 74.BE.09620.0258C366; Thu,  9
	May 2024 09:11:12 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20240509081112eucas1p1844f8e410d506f966f96b945aa0bcab5~Nw8JK_5VX2142921429eucas1p1e;
	Thu,  9 May 2024 08:11:12 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240509081112eusmtrp20c450e4c119b376d8d42101f827b59dd~Nw8JKDloo1317013170eusmtrp2d;
	Thu,  9 May 2024 08:11:12 +0000 (GMT)
X-AuditID: cbfec7f5-d1bff70000002594-a0-663c8520119d
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id EF.12.08810.0258C366; Thu,  9
	May 2024 09:11:12 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240509081111eusmtip23904339d79942c7443dcf18a4b1ed493~Nw8Ig1HV23008530085eusmtip2i;
	Thu,  9 May 2024 08:11:11 +0000 (GMT)
Message-ID: <920b5d58-b636-4084-8ea8-9981ecd5c270@samsung.com>
Date: Thu, 9 May 2024 10:11:10 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: samsung: Don't register clkdev lookup for the
 fixed rate clocks
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, Krzysztof
	Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAPLW+4nFp4AUpKdcsPTQ4gE3AByJU4WO+M34c3om+8AqTziAeg@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBKsWRmVeSWpSXmKPExsWy7djPc7oKrTZpBo8PGls8mLeNzeL6l+es
	FufPb2C3+Nhzj9Vixvl9TBYXT7laHH7Tzmrx79pGFovnffuYHDg93t9oZffYtKqTzePOtT1s
	Hn1bVjF6fN4kF8AaxWWTkpqTWZZapG+XwJXx4exN5oLVghXrZh9mb2CcztfFyMkhIWAi0di9
	lbGLkYtDSGAFo8Sdc6eZIJwvjBJHrh5ggXA+M0p0NH1ghGn5sKkZKrGcUWLS279QLR8ZJab2
	LgCr4hWwkzh3eS2YzSKgInF+2TsWiLigxMmZT8BsUQF5ifu3ZrCD2MIC0RKfWjawgtgiAnoS
	62a+YgcZyiywlUni8O5vYEXMAuISt57MZwKx2QQMJbredrGB2JwCgRIH5j1hhqiRl2jeOpsZ
	pFlC4A2HxOVpvUDNHECOi0TnhgKIF4QlXh3fwg5hy0j83zmfCaK+nVFiwe/7UM4ERomG57eg
	nrYGBs0vNpBBzAKaEut36UOEHSWuL77EBjGfT+LGW0GIG/gkJm2bzgwR5pXoaBOCqFaTmHV8
	HdzagxcuMU9gVJqFFCyzkHw5C8k3sxD2LmBkWcUonlpanJueWmycl1quV5yYW1yal66XnJ+7
	iRGYmE7/O/51B+OKVx/1DjEycTAeYpTgYFYS4a2qsU4T4k1JrKxKLcqPLyrNSS0+xCjNwaIk
	zquaIp8qJJCeWJKanZpakFoEk2Xi4JRqYJpyTYsjabNYqxHHg54jN9PDT3FIzKjTKLro0FQY
	8aw17oFck8WLp9n1y3V6Hm559qxG7FtP7wFjtrNbmM78i1p2xpEv5HxtHPOHq4tmvUmbuCA/
	peboskVJRUzPbs9qDquyOP/rOFdT3+3JN/o/mq11M1Fwjeh43Zo8S/Hr9OqLS9TMLZPbPhZP
	TvPweC9tYljV/Um4dusOV/YarXkJJ/VPrX23bP21W2/ZvS1/tUbbCnBoGCZasSrsmdTA+Y7P
	ZoHv3BtRRXI2k2xKJujv/6nwMO6pkdDRYvWmlytKr3varBVzt4rRaa3eO0No/bVVi8o/2D9d
	skxsQ+HECbdzZp0T+7jtj5mBl8cBhe99F5RYijMSDbWYi4oTAe/KaEW7AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRmVeSWpSXmKPExsVy+t/xe7oKrTZpBr9XC1g8mLeNzeL6l+es
	FufPb2C3+Nhzj9Vixvl9TBYXT7laHH7Tzmrx79pGFovnffuYHDg93t9oZffYtKqTzePOtT1s
	Hn1bVjF6fN4kF8AapWdTlF9akqqQkV9cYqsUbWhhpGdoaaFnZGKpZ2hsHmtlZKqkb2eTkpqT
	WZZapG+XoJfx4exN5oLVghXrZh9mb2CcztfFyMkhIWAi8WFTM0sXIxeHkMBSRokjXQuZIRIy
	EienNbBC2MISf651sYHYQgLvGSV6V7uD2LwCdhLnLq9lBLFZBFQkzi97xwIRF5Q4OfMJmC0q
	IC9x/9YMdhBbWCBaovPmc7C4iICexLqZr9hBFjMLbGeSePLwGiPEgluMEr/vyoLYzALiEree
	zGcCsdkEDCW63kIcwSkQKHFg3hNmiBozia6tXYwQtrxE89bZzBMYhWYhuWMWklGzkLTMQtKy
	gJFlFaNIamlxbnpusaFecWJucWleul5yfu4mRmAcbjv2c/MOxnmvPuodYmTiYDzEKMHBrCTC
	W1VjnSbEm5JYWZValB9fVJqTWnyI0RQYGBOZpUST84GJIK8k3tDMwNTQxMzSwNTSzFhJnNez
	oCNRSCA9sSQ1OzW1ILUIpo+Jg1OqgUnya97Jn5OdWF/czU/0f1XibXtQ6fkXk5+iQiZReZ+z
	DX58N5QW2yuzeOGC50oX9vrosj5+kszofFv/81/VNaINp57+6bYoWuOktPmVoJkg/xbFW2Lp
	tawPjIt4I6de7d8xf1FCUekhv5pthXPigiZd3Ct1RP19N/vHsKuV2yXtp+wJ5vR+FZqePTGK
	Ze+dvde+Xz5Qs/iT5BKnn05H1OsOMCfWzzwovvMZh5Sxi4PakyrFJyKKAhoSGbH3noqs991j
	KMe7bOLsL4dORjRcEOoWNsgo3Z665sHFUmWOsGWXlvBsTmpo9nxhU1kxZZ7ond/CEdJPbDmV
	m79tMnhXeG9p3vF1cm3zJx5e5yczX1aJpTgj0VCLuag4EQDMiAy6TAMAAA==
X-CMS-MailID: 20240509081112eucas1p1844f8e410d506f966f96b945aa0bcab5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20240507065329eucas1p1b26d68384a4f076b31223ed099fd3a48
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240507065329eucas1p1b26d68384a4f076b31223ed099fd3a48
References: <CGME20240507065329eucas1p1b26d68384a4f076b31223ed099fd3a48@eucas1p1.samsung.com>
	<20240507065317.3214186-1-m.szyprowski@samsung.com>
	<CAPLW+4nFp4AUpKdcsPTQ4gE3AByJU4WO+M34c3om+8AqTziAeg@mail.gmail.com>

On 08.05.2024 22:46, Sam Protsenko wrote:
> On Tue, May 7, 2024 at 1:53 AM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> Commit 4d11c62ca8d7 ("clkdev: report over-sized strings when creating
>> clkdev entries") revealed that clock lookup is registered for all fixed
>> clocks. The mentioned commit added a check if the registered name is not
>> too long. This fails for some clocks registered for Exynos542x SoCs family.
>> This lookup is a left-over from early common clock framework days, not
>> really needed nowadays, so remove it to avoid further issues.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>> Here is the fix for the mentioned 4d11c62ca8d7 commit, which fixes
>> booting of Exynos542x SoCs:
>> https://lore.kernel.org/all/20240507064434.3213933-1-m.szyprowski@samsung.com/
>>
>> This change is independent fix. I've tested it on all Exynos based boards
>> I have in my test lab. It would be great if someone could test it on
>> s3c64xx and s3c24xx based boards.
>> ---
> Thanks Marek, it fixes some warnings when booting the E850-96 board
> with current kernel-next (next-20240508), like:
>
>      samsung_clk_register_fixed_rate: failed to register clock lookup
> for clk_rco_i3c_pmic
>      ...
>
> But I guess 'ret' variable should be removed now, I'm seeing this
> build warning after applying this patch:
>
>      drivers/clk/samsung/clk.c: In function 'samsung_clk_register_fixed_rate':
>      drivers/clk/samsung/clk.c:142:20: warning: unused variable 'ret'
> [-Wunused-variable]

Indeed I've missed that. I will send v2 then.

> Also, maybe add corresponding "Fixes" tag?

The problem is which commit should be pointed there. The removed code 
originates from commit 721c42a351b1 ("clk: samsung: add common clock 
framework helper functions for Samsung platforms"), but that time such 
workaround might have been required, so this doesn't match the 'Fixes' 
tag usage.

> Other than that:
>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Tested-by: Sam Protsenko <semen.protsenko@linaro.org>
>
> Thanks!
>
> [snip]
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


