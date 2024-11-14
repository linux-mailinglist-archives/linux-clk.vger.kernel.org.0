Return-Path: <linux-clk+bounces-14675-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8A29C85D6
	for <lists+linux-clk@lfdr.de>; Thu, 14 Nov 2024 10:16:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 270F91F22003
	for <lists+linux-clk@lfdr.de>; Thu, 14 Nov 2024 09:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A90C1DE8A1;
	Thu, 14 Nov 2024 09:15:48 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from ssh247.corpemail.net (ssh247.corpemail.net [210.51.61.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FBC1632F2;
	Thu, 14 Nov 2024 09:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.61.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731575748; cv=none; b=pkaZP+KDV3DMC3rxmLpH8BFos8NRnLzCqvuEbSSKYGRrbq5f7SluMVjJ5tvkXSplrnew/WLaCXhqjP9VRg7fuZJ7l0On2SYM60NeTfkJaqyOOJS1FRUJQO4XEx4QZk6O8RU3rtgShqlWugMDOQxJUQgp6GdIVHmaNoh1Jhl3ZT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731575748; c=relaxed/simple;
	bh=1CTaDWcDuZQRmu2/NOM/9uoCqFOUuI2ZFy8pf0WcQdM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KjW8fOpezPV/k1Z2OdrGVfZzWjSkbMDjmGUzbLLN76Rv0TiHH8f8P66mTvMsKlSkP7KQ/sJZRPzi7ripQl9pzr9piBpyEA7R4F1MUJcNfIgJSXvWuHlILv6M1wWkcBKJRWI2WRPVsQPrFKQ7Dz7V8K26Yww1A3m5pg4O5/WubG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.61.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from ssh247.corpemail.net
        by ssh247.corpemail.net ((D)) with ASMTP (SSL) id LMD00124;
        Thu, 14 Nov 2024 17:14:24 +0800
Received: from localhost.localdomain (10.94.17.107) by
 jtjnmail201605.home.langchao.com (10.100.2.5) with Microsoft SMTP Server id
 15.1.2507.39; Thu, 14 Nov 2024 17:14:24 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <david@lechnology.com>, <mturquette@baylibre.com>, <sboyd@kernel.orgv>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Charles Han
	<hanchunchao@inspur.com>
Subject: [PATCH] clk: davinci:  Add NULL check in davinci_lpsc_clk_register
Date: Thu, 14 Nov 2024 17:14:22 +0800
Message-ID: <20241114091422.75412-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
tUid: 20241114171424addff3dfa1181f83ea027cc03f17e146
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

devm_kasprintf() can return a NULL pointer on failure,but this
returned value in davinci_lpsc_clk_register() is not checked.
Add NULL check in davinci_lpsc_clk_register(), to handle kernel NULL
pointer dereference error.

Fixes: c6ed4d734bc7 ("clk: davinci: New driver for davinci PSC clocks")
Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 drivers/clk/davinci/psc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/davinci/psc.c b/drivers/clk/davinci/psc.c
index 355d1be0b5d8..bc271ea72721 100644
--- a/drivers/clk/davinci/psc.c
+++ b/drivers/clk/davinci/psc.c
@@ -277,6 +277,9 @@ davinci_lpsc_clk_register(struct device *dev, const char *name,
 
 	lpsc->pm_domain.name = devm_kasprintf(dev, GFP_KERNEL, "%s: %s",
 					      best_dev_name(dev), name);
+	if (!lpsc->pm_domain.name)
+		return -ENOMEM;
+
 	lpsc->pm_domain.attach_dev = davinci_psc_genpd_attach_dev;
 	lpsc->pm_domain.detach_dev = davinci_psc_genpd_detach_dev;
 	lpsc->pm_domain.flags = GENPD_FLAG_PM_CLK;
-- 
2.31.1


