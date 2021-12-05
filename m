Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A611468D95
	for <lists+linux-clk@lfdr.de>; Sun,  5 Dec 2021 23:12:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239851AbhLEWPx (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 5 Dec 2021 17:15:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbhLEWPv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 5 Dec 2021 17:15:51 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4703C061714;
        Sun,  5 Dec 2021 14:12:23 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id x15so35426037edv.1;
        Sun, 05 Dec 2021 14:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2MahrjkXZ4UIthtPni3/t8vPGDzWR2eW8GdS0zcHvbI=;
        b=htW/InzEw6HzSr3F2MNZlWfwmokStZz9ol6pwrifPX9ew9C1ZdrcKV9jjc2BVZSSBk
         m5y1kSygIPAmaPOe4DlYkDJoTJXuw0FirvnvtvFBTXQlboVxrj/J6jsCuMIMf/nxt9ud
         KVx6wx37Yv1e9Ucorvfqa7DmoZErIvzfoiH4/XMCBzLlDgqxwD3AsjLgR2XC7SzR/Z2J
         tUH2JjQxQl2qXypTgrbpruLjfD6mQ8PjP+S4ETxgoDusuOW74KS7qn2YeITYsqUya25R
         dh4hgqlU8ZGbGOTB1ZmTUF0qqWYTzgwG7TaXSo/Ln0+W035YhAfPw3fnXgP3+8xR3Rc0
         eZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2MahrjkXZ4UIthtPni3/t8vPGDzWR2eW8GdS0zcHvbI=;
        b=fobYPao7XUfCpmTWKcupu9AD8zvmFaHlwk1mobZ/rNUBhnq/s/Kx9ot0BOyWSpdDgC
         ODZNJlZ4zpj4yQjGEtAk5mZvzsqz2xWtdZebXS6Ap5MY/DFa3spTDy1X3VrIDMbO1agk
         QmPthwvY1UMIV2BBY66xKAFxw94rwWc571B5TOdIqUI5Ow+IH5cofgvt8qDzRbXCd0Lr
         EctOet0gGO/esl/D2QZjUvQzGvwb65aomIKwG3ztfDnUol9uN9DMoRGA+oCZvLWxmca3
         iKRXY48Aa0Bk//TQ2b+L/ki8z7l2rAiifIakLx0LvbacoY24Fs+Al87MBDiHmDm30ZbB
         tz1A==
X-Gm-Message-State: AOAM533endOFYE1Uar4bMz3GS2Kxhgf3CKD1hZvZ0XrapS+4+yPQWv6x
        Zb6nT0JIgGfKaROoAGzBl8A=
X-Google-Smtp-Source: ABdhPJwzsCv+VRySOzSVLcq+J4ssjd2MmJgfOXO0lpdjotSbEPuW7H8YAyA7qUJ2qiUJcVc0miMGfA==
X-Received: by 2002:a17:906:54e:: with SMTP id k14mr40384028eja.268.1638742342487;
        Sun, 05 Dec 2021 14:12:22 -0800 (PST)
Received: from localhost.localdomain ([2a02:ab88:368f:2080:eab:126a:947d:3008])
        by smtp.googlemail.com with ESMTPSA id gb18sm5608079ejc.95.2021.12.05.14.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 14:12:22 -0800 (PST)
From:   David Virag <virag.david003@gmail.com>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        David Virag <virag.david003@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 1/7] dt-bindings: clock: Add bindings definitions for Exynos7885 CMU
Date:   Sun,  5 Dec 2021 23:11:00 +0100
Message-Id: <20211205221108.193400-2-virag.david003@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211205221108.193400-1-virag.david003@gmail.com>
References: <20211205221108.193400-1-virag.david003@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Just like on Exynos850, the clock controller driver is designed to have
separate instances for each particular CMU, so clock IDs start from 1
for each CMU in this bindings header too.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Signed-off-by: David Virag <virag.david003@gmail.com>
---
Changes in v2:
  - Added R-b tag by Krzysztof Kozlowski

 include/dt-bindings/clock/exynos7885.h | 115 +++++++++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 include/dt-bindings/clock/exynos7885.h

