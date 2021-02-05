Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B9643116CE
	for <lists+linux-clk@lfdr.de>; Sat,  6 Feb 2021 00:20:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbhBEXOJ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 5 Feb 2021 18:14:09 -0500
Received: from gloria.sntech.de ([185.11.138.130]:42274 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231838AbhBELFv (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 5 Feb 2021 06:05:51 -0500
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1l7yvB-0001Ja-NS; Fri, 05 Feb 2021 12:05:05 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     heiko@sntech.de
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Subject: [PATCH 3/5] clk: rockchip: add clock id for SCLK_VIP_OUT on rk3368
Date:   Fri,  5 Feb 2021 12:05:00 +0100
Message-Id: <20210205110502.1850669-3-heiko@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210205110502.1850669-1-heiko@sntech.de>
References: <20210205110502.1850669-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

Needed to provide clocks for cameras.

Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
---
 include/dt-bindings/clock/rk3368-cru.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/rk3368-cru.h b/include/dt-bindings/clock/rk3368-cru.h
index f89683295935..83c72a163fd3 100644
--- a/include/dt-bindings/clock/rk3368-cru.h
+++ b/include/dt-bindings/clock/rk3368-cru.h
@@ -78,6 +78,7 @@
 #define SCLK_TIMER13		136
 #define SCLK_TIMER14		137
 #define SCLK_TIMER15		138
+#define SCLK_VIP_OUT		139
 
 #define DCLK_VOP		190
 #define MCLK_CRYPTO		191
-- 
2.29.2

