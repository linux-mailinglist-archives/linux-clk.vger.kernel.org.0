Return-Path: <linux-clk+bounces-20765-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F3869A931CF
	for <lists+linux-clk@lfdr.de>; Fri, 18 Apr 2025 08:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BC7219E6DE3
	for <lists+linux-clk@lfdr.de>; Fri, 18 Apr 2025 06:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D93B268C41;
	Fri, 18 Apr 2025 06:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="QJpKZIpd"
X-Original-To: linux-clk@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8FB253328
	for <linux-clk@vger.kernel.org>; Fri, 18 Apr 2025 06:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744956921; cv=none; b=ta4qR/QeDU7AZAljXT0EYCC/UxyiZyNcV5qjReHBPWQXdSjWffkbjyL8Oe8EH5i6xBB2actnKVfR1+odKiIRKYKYc1DzNEVy/wtkcRVbbBIyPAHU6ZXU1BFkZ2+jE+w9BRJljGA77X4ILtFOMvPU8TZwMcC+0ZAaK7kWddieL6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744956921; c=relaxed/simple;
	bh=55/enJwvoXWMX4pMdBTbST/D+5JtCLJFgdFWUPejsvU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=ZwLEYfzDf+aOgmkl+jWTdV7BXoEvpqZZ2C93Qbczj8Q2MpCd1FkoEGHepkUX8WXeLTZhZfcQ6jBPrLvQg/Ooh8oEhDcSfpjBZNGoaCP27N4oQPg+p+V8XIULaYtkLHPNb9TGu5GtG05SNnesavc+KmvZnng8BOCdduONw0dHzHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=QJpKZIpd; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250418061516epoutp04a1b75efa931877a5a4b07807b8a5ee7f~3VRIHMw3-1837118371epoutp04j
	for <linux-clk@vger.kernel.org>; Fri, 18 Apr 2025 06:15:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250418061516epoutp04a1b75efa931877a5a4b07807b8a5ee7f~3VRIHMw3-1837118371epoutp04j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1744956916;
	bh=6h9dI2xNKAVU9ayEQC7yd3NFHx4xgdVSrC1Zk4zAmFg=;
	h=From:To:Cc:Subject:Date:References:From;
	b=QJpKZIpdnK6QpLYEQk6gjaoSef91WeIMFr8pbmk+zGtt6Yy+gu8BzPq5Go5C8gIaP
	 oY/CQSSbYEWz4J6QYbcCHekZtlpnB16YRNbrSSJHxx5ldOUZ3Quv86chZE+157bTG8
	 b0QRmmrzPNUzcrQoqVLtPQJSM83XxvZnzTpfVghM=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250418061516epcas2p1d60aa5bd2deed796faf38616d4214444~3VRHq7bpu0446704467epcas2p1V;
	Fri, 18 Apr 2025 06:15:16 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.90]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4Zf4Hl54Cwz3hhTJ; Fri, 18 Apr
	2025 06:15:15 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250418061515epcas2p1ddd9ec01dd5de8b238c77dcef14d745a~3VRGwpX213220332203epcas2p1x;
	Fri, 18 Apr 2025 06:15:15 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250418061515epsmtrp19a4ca320f19c2c8a6c64dd74d5ca5541~3VRGv4R8r2614626146epsmtrp13;
	Fri, 18 Apr 2025 06:15:15 +0000 (GMT)
X-AuditID: b6c32a52-40bff70000004c16-28-6801edf2e90e
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	E1.69.19478.2FDE1086; Fri, 18 Apr 2025 15:15:14 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250418061514epsmtip185f7e329d7b91ba951f2374a4c1c8ded~3VRGcJJv_0412804128epsmtip1T;
	Fri, 18 Apr 2025 06:15:14 +0000 (GMT)
From: Shin Son <shin.son@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>
Cc: Shin Son <shin.son@samsung.com>, linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] add CPUCL0 clock support for exynosauto v920 SoC
Date: Fri, 18 Apr 2025 15:14:57 +0900
Message-ID: <20250418061500.1629200-1-shin.son@samsung.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrALMWRmVeSWpSXmKPExsWy7bCSnO6nt4wZBuu/WVg8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji8Xk42tZLZqWrWdy4Pd4f6OV3WPTqk42j81L6j36tqxi9Pi8SS6ANYrLJiU1J7MstUjf
	LoEro2/yVJaC/SwVC/Z1sjUwnmfuYuTkkBAwkVh/6TJLFyMXh5DAdkaJw7uPMEEkJCQOz5jA
	CGELS9xvOcIKUfSeUeLt0w6gDg4ONgFViU2/5UHiIgJvmSSW/z8A1swscJpRYucZGRBbWMBV
	4un+p2wgNgtQ/eTn81hAbF4Ba4kTW5sZQeZICMhL9HdIQIQFJU7OfMICMUZeonnrbOYJjHyz
	kKRmIUktYGRaxSiaWlCcm56bXGCoV5yYW1yal66XnJ+7iREc6FpBOxiXrf+rd4iRiYPxEKME
	B7OSCO8583/pQrwpiZVVqUX58UWlOanFhxilOViUxHmVczpThATSE0tSs1NTC1KLYLJMHJxS
	DUyluzp/fHzxM71ZaeaxidtWRwZ953J9oy7Zqa0hOM3WUSyZXXunW/c9r1m751t5Gam3tBd7
	qs9akfV64eppyefKd9SEhqd0pFnXzbFvZRDJ4n9buiXKxuvtr/S3N/rYrs2eWGLS3tu88sGt
	3QeFy79abJkm1HLF/bKicdGxjVvfHwvU7Pr1aue0oxPWnWq2lZKte5gvzDn9EnPJDFaRkPmf
	sv7pVEtp6jxcunbGA3ezx88kqh/d4lL7evS5wd5qD9Yth4ptp76o5/uuIFcv5y0iPudmwIyq
	abu9NbfN2X5/Gr/n7/wvUyXqLieHOP1/+aH08NklV2ubnhQ01q8Rcdm6f6pqYbTGYvdLTHNk
	ldWUWIozEg21mIuKEwEo/UOd4wIAAA==
X-CMS-MailID: 20250418061515epcas2p1ddd9ec01dd5de8b238c77dcef14d745a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250418061515epcas2p1ddd9ec01dd5de8b238c77dcef14d745a
References: <CGME20250418061515epcas2p1ddd9ec01dd5de8b238c77dcef14d745a@epcas2p1.samsung.com>

This patchset adds the CMU_CPUCL0 block to support exynosauto v920 SoC

Shin Son (3):
  dt-bindings: clock: exynosautov920: add cpucl0 clock definitions
  clk: samsung: exynosautov920: add cpucl0 clock support
  arm64: dts: exynosautov920: add cpucl0 clock DT nodes

 .../clock/samsung,exynosautov920-clock.yaml   |  25 ++++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |  15 ++
 drivers/clk/samsung/clk-exynosautov920.c      | 129 ++++++++++++++++++
 .../clock/samsung,exynosautov920.h            |  19 +++
 4 files changed, 188 insertions(+)

-- 
2.49.0


