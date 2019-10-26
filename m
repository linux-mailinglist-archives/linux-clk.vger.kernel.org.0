Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EFD4E59C7
	for <lists+linux-clk@lfdr.de>; Sat, 26 Oct 2019 13:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726313AbfJZLDg (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 26 Oct 2019 07:03:36 -0400
Received: from mail-pf1-f170.google.com ([209.85.210.170]:44725 "EHLO
        mail-pf1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726350AbfJZLDe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 26 Oct 2019 07:03:34 -0400
Received: by mail-pf1-f170.google.com with SMTP id q21so3426342pfn.11
        for <linux-clk@vger.kernel.org>; Sat, 26 Oct 2019 04:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Y6Dgg0LHIAz3laO+y1ntUkl0I7eVRTHEz+QlpqCcJzM=;
        b=PcCgI+5Uk4+2QOtva7LrdqGw/ak4nk7qSeEMr723khYMa6gWpChw9Y1C3ZnkguEkqM
         c30XftThaNU0RSa1jFu71B1uf6OaYSYBcB1+3aDnHBRABZtmHFGr68aYpUFS3ksTD4yu
         ToYrqU935IGFVtWTsMtW3qnaOo5aYDgFcXgyuDIqA26QagZ/4qh3TR5nl9KDeCqjB79u
         2bZX41wlop6pBV3KM3JWxgPBzwmXbEOPrqIAo1GYRO8WMe/Q5SzURqTHazHRiF8o/m8X
         01ZsUl2qF4PCODOGd+L8C1enhAuY+jK1mYfmxzlSXzE7VpgOEss89Y7jkI+Sl7AEiEZc
         miag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Y6Dgg0LHIAz3laO+y1ntUkl0I7eVRTHEz+QlpqCcJzM=;
        b=YnuDv7MRzYc1uprYhvXrLbOH8JVve/zZ96d7u381QxYUuv7+XbfA8/wodaKIhsu9Q8
         yyVeOnBy1NMp9kAYFF/4yx4opAo933q8CNQVQGfjz+c7ioD5oVdwQlKKrP7jAr6Xo61i
         M/RhBcK3qzepyWhkEvSB9qU4tdYXj73okrtHozUPdyCucf8TRJjp2WtwpLIKDRPRnQI1
         fTzYupjd+aw/2B9djQcjg3qVAHvN+LOWe9WEBkkbIoPjUoxL2j1AAJ7aCNm7K2Uzi1K0
         Gv1mRmEGsvpVGAdZQRs/oiXBx7IBdhc6IkVWD+BImyeSYgoxOKFQpIpeEL6gJajnN8Xu
         MG8Q==
X-Gm-Message-State: APjAAAVYBpv0xnrFKKhi/+AbGitqBGkA0Jbf3WJFF8U2cBr/Sd5ul7lB
        jmTLVq2u22/kLa5ZAlwJh3D1
X-Google-Smtp-Source: APXvYqzowpzR04MTwmL3N8OyfcVyg17NzEjCzBIUt7ybdLxmxuCT8V1POkDgpr/m0PBBlzk8wfKDgQ==
X-Received: by 2002:a17:90a:a384:: with SMTP id x4mr1395313pjp.116.1572087812466;
        Sat, 26 Oct 2019 04:03:32 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:6214:69c4:49ad:ba3c:6f9:2d8a])
        by smtp.gmail.com with ESMTPSA id x129sm5543379pfx.14.2019.10.26.04.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2019 04:03:31 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        haitao.suo@bitmain.com, darren.tsao@bitmain.com,
        fisher.cheng@bitmain.com, alec.lin@bitmain.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v6 4/7] arm64: dts: bitmain: Add clock controller support for BM1880 SoC
Date:   Sat, 26 Oct 2019 16:32:50 +0530
Message-Id: <20191026110253.18426-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191026110253.18426-1-manivannan.sadhasivam@linaro.org>
References: <20191026110253.18426-1-manivannan.sadhasivam@linaro.org>
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

