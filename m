Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F7415E3D0
	for <lists+linux-clk@lfdr.de>; Wed,  3 Jul 2019 14:26:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbfGCM00 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 3 Jul 2019 08:26:26 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39160 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726490AbfGCM0Z (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Jul 2019 08:26:25 -0400
Received: by mail-wm1-f66.google.com with SMTP id z23so2173274wma.4
        for <linux-clk@vger.kernel.org>; Wed, 03 Jul 2019 05:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=plGjGyOid1jI+Xxis9Als2EenBhEyLHhPcpZxpUYN30=;
        b=vKwjNK/hbuj6CRQyXmuujsWGLSTqcTiws2yP8LSdxlJtYieRupvb/tstkm0v5ucpoy
         DLpHwzTi00otlUo6DokRJOPR5J/p/RZI63uNqAGusirRv93U+drv1lY6fDhVtuCo/4XM
         4+fumzfXgWgThbkFfyKfdF24HsLshbXFCe5whSS88ST24f3VZJ2sZOIQjj+pt0kqX1oZ
         cvARhlbm8Q52SR73bwi4J7gDhg/3Qcwt2teLzkl94He8lRjO25Eae31tJ+uVIF93V3x0
         s9LEIT3KkZsss+DitpyzKUALqapb8sLePy/fqGvXgf9fQ8XXkJwj2URsmlbhXxU3JhTa
         ukMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=plGjGyOid1jI+Xxis9Als2EenBhEyLHhPcpZxpUYN30=;
        b=sr3qYzhdU7FpLr+yQpUS3ph8X7BdSbEaEAE06uCkxNfroih59GgnLH4kWVaD3lK8w7
         8mWFAruMteoN3TfR4OixsPh/K4QyQkGoGlGg+D+wO8Sf8sk9jS9WrMDvWaEYYTYkgKyz
         J3ia+vTPQRhwN/VvPsA7KILjSF2qjIMJpjhTKxkk1MWaZxN7FsLoS3RLiUQmrbdIvl8a
         nafNOCIBdAwaRVfpkBCTL4+iRZq9I2bH4RcHOg7fzHRtXAkZk8jWgNwPev28h9WKNxeJ
         c3TqbqUjcI6xCEYpLAWO1XeK67mvdIOR6txMMGs2yedLNnCQ1HHUGJtlwZTurQ+VhLhn
         E8Kg==
X-Gm-Message-State: APjAAAXWtht0CRDKgowPp3a1eJ/u10Z8vVeNQh/gbkVzK7jOO37Sa2/J
        zCF7y4JeufC8Jy8oKfP08AmO7g==
X-Google-Smtp-Source: APXvYqxekxAtRSw1KL+dcb0nQEkMKDJSI1lDzUIG2OBv7pXWrxalbz0a5fJ1T3HDFVQvQuZzrFX8lQ==
X-Received: by 2002:a1c:630a:: with SMTP id x10mr8506501wmb.113.1562156783223;
        Wed, 03 Jul 2019 05:26:23 -0700 (PDT)
Received: from starbuck.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id v67sm2868132wme.24.2019.07.03.05.26.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 03 Jul 2019 05:26:22 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clock: meson: add resets to the audio clock controller
Date:   Wed,  3 Jul 2019 14:26:13 +0200
Message-Id: <20190703122614.3579-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190703122614.3579-1-jbrunet@baylibre.com>
References: <20190703122614.3579-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the documentation and bindings for the resets provided by the g12a
audio clock controller

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/clock/amlogic,axg-audio-clkc.txt |  1 +
 .../reset/amlogic,meson-g12a-audio-reset.h    | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 include/dt-bindings/reset/amlogic,meson-g12a-audio-reset.h

diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
index 0f777749f4f1..b3957d10d241 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
@@ -22,6 +22,7 @@ Required Properties:
 				       components.
 - resets	: phandle of the internal reset line
 - #clock-cells	: should be 1.
+- #reset-cells  : should be 1 on the g12a (and following) soc family
 
 Each clock is assigned an identifier and client nodes can use this identifier
 to specify the clock which they consume. All available clocks are defined as
diff --git a/include/dt-bindings/reset/amlogic,meson-g12a-audio-reset.h b/include/dt-bindings/reset/amlogic,meson-g12a-audio-reset.h
new file mode 100644
index 000000000000..14b78dabed0e
--- /dev/null
+++ b/include/dt-bindings/reset/amlogic,meson-g12a-audio-reset.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019 BayLibre, SAS.
+ * Author: Jerome Brunet <jbrunet@baylibre.com>
+ *
+ */
+
+#ifndef _DT_BINDINGS_AMLOGIC_MESON_G12A_AUDIO_RESET_H
+#define _DT_BINDINGS_AMLOGIC_MESON_G12A_AUDIO_RESET_H
+
+#define AUD_RESET_PDM		0
+#define AUD_RESET_TDMIN_A	1
+#define AUD_RESET_TDMIN_B	2
+#define AUD_RESET_TDMIN_C	3
+#define AUD_RESET_TDMIN_LB	4
+#define AUD_RESET_LOOPBACK	5
+#define AUD_RESET_TODDR_A	6
+#define AUD_RESET_TODDR_B	7
+#define AUD_RESET_TODDR_C	8
+#define AUD_RESET_FRDDR_A	9
+#define AUD_RESET_FRDDR_B	10
+#define AUD_RESET_FRDDR_C	11
+#define AUD_RESET_TDMOUT_A	12
+#define AUD_RESET_TDMOUT_B	13
+#define AUD_RESET_TDMOUT_C	14
+#define AUD_RESET_SPDIFOUT	15
+#define AUD_RESET_SPDIFOUT_B	16
+#define AUD_RESET_SPDIFIN	17
+#define AUD_RESET_EQDRC		18
+#define AUD_RESET_RESAMPLE	19
+#define AUD_RESET_DDRARB	20
+#define AUD_RESET_POWDET	21
+#define AUD_RESET_TORAM		22
+#define AUD_RESET_TOACODEC	23
+#define AUD_RESET_TOHDMITX	24
+#define AUD_RESET_CLKTREE	25
+
+#endif
-- 
2.21.0

