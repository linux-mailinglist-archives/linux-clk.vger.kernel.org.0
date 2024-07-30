Return-Path: <linux-clk+bounces-10163-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A55AB94091D
	for <lists+linux-clk@lfdr.de>; Tue, 30 Jul 2024 09:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B387282CB6
	for <lists+linux-clk@lfdr.de>; Tue, 30 Jul 2024 07:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB6E218FDB4;
	Tue, 30 Jul 2024 07:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Wmh5net4"
X-Original-To: linux-clk@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46E9186E2E
	for <linux-clk@vger.kernel.org>; Tue, 30 Jul 2024 07:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722323553; cv=none; b=f1xFEe/ovnfNPZqF1OE8xnokh4P6r1rLt9V+fI6fXh/ceJ1Ft7cnGbeP5OP0mPiHXD3RvMg9WXbh4oaIoLzeux288qMa7GFdnmnHy3FO5eVUGAeZRSK6uITZ22unlH7mHLrGBcvbkYDK5CDXAABysIHuc4O1LXUohEz8Pc9bq6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722323553; c=relaxed/simple;
	bh=U0XAihTOozjmi/VHHmGrWIFRV9T6G7gyM9p4d7VGZjI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=HvH1CgPELs6mlC7MAHgSHYSbI9d0hwZ4mjlrRkDiib9u65NZ26j2FRe5K5o3she+EhZXUoRF31YPmlnewAD8l3z1tMk9GjfahQTrznUGOfRvBTXyH1DZsfGrZkrA87/GdDVG8gENkCKUGvXLqKy7HY6d5JJzBq/RRQMVR6NChQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Wmh5net4; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20240730071228epoutp01ad95ee2428f5a248cf9b17d82f9e00e2~m7CR7oyWC2294822948epoutp01O
	for <linux-clk@vger.kernel.org>; Tue, 30 Jul 2024 07:12:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20240730071228epoutp01ad95ee2428f5a248cf9b17d82f9e00e2~m7CR7oyWC2294822948epoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1722323548;
	bh=XA/+cZxDTnTL9Kfy1Fz7SwTVzK9HQrfVibLW1ss+FTg=;
	h=From:To:Cc:Subject:Date:References:From;
	b=Wmh5net4VUnYpMBEbKlN2wVjnyXFByzVKWdO0+YfhM8gFGdmVYmA38K9a0/zPMZFw
	 O+yMMnm+OJPzfjpEnWE2fSoXQABX1DCXUhdDjuJdrjRm89/D0A2edzS2HzbMKJc+ri
	 hHtOEmLaTFx6TNDpDZMcaoD+jrxGr9UvE8UZdDEE=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20240730071228epcas2p4cb86a576b1327716657e78b8e6b054e9~m7CRnOAdd2379823798epcas2p4a;
	Tue, 30 Jul 2024 07:12:28 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.98]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4WY5yh1Xbbz4x9Pw; Tue, 30 Jul
	2024 07:12:28 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	89.8A.10066.C5298A66; Tue, 30 Jul 2024 16:12:28 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20240730071227epcas2p3db10248818bb509aa069205bb9bb851b~m7CQyXY4Y0692706927epcas2p39;
	Tue, 30 Jul 2024 07:12:27 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240730071227epsmtrp2887d0b3172bcd5cae2be9f890cb05642~m7CQwqRzC1318313183epsmtrp2R;
	Tue, 30 Jul 2024 07:12:27 +0000 (GMT)
X-AuditID: b6c32a46-24fff70000002752-1b-66a8925c10ff
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	A2.EB.19367.B5298A66; Tue, 30 Jul 2024 16:12:27 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240730071227epsmtip22b983de154d7e31105e593f9bf69d712~m7CQiGSgC0426304263epsmtip2W;
	Tue, 30 Jul 2024 07:12:27 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v5 0/4] initial clock support for exynosauto v920 SoC
