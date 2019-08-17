Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3445591245
	for <lists+linux-clk@lfdr.de>; Sat, 17 Aug 2019 20:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbfHQSgu (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 17 Aug 2019 14:36:50 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38625 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbfHQSgu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 17 Aug 2019 14:36:50 -0400
Received: by mail-pf1-f194.google.com with SMTP id o70so4808442pfg.5
        for <linux-clk@vger.kernel.org>; Sat, 17 Aug 2019 11:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=kgB5pCuOS2QWyyNQUlCeMbbF7mRF+VE6sHHJ2GG7b1c=;
        b=uW56X9mB4435xrtyM40w+aaSPLMr1FKhNxxAQkqlLatbn/Kn9xOnGq44FCOfZowWF+
         LruelNA+9SBbifr5rB3rI+9X4zDd9hkFfZLH+hKj8pB6KsoSSAtfyq4Ifb6S/ezVR/yS
         MabDAEute9uPW2V7gUpiwyFcvx+W/N57xezT/Du+4ViAeeGlM7kv9RcMSCnh5I48IFyd
         bO4/SWraqsYrGFDI0K4GWO2zdIPj7FI1M0WyvvpYBEETZR795nb60H07JGb65MEaDqiz
         0snwK8P7ghPimyxSTI331P8u0ZyENt+JlAJHduOI5qoteyzWu9h5b6ldCrnWBKB/cHrO
         4Kzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=kgB5pCuOS2QWyyNQUlCeMbbF7mRF+VE6sHHJ2GG7b1c=;
        b=VjdzsGlQUCsolGd0c74GcpsrOM6Yoi4KDBhOP7WdMdpnKq+qKPRIOyHARtlUlK8c6W
         eaoxuKb1dINqeygG6siRSjN1C+/R8vhn6tgVZ4nMUvc1X7hxJTxQ9ioztxV0ZsKuygRh
         osME03ei1Ocy+mKn+hU6RBE+r4SgtdPjbJxE2GNUiSxFtxa9DeyqpuKItF/0OkO+NXnb
         lJCYh997/svNqi8xksaZDgAgSeCq56XlgfEOu/mYYW6n+WKZB/HKz1bFqLW3iXv0h2bm
         NpFVVRKmxWvJFr5yhr6QIAWW7Mghj6R2ul7A7yZSoakXivRI/by61s3C17EEVUk1BusR
         +eMg==
X-Gm-Message-State: APjAAAXsCBaI1vsFA4qIRaK4jGpwCfdBmUuRWvJV5SziaE4YTuair+Ro
        cZZ7+tAPQaPH/hNQfvk+9hcw
X-Google-Smtp-Source: APXvYqyBT5Br1IL1veJw48mSqP3SwFW1RXkYgHW02hkeTnWqbi5NyNn8A4WoKj4ffDHUuPfds9MNlg==
X-Received: by 2002:a63:460d:: with SMTP id t13mr12546644pga.205.1566067009189;
        Sat, 17 Aug 2019 11:36:49 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:909:4559:9185:a772:a21d:70ac])
        by smtp.gmail.com with ESMTPSA id 33sm8588640pgy.22.2019.08.17.11.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2019 11:36:48 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        haitao.suo@bitmain.com, darren.tsao@bitmain.com,
        fisher.cheng@bitmain.com, alec.lin@bitmain.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 3/7] arm64: dts: bitmain: Source common clock for UART controllers
Date:   Sun, 18 Aug 2019 00:06:10 +0530
Message-Id: <20190817183614.8429-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190817183614.8429-1-manivannan.sadhasivam@linaro.org>
References: <20190817183614.8429-1-manivannan.sadhasivam@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Remove fixed clock and source common clock for UART controllers.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/bitmain/bm1880-sophon-edge.dts |  9 ---------
 arch/arm64/boot/dts/bitmain/bm1880.dtsi            | 12 ++++++++++++
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/bitmain/bm1880-sophon-edge.dts b/arch/arm64/boot/dts/bitmain/bm1880-sophon-edge.dts
index 3e8c70778e24..7a2c7f9c2660 100644
--- a/arch/arm64/boot/dts/bitmain/bm1880-sophon-edge.dts
+++ b/arch/arm64/boot/dts/bitmain/bm1880-sophon-edge.dts
@@ -49,12 +49,6 @@
 		reg = <0x1 0x00000000 0x0 0x40000000>; // 1GB
 	};
 
-	uart_clk: uart-clk {
-		compatible = "fixed-clock";
-		clock-frequency = <500000000>;
-		#clock-cells = <0>;
-	};
-
 	soc {
 		gpio0: gpio@50027000 {
 			porta: gpio-controller@0 {
@@ -173,21 +167,18 @@
 
 &uart0 {
 	status = "okay";
-	clocks = <&uart_clk>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart0_default>;
 };
 
 &uart1 {
 	status = "okay";
-	clocks = <&uart_clk>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1_default>;
 };
 
 &uart2 {
 	status = "okay";
-	clocks = <&uart_clk>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart2_default>;
 };
diff --git a/arch/arm64/boot/dts/bitmain/bm1880.dtsi b/arch/arm64/boot/dts/bitmain/bm1880.dtsi
index 8471662413da..fa6e6905f588 100644
--- a/arch/arm64/boot/dts/bitmain/bm1880.dtsi
+++ b/arch/arm64/boot/dts/bitmain/bm1880.dtsi
@@ -174,6 +174,9 @@
 		uart0: serial@58018000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x0 0x58018000 0x0 0x2000>;
+			clocks = <&clk BM1880_CLK_UART_500M>,
+				 <&clk BM1880_CLK_APB_UART>;
+			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
@@ -184,6 +187,9 @@
 		uart1: serial@5801A000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x0 0x5801a000 0x0 0x2000>;
+			clocks = <&clk BM1880_CLK_UART_500M>,
+				 <&clk BM1880_CLK_APB_UART>;
+			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
@@ -194,6 +200,9 @@
 		uart2: serial@5801C000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x0 0x5801c000 0x0 0x2000>;
+			clocks = <&clk BM1880_CLK_UART_500M>,
+				 <&clk BM1880_CLK_APB_UART>;
+			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
@@ -204,6 +213,9 @@
 		uart3: serial@5801E000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x0 0x5801e000 0x0 0x2000>;
+			clocks = <&clk BM1880_CLK_UART_500M>,
+				 <&clk BM1880_CLK_APB_UART>;
+			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
-- 
2.17.1

