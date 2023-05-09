Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 498FD6FBEA4
	for <lists+linux-clk@lfdr.de>; Tue,  9 May 2023 07:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbjEIF2S (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 9 May 2023 01:28:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjEIF2R (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 May 2023 01:28:17 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F4EF9025;
        Mon,  8 May 2023 22:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683610096; x=1715146096;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YOW7Hn4s9yWFPggxPjKYjh0bJ/JrU0+7299boe9n1YE=;
  b=IbnRFnELMDqmFer9uxXCrXz1XiyvoT+gRxRS1r3W49ttUiu1KghYhG+A
   N/6zDQWxdH+jKDw5uWQo7yne+wo5IyHQohrweU2eFmb0BBmhtnmxgxFMw
   +MDS/FEBDNHPXYKEUEZXVw8YJdarLiTuSNFeJmVek+Y90Afidp6NMg19H
   fiQ7Zj/F4/zSEWxs6vowX2AQiLg8w+I8fwoKojK7xP3le1Ex1wecA6J+l
   Pim47rrZ+pAyZ41qM1CT2tkzz1++J5vfFvRqE3krcdGKir3sODDbPpaxA
   BpGw3IHycLSASxYldX1sojq7SIi/VWIRo1p6zzPYVJC3kkHJB0olzy73r
   g==;
X-IronPort-AV: E=Sophos;i="5.99,261,1677567600"; 
   d="scan'208";a="210291694"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 May 2023 22:28:14 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 8 May 2023 22:28:14 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Mon, 8 May 2023 22:28:10 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>
CC:     <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v3 0/5] dt-bindings: clocks: at91: convert to yaml
Date:   Tue, 9 May 2023 08:27:52 +0300
Message-ID: <20230509052757.539274-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

This series converts atmel clocks bindings (PMC and slow clock
controller) to YAML. Along with it updated device trees to cope
with the dt-binding requirements.

Thank you,
Claudiu Beznea

Changes in v3:
- in patch 2/5:
	- get rid of 1st "items" section and embedd it in the last compatible
	  enum
	- sort alphanumerically the compatibles in allOf
- collected tags

Changes in v2:
- in patch 2/5:
	- dropped quotes from $id and $schema
	- get rid of 1st "items" sections corresponding to "atmel,at91sam9260-pmc",
	  "syscon" compatible and move it to the proper enum
	- ordered compatibles by name
	- add description for #clock-cells
	- remove blank lines
	- keep order in required (same order that the properties were
	  defined)
	- dropped required from allOf

- in patch 5/5:
	- dropped quotes from $id and $schema
	- drop first "items:" in compatible:oneOf section
	- ordered compatibles by name
	- moved additionalProperties after allOf
	- dropped microchip,sama7g5-sckc from first allOf:if section
	- moved "required" section from allOf to global "required" section
	- dropped if:then from the last if:then:else in allOf

Claudiu Beznea (5):
  ARM: dts: at91: use clock-controller name for PMC nodes
  dt-bindings: clocks: atmel,at91rm9200-pmc: convert to yaml
  ARM: dts: at91: at91sam9n12: witch sckc to new clock bindings
  ARM: dts: at91: use clock-controller name for sckc nodes
  dt-bindings: clocks: at91sam9x5-sckc: convert to yaml

 .../devicetree/bindings/clock/at91-clock.txt  |  58 -------
 .../bindings/clock/atmel,at91rm9200-pmc.yaml  | 152 ++++++++++++++++++
 .../bindings/clock/atmel,at91sam9x5-sckc.yaml |  70 ++++++++
 arch/arm/boot/dts/at91rm9200.dtsi             |   2 +-
 arch/arm/boot/dts/at91sam9260.dtsi            |   2 +-
 arch/arm/boot/dts/at91sam9261.dtsi            |   2 +-
 arch/arm/boot/dts/at91sam9263.dtsi            |   2 +-
 arch/arm/boot/dts/at91sam9g20.dtsi            |   2 +-
 arch/arm/boot/dts/at91sam9g25.dtsi            |   2 +-
 arch/arm/boot/dts/at91sam9g35.dtsi            |   2 +-
 arch/arm/boot/dts/at91sam9g45.dtsi            |   4 +-
 arch/arm/boot/dts/at91sam9n12.dtsi            |  25 +--
 arch/arm/boot/dts/at91sam9rl.dtsi             |   4 +-
 arch/arm/boot/dts/at91sam9x25.dtsi            |   2 +-
 arch/arm/boot/dts/at91sam9x35.dtsi            |   2 +-
 arch/arm/boot/dts/at91sam9x5.dtsi             |   4 +-
 arch/arm/boot/dts/sam9x60.dtsi                |   4 +-
 arch/arm/boot/dts/sama5d2.dtsi                |   4 +-
 arch/arm/boot/dts/sama5d3.dtsi                |   4 +-
 arch/arm/boot/dts/sama5d3_emac.dtsi           |   2 +-
 arch/arm/boot/dts/sama5d4.dtsi                |   4 +-
 arch/arm/boot/dts/sama7g5.dtsi                |   2 +-
 22 files changed, 251 insertions(+), 104 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/at91-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/atmel,at91sam9x5-sckc.yaml

-- 
2.34.1

