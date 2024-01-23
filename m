Return-Path: <linux-clk+bounces-2688-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EF38385CB
	for <lists+linux-clk@lfdr.de>; Tue, 23 Jan 2024 03:57:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB46C286D17
	for <lists+linux-clk@lfdr.de>; Tue, 23 Jan 2024 02:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2251374;
	Tue, 23 Jan 2024 02:56:31 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from SHSQR01.spreadtrum.com (unknown [222.66.158.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A6A17EB
	for <linux-clk@vger.kernel.org>; Tue, 23 Jan 2024 02:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=222.66.158.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705978591; cv=none; b=m59PZ6DmlCEyhCvJKqEIJCkyNyQBfeJmitBwkvnzFdNgmuZHZGIo27jIoZ5IyV8CVTAGhQURabaqKlHbFk/61tTBZx2APJwy6NMhwioRVNh+EkjtIiPi3uDcNSNG0cuRCGGFp3j9DGlNlN8K3E2Oo2M/9T9KoWtzYY/wEoIYlpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705978591; c=relaxed/simple;
	bh=JOW/XeQYTThgjoVl3ERNjpuhgv/rV3WIl3niYr63tOE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cn/B6gruCMeVGG4bafgTNfLDIzsRsiFjn8XhzP+Rn8VTIpUFzyqw30HCQXP3qH3UNq5/bw/SyWbEt6xbvBcmL7gbuYAiRzVI4P/xL1J14wZeAEl1TDP1aqPWhyu4XmSLtx5TD/+JrrBGULVRdEB56udpAiHXz319pq8kvbS+HiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unisoc.com; spf=pass smtp.mailfrom=unisoc.com; arc=none smtp.client-ip=222.66.158.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unisoc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unisoc.com
Received: from dlp.unisoc.com ([10.29.3.86])
	by SHSQR01.spreadtrum.com with ESMTP id 40N2uHJC022672;
	Tue, 23 Jan 2024 10:56:17 +0800 (+08)
	(envelope-from zhifeng.tang@unisoc.com)
Received: from SHDLP.spreadtrum.com (shmbx04.spreadtrum.com [10.0.1.214])
	by dlp.unisoc.com (SkyGuard) with ESMTPS id 4TJs3r1HN8z2S7xxn;
	Tue, 23 Jan 2024 10:48:56 +0800 (CST)
Received: from xm9614pcu.spreadtrum.com (10.13.2.29) by shmbx04.spreadtrum.com
 (10.0.1.214) with Microsoft SMTP Server (TLS) id 15.0.1497.23; Tue, 23 Jan
 2024 10:56:15 +0800
From: Zhifeng Tang <zhifeng.tang@unisoc.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang
	<baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Zhifeng Tang <zhifeng.tang23@gmail.com>,
        Wenming Wu <wenming.wu@unisoc.com>
Subject: [PATCH V4 0/3] Add reset controller driver for ums512
Date: Tue, 23 Jan 2024 10:56:10 +0800
Message-ID: <20240123025613.3976-1-zhifeng.tang@unisoc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: SHCAS01.spreadtrum.com (10.0.1.201) To
 shmbx04.spreadtrum.com (10.0.1.214)
X-MAIL:SHSQR01.spreadtrum.com 40N2uHJC022672

From: "zhifeng.tang" <zhifeng.tang@unisoc.com>

In most of Sprd SOCs,The clock controller register block also
contains reset bits for some of these peripherals,so reset
controller and clock provider are combined together as a block,
and put it under the driver/clk/.

Changes in v4:
  - Add description why reset controller put it under the driver/clk/

Changes in v3:
  - Fix the driver patch is overwritten by cover letter
  
Changes in v2:
  - The binding file is combined into one patch

zhifeng.tang (3):
  dt-bindings: reset: Add reset controller bindings for Unisoc's ums512
  clk: sprd: Add reset controller driver for ums512
  arm64: dts: sprd: Add reset controller driver for UMS512

 .../bindings/clock/sprd,ums512-clk.yaml       |   3 +
 arch/arm64/boot/dts/sprd/ums512.dtsi          |   9 +
 drivers/clk/sprd/Makefile                     |   1 +
 drivers/clk/sprd/common.c                     |   1 +
 drivers/clk/sprd/common.h                     |   2 +
 drivers/clk/sprd/reset.c                      |  78 ++++++
 drivers/clk/sprd/reset.h                      |  30 +++
 drivers/clk/sprd/ums512-clk.c                 | 240 ++++++++++++++++++
 include/dt-bindings/reset/sprd,ums512-reset.h | 203 +++++++++++++++
 9 files changed, 567 insertions(+)
 create mode 100644 drivers/clk/sprd/reset.c
 create mode 100644 drivers/clk/sprd/reset.h
 create mode 100644 include/dt-bindings/reset/sprd,ums512-reset.h

-- 
2.17.1


