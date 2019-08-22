Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3026699C75
	for <lists+linux-clk@lfdr.de>; Thu, 22 Aug 2019 19:34:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404381AbfHVRZT (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 22 Aug 2019 13:25:19 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:44635 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404376AbfHVRZS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Aug 2019 13:25:18 -0400
Received: by mail-pl1-f196.google.com with SMTP id t14so3824695plr.11
        for <linux-clk@vger.kernel.org>; Thu, 22 Aug 2019 10:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Y6Dgg0LHIAz3laO+y1ntUkl0I7eVRTHEz+QlpqCcJzM=;
        b=TOXDCBl6f8xlElGz/1VgT87+cdII1cmN5ZgoolaAd7oEb3dKLp1S1aL8eIAK602wRA
         rFV3kajNzuMqA4UEKTCS3p+weiq9BteIBukmbisFxA48gsaY84KdHTxbIl+R7uti/zmz
         vKmYinXsuEL5HmhH7cQg7SvGd3IMVzS+tidp1iSw7IeQ5I3BILh31uDv6xkYym/ZUF22
         I+N3iNN6gjUqxDsC7MVj180HA/sXR/waBKbKAC6Ujfjt91vw4asNcnDuH9yG8hcd+pla
         GAc0mCLgB3uLH3bVSL7ZcOSv9zFfBCOpTcrSc+K2XP/54ZTAa50tjiJvklrL9DieJktS
         oDYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Y6Dgg0LHIAz3laO+y1ntUkl0I7eVRTHEz+QlpqCcJzM=;
        b=D0cMEbSJPjvTJQN5m+6XrfEFUQvpT0TwXFAL9B6/F6EERqURzMhk/T0sXl3yg8pvsg
         D5Xz23CipEIoadqSSWjSYMc8b1m5phN+8ZrZlw7TcWTVG0PB4gghvbtSJKm7WDNiDQnK
         PkaE95fY2iNsgOOHtngVbYCkKSImZUgN41A65u8FIy2+ElTiiiJ4AN/8xVUdZ9EDFkuP
         DkV+GARqyXCMYqRj1pnoTHRjLLJpbPqtTlig0gw5ihUGhNHteYGJ//W3jdP1mgp6O4g2
         TXEmDFE3CAzGVYX4DJ0NyDH0j63aMMmtgCdMdtcoW0BP+tNkA2yhnV5Xgb2p6JGU1/sO
         52Eg==
X-Gm-Message-State: APjAAAV+m2QMij0q+Q4QJpTCqaC0YX4h2E0PUdpIvsOgXgZ3t2iHJjTU
        7x/ljwReXHhlWBUb9j4BYPCO
X-Google-Smtp-Source: APXvYqyQha/e6kS2nojAOGpDDw4shsyn1hRc1sxUaHNJWwVW+IOzYG5yHHeYZaNx46NEZ2lrt6i+Eg==
X-Received: by 2002:a17:902:ab8f:: with SMTP id f15mr41150750plr.301.1566494717986;
        Thu, 22 Aug 2019 10:25:17 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:71cc:5738:24ad:193e:4b59:8a76])
        by smtp.gmail.com with ESMTPSA id r12sm31705798pgb.73.2019.08.22.10.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2019 10:25:17 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        haitao.suo@bitmain.com, darren.tsao@bitmain.com,
        fisher.cheng@bitmain.com, alec.lin@bitmain.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 5/8] arm64: dts: bitmain: Add clock controller support for BM1880 SoC
Date:   Thu, 22 Aug 2019 22:54:23 +0530
Message-Id: <20190822172426.25879-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822172426.25879-1-manivannan.sadhasivam@linaro.org>
References: <20190822172426.25879-1-manivannan.sadhasivam@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add clock controller support for Bitmain BM1880 SoC.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/bitmain/bm1880.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/bitmain/bm1880.dtsi b/arch/arm64/boot/dts/bitmain/bm1880.dtsi
index d65453f99a99..8471662413da 100644
--- a/arch/arm64/boot/dts/bitmain/bm1880.dtsi
+++ b/arch/arm64/boot/dts/bitmain/bm1880.dtsi
@@ -4,6 +4,7 @@
  * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  */
 
+#include <dt-bindings/clock/bm1880-clock.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/reset/bitmain,bm1880-reset.h>
 
@@ -66,6 +67,12 @@
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 	};
 
+	osc: osc {
+		compatible = "fixed-clock";
+		clock-frequency = <25000000>;
+		#clock-cells = <0>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -94,6 +101,15 @@
 				reg = <0x400 0x120>;
 			};
 
+			clk: clock-controller@e8 {
+				compatible = "bitmain,bm1880-clk";
+				reg = <0xe8 0x0c>, <0x800 0xb0>;
+				reg-names = "pll", "sys";
+				clocks = <&osc>;
+				clock-names = "osc";
+				#clock-cells = <1>;
+			};
+
 			rst: reset-controller@c00 {
 				compatible = "bitmain,bm1880-reset";
 				reg = <0xc00 0x8>;
-- 
2.17.1