Date: Tue, 30 Jul 2024 16:12:17 +0900
Message-ID: <20240730071221.2590284-1-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIJsWRmVeSWpSXmKPExsWy7bCmqW7MpBVpBk+fsFg8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZl22SkJqakFimk5iXnp2Tm
	pdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYA3amkUJaYUwoUCkgsLlbSt7Mpyi8t
	SVXIyC8usVVKLUjJKTAv0CtOzC0uzUvXy0stsTI0MDAyBSpMyM7YfX0mY0EHX0XH0WlsDYwN
	3F2MnBwSAiYSe4/2snUxcnEICexglJgwbQsThPOJUaJh/zcWOGf/m/OMMC0PfjRAVe1klJi2
	YjZU/0dGiVntrUAZDg42AV2JP/8cQOIiAnuYJLacXwLWwSxwllHi7pwF7CCjhAVcJbZNXQfW
	wCKgKvFrlTVImFfAXmLbvAvsENvkJS6uec4GEReUODnzCQuIzQwUb946mxlkpoTAX3aJZ69f
	sEA0uEjcXX2aDcIWlnh1fAvUICmJz+/2QsXzJSZff8sE0dzAKHHtXzczRMJeYtGZn+wgBzEL
	aEqs36UPYkoIKEscuQW1l0+i4/Bfdogwr0RHmxBEo5rEpyuXoYbISBw78QzK9pCYv6uHCcQW
	EoiVmHDoGvMERvlZSL6ZheSbWQh7FzAyr2IUSy0ozk1PLTYqMILHanJ+7iZGcFrVctvBOOXt
	B71DjEwcjIcYJTiYlUR4468sTRPiTUmsrEotyo8vKs1JLT7EaAoM3onMUqLJ+cDEnlcSb2hi
	aWBiZmZobmRqYK4kznuvdW6KkEB6YklqdmpqQWoRTB8TB6dUA5PzVsWq2B3vrQLTZyc0SPBe
	V/5hX6837V2ZVfL8TxoiwnxXDswzOuS86aGnVa3n6b6l8TcWx0YlsSrP1Fbg+e8R9mJ2iOqP
	So4bj4Mq4g/xpvf7/vjRuCLGTd2vQaMz4ObV5NlTf68/eU/Oi0Fzl42RT/v6H2xrTsh/1WVx
	O2xSkeV2fMOqfWlMu3R9vjYedlnoLMC14mVzrKDy/mz3hq8in9cwMhRKqPxluXHTzNt7ns6l
	CsHwBHMNkTh2ge9Fs7Pq6i6UzSh73h8ee+eOh5uXuITnvyhrnhen1ZpeylwXuHPY9de8szOV
	LPbNOdLarl2zXfj2/SqHIAGuKNUNAZohy3yb/OT7ZjGtOcKvxFKckWioxVxUnAgAdanzxDQE
	AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDLMWRmVeSWpSXmKPExsWy7bCSvG70pBVpBnNWKVs8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZx2aSk5mSWpRbp2yVwZey+
	PpOxoIOvouPoNLYGxgbuLkZODgkBE4kHPxqYuhi5OIQEtjNKXG5YzA6RkJHY2PAfyhaWuN9y
	hBWi6D2jxLv574A6ODjYBHQl/vxzAImLCBxikpj4+SkLiMMscJlR4tjdycwg3cICrhLbpq4D
	a2ARUJX4tcoaJMwrYC+xbd4FqAXyEhfXPGeDiAtKnJz5hAXEZgaKN2+dzTyBkW8WktQsJKkF
	jEyrGEVTC4pz03OTCwz1ihNzi0vz0vWS83M3MYIDXCtoB+Oy9X/1DjEycTAeYpTgYFYS4Y2/
	sjRNiDclsbIqtSg/vqg0J7X4EKM0B4uSOK9yTmeKkEB6YklqdmpqQWoRTJaJg1OqgUlNKzYj
	nfv3jfzFznZvivfqPr7/3+PY0x6WK1ky/zr62/6unNS67lj+B+6Xhv+OJrOZe7FO7BKr1xV5
	P3HFk9ku2Yv9eP4c/VD4IrSV6+jB1pvd6ft/ieu+Zp/+9uM5Z36uNdZG6iEhD/bXvIq+sZTl
	fGvI/8LSdQl7l09a4Vk07eBd4f/m2buNb3JIZQqaR55zE2xiTQ3Yt2C2ef1pgccP/vwOX8w0
	f5Jb6V3eM2vUn2rUXVh1jPmpQ3Thsn0Z1578mMebwW00t9HwgEfrtrNHuuWU7rjXxzw7c8ro
	0tcLqSFnX066Pd33zsQn/tuLTe3bshoz/q54YBr3XnwR27w/sw0rPvDxrvjGUPb+7edbSizF
	GYmGWsxFxYkANJYNUN8CAAA=
X-CMS-MailID: 20240730071227epcas2p3db10248818bb509aa069205bb9bb851b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240730071227epcas2p3db10248818bb509aa069205bb9bb851b
References: <CGME20240730071227epcas2p3db10248818bb509aa069205bb9bb851b@epcas2p3.samsung.com>

This patchset adds initial clock driver support for Exynos Auto v920 SoC.
This driver uses HW Auto Clock gating. So all gate clocks did not register.

Below CMU blocks are supported in this patchset and remains will be
implemented later.

- CMU_TOP
- CMU_PERIC0

Changes in v5:
 - Change CMU_TOP odd numbering
 - Move the descriptions and names common clocks properties

Changes in v4:
 - Change PLL_531x fdiv type and mask bit
 - Change PLL_531x mdiv type

Changes in v3:
 - Change SoC name from Exynos Auto to ExynosAuto
 - Change the makefile order to the bottom of exynosautov9
 - Add PLL_531x formula for integer PLL

Changes in v2:
 - Fix typo from v209 to v920
 - Change USI clock to appropriate
 - Merge headers into binding patches
 - Change clock-name to the recommended name

Sunyeal Hong (4):
  dt-bindings: clock: add ExynosAuto v920 SoC CMU bindings
  arm64: dts: exynos: add initial CMU clock nodes in ExynosAuto v920
  clk: samsung: clk-pll: Add support for pll_531x
  clk: samsung: add top clock support for ExynosAuto v920 SoC

 .../clock/samsung,exynosautov920-clock.yaml   |  115 ++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |   40 +-
 drivers/clk/samsung/Makefile                  |    1 +
 drivers/clk/samsung/clk-exynosautov920.c      | 1173 +++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |   44 +
 drivers/clk/samsung/clk-pll.h                 |    1 +
 .../clock/samsung,exynosautov920.h            |  191 +++
 7 files changed, 1552 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-exynosautov920.c
 create mode 100644 include/dt-bindings/clock/samsung,exynosautov920.h

-- 
2.45.2


