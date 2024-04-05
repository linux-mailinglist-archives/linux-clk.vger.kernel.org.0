Return-Path: <linux-clk+bounces-5549-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 033228996AC
	for <lists+linux-clk@lfdr.de>; Fri,  5 Apr 2024 09:39:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9741C1F22F14
	for <lists+linux-clk@lfdr.de>; Fri,  5 Apr 2024 07:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD7D112D219;
	Fri,  5 Apr 2024 07:38:47 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFEE12BF07
	for <linux-clk@vger.kernel.org>; Fri,  5 Apr 2024 07:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712302727; cv=none; b=DlUKx7eFGvTHuVHMMjTzPOmhkIbzrWbLhOaQkC+qROOrGEVEny3AX2paHC1JcmOG+GPMXVDFTwF4tQWzG8yYTuD8ItmBoHHwjsGLeXQ4C4hxXPB57K1BgXvoKD9zsdPQnaWOtnGxbJz322KUCjFDFIfMtDWYY3U+kRr3J+ELrGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712302727; c=relaxed/simple;
	bh=vQ7YjdW+WbHpC0xLIHJMSfC4F3iRv6PGDZttPLSFsQQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UDk/OL6Ixiw2/WdvL79unrshutLLVRtL25QuSI4RhPwKABK+tKjooAizgbqQ9kqBY8m4RjVXqEeWOTjVcxkEs1to9YLU97HDnTY0dxrrEdQVdXgrmrFxJlaIBr7bg4ynS23uB1sZW/BFDhl0IB+Y84s+v2AjOBH0Vytb6SkOP4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1rse9n-0005mh-Ok; Fri, 05 Apr 2024 09:38:39 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1rse9m-00AWpw-TY; Fri, 05 Apr 2024 09:38:38 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1rse9m-008vil-2g;
	Fri, 05 Apr 2024 09:38:38 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 0/2] clk: rockchip: clk-rk3568.c: Add missing USB480M_PHY
 mux
Date: Fri, 05 Apr 2024 09:38:35 +0200
Message-Id: <20240405-clk-rk3568-usb480m-phy-mux-v1-0-6c89de20a6ff@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHuqD2YC/x3MSwqEMAwA0KtI1hOI2mrxKoOLWqMGxw8tFUW8+
 xSXb/NuCOyFAzTZDZ4PCbKtCfknAzfZdWSUPhkKKhQp0uh+M/q51JXBGDplaMF9unCJJ7KtjR3
 I5ew0pGD3PMj55t/2ef5cjpvlbAAAAA==
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 David Jander <david@protonic.nl>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712302718; l=597;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=vQ7YjdW+WbHpC0xLIHJMSfC4F3iRv6PGDZttPLSFsQQ=;
 b=pwLH7RsZeVqeRv+Hs6sgkNUdr9dYoH7nRa3mc+avkQ5L0thZNLZkWIUmnH8EIQpNAd0kaGpop
 qFfriVyuetMDyKDQu35LoOEtdH7ufuWyAF8Cz+6tgl5EKGYVtWF1AjH
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

This series adds a missing clock for the Rockchip RK3568.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
David Jander (1):
      clk: rockchip: clk-rk3568.c: Add missing USB480M_PHY mux

Sascha Hauer (1):
      dt-bindings: clock: rockchip: add USB480M_PHY mux

 drivers/clk/rockchip/clk-rk3568.c      | 4 ++++
 include/dt-bindings/clock/rk3568-cru.h | 1 +
 2 files changed, 5 insertions(+)
---
base-commit: 39cd87c4eb2b893354f3b850f916353f2658ae6f
change-id: 20240405-clk-rk3568-usb480m-phy-mux-ea78af0c1ec5

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>


