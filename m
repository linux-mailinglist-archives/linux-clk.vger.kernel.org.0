Return-Path: <linux-clk+bounces-5239-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA1B89324F
	for <lists+linux-clk@lfdr.de>; Sun, 31 Mar 2024 18:03:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21A091F225F0
	for <lists+linux-clk@lfdr.de>; Sun, 31 Mar 2024 16:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F1F61474A4;
	Sun, 31 Mar 2024 16:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="n75yb7nR"
X-Original-To: linux-clk@vger.kernel.org
Received: from a.mx.secunet.com (a.mx.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85323146016;
	Sun, 31 Mar 2024 16:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=62.96.220.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711900932; cv=pass; b=GvDIhX9zCITmqZL/Ol334/oqcEai0LBI3C1NgA6JiU0hAPiPxx+ihpX0uFYCB1iEKbSQ8ZqV7KpJ/4CKMbkf7JRWnplBhS1JgMqPsqwYuOtf92sE5SB65r+bYeoqmezfMrYYW3ZoM1xzRTv/wJCIlMKmB93Ftdc+YhzRRQWmarY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711900932; c=relaxed/simple;
	bh=pXYEYgKZ3Uofr33TNsjVz/KOqp3itzo08YoqXY3ebkI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WthBTjoNDUO+PcspJw1b1u05sYYSHNdqiRPBHXvbpkrckF91Kr01+m5eY+PUVErC9CjLZSwl18/89K8+RElDYabZiQJXVTgrtKxRBZV+ZThX9GyNqGeHCFWjk0D/0rmsgFsnSACSByGcmmk5+8+HPSzxcyvkbJ4UonHb3wuwDos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=fail smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=n75yb7nR; arc=none smtp.client-ip=45.89.224.132; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; arc=pass smtp.client-ip=62.96.220.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=salutedevices.com
Received: from localhost (localhost [127.0.0.1])
	by a.mx.secunet.com (Postfix) with ESMTP id 11F3D20896;
	Sun, 31 Mar 2024 18:02:06 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
	by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JsFaHmWfJDiZ; Sun, 31 Mar 2024 18:02:05 +0200 (CEST)
Received: from mailout1.secunet.com (mailout1.secunet.com [62.96.220.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by a.mx.secunet.com (Postfix) with ESMTPS id BE0F0207D8;
	Sun, 31 Mar 2024 18:02:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 a.mx.secunet.com BE0F0207D8
Received: from cas-essen-01.secunet.de (unknown [10.53.40.201])
	by mailout1.secunet.com (Postfix) with ESMTP id B17D080004A;
	Sun, 31 Mar 2024 18:02:03 +0200 (CEST)
Received: from mbx-essen-01.secunet.de (10.53.40.197) by
 cas-essen-01.secunet.de (10.53.40.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 31 Mar 2024 18:02:03 +0200
Received: from Pickup by mbx-essen-01.secunet.de with Microsoft SMTP Server id
 15.1.2507.17; Sun, 31 Mar 2024 15:52:40 +0000
X-sender: <linux-kernel+bounces-125428-steffen.klassert=secunet.com@vger.kernel.org>
X-Receiver: <steffen.klassert@secunet.com>
 ORCPT=rfc822;steffen.klassert@secunet.com NOTIFY=NEVER;
 X-ExtendedProps=BQAVABYAAgAAAAUAFAARAPDFCS25BAlDktII2g02frgPADUAAABNaWNyb3NvZnQuRXhjaGFuZ2UuVHJhbnNwb3J0LkRpcmVjdG9yeURhdGEuSXNSZXNvdXJjZQIAAAUAagAJAAEAAAAAAAAABQAWAAIAAAUAQwACAAAFAEYABwADAAAABQBHAAIAAAUAEgAPAGIAAAAvbz1zZWN1bmV0L291PUV4Y2hhbmdlIEFkbWluaXN0cmF0aXZlIEdyb3VwIChGWURJQk9IRjIzU1BETFQpL2NuPVJlY2lwaWVudHMvY249U3RlZmZlbiBLbGFzc2VydDY4YwUACwAXAL4AAACheZxkHSGBRqAcAp3ukbifQ049REI2LENOPURhdGFiYXNlcyxDTj1FeGNoYW5nZSBBZG1pbmlzdHJhdGl2ZSBHcm91cCAoRllESUJPSEYyM1NQRExUKSxDTj1BZG1pbmlzdHJhdGl2ZSBHcm91cHMsQ049c2VjdW5ldCxDTj1NaWNyb3NvZnQgRXhjaGFuZ2UsQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz1zZWN1bmV0LERDPWRlBQAOABEABiAS9uuMOkqzwmEZDvWNNQUAHQAPAAwAAABtYngtZXNzZW4tMDIFADwAAgAADwA2AAAATWljcm9zb2Z0LkV4Y2hhbmdlLlRyYW5zcG9ydC5NYWlsUmVjaXBpZW50LkRpc3BsYXlOYW1lDwARAAAAS2xhc3NlcnQsIFN0ZWZmZW4FAAwAAgAABQBsAAIAAAUAWAAXAEoAAADwxQktuQQJQ5LSCNoNNn64Q049S2xhc3NlcnQgU3RlZmZlbixPVT1Vc2VycyxPVT1NaWdyYXRpb24sREM9c2VjdW5ldCxEQz1kZQUAJgACAAEFACIADwAxAAAAQXV0b1Jlc3BvbnNlU3VwcHJlc3M6IDANClRyYW5zbWl0SGlzdG9ye
	TogRmFsc2UNCg8ALwAAAE1pY3Jvc29mdC5FeGNoYW5nZS5UcmFuc3BvcnQuRXhwYW5zaW9uR3JvdXBUeXBlDwAVAAAATWVtYmVyc0dyb3VwRXhwYW5zaW9uBQAjAAIAAQ==
X-CreatedBy: MSExchange15
X-HeloDomain: b.mx.secunet.com
X-ExtendedProps: BQBjAAoAkAtrGbMv3AgFAGEACAABAAAABQA3AAIAAA8APAAAAE1pY3Jvc29mdC5FeGNoYW5nZS5UcmFuc3BvcnQuTWFpbFJlY2lwaWVudC5Pcmdhbml6YXRpb25TY29wZREAAAAAAAAAAAAAAAAAAAAAAAUASQACAAEFAAQAFCABAAAAHAAAAHN0ZWZmZW4ua2xhc3NlcnRAc2VjdW5ldC5jb20FAAYAAgABBQApAAIAAQ8ACQAAAENJQXVkaXRlZAIAAQUAAgAHAAEAAAAFAAMABwAAAAAABQAFAAIAAQUAYgAKACQAAADLigAABQBkAA8AAwAAAEh1Yg==
X-Source: SMTP:Default MBX-ESSEN-01
X-SourceIPAddress: 62.96.220.37
X-EndOfInjectedXHeaders: 15985
X-Virus-Scanned: by secunet
Received-SPF: Pass (sender SPF authorized) identity=mailfrom; client-ip=147.75.80.249; helo=am.mirrors.kernel.org; envelope-from=linux-kernel+bounces-125428-steffen.klassert=secunet.com@vger.kernel.org; receiver=steffen.klassert@secunet.com 
DKIM-Filter: OpenDKIM Filter v2.11.0 b.mx.secunet.com 1E977200BB
Authentication-Results: b.mx.secunet.com;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="n75yb7nR"
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.89.224.132
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711746306; cv=none; b=qIsA6lXUgqZJebWl/Gl4tlLxfvYekeJDzrNfk+b6fXnMkf1BHv+83TwSJAw03iBVty1kiRyscskrKmw0Y5EOPtdfKJg3mGmEXpRGOheaxFAUS16DC9HPlara+eJTc7+ifato3RR0ZVgo+thBBdCBf9j291RT1TToo/0bf44Q36g=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711746306; c=relaxed/simple;
	bh=pXYEYgKZ3Uofr33TNsjVz/KOqp3itzo08YoqXY3ebkI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hrR6SxubRXkANAhxvgAyimc04nhqr/11+vqzbuTwMSkNwnN6wzAYactPH5zIs/RLVoHYhkZx1hz9C3PKKTn55nCvgqFxXX3x56z8MNV6rKZMCWy4temjgAGDldAuN57Tj7+T5O7/h8E3W3PdsZulLnTHFpO/oFw0GD13u1o1MPo=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=n75yb7nR; arc=none smtp.client-ip=45.89.224.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 2DA06120019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1711746303;
	bh=v6iv2cWxrh0L5w2lrSwq07tbyW+/upAYliG0TyxpP3o=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=n75yb7nRtRwdTAS4wjIRKlbscogi02NEL+0ey+lQnVTTtp+mOcfI6HrJoGn8lHuN2
	 A6YTD4LlJN8gBo18oOk8l+1ShZ+WMF4e2E2PwasVdNXcyNn3fS9Ildt3OhoJ990rkK
	 b4LlXrrGUxkyBj6llNF85gYS8YCdE0847XOfAjPs6DmOgAzlM1w1A741E2A1yPyKKv
	 4hKrdy9Ptcm28W5Y8OGQHNRU27BO8FKvCjhlHwqbnByq3myO4eK3g/n8bvCXZeCUHa
	 F/jr/rjzAbpXaBqaoMb1DBETLarMCkSG5+4QdGI71xh5Ru9NiZfzWoSHNDaBQY9956
	 /2LSX6gzbqK0Q==
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <kernel@salutedevices.com>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Dmitry Rokosov
	<ddrokosov@salutedevices.com>
Subject: [PATCH v1 4/4] arm64: dts: amlogic: a1: setup CPU power management
Date: Sat, 30 Mar 2024 00:04:42 +0300
Message-ID: <20240329210453.27530-5-ddrokosov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240329210453.27530-1-ddrokosov@salutedevices.com>
References: <20240329210453.27530-1-ddrokosov@salutedevices.com>
Precedence: bulk
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184500 [Mar 29 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 14 0.3.14 5a0c43d8a1c3c0e5b0916cc02a90d4b950c01f96, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/03/29 16:52:00 #24511844
X-KSMG-AntiVirus-Status: Clean, skipped
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10

The Amlogic A1 SoC family utilizes static operating points and a
PWM-controlled core voltage regulator, which is specific to the board.
As the main CPU clock input, the SoC uses CLKID_CPU_CLK from the CPU
clock controller, which can be inherited from the system PLL (syspll) or
a fixed CPU clock.

Currently, the stable operating points at all frequencies are set to
800mV. This value is obtained from the vendor setup of several A1
boards.

Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 44 +++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index 0de809f4d42c..c57c7c1cd5f8 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -33,6 +33,13 @@ cpu0: cpu@0 {
 			reg = <0x0 0x0>;
 			enable-method = "psci";
 			next-level-cache = <&l2>;
+			clocks = <&clkc_cpu CLKID_CPU_CLK>;
+			clock-names = "core_clk";
+			operating-points-v2 = <&cpu_opp_table0>;
+			voltage-tolerance = <0>;
+			clock-latency = <50000>;
+			capacity-dmips-mhz = <400>;
+			dynamic-power-coefficient = <80>;
 			#cooling-cells = <2>;
 		};
 
@@ -42,6 +49,13 @@ cpu1: cpu@1 {
 			reg = <0x0 0x1>;
 			enable-method = "psci";
 			next-level-cache = <&l2>;
+			clocks = <&clkc_cpu CLKID_CPU_CLK>;
+			clock-names = "core_clk";
+			operating-points-v2 = <&cpu_opp_table0>;
+			voltage-tolerance = <0>;
+			clock-latency = <50000>;
+			capacity-dmips-mhz = <400>;
+			dynamic-power-coefficient = <80>;
 			#cooling-cells = <2>;
 		};
 
@@ -52,6 +66,36 @@ l2: l2-cache0 {
 		};
 	};
 
+	cpu_opp_table0: cpu_opp_table0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp00 {
+			opp-hz = /bits/ 64 <128000000>;
+			opp-microvolt = <800000>;
+		};
+		opp01 {
+			opp-hz = /bits/ 64 <256000000>;
+			opp-microvolt = <800000>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <512000000>;
+			opp-microvolt = <800000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <768000000>;
+			opp-microvolt = <800000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <1008000000>;
+			opp-microvolt = <800000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <800000>;
+		};
+	};
+
 	efuse: efuse {
 		compatible = "amlogic,meson-gxbb-efuse";
 		clocks = <&clkc_periphs CLKID_OTP>;
-- 
2.43.0



