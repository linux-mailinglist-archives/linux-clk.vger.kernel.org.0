Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 208BE163DBF
	for <lists+linux-clk@lfdr.de>; Wed, 19 Feb 2020 08:35:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726802AbgBSHeD (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 19 Feb 2020 02:34:03 -0500
Received: from [167.172.186.51] ([167.172.186.51]:35098 "EHLO shell.v3.sk"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726163AbgBSHeD (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 19 Feb 2020 02:34:03 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 13665E007A;
        Wed, 19 Feb 2020 07:34:17 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id mWa3L8iDaQ_k; Wed, 19 Feb 2020 07:34:13 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 8B236E0052;
        Wed, 19 Feb 2020 07:34:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id P04ULaU_ck5M; Wed, 19 Feb 2020 07:34:13 +0000 (UTC)
Received: from furthur.lan (unknown [109.183.109.54])
        by zimbra.v3.sk (Postfix) with ESMTPSA id F18E1E0031;
        Wed, 19 Feb 2020 07:34:12 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 01/10] clk: mmp2: Remove a unused prototype
Date:   Wed, 19 Feb 2020 08:33:44 +0100
Message-Id: <20200219073353.184336-2-lkundrak@v3.sk>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219073353.184336-1-lkundrak@v3.sk>
References: <20200219073353.184336-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

There is no mmp_clk_register_pll2() routine.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 drivers/clk/mmp/clk.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/mmp/clk.h b/drivers/clk/mmp/clk.h
index 70bb73257647a..5bcbced3f458e 100644
--- a/drivers/clk/mmp/clk.h
+++ b/drivers/clk/mmp/clk.h
@@ -124,9 +124,6 @@ extern struct clk *mmp_clk_register_gate(struct devic=
e *dev, const char *name,
 			u32 val_disable, unsigned int gate_flags,
 			spinlock_t *lock);
=20
-
-extern struct clk *mmp_clk_register_pll2(const char *name,
-		const char *parent_name, unsigned long flags);
 extern struct clk *mmp_clk_register_apbc(const char *name,
 		const char *parent_name, void __iomem *base,
 		unsigned int delay, unsigned int apbc_flags, spinlock_t *lock);
--=20
2.24.1

