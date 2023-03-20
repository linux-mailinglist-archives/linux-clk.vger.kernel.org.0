Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69F036C173C
	for <lists+linux-clk@lfdr.de>; Mon, 20 Mar 2023 16:12:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232220AbjCTPMU (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 20 Mar 2023 11:12:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232366AbjCTPLq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Mar 2023 11:11:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FE812BF3D;
        Mon, 20 Mar 2023 08:06:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 33FB76158A;
        Mon, 20 Mar 2023 15:06:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F024C433EF;
        Mon, 20 Mar 2023 15:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1679324807;
        bh=UeW1CQAAoSJChSLO401v/ThGrxNP3MJwVrLenSBvI1U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wSe0a56afta0j38V8Kx0QHTkqyo3RsXH5ni4fuIPKbTb90gVpv+gj5P1mW8mH6iFr
         lZhxQC8APHGGEZe8uplUfjtwdKRbChzF3vOyN0y6i1C+QK/e2SqPrErqyPKWmk7DUH
         MG58ZSSXfGvQExrhRRHBJ3YniAfNIj3DxIX33sPU=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     stable@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        patches@lists.linux.dev, Randy Dunlap <rdunlap@infradead.org>,
        Riku Voipio <riku.voipio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.1 008/198] clk: HI655X: select REGMAP instead of depending on it
Date:   Mon, 20 Mar 2023 15:52:26 +0100
Message-Id: <20230320145507.814907681@linuxfoundation.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230320145507.420176832@linuxfoundation.org>
References: <20230320145507.420176832@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit 0ffad67784a097beccf34d297ddd1b0773b3b8a3 ]

REGMAP is a hidden (not user visible) symbol. Users cannot set it
directly thru "make *config", so drivers should select it instead of
depending on it if they need it.

Consistently using "select" or "depends on" can also help reduce
Kconfig circular dependency issues.

Therefore, change the use of "depends on REGMAP" to "select REGMAP".

Fixes: 3a49afb84ca0 ("clk: enable hi655x common clk automatically")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Riku Voipio <riku.voipio@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org
Link: https://lore.kernel.org/r/20230226053953.4681-3-rdunlap@infradead.org
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index d79905f3e1744..5da82f2bdd211 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -92,7 +92,7 @@ config COMMON_CLK_RK808
 config COMMON_CLK_HI655X
 	tristate "Clock driver for Hi655x" if EXPERT
 	depends on (MFD_HI655X_PMIC || COMPILE_TEST)
-	depends on REGMAP
+	select REGMAP
 	default MFD_HI655X_PMIC
 	help
 	  This driver supports the hi655x PMIC clock. This
-- 
2.39.2



