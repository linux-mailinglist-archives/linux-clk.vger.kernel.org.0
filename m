Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E1A49966B
	for <lists+linux-clk@lfdr.de>; Thu, 22 Aug 2019 16:25:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388123AbfHVOZR (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 22 Aug 2019 10:25:17 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36036 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388085AbfHVOZG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Aug 2019 10:25:06 -0400
Received: by mail-wr1-f66.google.com with SMTP id r3so5637395wrt.3
        for <linux-clk@vger.kernel.org>; Thu, 22 Aug 2019 07:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KG2NcaIwbNAD280NQ64Qs5ode6pikwpdVx2HlcQqOdg=;
        b=Mbo1AIuvdMXerHdaswfzRwqBNLg0dn4ksMsbHBX6Gzz7CO7Ed8uL+57KRDLMsubeLI
         i9fwlUGa8+0jRP1vOy249LbGNk6rCoLl/5SsfipVbB/xjyDOYdJJNYFajO4lqCfdpUUa
         NoZd+QfZk+EgydZA+CESI2LeUcOwP/RnN6ck8dKPbdQW5zfLgajcRvdq6vyVCh5uMI/7
         WGhpSR0IStar+a3Sq2R6J4jcSvZSVx/eb5bYo3QM44Pw30SvS51m+9eaMlT2W0/cxmOS
         nmdqOZq+uKhu/pSdFXAyCX40rJv4yyIbON40DFdjY1381M1P25kT9V/MA/gK94kpSsBr
         brYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KG2NcaIwbNAD280NQ64Qs5ode6pikwpdVx2HlcQqOdg=;
        b=IxwSl/dgsGWAmsosaxI4KnfmcPfcS+4yaf5rkVomA/kGlD05HeSD9DvN/sDA4vs6yh
         dLa3HHR/ZE7/ExBN6ArRn5dQQXZHi/sdU/qq45u4fQ6PCxYEeYjffMNJ6XUMLzOlACbH
         5Nb78bQY6DNygmV8k13wUtmesB9a93yrtq+L2QzW6NNfsJ3IMUrapH0FBVjxpYB/MhhC
         CESWjT+4sG5F/kPppYCEtUyjjWEq2OIg3cgkQSlBlIOWzpuoMiDZNmQHClaSNYtt4VCp
         uXvYDmjy8MZxRJneDRkWz2wgR0+emn3ejOiJQixnbzPef/WlEbs9qopW4tC9Maqv4kZe
         x8CA==
X-Gm-Message-State: APjAAAVHTz+aXSyBHstoUapcDhvN5+zex4bW+Jollt40aCk18oUoa9oF
        OGFf1k2V0vDqMMH7iwG11LjknMeNbh5bCg==
X-Google-Smtp-Source: APXvYqx3Mh2RGDC4m6KW3PjxbIkLg6LPgBiTgdSz+Ekeh7xQUa6XovZaLMvsi4r6rmOAQz3j+lYyoQ==
X-Received: by 2002:adf:e708:: with SMTP id c8mr48174622wrm.25.1566483904374;
        Thu, 22 Aug 2019 07:25:04 -0700 (PDT)
Received: from bender.baylibre.local (176-150-251-154.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id d17sm25806547wrm.52.2019.08.22.07.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2019 07:25:03 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     khilman@baylibre.com, jbrunet@baylibre.com,
        devicetree@vger.kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] clk: meson: g12a: expose SM1 CPU 1, 2 & 3 clocks
Date:   Thu, 22 Aug 2019 16:24:54 +0200
Message-Id: <20190822142455.12506-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190822142455.12506-1-narmstrong@baylibre.com>
References: <20190822142455.12506-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Expose the newly added CPU1, CPU2 and CPU3 clocks bindings for the Amlogic
SM1 SoC.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/g12a.h              | 3 ---
 include/dt-bindings/clock/g12a-clkc.h | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/g12a.h b/drivers/clk/meson/g12a.h
index 4682a4442ae9..9c1dc6ade3d6 100644
--- a/drivers/clk/meson/g12a.h
+++ b/drivers/clk/meson/g12a.h
@@ -257,9 +257,6 @@
 #define CLKID_DSU_CLK_DYN			250
 #define CLKID_DSU_CLK_FINAL			251
 #define CLKID_DSU_CLK				252
-#define CLKID_CPU1_CLK				253
-#define CLKID_CPU2_CLK				254
-#define CLKID_CPU3_CLK				255
 
 #define NR_CLKS					256
 
diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index 8ccc29ac7a72..3cfefaf43315 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -138,5 +138,8 @@
 #define CLKID_VDEC_HEVCF			210
 #define CLKID_TS				212
 #define CLKID_CPUB_CLK				224
+#define CLKID_CPU1_CLK				253
+#define CLKID_CPU2_CLK				254
+#define CLKID_CPU3_CLK				255
 
 #endif /* __G12A_CLKC_H */
-- 
2.22.0

