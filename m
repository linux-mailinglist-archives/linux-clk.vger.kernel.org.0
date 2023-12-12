Return-Path: <linux-clk+bounces-1272-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B78680F486
	for <lists+linux-clk@lfdr.de>; Tue, 12 Dec 2023 18:27:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC6191C20C99
	for <lists+linux-clk@lfdr.de>; Tue, 12 Dec 2023 17:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C38A37D895;
	Tue, 12 Dec 2023 17:27:02 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E9C5A1
	for <linux-clk@vger.kernel.org>; Tue, 12 Dec 2023 09:27:00 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rD6Wx-0001uP-MN; Tue, 12 Dec 2023 18:26:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rD6Ww-00FOPM-QL; Tue, 12 Dec 2023 18:26:50 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rD6Ww-001nbh-H3; Tue, 12 Dec 2023 18:26:50 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	linux-tegra@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 3/5] memory: tegra210-emc: Simplify usage of clk_rate_exclusive_get()
Date: Tue, 12 Dec 2023 18:26:40 +0100
Message-ID:  <1b4321a975ac1a903a0c816ef2cce80e7d75eae3.1702400947.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1702400947.git.u.kleine-koenig@pengutronix.de>
References: <cover.1702400947.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=956; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=ie4CKnPihpbljeuxgdDQACHBuHzPJFsgaUm9SE/yLlM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBleJfQjouCGPQwbVTQpZHCH3+mc5P4eZ8kxEPs7 4nUI3a0K5aJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZXiX0AAKCRCPgPtYfRL+ TrPSCACJPDSfzHiFme8LNMO5WXJD8MYT1blleR5sU2wv13himlwKpRz181lEcgpDPwv/d7r/nBn ovlNOR/cPdj22iF2Np1psWwvsUfXhnOijVNvyUuyZgsqjUW8TVMBoqg+yxKPfy1Ci+Xd6Em/Xl9 MsSz5I6yQHlYt79kc9K+UoSimvBDW7R8bFM91X+Fzb3PCkCVDDG8jKeAAORmcuILHZdB5+nRmpB AQAfTK3wpi13Fwr54EQ83CvVNencH39m0Y68owZMIH97xru6ER+rWbaNlR/yq6BgTqIY+S8REsv eH/xD+T8INlM+XNf0qnAttCf1OAC4WgQh9IiGZ7cSabVpWXK
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

clk_rate_exclusive_get() returns 0 unconditionally. So remove error
handling. This prepares making clk_rate_exclusive_get() return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/memory/tegra/tegra210-emc-core.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/memory/tegra/tegra210-emc-core.c b/drivers/memory/tegra/tegra210-emc-core.c
index 3300bde47c13..957bcaadb24f 100644
--- a/drivers/memory/tegra/tegra210-emc-core.c
+++ b/drivers/memory/tegra/tegra210-emc-core.c
@@ -2001,11 +2001,7 @@ static int __maybe_unused tegra210_emc_suspend(struct device *dev)
 	struct tegra210_emc *emc = dev_get_drvdata(dev);
 	int err;
 
-	err = clk_rate_exclusive_get(emc->clk);
-	if (err < 0) {
-		dev_err(emc->dev, "failed to acquire clock: %d\n", err);
-		return err;
-	}
+	clk_rate_exclusive_get(emc->clk);
 
 	emc->resume_rate = clk_get_rate(emc->clk);
 
-- 
2.42.0