diff --git a/include/dt-bindings/clock/exynos7885.h b/include/dt-bindings/clock/exynos7885.h
new file mode 100644
index 000000000000..1f8701691d62
--- /dev/null
+++ b/include/dt-bindings/clock/exynos7885.h
@@ -0,0 +1,115 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2021 Dávid Virág
+ *
+ * Device Tree binding constants for Exynos7885 clock controller.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_EXYNOS_7885_H
+#define _DT_BINDINGS_CLOCK_EXYNOS_7885_H
+
+/* CMU_TOP */
+#define CLK_FOUT_SHARED0_PLL		1
+#define CLK_FOUT_SHARED1_PLL		2
+#define CLK_DOUT_SHARED0_DIV2		3
+#define CLK_DOUT_SHARED0_DIV3		4
+#define CLK_DOUT_SHARED0_DIV4		5
+#define CLK_DOUT_SHARED0_DIV5		6
+#define CLK_DOUT_SHARED1_DIV2		7
+#define CLK_DOUT_SHARED1_DIV3		8
+#define CLK_DOUT_SHARED1_DIV4		9
+#define CLK_MOUT_CORE_BUS		10
+#define CLK_MOUT_CORE_CCI		11
+#define CLK_MOUT_CORE_G3D		12
+#define CLK_DOUT_CORE_BUS		13
+#define CLK_DOUT_CORE_CCI		14
+#define CLK_DOUT_CORE_G3D		15
+#define CLK_GOUT_CORE_BUS		16
+#define CLK_GOUT_CORE_CCI		17
+#define CLK_GOUT_CORE_G3D		18
+#define CLK_MOUT_PERI_BUS		19
+#define CLK_MOUT_PERI_SPI0		20
+#define CLK_MOUT_PERI_SPI1		21
+#define CLK_MOUT_PERI_UART0		22
+#define CLK_MOUT_PERI_UART1		23
+#define CLK_MOUT_PERI_UART2		24
+#define CLK_MOUT_PERI_USI0		25
+#define CLK_MOUT_PERI_USI1		26
+#define CLK_MOUT_PERI_USI2		27
+#define CLK_DOUT_PERI_BUS		28
+#define CLK_DOUT_PERI_SPI0		29
+#define CLK_DOUT_PERI_SPI1		30
+#define CLK_DOUT_PERI_UART0		31
+#define CLK_DOUT_PERI_UART1		32
+#define CLK_DOUT_PERI_UART2		33
+#define CLK_DOUT_PERI_USI0		34
+#define CLK_DOUT_PERI_USI1		35
+#define CLK_DOUT_PERI_USI2		36
+#define CLK_GOUT_PERI_BUS		37
+#define CLK_GOUT_PERI_SPI0		38
+#define CLK_GOUT_PERI_SPI1		39
+#define CLK_GOUT_PERI_UART0		40
+#define CLK_GOUT_PERI_UART1		41
+#define CLK_GOUT_PERI_UART2		42
+#define CLK_GOUT_PERI_USI0		43
+#define CLK_GOUT_PERI_USI1		44
+#define CLK_GOUT_PERI_USI2		45
+#define TOP_NR_CLK			46
+
+/* CMU_CORE */
+#define CLK_MOUT_CORE_BUS_USER		1
+#define CLK_MOUT_CORE_CCI_USER		2
+#define CLK_MOUT_CORE_G3D_USER		3
+#define CLK_MOUT_CORE_GIC		4
+#define CLK_DOUT_CORE_BUSP		5
+#define CLK_GOUT_CCI_ACLK		6
+#define CLK_GOUT_GIC400_CLK		7
+#define CORE_NR_CLK			8
+
+/* CMU_PERI */
+#define CLK_MOUT_PERI_BUS_USER		1
+#define CLK_MOUT_PERI_SPI0_USER		2
+#define CLK_MOUT_PERI_SPI1_USER		3
+#define CLK_MOUT_PERI_UART0_USER	4
+#define CLK_MOUT_PERI_UART1_USER	5
+#define CLK_MOUT_PERI_UART2_USER	6
+#define CLK_MOUT_PERI_USI0_USER		7
+#define CLK_MOUT_PERI_USI1_USER		8
+#define CLK_MOUT_PERI_USI2_USER		9
+#define CLK_GOUT_GPIO_TOP_PCLK		10
+#define CLK_GOUT_HSI2C0_PCLK		11
+#define CLK_GOUT_HSI2C1_PCLK		12
+#define CLK_GOUT_HSI2C2_PCLK		13
+#define CLK_GOUT_HSI2C3_PCLK		14
+#define CLK_GOUT_I2C0_PCLK		15
+#define CLK_GOUT_I2C1_PCLK		16
+#define CLK_GOUT_I2C2_PCLK		17
+#define CLK_GOUT_I2C3_PCLK		18
+#define CLK_GOUT_I2C4_PCLK		19
+#define CLK_GOUT_I2C5_PCLK		20
+#define CLK_GOUT_I2C6_PCLK		21
+#define CLK_GOUT_I2C7_PCLK		22
+#define CLK_GOUT_PWM_MOTOR_PCLK		23
+#define CLK_GOUT_SPI0_PCLK		24
+#define CLK_GOUT_SPI0_EXT_CLK		25
+#define CLK_GOUT_SPI1_PCLK		26
+#define CLK_GOUT_SPI1_EXT_CLK		27
+#define CLK_GOUT_UART0_EXT_UCLK		28
+#define CLK_GOUT_UART0_PCLK		29
+#define CLK_GOUT_UART1_EXT_UCLK		30
+#define CLK_GOUT_UART1_PCLK		31
+#define CLK_GOUT_UART2_EXT_UCLK		32
+#define CLK_GOUT_UART2_PCLK		33
+#define CLK_GOUT_USI0_PCLK		34
+#define CLK_GOUT_USI0_SCLK		35
+#define CLK_GOUT_USI1_PCLK		36
+#define CLK_GOUT_USI1_SCLK		37
+#define CLK_GOUT_USI2_PCLK		38
+#define CLK_GOUT_USI2_SCLK		39
+#define CLK_GOUT_MCT_PCLK		40
+#define CLK_GOUT_SYSREG_PERI_PCLK	41
+#define CLK_GOUT_WDT0_PCLK		42
+#define CLK_GOUT_WDT1_PCLK		43
+#define PERI_NR_CLK			44
+
+#endif /* _DT_BINDINGS_CLOCK_EXYNOS_7885_H */
-- 
2.34.1

