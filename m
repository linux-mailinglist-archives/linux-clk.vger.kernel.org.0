Return-Path: <linux-clk+bounces-10189-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB5B941052
	for <lists+linux-clk@lfdr.de>; Tue, 30 Jul 2024 13:16:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4D791C224D2
	for <lists+linux-clk@lfdr.de>; Tue, 30 Jul 2024 11:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC67019DF8D;
	Tue, 30 Jul 2024 11:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="n10FyR1E"
X-Original-To: linux-clk@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB4E19AD81
	for <linux-clk@vger.kernel.org>; Tue, 30 Jul 2024 11:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722338196; cv=none; b=m7VwVNvIgP585cPAFAPwYVPe46AWdRbiEUDtyzCIyozbBw9v2zsXP/kBi+AQpHo0APelm6oqq4zKxbhsN2zmIeTe9F72t0rYu/2m5CxZ5m1AO9lXj/EfQJjaFCOjIhtpCD9Gkids0sXc6cGUKKUOwU9k/rviQPySVD4qEKSTlxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722338196; c=relaxed/simple;
	bh=8he+Ksryn+4vpvLC3YYqn2vprYlQyUXP6g5w6RA02Cs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=DAoe1jvXjNc510T47NzbMKLoghDtMnrVI07UFytrxOT6fY/GPCKaRxQAmVz+u0VT/IdituDfB4xmYZuCctf7vk70GpziEtsffTKuHLKnb22zhGpYfPUqiPYS5b6EEMAw75vJMkOc1/YVf7KxmzaTaXoe1xSfRpc2NdhhnTgC0fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=n10FyR1E; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20240730111630epoutp02dd8a2e87996f200b5229218bc2411fb2~m_XV-lq2u1695116951epoutp02W
	for <linux-clk@vger.kernel.org>; Tue, 30 Jul 2024 11:16:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20240730111630epoutp02dd8a2e87996f200b5229218bc2411fb2~m_XV-lq2u1695116951epoutp02W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1722338190;
	bh=QgFIgTrBA9L3Aa5IzF3Q3Y0M/oUe/A3YcQIIjOneEAY=;
	h=From:To:Cc:Subject:Date:References:From;
	b=n10FyR1Esdmq49Aup+8mQFmyUbtlqQr3PwtQfEjkXZrsyK6i3pJwp4fZ6inzCFB7y
	 wRX4te9Sw2qkDUFtFHA0W4Qo1gkzCLImnYB3E4uY8bwMzXBps/3crTLro4nEW038QI
	 DNqP/+lmdtKUZ+ya5QAAD2wVm7dPb1yxtRwaARHQ=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTP id
	20240730111629epcas1p18d40ddfb4695043aa47609bd99684b6e~m_XVPsA6B1947519475epcas1p1P;
	Tue, 30 Jul 2024 11:16:29 +0000 (GMT)
Received: from epsmgec1p1.samsung.com (unknown [182.195.38.237]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4WYCND5t49z4x9Py; Tue, 30 Jul
	2024 11:16:28 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
	epsmgec1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	AC.CC.08992.C8BC8A66; Tue, 30 Jul 2024 20:16:28 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
	20240730111628epcas1p30976a7c1192749ff7997be5685d52c49~m_XTxw3nh1638816388epcas1p3q;
	Tue, 30 Jul 2024 11:16:28 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240730111628epsmtrp1a547b07603e29b6368be5641d0f717b9~m_XTxA3QX2131621316epsmtrp1K;
	Tue, 30 Jul 2024 11:16:28 +0000 (GMT)
X-AuditID: b6c32a33-70bff70000002320-c6-66a8cb8c055a
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	F9.11.19367.B8BC8A66; Tue, 30 Jul 2024 20:16:28 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.111.204]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240730111627epsmtip1d4a624ab0fd9ab9199750bc955dc40cc~m_XTb5Cky0676606766epsmtip1s;
	Tue, 30 Jul 2024 11:16:27 +0000 (GMT)
From: Kwanghoon Son <k.son@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, conor+dt@kernel.org, tomasz.figa@gmail.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kwanghoon
	Son <k.son@samsung.com>
