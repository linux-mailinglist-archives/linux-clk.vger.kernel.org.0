Return-Path: <linux-clk+bounces-25720-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 451D7B1EA1C
	for <lists+linux-clk@lfdr.de>; Fri,  8 Aug 2025 16:15:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC9B33A393A
	for <lists+linux-clk@lfdr.de>; Fri,  8 Aug 2025 14:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B68727EC99;
	Fri,  8 Aug 2025 14:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="WAZq5hDl"
X-Original-To: linux-clk@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6712B27E7FD
	for <linux-clk@vger.kernel.org>; Fri,  8 Aug 2025 14:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754662517; cv=none; b=HiYiPfJoWP25yGscONN+igtocS/rZguz8DV7+Fm/8mqrcN4G8LnrzSeoZuyH7rlc7YVAimorP5bNO0fMFTpHNfmKVh/4FiO5T0VNxk7JMpLMRms5fDsd46N9hbL7xXpoyss9lQtS/Itp+GHhhIATrZy3R69OJkfLqh3Ku0okGzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754662517; c=relaxed/simple;
	bh=b0uz6gGOxrmWf37x43QKSPVnx5xNJDhkCz0EZ/q9xBs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=TIrWNfoE9oJQ/4C4i7jRf0RMbJqDfQFTy9b4RV8W3eHNZ/9+7ffBZKZ+JNzaKxDAeQAcPh14Nd2AUtrThlgQDU51Sq/7r/LvCnNtyeGC4pFW60QdRpFEL5gelCRJNrtKZboGvplpgbyZm38YfV1PU9NaqlWGseD6VJtYjaoJXuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=WAZq5hDl; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250808141513epoutp02ab9e99951a6dc14a416b2f3422b89600~Z0EJk-l6S0894708947epoutp026
	for <linux-clk@vger.kernel.org>; Fri,  8 Aug 2025 14:15:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250808141513epoutp02ab9e99951a6dc14a416b2f3422b89600~Z0EJk-l6S0894708947epoutp026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754662513;
	bh=0+FDQ3+MGzQg8h5mRrPUliafyK3G6MDAXRWQfJde8Gc=;
	h=From:To:Cc:Subject:Date:References:From;
	b=WAZq5hDlyEVJI9YNXcitPsrrl6QLpjmt3Nj+Yf06ScwrhQ0for3oCa1DbXPisSRV+
	 mzRIseXpE9kD6Lr0b9Vg1eXuAlSfJAk4SDFYUbaUWzW8QsHIYIE9cE+s2HNlIQDOM7
	 a/8dalKt+Ww9MbwyREM0bya0V7spsGK+WybAsDIA=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250808141512epcas5p25cffc721f85d95f66d802884d8e287a1~Z0EIZGIZz2897228972epcas5p2v;
	Fri,  8 Aug 2025 14:15:12 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.93]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bz5dq1Zrmz6B9m5; Fri,  8 Aug
	2025 14:15:11 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250808141238epcas5p4a1e2767d73926bff7ca12b8afd66c36c~Z0B5s6nON3267932679epcas5p4q;
	Fri,  8 Aug 2025 14:12:38 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250808141236epsmtip2173602d1d6a8fabf184ef84cb9d8e79d~Z0B3ZH34k1965319653epsmtip2x;
	Fri,  8 Aug 2025 14:12:36 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, sunyeal.hong@samsung.com, shin.son@samsung.com,
	alim.akhtar@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, dev.tailor@samsung.com,
	chandan.vn@samsung.com, karthik.sun@samsung.com, raghav.s@samsung.com
Subject: [PATCH v1 0/3] Add clock support for CMU_M2M
Date: Fri,  8 Aug 2025 19:51:43 +0530
Message-Id: <20250808142146.3181062-1-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250808141238epcas5p4a1e2767d73926bff7ca12b8afd66c36c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250808141238epcas5p4a1e2767d73926bff7ca12b8afd66c36c
References: <CGME20250808141238epcas5p4a1e2767d73926bff7ca12b8afd66c36c@epcas5p4.samsung.com>

This series adds clock support for the CMU_M2M block.

Patch[1/3]: dt-bindings: clock: exynosautov920: add m2m clock definitions
        - Adds DT binding for CMU_M2M and clock definitions

Patch[2/3]: clk: samsung: exynosautov920: add block m2m clock support
        - Adds CMU_M2M clock driver support

Patch[3/3]: arm64: dts: exynosautov920: add CMU_M2M clock DT nodes
        - Adds dt node for CMU_M2M

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---

Raghav Sharma (3):
  dt-bindings: clock: exynosautov920: add m2m clock definitions
  clk: samsung: exynosautov920: add block m2m clock support
  arm64: dts: exynosautov920: add cmu_m2m clock DT nodes

 .../clock/samsung,exynosautov920-clock.yaml   | 21 +++++++++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 13 ++++++
 drivers/clk/samsung/clk-exynosautov920.c      | 45 +++++++++++++++++++
 .../clock/samsung,exynosautov920.h            |  5 +++
 4 files changed, 84 insertions(+)


base-commit: b7d4e259682caccb51a25283655f2c8f02e32d23
-- 
2.34.1


