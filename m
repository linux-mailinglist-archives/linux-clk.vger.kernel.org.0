Return-Path: <linux-clk+bounces-11892-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9399751D4
	for <lists+linux-clk@lfdr.de>; Wed, 11 Sep 2024 14:19:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 981C61F2327D
	for <lists+linux-clk@lfdr.de>; Wed, 11 Sep 2024 12:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6B651885B8;
	Wed, 11 Sep 2024 12:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R9DQxgmE"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4FE1885A3;
	Wed, 11 Sep 2024 12:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726057154; cv=none; b=AF7I66d91blmDV4N/nLX1CWOfZ8SYhYmDEALWIaq6VwrFPygZ45ORW/IosHY5EK/mIG/vcH2FsY6frW3Ga/YHOtLZwmfgk8aSVCxZVrDbZoCdp0oDcVwM+vqjBiUJmhkzGt1LHAGwrhQm9AqDJhIWUoYgRZ0IhmVEz+s3+VEx9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726057154; c=relaxed/simple;
	bh=nHQ1ZyxB8DkIVi0bUN9Uxebotk6c/QDHfUNbLag0h50=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZWOFfkAehAFlG/U4hrhpV/DTOv46mAVbZMPhMsNw3sw83mrW3ObSnJvI4NwJJEWwr6zFcZrOJ9PvI1ZeGZFm1gdVroEu+RkuQ/+PfvxA0+UW9f19Uf+MC+wjCnLEk9nNCtmwP5hcfSJ+g3zYW5VEKA3acy4qNGio510pXAjOqzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R9DQxgmE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B320C4CEC6;
	Wed, 11 Sep 2024 12:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726057154;
	bh=nHQ1ZyxB8DkIVi0bUN9Uxebotk6c/QDHfUNbLag0h50=;
	h=From:To:Cc:Subject:Date:From;
	b=R9DQxgmEefX+sKww5YqRQyIiFUVLXXSwyH8iWOITDQnVIVrYFqwnY0Nq/ICC2ovXF
	 +zmxp+Cf6F8Gdp+bwLJ2DscuOWMp4WhyAM1DBxDe/uUtprR/nGDIlw6qymbDSANRV1
	 LWyA+TsFZl2F1L8mcEo2yZkC8WVpURv2wCuowvl+LI0Sm1rh98o9rLogDBc2/H1ChF
	 Qn2ijXMTP6v0o4xBZI7i7WTEibThXcBQFJYLiLEAT8sYrjMc31sI4EaGyJcjsIGaZ+
	 E3eTZK4+oTSIOq93Od5+iC+1jfANZHb98YLc+Y3kCSB4EDlxvy8/9UkJyVxA4DDgT9
	 UdY0gsgNjKXnw==
From: Arnd Bergmann <arnd@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: ep93xx: add module license
Date: Wed, 11 Sep 2024 12:18:51 +0000
Message-Id: <20240911121909.2505018-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

When configured as a lodable module, this driver produces
a build time warning:

ERROR: modpost: missing MODULE_LICENSE() in drivers/clk/clk-ep93xx.o

All all three tags for license, author and description based
on the header.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/clk/clk-ep93xx.c | 4 ++++
 1 file changed, 4 insertions(+)

I had to add this to get a clean build with the ep93xx
series.

diff --git a/drivers/clk/clk-ep93xx.c b/drivers/clk/clk-ep93xx.c
index 4727c06a59ba..26317623d9d5 100644
--- a/drivers/clk/clk-ep93xx.c
+++ b/drivers/clk/clk-ep93xx.c
@@ -844,3 +844,7 @@ static struct auxiliary_driver ep93xx_clk_driver = {
 	.id_table	= ep93xx_clk_ids,
 };
 module_auxiliary_driver(ep93xx_clk_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Nikita Shubin <nikita.shubin@maquefel.me>");
+MODULE_DESCRIPTION("Clock control for Cirrus EP93xx chips");
-- 
2.39.2