Subject: [PATCH v2 0/3] dpum clock support for Exynos Auto v9 SoC
Date: Tue, 30 Jul 2024 20:15:32 +0900
Message-Id: <20240730111535.135301-1-k.son@samsung.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJJsWRmVeSWpSXmKPExsWy7bCmnm7P6RVpBjfXqFk8mLeNzWLN3nNM
	Fte/PGe1mH/kHKtF75qrTBbnz29gt9j0+Bqrxceee6wWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxWLVrj+MDnwe72+0snvsnHWX3WPTqk42j81L6j36tqxi9Pi8SS6ALSrbJiM1MSW1SCE1
	Lzk/JTMv3VbJOzjeOd7UzMBQ19DSwlxJIS8xN9VWycUnQNctMwfoWCWFssScUqBQQGJxsZK+
	nU1RfmlJqkJGfnGJrVJqQUpOgWmBXnFibnFpXrpeXmqJlaGBgZEpUGFCdsaypa3MBZPZKq5u
	/MzYwNjM2sXIySEhYCKx+dtWdhBbSGAHo8StiWZdjFxA9idGib0r/jLCOYv2nmWD6Zixfg8b
	RGIno8SCN0fZIZwvjBKfD4O0cHKwCahLLGlbC5YQETjOKHFmSTfYLGaBlYwSD1Y9YQGpEhZw
	lPjbfQNsLouAqsTU/W1gl/AKmEvs6H3H3MXIAbRPXmLxAwmIsKDEyZkQrcxA4eats5lBZkoI
	tHJIvOmcxQJxn4vE6zPfmCBsYYlXx7ewQ9hSEi/726DsbImjH/dC/VMicX3WImhoGEvsXzqZ
	CWQvs4CmxPpd+hC7+CTefe1hhTiHV6KjTQjmslud5RCNohJnnn6EGugh8eHxZhZIkMZKvD+y
	inUCo9wsJA/MQvLALIRdCxiZVzGKpRYU56anJhsWGMIjMjk/dxMjOI1qGe9gvDz/n94hRiYO
	xkOMEhzMSiK88VeWpgnxpiRWVqUW5ccXleakFh9iNAWG6ERmKdHkfGAizyuJNzSxNDAxMzI2
	sTA0M1QS5z1zpSxVSCA9sSQ1OzW1ILUIpo+Jg1OqgYkjd2m3T0FamtXUS94MAWt/3Pk5s8yw
	YevzcqaisFkfFurdyc4M1u6r7AxlXuqpcsjzoZ2klON3Q9sjb/cG7/D46sjvcmHPszJt+03G
	okI/TC746Ojc3f4jnOGTz+Tj2cb/bvOwfHjtm/EmSyHwOG/S/vvZi9KCzO6n7t8u8yF6yqmw
	vP4/ip1nlkitWue/+L/ZZpWt30IkNRpm3//RlH23kV3L7sT6mczfNrzfY3ngzfmlEeFXQz16
	EuJd92iprfIX3Kjd/Lzr3LZNdafC5zuWufy/WNofskzBokZG/s6O+1vsJErOnl82Y8OrqjdS
	PxznFd14Vxw700U407dDvEJ0/qEz0/SdWKr5rnz1FFBiKc5INNRiLipOBADFduokLAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrILMWRmVeSWpSXmKPExsWy7bCSnG7P6RVpBpueMFk8mLeNzWLN3nNM
	Fte/PGe1mH/kHKtF75qrTBbnz29gt9j0+Bqrxceee6wWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxWLVrj+MDnwe72+0snvsnHWX3WPTqk42j81L6j36tqxi9Pi8SS6ALYrLJiU1J7MstUjf
	LoErY9nSVuaCyWwVVzd+ZmxgbGbtYuTkkBAwkZixfg9bFyMXh5DAdkaJc9e3QyVEJTouNzJ2
	MXIA2cIShw8XQ9R8YpS4NeMXWA2bgLrEkra17CAJEYHLjBL/F0xiBHGYBdYySjyd8oQdpEpY
	wFHib/cNNhCbRUBVYur+NrA4r4C5xI7ed8wQG+QlFj+QgAgLSpyc+YQFxGYGCjdvnc08gZFv
	FpLULCSpBYxMqxhFUwuKc9NzkwsM9YoTc4tL89L1kvNzNzGCQ10raAfjsvV/9Q4xMnEwHmKU
	4GBWEuGNv7I0TYg3JbGyKrUoP76oNCe1+BCjNAeLkjivck5nipBAemJJanZqakFqEUyWiYNT
	qoFJ7t063veuropr5z01u/K0tKxqu9Gclz3dyw4WnQtNUr7yc6rEozXZch+m9DToOcwvl56U
	2bPq4GRRNumYVJEH+pvCp/6czzb71gEd3oaslcxvSmfIFDce+j3fosND+MY97Vl3Prfekqz6
	XVWtmpa0NW/RL1OpRSu6TRz2afacK97p37v/T79RC9/SD5OZD/XMlnbkcDeN/layOkdYk0c8
	rufpVG5Bz7yG6yfLbRbe/V6neMIneqPp7vUTPNK7+f1dLcJ2zFvpMSfh5c+1kUFbfk13885/
	7BxyecHKFq4b0XZsf3Tef9o3nc/e+tumiJO1zz94M7ze2ufx5czJn/uaMza76IY++nPEI0G7
	RHCfEktxRqKhFnNRcSIACSuhiOQCAAA=
X-CMS-MailID: 20240730111628epcas1p30976a7c1192749ff7997be5685d52c49
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240730111628epcas1p30976a7c1192749ff7997be5685d52c49
References: <CGME20240730111628epcas1p30976a7c1192749ff7997be5685d52c49@epcas1p3.samsung.com>

DPUM (Display Processing Unit Main) is main dpu for Exynosautov9.
    
This patches enable clock for dpum, sysmmu(iommu).

Signed-off-by: Kwanghoon Son <k.son@samsung.com>
---
Changes in v2:
- Squash patch 1,2 to make headers with schema.

Kwanghoon Son (3):
  dt-bindings: clock: exynosautov9: add dpum clock
  arm64: dts: exynosautov9: add dpum clock DT nodes
  clk: samsung: exynosautov9: add dpum clock support

 .../clock/samsung,exynosautov9-clock.yaml     | 19 +++++
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi  | 11 +++
 drivers/clk/samsung/clk-exynosautov9.c        | 83 +++++++++++++++++++
 .../dt-bindings/clock/samsung,exynosautov9.h  | 11 +++
 4 files changed, 124 insertions(+)


base-commit: 94ede2a3e9135764736221c080ac7c0ad993dc2d
-- 
2.39.2


