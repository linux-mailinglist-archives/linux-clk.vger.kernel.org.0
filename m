Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A672363ECC
	for <lists+linux-clk@lfdr.de>; Mon, 19 Apr 2021 11:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231665AbhDSJkE (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 19 Apr 2021 05:40:04 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:28378 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S238722AbhDSJj4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Apr 2021 05:39:56 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13J9RIWe027862;
        Mon, 19 Apr 2021 11:39:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=A31WB8a45RdJNJyy4CkopYj1ZluLSRGlf/Y3plnveP0=;
 b=zQdb8hewoxpStiIEozGwG6tB8v7eyTxXJIaX9rgESd7vV7csIfrgr+3Xjbi0hka3i4VV
 zCSWAovmAUmEQ6K2Wn7JcTKKZXlEl9It9oIQVd3+kS9kSYoyw3KiVRUFpE/0KafpzZga
 YzAp4Z+EU6pc13F5M/Bx8HeQekN7WTqhPMg0LBvsygCXTimVo1ZMUaMcrAutH1oSNq6Z
 zwbu2OPcGSLHhLQyHY1UIL5N6l13oKes8xBfXuvzRivhmAji3M5aFL0tO+7EaZXVczYp
 N73JPv13SvlpIBpwS69TGrLBbOXH2S3yAPMGgtLSmh6bXCMHtxIJiKpsZvncc566KQHf Uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 380s8c3bgr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 19 Apr 2021 11:39:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8E357100034;
        Mon, 19 Apr 2021 11:39:11 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7BF7A20A07F;
        Mon, 19 Apr 2021 11:39:11 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 19 Apr 2021 11:39:11
 +0200
From:   <gabriel.fernandez@foss.st.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Etienne Carriere <etienne.carriere@st.com>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
        <marex@denx.de>
CC:     <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Etienne Carriere <etienne.carriere@foss.st.com>
Subject: [PATCH v3 07/11] dt-bindings: clock: add IDs for SCMI clocks on stm32mp15
Date:   Mon, 19 Apr 2021 11:38:48 +0200
Message-ID: <20210419093852.14978-8-gabriel.fernandez@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210419093852.14978-1-gabriel.fernandez@foss.st.com>
References: <20210419093852.14978-1-gabriel.fernandez@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-19_05:2021-04-16,2021-04-19 signatures=0
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

stm32mp15 TZ secure firmware provides SCMI clocks for oscillators, some
PLL output and few secure aware interfaces.
This change defines the SCMI clock identifiers used by SCMI agents
and servers.
Server SCMI0 exposes clocks and reset controllers for resources under
RCC[TZEN] configuration control.
Server SCMI1 exposes clocks for resources under RCC[MCKPROT] control.

Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 include/dt-bindings/clock/stm32mp1-clks.h | 27 +++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/include/dt-bindings/clock/stm32mp1-clks.h b/include/dt-bindings/clock/stm32mp1-clks.h
index 4cdaf135829c..e02770b98e6c 100644
--- a/include/dt-bindings/clock/stm32mp1-clks.h
+++ b/include/dt-bindings/clock/stm32mp1-clks.h
@@ -248,4 +248,31 @@
 
 #define STM32MP1_LAST_CLK 232
 
+/* SCMI clock identifiers */
+#define CK_SCMI0_HSE		0
+#define CK_SCMI0_HSI		1
+#define CK_SCMI0_CSI		2
+#define CK_SCMI0_LSE		3
+#define CK_SCMI0_LSI		4
+#define CK_SCMI0_PLL2_Q		5
+#define CK_SCMI0_PLL2_R		6
+#define CK_SCMI0_MPU		7
+#define CK_SCMI0_AXI		8
+#define CK_SCMI0_BSEC		9
+#define CK_SCMI0_CRYP1		10
+#define CK_SCMI0_GPIOZ		11
+#define CK_SCMI0_HASH1		12
+#define CK_SCMI0_I2C4		13
+#define CK_SCMI0_I2C6		14
+#define CK_SCMI0_IWDG1		15
+#define CK_SCMI0_RNG1		16
+#define CK_SCMI0_RTC		17
+#define CK_SCMI0_RTCAPB		18
+#define CK_SCMI0_SPI6		19
+#define CK_SCMI0_USART1		20
+
+#define CK_SCMI1_PLL3_Q		0
+#define CK_SCMI1_PLL3_R		1
+#define CK_SCMI1_MCU		2
+
 #endif /* _DT_BINDINGS_STM32MP1_CLKS_H_ */
-- 
2.17.1

