Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA217C337E
	for <lists+linux-clk@lfdr.de>; Tue,  1 Oct 2019 13:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387459AbfJALzg (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 1 Oct 2019 07:55:36 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35809 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732640AbfJALzU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Oct 2019 07:55:20 -0400
Received: by mail-wr1-f67.google.com with SMTP id v8so15169000wrt.2
        for <linux-clk@vger.kernel.org>; Tue, 01 Oct 2019 04:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FPzLmAFxVlvoWlrn/cPfzD8ybuBQrABYqNe+NltmaKc=;
        b=1TOMxkxerDcDdYyn/c1uIZ/uj0DzxKShl5K/0P2F20uXlMC/bcb2a9kp/Ml83JiaM/
         nStHdsK13vmQlXn9VMOR42LNGxNuIbd8C3RKY01DILSPwTnSJZGR/oJIbJif6Wsh5K5B
         azww9ja9DlPp8yQY9HjnEPBlvy4DWPiYKLg4WD4eZmfBdUH7IKfDnl9/afRBKvTL9JoS
         I0qZQcB7YwdBvXDPz9CxLqkjhUpsGmE5Dm2/jfNx7d7WqswIM7mGP7KGU7BJswOv3zbm
         mC8y5kAP2rEd71fMe+wi1MWU02bTa8H/oiQ8VPSsSJ4pQVJfnNM9KrTe0bImFosGuLx7
         vnDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FPzLmAFxVlvoWlrn/cPfzD8ybuBQrABYqNe+NltmaKc=;
        b=gS38vDkcFC9LRu6c7i0icHttLDbaBxOw4vmDrHrPEL7ePvwjeV6lfqeM9SNNBEIVwv
         0eDZk0dK1uVJAcO6Q9RjHiw9h1Ud1qzYIjh1/Lcgk/ZKfOZp4u1Xtc/Vd8N38qY3ZLFQ
         FtwnCiGJEx0g/ijIUyRP569bNFNbL/DBxJ75fucxFljZ9GMShJXwZbvhCwFXxjXrckr7
         JWcmH+3r6Ysa2k032zmzkgCw2Y99lIzxXhs+Ni+z0nnC2biw5Wnk40J3imHI4uUIaAob
         kCzwdLq3Kly2HAQyxcI2E7dLByJ0XyULMLMtYHAEbwdcDsqDEEpNLPxB/o9J/409/NOj
         0kAw==
X-Gm-Message-State: APjAAAUZG+srcsHzvNAm9z/BUEtmtVeUkgo9spsoYqeObZ1b2sIXadW9
        gOQR5j7hb2RJEL9F9rJVo4oRGA==
X-Google-Smtp-Source: APXvYqwRX3j5tvwuz4L808TXtlgd4FkFR2XCdK6+VapPQ5njw/IymdIRWI98q3TvnLuFXi6YyC6Whg==
X-Received: by 2002:adf:cd81:: with SMTP id q1mr18294507wrj.185.1569930916922;
        Tue, 01 Oct 2019 04:55:16 -0700 (PDT)
Received: from starbuck.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id p85sm4052171wme.23.2019.10.01.04.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 04:55:16 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/7] dt-bindings: clock: meson: add sm1 resets to the axg-audio controller
Date:   Tue,  1 Oct 2019 13:55:05 +0200
Message-Id: <20191001115511.17357-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191001115511.17357-1-jbrunet@baylibre.com>
References: <20191001115511.17357-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the reset id of the sm1 audio clock controller

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../reset/amlogic,meson-g12a-audio-reset.h        | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/dt-bindings/reset/amlogic,meson-g12a-audio-reset.h b/include/dt-bindings/reset/amlogic,meson-g12a-audio-reset.h
index 14b78dabed0e..f805129ca7af 100644
--- a/include/dt-bindings/reset/amlogic,meson-g12a-audio-reset.h
+++ b/include/dt-bindings/reset/amlogic,meson-g12a-audio-reset.h
@@ -35,4 +35,19 @@
 #define AUD_RESET_TOHDMITX	24
 #define AUD_RESET_CLKTREE	25
 
+/* SM1 added resets */
+#define AUD_RESET_RESAMPLE_B	26
+#define AUD_RESET_TOVAD		27
+#define AUD_RESET_LOCKER	28
+#define AUD_RESET_SPDIFIN_LB	29
+#define AUD_RESET_FRATV		30
+#define AUD_RESET_FRHDMIRX	31
+#define AUD_RESET_FRDDR_D	32
+#define AUD_RESET_TODDR_D	33
+#define AUD_RESET_LOOPBACK_B	34
+#define AUD_RESET_EARCTX	35
+#define AUD_RESET_EARCRX	36
+#define AUD_RESET_FRDDR_E	37
+#define AUD_RESET_TODDR_E	38
+
 #endif
-- 
2.21.0

