Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4AED5653A
	for <lists+linux-clk@lfdr.de>; Wed, 26 Jun 2019 11:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727139AbfFZJHY (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 26 Jun 2019 05:07:24 -0400
Received: from mail-wr1-f45.google.com ([209.85.221.45]:45813 "EHLO
        mail-wr1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727131AbfFZJGu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Jun 2019 05:06:50 -0400
Received: by mail-wr1-f45.google.com with SMTP id f9so1746172wre.12
        for <linux-clk@vger.kernel.org>; Wed, 26 Jun 2019 02:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ilVEeuyiLJqEM//7LRcyaeEvGW66sRMbkqNNEOmiSkI=;
        b=cwwWP69NVx6TY/Gz7Z5p/lOUqhwSvirq/vUFxmAFk6SolV3fKhmbczvggqjW5Mlk3A
         pDSxzCm/JDvZOz1aoNw1hlKwtY+LoadFpo84hRAKUUFzkK6cUwfWKJJMFJV9AYtbzWCr
         /KJsASkXrd6fkobkgaqua+oCVzf5D5X0pyHOpksG9HOx40Gg4BLd/oZQ7RM0r/mjWd6L
         B7GDAvIbXTTDRJi6PQI8gLJDWi1eUBjM7aQTRV9fPVaijB8D8Bo/oNMaOpXO8yR3P8J7
         gDWR309Auoj3m0VarJzHvrCdAdsnrv0hV+7Qj8GrjPkvyrWiJ8LTzyR94NiLZsMrIiGk
         HuUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ilVEeuyiLJqEM//7LRcyaeEvGW66sRMbkqNNEOmiSkI=;
        b=ERlfmgSEyDV6sIldhn0XHboMbY0eiC+Pt3TRRaxYyWAyQSIMA6g6UXmyh7vUiHHZH+
         hI5/GYag48Mr5QILOXFzHCS2k3rmB4dgrX4uMs1ZZ0wxLHay1FsHxz+4L1lzymQfemCS
         4T4dRAnfX4cAOMA+DFStXXaAP4VyvZpF2mVifWFEU7PjgysygayI1EAK7lecu8Df8Z3T
         1VAlXjioura/nnWchapyU91dlqVwkwTGrxZt3KTuRYVYrEQVVo2l4jXBNxXXOhRruGOV
         8kygPj0zblo4ubcHXrpC6wYa+tRiZ9Rx2DV8OiyHFXJaLthdN8Kvp8J55dW3yCBnUeqP
         2gkQ==
X-Gm-Message-State: APjAAAX/FGMLVHIYdmRU4ji1KrKd5NkxpGKqS8ire8RzFeuEGCTeEInm
        5A6jZNc99zGHaPminiIP0UkuWw==
X-Google-Smtp-Source: APXvYqzb1BGQn5vh83E/EV9iV7LTP4OmIHphpQesTpBpBMUvyLfTVQWwspLS+svQzdCN9waUUwRJIQ==
X-Received: by 2002:a5d:518f:: with SMTP id k15mr2642212wrv.321.1561540008423;
        Wed, 26 Jun 2019 02:06:48 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o6sm1925797wmc.46.2019.06.26.02.06.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 26 Jun 2019 02:06:47 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, khilman@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        linux-gpio@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC/RFT v2 11/14] arm64: dts: meson-g12a: add cpus OPP table
Date:   Wed, 26 Jun 2019 11:06:29 +0200
Message-Id: <20190626090632.7540-12-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190626090632.7540-1-narmstrong@baylibre.com>
References: <20190626090632.7540-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the OPP table taken from the vendor u200 and u211 DTS.

The Amlogic G12A SoC seems to available in 3 types :
- low-speed: up to 1,8GHz
- mid-speed: up to 1,908GHz
- high-speed: up to 2.1GHz

And the S905X2 opp voltages are slightly higher than the S905D2
OPP voltages for the low-speed table.

This adds the conservative OPP table with the S905X2 higher voltages
and the maximum low-speed OPP frequency.

The values were tested to be stable on an Amlogic U200 Reference Board,
SeiRobotics SEI510 and X96 Max Set-Top-Boxes running the arm64 cpuburn
at [1] and cycling between all the possible cpufreq translations and
checking the final frequency using the clock-measurer, script at [2].

[1] https://github.com/ssvb/cpuburn-arm/blob/master/cpuburn-a53.S
[2] https://gist.github.com/superna9999/d4de964dbc0f84b7d527e1df2ddea25f

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 60 +++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index ac15967bb7fa..733a9d46fc4b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -48,6 +48,66 @@
 			compatible = "cache";
 		};
 	};
+
+	cpu_opp_table: opp-table {
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
+		opp-667000000 {
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
+		opp-1800000000 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-microvolt = <981000>;
+		};
+	};
 };
 
 &sd_emmc_a {
-- 
2.21.0

