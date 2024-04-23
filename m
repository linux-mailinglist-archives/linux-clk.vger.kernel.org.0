Return-Path: <linux-clk+bounces-6277-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B19E8ADE0C
	for <lists+linux-clk@lfdr.de>; Tue, 23 Apr 2024 09:12:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A22A1F21BC0
	for <lists+linux-clk@lfdr.de>; Tue, 23 Apr 2024 07:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFCB23FBA5;
	Tue, 23 Apr 2024 07:12:49 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55552210F8
	for <linux-clk@vger.kernel.org>; Tue, 23 Apr 2024 07:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713856369; cv=none; b=hKskxxTIU185h7Zmq9sjyENh71uJj9El0A7EyGfhU7I6WgrYdWPknbhu0SRuzsHnop5YTShqNf+5Lz/U/B6+oMfGibNdpVa+kIb6fazKNulcfC57vxaVwvG1vlWOlv9AXk2w6u8XhDleziH7rL+LGwYz/ZkjcXQpCmCr59q9Qg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713856369; c=relaxed/simple;
	bh=fQ4UVE6+6CmvmhJdhJsIrzZ7SFLcAeX7/JjxwWX44Ss=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qGIfFE3e+fDaYFov01m5q0XW13ZVH49Z4NZVuSUGyPvjzYkz/DdAc8FpuaAfx0zI0sUpCK+/k2Nwnv4elIsFrVCp9YYEI2EV0WQsyd+l2iRl43pn2QrULbfy5RLCINSBUsV+58Yae1CytaW3h5fXYElKyb8t7HiBupQMhoQRkds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rzAKU-0005Pe-6R; Tue, 23 Apr 2024 09:12:38 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rzAKT-00DpqQ-DL; Tue, 23 Apr 2024 09:12:37 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rzAKT-006lQZ-11;
	Tue, 23 Apr 2024 09:12:37 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Abel Vesa <abelvesa@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] clk: imx: imx8mp: Convert to platform remove callback returning void
Date: Tue, 23 Apr 2024 09:12:31 +0200
Message-ID: <20240423071232.463201-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2328; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=fQ4UVE6+6CmvmhJdhJsIrzZ7SFLcAeX7/JjxwWX44Ss=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmJ19gD+ey60Q7Nhcuckms6sc7hia2d0PrcgA61 25wyYCFd1mJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZidfYAAKCRCPgPtYfRL+ Tl6MB/9ewqqK8k3EJgNUQucdqRiJOeHsgqj+9R7jJdnfre4guZynzegjaBNiTZj1Eh3QTHqwUUq pCj1flKOlPO3XVFmphFRj9FD6svjQhLqGo5nX6/rYpUVd5j8xEnxbDYsNWqZoZcsItcKeWmrUfQ 55s6tGS7MHvqdcxRYoCs8paCvQ+Wxjq5Kf7OftuG0rTzGw7USCUjDxBOUectqjVP9HEX9HbjoM+ bmXbtYxMJPOVIiaWyOp53Thly1bbx1JKt3C8bJUeLfkSlVdOplKB+L2ZtQkoIUAoWrMCrahmN0h jys0PlKAAhqr2tXeO6U/54VCI3EgyqOijcJTRQXJQSBU54U+
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Fixes: 1496dd413b2e ("clk: imx: imx8mp: Add pm_runtime support for power saving")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

after the merge window leading to v6.10-rc1 (assuming Linus has >= 10 fingers
this cycle :-) I want to switch the prototype of struct
platform_driver::remove to return void. So please either merge this
patch together with 1496dd413b2e, or accept me sending this patch
together with the patch changing the function's prototype for inclusion
to Greg's driver-core tree.

Thanks
Uwe

 drivers/clk/imx/clk-imx8mp-audiomix.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
index 574a032309c1..be9df93b6adb 100644
--- a/drivers/clk/imx/clk-imx8mp-audiomix.c
+++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
@@ -346,11 +346,9 @@ static int clk_imx8mp_audiomix_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int clk_imx8mp_audiomix_remove(struct platform_device *pdev)
+static void clk_imx8mp_audiomix_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static int clk_imx8mp_audiomix_runtime_suspend(struct device *dev)
@@ -382,7 +380,7 @@ MODULE_DEVICE_TABLE(of, clk_imx8mp_audiomix_of_match);
 
 static struct platform_driver clk_imx8mp_audiomix_driver = {
 	.probe	= clk_imx8mp_audiomix_probe,
-	.remove = clk_imx8mp_audiomix_remove,
+	.remove_new = clk_imx8mp_audiomix_remove,
 	.driver = {
 		.name = "imx8mp-audio-blk-ctrl",
 		.of_match_table = clk_imx8mp_audiomix_of_match,
-- 
2.43.0


