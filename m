Return-Path: <linux-clk+bounces-1981-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C6C81FE46
	for <lists+linux-clk@lfdr.de>; Fri, 29 Dec 2023 09:52:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91EA31F22D6C
	for <lists+linux-clk@lfdr.de>; Fri, 29 Dec 2023 08:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A3DD7493;
	Fri, 29 Dec 2023 08:52:35 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from SHSQR01.spreadtrum.com (unknown [222.66.158.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3307497
	for <linux-clk@vger.kernel.org>; Fri, 29 Dec 2023 08:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unisoc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unisoc.com
Received: from dlp.unisoc.com ([10.29.3.86])
	by SHSQR01.spreadtrum.com with ESMTP id 3BT8qAPB094630;
	Fri, 29 Dec 2023 16:52:10 +0800 (+08)
	(envelope-from Chunyan.Zhang@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
	by dlp.unisoc.com (SkyGuard) with ESMTPS id 4T1f8y0KSQz2Qt2Lb;
	Fri, 29 Dec 2023 16:45:38 +0800 (CST)
Received: from ubt.spreadtrum.com (10.0.73.88) by BJMBX02.spreadtrum.com
 (10.0.64.8) with Microsoft SMTP Server (TLS) id 15.0.1497.23; Fri, 29 Dec
 2023 16:52:08 +0800
From: Chunyan Zhang <chunyan.zhang@unisoc.com>
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang
	<baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Subject: [PATCH 0/3] Add UMS9620 clocks driver and bindings
Date: Fri, 29 Dec 2023 16:51:53 +0800
Message-ID: <20231229085156.1490233-1-chunyan.zhang@unisoc.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHCAS01.spreadtrum.com (10.0.1.201) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL:SHSQR01.spreadtrum.com 3BT8qAPB094630

Add UMS9620 clock driver and update clock bindings for UMS9620.

Chunyan Zhang (3):
  dt-bindings: clk: sprd: Add UMS9620 support
  clk: sprd: Add dt-bindings include file for UMS9620
  clk: sprd: add clocks support for UMS9620

 .../bindings/clock/sprd,ums512-clk.yaml       |   79 +-
 drivers/clk/sprd/Kconfig                      |    9 +
 drivers/clk/sprd/Makefile                     |    1 +
 drivers/clk/sprd/ums9620-clk.c                | 3132 +++++++++++++++++
 include/dt-bindings/clock/sprd,ums9620-clk.h  |  515 +++
 5 files changed, 3725 insertions(+), 11 deletions(-)
 create mode 100644 drivers/clk/sprd/ums9620-clk.c
 create mode 100644 include/dt-bindings/clock/sprd,ums9620-clk.h

-- 
2.41.0


