Return-Path: <linux-clk+bounces-29144-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 75964BDDAF3
	for <lists+linux-clk@lfdr.de>; Wed, 15 Oct 2025 11:15:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 07D02503F6E
	for <lists+linux-clk@lfdr.de>; Wed, 15 Oct 2025 09:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7EEB31B118;
	Wed, 15 Oct 2025 09:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="Hyfm5rZd"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-m32103.qiye.163.com (mail-m32103.qiye.163.com [220.197.32.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B47931AF3D;
	Wed, 15 Oct 2025 09:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760519619; cv=none; b=swcZUi5dhMBPbneSfBPxpPEUWglsVowoHdk+4aim788h21JP15l3Fm6por/LgsSc5dDHNy+CjVYb76ZaBSx5U1Ua+cmVQd8+RtQohgMPwO46J63ugOPHHgCmjqs98qXK3G3HTRftMU+KNlJLIugq3lh77d7ulvQIn8KwY7Xl9oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760519619; c=relaxed/simple;
	bh=R2i7/iWxTvrX1RQdQvd79TnBe02cKPCRBuFIzGxu0mY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XHO7pWB/YOkhWbSspNiXvAQ69efMBKn+D6TmWtGrCPV8xQBIz0BrOZLxGH+S0bXja20iO1DtQkVnjIJjRKv66909WamyctR2z6Hggn2aKOxbEaiDmPB7xMK8MeqVnpy60fxnnzpnSaxePYPHo6csWEnT+wKrHQ9VEL0i6tRXO5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=Hyfm5rZd; arc=none smtp.client-ip=220.197.32.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 25fe0166a;
	Wed, 15 Oct 2025 17:13:26 +0800 (GMT+08:00)
From: Elaine Zhang <zhangqing@rock-chips.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	sugar.zhang@rock-chips.com,
	zhangqing@rock-chips.com,
	heiko@sntech.de,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	huangtao@rock-chips.com
Subject: [PATCH v1 0/5] clk: rockchip: Add clock controller for the RV1126B
Date: Wed, 15 Oct 2025 17:13:20 +0800
Message-Id: <20251015091325.71333-1-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a99e72551d203a3kunmdd11480e6b2054
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkkfT1ZLHhpOSUhDSE1DHRpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Hyfm5rZdqfbV+Zm54hF1JZGTGqy7lX8fLtR2Q4j0G9AlbEArwrUQzy/RqZUe7sYkWo4XziVe7FnwpYw5vqWea+wcebrMsKZA3xk3/gU429u42lQEQmGn3U+efHykZ3Arg1aRGhnpi7LN6TTUe2QaPImx29orBP9i+qOh0uslTCg=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=7b6Z8fzetWYE+7cZhOYZwFJZsXm06iGFmfkTEFPEbLg=;
	h=date:mime-version:subject:message-id:from;

Add yaml and dt-bindings for the RV1126B.

Elaine Zhang (5):
  clk: rockchip: Implement rockchip_clk_register_armclk_v2()
  dt-bindings: clock, reset: Add support for rv1126b
  clk: rockchip: Add clock controller for the RV1126B
  dt-bindings: clock: Add support for rockchip pvtpll
  clk: rockchip: add support for pvtpll clk

 .../bindings/clock/rockchip,clk-pvtpll.yaml   |  100 ++
 .../bindings/clock/rockchip,rv1126b-cru.yaml  |   52 +
 drivers/clk/rockchip/Kconfig                  |    7 +
 drivers/clk/rockchip/Makefile                 |    1 +
 drivers/clk/rockchip/clk-cpu.c                |  165 +++
 drivers/clk/rockchip/clk-pvtpll.c             |  925 ++++++++++++++
 drivers/clk/rockchip/clk-rv1126b.c            | 1112 +++++++++++++++++
 drivers/clk/rockchip/clk.c                    |   24 +
 drivers/clk/rockchip/clk.h                    |   83 ++
 drivers/clk/rockchip/rst-rv1126b.c            |  444 +++++++
 .../dt-bindings/clock/rockchip,rv1126b-cru.h  |  392 ++++++
 .../dt-bindings/reset/rockchip,rv1126b-cru.h  |  405 ++++++
 12 files changed, 3710 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,clk-pvtpll.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rv1126b-cru.yaml
 create mode 100644 drivers/clk/rockchip/clk-pvtpll.c
 create mode 100644 drivers/clk/rockchip/clk-rv1126b.c
 create mode 100644 drivers/clk/rockchip/rst-rv1126b.c
 create mode 100644 include/dt-bindings/clock/rockchip,rv1126b-cru.h
 create mode 100644 include/dt-bindings/reset/rockchip,rv1126b-cru.h

-- 
2.34.1


