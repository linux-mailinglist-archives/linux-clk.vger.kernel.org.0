Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B9F65B79B
	for <lists+linux-clk@lfdr.de>; Mon,  1 Jul 2019 11:13:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728448AbfGAJNv (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 1 Jul 2019 05:13:51 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37338 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728438AbfGAJN0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 1 Jul 2019 05:13:26 -0400
Received: by mail-wr1-f68.google.com with SMTP id v14so12911485wrr.4
        for <linux-clk@vger.kernel.org>; Mon, 01 Jul 2019 02:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DvHtShj7KGwLsgDeVESsbeeuJPQVX1FTxQG4otfV4tc=;
        b=NzFd4yDO4l1vl0XdKs7v6lF+CqKqVcDpmpXK07uA9L2eqCtCNSeW67wkwWZZF3BC3i
         Z0543VnlYfSUwlgcoidkXwW3ka36MPS/qxj9AgOccpCZcJtzaM45qUNpZ+bISGcHzO9P
         8qW3kTvDFfB1vozhMFIepXr+g5NMuqVaVQdXVTlC9esermcZoG6FUtzoM0gMpTPslM2C
         yqWD3PiU+htIceVIiqtWFArZ+blrDkyfPdfbTi8YTPt3vJritJ4Xbj2iCLUFG05cQule
         F3WvMdxaLOR4S0OM5xNBAkZiP8GKHZkq4FAu8/XxBX8bKfk/25zO/q2mCBwlPFVEWs9W
         +3/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DvHtShj7KGwLsgDeVESsbeeuJPQVX1FTxQG4otfV4tc=;
        b=m85BAByZBC2596y5D4iEx3m5Vl3WD0NQ7uC7tc/DEIiqRuzeS6dlO2dU/f6Paui7SI
         1vCL2J8f8c/MTXzFDNVnavDJyaQej9CauCdOP/vvIUPlg8s/dYTrcOUqzvE/SYm440Nu
         TwY+7qqbhwE/ruopAKSLV4q0/p2NCn45LagdLYD2G8d6m0D4QqWEFHkVbVqVSvyUHA7M
         Ku8+TPD/nk2Kwku0H5EGxy9zY8GZMa2zW7ktUhJ1vQV6DH1J73vKuw3X8sdsY548YYgg
         EgOT6UBirD4jGTYqXpF5hWNZ8BrmmiMcjHu7svxvytVuVvpO6p6yyUoE2AH6wxZHfVR7
         K9RQ==
X-Gm-Message-State: APjAAAU9VNCzezTIF+PlKsLIU/n9FRSnmO0if4SJWUTIIs1FgMs+czjg
        YVhogl7kq845OKdainqHhSUw3Q==
X-Google-Smtp-Source: APXvYqynuamAaUge5Azq62zvMZ/av2t2RmIBK7BT3c1Xa6vX9mnxHGnONfD2Nl8rU5UF1BJc9LWBRw==
X-Received: by 2002:a5d:540e:: with SMTP id g14mr19552183wrv.346.1561972404503;
        Mon, 01 Jul 2019 02:13:24 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id i16sm6305659wrm.37.2019.07.01.02.13.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 01 Jul 2019 02:13:23 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, khilman@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        linux-gpio@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC/RFT v3 13/14] arm64: dts: meson-g12b: add cpus OPP tables
Date:   Mon,  1 Jul 2019 11:12:57 +0200
Message-Id: <20190701091258.3870-14-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190701091258.3870-1-narmstrong@baylibre.com>
References: <20190701091258.3870-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the OPP table taken from the HardKernel Odroid-N2 DTS.

The Amlogic G12B SoC seems to available in 2 types :
- low-speed: Cortex-A73 Cluster up to 1,704GHz
- high-speed: Cortex-A73 Cluster up to 2.208GHz

The Cortex-A73 Cluster can be clocked up to 1,896GHz for both types.

The Vendor Amlogic A311D OPP table are slighly different, with lower
voltages than the HardKernel S922X tables but seems to be high-speed type.

This adds the conservative OPP table with the S922X higher voltages
and the maximum low-speed OPP frequency.

The values were tested to be stable on an HardKernel Odroid-N2 board
running the arm64 cpuburn at [1] and cycling between all the possible
cpufreq translations for both clusters and checking the final frequency
using the clock-measurer, script at [2].

[1] https://github.com/ssvb/cpuburn-arm/blob/master/cpuburn-a53.S
[2] https://gist.github.com/superna9999/d4de964dbc0f84b7d527e1df2ddea25f

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi | 115 ++++++++++++++++++++
 1 file changed, 115 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
index d5edbc1a1991..98ae8a7c8b41 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
@@ -95,6 +95,121 @@
 			compatible = "cache";
 		};
 	};
+
+	cpu_opp_table_0: opp-table-0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+			opp-microvolt = <731000>;
+		};
+
+		opp-250000000 {
+			opp-hz = /bits/ 64 <250000000>;
+			opp-microvolt = <731000>;
+		};
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <731000>;
+		};
+
+		opp-666666666 {
+			opp-hz = /bits/ 64 <666666666>;
+			opp-microvolt = <731000>;
+		};
+
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <731000>;
+		};
+
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <731000>;
+		};
+
+		opp-1398000000 {
+			opp-hz = /bits/ 64 <1398000000>;
+			opp-microvolt = <761000>;
+		};
+
+		opp-1512000000 {
+			opp-hz = /bits/ 64 <1512000000>;
+			opp-microvolt = <791000>;
+		};
+
+		opp-1608000000 {
+			opp-hz = /bits/ 64 <1608000000>;
+			opp-microvolt = <831000>;
+		};
+
+		opp-1704000000 {
+			opp-hz = /bits/ 64 <1704000000>;
+			opp-microvolt = <861000>;
+		};
+
+		opp-1896000000 {
+			opp-hz = /bits/ 64 <1896000000>;
+			opp-microvolt = <981000>;
+		};
+	};
+
+	cpub_opp_table_1: opp-table-1 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+			opp-microvolt = <751000>;
+		};
+
+		opp-250000000 {
+			opp-hz = /bits/ 64 <250000000>;
+			opp-microvolt = <751000>;
+		};
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <751000>;
+		};
+
+		opp-666666666 {
+			opp-hz = /bits/ 64 <666666666>;
+			opp-microvolt = <751000>;
+		};
+
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-microvolt = <751000>;
+		};
+
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <771000>;
+		};
+
+		opp-1398000000 {
+			opp-hz = /bits/ 64 <1398000000>;
+			opp-microvolt = <791000>;
+		};
+
+		opp-1512000000 {
+			opp-hz = /bits/ 64 <1512000000>;
+			opp-microvolt = <821000>;
+		};
+
+		opp-1608000000 {
+			opp-hz = /bits/ 64 <1608000000>;
+			opp-microvolt = <861000>;
+		};
+
+		opp-1704000000 {
+			opp-hz = /bits/ 64 <1704000000>;
+			opp-microvolt = <891000>;
+		};
+	};
 };
 
 &clkc {
-- 
2.21.0

