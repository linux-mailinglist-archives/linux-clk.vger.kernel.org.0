Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2605C4A52
	for <lists+linux-clk@lfdr.de>; Wed,  2 Oct 2019 11:15:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbfJBJPj (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 2 Oct 2019 05:15:39 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53002 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726583AbfJBJPi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Oct 2019 05:15:38 -0400
Received: by mail-wm1-f66.google.com with SMTP id r19so6331917wmh.2
        for <linux-clk@vger.kernel.org>; Wed, 02 Oct 2019 02:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FPzLmAFxVlvoWlrn/cPfzD8ybuBQrABYqNe+NltmaKc=;
        b=TjVT0D6D0IDve5evcKRh6oxGsg70BRR503/nwR27ckewQi1eA7EoYNYe69MKOT/mrw
         IwsSwedW0AarjTBKsAb5oEBFz6Wuj7bBy4CaR+nE1y5oYJEF1aFYT3TCv3aURhSHLVev
         VbcjX+F0OBK8G78rKEhs59ebi0KtuuuszxbZcFfphI7Im+mEOzBs3nJbkzBbrlxsQLts
         fBoaZluHMUnbkFpavdfrqISEOvILhKJDwiEW8A9536Afgrhj7uQoUmOolVhaqh0yo17z
         LlXhY43TWJNBti5XJbAIX3Z0FYOWaRJh6zEPPYftj10rasuNDz7noeB1U6dzImMEq/vx
         MjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FPzLmAFxVlvoWlrn/cPfzD8ybuBQrABYqNe+NltmaKc=;
        b=Boy+PFsjiZHZAI4se3+dcU9f+T0grBY4nLAa4kJz0CHg+FBZgjAV5FFvvmS+EybJfq
         6vEVBCN0DYSiMWSKXMzLBGAGI3W0cfPvAlDECEVR4j56y0+vg/FW4Bxax+ynn5fHFLq2
         XoIcuwoLAGwO2/NGxaBTGUtPkAXdiWQJ6OMVOoYbRZAYl3C2wSR2RaZPFNZFEbPPiKx0
         vWUi6/+CgO91vaQzjG8Iukr3uDeG2RGa9/GPKHTJ0bJY7arMBpYA0JXchWBN9p+dhqtC
         s5qheOug4+dUkpz90UsrMbkJpfXd7ZoXVqrXhPHNIFsVwcOtDUDfEwVdhFcHWNpe1eBG
         Cyfg==
X-Gm-Message-State: APjAAAUcFrJUwLzJdpkIZ1cWm7CmCgcETmVoXbxOEX9Im49S3r06MAhC
        HmA8I1R+dLjeKMlPGnR/UaByYA==
X-Google-Smtp-Source: APXvYqyAeNIzYfZDnXVDS34M/KFIdc9BCM3rsZxBblu5PD/ay+OI5yEHpjToOgd8l9an0xWnyWUp6Q==
X-Received: by 2002:a7b:c92d:: with SMTP id h13mr2060315wml.169.1570007734515;
        Wed, 02 Oct 2019 02:15:34 -0700 (PDT)
Received: from starbuck.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id r13sm32913737wrn.0.2019.10.02.02.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 02:15:33 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/7] dt-bindings: clock: meson: add sm1 resets to the axg-audio controller
Date:   Wed,  2 Oct 2019 11:15:24 +0200
Message-Id: <20191002091529.17112-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191002091529.17112-1-jbrunet@baylibre.com>
References: <20191002091529.17112-1-jbrunet@baylibre.com>
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

